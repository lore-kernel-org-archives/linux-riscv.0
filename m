Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21617EB64DC
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 07:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xqFuEmzCiLw/rvnG4hBmmo2RHYrAeFo5eUOgW4W5u2Y=; b=AgGwznJ/eDCJF/
	qqTAACv4FVUD0lyw5OOjh3MZjtQHqNACbstFM+kO+xvqXRDQS9vGUTA7mmgbSpYeRixAgjZU3Xc1s
	w2PykvO22/oh/5PqLb277Gs4CXddkGid2JS2y2705w54xq172Wn0kfOSn9wQWh7X8Av59uOody9XF
	2rra94stsP7oAN4YDvN5Uxcqvvo5q04AHXbTwBEQ68aOJ+/Dkn1M7qNhFs9WSaUs9YlTM0CtLmP4T
	NnFAYK7CfB+ezsnsca/NHLSkxw+t+hTaGgWotS98ucPgNnoQsaUiHDfxwjWGNMRumVQ0XC7wrzAvv
	ztUiIy9lIckdUBC4f9fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMkuk-00DF7R-0C;
	Fri, 21 Jul 2023 07:51:02 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMkug-00DF4d-31
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jul 2023 07:51:00 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4fdd14c1fbfso2643549e87.1
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jul 2023 00:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689925854; x=1690530654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cxS6XaVGyfGeiOx9hXopxfMKjoMTvLr9eO536Fwx3rg=;
        b=FuIuG5F4egNRevOQo+6wwRSnOxo0KBD0oT8VOhBXLieWHdRBZnSiWdKZCNZg46D6AF
         AihIrzMNV/sZayu29ejj/Wyn25jK4ayzrGK7AYGp1sy1XimY3uCtC98lCdySX5aqmkc2
         Y0aXQUhWCPhyVVKWlr8NyrEX2KHmdnY0XKzJ52H0reHMRoro9nUb3zLP8jc0nfjHj1zt
         VVi+02n1jelhREmyEpgW3wEFbIDpVlB/bLdxJZ6tSxNUTyQsQSTQ7xBfwJtNMbAKnvLQ
         wUDg1mf5TWbek5N0zhZgNzIrsj2Qe7hyO0bSGX3PNeSMZkCuXqu4m11RZ3Xaudmy1Bwr
         WSjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689925854; x=1690530654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cxS6XaVGyfGeiOx9hXopxfMKjoMTvLr9eO536Fwx3rg=;
        b=kprRLC5WQyxf3XBAivYUKTI5/YfwQyhW4eibrMtspRx9XQ6ov911TXQxqJsF+0a7kv
         GITwlz0rvpUwxm+gIFCFNot2kG3CPE4++iagPGxYfwqqaOwOMnNQeXugaI1WaqPZfKMp
         DzccbS6jf9SW/Gu1hUQBguFmUFyGBecvPLRGZaE3Q/4qc8ynauJwFWp2EPLEogst//2m
         9O/04Mh/capKMKTp99Fk23n4HV3cQ3D/m3Ft0rd/XrPjqgCnqAiElw3fXQE99Ob3FcGI
         w0oa7+wXVK4oEFRTPkYdZqUOoVOb3ecRzMF2LUwnEdidlQPQuWtb6ICCQV2lhfS7Y2hH
         lc0w==
X-Gm-Message-State: ABy/qLYc1iaWg2wNiDkK+Gl3/IF1b3wsCuuvOemwJ1wcZ5BFLsxuLzwv
	pAUifYexdvf+hVld6vb0jy2rug==
X-Google-Smtp-Source: APBJJlGhpT0mQ/ntHDEaEovmLhAgZBu5dcNsqDym6bEEDs/WbnY/X6NAtRB9XdQ23SlM0Tkw117j+g==
X-Received: by 2002:a19:384d:0:b0:4f8:67f0:7253 with SMTP id d13-20020a19384d000000b004f867f07253mr544009lfj.49.1689925854156;
        Fri, 21 Jul 2023 00:50:54 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id a5-20020a05600c224500b003fbc9b9699dsm2861183wmm.45.2023.07.21.00.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 00:50:53 -0700 (PDT)
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
Subject: [PATCH v5 2/5] riscv: Dump out kernel offset information on panic
Date: Fri, 21 Jul 2023 09:48:47 +0200
Message-Id: <20230721074850.310644-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230721074850.310644-1-alexghiti@rivosinc.com>
References: <20230721074850.310644-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_005058_994414_02B19713 
X-CRM114-Status: GOOD (  10.61  )
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
