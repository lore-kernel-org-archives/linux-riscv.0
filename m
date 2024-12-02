Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86604D78301
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Dec 2024 10:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OnRoDMxQrBtedeLJL8sw4jRRoA6ylFlroL3uC9wiWHI=; b=X+z3MLyjKLfh3w
	GlfqbSCyNIT/Sgq7rAsWzgERyNKO0DJmLt2xALJNE1hriRA6pP3acVuuT10H4EDCeEH/PA4I6B+Vp
	ejOXTsAPa/3JTVHNFx04Z1/MJemm1qW6ZtTdIP8nOxxzmOH/cyW5skEPB9zpfXzYReJl47OEOeT13
	5gMz/om/hYYTRPkzpfMriR9JdYDGSrpuruoE3xx8rreKXtVwhZIv4jnb2xc8bcsM6JT4mQa8b0f/U
	NQz6VmA1USsxev8RoDTj59+Qar+KZhoAPOf0mFxehxe7M+2jmhUuPPtgYBUd1AcAKjmSeYIV2/TS/
	IUMczHyZf11175e3ki7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI3TU-00000005hNh-1986;
	Mon, 02 Dec 2024 10:16:16 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI3TR-00000005hMF-3gXt
	for linux-riscv@lists.infradead.org;
	Mon, 02 Dec 2024 10:16:15 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-21527bb7eb0so26363725ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 02 Dec 2024 02:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1733134569; x=1733739369; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AqdyYnh7L9JzbifPNftANkk0KPlnXsX4tMHkyCxaZPo=;
        b=DJZhrXDq36GG0XpgrtfOt4NQtE6xipsN+fvWJg+fNVn2UhvaFFYp2jbvkd+mhszkkD
         IvEbT4q1Hzg0VeHWRF2p0RUK1WTlLQTXBMwRfIuU9wMjibHsDaUV/T4i54ilBULr/0cC
         ipuzQP5gTHo0XqQmxGR1Gxkc+EbA9lca1xCpjE3QaINTxRTOGtsFDfV20qNm/ksue+zj
         UeEE6669kp70Kp4ma8acipkin563T25qRIDjyxmrt+ld7IE++BMfsFnxJ6sPGz77tUr3
         GtpyiYkNByULzGDPX4DgbkauftgBQxOYsuXplvV6G4AskeomVpg4BlRagtbS1bzdMK/p
         RrUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733134570; x=1733739370;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AqdyYnh7L9JzbifPNftANkk0KPlnXsX4tMHkyCxaZPo=;
        b=sKfG6vZeJ6aY+8Rwh/q8D6tuM9izxuhOKLarRuPOroAT7Wt/Q9L0x3YnZwEz1BiCWJ
         l6SCW4bNRTvo9VhzlOxE9c6eh4WvQczRs0gvEnJaVGIJN9Jxxt/+mDsez4XiMU5/oTbA
         hm9JiBvKCRT1x+/pWHcB/NqqCH19RLq1PNW3iuxX3gOnH7/DgogUtkg0RGyAUkuVBPgG
         Xae2z057VmExcZ0SD9XvvEFoWg2G1oig8YqJ/jAToewXAdVFpIMvjOoHcaEtgc/gVYgh
         3MGVuT5NxJa8abRM/dTqCp+9QH5PGkREGR0wh9/zKq/LXfMDL5itVbzkTGXNL1mHpXJq
         MWOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVb0j+gTdU/hSrxqx2kYed0CPnj7/FfaD2ziqf+DT0fZxIZs3Jwnk9OgXw1bQTiNH//2CSEbtzVAyWUww==@lists.infradead.org
X-Gm-Message-State: AOJu0YxggceqQn16aRrsksYRrxzrFYppzco0q1kSA/JxNajJcS8KheDt
	iLwDhmhp5dvgLi9L7K2ELmgk2l4cyoPVOhkkUCFAG10cJu+MuCZbQ3y0qT8EPko=
