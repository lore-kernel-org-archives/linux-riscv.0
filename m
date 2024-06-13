Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A677FC27C4F
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jun 2024 19:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OHaYnfBE4HV1Vz2CFv7xEogzBAYmB3cYCkKL/d/3f+I=; b=zWHP1+YCWmszCG
	wsVbUgcrPyIf7lYtGNvU1niCUzT548g2zV5zysTqh84FVxtUFCAOFFMAlnpYYE2L24koTJxJTN2tv
	yeXFHTBzfeZJqOAwRFTV8LLszWWwIMahrVRp0rWUPauF+Jvl83cAcsAqO+hPTSF9qXC/7F4fRUKIo
	b2O/094pdhVh5frihpniRHCZTx2MPWwfKVKx/9e6VZ0I8tHzo1GsZ20UhuUIyVUO6DsMia+6Vh0d7
	z4j0Aq8U4Zmdb9Dkpcc1am3v15wZc1rLT/9MSxP2qMgRv2L7GTXMAFpqFF+npZgKsc++d/B+GIA73
	Cfad8rDBXh7U1kwuohew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHpwo-00000000EL7-3kra;
	Thu, 13 Jun 2024 19:17:22 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHpwm-00000000EJA-12ak
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jun 2024 19:17:22 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1f862f7c7edso1460035ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 13 Jun 2024 12:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718306239; x=1718911039; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d2si2x/qxMiiRgx/ptA73I3ih5KSBTyIVIweBGPWOt8=;
        b=o7o76VHMQ8USZnPVdWP2owyMfhuIReoypEZE/jRvj9vzIujZyKhzDxhh7cw3hCx6Yg
         4hw8ZsPnBOcYX34KbJsWM/XqOpGUfqH01UKTzmFhAfPGvaPiKVaOFi799nbR/7fMlZZC
         FuqdvLyzzx9DYguiC1/qcsi7kyNrU6M6mKGKph62A05FbEAR7z3/TadRalm+LETtNgeh
         b7tcY4OI+Jy1gBJhh6z1kDaD+qBPXTNwbyCKxXnuOzsz7sYZyFUa04LCP1RgySNXzMwj
         wILOsTkDAHN+go5XzpVwd9DFBxLJcZUFngYkFE3jTha5eb+XeLW4frPTaRZmHDDgNvR3
         BRGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718306239; x=1718911039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d2si2x/qxMiiRgx/ptA73I3ih5KSBTyIVIweBGPWOt8=;
        b=hzqrTMnHqy6rC0x+WeUvbkzOhX4686N8zEgEE1zeQSwVqoRrBvRz9YGAcS5AiQKkLP
         XnmNagvXBbcmJU/N5RxtLts7IWwl642CeSU1Hg32I4MgOtbLZf0Y+pB4qdrDNIpv5nZO
         WZPrzrIUPjYBmePjsaNCi9DXIu0W4hQ/f4NqssslMLumdDQCMGBo+taTOVVlIZyqKkhe
         ZTrw7WxaTgfrZ3xTQX5NwGfwiOFCUenTJM4TXuMp9ruEJQSi+ogl0PQYgf6N8x8jV33Z
         LjWSjempb8VUY95K+hZ8YGNx+6amwlLzNaGEee32eTIDzcLDCKWslnRDeeJk27/p9xLb
         dKNA==
X-Gm-Message-State: AOJu0YyJEoj7VYe6mkA/S+doRydlNZzxSOFhfNMru0zbvUtLTMcCuO05
	c34fT96RxChXGUMbXkuYwXMRcgIOsQFSI1itGgb7HNn3QuBdhhEnWRCEIrgOikM6ndDTNtAWya2
	seNk=
X-Google-Smtp-Source: AGHT+IEe/pgm4wbdzYk9w01vIQjdm01pqBBmuWzC0VnQ7Vhdd+iuX8Zf6okO8XfjDwZx3EhOCo7asg==
X-Received: by 2002:a17:903:2341:b0:1f6:7ee8:8935 with SMTP id d9443c01a7336-1f8629fef3bmr7650085ad.59.1718306239110;
        Thu, 13 Jun 2024 12:17:19 -0700 (PDT)
Received: from jesse-desktop.. (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e7ca78sm17471015ad.106.2024.06.13.12.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 12:17:18 -0700 (PDT)
From: Jesse Taube <jesse@rivosinc.com>
To: linux-riscv@lists.infradead.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Jesse Taube <jesse@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Xiao Wang <xiao.w.wang@intel.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Eric Biggers <ebiggers@google.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Zong Li <zong.li@sifive.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Erick Archer <erick.archer@gmx.com>,
	Joel Granados <j.granados@samsung.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 3/6] RISC-V: Check scalar unaligned access on all CPUs
