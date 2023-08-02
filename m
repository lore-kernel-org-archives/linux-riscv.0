Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09D28C04E69
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 16:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SDcpaWwgU4HX3WVs4cS1CPlDjL4xA2lFIKplQ7TF9rs=; b=n27s5gvptCYW8x
	kwUXm4u7kmHrh/O+hoSi+MidnvIqHf67lBWpt39buwb7GTgAW2765T33tNVPUX/skdFRZONkKJfRf
	kHxzLkT4d6X6nhQi/YKQ001YHcuz6Arkc0muDXQseM5YwUU8bcWMJ9aucGF3ac/FuO7gibbb3ynB3
	37oDCUlnDajEfeWOlKpImM484zuYmSbleSQRTkGjmmz7vQaq7xvPUEW336qcLVjtTd73wuxgJ6FfK
	gYE08yMNDxR5IGrp10rSn1LLqm/47sAuEQXA0bkOINLvc21PGGFWUd/Q9Cuei4TB+o0iu3VOrhzo1
	2BwyEZofiu9+JXtz8WKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRF3r-005PEA-1h;
	Wed, 02 Aug 2023 16:50:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRF3o-005PCF-1t
	for linux-riscv@lists.infradead.org;
	Wed, 02 Aug 2023 16:50:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E6CB561909;
	Wed,  2 Aug 2023 16:50:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C843C433C8;
	Wed,  2 Aug 2023 16:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690995055;
	bh=Ex6OYX3JGNnUHd85CnRKWsm8lmD+bGAwdtplvxxj8PY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=um7BNA7itHG6dHP1/TJ2qBnWLjq8LpHkLPRfh1qtGRbNzY7ZAXLFTcYLA+tJ6mLLP
	 jKEjkHopqqvN+oHeq15IcuNa1QsUbkSzrWjKAT649fqQW0PuY/YQ88ATN23zqp/W/7
	 ThJSk6zBrbelucVEcgJ2wvGt3ZI1/ZpuTm/yvaQP8PajaVwGcVRMnHlM+LlFwPd9XO
	 uQwO0jbLuHeszx11KXEt6scpahkYLC+c19wzJR8sVOlcF/PbRo/yUHnKdSgpxrwXmH
	 3zvGNqg+OtbF1LKbaLWUWXqGWaXGQEWygJ9D7So5hpuqI7YGXBR91UK6+tb74VvBC9
	 Hz1m3QjgRrJ+Q==
From: guoren@kernel.org
To: paul.walmsley@sifive.com,
	anup@brainfault.org,
	peterz@infradead.org,
	mingo@redhat.com,
	will@kernel.org,
	palmer@rivosinc.com,
	longman@redhat.com,
	boqun.feng@gmail.com,
	tglx@linutronix.de,
	paulmck@kernel.org,
	rostedt@goodmis.org,
	rdunlap@infradead.org,
	catalin.marinas@arm.com,
	conor.dooley@microchip.com,
	xiaoguang.xing@sophgo.com,
	bjorn@rivosinc.com,
	alexghiti@rivosinc.com,
	keescook@chromium.org,
	greentime.hu@sifive.com,
	ajones@ventanamicro.com,
	jszhang@kernel.org,
	wefu@redhat.com,
	wuwei2016@iscas.ac.cn
Cc: linux-arch@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	linux-csky@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH V10 12/19] RISC-V: paravirt: pvqspinlock: Add nopvspin kernel parameter
Date: Wed,  2 Aug 2023 12:46:54 -0400
Message-Id: <20230802164701.192791-13-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20230802164701.192791-1-guoren@kernel.org>
References: <20230802164701.192791-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_095056_694026_1F86149F 
X-CRM114-Status: GOOD (  10.67  )
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

From: Guo Ren <guoren@linux.alibaba.com>

Disables the qspinlock slow path using PV optimizations which
allow the hypervisor to 'idle' the guest on lock contention.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 Documentation/admin-guide/kernel-parameters.txt |  2 +-
 arch/riscv/kernel/paravirt.c                    | 13 +++++++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index de6b7ee752cd..1a8878f6bfbd 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3820,7 +3820,7 @@
 			as generic guest with no PV drivers. Currently support
 			XEN HVM, KVM, HYPER_V and VMWARE guest.
 
-	nopvspin	[X86,XEN,KVM]
+	nopvspin	[X86,XEN,KVM,RISC-V]
 			Disables the qspinlock slow path using PV optimizations
 			which allow the hypervisor to 'idle' the guest on lock
 			contention.
diff --git a/arch/riscv/kernel/paravirt.c b/arch/riscv/kernel/paravirt.c
index 1bacb2cf3872..b55c3d3c0c17 100644
--- a/arch/riscv/kernel/paravirt.c
+++ b/arch/riscv/kernel/paravirt.c
@@ -165,8 +165,21 @@ DEFINE_STATIC_CALL(pv_queued_spin_unlock, native_queued_spin_unlock);
 EXPORT_SYMBOL(__SCK__pv_queued_spin_lock_slowpath);
 EXPORT_SYMBOL(__SCK__pv_queued_spin_unlock);
 
+static bool nopvspin;
+static __init int parse_nopvspin(char *arg)
+{
+       nopvspin = true;
+       return 0;
+}
+early_param("nopvspin", parse_nopvspin);
+
 void __init pv_qspinlock_init(void)
 {
+	if (nopvspin) {
+		pr_info("PV qspinlocks disabled\n");
+		return;
+	}
+
 	if (num_possible_cpus() == 1)
 		return;
 
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
