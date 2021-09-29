Return-Path: <SRS0=hgxb=OT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E2E5C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Sep 2021 14:59:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B423613A6
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Sep 2021 14:59:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4B423613A6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B5rEQTXMFe6pQI6Mzz4cjr6b7cQtel+LGkESV9bPX5M=; b=tvHQ/cNWKlch62
	bXk91FiRZ1vq0Wd0hIdqHdrfj9A1HrpaVbuyEfidzI9p5w9XcEvXxhKQRmYfrMqsMXEGjWDnGigxG
	tnd+qfbrmvF7tgf4RkTcCcNXjgRDVbo+aJu8pHM2B48RpaXnMNe9sSRE5xo8UlFrjpgn1dM5xZ8Xw
	GF3MN/JTVjKO2H0X++A0vaQFr3QWrzchumKuuMVgdx1++70QqASbyU7iFfrwAdmP+YJefM0dGIPYh
	sJ9BpcsM2gNj+usA0i0n0XfPvkDPQQpDmNIhf1g7OaVwdL0+f8O4/ECpBh3DdT/TYGDGr0B1Ov7hP
	ZZH++l+Vecmpf7htjyLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVb2u-00BRAe-Fq; Wed, 29 Sep 2021 14:58:56 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVb2j-00BR6r-SH
 for linux-riscv@lists.infradead.org; Wed, 29 Sep 2021 14:58:47 +0000
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 85C3140293
 for <linux-riscv@lists.infradead.org>; Wed, 29 Sep 2021 14:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632927524;
 bh=RA0oQ/GNq6rz6phpPIFpMyTQ81TXHbN7QIZjBCAB7To=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=JY12piwZ/3UKEfgZtLJVxTXeNfFgxEuADeCOFfrqNbCqQqUx2Pz5oeQmk9NvbUCCp
 TtrwnDQhPnbIs5yE3ceKWAMEBW7qmGz7E4wt0pCUFA0tqElirjTF9pcdYCc3Jy/AwK
 j/Up4GEtC2Tz5+cHJgU0OGS9NjPfL1mk5CkIbpRRair0EdGRh6UbyXJbZ/kCGHjUVE
 NHmW+RMMZjUkoP1NeHPQYQfiUBfO86aAsfg+oSv6XW7jx0XFuFdRMqFkP/odWW89qC
 eOugnU0BbzP6suD3xx4ZxJh5kByOCITC/MRxXmRa2EJbokakPHT2JpPfTljYiyVqd2
 w3kuNxTEvNgjg==
Received: by mail-wm1-f70.google.com with SMTP id
 k5-20020a7bc3050000b02901e081f69d80so1336536wmj.8
 for <linux-riscv@lists.infradead.org>; Wed, 29 Sep 2021 07:58:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RA0oQ/GNq6rz6phpPIFpMyTQ81TXHbN7QIZjBCAB7To=;
 b=agT2Hvl6E4D8oeSOQtexB6eTcMgHlgZY+XEMY5uZaa+eueeHVOFjd2lE4fWLj51CS0
 imAtx6Ro2h58uCyb3IBwb/9J0HHCwdqFx5evKBXeUUKzQj+pZyJtUzXHtXmgIl9Qmo8u
 tlf+ldVT1qixJsF02R1I7QKQcWZow1q3fp9lWZKPjz5vQD+KiawVe3uvMtYiwnAJTO14
 S+w6diT8DS0XYkIVcmOaiI9ARtaRVFr40Jfadh1/zElkrKbAeobqr6/Ma2MLje5m7ucD
 kDGP70rjQFiSVGUHpRb3geFVdPTPnavBW0MrOIAAiLWfAPOylOE5Hp7m5B4ArENHmQET
 znLg==
X-Gm-Message-State: AOAM532m5SQgUAv5C9STHJN4/R6ceN00MhNXYQVN7Ds1ySeEF4DKeE5v
 XY0ohTyApS09Vt1sxnvov7qML2PeMX447QIb5ZM/fdQirnuEZobaO/EAZyccvbzO27J6T8wapvk
 n7QOpunpHdM6wY3ZbONqev448WPL7/d2k1GU5xMNAh+TsGQ==
X-Received: by 2002:a5d:4601:: with SMTP id t1mr337448wrq.298.1632927523932;
 Wed, 29 Sep 2021 07:58:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+Xul4YkTp0i2000EdwnyM/dfQJdSoDvVKFV41EJ96ssAvHUBnlQjrNR56d8PaVsoSbDyBOQ==
X-Received: by 2002:a5d:4601:: with SMTP id t1mr337419wrq.298.1632927523734;
 Wed, 29 Sep 2021 07:58:43 -0700 (PDT)
Received: from alex.home (lfbn-lyo-1-470-249.w2-7.abo.wanadoo.fr. [2.7.60.249])
 by smtp.gmail.com with ESMTPSA id c7sm142194wmq.13.2021.09.29.07.58.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 07:58:43 -0700 (PDT)
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
To: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Zong Li <zong.li@sifive.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <Atish.Patra@wdc.com>, Christoph Hellwig <hch@lst.de>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Dmitry Vyukov <dvyukov@google.com>, Ard Biesheuvel <ardb@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>,
 Guo Ren <guoren@linux.alibaba.com>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Mayuresh Chitale <mchitale@ventanamicro.com>, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-efi@vger.kernel.org,
 linux-arch@vger.kernel.org
