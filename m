Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C26C43458
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 07:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ClwpYeurl7xDehqZATvvavVhHPL360jXmZ8YbCbtCzQ=; b=BhFMS0N1iQ2kIW
	Q1Nm11Of2ld1N+bMUdeWqlstA654EZVOXPHK3Qmc0RsLfbyYrxOWSJZltSFafBSBKFCA77YGv3JVP
	exliZQMWoADLkHjD5UOB1zsKGWk2IosqKbsmm6YglYuLyWEsj23j25z6vWcx3f0UUjDqfHc1vFUQV
	ZjjvjZuocGhll6wcS0uF1CLcgcxMdYs8b3e9uSuuL1vXjMKo41F61PxOE3ZCHGKFei/xMraeCEMKJ
	8GDeD+mAjkLVyN9N+KAXx/2koeMZqatIX/QhocnkuATGGV5ACCdn+XLxLmkhYn3yVyMZmgPQOX06y
	QuJF80KAhiqxUJEwXKDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjAg2-00000008Jzm-0Qc0;
	Mon, 13 Jul 2026 07:02:06 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjAfz-00000008JyK-2ne1
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jul 2026 07:02:05 +0000
Date: Mon, 13 Jul 2026 09:01:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1783926118;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gnmxNdHqKoh6xuYofsr73YiT+W94DI4jpIiM80uad1k=;
	b=xuFdla/6ifWVxs+wZ/ziKIXPwTG8sNl1CvOxpSkj7lA5470k6wTgjpeu7/nlRL+oihS2Qs
	JADuHCTtvX5KsRBE+2BwukLfzUJWDi3WmNcefXD07sqWlxw7cq54WE1/rhAb0H08RGTG54
	NKVh6zGp+juLKf0xn/ZZ/iHAUAMgZL1Gz+AEf4FCljbY9Gs2UrRNV9CQfA9ZnvX7iuY/CR
	+eH0hO+UwyFjJgLhe6cGdJg9VIHjkyqxDiQcyzD1kAE21gJQJA90gnhj4aClj+bpR70P1/
	PyuEkKpTBKkI7DGLCZkpzwWyVeBOFCXJejv6p2QBYbd8qAfd3VxT9OjpsNrVgw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1783926118;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gnmxNdHqKoh6xuYofsr73YiT+W94DI4jpIiM80uad1k=;
	b=cXVv1a5zXQlrcFC6I4GHPNC9QKNeWn00sP2uqrUVvBJohK68NTBxPt4JyPk2bcommOIhMi
	q3BAQe+PJhx4WPDw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: chenhuacai@kernel.org, kernel@xen0n.name, maddy@linux.ibm.com, 
	mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, hca@linux.ibm.com, 
	gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com, 
	svens@linux.ibm.com, tglx@kernel.org, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, hpa@zytor.com, nathan@kernel.org, kees@kernel.org, 
	xur@google.com, arnd@arndb.de, peterz@infradead.org, gourry@gourry.net, 
	lukas.bulwahn@redhat.com, ryan.roberts@arm.com, yangtiezhu@loongson.cn, 
	mchauras@linux.ibm.com, sshegde@linux.ibm.com, austin.kim@lge.com, jchrist@linux.ibm.com, 
	x86@kernel.org, linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH RESEND] syscall_user_dispatch: Introduce
 ARCH_SUPPORTS_SYSCALL_USER_DISPATCH
Message-ID: <20260713085930-c6e454ac-cb4d-4016-8971-49df521e1d8d@linutronix.de>
References: <20260713035422.582771-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260713035422.582771-1-ruanjinjie@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_000203_854066_8B975E04 
X-CRM114-Status: UNSURE (   9.72  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jul 13, 2026 at 11:54:22AM +0800, Jinjie Ruan wrote:
> Currently, only x86 genuinely implements and supports Syscall User
> Dispatch (SUD). Multiple architectures provide a stub
> arch_syscall_is_vdso_sigreturn() returning 'false' simply to satisfy
> GENERIC_ENTRY compilation, which creates a false impression of feature
> support.
> =

> Introduce ARCH_SUPPORTS_SYSCALL_USER_DISPATCH to decouple this mechanism
> from GENERIC_ENTRY. Select it exclusively on x86 and remove the redundant
> stub functions from other architectures.
> =

> Link: https://lore.kernel.org/linux-arm-kernel/akZgV0Y4YAmB43_g@J2N7QTR9R=
3.cambridge.arm.com/
> Cc: Thomas Gleixner <tglx@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Gregory Price <gourry@gourry.net>
> Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Cc: Thomas Wei=DFschuh <thomas.weissschuh@linutronix.de>
> Suggested-by: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Reviewed-by: Thomas Wei=DFschuh <thomas.weissschuh@linutronix.de>

> ---
> v1 -> RESEND
> - Define missing ARCH_SUPPORTS_SYSCALL_USER_DISPATCH.

If code is changed it is not a resend. Instead it should have been v2.

> ---
>  arch/Kconfig                         | 4 ++++
>  arch/loongarch/include/asm/syscall.h | 6 ------
>  arch/powerpc/include/asm/syscall.h   | 5 -----
>  arch/riscv/include/asm/syscall.h     | 5 -----
>  arch/s390/include/asm/syscall.h      | 5 -----
>  arch/x86/Kconfig                     | 1 +
>  6 files changed, 5 insertions(+), 21 deletions(-)

(...)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
