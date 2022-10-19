Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2EEDC4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Oct 2022 12:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mJBy8ltRTTAUF7rWJXdDg0yQ1OeE385ToQCxiGUYfZ4=; b=kUrg9PsjdD2KAX
	QxNZ4W8ehGvi9c0aRz8xKW33PtnHMMukgoIPAm2V5eftCMn4a3ugR7cpKoZASff0diJD9qecX9Ksx
	uObiaCTTAavCFyguUZQbY8V5v4Olh+ODAmXQGfFrvlZifHelMsskou/jZuKp+EkumWuJ00vsQE5ES
	A5gQlJGZSMEWDPrVRhEp1ZHvkOqFUJPvUx/o7XaWnMAf8mbBGJGcIERwOGyTSMDOPoRr6fbXH4Puk
	EjDQrPayk2hv9B+QwwMwMDuwsF8NNXfvUqP4EHGvLPEVnAQsopw3DFJ0J/3s6q+2mHnEaV9CyNi1b
	2r5yGQigNyYhLafUdgQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol80J-001MEb-GA; Wed, 19 Oct 2022 12:16:59 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol80G-001MBl-Nx
	for linux-riscv@lists.infradead.org; Wed, 19 Oct 2022 12:16:58 +0000
Received: by mail-pl1-x62a.google.com with SMTP id c24so17056972pls.9
        for <linux-riscv@lists.infradead.org>; Wed, 19 Oct 2022 05:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vAvEVwdPVzOcq2kBtufcX9nitBNib2gQ4gtkOEEFeSI=;
        b=FXlNG2VASXiEp9WSI7gST2fu64ZG/1MiT8WEB7Uxmw/y0b7OjAUZGRDYvLNjDytDLY
         pvAzzPZJ+LmY7b0hcxlD//VXwXXsAzaQgD0+mgzzAA8fk5uNO0tA5N5ciZ3kyzQvH8Bp
         CGJcMh7Ckrw8tGK/ZJHfAaEs+aW//lEy1LnrRfWGZj2aWN3c6RCCzp75an3TiiUC3jOQ
         8BXMkRnHTUXGDtYgF4ZaHTmyt6Y8dgQ9LgpxaMpuGc5JoGiwt0363vHJr7OUktUvnxDn
         XDvjcV2FkSNyeXcazWx6OpYqRLPc24U+hEpQp8qZipU/ROs7HYq/VxgN63U2jrArJFoC
         0f/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vAvEVwdPVzOcq2kBtufcX9nitBNib2gQ4gtkOEEFeSI=;
        b=LSTslPpToG6CECpjh6xbuRZoHtvRtJqJlsECmEb8ygDfzPMk2B7LcPDbQyaz9ZyYVz
         SUZ2BVVNWNXz4yC+UV23Cdn33fmYKmR5lfiCghjSSns8miEB59oCd2WNZ5RCkSvefBuk
         91BUr9TNT1gMji7Goez0eF+jOtqQez43/GrH//D8B++mFCA6of6dauBeBxWmf2r+AqGU
         Y4Pwfc0q2UGbH770NKLCm70IPE+CemmdOas4IM7MnfXlKDcdqkjq+AgkEQR02dgkdygG
         BfW6hSfVURoqzt8xOFLtkdLu+rPJVXkgt4CvT7cTGexcpj2itssav5jKv0Lye89DJbat
         H+Zw==
X-Gm-Message-State: ACrzQf2DrRQRPJZ4Zv+bfdIN6yJhwnqzZxjB2DBqiSpYg+Mel79NJvBl
	QI0ZwcBRkSrDcJZXh8/8A2FD9A==
X-Google-Smtp-Source: AMsMyM4r+1sZX98RIcCz29nMUVrrLREHUkLHWWcnq3T4bJXz+0LCLIef/LZFzsKGD/QCnVFFTkgmuA==
X-Received: by 2002:a17:902:d4c5:b0:183:6e51:503 with SMTP id o5-20020a170902d4c500b001836e510503mr8105943plg.84.1666181813665;
        Wed, 19 Oct 2022 05:16:53 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([171.76.82.102])
        by smtp.gmail.com with ESMTPSA id x7-20020a170902a38700b0017e93c158d7sm10529824pla.214.2022.10.19.05.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Oct 2022 05:16:52 -0700 (PDT)
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
Subject: [PATCH v3 2/4] RISC-V: Fix ioremap_cache() and ioremap_wc() for systems with Svpbmt
Date: Wed, 19 Oct 2022 17:46:20 +0530
Message-Id: <20221019121622.179024-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221019121622.179024-1-apatel@ventanamicro.com>
References: <20221019121622.179024-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_051656_798897_F97E4F96 
X-CRM114-Status: UNSURE (   9.83  )
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