Date: Thu, 13 Jun 2024 15:16:12 -0400
Message-ID: <20240613191616.2101821-4-jesse@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240613191616.2101821-1-jesse@rivosinc.com>
References: <20240613191616.2101821-1-jesse@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_121720_319662_D2DE7597 
X-CRM114-Status: GOOD (  16.77  )
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

Originally, the check_unaligned_access_emulated_all_cpus function
only checked the boot hart. This fixes the function to check all
harts.

Check for Zicclsm before checking for unaligned access. This will
greatly reduce the boot up time as finding the access speed is no longer
necessary.

Signed-off-by: Jesse Taube <jesse@rivosinc.com>
---
V1 -> V2:
 - New patch
---
 arch/riscv/kernel/traps_misaligned.c       | 23 ++++++----------------
 arch/riscv/kernel/unaligned_access_speed.c | 23 +++++++++++++---------
 2 files changed, 20 insertions(+), 26 deletions(-)

diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index b62d5a2f4541..8fadbe00dd62 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -526,31 +526,17 @@ int handle_misaligned_store(struct pt_regs *regs)
 	return 0;
 }
 
-static bool check_unaligned_access_emulated(int cpu)
+static void check_unaligned_access_emulated(struct work_struct *unused)
 {
+	int cpu = smp_processor_id();
 	long *mas_ptr = per_cpu_ptr(&misaligned_access_speed, cpu);
 	unsigned long tmp_var, tmp_val;
-	bool misaligned_emu_detected;
 
 	*mas_ptr = RISCV_HWPROBE_MISALIGNED_UNKNOWN;
 
 	__asm__ __volatile__ (
 		"       "REG_L" %[tmp], 1(%[ptr])\n"
 		: [tmp] "=r" (tmp_val) : [ptr] "r" (&tmp_var) : "memory");
-
-	misaligned_emu_detected = (*mas_ptr == RISCV_HWPROBE_MISALIGNED_EMULATED);
-	/*
-	 * If unaligned_ctl is already set, this means that we detected that all
-	 * CPUS uses emulated misaligned access at boot time. If that changed
-	 * when hotplugging the new cpu, this is something we don't handle.
-	 */
-	if (unlikely(unaligned_ctl && !misaligned_emu_detected)) {
-		pr_crit("CPU misaligned accesses non homogeneous (expected all emulated)\n");
-		while (true)
-			cpu_relax();
-	}
-
-	return misaligned_emu_detected;
 }
 
 bool check_unaligned_access_emulated_all_cpus(void)
@@ -562,8 +548,11 @@ bool check_unaligned_access_emulated_all_cpus(void)
 	 * accesses emulated since tasks requesting such control can run on any
 	 * CPU.
 	 */
+	schedule_on_each_cpu(check_unaligned_access_emulated);
+
 	for_each_online_cpu(cpu)
-		if (!check_unaligned_access_emulated(cpu))
+		if (per_cpu(misaligned_access_speed, cpu)
+		    != RISCV_HWPROBE_MISALIGNED_EMULATED)
 			return false;
 
 	unaligned_ctl = true;
diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
index a9a6bcb02acf..70c1588fc353 100644
--- a/arch/riscv/kernel/unaligned_access_speed.c
+++ b/arch/riscv/kernel/unaligned_access_speed.c
@@ -259,23 +259,28 @@ static int check_unaligned_access_speed_all_cpus(void)
 	kfree(bufs);
 	return 0;
 }
+#endif /* CONFIG_RISCV_PROBE_UNALIGNED_ACCESS */
 
 static int check_unaligned_access_all_cpus(void)
 {
-	bool all_cpus_emulated = check_unaligned_access_emulated_all_cpus();
+	bool all_cpus_emulated;
+	int cpu;
 
+	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICCLSM)) {
+		for_each_online_cpu(cpu) {
+			per_cpu(misaligned_access_speed, cpu) = RISCV_HWPROBE_MISALIGNED_FAST;
+		}
+		return 0;
+	}
+
+	all_cpus_emulated = check_unaligned_access_emulated_all_cpus();
+
+#ifdef CONFIG_RISCV_PROBE_UNALIGNED_ACCESS
 	if (!all_cpus_emulated)
 		return check_unaligned_access_speed_all_cpus();
+#endif
 
 	return 0;
 }
-#else /* CONFIG_RISCV_PROBE_UNALIGNED_ACCESS */
-static int check_unaligned_access_all_cpus(void)
-{
-	check_unaligned_access_emulated_all_cpus();
-
-	return 0;
-}
-#endif
 
 arch_initcall(check_unaligned_access_all_cpus);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
