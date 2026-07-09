Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D8FBC43458
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2026 11:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aJ+O8/Q1M0lqrSeQCfdVx8MzA77ffY6TtqdGRV+wAiw=; b=Y+GlJgoVuWfi8o
	HRMFA51PLXNJfnj3gwFELSbJRQJVSiVTm/d+IfAkiP61sVOoSv9jX/Jrx8IPCxuu1Q26xsQrAQSYf
	hflvsKjXXEOHQ/1tuKtq3OsU06KNHSxISxPHXrT3Z18wJ4R9SBnQ0WOOS6BhcUHkv3n5EQs9jcnUR
	YnZZ+C1s9xROyjaISsUOESAe389wFIvitfkYPx3xOkVD4M2/7ooZ+jsXAXs4ivL8OpIbVYN69Kl2R
	BIBxY1e3MhTgBogG52qIHtWJgt1CDqSNkLchruVKXsSAhVjZOTxkLhrlL5AOflvi4EuAIne/PE3DC
	WrJylXL1QV0hsYApSsUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whnMj-00000002HM0-20hP;
	Thu, 09 Jul 2026 11:56:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whnMi-00000002HLD-03tS
	for linux-riscv@bombadil.infradead.org;
	Thu, 09 Jul 2026 11:56:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=CivCo3sxABn6gVyRhQlVLSU7JseOeDcuh4Y0SWmJVu4=; b=FqO/xwxfQrnXcno8dSFs4IMT8r
	H6HfgGuZInesMddv4LEJkLCmPOeji8OYao2yUwgDLiV/veOTA9CLIp1jC/r5ByG48AYr2kJMVi2kG
	Ai53mT6c5X3H0k6pEHsPKXW6iUSClVOlFCKHPcM6IvvY5DrxRdCMQ69jkYb3X04FWyox372oEYU6+
	r+gfQdeYofT0w+NAh5HkE2gSuPgzvTR8a+DjISoEiuJu2UhDlxiSiPEdDoQT9pMwrBb/YSoYGYfgZ
	WWedJekxBdQSu8ojjDZ3UZzLXGUKYNVBjFLwDSY9N153tHNpn7cTBMLhdJn7coxPLuDs4PwCnjnZh
	UamfHCXQ==;
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1whnMd-00000009Are-2ncY
	for linux-riscv@lists.infradead.org;
	Thu, 09 Jul 2026 11:56:25 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2caed617615so17044775ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 09 Jul 2026 04:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783598181; x=1784202981; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CivCo3sxABn6gVyRhQlVLSU7JseOeDcuh4Y0SWmJVu4=;
        b=WqVyNPAy7hnkOH3mV0eUM5AwH7lM7u7BwwcXCdIzCdF2CFdi2lIE5L3SgWT7+Cr/v+
         RWm0k+NVreoZ2Wx99A5QSfFAENfzGkAgBh+uXPR0MkdtgoGI2X0kUpKkUQZnc+oNGDjH
         T7aNStgREnvqHVnak1EyraSGbzBQqz8tdekMmdYicfTvDKLdVCGAcUZA6Jmh4tv/MrVj
         JTLMd3WUyJ/A4rHVu19IzXCIpB1rNwuVjWinoAyuYXbHvUFOkQJ66TZ84mMcOuVs+fis
         y7VA3VA6UuZ2cuZcI19oyhIAXB/BdPVo33UyC993103jjKOTVEPqh2YD37TYx1nW1rey
         HfEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783598181; x=1784202981;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CivCo3sxABn6gVyRhQlVLSU7JseOeDcuh4Y0SWmJVu4=;
        b=etCjXUi91Qn04cR4tONdPJLGOKWpyTJ9baKwCtDpxfzI+NxwsrjF5Rt4SBBlyScF6X
         WUZ4OYb2ZnHTgsCiTsYdzpwHyP44+4I0d6rTqZqGIoLIjr9/HjbStHfhkgwJPnmIE1l5
         YsEb5lV6em/2d9NhXjqTMRvLG9Eq5D0h+/rJ+yq0SjrPd+CQwr3NV29qevf7WIA5oAlx
         +C9sfz3pp/RyuIfPvjFFkx2RXSyplDVcz2JJh4eDlldZY8qmva/gI1jy0QFWcn08W3yE
         CYV1r7WH8fn7AetXHvu1aAM10sT35xqwvj2dQwx1PGxxVW4X+v+Q/tYyLpLlPzjHNMyB
         zPWA==
