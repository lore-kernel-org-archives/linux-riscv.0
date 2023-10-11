Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EC79CD6E6E
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 13:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kOt+Ebn7n2atCfGjRLfb62kyON8bWEAy4DUIRRzK75s=; b=FKWcc/0ZBrCuSa
	tFWeiK0D6hJFT6RtESHdoZJH2m/Drhj7jL3WOpH9HwKJ23fHLBs2gHWuvYuwjislSc5XsVcz/H0bc
	KXVvpR8unbQNmhpe9RHQfUbmI6EhtDwnzgkd1i1For8XLmrRjO6+c8g7FXNd7Vwvl7RGrHpeWQJEE
	8RXQQtWMzS1vUa8lVQMgsJKNDBN8jZxhE4OmQWmQd/B7iozZ8mrKTkW5AsukFUnBy8zAoPIDxL5L4
	Kd3+FqT01rzd6myRpYEf8iP+0DglLn+D/JHrViQCih1wF1EDPUq30BUfcwyR/H3pSSpoRoWx4abKA
	ZjNfJA5/KAOw8FevzQaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqZhF-00G1yq-0E;
	Wed, 11 Oct 2023 13:56:21 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqZhC-00G1wK-1M
	for linux-riscv@lists.infradead.org;
	Wed, 11 Oct 2023 13:56:20 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-32d885e97e2so488402f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 11 Oct 2023 06:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697032573; x=1697637373; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=deUlI0YJGpx1DMe9G9GTdupeTeC4/fQZPDSZsqMaLHw=;
        b=CKb3z6IJjawnykrZgKPUd0LtXM3KWFnFbs/1hKIWTgZqddOFDuvhqu3RmCVRVkRvAd
         6FlNoCUpe+Q0H0FecIUQH8ByIfhZhkbufd8kHIn/gBMex8BtIC2cHnRM8aRPyVZJ2/7F
         y5hjnRLMtoWIIiALuihopJzml1j24o3IEZN+vhiUSYq2EeHdEP2decthAUyaks4i9Oa9
         y7gf+pNQYlKsVhBZdYBk/t2bM+5nCVDQcuwEn0TD6fo0Xpld2m8Eg3qulWBeaynuacJP
         fbnFXouos6jJstkBdNzNLccUVCO1lAyzcA5jMXwQc8O5dug0n0PfZZrDEtI2s36O3Icp
         wYnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697032573; x=1697637373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=deUlI0YJGpx1DMe9G9GTdupeTeC4/fQZPDSZsqMaLHw=;
        b=eZOt73FijklUYAh2BOv+NhKqud0SsCuqITZ7e8BK3LooHEkO+L/4k4x7L2SnmuLYFC
         ifz1Bfb3KCuei/KyapKb6Yt0Qqhb7XUe8ryiwPiNZhE8ryHGOgFkjBlRsu58xK+Jy+ip
         QcPNT+Dr3z7MWF0SImm8UKMryXOAtysyjmTa3nHY0fcteN657+QT505ExhnYw7D20cso
         hSiI35KEF+ljAJuFbMA8rztEq7dAT9KsJtGH9LLGlhZ1sXnB62NtH1D68m+Mc6qQoGVg
         OS39Z0SmtM4oVDzdlsXs8dw5h/66gWbbzHr+SJCS5OHPJWIjcGiI6/YSguRYSY/JGsDh
         JV0Q==
X-Gm-Message-State: AOJu0YztpxG3PUgDQV0Xg19wrhgwmn4h7oCFoMLG6HP3A/JcP7KaV1Qi
	ySX9bqz71QO0mT9E7I9VOelUFKZCTVmRXxOlPIk=
X-Google-Smtp-Source: AGHT+IGakWrqajdWY+VkOYTWm2o0bLJG1SRZPQ/AiDLx93bCkpWjVXWZfN+5NfOrC6et/D+Ycz14Dw==
X-Received: by 2002:a5d:6291:0:b0:32d:8469:4f69 with SMTP id k17-20020a5d6291000000b0032d84694f69mr1307171wru.39.1697032572839;
        Wed, 11 Oct 2023 06:56:12 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id k1-20020adff5c1000000b003258934a4bcsm15537834wrp.42.2023.10.11.06.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 06:56:12 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	evan@rivosinc.com,
	conor.dooley@microchip.com,
	apatel@ventanamicro.com,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v1 1/6] RISC-V: hwprobe: Clarify cpus size parameter
Date: Wed, 11 Oct 2023 15:56:12 +0200
Message-ID: <20231011135610.122850-9-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231011135610.122850-8-ajones@ventanamicro.com>
References: <20231011135610.122850-8-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_065618_477809_57300FCA 
X-CRM114-Status: GOOD (  16.51  )
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

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 Documentation/riscv/hwprobe.rst  | 15 ++++++++-------
 arch/riscv/kernel/sys_riscv.c    | 14 +++++++-------
 arch/riscv/kernel/vdso/hwprobe.c | 10 +++++-----
 3 files changed, 20 insertions(+), 19 deletions(-)

diff --git a/Documentation/riscv/hwprobe.rst b/Documentation/riscv/hwprobe.rst
index a52996b22f75..c57437e40ffb 100644
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
index 473159b5f303..ed3545eb1b2b 100644
--- a/arch/riscv/kernel/sys_riscv.c
+++ b/arch/riscv/kernel/sys_riscv.c
@@ -228,7 +228,7 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 }
 
 static int do_riscv_hwprobe(struct riscv_hwprobe __user *pairs,
-			    size_t pair_count, size_t cpu_count,
+			    size_t pair_count, size_t cpusetsize,
 			    unsigned long __user *cpus_user,
 			    unsigned int flags)
 {
@@ -246,13 +246,13 @@ static int do_riscv_hwprobe(struct riscv_hwprobe __user *pairs,
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
 
@@ -329,10 +329,10 @@ arch_initcall_sync(init_hwprobe_vdso_data);
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
index cadf725ef798..026b7645c5ab 100644
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
