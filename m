Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDBFEC47073
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Dec 2023 12:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ma0tQ0J4adfBxg7CYiwhsZ8XKQg9sbPAUgi1Z/ddA5A=; b=M7xAwWybu7NQP0
	4cMret1unxek8sX4JSawbq0RG8I3Yi+JmvM6EzlWEwSOOMjPXkJ+N5h/00fENCOHGBOD7LNKp44gD
	zMUW3AW1qpkYgY0OIQEwsUycy01BsvzWGebjN9EWAll736AS0MQZfehmpWOJ3OO0/LL7MzCGVnsxO
	k/5q/988tlJpTRxivKoU6YfuaAa+C/FaPI7UAq64B6EHea7jEjcP5pwAJ0upnQ/ANozv9TXtOvkS3
	cXRa3u+dT45Cb9MivfLY4fB+8vxH+OFb5cUoxkj9JXnc0Z0FijRKqBT1RAYiNOXik3bni/IHZK6OI
	aA2hodtIAt1vX3UtrWig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rHkYe-00AsUn-2i;
	Mon, 25 Dec 2023 12:59:48 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rHkYb-00AsPv-0P
	for linux-riscv@lists.infradead.org;
	Mon, 25 Dec 2023 12:59:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C0FEDCE0E89;
	Mon, 25 Dec 2023 12:59:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4605CC433C9;
	Mon, 25 Dec 2023 12:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703509181;
	bh=eTLon+HIxwFMbvdezleTBTpFzqzzZBcJdHF+vuZfDLk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jEIOj0EtbPA5/QvSmWlPD9LzcwSuEHnkJ7E5jKdiCW2nsqGhk/EGY7sd4FOPjfkP5
	 W/DR9oFO2xUVZkLvoqISc4EgWMebHjhg+n2mVezvN0uwdYFGB2PfZfyzTZkdFB7Xgf
	 1HZyxM3+DuKCy8Euzc/wQ4gKAAo/5vsWey1tgNeyuWAm2JJ7h79rTe2F/QjR4+n9VA
	 Zn9obPY4be/cIIcaaPFNAQPbhy6JH50OVLJucvd1nrTPXjmoPiN0bXCH9dcrhv2cVY
	 QN2+sBLHZ6/N1gItlVGl9rfs3klk5J98L2+e+Sz45Nk81pHAUi/WnBTggDjs/D562M
	 Yr5IemZ/2vcWw==
From: guoren@kernel.org
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	guoren@kernel.org,
	panqinglin2020@iscas.ac.cn,
	bjorn@rivosinc.com,
	conor.dooley@microchip.com,
	leobras@redhat.com,
	peterz@infradead.org,
	anup@brainfault.org,
	keescook@chromium.org,
	wuwei2016@iscas.ac.cn,
	xiaoguang.xing@sophgo.com,
	chao.wei@sophgo.com,
	unicorn_wang@outlook.com,
	uwu@icenowy.me,
	jszhang@kernel.org,
	wefu@redhat.com,
	atishp@atishpatra.org
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V12 08/14] riscv: qspinlock: Force virt_spin_lock for KVM guests
Date: Mon, 25 Dec 2023 07:58:41 -0500
Message-Id: <20231225125847.2778638-9-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231225125847.2778638-1-guoren@kernel.org>
References: <20231225125847.2778638-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231225_045945_899069_12140F72 
X-CRM114-Status: GOOD (  10.16  )
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

Force to enable virt_spin_lock when KVM guest, because fair locks
have horrible lock 'holder' preemption issues.

Suggested-by: Leonardo Bras <leobras@redhat.com>
Link: https://lkml.kernel.org/kvm/ZQK9-tn2MepXlY1u@redhat.com/
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/include/asm/sbi.h | 8 ++++++++
 arch/riscv/kernel/sbi.c      | 2 +-
 arch/riscv/kernel/setup.c    | 6 +++++-
 3 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 0892f4421bc4..8f748d9e1b85 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -51,6 +51,13 @@ enum sbi_ext_base_fid {
 	SBI_EXT_BASE_GET_MIMPID,
 };
 
+enum sbi_ext_base_impl_id {
+	SBI_EXT_BASE_IMPL_ID_BBL = 0,
+	SBI_EXT_BASE_IMPL_ID_OPENSBI,
+	SBI_EXT_BASE_IMPL_ID_XVISOR,
+	SBI_EXT_BASE_IMPL_ID_KVM,
+};
+
 enum sbi_ext_time_fid {
 	SBI_EXT_TIME_SET_TIMER = 0,
 };
@@ -276,6 +283,7 @@ int sbi_console_getchar(void);
 long sbi_get_mvendorid(void);
 long sbi_get_marchid(void);
 long sbi_get_mimpid(void);
+long sbi_get_firmware_id(void);
 void sbi_set_timer(uint64_t stime_value);
 void sbi_shutdown(void);
 void sbi_send_ipi(unsigned int cpu);
diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index 5a62ed1da453..4330aedf65fd 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -543,7 +543,7 @@ static inline long sbi_get_spec_version(void)
 	return __sbi_base_ecall(SBI_EXT_BASE_GET_SPEC_VERSION);
 }
 
-static inline long sbi_get_firmware_id(void)
+long sbi_get_firmware_id(void)
 {
 	return __sbi_base_ecall(SBI_EXT_BASE_GET_IMP_ID);
 }
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 0bafb9fd6ea3..e33430e9d97e 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -281,6 +281,9 @@ DEFINE_STATIC_KEY_TRUE(virt_spin_lock_key);
 
 static void __init virt_spin_lock_init(void)
 {
+	if (sbi_get_firmware_id() != SBI_EXT_BASE_IMPL_ID_KVM)
+		no_virt_spin = true;
+
 	if (no_virt_spin)
 		static_branch_disable(&virt_spin_lock_key);
 	else
@@ -290,7 +293,8 @@ static void __init virt_spin_lock_init(void)
 
 static void __init riscv_spinlock_init(void)
 {
-	if (!enable_qspinlock) {
+	if ((!enable_qspinlock) &&
+	    (sbi_get_firmware_id() != SBI_EXT_BASE_IMPL_ID_KVM)) {
 		static_branch_disable(&combo_qspinlock_key);
 		pr_info("Ticket spinlock: enabled\n");
 	} else {
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
