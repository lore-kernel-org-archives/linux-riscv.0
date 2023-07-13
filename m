Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 615E0EB64DD
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 13:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xqFuEmzCiLw/rvnG4hBmmo2RHYrAeFo5eUOgW4W5u2Y=; b=XRQJdO+N5fgT2+
	SriJKDC/LrRqYT1ia77Zrb6nFPQhVyJqMBajnThXRdYDlwYI9NUTA8uRYVqyhtLlCjHgSI6fSYcKt
	dbC0Ma56xQ8RMq9LwwRnmCEa2IM+70jyL9cHz4XfPvFpwc1PXAD477cFVO6duDtW8IcO7mcsbYTmI
	ttfAWYM3wSJQoB1+JTC0sTQ72kRKcNIDNLALlBDRzryzmVc+JaK9rv2OApEDgVXt9XQaaOd0dXlfz
	7UZLUfgyhy6akzih7XDisGCH22w8Z4Wu/it9KBBvIdFNKtnKtEmfbJkLLNTatOOZ4ycO53rxoV+p5
	l9mvkHp4Kwx3/EUZKIMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJwUP-003R5v-2U;
	Thu, 13 Jul 2023 13:36:13 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJwUM-003R4g-1p
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jul 2023 13:36:11 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4fa16c6a85cso1288187e87.3
        for <linux-riscv@lists.infradead.org>; Thu, 13 Jul 2023 06:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689255369; x=1691847369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cxS6XaVGyfGeiOx9hXopxfMKjoMTvLr9eO536Fwx3rg=;
        b=jwVx+V0ogGkW0aEN54ZQobLLRXwn8vCBHhmodz8Ha6uj/mSvL4pdLZ9N1UPlCkvwOS
         Gkir7LIbHfOeM6TAflctVq6Gi6B3Wxg1aboYtqRpcgw1ptOVT6hNxltcITDGeaRUzjuT
         VLRMTq7sJEwGjsKRXJlRZ25bTpMJ6hQPaG5XffpYIHJfzBKFJfcdAJqftlC9m9ul0ZNx
         V4/XGUzfKtKj3IFt4E2jP2BZ3keJnlnq8oIl8cP/kt9tr8MYHxLUzW8Y+FoQOcmOHXRO
         DqXNEn78J1C9zM6dVo58oJaM25bS+5C9izq/lgjX8i0FTWeIt7e6s++yNtwzg51x0LG5
         0sYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689255369; x=1691847369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cxS6XaVGyfGeiOx9hXopxfMKjoMTvLr9eO536Fwx3rg=;
        b=Uym8Ai+V+lN5FCQxC5Xy7KXLFLDczMyV0HYh8iTUJApFLhIFOsaKnvbBASdl63x1gx
         BD+FRbTYyHwZJL2US3obY39YCIp7noa7bG3KfyybhUm8DQTSofONZ4h6Hwm5ldji96Gq
         6POujL9IZlSiudooeCvBwrL65zwT6MyUly5kQloxnnYnqJ35rkAt5tGn0FaVgFbW9CMt
         0aE0gTc07UhKh50sOQm4MdhIEUbVePsseYtm6liQQF9R7V+FoaavNvuiAHjT5dQJrZ9y
         dve6Tjq8Q+5hbPJEkCq1AK7WzX99PMqyk0rVhz7vawEeV//G4DWQ5WXd0XQA4tDobh1O
         4jcA==
X-Gm-Message-State: ABy/qLaAjUY6IU+ctAl6tdLlWI9QPf908pHF0ghha/rgSvQ0zvmSoiC7
	Ic4/u/UbrWkP1aL9VY3mvQbi5Q==
X-Google-Smtp-Source: APBJJlGe1A2FQhbLQQs/bw67Zg5g5fp+vzL9/ZQNrKrsgHf72aeA8Jk91OXhzlgJpOQt412vheDiVg==
X-Received: by 2002:ac2:4546:0:b0:4fa:d522:a38e with SMTP id j6-20020ac24546000000b004fad522a38emr1204828lfm.35.1689255368674;
        Thu, 13 Jul 2023 06:36:08 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com ([93.23.19.53])
        by smtp.gmail.com with ESMTPSA id bf19-20020a0564021a5300b0051873c201a0sm4279132edb.26.2023.07.13.06.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 06:36:08 -0700 (PDT)
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
Subject: [PATCH v4 2/5] riscv: Dump out kernel offset information on panic
Date: Thu, 13 Jul 2023 15:33:58 +0200
Message-Id: <20230713133401.116506-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230713133401.116506-1-alexghiti@rivosinc.com>
References: <20230713133401.116506-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_063610_602762_150975CE 
X-CRM114-Status: GOOD (  10.11  )
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
