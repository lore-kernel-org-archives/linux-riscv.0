Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 448D8C43458
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2026 07:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=crFQmWugZUEws8YCKDixDM9u6D4Du30bOEtQQE9OBxM=; b=kKdofcQnP1bqOq
	7wSn35TR8XCXwecNXxbNlGD7aL4TzPWpvkJowdaRzGh5RkMmhzutUpY+emFj9aiL71aYwqLhMthhb
	HvII59r/vPLH0ejcMwpZ+Pd38AnlbzbGPoe5nlKdJyI77sf+iOfX07E3ihMn0IOtiUDCtrJnqSd1g
	Pl96FhrxtOPseC6akP31yLKo/MqJag71HyHGw0mlbKhll+kgIdLmkFRuhbV6+LgiQhRKlAJfPTCOm
	g1Ivpv7F1dlbPPSmcj+VXbNkNFQx+Gs6L5Hz2CZrMDmyfVplhLNDzU0tdB23uzD7m4ZkQGB3Ph1X9
	ibKkLXIqQBwZb1fF2/hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whjJE-00000001JgX-0WAe;
	Thu, 09 Jul 2026 07:36:36 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whjJB-00000001Jfd-3TNu
	for linux-riscv@lists.infradead.org;
	Thu, 09 Jul 2026 07:36:35 +0000
Date: Thu, 9 Jul 2026 09:36:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1783582589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fpSVJy70b3xqWnZXpAlUFJdEu5JY/bMxQLCNfbP622U=;
	b=g2iecoGHP1Q35gwzozGqpuJ0N4IBF+7Mb6UtjI//sGz3GDw2QvbFIwzqQxpn8FGVErlS7s
	omQVYbjmgyDJmhF1MmCJlIHllgyUO01Sr/yBhSgxI73gtjpY4E1vXqhtHTENlpaAPa12sQ
	COfi9C4/Sj1r2xVrGyKnP9WxPszidYfKAY5LkVWbCCQrazun7IsY1JN+lXSdvSLidQy+zJ
	JM42AdQNLsIiZHirxAYPzrO+5JXzDJKtydCvmMQjV1j+RrDzi32PI8QdtKB5/Db1jOP9ap
	STdYW58tGV3g9BcaZaDXSYefwyq4ViT1/8sPNvUgcWKCHxRJXZjUOZPPxh01TQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1783582589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fpSVJy70b3xqWnZXpAlUFJdEu5JY/bMxQLCNfbP622U=;
	b=aPsm4KX2JqjVkOTd9TekKMBY/H0/KYVBKvaYO+P4E5asdbyGTnkQwhT9fbb+nkBTJB3oUI
	nJc65qufMiJf3XAQ==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: chenhuacai@kernel.org, kernel@xen0n.name, maddy@linux.ibm.com, 
	mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, hca@linux.ibm.com, 
	gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com, 
	svens@linux.ibm.com, tglx@kernel.org, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, hpa@zytor.com, nathan@kernel.org, kees@kernel.org, 
	xur@google.com, peterz@infradead.org, gourry@gourry.net, 
	lukas.bulwahn@redhat.com, ryan.roberts@arm.com, yangtiezhu@loongson.cn, 
	sshegde@linux.ibm.com, mchauras@linux.ibm.com, austin.kim@lge.com, arnd@arndb.de, 
	jchrist@linux.ibm.com, x86@kernel.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org
Subject: Re: [PATCH] syscall_user_dispatch: Introduce
 ARCH_SUPPORTS_SYSCALL_USER_DISPATCH
Message-ID: <20260709093404-0b19988f-8d19-4fae-86d8-396aa747307d@linutronix.de>
References: <20260709072803.3843948-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260709072803.3843948-1-ruanjinjie@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_003634_082760_496346F8 
X-CRM114-Status: GOOD (  12.70  )
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

On Thu, Jul 09, 2026 at 03:28:03PM +0800, Jinjie Ruan wrote:
> Currently, only x86 genuinely implements and supports Syscall User
> Dispatch (SUD). Multiple architectures provide a stub
> arch_syscall_is_vdso_sigreturn() returning 'false' simply to satisfy
> GENERIC_ENTRY compilation, which creates a false impression of feature
> support.
> =

> Introduce ARCH_SUPPORTS_SYSCALL_USER_DISPATCH to decouple this mechanism
> from GENERIC_ENTRY. Select it exclusively on x86 and remove the redundant
> stub functions from other architectures.

Nice, this confused me before.

> Link: https://lore.kernel.org/linux-arm-kernel/akZgV0Y4YAmB43_g@J2N7QTR9R=
3.cambridge.arm.com/
> Cc: Thomas Gleixner <tglx@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Cc: Thomas Wei=DFschuh <thomas.weissschuh@linutronix.de>
> Suggested-by: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/Kconfig                         | 1 +
>  arch/loongarch/include/asm/syscall.h | 6 ------
>  arch/powerpc/include/asm/syscall.h   | 5 -----
>  arch/riscv/include/asm/syscall.h     | 5 -----
>  arch/s390/include/asm/syscall.h      | 5 -----
>  arch/x86/Kconfig                     | 1 +
>  6 files changed, 2 insertions(+), 21 deletions(-)
> =

> diff --git a/arch/Kconfig b/arch/Kconfig
> index 0c01521c2f3f..393d0fb75eac 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -116,6 +116,7 @@ config GENERIC_ENTRY
>  =

>  config SYSCALL_USER_DISPATCH
>  	bool "Syscall User Dispatch"
> +	depends on ARCH_SUPPORTS_SYSCALL_USER_DISPATCH

ARCH_SUPPORTS_SYSCALL_USER_DISPATCH is not declared as a config option,
so the 'select' will not do anything. Needs this:

config ARCH_SUPPORTS_SYSCALL_USER_DISPATCH
	bool

>  	depends on GENERIC_ENTRY
>  	default y
>  	help

(...)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
