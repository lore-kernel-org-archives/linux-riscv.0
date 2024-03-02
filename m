Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 058CBC54E5A
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Mar 2024 01:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hq73nL3bA5hcLiEByiQptmElP6Ik8KSeuZlDPpMwr5I=; b=mFRGjDH+6az0TS
	K4oSV3qnindDC9IelsDK9m7U6D1gvlkMiaXLRUNdKtt3H7uZjRnD2Sac2wpEeEsC+VJ7UZJP/MUT0
	gXsZKIRlnU7ZQy5+JWnutW6L5Z2IrBRKXf+7FlJbB29TErnYhO/V/+Ge0TOxTGCveEnMVAshw+he8
	yz3RiDnQjnIE1Mmz951oxrj4rTeuDxEaEzySXlfYLKHf+yyEM7xb7xJBBqRkSXOkmwEVMhZVzb5yz
	mPG81QUR7jxa4r2LylB3CAHjaZBSjRVtz4ZXztJvSPujtby46oF1B4WwCepTSkCw+E2Pl/GVeMuX7
	Iyrch9Cu5xhvqYEPO45w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rgERg-00000002VwP-3Q9N;
	Sat, 02 Mar 2024 01:45:48 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rgERd-00000002Vua-1IBE
	for linux-riscv@lists.infradead.org;
	Sat, 02 Mar 2024 01:45:47 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1dc75972f25so25069655ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 01 Mar 2024 17:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1709343944; x=1709948744; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r3Qfvs3PS/SqaY35b4e9kYVL30tzyoJAgDQ9SsWZHOI=;
        b=Gyjnf5dXjGUD3jBt2Mk/cSZX2m9bCR3Fm2i/rxPf5A3gVxJ+9pqbGFbsoYKFrrG54x
         pM31f5c4Babc9oCk7zaCMnyI/2QEVr9qsslv9bzazJz9qg0UBHYDM71Xi+IyB1z0miix
         NUth8AYuXoUtkvPpaSzbYWO1zIfpjtsn0iA9Wb7A7x4nTJFhxCD75eq+R4cSJCSSf7TV
         PdrSQ+PC6wEi2MxOVF5LlZ6xz8/mskUHvukqAFPMMKG0WTw3NEcNebmeSv64oPH30Dvy
         YJ/zDMLCsCT0gBTkNek8ZnHd5xN/yjbB9Z2MwW9Dj05r8mPwiTgfsDq4PEgdnskcmOLI
         hJTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709343944; x=1709948744;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r3Qfvs3PS/SqaY35b4e9kYVL30tzyoJAgDQ9SsWZHOI=;
        b=MIRQU02Cr4yg4R1Kyj5f3ibwDXqKxdyq+Zxn0fcHbMfi7pID9MKQwngSW+QoJrOFe9
         pS5eX69IBYNDT8sxCpXEX1iRs5lNahHBdeebj94PnjXPwckTEKwiTEC6/WwmriLjniu3
         Pq0i1Xfb8lzbnf/fIbMEyYQMatMIpYV6UAV0IREVQAm4Ig7O2eVoxial9x44u5gbBgGN
         Pv4yHloq5AxSrxuNOOFcIAuPJkXm+rfwW5fDWsF3NE7iMQ3KB/XZULHpPzjiRpjJEsZy
         bge+9g12OKkPlbSbGMiyjvbC8f0sIPIv3wMwb3MmRicX+7UMP3gxjX3B2tFjH6sscaPM
         Yt9w==
X-Gm-Message-State: AOJu0YyIWSDoL5/J4EROAx/VCNNMw7q1BBRV+EtiK8oam5nSKRdYJ4iA
	MH2/jq4/mtU9ky9dkGBN25dSUnp3CSV7JCu6dv+U3xBf8IBzYlR4ORS68RX7T6A=
X-Google-Smtp-Source: AGHT+IEs+Cr6aC23Fswwh3ZFwN8l50fRomu8sFf+KE5jvSmniBN5OXcfGMAgT+IVT61A2SBTamH2BQ==
X-Received: by 2002:a17:903:595:b0:1db:4746:5fdd with SMTP id jv21-20020a170903059500b001db47465fddmr2542481plb.43.1709343944235;
        Fri, 01 Mar 2024 17:45:44 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id j5-20020a170902c3c500b001d71729ec9csm4129039plj.188.2024.03.01.17.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Mar 2024 17:45:43 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 01 Mar 2024 17:45:34 -0800
Subject: [PATCH v6 3/4] riscv: Decouple emulated unaligned accesses from
 access speed
MIME-Version: 1.0
Message-Id: <20240301-disable_misaligned_probe_config-v6-3-612ebd69f430@rivosinc.com>
References: <20240301-disable_misaligned_probe_config-v6-0-612ebd69f430@rivosinc.com>
In-Reply-To: <20240301-disable_misaligned_probe_config-v6-0-612ebd69f430@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709343937; l=4205;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=YiWDyhZlyEbMfbqz0FsXl9yfSIL66FQp7h5UIvYeHJo=;
 b=M1VlqbLcYcq1VPmyWChr6/UcHm055g1J1jbZi0Ing9Lqe/dnK3npq+QdKEdNeIF7NX4qlMNrp
 wXdgqrbwSSlALqlnlscL6GXP8VeQb/WoJS8UcYhTBJnToIP2yy3U6iH
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_174545_414660_7C9987E3 
X-CRM114-Status: GOOD (  13.89  )
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
 arch/riscv/kernel/traps_misaligned.c | 20 +++++++-------------
 3 files changed, 29 insertions(+), 18 deletions(-)

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
index c2ed4e689bf9..1e3cec3f5d93 100644
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
@@ -623,22 +623,16 @@ bool check_unaligned_access_emulated(int cpu)
 	return misaligned_emu_detected;
 }
 
-void unaligned_emulation_finish(void)
+bool check_unaligned_access_emulated_all_cpus(void)
 {
 	int cpu;
 
-	/*
-	 * We can only support PR_UNALIGN controls if all CPUs have misaligned
-	 * accesses emulated since tasks requesting such control can run on any
-	 * CPU.
-	 */
-	for_each_online_cpu(cpu) {
-		if (per_cpu(misaligned_access_speed, cpu) !=
-					RISCV_HWPROBE_MISALIGNED_EMULATED) {
-			return;
-		}
-	}
+	for_each_online_cpu(cpu)
+		if (check_unaligned_access_emulated(cpu))
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
