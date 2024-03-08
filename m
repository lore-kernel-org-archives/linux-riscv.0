Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E638DC5475B
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Mar 2024 18:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=65B1dK/wLVNe3rc/un3fl+yafVflmbq4P3/ZxMZmIzU=; b=equq6DTgvZsf7q
	xdmkAUg5uzomW4aWNK7vhwbjhmO44owvESf76iMxXXm2v8q5+4XCpKhjOmAI/bjQXtHm8l4YhxZol
	lHMZBDjwE8bgFiySHHoD/eDoX/7+ekyDkhj53v+BWxGMgzWMsEA0Wm/UK1ncV5CctA9F+LEZzPeJG
	E8ll4pqieGSMtS/hEL/N4a9oLVSSe5G4s18BwAhg/iX2q0JT3bJV3JQL2FIrFMoqrpQbeOlF8pkF+
	lMmvT3mqcIFRXIM51y34HMlXZuBl2tCAjGESPrdZzTflicsBWcQyFadVtCX40X7iQemwJklyGY1C7
	WyNqxBRY5QGaGuFvRVBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riev5-0000000AmpO-08vJ;
	Fri, 08 Mar 2024 18:26:11 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riev0-0000000Ammh-1tgZ
	for linux-riscv@lists.infradead.org;
	Fri, 08 Mar 2024 18:26:09 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-5c6bd3100fcso764998a12.3
        for <linux-riscv@lists.infradead.org>; Fri, 08 Mar 2024 10:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1709922364; x=1710527164; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rcFiymo+h5H2KYUaV+euAHpHhZgWsCrhqFiINsYj2NQ=;
        b=PmAGWk8mREt1vhjiOjeb99Zbb0EZw/EE9+xTWsf8W3yRHPXw5Jj7x3WDtXpvVv5sdd
         PoNuuo8jRtD4T59j9kebzTkcE9HOJ9hDNzF8io0/X8ySpn32nrzBE+BKp7YCz1gUFFjw
         bqXTs6gegKZvu47UMxKHRdXNTuTYJdWIvBFVdGEOUEWrlYj3rE9mKqLypPvAuhQ0y13S
         rMq8dsiSZCdnml7OjruPtL8RzloAR6JLyLlcB499LN8nDgK131b+4F2HUNvLuMmlTohm
         lPka2K0HYV+aeZkx0P0SOC8IB1/xRiqPvYufyHga/bJ3nS7r7a4F9WOkTmspQOGHyTUw
         Wv2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709922364; x=1710527164;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rcFiymo+h5H2KYUaV+euAHpHhZgWsCrhqFiINsYj2NQ=;
        b=H/4/T+f/pZiTae+MEvYiEny72tRyuMrbIO3tSelUCGd6zmJx3VA7Kbqfct7WsYY7RM
         Mje076i7FmQWhBPt4IyHI2sY9FVygEo7rhd12WOpZ5KpD09GvPvBBlVtFcFU85m+nMYN
         WWNHAuWYADtZfaSwM6/WGv3M6Un6NQNZ1tp2og/QO2dkdrvyJ6rquPVfU9Ozg4M5asBa
         8tB+SoHoJXx68FH1DusFcXcFJaTXoEQIkFdSBJzk7jjMEQ91G2VOecy2zd5JQv6nrU7C
         rKAI4O2ymm4lHwE5i4FDzz6wsUn1pH19oIlsfP5ig8ntjFk+DE3nJoL70S9CFXbSuvF2
         aZ0g==
X-Gm-Message-State: AOJu0YzR8+1WjJWF2W6EGZx1hm1SNVI3ZixFWrXQ6cEKlOZFwY6ko2Mm
	JBwZntZyeK6V99JIkXPiuRq1iojbzIYyXeHlidJuqiyFgs98nPMy3AvOmDr2OT4YpE733s2m1m4
	T
X-Google-Smtp-Source: AGHT+IELgIan5yqE5It2h51GkqWwvF9l27KtLGyPFkczN95qZpobIHsNS+k43j4taa98KTiCzaJaSA==
X-Received: by 2002:a17:90a:fd0e:b0:299:4269:b8c9 with SMTP id cv14-20020a17090afd0e00b002994269b8c9mr954346pjb.26.1709922364103;
        Fri, 08 Mar 2024 10:26:04 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id e13-20020a17090ac20d00b0029bb1bb298dsm44821pjt.35.2024.03.08.10.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Mar 2024 10:26:03 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 08 Mar 2024 10:25:57 -0800
Subject: [PATCH v9 3/4] riscv: Decouple emulated unaligned accesses from
 access speed
MIME-Version: 1.0
Message-Id: <20240308-disable_misaligned_probe_config-v9-3-a388770ba0ce@rivosinc.com>
References: <20240308-disable_misaligned_probe_config-v9-0-a388770ba0ce@rivosinc.com>
In-Reply-To: <20240308-disable_misaligned_probe_config-v9-0-a388770ba0ce@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709922358; l=4202;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=IaoDcAIGwiU84s3iFQFa7IKKT21z3ZbSgM4n2pSHuEQ=;
 b=D3NiSToMkJgM3ochOOiN4oilLBmEEQASczQi6/yCbCi3BMgcdcf1bmege+8fRzDPEEdyES10L
 ZsVeSsvKAlqBFE64TiUx0lgNGZdkZt6k+7+Hmox2EI2GfuHZcyBynmQ
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240308_102606_670152_7841B6F9 
X-CRM114-Status: GOOD (  12.55  )
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
or disable each of these checks.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
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
