Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92218E71069
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Sep 2023 12:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jksugwp2isSHvB0CZysNjD4l89dzZsW26HZn21UJxMQ=; b=zvaRVjphb3MYoV
	MCHBB1J9Osy+A4GWjltZhvVVnmwxILaa/6RPngSEDzTWsmmwOYNI+3Fm95zZp6Z2/xMlFk6Goiigq
	dCXCf/al6XDpyLg9zlUpAdvZti0iFZ7mdm+qLViv3ElyNC15Kn/sDJNPZaCCEirnBey9fq6yJND5v
	2mTzi6ZN4jHtYdpGdS+7OYBnYqSgzSoY34LqTPO7p0t70r0gd5xCxNTibI+uaTNcbA2WdJh7Zvv3k
	CxJEgM4cpWeDBMSCIjD6dvGl51DSYjcS/a0uaMu89VKo8TwunTgyv/wGz2EKrE1KBmgIoTu1bLTXI
	iWphMisEyzPPuU1qzWcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjJDL-00649O-02;
	Thu, 21 Sep 2023 12:55:27 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjJDI-00648S-03
	for linux-riscv@lists.infradead.org;
	Thu, 21 Sep 2023 12:55:25 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-31c8321c48fso1396882f8f.1
        for <linux-riscv@lists.infradead.org>; Thu, 21 Sep 2023 05:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695300921; x=1695905721; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B6xUq0g2FRK1IMKIFQ3ZjlxU8Jh3LaQroOXxzc5Wf4g=;
        b=Ids0nq9WeUDGdAXuMOBt9JPgYWvu306vOKquz2rzGwnI18boU9IyCorPE2f30DAVkP
         2iGU+9jMsUuKHSLQJ7/Wj7pkx1Z/QEfYL1kcHrDypC/Ld11OZpQ3QX/MEVe6M+nTDNYV
         TEO1RJASS0ZOoTY3YSMcZ79KRpn9/yC2kLING0gWUIza+BoGBKGwDE+Ee+OqXdRRSddX
         ZVXcvviQRSbkhXvEXoSkirNUrRWjueVTPjwg+Zc5GcLMMB/rnC/ZJ3/Cgyuh/xSbcPnz
         Q9urQ5KzBstUpCXlPjI6qlsCBhxzAUS/mtnJqYbwcvS55cS6J8FMM2tf67X0qgacqf21
         6Wag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695300921; x=1695905721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B6xUq0g2FRK1IMKIFQ3ZjlxU8Jh3LaQroOXxzc5Wf4g=;
        b=GD1jC9y52yFWUkbTcH7WwT+4QhGYuyxCrfiBarNMJfWj/v/OCzzvQk9p70QOw6vNk4
         z/S6NYHXJ7HAMQI3iBFX9ZfxGeaDDSxUW7/dB45TAJJ6ConZJOpQ1dHyNq6I6qvsyIzO
         A+i2d/2ZeNNTHRhac0D7mo8+ELuGys2GA4FwWArm+443mOYZHwjUqv5gef+INjkrUzwe
         XZA+ZefihBummmG/XOIOOD1A9W9+WaJtYyLE2uXcrSUKnihI02MTr1CYGO+G2wfKiiey
         q/CFZgiVXNS6Rds2stjMjYVcg8dD/JTxJdHhDgSgf7BLNloEVG7dKefZzbXRHVncnrC3
         M5GQ==
X-Gm-Message-State: AOJu0YxuHBtxeTwnGWcGvG/hQjhbnEvVt37rU6Usv31jou7dwb+KR1xW
	J6YXL9T4Lqhz07tHoFT2YYgtWlQLJFVuHodtlaQ=
X-Google-Smtp-Source: AGHT+IFInjgNxpZfJJz9IttNlEeaUIcbpNrPgXImQSmp2Vtw1OLTeJgB9wHy/3nZEhCvKZliVEHxwg==
X-Received: by 2002:a5d:53d1:0:b0:31a:cca0:2f3a with SMTP id a17-20020a5d53d1000000b0031acca02f3amr6685296wrw.0.1695300921321;
        Thu, 21 Sep 2023 05:55:21 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id b1-20020a5d4d81000000b003140f47224csm1705185wru.15.2023.09.21.05.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 05:55:20 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	evan@rivosinc.com,
	conor.dooley@microchip.com,
	apatel@ventanamicro.com
Subject: [RFC PATCH 1/5] RISC-V: hwprobe: Clarify cpus size parameter
Date: Thu, 21 Sep 2023 14:55:20 +0200
Message-ID: <20230921125518.175428-8-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230921125518.175428-7-ajones@ventanamicro.com>
References: <20230921125518.175428-7-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_055524_076679_4C81322E 
X-CRM114-Status: GOOD (  16.97  )
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

The "count" parameter associated with the 'cpus' parameter of the
hwprobe syscall is the size in bytes of 'cpus'. Naming it 'cpu_count'
may mislead users (it did me) to think it's the number of CPUs that
are or can be represented by 'cpus' instead. This is particularly
easy (IMO) to get wrong since 'cpus' is documented to be defined by
CPU_SET(3) and CPU_SET(3) also documents a CPU_COUNT() (the number
of CPUs in set) macro. CPU_SET(3) refers to the size of cpu sets
with 'setsize'. Adopt 'cpusetsize' for the hwprobe parameter and
specifically state it is in bytes in Documentation/riscv/hwprobe.rst
to clarify.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 Documentation/riscv/hwprobe.rst  | 15 ++++++++-------
 arch/riscv/kernel/sys_riscv.c    | 14 +++++++-------
 arch/riscv/kernel/vdso/hwprobe.c | 10 +++++-----
 3 files changed, 20 insertions(+), 19 deletions(-)

