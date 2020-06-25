Return-Path: <SRS0=bAcz=AH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 464C8C433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2020 09:50:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10C4C20836
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2020 09:50:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o2h8qkHM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="GLm930Ii"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10C4C20836
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ijcEaKum8QWSScWucOnkc3EOVhyAG6GTBgw6FLdFFDs=; b=o2h8qkHMLj9FpNP+RLfEdTjpC
	YjdBMllvpzbnJfxRsa0HL/PUUoDBUHtPocECoYdG4yN+7x4PPv5Fg4J9joD/RtJy3pFVdm0dQIYKi
	jJqqsCr2GIWXyXvwHT0hft47c03zxYg3vPk+as5hwtPr1EXZjk1i3ismK/AH4OHQAJAwncaJXl/fS
	WDeVFYpTRui/DuLMsmpPsB0/bpYlZrhGRL1EbtERrl+PzcKImNpKyg7EL7qoMhPRXynbaGBSiepjQ
	/9uZN2Nd/6/VkNnsu9c4wn1q+VUobsDdDT5ooVDgfqdJ5AGlDk/ty1BGyog9c3jGICxUeqvXXVEwY
	BQN4dPJ3g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jol0E-0002k8-NJ; Fri, 26 Jun 2020 09:50:34 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jojmo-0002Se-DN; Fri, 26 Jun 2020 08:33:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1593160359; x=1624696359;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YBy5J4GUHkZ0slWQ+5rpmDzLOi4g2OFkey3S0ni3vEo=;
 b=GLm930IispZf8DTddvvOK0t8b5Rzu/B1JSH83PAFRDZK5krfwyTwA5ca
 ZKzsqzZdqHG0oZeNrBv8SFsP1zLjjew8y1eVLTN4nGYZn5mal9EdgXbOq
 ODb4tXrreDdRwsNVMkkv6UrIjyINqbmUMAu84dttYMULoygwqQ5eCGlo6
 ODFlg3delzY9Fjv0xcq7fXHRckzSF+uCSoeXmhaVkl4z0WKC2RBcYJ9ck
 Jh3iUfPUDFkRBQRXJHHFhugxAsjj7KIyb6c6Bt51UdNjIVnOZncpDZ2TH
 In07MhHu3mN+96kZL1U0laM7FlRMToZqHg2C7nPZJo1stacjs/JVspY5+ A==;
IronPort-SDR: LYfo/DshYhqLiVQGwRYSFcpo1g9GGPbuQ9e18TDiqGC0zb0pewNXQ2eLYr+Mw51wK3LRhc49Tc
 0tjkry9IFnuoG067LLBNkVi3q8UXqtMTEpBLFO7p/jfVpbOvN89Fjah6X4T2rC/BchcwvmmQDZ
 8csYy9ptI5web3BwsGPmv+jjbOHNWdSodS7CREtnAU8w0rukEKhHtA2LEwLucEjAxJkwjgSUgm
 mdaYZy0itgoXZgLdPCB2h1Ce81T6LzVfNUKGxbj3Emp2MUbj3RIuakgGsLRQXr5UZxHWQZCCP2
 Kro=
X-IronPort-AV: E=Sophos;i="5.75,280,1589212800"; d="scan'208";a="243966119"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 26 Jun 2020 07:45:58 +0800
IronPort-SDR: FtRgoU1Ru7pv0RDCl3f6N1yhy2kUdDASxkpo7Q2mD3uUZfkIQFdzRg5k/qW7alTHx9aWSMw9in
 x/JYqDVcdBb88bLIM+J/HUAzBUuIvWWoU=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2020 16:34:26 -0700
IronPort-SDR: omPnXbB+TYLoTkN1Npd9t1nvmQHGX5tG5Znu8goYNz213K5CBAQXt/9Te3XTTQppRyp0s8My2s
 L3qp9Y90whDQ==
WDCIronportException: Internal
Received: from 2349pbt5e4f.ad.shared (HELO jedi-01.hgst.com) ([10.86.58.78])
 by uls-op-cesaip01.wdc.com with ESMTP; 25 Jun 2020 16:45:26 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [RFC PATCH 06/11] riscv: Parse all memory blocks to remove unusable
 memory
Date: Thu, 25 Jun 2020 16:45:11 -0700
Message-Id: <20200625234516.31406-7-atish.patra@wdc.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200625234516.31406-1-atish.patra@wdc.com>
References: <20200625234516.31406-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-efi@vger.kernel.org, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Masahiro Yamada <masahiroy@kernel.org>, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Currently, maximum physical memory allowed is equal to -PAGE_OFFSET.
That's why we remove any memory blocks spanning beyond that size. However,
it is done only for memblock containing linux kernel which will not work
if there are multiple memblocks.

Process all memory blocks to figure out how much memory needs to be removed
and remove at the end instead of updating the memblock list in place.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/mm/init.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 4021706aef81..c5268fe6e6de 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -123,26 +123,29 @@ void __init setup_bootmem(void)
 {
 	struct memblock_region *reg;
 	phys_addr_t mem_size = 0;
+	phys_addr_t total_mem = 0;
+	phys_addr_t mem_start, end = 0;
 	phys_addr_t vmlinux_end = __pa_symbol(&_end);
 	phys_addr_t vmlinux_start = __pa_symbol(&_start);
 
 	/* Find the memory region containing the kernel */
 	for_each_memblock(memory, reg) {
-		phys_addr_t end = reg->base + reg->size;
-
-		if (reg->base <= vmlinux_start && vmlinux_end <= end) {
-			mem_size = min(reg->size, (phys_addr_t)-PAGE_OFFSET);
-
-			/*
-			 * Remove memblock from the end of usable area to the
-			 * end of region
-			 */
-			if (reg->base + mem_size < end)
-				memblock_remove(reg->base + mem_size,
-						end - reg->base - mem_size);
-		}
+		end = reg->base + reg->size;
+		if (!total_mem)
+			mem_start = reg->base;
+		if (reg->base <= vmlinux_start && vmlinux_end <= end)
+			BUG_ON(reg->size == 0);
+		total_mem = total_mem + reg->size;
 	}
-	BUG_ON(mem_size == 0);
+
+	/*
+	 * Remove memblock from the end of usable area to the
+	 * end of region
+	 */
+	mem_size = min(total_mem, (phys_addr_t)-PAGE_OFFSET);
+	if (mem_start + mem_size < end)
+		memblock_remove(mem_start + mem_size,
+				end - mem_start - mem_size);
 
 	/* Reserve from the start of the kernel to the end of the kernel */
 	memblock_reserve(vmlinux_start, vmlinux_end - vmlinux_start);
-- 
2.24.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
