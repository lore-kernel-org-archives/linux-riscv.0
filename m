Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2738C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Dec 2022 14:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dxxx1HVVIPtAXmstmqVvPT9Y9axmqwgm3uJl8W3ETmY=; b=wevr1w3/4qg023
	AHTqIFRGB70Nt2ysODZOHx5Lo5evKaYMQol81BqkuG+fMh6EzmBGNeOcLrfDKHDyzij5mbrm3wmk/
	BB7xlHWegJSbFOnZtm/UIjgQ2CBTYZwL93AaajsmIDAHl2NSJRnU0+9DQaoIQcj9g0Of+SuEnye3G
	P0edvvL0STbwlD/SO5XONeObeJvPYQQs/qsnXJR8xm5JnQlm/LLg0BGMml2mDB4A3v2uBwzR1Qh+L
	nVzzbg71W+R+IR0uErgzmBm57jOBpw5/9ElH5xO8No8t7q7VltzFwbNvZrjze1hlmha5K4F20IaQ4
	LwPEFQm3uhULN5KtKVrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5Sp9-00HJEg-6O; Wed, 14 Dec 2022 14:33:31 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5Sp5-00HJ6T-IR
	for linux-riscv@lists.infradead.org; Wed, 14 Dec 2022 14:33:29 +0000
Received: by mail-wr1-x430.google.com with SMTP id h7so19504720wrs.6
        for <linux-riscv@lists.infradead.org>; Wed, 14 Dec 2022 06:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OuqN6i3xDgWDQgdyvZ62ncqNwC02Nmosxvyp2oT1Vek=;
        b=kA8djj3SxcJzPd/tkyA19nr3VqDPI2W2mU4PabaNpfy0KhdGPok5EOhpPqRRkgHEp7
         UsKlkYzkhjJsubXy7jcirzMdIKXYiXOt1FzNgYnyMhZf2WV901v4IKLYc71zKUWapzXU
         BoJpjUXMGDRMpk2qasc76sLgOIB1gJdRcXp9M+rr+1R43dtYejor15lFhGeG+yivQk1/
         GWsl63/+gB8hodUg9lU56b1NKlQlXMe4xosZ2yPrQCM3Gk4nq2BXfWVb92TW2T0UR1Yy
         CQQRcoIm4tebkW+I57ebyGM7YG72xZ9njf/560IBLB3nCsNqh9b1JfwCSPBLyo5OU0Df
         5y5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OuqN6i3xDgWDQgdyvZ62ncqNwC02Nmosxvyp2oT1Vek=;
        b=ClJ5st4x3I+cWhifKKWLPaUYr6oHU+RSrBGFDC4kbzHhkrWzkxkNguXRVwBxrh6SIq
         8Cq5YDRW0BOCHjqXVg1SUM8dSFYV0qZPxamA9RzqpnHwR1kDgxURKyBuCQSOFNx7nG4X
         7l1rtDpaxmAS3sZ1NdhoxOBuRxINIGphipiU7koHx/r99v7Db2PDfd8p7/DKGbnet1xN
         W6fJt8qnyjEp4Ncay68GKvlx76Zl7Kj4FqHo1Z4iUJq+S0Ig2pnk6BX49pvLxhBnXDMQ
         M/uNq9FS2AR3ErGcSEOmdxxJ110soXTDtEHlton+Kz/U07l2TVL24JntMf9V2YsyuP/2
         wXfQ==
X-Gm-Message-State: ANoB5pk8mU9rOR5xqueOGcLLth9rC8Okbn5TPR/XfQgIP/9GqigAO/r2
	YkQVRwS2Ttd21ZlUcA8RPDm1IQ==
X-Google-Smtp-Source: AA0mqf7xIJIgXYZsxK2tSCzIVle8ET5dDH8ooORx5cJ2R6fVlqM69PBiGsZ4kH0G3Q+gQWAxnTgswA==
X-Received: by 2002:adf:f206:0:b0:242:4b69:883 with SMTP id p6-20020adff206000000b002424b690883mr16140492wro.10.1671028403021;
        Wed, 14 Dec 2022 06:33:23 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
        by smtp.gmail.com with ESMTPSA id d22-20020a05600c34d600b003cfa80443a0sm2741896wmq.35.2022.12.14.06.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Dec 2022 06:33:22 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH] riscv: Allow to downgrade paging mode from the command line
