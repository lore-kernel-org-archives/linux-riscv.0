Return-Path: <SRS0=oaCf=JC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBF72C433B4
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Apr 2021 08:58:05 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 571CB610E8
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Apr 2021 08:58:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 571CB610E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=E/pTFvj6+dtwomBW2PLG3DGky20/1QJI6E4ljnfP814=; b=Rb6KK5A/RjmBkjcIXKACvtbPN
	PFyUoE5SM9lHctPDQoeSh7c35ILBZzvXIxkUk7PG5LrbYkHX80YwNP3s+t7YZ8ZLtPMswzLskIX7/
	Uci0/7WFbE25wEi9Lp/xu70ynCQKRe138aXR5DTUS+132Ado/tb1k2ZnUcujhZSl2jIf2Q8Qp+CaA
	zfsXlFPURCfmT54rehwZ2EW7YdUWhaVcWF4cJUlKCdUqf5ngpfYn6P9e6PkfYsKDhe3PKduOWfjyz
	g8TftALoYQEknrZ+wYQp7Zv2bw71qtUvRih3ychW9+thm3KWbkEbQmInsjbwqWNNKnzmPfKBtix+x
	+SS9pYdmQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTL3V-00H0MH-Qc; Mon, 05 Apr 2021 08:57:57 +0000
Received: from mailgate.ics.forth.gr ([139.91.1.2])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTL3B-00H0ED-32
 for linux-riscv@lists.infradead.org; Mon, 05 Apr 2021 08:57:41 +0000
Received: from av3.ics.forth.gr (av3in.ics.forth.gr [139.91.1.77])
 by mailgate.ics.forth.gr (8.15.2/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 1358vWDF079890
 for <linux-riscv@lists.infradead.org>; Mon, 5 Apr 2021 11:57:32 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; d=ics.forth.gr; s=av; c=relaxed/simple;
 q=dns/txt; i=@ics.forth.gr; t=1617613047; x=1620205047;
 h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uFrF9rMPvp6J8xqp1Lm6ElMJZUeNUcnb3NBGRbnDzYQ=;
 b=fXbTH3J+e0u29CscBo16UpV9T24pIPeeCa1xS+i3uo2I58x+CZ3pgfzknk67prGd
 rpXY2jcpomLcI9r9s2jtfUS7Q8XX5k/9cj19r9lnARYwnHABgbqoT3OPoxuRor2y
 olo947DMS/LefVmW5RCXhq8Icwe9qheCV7enr+wH9WMOfKU3FoNS3gh1z2TKu/HU
 Ft5EdNXJ5ag197zkLLwQ2abkyN56VbXQbXlEjJdf54LxVrABIUU/dQ7xOSyJx6R4
 UhTraBiXekKLLvbdLlwxwMGQlQvcxUwwzL5rwXFVsxPKJCFKB5wAmRi+JzeIr0hK
 Deg8qbmHowcY2NzUNOtJgw==;
X-AuditID: 8b5b014d-a4c337000000209f-da-606ad0f79d16
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.151.35])
 by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id
 98.77.08351.7F0DA606; Mon,  5 Apr 2021 11:57:27 +0300 (EEST)
X-ICS-AUTH-INFO: Authenticated user: mick@ics.forth.gr at ics.forth.gr
From: Nick Kossifidis <mick@ics.forth.gr>
To: linux-riscv@lists.infradead.org, palmer@dabbelt.com
Cc: paul.walmsley@sifive.com, linux-kernel@vger.kernel.org,
 Nick Kossifidis <mick@ics.forth.gr>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v3 3/5] RISC-V: Improve init_resources
