Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17C7DC77B61
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Mar 2023 05:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9sWnavvdaJyKv+UavZC83iPmrdtWVQvQlMmZm5uKtkw=; b=x29irGni6qEMMK
	69tufW8B25kSmSbSsIHwYE24IEGuyXyS9DdhV+Z5ZUZ11ZCjJHsGQ/+sA+SizfKb2wCqLI9OQ+dbR
	SV6icE+KmwfVdOFazhFYoF1B5Qtgk+25bdwKfE8EAq+4xmEGtFFbDEQlXojwNM2zKrG95LIjIu31N
	JWadds9bYL1pB+ahrAx71SFl9ppj1+E5NzvL2dhAfk8CvjahKteHm3DHDkC6p22V464dXCeHy7o5a
	fKenbooMQjfZYKnbFdJ6Jf/TcuskWmjbkpXOrJaMhavbX+WwLvm/KQDIFRCXqWjk5DCVac3c6mito
	ENhNWK8FMf4dJVMoyiGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phOPJ-00GgL3-0u;
	Wed, 29 Mar 2023 05:31:37 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phOPH-00GgJh-1x
	for linux-riscv@lists.infradead.org;
	Wed, 29 Mar 2023 05:31:36 +0000
Received: by mail-wr1-x42a.google.com with SMTP id l27so14390417wrb.2
        for <linux-riscv@lists.infradead.org>; Tue, 28 Mar 2023 22:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1680067893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=znueE8Pjz+VVSGWqY7Odv2deVORd+PQf1G9dvU2f580=;
        b=RcfUdvTQifKB0+AVdk8JrXzwaJMK7YuAUA/YSj1CZ942v2C8skCQf7YhZm05RsyrBB
         B4HSFLSRrBz63LT+rYM4DoyzUKm2uGte1JmKH8/renUTipLEaoHQUHVAmwyN3w8/qk5j
         H00QzeWAI11ziHELL2oHdjOYApjcBfP2BTFqRF5oXalAE3WxwDc+4kCfca+NKq6ZF4Tw
         O5q9PHLvTF0t34WBg7Zr1zC7RybtgVm1Nooi4PcYYqQUJYU4h/zDifnGN22opyBF7GTi
         8WsqMiVm1PoYyXx1GQ4NDpmyH10auRIjgiRlN8E50jY8S1cm/pjpS0uWWIPa63rLLXJZ
         g//w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680067893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=znueE8Pjz+VVSGWqY7Odv2deVORd+PQf1G9dvU2f580=;
        b=66tot+saTM1cujq4S0P1gm9cX+Ez9p9l3cTb/M3/k4nLZSvDBOWeWJLP0xOzHdmF+z
         bMXRvtl06SDaXAydhYtg7WTqiHfH2hcrphOp491l6Q0lonNqz14NUNV59G+Oiy7wsFy/
         GtmT3ulW5yGsUt5bTo9kgGT9d0akp0oCkLT5d/bHmEng1oIcaftvinatZRsYhkka7b8c
         YytKKcDidB5TinPT3XeLc1iBguSstlEPm0TK0L/ZgmSBTEefv8vstnHbDGbwpTLObIky
         dQHC44ky5KRGBCvgQ7atPIm+v3b3IlDZxCPnzsYJNjUPG/8mpBOuqe/o1BArMqe6knZr
         KKww==
X-Gm-Message-State: AAQBX9c9CLUNPlUynDdCXnXbR5jUTO3Dd/mNV+63rUTmcEM7oJnWn15o
	t9+y+VBA142iEXcB3VF1WR1Q/w==
X-Google-Smtp-Source: AKy350ZQA2X3X6P/fk/NYMnW9OxEeG65DsaOPoXSAsl+epZ0EvGOmNiFwst6GIavVoNURPbPTM+gLw==
X-Received: by 2002:a5d:4041:0:b0:2d7:a1e2:f5 with SMTP id w1-20020a5d4041000000b002d7a1e200f5mr12656353wrp.55.1680067893656;
        Tue, 28 Mar 2023 22:31:33 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id e11-20020a5d65cb000000b002c55de1c72bsm29119956wrw.62.2023.03.28.22.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 22:31:33 -0700 (PDT)
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
Subject: [PATCH v2 2/4] riscv: Dump out kernel offset information on panic
Date: Wed, 29 Mar 2023 07:29:24 +0200
Message-Id: <20230329052926.69632-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230329052926.69632-1-alexghiti@rivosinc.com>
References: <20230329052926.69632-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_223135_643942_07BC3ED6 
X-CRM114-Status: GOOD (  10.93  )
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
index 376d2827e736..c6937839bbd8 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -20,6 +20,7 @@
 #include <linux/smp.h>
 #include <linux/efi.h>
 #include <linux/crash_dump.h>
+#include <linux/panic_notifier.h>
 
 #include <asm/alternative.h>
 #include <asm/cacheflush.h>
@@ -333,3 +334,27 @@ void free_initmem(void)
 
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
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
