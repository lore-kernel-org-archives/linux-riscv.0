Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E4EC001B0
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 15:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xqFuEmzCiLw/rvnG4hBmmo2RHYrAeFo5eUOgW4W5u2Y=; b=jGfD5rz4BP4RtK
	iMYYkewv5dVqYK9m7up5obOoFCh6I66Gw3+LTckJur/3DCxmBnVT10Ti8u64tECsETzZS4UNL9hXo
	5vHGHWUp329pc4IyxVpsl9AuSH18tmXgHG18PmHbhVr12hiofMcrzYRfMrpcmF7MtSuSH0rYDRfU+
	LkZwSrr4dis08d8MsvJ252W1EHJ7aWuwM7XnrjHbVTbjQj+Yv0vLlJ5JG0LnJkVGjckcBu7r9lkp7
	mp+oD7665GmtLg8pWLx6wNwqMRBeZ2LTuP/dSsr4xUIO4uajcwGxwPAgvZSClexcJeBHHPdySm2t4
	j0XO9a0A1en4WB12tkPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJxxJ-003gso-0w;
	Thu, 13 Jul 2023 15:10:09 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJxxG-003grF-1d
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jul 2023 15:10:07 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3141c3a7547so966094f8f.2
        for <linux-riscv@lists.infradead.org>; Thu, 13 Jul 2023 08:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689261005; x=1691853005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cxS6XaVGyfGeiOx9hXopxfMKjoMTvLr9eO536Fwx3rg=;
        b=12G3+2Y00Sqmy3C4bHK2R4sUiuSMiHP21QdzHVQmMjgUKvRryyZ8lP4R3HAMAoanJO
         md8q9aAd47Acuc0fmNXsDZzKEQAEfWUZ+5ZTvY2oiRa4EOUJUDhMHV8RxcGqwc5aoZzi
         1BJWHAtsnqguVT2wn/jpEX/M9Zz8yzQNyD6n4oU4M7/UBXDKc5IPkFgdfS/pxy6DR69o
         aiJ2wG4wTVjVDvJ3AJ/QPf4oFV9fg4zfOb+6GnaftHgah9MEmL65yonE/OU0DSLUj9nW
         n7MgYSa0mC8KWKrfozAz11cuYBW4qjohOukU8U5wIN/4Ph02tmk/xDT+hk82OSEXhwf4
         iNmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689261005; x=1691853005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cxS6XaVGyfGeiOx9hXopxfMKjoMTvLr9eO536Fwx3rg=;
        b=byMIfqHxrI2oQryew3R/6BXRzH5oPvc/2ZZj3i/CEyTnGzv+jwdA//QebxXP8QsAJA
         s0GAwODpYf0Tbm8nus7S+l96ma417XDfaN5wMGuTaXrsiT5Pn5sCMANGOkgCEH94WsEJ
         KUc1uNFm2tvlobatqGSV8Tv3TIn2S/xqTWVE40rJRTRyuJmCQ6jPNcHFbea61udLCuUe
         0NHhQ7B6HXUZnZZBgrwphVlLjeOzMNFlMibkotjsQcmALksN0R2hPho/iSqj/q8wZ9/6
         QlQDxxTUQQ0FO5FUsfYMBvgTYNa+WhJXYs58FzOTz/z9uenGtFTLz7Udaer7WRvsqxEp
         KGlQ==
X-Gm-Message-State: ABy/qLawehiSdbKqG6TvdECq18MPAaNVL80bJSIfn0Tz9McEnffKHOG7
	QCJw5ObLC+gAobihwwRRsCpNJQ==
X-Google-Smtp-Source: APBJJlEFMrP0/qw3uxLKCVQPZAJw7F36JXx2A1kJbs6oGdJIWClw3b1SF7al95mzWxvu1hXdlj929Q==
X-Received: by 2002:a05:6000:1009:b0:313:f990:c631 with SMTP id a9-20020a056000100900b00313f990c631mr1408913wrx.44.1689261004976;
        Thu, 13 Jul 2023 08:10:04 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id q14-20020adfea0e000000b003063a92bbf5sm8173091wrm.70.2023.07.13.08.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 08:10:04 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Zong Li <zong.li@sifive.com>
Subject: [PATCH RESEND v4 2/5] riscv: Dump out kernel offset information on panic
Date: Thu, 13 Jul 2023 17:07:57 +0200
Message-Id: <20230713150800.120821-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230713150800.120821-1-alexghiti@rivosinc.com>
References: <20230713150800.120821-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_081006_548940_62E0ECD3 
X-CRM114-Status: GOOD (  10.05  )
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

Dump out the KASLR virtual kernel offset when panic to help debug kernel.

Signed-off-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/kernel/setup.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 971fe776e2f8..0fb5a26ca4cc 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -21,6 +21,7 @@
 #include <linux/smp.h>
 #include <linux/efi.h>
 #include <linux/crash_dump.h>
+#include <linux/panic_notifier.h>
 
 #include <asm/acpi.h>
 #include <asm/alternative.h>
@@ -341,3 +342,27 @@ void free_initmem(void)
 
 	free_initmem_default(POISON_FREE_INITMEM);
 }
+
+static int dump_kernel_offset(struct notifier_block *self,
+			      unsigned long v, void *p)
+{
+	pr_emerg("Kernel Offset: 0x%lx from 0x%lx\n",
+		 kernel_map.virt_offset,
+		 KERNEL_LINK_ADDR);
+
+	return 0;
+}
+
+static struct notifier_block kernel_offset_notifier = {
+	.notifier_call = dump_kernel_offset
+};
+
+static int __init register_kernel_offset_dumper(void)
+{
+	if (IS_ENABLED(CONFIG_RANDOMIZE_BASE))
+		atomic_notifier_chain_register(&panic_notifier_list,
+					       &kernel_offset_notifier);
+
+	return 0;
+}
+device_initcall(register_kernel_offset_dumper);
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