X-Forwarded-Encrypted: i=1; AHgh+RpWcFvgexWIJkGcNBcLfVzk1sMHHpFsEc+XL/th12fEAczsONX9j+A5jTOjiG2KQuFcE8POyqul1dEfUA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzdPit/GEBoOxU1oEC0ScPWiwwF1qkQCNdomrhPUDJh7Smflz5s
	uRa9NKqBbp3CY3bMDvZcOBiFldc22tYTZ8DG9DF9myJR7IUOVFcU3CC7
X-Gm-Gg: AfdE7cnfMVf+yNvj9Dj2yqn/sYfIuynfGTc4QwZsCRxdcoN+V2svg7FzD+F4X4S1YaO
	WRn7oU664nFXJ+Ali15Br3ajCwHxrkbBh0I2ANM9NQbxJNOOddmeJ2Q45ix4bjBNUKdK48Rv1S6
	ciRCO1nMYG4xb88gHW3RjNtq99LwrF/G9UO6oVWaxFv72qaiyLGzO/QT+lg1D24b57S0Fa31ovH
	FTmW0+gVvz+KkLCYn1Uk2UYPq93fJVGvXNKgJy1/yhTnyLKbCaVvHjzgy4y+LcwNvlz7lbWqADQ
	/o9GMuYS3EdH1t/Mdpm/LkNppJxqw0h0P36yTek8hfz3MkvVTu+6gY5E9f2PHfuMss+h+b3W3lc
	ABqQlHH4YtpNBtG8EWW++QwtaBCSMUKwzE7seEbDQcynVhNCOe4bVJwpg6Gw/Q7QJjUZI7GuwZi
	2CbbLwPJ8oPZgcggR78bxZMucYBkRLd3Bm24IzklgpsQ==
X-Received: by 2002:a17:903:4b4e:b0:2cc:98b4:e7e2 with SMTP id d9443c01a7336-2ccea5a815emr69832995ad.44.1783598180886;
        Thu, 09 Jul 2026 04:56:20 -0700 (PDT)
Received: from cyh-System-Product-Name.. ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3b906sm43917145ad.56.2026.07.09.04.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 04:56:20 -0700 (PDT)
From: "Yuhang.chen" <yhchen312@gmail.com>
To: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Quan Zhou <zhouquan@iscas.ac.cn>,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] RISC-V: KVM: Add kvm-riscv.wfi_trap_policy to control VS-mode WFI trapping
Date: Thu,  9 Jul 2026 19:56:10 +0800
Message-Id: <20260709115610.287420-1-yhchen312@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_125623_859998_652DFEAD 
X-CRM114-Status: GOOD (  14.63  )
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

Add a kernel command-line option, kvm-riscv.wfi_trap_policy=trap|notrap,
that controls whether a WFI executed by a VS-mode guest traps into KVM
(HS-mode) or executes natively.

Measured results (wfi_exit_stat delta / guest wake count over 3 s):

  policy        WFI_EXITS   WAKE_CNT
  ----------    ---------   --------
  default       295         294      (== trap, no regression)
  trap          295         294
  notrap          0         298

Assisted-by: YuanSheng:deepseek-v4-pro
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Yuhang.chen <yhchen312@gmail.com>
---
 .../admin-guide/kernel-parameters.txt         | 14 ++++++
 arch/riscv/kvm/vcpu.c                         | 44 ++++++++++++++++++-
 2 files changed, 57 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index b5493a7f8f22..ee6603b30033 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3254,6 +3254,20 @@ Kernel parameters
 
 			notrap: clear WFI instruction trap
 
