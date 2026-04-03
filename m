Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58CBED6AAFA
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Apr 2026 01:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Subject:Date:From:
	Cc:To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6omqAcEq5pAc3JUt5YFOpsV9CA2EC+XdwxwJZWy2SV8=; b=P1eZe8Yl6vmbTV
	SldumH/3YSfmb20+Eoxm4X2siqcHCIKJ9TMI6J3n920IRpe7/dntW6p+ff6YV4C6XKvLE/cqG9ogg
	xhXXZOVr6g9v3MRE7b5v6IRDBgEKQOzzW94xgfM6skiNrvZhL8lRpI1qEPpOlT+zQPUAqwthYwJA5
	ah90GP6cGDbMCiPc9AUuYKfGalYAazi0mD6hik07axFwQ8+idw7KOujp53RJWh1+juBeJqON3W3Zj
	UW8PpPklrvBtsED++Gak7w84sqJmjOaL61ygMqwTeeaRYt+8OQFMTotfYRcE8VWGJz+t2YaxMvZcP
	49DJz7LB5fh5GNtbh/tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8TMo-000000013KA-0lOK;
	Fri, 03 Apr 2026 01:30:34 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8TMl-000000013JN-0cik
	for linux-riscv@lists.infradead.org;
	Fri, 03 Apr 2026 01:30:32 +0000
Received: from dt-fdt-0002.eml (unknown [111.196.245.197])
	by APP-01 (Coremail) with SMTP id qwCowAA33mksGM9p7x0HDA--.1573S2;
	Fri, 03 Apr 2026 09:30:21 +0800 (CST)
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Nutty Liu <liujingqi@lanxincomputing.com>, Junhui Liu <junhui.liu@pigmoral.tech>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, pengpeng@iscas.ac.cn
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
Date: Fri, 3 Apr 2026 08:47:58 +0800
Subject: [PATCH] riscv: pi: validate early FDT string properties before string
 use
X-CM-TRANSID: qwCowAA33mksGM9p7x0HDA--.1573S2
Message-Id: <69CF182D.10A8E5.26415@cstnet.cn>
X-Coremail-Antispam: 1UD129KBjvJXoW7KF13AF4xGFW8uFy7tF43Wrg_yoW8tw4kpF
	ZxGw45AFW8Ar4rJa909r1xuw15Wrs3trW7t34vyw48Aa1DtrW5Zr43Ka4a9r1FkrW8W34Y
	kF4rX34DCFWUCFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvv14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
	1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4kE64xI4xA0e2IEY21l
	c7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjfU8g4SDUUUU
X-Originating-IP: [111.196.245.197]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_183031_578266_737A96BE 
X-CRM114-Status: UNSURE (   6.78  )
X-CRM114-Notice: Please train this message.
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The early RISC-V FDT parser reads status, riscv,isa, and mmu-type
directly from the DTB and then passes them to strcmp() or
isa_string_contains(), which in turn uses strlen() and other C string
helpers. DT string properties come from external firmware input and are
not locally proven to be NUL-terminated within the property bounds.

Use fdt_stringlist_get() before treating these properties as C strings
so malformed unterminated properties are rejected instead of being read
past their declared length.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 arch/riscv/kernel/pi/fdt_early.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/kernel/pi/fdt_early.c b/arch/riscv/kernel/pi/fdt_early.c
index a12ff8090f19..a44afd460d70 100644
--- a/arch/riscv/kernel/pi/fdt_early.c
+++ b/arch/riscv/kernel/pi/fdt_early.c
@@ -38,16 +38,13 @@ u64 get_kaslr_seed(uintptr_t dtb_pa)
 static bool fdt_device_is_available(const void *fdt, int node)
 {
 	const char *status;
-	int statlen;
 
-	status = fdt_getprop(fdt, node, "status", &statlen);
+	status = fdt_stringlist_get(fdt, node, "status", 0, NULL);
 	if (!status)
 		return true;
 
-	if (statlen > 0) {
-		if (!strcmp(status, "okay") || !strcmp(status, "ok"))
-			return true;
-	}
+	if (!strcmp(status, "okay") || !strcmp(status, "ok"))
+		return true;
 
 	return false;
 }
@@ -137,14 +134,14 @@ static bool isa_string_contains(const char *isa_str, const char *ext_name)
  */
 static bool early_cpu_isa_ext_available(const void *fdt, int node, const char *ext_name)
 {
-	const void *prop;
+	const char *prop;
 	int len;
 
 	prop = fdt_getprop(fdt, node, "riscv,isa-extensions", &len);
 	if (prop && fdt_stringlist_contains(prop, len, ext_name))
 		return true;
 
-	prop = fdt_getprop(fdt, node, "riscv,isa", &len);
+	prop = fdt_stringlist_get(fdt, node, "riscv,isa", 0, &len);
 	if (prop && isa_string_contains(prop, ext_name))
 		return true;
 
@@ -210,7 +207,7 @@ u64 set_satp_mode_from_fdt(uintptr_t dtb_pa)
 		if (!fdt_device_is_available(fdt, node))
 			continue;
 
-		mmu_type = fdt_getprop(fdt, node, "mmu-type", NULL);
+		mmu_type = fdt_stringlist_get(fdt, node, "mmu-type", 0, NULL);
 		if (!mmu_type)
 			break;
 
-- 
2.50.1 (Apple Git-155)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
