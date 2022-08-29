Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE48ECAAD2
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Aug 2022 12:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2ofsOdG+dgEVPBtWS/+buTUKOPlndD72aQXnOUrgNDM=; b=XVbVzZEd8Bp1io
	HuZZBKGDhNan7RXMcM6nMXdi6kUXaMLsb929Eh3aZaYbg9thsfe4nqJle/7edgc5EoBqWK1u8q1+M
	J11xi2JKwcnNJpcHX4upc9B0zruIl7BQ2IM6xF4U62TCcj//gRJyJZkMH1lYJd3466Mjz/gyKXUvX
	ke3OxQfFvD1navpHvLiuZpni3mWUgkq74XnEZhgDH/wdV52ONBexIMUQLXg/stFJXphvGTlFUlZLn
	5sH31AuyZ/3xQVHkdpaeStPldu4mqdBv4v5qKOIMcvYSBwEY2bgzr+UGe9MD33vzXFzdcs1BOAHNA
	6CmZpWtJgiKx7iny84/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSeGB-009x4D-Bn; Mon, 29 Aug 2022 12:52:59 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSeG7-009wy9-K1
	for linux-riscv@lists.infradead.org; Mon, 29 Aug 2022 12:52:57 +0000
Received: by mail-pj1-x1032.google.com with SMTP id h13-20020a17090a648d00b001fdb9003787so3120246pjj.4
        for <linux-riscv@lists.infradead.org>; Mon, 29 Aug 2022 05:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=DF3EHZACZLIxZm103wJfkyVVUnHhmNz4e84k34pg8iM=;
        b=VwwMibK4e1SGhbD7sfBq/VulE9XYXIwXhHxCTuKnLGjjKcyYtOU26SdNAy0JJLC328
         OGsC0x7AUiU+rPHANfFbPQKXIrm9BPUlPQ+KLS2hnv/uHnFjNLNVCsIub5rusNcz8PaS
         9ITaJBrp3LWW015hTkbf7G50YoCWhaNeKGQBGEcfbfe2SFMHn7uBZldruUZyDK2yoP1S
         nc0+t/oV2jnDFCK1IxcUqlHXx/zeLtYruOq/1VDzU7WDFU8YGTmelwo+1naw5PvIe6rl
         FQVuklwhjiugna99cpvtoiVQ3B1TnpSKwhBq/moEV0G4cBA2/9uvoYyZtF0EdJ0uXt08
         jqqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=DF3EHZACZLIxZm103wJfkyVVUnHhmNz4e84k34pg8iM=;
        b=Ger1qQrKxGAUtGMwaF/UMnNMvFU88hJERO7jCIJZhr5yFWHO1rqgRZlHPJUYu6rupO
         0FJZZ2jLpxK9YjBMzcLFUganBptowY/FvaxATtZgR4mOP/3caqYHLiXZ+1RjMVIfWQdC
         iSxXzC+DusXmwI+tBml95ZL/zt62AjYp+nkCG9IxAIcksBeXEs8iws+ydlnWn9JDTPaS
         1Kxf9uQD44SOp9otbf2pN4oLQ+a0smY2svYz/p9LZ0FcZ4rf3FHFX/opTxYlGW7fqLIe
         p+8TzgEotvxS3DN4OtkIiM4xunGQ0YYB9v7ZNnhfKTHgase8U69akAxdppM7j/qZS/H5
         syag==
X-Gm-Message-State: ACgBeo1XSkiyTqDrkzX6dUuweYFBj88iFC1jVC/Zc9bYBSFXjWGPH+WR
	CHx5Oq+lZFXaqyskVbXipoL5Xg==
X-Google-Smtp-Source: AA6agR5aA3lQRu1vS8qwSp/nS3Li+E+T9vQqImCN0tFjn0Mho9TQuefM6AnU7y3mkyQDlJtkWx7W4g==
X-Received: by 2002:a17:903:2310:b0:173:10e1:3a76 with SMTP id d16-20020a170903231000b0017310e13a76mr16520555plh.160.1661777574577;
        Mon, 29 Aug 2022 05:52:54 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([171.76.81.110])
        by smtp.gmail.com with ESMTPSA id a6-20020a170902ecc600b0016ed5266a5csm7517607plh.170.2022.08.29.05.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 05:52:54 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Cc: Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>
Subject: [PATCH 1/4] RISC-V: Fix ioremap_cache() and ioremap_wc() for systems with Svpbmt
Date: Mon, 29 Aug 2022 18:22:23 +0530
Message-Id: <20220829125226.511564-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220829125226.511564-1-apatel@ventanamicro.com>
References: <20220829125226.511564-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_055256_446716_A75D1124 
X-CRM114-Status: UNSURE (   9.41  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Currently, all flavors of ioremap_xyz() function maps to the generic
ioremap() which means any ioremap_xyz() call will always map the
target memory as IO using _PAGE_IOREMAP page attributes. This breaks
ioremap_cache() and ioremap_wc() on systems with Svpbmt because memory
remapped using ioremap_cache() and ioremap_wc() will use _PAGE_IOREMAP
page attributes.

To address above (just like other architectures), we implement RISC-V
specific ioremap_cache() and ioremap_wc() which maps memory using page
attributes as defined by the Svpbmt specification.

Fixes: ff689fd21cb1 ("riscv: add RISC-V Svpbmt extension support")
Co-developed-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/io.h      | 10 ++++++++++
 arch/riscv/include/asm/pgtable.h |  2 ++
 2 files changed, 12 insertions(+)

diff --git a/arch/riscv/include/asm/io.h b/arch/riscv/include/asm/io.h
index 69605a474270..07ac63999575 100644
--- a/arch/riscv/include/asm/io.h
+++ b/arch/riscv/include/asm/io.h
@@ -133,6 +133,16 @@ __io_writes_outs(outs, u64, q, __io_pbr(), __io_paw())
 #define outsq(addr, buffer, count) __outsq((void __iomem *)addr, buffer, count)
 #endif
 
+#ifdef CONFIG_MMU
+#define ioremap_wc(addr, size)		\
+	ioremap_prot((addr), (size), _PAGE_IOREMAP_WC)
+#endif
+
 #include <asm-generic/io.h>
 
+#ifdef CONFIG_MMU
+#define ioremap_cache(addr, size)	\
+	ioremap_prot((addr), (size), _PAGE_KERNEL)
+#endif
+
 #endif /* _ASM_RISCV_IO_H */
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 7ec936910a96..346b7c1a3eeb 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -182,6 +182,8 @@ extern struct pt_alloc_ops pt_ops __initdata;
 #define PAGE_TABLE		__pgprot(_PAGE_TABLE)
 
 #define _PAGE_IOREMAP	((_PAGE_KERNEL & ~_PAGE_MTMASK) | _PAGE_IO)
+#define _PAGE_IOREMAP_WC	((_PAGE_KERNEL & ~_PAGE_MTMASK) | \
+				 _PAGE_NOCACHE)
 #define PAGE_KERNEL_IO		__pgprot(_PAGE_IOREMAP)
 
 extern pgd_t swapper_pg_dir[];
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
