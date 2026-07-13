Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA0CAC43458
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 01:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iXvRQVtIR2+qswEKX+4CJQ+5l1XbW7cgd/1Mn0gJ1Iw=; b=ZBKUMLpKzyi/1Y
	cZpF9XFcLXXhnKe4bnOI9ix0gC42PKE43AgCGOa+TvfMksdiuzhtgDAOEr/2Ad3RTRduyTdRrubHf
	I2d8+YlC6RK/Uv3mq4na0bR/2p6tFkCJsR/78roDFPEpQvxdLICcc20JDSQ7dqz/HAAZKNlKByZ/5
	B3T/3PBGhQsCX4IZ7oS9B5yatWIEavTMN2v9FwoJSB0zvNM4/lvwJXnPgZgkTGIo9OR3qMIdM4CQb
	Ii1m4HM77lWlD+sd1oLkjaGuH0XBuNa87RvJ+5vLX4DXl6X+VjrFaoklDuuB3SnU6dE3AKSlrNUcA
	U0Ms6iVjhYWnXTMw0oOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj5Yv-00000007vjE-1Y4o;
	Mon, 13 Jul 2026 01:34:25 +0000
Received: from [113.46.200.220] (helo=canpmsgout05.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj5Yq-00000007viV-3VaC
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jul 2026 01:34:24 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=nIM4m5e9jGc2sCxhzH+mYlnpqbqKe9faxrdPztB+tkM=;
	b=As7yTkFfrwDJVeeOgWTYV+UMEyVi3b+jQMQX7rfkp/tm1wuMS9j4Dw2TgZKn8WKc6c7OKl2xJ
	4J+tM+ADkcJXS8glDkArkowYGIiT2JlAmOdOPIng5dw3tqTx9gh09KANnSex0ZsCV4lA0wnaDZY
	fsG/wYMyPD4R0cNbSBIwSTI=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4gz4Tr5crRz12LF7;
	Mon, 13 Jul 2026 09:24:16 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id DD07540561;
	Mon, 13 Jul 2026 09:33:55 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 13 Jul 2026 09:33:54 +0800
Message-ID: <7480b818-d44c-47f5-944a-5f17f3429d09@huawei.com>
Date: Mon, 13 Jul 2026 09:33:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch 1/4] entry: Rework syscall_audit_enter()
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
 <20260712141346.576865340@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260712141346.576865340@kernel.org>
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_183421_553487_BCD30B5C 
X-CRM114-Status: GOOD (  12.79  )
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
> Move it out of line and let it reread the syscall number on it's own. That
> makes the low level entry code denser and allows to move the reread to the
> call site of syscall_trace_enter() once the tracer is fixed up.
> 
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> ---
>  include/linux/entry-common.h  |   14 +++-----------
>  kernel/entry/syscall-common.c |   10 ++++++++++
>  2 files changed, 13 insertions(+), 11 deletions(-)
> 
> --- a/include/linux/entry-common.h
> +++ b/include/linux/entry-common.h
> @@ -60,16 +60,7 @@ static __always_inline bool arch_ptrace_
>  
>  long trace_syscall_enter(struct pt_regs *regs, long syscall);
>  void trace_syscall_exit(struct pt_regs *regs, long ret);
> -
> -static inline void syscall_enter_audit(struct pt_regs *regs, long syscall)
> -{
> -	if (unlikely(audit_context())) {
> -		unsigned long args[6];
> -
> -		syscall_get_arguments(current, regs, args);
> -		audit_syscall_entry(syscall, args[0], args[1], args[2], args[3]);
> -	}
> -}
> +void syscall_enter_audit(struct pt_regs *regs);
>  
>  static __always_inline long syscall_trace_enter(struct pt_regs *regs, unsigned long work,
>  						long syscall)
> @@ -111,7 +102,8 @@ static __always_inline long syscall_trac
>  	if (unlikely(work & SYSCALL_WORK_SYSCALL_TRACEPOINT))
>  		syscall = trace_syscall_enter(regs, syscall);
>  
> -	syscall_enter_audit(regs, syscall);
> +	if (unlikely(audit_context()))
> +		syscall_enter_audit(regs);

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  
>  	return syscall;
>  }
> --- a/kernel/entry/syscall-common.c
> +++ b/kernel/entry/syscall-common.c
> @@ -1,5 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  
> +#include <linux/audit.h>
>  #include <linux/entry-common.h>
>  
>  #define CREATE_TRACE_POINTS
> @@ -21,3 +22,12 @@ void trace_syscall_exit(struct pt_regs *
>  {
>  	trace_sys_exit(regs, ret);
>  }
> +
> +void syscall_enter_audit(struct pt_regs *regs)
> +{
> +	long syscall = syscall_get_nr(current, regs);
> +	unsigned long args[6];
> +
> +	syscall_get_arguments(current, regs, args);
> +	__audit_syscall_entry(syscall, args[0], args[1], args[2], args[3]);
> +}
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