X-Gm-Gg: ASbGncvhyhFSRzshxZbT9WzeYsc+RbbpIs1vxK19hkV220mWS5Ecs7EqlnUBnZ8Dlbt
	ilgwEZsUeen8YNS9RFlwSSK07pUyZN2f+/34JJKEYhWxlwT4U9E2sBl8Op+R8ZbgovIJQMSiPVY
	YphRiHQb21IRC6PKWf1IJWIEq1099ut+MkXNK6QiyoGJ6xLDZiahbnpCgLwSzLqcoEhMwfS7JRK
	qGrxCJ5VlcSmlxN8c/n0XyU446Eckc90YGR7BxMY29l/Ak4uUp0TNmB/WX0rJ9FNgnLM6MdPWEP
	H1O3rbjrD8phyuAtAqujtfK+PzPaDWoP
X-Google-Smtp-Source: AGHT+IH1+6Y2xOPT53z5KOINjW/eib1XXOUom5+MdqN7SgnYZHlbvRTsSjFLdTYt0jzINpPmKZcGeA==
X-Received: by 2002:a17:902:e541:b0:215:58f0:2606 with SMTP id d9443c01a7336-21558f02c9emr128817145ad.2.1733134569664;
        Mon, 02 Dec 2024 02:16:09 -0800 (PST)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21521969e59sm73097425ad.146.2024.12.02.02.16.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 02 Dec 2024 02:16:09 -0800 (PST)
From: Xu Lu <luxu.kernel@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: lihangjing@bytedance.com,
	xieyongji@bytedance.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH] riscv: mm: Fix alignment of phys_ram_base
Date: Mon,  2 Dec 2024 18:16:01 +0800
Message-Id: <20241202101601.48284-1-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_021613_921759_CF9C2487 
X-CRM114-Status: GOOD (  12.87  )
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

This commit fixes the alignment of phys_ram_base in RISC-V.

In sparse vmemmap model, the virtual address of vmemmap is calculated as:
'(struct page *)VMEMMAP_START - (phys_ram_base >> PAGE_SHIFT)'.
And the struct page's va can be calculated with an offset:
'vmemmap + (pfn)'.

However, when initializing struct pages, kernel actually starts from the
first page from the same section that phys_ram_base belongs to. If the
first page's physical address is not 'phys_ram_base >> PAGE_SHIFT', then
we get an va below VMEMMAP_START when calculating va for it's struct page.

For example, if phys_ram_base starts from 0x82000000 with pfn 0x82000, the
first page in the same section is actually pfn 0x80000. During
init_unavailage_range, we will initialize struct page for pfn 0x80000
with virtual address '(struct page *)VMEMMAP_START - 0x2000', which is
below VMEMMAP_START as well as PCI_IO_END.

This commit fixes this bug by aligning phys_ram_base with SECTION_SIZE.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/mm/init.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 0e8c20adcd98..9866de267b74 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -59,6 +59,8 @@ EXPORT_SYMBOL(pgtable_l4_enabled);
 EXPORT_SYMBOL(pgtable_l5_enabled);
 #endif
 
+#define RISCV_MEMSTART_ALIGN	(1UL << SECTION_SIZE_BITS)
+
 phys_addr_t phys_ram_base __ro_after_init;
 EXPORT_SYMBOL(phys_ram_base);
 
@@ -241,7 +243,8 @@ static void __init setup_bootmem(void)
 	 * at worst, we map the linear mapping with PMD mappings.
 	 */
 	if (!IS_ENABLED(CONFIG_XIP_KERNEL))
-		phys_ram_base = memblock_start_of_DRAM() & PMD_MASK;
+		phys_ram_base = round_down(memblock_start_of_DRAM(),
+					   RISCV_MEMSTART_ALIGN);
 
 	/*
 	 * In 64-bit, any use of __va/__pa before this point is wrong as we
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