diff --git a/Documentation/riscv/hwprobe.rst b/Documentation/riscv/hwprobe.rst
index 7b2384de471f..132e9acaa8f4 100644
--- a/Documentation/riscv/hwprobe.rst
+++ b/Documentation/riscv/hwprobe.rst
@@ -12,7 +12,7 @@ is defined in <asm/hwprobe.h>::
     };
 
     long sys_riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
-                           size_t cpu_count, cpu_set_t *cpus,
+                           size_t cpusetsize, cpu_set_t *cpus,
                            unsigned int flags);
 
 The arguments are split into three groups: an array of key-value pairs, a CPU
@@ -20,12 +20,13 @@ set, and some flags. The key-value pairs are supplied with a count. Userspace
 must prepopulate the key field for each element, and the kernel will fill in the
 value if the key is recognized. If a key is unknown to the kernel, its key field
 will be cleared to -1, and its value set to 0. The CPU set is defined by
-CPU_SET(3). For value-like keys (eg. vendor/arch/impl), the returned value will
-be only be valid if all CPUs in the given set have the same value. Otherwise -1
-will be returned. For boolean-like keys, the value returned will be a logical
-AND of the values for the specified CPUs. Usermode can supply NULL for cpus and
-0 for cpu_count as a shortcut for all online CPUs. There are currently no flags,
-this value must be zero for future compatibility.
+CPU_SET(3) with size ``cpusetsize`` bytes. For value-like keys (eg. vendor,
+arch, impl), the returned value will only be valid if all CPUs in the given set
+have the same value. Otherwise -1 will be returned. For boolean-like keys, the
+value returned will be a logical AND of the values for the specified CPUs.
+Usermode can supply NULL for ``cpus`` and 0 for ``cpusetsize`` as a shortcut for
+all online CPUs. There are currently no flags, this value must be zero for
+future compatibility.
 
 On success 0 is returned, on failure a negative error code is returned.
 
diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index d7266a9abc66..14b6dfaa5d9f 100644
--- a/arch/riscv/kernel/sys_riscv.c
+++ b/arch/riscv/kernel/sys_riscv.c
@@ -246,7 +246,7 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 }
 
 static int do_riscv_hwprobe(struct riscv_hwprobe __user *pairs,
-			    size_t pair_count, size_t cpu_count,
+			    size_t pair_count, size_t cpusetsize,
 			    unsigned long __user *cpus_user,
 			    unsigned int flags)
 {
@@ -264,13 +264,13 @@ static int do_riscv_hwprobe(struct riscv_hwprobe __user *pairs,
 	 * 0 as a shortcut to all online CPUs.
 	 */
 	cpumask_clear(&cpus);
-	if (!cpu_count && !cpus_user) {
+	if (!cpusetsize && !cpus_user) {
 		cpumask_copy(&cpus, cpu_online_mask);
 	} else {
-		if (cpu_count > cpumask_size())
-			cpu_count = cpumask_size();
+		if (cpusetsize > cpumask_size())
+			cpusetsize = cpumask_size();
 
-		ret = copy_from_user(&cpus, cpus_user, cpu_count);
+		ret = copy_from_user(&cpus, cpus_user, cpusetsize);
 		if (ret)
 			return -EFAULT;
 
@@ -347,10 +347,10 @@ arch_initcall_sync(init_hwprobe_vdso_data);
 #endif /* CONFIG_MMU */
 
 SYSCALL_DEFINE5(riscv_hwprobe, struct riscv_hwprobe __user *, pairs,
-		size_t, pair_count, size_t, cpu_count, unsigned long __user *,
+		size_t, pair_count, size_t, cpusetsize, unsigned long __user *,
 		cpus, unsigned int, flags)
 {
-	return do_riscv_hwprobe(pairs, pair_count, cpu_count,
+	return do_riscv_hwprobe(pairs, pair_count, cpusetsize,
 				cpus, flags);
 }
 
diff --git a/arch/riscv/kernel/vdso/hwprobe.c b/arch/riscv/kernel/vdso/hwprobe.c
index d40bec6ac078..3000e9fc0569 100644
--- a/arch/riscv/kernel/vdso/hwprobe.c
+++ b/arch/riscv/kernel/vdso/hwprobe.c
@@ -8,21 +8,21 @@
 #include <vdso/helpers.h>
 
 extern int riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
-			 size_t cpu_count, unsigned long *cpus,
+			 size_t cpusetsize, unsigned long *cpus,
 			 unsigned int flags);
 
 /* Add a prototype to avoid -Wmissing-prototypes warning. */
 int __vdso_riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
-			 size_t cpu_count, unsigned long *cpus,
+			 size_t cpusetsize, unsigned long *cpus,
 			 unsigned int flags);
 
 int __vdso_riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
-			 size_t cpu_count, unsigned long *cpus,
+			 size_t cpusetsize, unsigned long *cpus,
 			 unsigned int flags)
 {
 	const struct vdso_data *vd = __arch_get_vdso_data();
 	const struct arch_vdso_data *avd = &vd->arch_data;
-	bool all_cpus = !cpu_count && !cpus;
+	bool all_cpus = !cpusetsize && !cpus;
 	struct riscv_hwprobe *p = pairs;
 	struct riscv_hwprobe *end = pairs + pair_count;
 
@@ -33,7 +33,7 @@ int __vdso_riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
 	 * masks.
 	 */
 	if ((flags != 0) || (!all_cpus && !avd->homogeneous_cpus))
-		return riscv_hwprobe(pairs, pair_count, cpu_count, cpus, flags);
+		return riscv_hwprobe(pairs, pair_count, cpusetsize, cpus, flags);
 
 	/* This is something we can handle, fill out the pairs. */
 	while (p < end) {
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
