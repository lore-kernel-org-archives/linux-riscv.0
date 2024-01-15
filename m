Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A9E1C47258
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 07:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1HO743LQvYKySftn7m74260+utqE81yzv/hcE9W5LI0=; b=vf84dtjZm7uwLU
	qcF3rMwNldDKBTpx0gk5pJM1qGdHQQfE+mxQjkZMQF5+ZTVHlu9FKbPgEigIuOVG+1Q4C5Yj9aPtp
	B1LgevwApBJL4tKsntV4zHJd1+c+8qCBGTofq8JS0mIInGIzRUb7FmMwHltOyaboXawYc5YQTh6mE
	qpgY3HpELnA8mQCzZDvMKkFNj8R+ouyRhAgNy/5F4R7XgZl6bu6jhnrOtjb9z5XGAOLDyIJt+JOms
	CjeiFNuZzvl6ricqV4I/qqsiymAyUw/ImU/55BvubqYuB9M7xnde9wzb7C0lJNsxUg33BO33t9AC2
	Kih6oYRaiMmM+dvGnIvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPGxH-0081NQ-1v;
	Mon, 15 Jan 2024 07:00:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPG0z-007qGJ-0J
	for linux-riscv@bombadil.infradead.org;
	Mon, 15 Jan 2024 06:00:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=PTE5s3JevRaI0ONcRbV59vdIOJW1xXVURdjLv83lPaQ=; b=EQqwwESHr/iQ5MdcQOT0eEVLoE
	R2a2PJH6ASppMXlCs+O+y0j3VjSmG+m9iPFK8UC5N6A5YGshohKpjAK9QN4ZKTDYEf9bts0vERz7H
	HNPEERSVRSLG0a6BqbqF58Acp52a2geSPj/kR39E/g6KIJ8nWmsYobmMr/bFeVJTrwM6NHiaO/JrL
	jFwNmuZmiJrJJTPqh5L4h4eNcivC1HBgKL/umod3N9lHDnPGS+hKnaBomc+bxlDdopJDnz4oV2my3
	DVB9LAb/Nl5PC+gPdc8cHItXMgWYcH3UZXGmKwgzAnRtliehZwLFDwVYISYWXTWz2VyYhYzAdvfwA
	F4RXcxDQ==;
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPG0v-00D1Zs-0y
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jan 2024 06:00:03 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-5ce10b5ee01so5943742a12.1
        for <linux-riscv@lists.infradead.org>; Sun, 14 Jan 2024 22:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1705298398; x=1705903198; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PTE5s3JevRaI0ONcRbV59vdIOJW1xXVURdjLv83lPaQ=;
        b=m4TEWCTcEx391iFkauYeQ5rOuMTn3+IYDo4Z8hdxLbXyPtN6EIHkbxqfrNY9W9eydt
         9/RnTXUF7HcOxjv9DKBcupmL1uVjR2juqBY3mBX22ZHTNtPAjQ6ESFYEdtoHV/BhBrxT
         SqXA7VtaSqle7DMdFhMKURhNa2Jz1b5c+/LpuNKQ3RgV2pK77m2gEltUHPP7yTf5hU+C
         G5WMr09EOov4GH35izfDbBgeal2thSbhSMV+YqTCsUffGoGgHkG1NIxFQxHqXpjJQ4qu
         0s6pMLIS+FQsR1TU3PDDfOdXC9E/lwKrfABL4DscvBVThfHJUgfkw6HjprGNbe6JDDM/
         JIPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705298398; x=1705903198;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PTE5s3JevRaI0ONcRbV59vdIOJW1xXVURdjLv83lPaQ=;
        b=dWA6qjMmKPPQoavWfMkEMvZjdgFcTlBeC/y1cQswglavavCeGTOOvwN6Zaggn6A/1i
         +eIIou8ItLHLIY4I1hGjLa/9XuZ9AdHagXUcD1fQ4clniVwkzrU24SOvyKz2wdVOWXxm
         5H36vTjZQeRQ3DgSEpbN+AFBOlMN/c7TdZr0bNUQyD9c/tco5s6TmH7v09kt5kVQwC25
         L1d/huyjVX70NecXnUsnx70+BHmnlJwpQOdm6VK//C3TPHy+8xD8W6ldKqJ/sigffW6o
         HBxFweBxOLfaKjyoPdulrQMn4JzDSnJWRi06pyTS3RgnXYrR8eRjASnpZjfgAybajgTC
         9tdA==
X-Gm-Message-State: AOJu0Yw6f7NoepwN5Ee/Ia9mqeHeISwNw3sIvw8/YqjqGaB+xNxjCa5i
	VbRp0nLiVWM4l6CjWCxwt7jM8OO61g+Tc+QOTIVr7fwvKg6EE8WGAOQ+5TRjXQzbE8jOHz9tjC3
	O2fSCfiTajx3031cx6YSYRCMCIYDkCAiMWlh3z2ln2bR3iWu1lMd18nCKDV4aeQ9/oQK54XT6vs
	+825qs7/g0kPicCeRi+5Sh
