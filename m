Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC538EB64DA
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Jul 2023 12:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xqFuEmzCiLw/rvnG4hBmmo2RHYrAeFo5eUOgW4W5u2Y=; b=QWmOHwE+oHjwb9
	QfCBHfdvPthMek+dhPRC+d/4bzhrcRMId+QumnbTLhjLi2JvHmaGIqXHaCAIQmITKwzBoNg3jj4R9
	c3PyyfkiWaxNy6X1MiFAYYkwVxY0OH58NzCJv6UK/tgDGdXqfxR7qeZ0P6Oa1EKCURQvcTYqZiRxG
	Z+sKk/Kaj8YpiqHxNLc3wGKDuEPDDPkbbc597PmrqRIuKUmmJGlAaBFYcGDZhM5e3OYR8THzZ9/eW
	Hpl8CdZEcdYEyTxpPGVCcPJ1Bc+H/4heOm36hDNe1zewU64XC5jMB28OhUiN3Z3BUP6DM+Ju1g8Og
	evrSp0OnVOZJjJTqGfAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNBuy-00GhxE-1u;
	Sat, 22 Jul 2023 12:41:04 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNBuv-00Ghw8-19
	for linux-riscv@lists.infradead.org;
	Sat, 22 Jul 2023 12:41:02 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3fb4146e8deso26187745e9.0
        for <linux-riscv@lists.infradead.org>; Sat, 22 Jul 2023 05:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1690029659; x=1690634459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cxS6XaVGyfGeiOx9hXopxfMKjoMTvLr9eO536Fwx3rg=;
        b=ubHJsOakNyi6ANYSEfY1jfibGRvwTsZC06/UPIVijfttHEqAybPhZWsu6n+csh9e0l
         KaIDc/ee0jK34IeIOvDhwfUvuorT/jUT+Lc3zNxBn+AFfH+l6yOjUQS6Rd2/e9MeozK8
         jR6YwmPhQ5kiYHNZBD01SLTO+1i4GVi5HibdyOu1QDcm7enIRNuwvCmftfPhFB4ORToz
         C3U1P2sZ72Wp31FcMQjOrO914SUZBYVecMSN8Qop2CKKpKdGOgRcP2cjNUw+bUa13u7l
         pcgT1XbQw+oZgWUOaur9xb2fkMtbRtf+60eB0JYS02Rjcnqsw6yCAIkTP8eryqK7lSVB
         wLfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690029659; x=1690634459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cxS6XaVGyfGeiOx9hXopxfMKjoMTvLr9eO536Fwx3rg=;
        b=k1/ey1s+VYf37cNFyZEoBmZ5Yw6RWsF8W5h7Na/7dE+R6QEJ7frW/ddFVdw9vtHCjA
         ZQ+FV8ynIL+t6vmLf5qCNYwzomQH2lG2fSNdviEqXWDIc4w0d9XsIIrytZHs8MNcBKs5
         mvkmwQQNFbB/LLeQOVz5Tdy0ALoz9u435gbYJpuUauUvylOrxkEdUkLDhG2dgvW4Rp6h
         GyrvT4K5ijKla5xTSHv0oBUq9McFU8vqM/sb3umup9q3J9ugHEDpErgGxAfh7r70LxON
         dBHiCybbTI3U0O1vLctWUl2zgfIN7/fQhgoALEOQ0TODwFsVV3bDdJb0gnmrUkdR6VXQ
         G0zw==
X-Gm-Message-State: ABy/qLYfPoYa4IfNQnMfj0Aj2EdCvNNfI1DG+2xnHEkHTjKZUtS69Boy
	Siv2QrCQqYhfEsGOHZQxW7mVVA==
X-Google-Smtp-Source: APBJJlHszG7MkK5M/s+gCn2cPnro3+GaotN/R+BKeRaTosXlQG7ZToDZHwzuzw4UhADn6GJDjqPH2w==
X-Received: by 2002:a7b:ca52:0:b0:3f6:1474:905 with SMTP id m18-20020a7bca52000000b003f614740905mr3713142wml.29.1690029658973;
        Sat, 22 Jul 2023 05:40:58 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id p24-20020a1c7418000000b003fc07e17d4esm7988080wmc.2.2023.07.22.05.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jul 2023 05:40:58 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Ard Biesheuvel <ardb@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Zong Li <zong.li@sifive.com>
Subject: [PATCH v6 2/5] riscv: Dump out kernel offset information on panic
Date: Sat, 22 Jul 2023 14:38:47 +0200
Message-Id: <20230722123850.634544-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230722123850.634544-1-alexghiti@rivosinc.com>
References: <20230722123850.634544-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230722_054101_402245_39456CC1 
X-CRM114-Status: GOOD (  10.33  )
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
