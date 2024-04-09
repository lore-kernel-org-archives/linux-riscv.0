Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81590C67861
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Apr 2024 06:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=edXB5861yARgMr3oc2rdqdMG1AI5MY1JmoeoqjG4A2c=; b=wChyfAqVrMeqQU
	koXnvaRP+gye+ByW4nKxWTaBUpl8dqUsEdRJYH5pOre2ZEPRkAhMeCvjNauL+5AcduTbExmCYHuHd
	GQKGQwClNHN1UHpAqDZ+xY1q1fHUIiIUMBGKGaeHECS0dpiHUtL+h8wljOoLJmtwjWWqLC2L7gFWy
	uFlIX6MZ4pwcclwb9GwKBQoifkam6e6+xN3/GLHfs3dX+7UqaEazWykcghVluGFUgp0ewu9vsWLvw
	JxFnc/2I2JbbYv73wTLoUIDFX1lf3vRIisZGUOSunBQvwrxH3uuScyJZGxBvHGayS/k0MjW+L9gMv
	9X/oz7K7kjTCOypTp9IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru4iS-00000000VxC-3uZI;
	Tue, 09 Apr 2024 06:12:20 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru4iI-00000000Vmp-4BvM
	for linux-riscv@lists.infradead.org;
	Tue, 09 Apr 2024 06:12:13 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1e419d203bdso12567005ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 08 Apr 2024 23:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712643125; x=1713247925; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AyLlHJKX0lMHHliH3LunddmcG89n9f9Z2NkEHCH/heM=;
        b=ObuCbHGBxktRXM2z+IVNxiD7iJjQp3rj3knJSVIqz3Cm6CIhxzwpWCZzzPhssnprgc
         zktHx3w47vgiAUvwr9Xmqmm0tDVPBcQt/5qB2ZjbhsloMFHvjBZh/K+YpVi8Dzv1LBao
         qE99mDsR00SzbFyulKiGis22OnntyaZlJahsrzH7R4/ow+pdl+nNXe8+TDzKBNV66zhj
         j9kNbdqVz5jEcTiPKP1kC5paYrxdtaz7jVYy2fAP2CwXP2pNCuqwyqONEteOzOORQOLX
         NqFndGHh32wghULO+ZwwoDI0kh30nKMyMxGmmn6laS166HNPZnonwD/lwMJg+g+YRR2Y
         uNKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712643125; x=1713247925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AyLlHJKX0lMHHliH3LunddmcG89n9f9Z2NkEHCH/heM=;
        b=BPAW3ktN/inkeJuk8+f4+bMNVeRqmFDH5KPH0iZqlwY94TIU9CHBYiqnZJGtLuJPfJ
         japvMI7LIxPu+rbQx/WxPsMTe5m3WqzuSGRxuPqwmVmD/S9RTIytTzmkbVy0kFpjgqyS
         8y4QQG0i51aaGgaiUaWjhLQ8LZH9PEaNkfxkEiytpuVTv5w+c975P5BCCcxMJxUH5kJY
         DPixEi3R/CWGReOz6iVtR1F5UGxeS+mfqoYmX8EYhsw4tOJyrCXv8I4thiZ6QoA2dx0E
         e504bhYwZAFWxNLUmdv8r4VSJKShjf8Z2JB4wapKzitr/Xq8Y/Euyv6rvEhQj5Qc6vZd
         PZOg==
X-Gm-Message-State: AOJu0Yy5xlBmPZG/8FrT5JecwfKhDKSO6ldYtp24/k1gIOGjjDlynkT4
	2/RcYLNneto2HfbrMYnvgOZeq7eUyuKG7Ed8KB/AOeOjJU7rmL/SozvJzyH5Ugo8y4O1tqfib9x
	6
