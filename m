Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 290A4C54798
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Mar 2024 19:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=65B1dK/wLVNe3rc/un3fl+yafVflmbq4P3/ZxMZmIzU=; b=r9A+vflxSdyjMd
	BEVnpWNxZrV/sPghiLQvGDv6lchJ2ET0tpeC99gK6ciSgxEelOLii6Z3wGUqRLYlahRUo7wjnaoG4
	OKsQvk3v8NKBYgcgvj6mXsOqREwoI3dKcoZEwdOEH4YtDrsKctCxgSTAGxDqFOHA3+8gQPJ/0YWjN
	TnLzkffl9zGzIfrurKyw3YhTeKxMaT4SbgFkCgXCLjVAULBwmJF1Nu5Cy1v9CcOwBRTFY46gfPsgh
	lv2W7zp2pc5ZBd9iUMNQDQLPblAH+/VmLT4DwjipDCi2doZ8Y3DvoNAzI7Bpwda/Qc+aLr0HDW3Vl
	ffLGljULf2kcB2ahUjqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riJ4E-00000005yaF-3SSy;
	Thu, 07 Mar 2024 19:06:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riJ46-00000005yUv-19AB
	for linux-riscv@bombadil.infradead.org;
	Thu, 07 Mar 2024 19:06:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=rcFiymo+h5H2KYUaV+euAHpHhZgWsCrhqFiINsYj2NQ=; b=e6wJi5blvoIvSO+5r24tgS3TNk
	xZW1ZTKSSkW9Y0Dm6Br3V7dEThgota9EX76Akua6MAM9n9Ec8fZNi/N/Q1bHHSEmgdIgYcjTHa/pi
	XChE+yLJerim/Wiq6RRfsquF21tZRnXvB7eobvzGKXjsd0pCKiFPrD8WNtRfszGGoV7CE6fIzmjf0
	OhEqLWfnNq6ubjT35AzZ8lGV+Vw5BcOyq9wXmQvHWa8LnewcXdCRfwtTFH9Dq2RURWlpLI9pVp+6U
	CGkHvuwpmjzIuu2ewDzgbliuVOegLKJVsQ/XvxbQAA7uq6V18DlSwdUuD1U7FIaKO+dn5PCwQ/+VV
	mGeoj73g==;
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riJ43-00000006rT4-0fM5
	for linux-riscv@lists.infradead.org;
	Thu, 07 Mar 2024 19:06:01 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1dc1ff3ba1aso10445685ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 07 Mar 2024 11:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1709838357; x=1710443157; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rcFiymo+h5H2KYUaV+euAHpHhZgWsCrhqFiINsYj2NQ=;
        b=jTfSABJNSlHJc9AWxha3z/iweaZ7eDSPhm3Htm4beki9ybM3vonVqQ7ciytduD9Q+G
         KYlucK9MX2v/oo8BceF5yJdFQYW0pO6xnI/bdWwl52+BcqYbc9TlLk+9zW8ERBbixLCT
         Ias/YOyIuqAQ2Nw0rAQiMVXfFvHEKKYk1IIGUy3KeWdrIxIBxpLiFJQuQfWQ28Tl/Gi+
         ye643f2ZF4uRg54GF5PKT4/1Fc5bK07aOkY+Lnz3aL4k3trwUUm2xXRMGWTq5svq1hIr
         jsAj0dL0NuTc3ScIJ8Y5+0+zW3JVgAtqfmXLD9ekizppouPw/1RvXZApW0mLyMtzm+Mu
         lRTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709838357; x=1710443157;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rcFiymo+h5H2KYUaV+euAHpHhZgWsCrhqFiINsYj2NQ=;
        b=TmyWwLi/wqamZkN/qC/WvUFerfe4TRSFRDIMk7i+z8/5q90OdaOvC/DSasO0faNEvk
         SzG19SMP5xM7kPidSg9XJfLPCX4W1yXzfFu5DqvIFrocujPH6/rGV0xhpEYzMx7OW9tN
         gsJmx86gPjI1x3EQAADcY5g+kcwRToawVKrIK1J28EVSXYEIomvSjR/lmALjMX7mqPu7
         WChlWCP5ianff5v1dqBZ+ppmfKlG0mJXjqnGg1AxRJXLwBxYL49RPQ26E1jyegHU8rav
         yt9IlvK+yxPckrM10SnSpfkFRsfnTQMxhMt8wUMYMFs4niFkyDA4v9gXWSjwVWA6YfV1
         Sclg==
X-Gm-Message-State: AOJu0Yy4AQA9mt4KjLfdp0nKLA8gXTMTyqAOd0TEVCe+ojwdgcX9ARUD
	mhZAGU5cJ0MDWnwDepEu3fp2wU/zWG979P9ZKi59PG+20ctZbPlVn+fFuDfvG4o=
X-Google-Smtp-Source: AGHT+IGWkAQ/GgJHU1goRENWlzlo1nOGmjqZXS1Ap4YlB/sVxOCqmhx+oHH8w+U3FcSQCMZmvqiyag==
X-Received: by 2002:a17:902:b202:b0:1dc:fb12:abbc with SMTP id t2-20020a170902b20200b001dcfb12abbcmr7992411plr.61.1709838357144;
        Thu, 07 Mar 2024 11:05:57 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id h3-20020a170902680300b001dd526af36csm1747338plk.295.2024.03.07.11.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 11:05:56 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 07 Mar 2024 11:05:47 -0800
Subject: [PATCH v8 3/4] riscv: Decouple emulated unaligned accesses from
 access speed
MIME-Version: 1.0
Message-Id: <20240307-disable_misaligned_probe_config-v8-3-55d696cb398b@rivosinc.com>
References: <20240307-disable_misaligned_probe_config-v8-0-55d696cb398b@rivosinc.com>
In-Reply-To: <20240307-disable_misaligned_probe_config-v8-0-55d696cb398b@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709838351; l=4202;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=IaoDcAIGwiU84s3iFQFa7IKKT21z3ZbSgM4n2pSHuEQ=;
 b=Gd/AFd9UPYuU9gsHq8mkyXcCsBgVRVzPdcuQYH+roI4KVNNrqQUITF4Emy6vygu23m3rPxwio
 U5tr57dBkG8BJE6C+mIDw5LFGt6Z3a+kGFeNFUsbIiIjDF7+dODt76C
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_190559_451716_440A489F 
X-CRM114-Status: GOOD (  12.69  )
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