Date: Mon,  5 Apr 2021 11:57:10 +0300
Message-Id: <20210405085712.1953848-4-mick@ics.forth.gr>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210405085712.1953848-1-mick@ics.forth.gr>
References: <20210405085712.1953848-1-mick@ics.forth.gr>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCLMWRmVeSWpSXmKPExsXSHT1dWff7hawEgzk/tSye3drLZHF51xw2
 i22fW9gsmt+dY7d4ebmH2aJtFr8Dm8ebly9ZPB5uusTkcehwB6PH5iX1Hpear7N7fN4kF8AW
 xWWTkpqTWZZapG+XwJVxcdYW1oK9xhX3FjezNTCe0exi5OSQEDCReDijm7mLkYtDSOAoo8S7
 dY+YIRJuErfv72QFsdkENCXmXzrIAmKLCJhLNM98zQjSwCwwh1Hi9fQtYA3CAmYSL/Y+YAKx
 WQRUJSY9XgbWzCtgIfHhUhcTxFB5ifbl29lAbE4BS4lt5xeBxYWAaq4f62GEqBeUODnzCdgy
 ZqD65q2zmScw8s1CkpqFJLWAkWkVo0BimbFeZnKxXlp+UUmGXnrRJkZwQDL67mC8vfmt3iFG
 Jg7GQ4wSHMxKIrwPG7IShHhTEiurUovy44tKc1KLDzFKc7AoifPy6k2IFxJITyxJzU5NLUgt
 gskycXBKNTBJ+mR/mvb1GqfIj+tecs8f2bu/PCD6vMdzk3p5dsq/L5xu2jn+5x5Yhfe++3ON
 U+ng2qPz/YouPNoQlPJoj2DirJ+T/p/s/Ka+JGF5t967hS6nLfgO3q9asTE+OCT8ivIJ3192
 Rtu/h07f4cn77qW33qpWmX9nN1w9+fZf7KZH8aKPg5wTzslu3mc2/xnnOqnLkTf8rxcf2WDI
 ZbdObIbtKemnSY4CRd7CM26tDLd0nv93prW5lpJPNsuWF02iH2033Gcwv5p6Irf0m4K4RJlG
 pPf0d7ML05wybVeq9TzZKr98xb9NNh9l3P9qMiQn2h93abaWXjPvVJHP5zU/Z0uaz5bh9gi6
 ZTnX4chBbcs5SizFGYmGWsxFxYkAQ0bsorcCAAA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210405_095737_493625_86909B84 