X-Google-Smtp-Source: AGHT+IGL8mfXw1okbZ4dRjVvOwEcO62l/RlkfUkZG7ORslpV7FBhWFsCcs2aRsgrjDOA1d+dJmo0hA==
X-Received: by 2002:a17:902:e409:b0:1e2:992a:ae3 with SMTP id m9-20020a170902e40900b001e2992a0ae3mr9134870ple.45.1712643125208;
        Mon, 08 Apr 2024 23:12:05 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id n3-20020a170902e54300b001e3dd5972ccsm5775564plf.185.2024.04.08.23.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 23:12:04 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	andy.chiu@sifive.com,
	debug@rivosinc.com,
	hankuan.chen@sifive.com,
	guoren@kernel.org,
	greentime.hu@sifive.com,
	samitolvanen@google.com,
	cleger@rivosinc.com,
	apatel@ventanamicro.com,
	ajones@ventanamicro.com,
	conor.dooley@microchip.com,
	mchitale@ventanamicro.com,
	dbarboza@ventanamicro.com,
	waylingii@gmail.com,
	sameo@rivosinc.com,
	alexghiti@rivosinc.com,
	akpm@linux-foundation.org,
	shikemeng@huaweicloud.com,
	rppt@kernel.org,
	charlie@rivosinc.com,
	xiao.w.wang@intel.com,
	willy@infradead.org,
	jszhang@kernel.org,
	leobras@redhat.com,
	songshuaishuai@tinylab.org,
	haxel@fzi.de,
	samuel.holland@sifive.com,
	namcaov@gmail.com,
	bjorn@rivosinc.com,
	cuiyunhui@bytedance.com,
	wangkefeng.wang@huawei.com,
	falcon@tinylab.org,
	viro@zeniv.linux.org.uk,
	bhe@redhat.com,
	chenjiahao16@huawei.com,
	hca@linux.ibm.com,
	arnd@arndb.de,
	kent.overstreet@linux.dev,
	boqun.feng@gmail.com,
	oleg@redhat.com,
	paulmck@kernel.org,
	broonie@kernel.org,
	rick.p.edgecombe@intel.com
Subject: [RFC PATCH 04/12] riscv: update asm call sites with label setup
Date: Mon,  8 Apr 2024 23:10:35 -0700
Message-Id: <20240409061043.3269676-5-debug@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240409061043.3269676-1-debug@rivosinc.com>
References: <20240409061043.3269676-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_231211_062256_9EA6BF45 
X-CRM114-Status: UNSURE (   9.21  )
X-CRM114-Notice: Please train this message.
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

All call sites written in asm which will be converted to indirect call
form, they need to setup label register (t2/x7) with correct label.

Currently kernel is enabled with consant label of 0x1 for all functions.
Thus label is setup with 0x1 at call site. Eventually when hash over
function signature based label is adopted, such callsites in asm needs
to b updated as well. We need better scheme for that (some macro)

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/kernel/entry.S   | 2 ++
 arch/riscv/kernel/head.S    | 1 +
 arch/riscv/lib/clear_page.S | 1 +
 3 files changed, 4 insertions(+)

diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index be07355b9eff..a35050a3e0ea 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -219,6 +219,7 @@ SYM_CODE_START_LOCAL(handle_kernel_stack_overflow)
 	REG_S s4, PT_CAUSE(sp)
 	REG_S s5, PT_TP(sp)
 	move a0, sp
+	lui t2,0x1
 	tail handle_bad_stack
 SYM_CODE_END(handle_kernel_stack_overflow)
 ASM_NOKPROBE(handle_kernel_stack_overflow)
@@ -258,6 +259,7 @@ SYM_FUNC_START(call_on_irq_stack)
 	load_per_cpu t0, irq_stack_ptr, t1
 	li	t1, IRQ_STACK_SIZE
 	add	sp, t0, t1
+	lui t2, 0x1
 	jalr	a1
 
 	/* Switch back to the thread shadow call stack */
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 4236a69c35cb..6c311517c3b5 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -165,6 +165,7 @@ secondary_start_sbi:
 #endif
 	call .Lsetup_trap_vector
 	scs_load_current
+	lui t2, 0x1
 	tail smp_callin
 #endif /* CONFIG_SMP */
 
diff --git a/arch/riscv/lib/clear_page.S b/arch/riscv/lib/clear_page.S
index 20ff03f5b0f2..16e63ea91baa 100644
--- a/arch/riscv/lib/clear_page.S
+++ b/arch/riscv/lib/clear_page.S
@@ -69,6 +69,7 @@ SYM_FUNC_START(clear_page)
 	ret
 .Lno_zicboz:
 	li	a1, 0
+	lui t2, 0x1
 	tail	__memset
 SYM_FUNC_END(clear_page)
 EXPORT_SYMBOL(clear_page)
-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