+	kvm-riscv.wfi_trap_policy=
+			[KVM,RISCV] Control when to set the WFI instruction
+			trap for KVM VMs. When set, a VS-mode WFI traps into
+			KVM and is emulated; when clear, the guest executes
+			WFI natively and blocks until a VS-mode interrupt
+			(e.g. the sstc timer) is pending.
+
+			trap: set WFI instruction trap (HSTATUS.VTW=1)
+
+			notrap: clear WFI instruction trap (HSTATUS.VTW=0)
+
+			Defaults to trap, preserving the previous
+			unconditional behavior.
+
 	kvm_cma_resv_ratio=n [PPC,EARLY]
 			Reserves given percentage from system memory area for
 			contiguous memory allocation for KVM hash pagetable
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index c3672513b4e9..d50b47ed280e 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -12,6 +12,7 @@
 #include <linux/kdebug.h>
 #include <linux/module.h>
 #include <linux/percpu.h>
+#include <linux/string.h>
 #include <linux/vmalloc.h>
 #include <linux/sched/signal.h>
 #include <linux/fs.h>
@@ -26,6 +27,42 @@
 
 static DEFINE_PER_CPU(struct kvm_vcpu *, kvm_former_vcpu);
 
+/*
+ * WFI trap policy for VS-mode guests, controllable through the
+ * kvm-riscv.wfi_trap_policy= kernel command-line option.
+ */
+enum kvm_riscv_wfi_trap_policy {
+	KVM_RISCV_WFI_TRAP,	/* Default: trap VS-mode WFI into KVM */
+	KVM_RISCV_WFI_NOTRAP,	/* Let VS-mode WFI execute natively */
+};
+
+static enum kvm_riscv_wfi_trap_policy kvm_riscv_wfi_trap_policy __read_mostly =
+	KVM_RISCV_WFI_TRAP;
+
+static int __init early_kvm_riscv_wfi_trap_policy_cfg(char *arg)
+{
+	if (!arg)
+		return -EINVAL;
+
+	if (strcmp(arg, "trap") == 0) {
+		kvm_riscv_wfi_trap_policy = KVM_RISCV_WFI_TRAP;
+		return 0;
+	}
+
+	if (strcmp(arg, "notrap") == 0) {
+		kvm_riscv_wfi_trap_policy = KVM_RISCV_WFI_NOTRAP;
+		return 0;
+	}
+
+	return -EINVAL;
+}
+early_param("kvm-riscv.wfi_trap_policy", early_kvm_riscv_wfi_trap_policy_cfg);
+
+static bool kvm_riscv_vcpu_wfi_should_trap(struct kvm_vcpu *vcpu)
+{
+	return kvm_riscv_wfi_trap_policy == KVM_RISCV_WFI_TRAP;
+}
+
 const struct kvm_stats_desc kvm_vcpu_stats_desc[] = {
 	KVM_GENERIC_VCPU_STATS(),
 	STATS_DESC_COUNTER(VCPU, ecall_exit_stat),
@@ -73,7 +110,12 @@ static void kvm_riscv_vcpu_context_reset(struct kvm_vcpu *vcpu,
 	/* Setup reset state of shadow SSTATUS and HSTATUS CSRs */
 	cntx->sstatus = SR_SPP | SR_SPIE;
 
-	cntx->hstatus |= HSTATUS_VTW;
+	/*
+	 * Trap VS-mode WFI into KVM unless the WFI trap policy lets the guest
+	 * execute it natively. See kvm_riscv_wfi_trap_policy.
+	 */
+	if (kvm_riscv_vcpu_wfi_should_trap(vcpu))
+		cntx->hstatus |= HSTATUS_VTW;
 	cntx->hstatus |= HSTATUS_SPVP;
 	cntx->hstatus |= HSTATUS_SPV;
 }
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