X-CRM114-Status: GOOD (  21.97  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

* Kernel region is always present and we know where it is, no
need to look for it inside the loop, just ignore it like the
rest of the reserved regions within system's memory.

* Don't call memblock_free inside the loop, if called it'll split
the region of pre-allocated resources in two parts, messing things
up, just re-use the previous pre-allocated resource and free any
unused resources after both loops finish.

* memblock_alloc may add a region when called, so increase the
number of pre-allocated regions by one to be on the safe side
(reported and patched by Geert Uytterhoeven)

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Nick Kossifidis <mick@ics.forth.gr>
---
 arch/riscv/kernel/setup.c | 90 ++++++++++++++++++++-------------------
 1 file changed, 46 insertions(+), 44 deletions(-)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index e85bacff1..030554bab 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -60,6 +60,7 @@ static DEFINE_PER_CPU(struct cpu, cpu_devices);
  * also add "System RAM" regions for compatibility with other
  * archs, and the rest of the known regions for completeness.
  */
+static struct resource kimage_res = { .name = "Kernel image", };
 static struct resource code_res = { .name = "Kernel code", };
 static struct resource data_res = { .name = "Kernel data", };
 static struct resource rodata_res = { .name = "Kernel rodata", };
@@ -80,45 +81,54 @@ static int __init add_resource(struct resource *parent,
 	return 1;
 }
 
-static int __init add_kernel_resources(struct resource *res)
+static int __init add_kernel_resources(void)
 {
 	int ret = 0;
 
 	/*
 	 * The memory region of the kernel image is continuous and
-	 * was reserved on setup_bootmem, find it here and register
-	 * it as a resource, then register the various segments of
-	 * the image as child nodes
+	 * was reserved on setup_bootmem, register it here as a
+	 * resource, with the various segments of the image as
+	 * child nodes.
 	 */
-	if (!(res->start <= code_res.start && res->end >= data_res.end))
-		return 0;
 
-	res->name = "Kernel image";
-	res->flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
+	code_res.start = __pa_symbol(_text);
+	code_res.end = __pa_symbol(_etext) - 1;
+	code_res.flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
 
-	/*
-	 * We removed a part of this region on setup_bootmem so
-	 * we need to expand the resource for the bss to fit in.
-	 */
-	res->end = bss_res.end;
+	rodata_res.start = __pa_symbol(__start_rodata);
+	rodata_res.end = __pa_symbol(__end_rodata) - 1;
+	rodata_res.flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
 
-	ret = add_resource(&iomem_resource, res);
+	data_res.start = __pa_symbol(_data);
+	data_res.end = __pa_symbol(_edata) - 1;
+	data_res.flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
+
+	bss_res.start = __pa_symbol(__bss_start);
+	bss_res.end = __pa_symbol(__bss_stop) - 1;
+	bss_res.flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
+
+	kimage_res.start = code_res.start;
+	kimage_res.end = bss_res.end;
+	kimage_res.flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
+
+	ret = add_resource(&iomem_resource, &kimage_res);
 	if (ret < 0)
 		return ret;
 
-	ret = add_resource(res, &code_res);
+	ret = add_resource(&kimage_res, &code_res);
 	if (ret < 0)
 		return ret;
 
-	ret = add_resource(res, &rodata_res);
+	ret = add_resource(&kimage_res, &rodata_res);
 	if (ret < 0)
 		return ret;
 
-	ret = add_resource(res, &data_res);
+	ret = add_resource(&kimage_res, &data_res);
 	if (ret < 0)
 		return ret;
 
-	ret = add_resource(res, &bss_res);
+	ret = add_resource(&kimage_res, &bss_res);
 
 	return ret;
 }
@@ -129,53 +139,42 @@ static void __init init_resources(void)
 	struct resource *res = NULL;
 	struct resource *mem_res = NULL;
 	size_t mem_res_sz = 0;
-	int ret = 0, i = 0;
-
-	code_res.start = __pa_symbol(_text);
-	code_res.end = __pa_symbol(_etext) - 1;
-	code_res.flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
-
-	rodata_res.start = __pa_symbol(__start_rodata);
-	rodata_res.end = __pa_symbol(__end_rodata) - 1;
-	rodata_res.flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
-
-	data_res.start = __pa_symbol(_data);
-	data_res.end = __pa_symbol(_edata) - 1;
-	data_res.flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
+	int num_resources = 0, res_idx = 0;
+	int ret = 0;
 
-	bss_res.start = __pa_symbol(__bss_start);
-	bss_res.end = __pa_symbol(__bss_stop) - 1;
-	bss_res.flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
+	/* + 1 as memblock_alloc() might increase memblock.reserved.cnt */
+	num_resources = memblock.memory.cnt + memblock.reserved.cnt + 1;
+	res_idx = num_resources - 1;
 
-	mem_res_sz = (memblock.memory.cnt + memblock.reserved.cnt) * sizeof(*mem_res);
+	mem_res_sz = num_resources * sizeof(*mem_res);
 	mem_res = memblock_alloc(mem_res_sz, SMP_CACHE_BYTES);
 	if (!mem_res)
 		panic("%s: Failed to allocate %zu bytes\n", __func__, mem_res_sz);
+
 	/*
 	 * Start by adding the reserved regions, if they overlap
 	 * with /memory regions, insert_resource later on will take
 	 * care of it.
 	 */
+	ret = add_kernel_resources();
+	if (ret < 0)
+		goto error;
+
 	for_each_reserved_mem_region(region) {
-		res = &mem_res[i++];
+		res = &mem_res[res_idx--];
 
 		res->name = "Reserved";
 		res->flags = IORESOURCE_MEM | IORESOURCE_BUSY;
 		res->start = __pfn_to_phys(memblock_region_reserved_base_pfn(region));
 		res->end = __pfn_to_phys(memblock_region_reserved_end_pfn(region)) - 1;
 
-		ret = add_kernel_resources(res);
-		if (ret < 0)
-			goto error;
-		else if (ret)
-			continue;
-
 		/*
 		 * Ignore any other reserved regions within
 		 * system memory.
 		 */
 		if (memblock_is_memory(res->start)) {
-			memblock_free((phys_addr_t) res, sizeof(struct resource));
+			/* Re-use this pre-allocated resource */
+			res_idx++;
 			continue;
 		}
 
@@ -186,7 +185,7 @@ static void __init init_resources(void)
 
 	/* Add /memory regions to the resource tree */
 	for_each_mem_region(region) {
-		res = &mem_res[i++];
+		res = &mem_res[res_idx--];
 
 		if (unlikely(memblock_is_nomap(region))) {
 			res->name = "Reserved";
@@ -204,6 +203,9 @@ static void __init init_resources(void)
 			goto error;
 	}
 
+	/* Clean-up any unused pre-allocated resources */
+	mem_res_sz = (num_resources - res_idx + 1) * sizeof(*mem_res);
+	memblock_free((phys_addr_t) mem_res, mem_res_sz);
 	return;
 
  error:
-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
