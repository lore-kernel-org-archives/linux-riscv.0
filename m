Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 427C3EE14D8
	for <linux-riscv@archiver.kernel.org>; Sun, 10 Sep 2023 08:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LuajlP2nHwKKM1w8IQmMyVVIXz99s9SvKnebTNVbn7o=; b=IyxoPrHxUKyiDj
	4c3pZuBEGMyvOLtMuH/+Eb0TX66BsUmbs7kXEIBlKhoOGPvTGpcCWH0uN9C3rOSb/wBTedDllxGl1
	jdzXIhASL/IWU7n2qZk4kAxt0ceomsCuUZiZ6UH2ZFO49SnFQw2zUNgPROET9hH2K4IUriq+cEnas
	S/EtgO3amT1FfOGaGDqdJB77npytipi2KglrUBuMRz4mVctjKp0iK2CygqeCMlo2gcvn2Yo+uqgdk
	kIU113YARVr+R7au0XbNYyFuHR+F3O5j9WK+P2cBiXk8TsDiX8ZhSWo7RKblsw2D3qDXSAFJKd9Xo
	fQdn4EpP1kT4plUSySSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfFqn-00GI62-1c;
	Sun, 10 Sep 2023 08:31:25 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfFql-00GI4B-0f
	for linux-riscv@lists.infradead.org;
	Sun, 10 Sep 2023 08:31:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id DA060B80AFA;
	Sun, 10 Sep 2023 08:31:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B287C433B7;
	Sun, 10 Sep 2023 08:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694334680;
	bh=PlD8W8FqmIw1B4tEQBaEhpv4wvhKKufMUHFNMnWNSRc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gKuELwcQ4brAGVU9V37RxmhBlSvMSLPD/dRoPArB009I0S8ge7Qzu9JIIdscgSOKB
	 1uFBmbhBm8QCK8D6TxOAps/6OEtvE5z60y8GDzpz8AQ0OuYM9/xUgRzT/0KmV1feG8
	 UHja5oVgpTrr1CdaOFkK/1OFi22hCvQliP9mlonlc6B6bl8XfdQaJZUx49apuzOZZd
	 S7zQG6geh4EIutDJNDjS7LJPyP51UXHZSwHkPraqT5rqzCbeNf1Rcm8gDIUDelwV6H
	 7n16XaUkkhmp/UM5wwDJ86XKRzJvJkS1y+CoZMZMuWmvRtRhTx/rnJ6RWDDcCpu+8t
	 78WDq+gK1D9lg==
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
	wuwei2016@iscas.ac.cn,
	leobras@redhat.com
Cc: linux-arch@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	linux-csky@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH V11 12/17] RISC-V: paravirt: pvqspinlock: Add nopvspin kernel parameter
Date: Sun, 10 Sep 2023 04:29:06 -0400
Message-Id: <20230910082911.3378782-13-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20230910082911.3378782-1-guoren@kernel.org>
References: <20230910082911.3378782-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230910_013123_388783_BC8181F7 
X-CRM114-Status: GOOD (  10.51  )
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
 arch/riscv/kernel/qspinlock_paravirt.c          | 13 +++++++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index f75bedc50e00..e74aed631573 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3857,7 +3857,7 @@
 			as generic guest with no PV drivers. Currently support
 			XEN HVM, KVM, HYPER_V and VMWARE guest.
 
-	nopvspin	[X86,XEN,KVM]
+	nopvspin	[X86,XEN,KVM,RISC-V]
 			Disables the qspinlock slow path using PV optimizations
 			which allow the hypervisor to 'idle' the guest on lock
 			contention.
diff --git a/arch/riscv/kernel/qspinlock_paravirt.c b/arch/riscv/kernel/qspinlock_paravirt.c
index 85ff5a3ec234..a0ad4657f437 100644
--- a/arch/riscv/kernel/qspinlock_paravirt.c
+++ b/arch/riscv/kernel/qspinlock_paravirt.c
@@ -41,8 +41,21 @@ EXPORT_STATIC_CALL(pv_queued_spin_lock_slowpath);
 DEFINE_STATIC_CALL(pv_queued_spin_unlock, native_queued_spin_unlock);
 EXPORT_STATIC_CALL(pv_queued_spin_unlock);
 
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