X-Google-Smtp-Source: AGHT+IHBKxKSQEOhuPOiNKtgQJEchZSFIbGxPlE0dO0a1I8QijfgmZd4mZgMH/JMr0wHrp2g2UqPBQ==
X-Received: by 2002:a05:6a20:918c:b0:19a:e201:3b1d with SMTP id v12-20020a056a20918c00b0019ae2013b1dmr2450560pzd.7.1705298397974;
        Sun, 14 Jan 2024 21:59:57 -0800 (PST)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id o18-20020a637e52000000b005b9083b81f0sm7392988pgn.36.2024.01.14.21.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jan 2024 21:59:57 -0800 (PST)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: paul.walmsley@sifive.com,
	greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	bjorn@kernel.org,
	charlie@rivosinc.com,
	ardb@kernel.org,
	arnd@arndb.de,
	peterz@infradead.org,
	tglx@linutronix.de,
	ebiggers@kernel.org,
	Andy Chiu <andy.chiu@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Vincent Chen <vincent.chen@sifive.com>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Baoquan He <bhe@redhat.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Eric Biggers <ebiggers@google.com>
Subject: [v11, 02/10] riscv: vector: make Vector always available for softirq context
Date: Mon, 15 Jan 2024 05:59:21 +0000
Message-Id: <20240115055929.4736-3-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240115055929.4736-1-andy.chiu@sifive.com>
References: <20240115055929.4736-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_060001_847717_178AB8AA 
X-CRM114-Status: GOOD (  16.18  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The goal of this patch is to provide full support of Vector in kernel
softirq context. So that some of the crypto alogrithms won't need scalar
fallbacks.

By disabling bottom halves in active kernel-mode Vector, softirq will
not be able to nest on top of any kernel-mode Vector. So, softirq
context is able to use Vector whenever it runs.

After this patch, Vector context cannot start with irqs disabled.
Otherwise local_bh_enable() may run in a wrong context.

Disabling bh is not enough for RT-kernel to prevent preeemption. So
we must disable preemption, which also implies disabling bh on RT.

Related-to: commit 696207d4258b ("arm64/sve: Make kernel FPU protection RT friendly")
Related-to: commit 66c3ec5a7120 ("arm64: neon: Forbid when irqs are disabled")
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Reviewed-by: Eric Biggers <ebiggers@google.com>
---
Changelog v8:
 - refine comments, fix typos (Eric)
Changelog v4:
 - new patch since v4
---
 arch/riscv/include/asm/processor.h     |  3 ++-
 arch/riscv/include/asm/simd.h          |  6 +++++-
 arch/riscv/kernel/kernel_mode_vector.c | 14 ++++++++++++--
 3 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 3b59fc5c9545..27ceedf357bf 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -78,7 +78,8 @@ struct pt_regs;
  * following meaning:
  *
  *  - bit 0: indicates whether the in-kernel Vector context is active. The
- *    activation of this state disables the preemption.
+ *    activation of this state disables the preemption. On a non-RT kernel, it
+ *    also disable bh.
  */
 #define RISCV_KERNEL_MODE_V	0x1
 
diff --git a/arch/riscv/include/asm/simd.h b/arch/riscv/include/asm/simd.h
index ef8af413a9fc..4d699e16c9a9 100644
--- a/arch/riscv/include/asm/simd.h
+++ b/arch/riscv/include/asm/simd.h
@@ -28,8 +28,12 @@ static __must_check inline bool may_use_simd(void)
 	/*
 	 * RISCV_KERNEL_MODE_V is only set while preemption is disabled,
 	 * and is clear whenever preemption is enabled.
+	 *
+	 * Kernel-mode Vector temporarily disables bh. So we must not return
+	 * true on irq_disabled(). Otherwise we would fail the lockdep check
+	 * calling local_bh_enable()
 	 */
-	return !in_hardirq() && !in_nmi() && !(riscv_v_flags() & RISCV_KERNEL_MODE_V);
+	return !in_hardirq() && !in_nmi() && !irqs_disabled() && !(riscv_v_flags() & RISCV_KERNEL_MODE_V);
 }
 
 #else /* ! CONFIG_RISCV_ISA_V */
diff --git a/arch/riscv/kernel/kernel_mode_vector.c b/arch/riscv/kernel/kernel_mode_vector.c
index 114cf4f0a0eb..2fc145edae3d 100644
--- a/arch/riscv/kernel/kernel_mode_vector.c
+++ b/arch/riscv/kernel/kernel_mode_vector.c
@@ -46,7 +46,14 @@ static inline void riscv_v_stop(u32 flags)
  */
 void get_cpu_vector_context(void)
 {
-	preempt_disable();
+	/*
+	 * disable softirqs so it is impossible for softirqs to nest
+	 * get_cpu_vector_context() when kernel is actively using Vector.
+	 */
+	if (!IS_ENABLED(CONFIG_PREEMPT_RT))
+		local_bh_disable();
+	else
+		preempt_disable();
 
 	riscv_v_start(RISCV_KERNEL_MODE_V);
 }
@@ -62,7 +69,10 @@ void put_cpu_vector_context(void)
 {
 	riscv_v_stop(RISCV_KERNEL_MODE_V);
 
-	preempt_enable();
+	if (!IS_ENABLED(CONFIG_PREEMPT_RT))
+		local_bh_enable();
+	else
+		preempt_enable();
 }
 
 /*
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
