Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEE7CC433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Oct 2022 13:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mJBy8ltRTTAUF7rWJXdDg0yQ1OeE385ToQCxiGUYfZ4=; b=lsytr6L7gOGGWd
	W1ydXaGIHafslZAvJWww8RCVOqZUIsJZ5krtBXcY1M2yOPYet7rEh5xDiR84Lm409w6nusnRObJP5
	QQDhBc5j3MPh93bQpIMTHG0HPBdMK5EE9lGqCZWR4Ah/hdvCwJL+GW1czbrtrgYmi1fgUwTdIxNkq
	4gtVHV+ZNeg0ROsrxf0wSX26AMhpfECM6rHwSizY88nv9KH4KetTzVJxLKPp/E2OP4/PA/+C5Wn2e
	v7Xix9wKBgRRNCCmyXkRDbtwwVebetgVtGdLokDvJqzMeDtuzuiWIBDAWahzOKKVCuQDV/EtXwE7K
	Q0rafrccktddGFX9L5qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol8rZ-0023uv-OZ; Wed, 19 Oct 2022 13:12:01 +0000
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol8rX-0023rX-CS
	for linux-riscv@lists.infradead.org; Wed, 19 Oct 2022 13:12:00 +0000
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-1322fa1cf6fso20542372fac.6
        for <linux-riscv@lists.infradead.org>; Wed, 19 Oct 2022 06:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vAvEVwdPVzOcq2kBtufcX9nitBNib2gQ4gtkOEEFeSI=;
        b=lxyzgM77oVhyr2xYFxJj6wgQvry6rw4Y/+zIvaG6JfmYtSzQ+X/1aPsePwBNrnegwI
         UrY3/A1/YLrrc1SIB0jp8+zD7aA98y9QtCArUpqYXnMw5Dl6VWnG3iDZuyf1BgGGohqT
         1l9CyxXHnpqjwurbYuT9nD7l0kpliUcju0mwn+yFEAvwgXbH6lu8+EDbPW1ou1EWw4d0
         i8arRfQLRw/k0jmr0IQml/LWHNUCdyXuEptr8wqAxovxLLP0t6dVC1zBEVwFmRU6HrPR
         foFXA9X8UDYRdXrxUc+XpDAQmh4P+zLMHzd7Q4Ct6xrxImFMYovLYXg9s6KdCxtlBdrg
         3gMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vAvEVwdPVzOcq2kBtufcX9nitBNib2gQ4gtkOEEFeSI=;
        b=vfoecwq4MmItTgZrNoDgTIlHVKRijQORUkOP9gUWbxON/K3EMRzd/u8AXaNNUVBbgG
         n8eNom9mYkA+BSEt+kbsgGpGgrGTf2BAMr8ERxZlwgs8Koj+VdqWOsaeT7432WHQOvZP
         +lBKY7d6xEeB1BIZqQ0nrD0CxGxBs7ZCzaTCUztI3/29VTWPlHfTk+fUGJDR/d5wsfXQ
         Ad5TG6NeWAKLnc7xyIxJg0JPsB3qWUvwyMGi3LBRYFaLPuq8vGq18+d/IFI+HXszP5p/
         VkwkHKczvHK7wCW5E+gc14T+ATbEO7/PZqqkHHOS4yt9uOY+rH8Jan/mxKozbToa9FK2
         5JjQ==
X-Gm-Message-State: ACrzQf1/eVcV841AjUQYZNz8Ym+yB2KMtBxTBocqm5cYOEBoVE0hWLnQ
	uykZTNaVq2gV1Lq5MHhQh0TSfa7ZKxMQCg==
X-Google-Smtp-Source: AMsMyM6ea6y78yP7zvn7fmEDAEjq1F7za/6iBEos6YJxPN0ITU1VfQyHOKcpYsTQpoGZjSvFb+JmVQ==
X-Received: by 2002:a17:90b:4c52:b0:20d:7917:4cb3 with SMTP id np18-20020a17090b4c5200b0020d79174cb3mr45614039pjb.6.1666185105397;
        Wed, 19 Oct 2022 06:11:45 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([171.76.82.102])
        by smtp.gmail.com with ESMTPSA id n12-20020a170902d2cc00b00172897952a0sm10934478plc.283.2022.10.19.06.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Oct 2022 06:11:44 -0700 (PDT)
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
Subject: [PATCH v4 2/4] RISC-V: Fix ioremap_cache() and ioremap_wc() for systems with Svpbmt
Date: Wed, 19 Oct 2022 18:41:26 +0530
Message-Id: <20221019131128.237026-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221019131128.237026-1-apatel@ventanamicro.com>
References: <20221019131128.237026-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_061159_431700_F3C65AE1 
X-CRM114-Status: UNSURE (   9.72  )
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
index 92080a227937..92a31e543388 100644
--- a/arch/riscv/include/asm/io.h
+++ b/arch/riscv/include/asm/io.h
@@ -133,6 +133,16 @@ __io_writes_outs(outs, u64, q, __io_pbr(), __io_paw())
 #define outsq(addr, buffer, count) __outsq(PCI_IOBASE + (addr), buffer, count)
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
