Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9587C54E41
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Mar 2024 20:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UJrFAFweOvaOPfR8E1eOk5PC76JY84xhThgxy0wzKck=; b=ZtseN6BGH4BDaf
	o1OnV25ot+FdNCJRg3QpKEbPflmMpwJXcDNMWdi1Ok/AfLjLx/iLoDUl5M9gOP0SQQtUvzz4Md83K
	Kq0/I4Cz+1X0cOJ343bnSyucgpl3qxKn6EqhZ+MSEb2QGlob1EM4cqbcfiKu6Q1xArMmCklK5D7pE
	ZJohrBTvXP1Xw7bH5GlHmnTDjEO92g9loRsbKFOVw0uNzH8Xk1Mklb9N7ft2qVzNMVjX567eKeHX9
	Xc0MQFnm74mxQrfkD+igH6TFeBKmLJvO+5/Sy1AocHOrUcbOTfuMLADK7e8/S4/sX2EuB12XLH5eA
	lMR540jhb4mkrrsWt2Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhxVG-00000001jsb-459a;
	Wed, 06 Mar 2024 20:04:38 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhxVC-00000001jpY-04sf
	for linux-riscv@lists.infradead.org;
	Wed, 06 Mar 2024 20:04:35 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1dc0d11d1b7so1138515ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 06 Mar 2024 12:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1709755472; x=1710360272; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T3h3l0Ycd0txaXwqtGKXZSurBo/SuGyYiZV4XuZZpag=;
        b=u5x0hKUbRxjn6fRI9WwNJM0BeUW2q78mc4SNV6U97CTO+UG6rm1gkun5yYK+QVqlOR
         6oFrLPQM/A6U5oQiuFf7CGA7VwyybwKWOoJn1LMjTgq3osseqKCykAYeHBzZnfexjA6K
         dqG5e9aeaIqz8eAbVvyWhk9hb4kJ/Nv00JPeOvVHtPMS6p61iVJYmueNAk+g2dIFfQ8r
         a4Vj2eHc47B0BHGXVQAY+tD0tnDcOoi6T8TB9jPw5pGcdCLXwLfuzmy9H0TunAkeREvK
         AIDLSeCQh8BCeh+PFI87TnpbFownq6ZNJbmVRd2Itw1b65PzgTTPC5b2LNV+I7p38FfK
         cEHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709755472; x=1710360272;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T3h3l0Ycd0txaXwqtGKXZSurBo/SuGyYiZV4XuZZpag=;
        b=d3CaEcXYhy2/QRUNJPPb5kJzSg+i/ZwhxeSaVBuxqjcF0NHNdR+HUx3qx+CjKR6yVj
         EkfhT5ccMPUmckngV4tqUqImR+i7rNf5O8224867ENybTMCx69OnJBZ3SZ8J9oicc5t6
         rkW9hb7OOJKkvo2MxuSyEQGI3OBrHFme5T6aykL1zhLv/Icc6V7Pk7QrHLjPmyG8ja//
         K3wCLMH9xIpxY5z5+kRs+pIxugwFgZ9EOR7bFs3WdGka3EwTp6TPNqgp60I7vRPxDjoU
         5MfYVaMSMR+xV7H8LBQaRVYsLGSL1MmnWA0X0TYNb0UkZNnTK+LIWcUllbRbGFftmKyD
         r6IA==
X-Gm-Message-State: AOJu0YwR2l1U0GK7Q6+VHOSbPHdsIzajxADX6EnJrtk3KQ20a3zaAlxi
	IWMK+m4zIDy7fATRvclRL7FTp0JZcictKiYc4OXKZsHKtfWRWkRZFvnKSr3SvZc=
X-Google-Smtp-Source: AGHT+IHwpkx1HSST01gu7iFAZHNQnervC8qd68WqCPj80KESLMWRMKOAlsGOCO401jQFYD/w7wCfRw==
X-Received: by 2002:a17:903:24d:b0:1dc:7845:537c with SMTP id j13-20020a170903024d00b001dc7845537cmr5928989plh.1.1709755472694;
        Wed, 06 Mar 2024 12:04:32 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id m10-20020a170902db0a00b001dd42bbb08asm874913plx.253.2024.03.06.12.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 12:04:32 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 06 Mar 2024 12:00:03 -0800
Subject: [PATCH v7 3/4] riscv: Decouple emulated unaligned accesses from
 access speed
MIME-Version: 1.0
Message-Id: <20240306-disable_misaligned_probe_config-v7-3-6c90419e7a96@rivosinc.com>
References: <20240306-disable_misaligned_probe_config-v7-0-6c90419e7a96@rivosinc.com>
In-Reply-To: <20240306-disable_misaligned_probe_config-v7-0-6c90419e7a96@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Evan Green <evan@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Eric Biggers <ebiggers@kernel.org>, 
 Elliot Berman <quic_eberman@quicinc.com>, Charles Lohr <lohr85@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709755467; l=4180;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=DInkzEsYPrFJ+waSF/dYqKLd0uhEiOzVtX3I13D+1lQ=;
 b=jrlrelGypAUGPhL6WOlc+U5QG80c/2NUPxE//1G2xYp5fWrZqTju7D+5BYoGVZA8TyX+Yol9r
 f30a8KDNUw1DJosvrzrZ5/YaWsWWUht2zEvTFVWwrFNokvMxtasqojP
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_120434_118510_67EAC06F 
X-CRM114-Status: GOOD (  12.74  )
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

