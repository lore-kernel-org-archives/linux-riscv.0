Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61EEFC001DF
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Oct 2023 13:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A3F3PE3rDiyhX7it9Crb7f6EqKj64oP1rAKn5mA68/w=; b=rTOIXX18Vjq7AW
	o3IZu/GMMCwS6LosDxVZ+BXkBBmYi4oHqeNAjhArv0lzyKM/pwGl1pM1B4l15Df2yOqaBhrji7QL6
	sJbMSxSzDnZZyz+DkrbenGddX1xy4p8KcPi6jBdRXXKw+w84FoyPdxxPbpOH2ZhMZV5jywb/IzDdT
	KriQ2KNCLjGdE8J49FSTnFuf/jHj+yGwWeTf4k2z/sgNI81NC/e/eTp1De7oTQKFgu8z2yPQwlkex
	bb78iEVv5lNGF7CWY/RFl2r0AVAgMbmdo9cSI1khD5NIoAt1NU8xwnPKlnQd4Ir9d3AQVBbSaO+7H
	TBfNqIqz5ra1WF74CbFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtpBt-002JgG-1Z;
	Fri, 20 Oct 2023 13:05:25 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtpBq-002JeT-0Y
	for linux-riscv@lists.infradead.org;
	Fri, 20 Oct 2023 13:05:23 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-9c53e8b7cf4so123133666b.1
        for <linux-riscv@lists.infradead.org>; Fri, 20 Oct 2023 06:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697807120; x=1698411920; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OFPrgP5bWqEnGXKFSHB3MxMXn4WZUH+UKdDb6upvDyU=;
        b=ckpN9KBRtkpCZh7ZmiumB3r3OJLpt9lYRE4XOyH5Xk8nCeg8LFROiwOBTz+nqpLp11
         8wfqrNQP78LW3bTFOBYHY24hdfTm6RWhZCYhW4txuX8WAWyqOXgT45sQmP4OPW437+1v
         I9PcCIaq0FgXS0bBZ5HUsE3UWomeP1L02tTpesVeusq287IgUgx8sTpBLoIGSnO9Sygx
         HRm9UhDe80NmWmd77tyccoWL2HoeS9E8Hz7U8tZIDTYSqRSnjC+NBdDJH4g7/91ewhi3
         2o69fS2JjCGPrSiU1hvn4r3lY3nfUBWRYyPgvuFtIKZwHGz0zyAgzH/98hGI9DJJ5S+d
         h5zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697807120; x=1698411920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OFPrgP5bWqEnGXKFSHB3MxMXn4WZUH+UKdDb6upvDyU=;
        b=IWx1rLVGEubmHbT2YLOvUMalXUG9Wl4ixOVZTsvFl9JhOPXiEqa/QbM477IuB4X/OD
         5h7d97NrNP+43OpS3pHabzERgJmTR2qG05D5JYzoez3gm6fySUJKbm7p5wkv3Tumn94b
         HhHTwOnhgHgUh3I85CM2R4oQdUw+MTEFx4EgBShsGENOEPpt2kQUjnk0hm6VqZFC5GG3
         UwHK8wrTbo2YrttJv10zZKDhKhchBnaCAjJmJ1fwu1yGgM9zO4MJe7b+N2V9IH7dJRNF
         pGKhPmItGFDldK13YAoAVxOzeAvBCseYHUzIQi6jDx9rojmD9IL6I0GEwZbZoH+eWgKn
         y/IQ==
X-Gm-Message-State: AOJu0YzqBCh/T6iu74Fe1mP6x++7RAYzIBNjfZU02LYfs1JLOty5/ZwO
	v7S90U1ceRKmDA/RJY25cV+L64krCSeqhLcgYDk=
X-Google-Smtp-Source: AGHT+IEWEBBrguZjVjX4ACRaEDo+YCOyPxpKCofCjdn51Fc4SQbgsvTyUvL1h/kr/BX96Mks+a5Ung==
X-Received: by 2002:a17:907:318d:b0:9c7:5b43:a8e5 with SMTP id xe13-20020a170907318d00b009c75b43a8e5mr1401282ejb.40.1697807119640;
        Fri, 20 Oct 2023 06:05:19 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id 16-20020a170906225000b0098921e1b064sm1465983ejr.181.2023.10.20.06.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 06:05:18 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	evan@rivosinc.com,
	conor.dooley@microchip.com,
	apatel@ventanamicro.com,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v2 1/6] RISC-V: hwprobe: Clarify cpus size parameter
Date: Fri, 20 Oct 2023 15:05:17 +0200
Message-ID: <20231020130515.424577-9-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231020130515.424577-8-ajones@ventanamicro.com>
References: <20231020130515.424577-8-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_060522_211606_6894A1ED 
X-CRM114-Status: GOOD (  16.57  )
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
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
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
