Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F60CC43458
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 18:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=r98kKpXjpQzamOfXTzixbMhPvb5H1442KqKwet9su5g=; b=UBIbcx79dUE7gF
	RTQNAODbEL5pYdpaUZ5gpXVWrUMe8AJj4TyMpPQ5ItiIqWU3puAL9z0gFpLvMHIfI/f9/A6OMfa/+
	fcWltilrYFPltEsF826XA6lPWwI0dJ0I9C3gTv1l4uc3wMJwpp1MwbBNt/z/XLLSJsRByuiYDRSn/
	ZbEd3Prc7a6xANVxng7+H72Bo8fipSSe1yxwV9+sj7fHPELKYpnVm1+4YIYNKoe0GWLBnNhiIN0L8
	z3A8uBLbF7oN7MfHQz2cjBKvth8vRSu4yC2KeVTqYnPHsslu/dqbPfFLL+rZ4H4AYWhe7CVqbBXKj
	vrAET3n+H2LREJhY0Luw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf003-00000002rT6-0C1j;
	Wed, 01 Jul 2026 18:49:31 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weywv-00000002k00-2G8Q
	for linux-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 17:42:15 +0000
Received: from kunlun.suse.cz (unknown [IPv6:2a07:de40:b306:2000::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AFCDA7160D;
	Wed,  1 Jul 2026 17:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782927730; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=g/9TqXZlX4/k/t2gPPoF6CqYPooDxdi7sERQrkUu8LM=;
	b=iDBM9TzyvbOUpRF/Gy8Fj0MyxLOfs7GgyI90fByLVsTdScqNvzOGbgxxDB7Tx2MqlpnWf3
	jZcQyX/gKXm7k40saZtUE2wUlpHmircLjUnMZAG372GE8bw7t9Crop81yIZzSFgYj/Qse9
	pUqz0auOFP6EZ8p7iF92mDlBxTcqOG8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782927730;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=g/9TqXZlX4/k/t2gPPoF6CqYPooDxdi7sERQrkUu8LM=;
	b=Zs9101jmnByN2sjws0Vmkh/Ak/fZjKvhrio71SUZPwhFbT+4/smF96zvR5e4qQrdR/9hrU
	I6T0I0HMCd/ONyCA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=KlfNxGQE;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Dk0Db3Eo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782927729; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=g/9TqXZlX4/k/t2gPPoF6CqYPooDxdi7sERQrkUu8LM=;
	b=KlfNxGQEE3lxY2h4GpOynFhBYJhIteAgmhl14hmfG2CdvIrhxgVXPg2OgZY1rZxzDBZHrW
	tyiCCfn2F2rrUlh6nt45mviXAKruchryu7qEA7wustxBbiS0CavcdiCPhm+glCntFhWC3j
	RGhsBQ6Fw/KKc4/JaimttevyAZwp4fU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782927729;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=g/9TqXZlX4/k/t2gPPoF6CqYPooDxdi7sERQrkUu8LM=;
	b=Dk0Db3Eot3QLr3p04nq2JV8MC+CYJCa1GDtg3XP7QLn8PkuQ7JKTz5Q05HSsKz332JCaDs
	d1IOC1MYfL8tbPBQ==
Date: Wed, 1 Jul 2026 19:42:08 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Donnellan <andrew+kernel@donnellan.id.au>,
	Mark Rutland <mark.rutland@arm.com>,
	Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>,
	Arnd Bergmann <arnd@arndb.de>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mukesh Kumar Chaurasiya <mkchauras@linux.ibm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Zong Li <zong.li@sifive.com>, Nam Cao <namcao@linutronix.de>,
	Deepak Gupta <debug@rivosinc.com>,
	Lukas Gerlach <lukas.gerlach@cispa.de>,
	Rui Qi <qirui.001@bytedance.com>, Kees Cook <kees@kernel.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org
Subject: [RFC] entry: Untangle the return value of
 syscall_enter_from_user_mode from syscall NR
Message-ID: <akVRcPsD_R_CE1qW@kunlun.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
X-Rspamd-Action: add header
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [15.68 / 50.00];
	SPAM_FLAG(5.00)[];
	NEURAL_SPAM_LONG(3.50)[1.000];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_SPAM_SHORT(2.99)[0.995];
	HFILTER_HOSTNAME_UNKNOWN(2.50)[];
	RDNS_NONE(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ONCE_RECEIVED(1.20)[];
	HFILTER_HELO_IP_A(1.00)[kunlun.suse.cz];
	DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[kunlun.suse.cz];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[46];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b306:2000::2:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b306:2000::2:from];
	RCVD_COUNT_ZERO(0.00)[0];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TAGGED_RCPT(0.00)[kernel];
	R_RATELIMIT(0.00)[to_ip_from(RLdf7cthttnq1gm73yfn4rmqgr)];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_CC(0.00)[lwn.net,linuxfoundation.org,kernel.org,xen0n.name,linux.ibm.com,ellerman.id.au,gmail.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,donnellan.id.au,arm.com,suse.de,arndb.de,flygoat.com,sifive.com,linutronix.de,rivosinc.com,cispa.de,bytedance.com,vger.kernel.org,lists.linux.dev,lists.ozlabs.org,lists.infradead.org];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,kunlun.suse.cz:helo,kunlun.suse.cz:mid]
X-Spamd-Bar: +++++++++++++++
X-Rspamd-Queue-Id: AFCDA7160D
X-Spam: Yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_104213_890086_87613CF8 
X-CRM114-Status: GOOD (  26.01  )
X-Mailman-Approved-At: Wed, 01 Jul 2026 11:49:29 -0700
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The return value of syscall_enter_from_user_mode is used both for the
adjusted syscall number and the indicator that a syscall should be
skipped.

As seccomp can be invoked on any syscall, including invalid ones this
somewhat undermines seccomp.

While the seccomp variants that terminate the process do not need to
care about this for the filter that sets the syscall return value this
disctinction is required.

Pass the syscall number as a pointer to the inline entry functions, and
use the return value exclusively for the indication that the syscall is
already handled.

This should avoid the need for the s390 PIF_SYSCALL_RET_SET which is the
workaround for exactly this deficiency.

If this is desirable the patch could be split into some series that
adjusts the code flow where needed so that the final change is mostly
mechanical.

There is also another way to handle this problem.

With x86 using bit 30 to denote compatibility syscall it sounds like
declaring syscall number a 30bit quantity would work.

Then bit 31 could be used to denote an invalid syscall that can never be
executed, and the -1 returned from syscall_enter_from_user_mode would
then be inherently invalid.

That is so long as no architectures use syscall numbers outside of this
range so far, and the limitation is considered fine.

Signed-off-by: Michal Such=E1nek <msuchanek@suse.de>
---
 Documentation/core-api/entry.rst | 12 ++++++----
 arch/loongarch/kernel/syscall.c  |  6 ++---
 arch/powerpc/kernel/syscall.c    |  3 ++-
 arch/riscv/kernel/traps.c        |  6 ++---
 arch/s390/kernel/syscall.c       |  6 ++---
 arch/x86/entry/syscall_32.c      | 39 +++++++++++++++-----------------
 arch/x86/entry/syscall_64.c      | 19 ++++++++--------
 include/linux/entry-common.h     | 38 ++++++++++++++-----------------
 8 files changed, 63 insertions(+), 66 deletions(-)

diff --git a/Documentation/core-api/entry.rst b/Documentation/core-api/entr=
y.rst
index 71d8eedc0549..b0bfae31fe7c 100644
--- a/Documentation/core-api/entry.rst
+++ b/Documentation/core-api/entry.rst
@@ -68,12 +68,14 @@ invoked from low-level assembly code looks like this:
   noinstr void syscall(struct pt_regs *regs, int nr)
   {
 	arch_syscall_enter(regs);
-	nr =3D syscall_enter_from_user_mode(regs, nr);
 =

-	instrumentation_begin();
-	if (!invoke_syscall(regs, nr) && nr !=3D -1)
-	 	result_reg(regs) =3D __sys_ni_syscall(regs);
-	instrumentation_end();
+	/* Skip syscall when -1 is returned */
+	if (!syscall_enter_from_user_mode(regs, &nr)) {
+		instrumentation_begin();
+		if (!invoke_syscall(regs, nr) && nr !=3D -1)
+			result_reg(regs) =3D __sys_ni_syscall(regs);
+		instrumentation_end();
+	}
 =

 	syscall_exit_to_user_mode(regs);
   }
diff --git a/arch/loongarch/kernel/syscall.c b/arch/loongarch/kernel/syscal=
l.c
index 94c1c3b5b0b5..fc18ac56b91c 100644
--- a/arch/loongarch/kernel/syscall.c
+++ b/arch/loongarch/kernel/syscall.c
@@ -58,7 +58,7 @@ typedef long (*sys_call_fn)(unsigned long, unsigned long,
 =

 void noinstr __no_stack_protector do_syscall(struct pt_regs *regs)
 {
-	unsigned long nr;
+	unsigned long nr, ret;
 	sys_call_fn syscall_fn;
 =

 	nr =3D regs->regs[11];
@@ -70,11 +70,11 @@ void noinstr __no_stack_protector do_syscall(struct pt_=
regs *regs)
 	regs->orig_a0 =3D regs->regs[4];
 	regs->regs[4] =3D -ENOSYS;
 =

-	nr =3D syscall_enter_from_user_mode(regs, nr);
+	ret =3D syscall_enter_from_user_mode(regs, &nr);
 =

 	add_random_kstack_offset();
 =

-	if (nr < NR_syscalls) {
+	if (nr < NR_syscalls && !ret) {
 		syscall_fn =3D sys_call_table[array_index_nospec(nr, NR_syscalls)];
 		regs->regs[4] =3D syscall_fn(regs->orig_a0, regs->regs[5], regs->regs[6],
 					   regs->regs[7], regs->regs[8], regs->regs[9]);
diff --git a/arch/powerpc/kernel/syscall.c b/arch/powerpc/kernel/syscall.c
index a9da2af6efa8..45d11d518c51 100644
--- a/arch/powerpc/kernel/syscall.c
+++ b/arch/powerpc/kernel/syscall.c
@@ -20,7 +20,8 @@ notrace long system_call_exception(struct pt_regs *regs, =
unsigned long r0)
 	syscall_fn f;
 =

 	add_random_kstack_offset();
-	r0 =3D syscall_enter_from_user_mode(regs, r0);
+	if (unlikely(syscall_enter_from_user_mode(regs, &r0)))
+		return syscall_get_error(current, regs);
 =

 	if (unlikely(r0 >=3D NR_syscalls)) {
 		if (unlikely(trap_is_unsupported_scv(regs))) {
diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index 8c62c771a656..9326a4a50696 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -325,7 +325,7 @@ asmlinkage __visible __trap_section  __no_stack_protect=
or
 void do_trap_ecall_u(struct pt_regs *regs)
 {
 	if (user_mode(regs)) {
-		long syscall =3D regs->a7;
+		long ret, syscall =3D regs->a7;
 =

 		regs->epc +=3D 4;
 		regs->orig_a0 =3D regs->a0;
@@ -333,11 +333,11 @@ void do_trap_ecall_u(struct pt_regs *regs)
 =

 		riscv_v_vstate_discard(regs);
 =

-		syscall =3D syscall_enter_from_user_mode(regs, syscall);
+		ret =3D syscall_enter_from_user_mode(regs, &syscall);
 =

 		add_random_kstack_offset();
 =

-		if (syscall >=3D 0 && syscall < NR_syscalls) {
+		if (syscall >=3D 0 && syscall < NR_syscalls && !ret) {
 			syscall =3D array_index_nospec(syscall, NR_syscalls);
 			syscall_handler(regs, syscall);
 		}
diff --git a/arch/s390/kernel/syscall.c b/arch/s390/kernel/syscall.c
index 75d5a3cab14e..9e5b873c011d 100644
--- a/arch/s390/kernel/syscall.c
+++ b/arch/s390/kernel/syscall.c
@@ -95,7 +95,7 @@ SYSCALL_DEFINE0(ni_syscall)
 =

 void noinstr __do_syscall(struct pt_regs *regs, int per_trap)
 {
-	unsigned long nr;
+	unsigned long nr, ret;
 =

 	enter_from_user_mode(regs);
 	add_random_kstack_offset();
@@ -121,7 +121,7 @@ void noinstr __do_syscall(struct pt_regs *regs, int per=
_trap)
 		regs->psw.addr =3D current->restart_block.arch_data;
 		current->restart_block.arch_data =3D 1;
 	}
-	nr =3D syscall_enter_from_user_mode_work(regs, nr);
+	ret =3D syscall_enter_from_user_mode_work(regs, &nr);
 	/*
 	 * In the s390 ptrace ABI, both the syscall number and the return value
 	 * use gpr2. However, userspace puts the syscall number either in the
@@ -129,7 +129,7 @@ void noinstr __do_syscall(struct pt_regs *regs, int per=
_trap)
 	 * work, the ptrace code sets PIF_SYSCALL_RET_SET, which is checked here
 	 * and if set, the syscall will be skipped.
 	 */
-	if (unlikely(test_and_clear_pt_regs_flag(regs, PIF_SYSCALL_RET_SET)))
+	if (unlikely(test_and_clear_pt_regs_flag(regs, PIF_SYSCALL_RET_SET) || re=
t))
 		goto out;
 	regs->gprs[2] =3D -ENOSYS;
 	if (likely(nr < NR_syscalls)) {
diff --git a/arch/x86/entry/syscall_32.c b/arch/x86/entry/syscall_32.c
index 31b9492fe851..525e99691b31 100644
--- a/arch/x86/entry/syscall_32.c
+++ b/arch/x86/entry/syscall_32.c
@@ -128,7 +128,7 @@ static __always_inline bool int80_is_external(void)
  */
 __visible noinstr void do_int80_emulation(struct pt_regs *regs)
 {
-	int nr;
+	long nr;
 =

 	/* Kernel does not use INT $0x80! */
 	if (unlikely(!user_mode(regs))) {
@@ -168,8 +168,7 @@ __visible noinstr void do_int80_emulation(struct pt_reg=
s *regs)
 	nr =3D syscall_32_enter(regs);
 =

 	local_irq_enable();
-	nr =3D syscall_enter_from_user_mode_work(regs, nr);
-	do_syscall_32_irqs_on(regs, nr);
+	syscall_enter_from_user_mode_work(regs, &nr);
 =

 	instrumentation_end();
 	syscall_exit_to_user_mode(regs);
@@ -208,7 +207,7 @@ __visible noinstr void do_int80_emulation(struct pt_reg=
s *regs)
  */
 DEFINE_FREDENTRY_RAW(int80_emulation)
 {
-	int nr;
+	long nr;
 =

 	enter_from_user_mode(regs);
 =

@@ -232,8 +231,10 @@ DEFINE_FREDENTRY_RAW(int80_emulation)
 	nr =3D syscall_32_enter(regs);
 =

 	local_irq_enable();
-	nr =3D syscall_enter_from_user_mode_work(regs, nr);
-	do_syscall_32_irqs_on(regs, nr);
+	if (!syscall_enter_from_user_mode_work(regs, &nr)) {
+		nr &=3D GENMASK(31, 0);
+		do_syscall_32_irqs_on(regs, nr);
+	}
 =

 	instrumentation_end();
 	syscall_exit_to_user_mode(regs);
@@ -245,20 +246,17 @@ DEFINE_FREDENTRY_RAW(int80_emulation)
 /* Handles int $0x80 on a 32bit kernel */
 __visible noinstr void do_int80_syscall_32(struct pt_regs *regs)
 {
-	int nr =3D syscall_32_enter(regs);
-
-	/*
-	 * Subtlety here: if ptrace pokes something larger than 2^31-1 into
-	 * orig_ax, the int return value truncates it. This matches
-	 * the semantics of syscall_get_nr().
-	 */
-	nr =3D syscall_enter_from_user_mode(regs, nr);
-	instrumentation_begin();
+	long nr =3D syscall_32_enter(regs);
 =

 	add_random_kstack_offset();
-	do_syscall_32_irqs_on(regs, nr);
+	if (!syscall_enter_from_user_mode(regs, &nr)) {
+		instrumentation_begin();
 =

-	instrumentation_end();
+		nr &=3D & GENMASK(31, 0);
+		do_syscall_32_irqs_on(regs, nr);
+
+		instrumentation_end();
+	}
 	syscall_exit_to_user_mode(regs);
 }
 #endif /* !CONFIG_IA32_EMULATION */
@@ -301,10 +299,9 @@ static noinstr bool __do_fast_syscall_32(struct pt_reg=
s *regs)
 		return false;
 	}
 =

-	nr =3D syscall_enter_from_user_mode_work(regs, nr);
-
-	/* Now this is just like a normal syscall. */
-	do_syscall_32_irqs_on(regs, nr);
+	if (!syscall_enter_from_user_mode_work(regs, &nr))
+		/* Now this is just like a normal syscall. */
+		do_syscall_32_irqs_on(regs, nr);
 =

 	instrumentation_end();
 	syscall_exit_to_user_mode(regs);
diff --git a/arch/x86/entry/syscall_64.c b/arch/x86/entry/syscall_64.c
index 71f032504e73..3400c2f43a62 100644
--- a/arch/x86/entry/syscall_64.c
+++ b/arch/x86/entry/syscall_64.c
@@ -84,19 +84,20 @@ static __always_inline bool do_syscall_x32(struct pt_re=
gs *regs, int nr)
 }
 =

 /* Returns true to return using SYSRET, or false to use IRET */
-__visible noinstr bool do_syscall_64(struct pt_regs *regs, int nr)
+__visible noinstr bool do_syscall_64(struct pt_regs *regs, long nr)
 {
-	nr =3D syscall_enter_from_user_mode(regs, nr);
-
-	instrumentation_begin();
 	add_random_kstack_offset();
+	if (!syscall_enter_from_user_mode(regs, &nr)) {
 =

-	if (!do_syscall_x64(regs, nr) && !do_syscall_x32(regs, nr) && nr !=3D -1)=
 {
-		/* Invalid system call, but still a system call. */
-		regs->ax =3D __x64_sys_ni_syscall(regs);
-	}
+		instrumentation_begin();
 =

-	instrumentation_end();
+		if (!do_syscall_x64(regs, nr) && !do_syscall_x32(regs, nr)) {
+			/* Invalid system call, but still a system call. */
+			regs->ax =3D __x64_sys_ni_syscall(regs);
+		}
+
+		instrumentation_end();
+	}
 	syscall_exit_to_user_mode(regs);
 =

 	/*
diff --git a/include/linux/entry-common.h b/include/linux/entry-common.h
index 416a3352261f..4991071d01fe 100644
--- a/include/linux/entry-common.h
+++ b/include/linux/entry-common.h
@@ -69,10 +69,8 @@ static inline void syscall_enter_audit(struct pt_regs *r=
egs, long syscall)
 	}
 }
 =

-static __always_inline long syscall_trace_enter(struct pt_regs *regs, unsi=
gned long work)
+static __always_inline long syscall_trace_enter(struct pt_regs *regs, unsi=
gned long work, unsigned long *syscall)
 {
-	long syscall, ret =3D 0;
-
 	/*
 	 * Handle Syscall User Dispatch.  This must comes first, since
 	 * the ABI here can be something that doesn't make sense for
@@ -93,27 +91,25 @@ static __always_inline long syscall_trace_enter(struct =
pt_regs *regs, unsigned l
 =

 	/* Handle ptrace */
 	if (work & (SYSCALL_WORK_SYSCALL_TRACE | SYSCALL_WORK_SYSCALL_EMU)) {
-		ret =3D arch_ptrace_report_syscall_entry(regs);
-		if (ret || (work & SYSCALL_WORK_SYSCALL_EMU))
+		if (arch_ptrace_report_syscall_entry(regs) || (work & SYSCALL_WORK_SYSCA=
LL_EMU))
 			return -1L;
 	}
 =

 	/* Do seccomp after ptrace, to catch any tracer changes. */
 	if (work & SYSCALL_WORK_SECCOMP) {
-		ret =3D __secure_computing();
-		if (ret =3D=3D -1L)
-			return ret;
+		if (__secure_computing())
+			return -1L;
 	}
 =

 	/* Either of the above might have changed the syscall number */
-	syscall =3D syscall_get_nr(current, regs);
+	*syscall =3D syscall_get_nr(current, regs);
 =

 	if (unlikely(work & SYSCALL_WORK_SYSCALL_TRACEPOINT))
-		syscall =3D trace_syscall_enter(regs, syscall);
+		*syscall =3D trace_syscall_enter(regs, *syscall);
 =

-	syscall_enter_audit(regs, syscall);
+	syscall_enter_audit(regs, *syscall);
 =

-	return ret ? : syscall;
+	return 0;
 }
 =

 /**
@@ -126,12 +122,12 @@ static __always_inline long syscall_trace_enter(struc=
t pt_regs *regs, unsigned l
  * enabled after invoking enter_from_user_mode(), enabling interrupts and
  * extra architecture specific work.
  *
- * Returns: The original or a modified syscall number
+ * Returns: The original or a modified syscall number as syscall
  *
- * If the returned syscall number is -1 then the syscall should be
- * skipped. In this case the caller may invoke syscall_set_error() or
- * syscall_set_return_value() first.  If neither of those are called and -1
- * is returned, then the syscall will fail with ENOSYS.
+ * If the returned value is -1 then the syscall should be skipped. In this=
 case
+ * the caller may invoke syscall_set_error() or syscall_set_return_value()
+ * first.  If neither of those are called and -1 is returned, then the sys=
call
+ * will fail with ENOSYS.
  *
  * It handles the following work items:
  *
@@ -139,14 +135,14 @@ static __always_inline long syscall_trace_enter(struc=
t pt_regs *regs, unsigned l
  *     ptrace_report_syscall_entry(), __secure_computing(), trace_sys_ente=
r()
  *  2) Invocation of audit_syscall_entry()
  */
-static __always_inline long syscall_enter_from_user_mode_work(struct pt_re=
gs *regs, long syscall)
+static __always_inline long syscall_enter_from_user_mode_work(struct pt_re=
gs *regs, long *syscall)
 {
 	unsigned long work =3D READ_ONCE(current_thread_info()->syscall_work);
 =

 	if (work & SYSCALL_WORK_ENTER)
-		syscall =3D syscall_trace_enter(regs, work);
+		return syscall_trace_enter(regs, work, syscall);
 =

-	return syscall;
+	return 0;
 }
 =

 /**
@@ -167,7 +163,7 @@ static __always_inline long syscall_enter_from_user_mod=
e_work(struct pt_regs *re
  * Returns: The original or a modified syscall number. See
  * syscall_enter_from_user_mode_work() for further explanation.
  */
-static __always_inline long syscall_enter_from_user_mode(struct pt_regs *r=
egs, long syscall)
+static __always_inline long syscall_enter_from_user_mode(struct pt_regs *r=
egs, long *syscall)
 {
 	long ret;
 =

-- =

2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