Detecting if a system traps into the kernel on an unaligned access
can be performed separately from checking the speed of unaligned
accesses. This decoupling will make it possible to selectively enable
or disable each of these checks as is done in the following patch.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/cpufeature.h  |  2 +-
 arch/riscv/kernel/cpufeature.c       | 25 +++++++++++++++++++++----
 arch/riscv/kernel/traps_misaligned.c | 15 +++++++--------
 3 files changed, 29 insertions(+), 13 deletions(-)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index 466e1f591919..6fec91845aa0 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -37,7 +37,7 @@ void riscv_user_isa_enable(void);
 
 #ifdef CONFIG_RISCV_MISALIGNED
 bool unaligned_ctl_available(void);
-bool check_unaligned_access_emulated(int cpu);
+bool check_unaligned_access_emulated_all_cpus(void);
 void unaligned_emulation_finish(void);
 #else
 static inline bool unaligned_ctl_available(void)
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 7878cddccc0d..abb3a2f53106 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -719,7 +719,8 @@ static int check_unaligned_access(void *param)
 	void *src;
 	long speed = RISCV_HWPROBE_MISALIGNED_SLOW;
 
-	if (check_unaligned_access_emulated(cpu))
+	if (IS_ENABLED(CONFIG_RISCV_MISALIGNED) &&
+	    per_cpu(misaligned_access_speed, cpu) != RISCV_HWPROBE_MISALIGNED_UNKNOWN)
 		return 0;
 
 	/* Make an unaligned destination buffer. */
@@ -896,8 +897,8 @@ static int riscv_offline_cpu(unsigned int cpu)
 	return 0;
 }
 
-/* Measure unaligned access on all CPUs present at boot in parallel. */
-static int check_unaligned_access_all_cpus(void)
+/* Measure unaligned access speed on all CPUs present at boot in parallel. */
+static int check_unaligned_access_speed_all_cpus(void)
 {
 	unsigned int cpu;
 	unsigned int cpu_count = num_possible_cpus();
@@ -935,7 +936,6 @@ static int check_unaligned_access_all_cpus(void)
 				  riscv_online_cpu, riscv_offline_cpu);
 
 out:
-	unaligned_emulation_finish();
 	for_each_cpu(cpu, cpu_online_mask) {
 		if (bufs[cpu])
 			__free_pages(bufs[cpu], MISALIGNED_BUFFER_ORDER);
@@ -945,6 +945,23 @@ static int check_unaligned_access_all_cpus(void)
 	return 0;
 }
 
+#ifdef CONFIG_RISCV_MISALIGNED
+static int check_unaligned_access_all_cpus(void)
+{
+	bool all_cpus_emulated = check_unaligned_access_emulated_all_cpus();
+
+	if (!all_cpus_emulated)
+		return check_unaligned_access_speed_all_cpus();
+
+	return 0;
+}
+#else
+static int check_unaligned_access_all_cpus(void)
+{
+	return check_unaligned_access_speed_all_cpus();
+}
+#endif
+
 arch_initcall(check_unaligned_access_all_cpus);
 
 void riscv_user_isa_enable(void)
diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index c2ed4e689bf9..e55718179f42 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -596,7 +596,7 @@ int handle_misaligned_store(struct pt_regs *regs)
 	return 0;
 }
 
-bool check_unaligned_access_emulated(int cpu)
+static bool check_unaligned_access_emulated(int cpu)
 {
 	long *mas_ptr = per_cpu_ptr(&misaligned_access_speed, cpu);
 	unsigned long tmp_var, tmp_val;
@@ -623,7 +623,7 @@ bool check_unaligned_access_emulated(int cpu)
 	return misaligned_emu_detected;
 }
 
-void unaligned_emulation_finish(void)
+bool check_unaligned_access_emulated_all_cpus(void)
 {
 	int cpu;
 
@@ -632,13 +632,12 @@ void unaligned_emulation_finish(void)
 	 * accesses emulated since tasks requesting such control can run on any
 	 * CPU.
 	 */
-	for_each_online_cpu(cpu) {
-		if (per_cpu(misaligned_access_speed, cpu) !=
-					RISCV_HWPROBE_MISALIGNED_EMULATED) {
-			return;
-		}
-	}
+	for_each_online_cpu(cpu)
+		if (!check_unaligned_access_emulated(cpu))
+			return false;
+
 	unaligned_ctl = true;
+	return true;
 }
 
 bool unaligned_ctl_available(void)

-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