Date: Wed, 14 Dec 2022 15:33:11 +0100
Message-Id: <20221214143311.960266-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221214_063327_877154_C846C3F0 
X-CRM114-Status: GOOD (  17.93  )
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

Add 2 early command line parameters called "no5lvl" and "no4lvl" (using
the same naming as x86) to allow a user to downgrade from sv57 (the
default mode if the hardware supports it) to sv48 or sv39.

Note that going through the device tree to get the kernel command line
works with ACPI too since the efi stub creates a device tree anyway with
the command line.

Also, as those params are treated very early in the boot process and we
use standard device tree functions that may be kasan instrumented, we
only enable them for !KASAN configurations.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---

Tested on both DT/ACPI kernel successfully

 .../admin-guide/kernel-parameters.txt         |  5 ++-
 arch/riscv/mm/init.c                          | 43 ++++++++++++++++++-
 2 files changed, 45 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index a465d5242774..6741524aa980 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3548,7 +3548,10 @@
 			emulation library even if a 387 maths coprocessor
 			is present.
 
-	no5lvl		[X86-64] Disable 5-level paging mode. Forces
+	no4lvl		[RISCV] Disable 4-level paging mode. Forces
+			kernel to use 3-level paging instead.
+
+	no5lvl		[X86-64,RISCV] Disable 5-level paging mode. Forces
 			kernel to use 4-level paging instead.
 
 	nofsgsbase	[X86] Disables FSGSBASE instructions.
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index b56a0a75533f..8140fefe0e57 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -752,12 +752,35 @@ static void __init disable_pgtable_l4(void)
  * then read SATP to see if the configuration was taken into account
  * meaning sv48 is supported.
  */
-static __init void set_satp_mode(void)
+static __init void set_satp_mode(uintptr_t dtb_pa)
 {
 	u64 identity_satp, hw_satp;
 	uintptr_t set_satp_mode_pmd = ((unsigned long)set_satp_mode) & PMD_MASK;
 	bool check_l4 = false;
 
+#ifndef CONFIG_KASAN
+	/*
+	 * The below fdt functions are kasan instrumented, since at this point
+	 * there is no mapping for the kasan shadow memory, this can't be used
+	 * when kasan is enabled.
+	 */
+	int chosen_node;
+
+	chosen_node = fdt_path_offset((void *)dtb_pa, "/chosen");
+	if (chosen_node >= 0) {
+		const char *cmdline = fdt_getprop((void *)dtb_pa, chosen_node,
+						  "bootargs", NULL);
+		if (strstr(cmdline, "no5lvl")) {
+			disable_pgtable_l5();
+			check_l4 = true;
+		} else if (strstr(cmdline, "no4lvl")) {
+			disable_pgtable_l5();
+			disable_pgtable_l4();
+			return;
+		}
+	}
+#endif
+
 	create_p4d_mapping(early_p4d,
 			set_satp_mode_pmd, (uintptr_t)early_pud,
 			P4D_SIZE, PAGE_TABLE);
@@ -800,6 +823,22 @@ static __init void set_satp_mode(void)
 	memset(early_pud, 0, PAGE_SIZE);
 	memset(early_pmd, 0, PAGE_SIZE);
 }
+
+#ifndef CONFIG_KASAN
+static int __init print_no4lvl(char *p)
+{
+	pr_info("Disabled 4-level and 5-level paging");
+	return 0;
+}
+early_param("no4lvl", print_no4lvl);
+
+static int __init print_no5lvl(char *p)
+{
+	pr_info("Disabled 5-level paging");
+	return 0;
+}
+early_param("no5lvl", print_no5lvl);
+#endif
 #endif
 
 /*
@@ -979,7 +1018,7 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 #endif
 
 #if defined(CONFIG_64BIT) && !defined(CONFIG_XIP_KERNEL)
-	set_satp_mode();
+	set_satp_mode(dtb_pa);
 #endif
 
 	kernel_map.va_pa_offset = PAGE_OFFSET - kernel_map.phys_addr;
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