Cc: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Subject: [PATCH v2 07/10] riscv: Improve virtual kernel memory layout dump
Date: Wed, 29 Sep 2021 16:51:10 +0200
Message-Id: <20210929145113.1935778-8-alexandre.ghiti@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210929145113.1935778-1-alexandre.ghiti@canonical.com>
References: <20210929145113.1935778-1-alexandre.ghiti@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210929_075846_123738_4ED98D8B 
X-CRM114-Status: GOOD (  15.85  )
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

With the arrival of sv48 and its large address space, it would be
cumbersome to statically define the unit size to use to print the different
portions of the virtual memory layout: instead, determine it dynamically.

Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
---
 arch/riscv/mm/init.c  | 65 +++++++++++++++++++++++++++++++++----------
 include/linux/sizes.h |  1 +
 2 files changed, 52 insertions(+), 14 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index d7de414c6500..a304f2b3c178 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -90,34 +90,71 @@ static void __init zone_sizes_init(void)
 }
 
 #if defined(CONFIG_MMU) && defined(CONFIG_DEBUG_VM)
+
+#define LOG2_SZ_1K  ilog2(SZ_1K)
+#define LOG2_SZ_1M  ilog2(SZ_1M)
+#define LOG2_SZ_1G  ilog2(SZ_1G)
+#define LOG2_SZ_1T  ilog2(SZ_1T)
+
 static inline void print_mlk(char *name, unsigned long b, unsigned long t)
 {
 	pr_notice("%12s : 0x%08lx - 0x%08lx   (%4ld kB)\n", name, b, t,
-		  (((t) - (b)) >> 10));
+		  (((t) - (b)) >> LOG2_SZ_1K));
 }
 
 static inline void print_mlm(char *name, unsigned long b, unsigned long t)
 {
 	pr_notice("%12s : 0x%08lx - 0x%08lx   (%4ld MB)\n", name, b, t,
-		  (((t) - (b)) >> 20));
+		  (((t) - (b)) >> LOG2_SZ_1M));
+}
+
+static inline void print_mlg(char *name, unsigned long b, unsigned long t)
+{
+	pr_notice("%12s : 0x%08lx - 0x%08lx   (%4ld GB)\n", name, b, t,
+		  (((t) - (b)) >> LOG2_SZ_1G));
+}
+
+#ifdef CONFIG_64BIT
+static inline void print_mlt(char *name, unsigned long b, unsigned long t)
+{
+	pr_notice("%12s : 0x%08lx - 0x%08lx   (%4ld TB)\n", name, b, t,
+		  (((t) - (b)) >> LOG2_SZ_1T));
+}
+#endif
+
+static inline void print_ml(char *name, unsigned long b, unsigned long t)
+{
+	unsigned long diff = t - b;
+
+#ifdef CONFIG_64BIT
+	if ((diff >> LOG2_SZ_1T) >= 10)
+		print_mlt(name, b, t);
+	else
+#endif
+	if ((diff >> LOG2_SZ_1G) >= 10)
+		print_mlg(name, b, t);
+	else if ((diff >> LOG2_SZ_1M) >= 10)
+		print_mlm(name, b, t);
+	else
+		print_mlk(name, b, t);
 }
 
 static void __init print_vm_layout(void)
 {
 	pr_notice("Virtual kernel memory layout:\n");
-	print_mlk("fixmap", (unsigned long)FIXADDR_START,
-		  (unsigned long)FIXADDR_TOP);
-	print_mlm("pci io", (unsigned long)PCI_IO_START,
-		  (unsigned long)PCI_IO_END);
-	print_mlm("vmemmap", (unsigned long)VMEMMAP_START,
-		  (unsigned long)VMEMMAP_END);
-	print_mlm("vmalloc", (unsigned long)VMALLOC_START,
-		  (unsigned long)VMALLOC_END);
-	print_mlm("lowmem", (unsigned long)PAGE_OFFSET,
-		  (unsigned long)high_memory);
+	print_ml("fixmap", (unsigned long)FIXADDR_START,
+		 (unsigned long)FIXADDR_TOP);
+	print_ml("pci io", (unsigned long)PCI_IO_START,
+		 (unsigned long)PCI_IO_END);
+	print_ml("vmemmap", (unsigned long)VMEMMAP_START,
+		 (unsigned long)VMEMMAP_END);
+	print_ml("vmalloc", (unsigned long)VMALLOC_START,
+		 (unsigned long)VMALLOC_END);
+	print_ml("lowmem", (unsigned long)PAGE_OFFSET,
+		 (unsigned long)high_memory);
 #ifdef CONFIG_64BIT
-	print_mlm("kernel", (unsigned long)KERNEL_LINK_ADDR,
-		  (unsigned long)ADDRESS_SPACE_END);
+	print_ml("kernel", (unsigned long)KERNEL_LINK_ADDR,
+		 (unsigned long)ADDRESS_SPACE_END);
 #endif
 }
 #else
diff --git a/include/linux/sizes.h b/include/linux/sizes.h
index 1ac79bcee2bb..0bc6cf394b08 100644
--- a/include/linux/sizes.h
+++ b/include/linux/sizes.h
@@ -47,6 +47,7 @@
 #define SZ_8G				_AC(0x200000000, ULL)
 #define SZ_16G				_AC(0x400000000, ULL)
 #define SZ_32G				_AC(0x800000000, ULL)
+#define SZ_1T				_AC(0x10000000000, ULL)
 #define SZ_64T				_AC(0x400000000000, ULL)
 
 #endif /* __LINUX_SIZES_H__ */
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
