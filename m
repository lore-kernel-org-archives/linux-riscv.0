Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1338BC43458
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 01:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kel+lcKaKghpmbdS7aq72pY186qA/meMfDtMU3pFxUc=; b=E1KYP6f3sRevkj
	p/1ovXl5eEJ+Zlo9SvpKptXocDZde6+6hSd/S8WApMFAE7wddeOjF630cIC2pw8Hm2TWDyBjzuunr
	02v5iDZwTeG2fXPvxPT+895anzwWvRsEs0OT3eSFfzgbjbZAOBnZRhIJxqHcD+52EpUi+CGwuDJOA
	f9ULzy2xP9snXwoguMOvvx1EEnpxWWh6rKBxkj/kZdzIQSAG6LFll9wpID4/qV2U7GFCpckiUaO5w
	M6AHMOL/l9RfRLsT1HaKE/9yY90c3+BtBbXZTqZJtjwwGoPS/w5lnFtaIgIAT6IWTs/XhBKQrC0UG
	6B+Yyj8AJ/PCRFKjdR0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj5ew-00000007w1Z-0N9d;
	Mon, 13 Jul 2026 01:40:38 +0000
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj5et-00000007w1E-1ALZ
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jul 2026 01:40:36 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Hnsf6EzWv9XGmyeCuFGhwViHSLyQheUnNtJIFx91GEw=;
	b=1VnICzNB2Q+9vIZQrcusimHfV/D1Aa9LycEejZLZ/GQ9P1OtnDcmBhJ4Wbrw4dPQUNW+HdLhA
	fjE59wA6tqe0obUfxz2Ta2G4n4XUj7uOgGj1m7JSzkPlF3T/QsSTztoU26yaemzQKQ8H700a/Bj
	gfP9XYIaRwJryIyU/58R1Xc=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4gz4dv2m9JzmV8S;
	Mon, 13 Jul 2026 09:31:15 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 7D48C4056C;
	Mon, 13 Jul 2026 09:40:32 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 13 Jul 2026 09:40:31 +0800
Message-ID: <f38fe858-8920-4f4b-815f-f636dc284365@huawei.com>
Date: Mon, 13 Jul 2026 09:40:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch 3/4] entry: Make return type of syscall_trace_enter() bool
To: Thomas Gleixner <tglx@kernel.org>, LKML <linux-kernel@vger.kernel.org>
CC: =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>, Michael Ellerman
	<mpe@ellerman.id.au>, Shrikanth Hegde <sshegde@linux.ibm.com>,
	<linuxppc-dev@lists.ozlabs.org>, Huacai Chen <chenhuacai@kernel.org>,
	<loongarch@lists.linux.dev>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, <linux-riscv@lists.infradead.org>, Sven Schnelle
	<svens@linux.ibm.com>, <linux-s390@vger.kernel.org>, <x86@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Magnus Lindholm <linmag7@gmail.com>, "Mukesh
 Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>, Jonathan Corbet
	<corbet@lwn.net>, Radu Rendec <radu@rendec.net>
References: <20260712134433.549076055@kernel.org>
 <20260712141346.699072205@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260712141346.699072205@kernel.org>
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_184035_626003_726C59DD 
X-CRM114-Status: GOOD (  14.99  )
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



On 7/13/2026 5:25 AM, Thomas Gleixner wrote:
> From: Thomas Gleixner <tglx@kernel.org>
> 
> This prepares for changing the return types of
> syscall_enter_from_user_mode[_work]() to bool, which in turn separates the
> decision of invoking the syscall from the syscall number, which might have
> been changed in the call by ptrace, seccomp, tracing.
> 
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> ---
>  include/linux/entry-common.h |   18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
> --- a/include/linux/entry-common.h
> +++ b/include/linux/entry-common.h
> @@ -72,7 +72,7 @@ static __always_inline long syscall_trac
>  	 */
>  	if (work & SYSCALL_WORK_SYSCALL_USER_DISPATCH) {
>  		if (syscall_user_dispatch(regs))
> -			return -1L;
> +			return false;
>  	}
>  
>  	/*
> @@ -87,13 +87,13 @@ static __always_inline long syscall_trac
>  	if (work & (SYSCALL_WORK_SYSCALL_TRACE | SYSCALL_WORK_SYSCALL_EMU)) {
>  		if (!arch_ptrace_report_syscall_permit_entry(regs) ||
>  		    (work & SYSCALL_WORK_SYSCALL_EMU))
> -			return -1L;
> +			return false;
>  	}
>  
>  	/* Do seccomp after ptrace, to catch any tracer changes. */
>  	if (work & SYSCALL_WORK_SECCOMP) {
>  		if (!__seccomp_permit_syscall())
> -			return -1L;
> +			return false;
>  	}
>  
>  	if (unlikely(work & SYSCALL_WORK_SYSCALL_TRACEPOINT))
> @@ -102,8 +102,7 @@ static __always_inline long syscall_trac
>  	if (unlikely(audit_context()))
>  		syscall_enter_audit(regs);
>  
> -	/* Either of the above might have changed the syscall number */
> -	return syscall_get_nr(current, regs);
> +	return true;
>  }
>  
>  /**
> @@ -133,8 +132,13 @@ static __always_inline long syscall_ente
>  {
>  	unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
>  
> -	if (work & SYSCALL_WORK_ENTER)
> -		syscall = syscall_trace_enter(regs, work, syscall);
> +	if (work & SYSCALL_WORK_ENTER) {
> +		if (!syscall_trace_enter(regs, work, syscall))
> +			return -1L;
> +
> +		/* Reread the syscall number as it might have been modified */
> +		syscall = syscall_get_nr(current, regs);
> +	}

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  
>  	return syscall;
>  }
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
