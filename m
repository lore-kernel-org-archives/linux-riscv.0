Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B3B6C44501
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 01:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cd2M5V8TM1o0VxxGxpFINKxzVdBq4xiQh4t626vdm+M=; b=vlPuxZcLDc/RzH
	O/aJpbxzZDRSHZjkj942PCAcCixO5ECREHjwJYNgAaeKhK11mhKeCBfeGNoTvoXVbe3T8stN3yF78
	WIEIjmjpN6KolZDhs0BjlKLWZk0HVrZOwvi6bFhrKTqBJufPOOSfx5qVC7TAW0e/LnKBxdHAyHOEy
	yQJZLJuqWiMOD0OOoEjotNYXjUx2bihaBusqGE6rLDx1nIQoKwIy0EZzodqfYemFD591OEzPA3XO+
	LtHMhYunJD/5AdE16v0C6UeW/CP/KpFK6DbiJTc09QEdMZNNoM3Y4iBe6H/Z2ozaTsiwZfLzxaaBR
	t12iV/9oGeljfagmwZXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj5ai-00000007vqy-2U2P;
	Mon, 13 Jul 2026 01:36:16 +0000
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj5af-00000007vqZ-1Dlv
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jul 2026 01:36:14 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=iSKyRunqi7Efa2Mu72Zd3vRWZxizzKBzPxtAO2+QtZI=;
	b=OhHsWWrFqDF4iw01ju/V/wuedSNvk4Qd5RncBOtws+2WzWqGVxRMLU8DWnT+L5aKc3F63rC9o
	zSQF8j/UbvpacJIgfpEFOqJvNSjHOZU8gpv7Avy6L6yPLnkBEoTgPNgjsMMuUcSswDQ5mIW5KFE
	AkTfC23kF7UYdY3K6BSmLV8=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4gz4Xm1fF1zmV8S;
	Mon, 13 Jul 2026 09:26:48 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 559ED4055B;
	Mon, 13 Jul 2026 09:36:05 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 13 Jul 2026 09:36:04 +0800
Message-ID: <ad9b5f8f-7c4d-4fbb-b0a3-69859ee8b365@huawei.com>
Date: Mon, 13 Jul 2026 09:36:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch 2/4] entry: Rework trace_syscall_enter()
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
 <20260712141346.639115923@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260712141346.639115923@kernel.org>
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_183613_641531_8C99B494 
X-CRM114-Status: GOOD (  14.26  )
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
> Reread the syscall number from pt_regs and stop returning the eventually
> modified syscall number.
> 
> That moves the reread to the end of the syscall_trace_enter() and prepares
> for moving it to the call site.
> 
> No functional change.
> 
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> ---
>  include/linux/entry-common.h  |   10 ++++------
>  kernel/entry/syscall-common.c |    9 ++-------
>  2 files changed, 6 insertions(+), 13 deletions(-)
> 
> --- a/include/linux/entry-common.h
> +++ b/include/linux/entry-common.h
> @@ -58,7 +58,7 @@ static __always_inline bool arch_ptrace_
>  }
>  #endif
>  
> -long trace_syscall_enter(struct pt_regs *regs, long syscall);
> +void trace_syscall_enter(struct pt_regs *regs);
>  void trace_syscall_exit(struct pt_regs *regs, long ret);
>  void syscall_enter_audit(struct pt_regs *regs);
>  
> @@ -96,16 +96,14 @@ static __always_inline long syscall_trac
>  			return -1L;
>  	}
>  
> -	/* Either of the above might have changed the syscall number */
> -	syscall = syscall_get_nr(current, regs);
> -
>  	if (unlikely(work & SYSCALL_WORK_SYSCALL_TRACEPOINT))
> -		syscall = trace_syscall_enter(regs, syscall);
> +		trace_syscall_enter(regs);
>  
>  	if (unlikely(audit_context()))
>  		syscall_enter_audit(regs);
>  
> -	return syscall;
> +	/* Either of the above might have changed the syscall number */
> +	return syscall_get_nr(current, regs);

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  }
>  
>  /**
> --- a/kernel/entry/syscall-common.c
> +++ b/kernel/entry/syscall-common.c
> @@ -8,14 +8,9 @@
>  
>  /* Out of line to prevent tracepoint code duplication */
>  
> -long trace_syscall_enter(struct pt_regs *regs, long syscall)
> +void trace_syscall_enter(struct pt_regs *regs)
>  {
> -	trace_sys_enter(regs, syscall);
> -	/*
> -	 * Probes or BPF hooks in the tracepoint may have changed the
> -	 * system call number. Reread it.
> -	 */
> -	return syscall_get_nr(current, regs);
> +	trace_sys_enter(regs, syscall_get_nr(current, regs));
>  }
>  
>  void trace_syscall_exit(struct pt_regs *regs, long ret)
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
