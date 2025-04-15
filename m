Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DCC0C369AB
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Apr 2025 14:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9d91+EF4jgBmRllOyk75E8tWlHQWMft5FxSFBTnRr9I=; b=1C01wosGZjvmQg
	3V/ChcUzXuZqcD4g/JpMKU8KRbpfhI1btnICJQYkxgnVbg7FBz3bLi3/eQXhau1GUEF9SqIWoO1LF
	87LXA0bUhzNrphq718MDcl6uKmszMNGF2woYraaS5L+8zPHEaP32FBKGtN+hEGhXwH6ziPJZjVmB6
	Vb0mO7QbVJvYaYXkVbKJJ23U/vLriexhRTbB9d4X83MQe9VxOnCAAtNwJINsbQXzJWkUEcgNc6kEn
	unfB7wSJTIeRGUPJG+Cd5xevHc2xzyHQXGfEnj7RmRyy/bpj8CV1caKcqDktFBafjFcZfBc//nPOH
	kckB3nhGqcQVFbzxXAJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4hCY-000000064tv-1g5Z;
	Tue, 15 Apr 2025 14:23:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4hCV-000000064tY-2bmH
	for linux-riscv@lists.infradead.org;
	Tue, 15 Apr 2025 14:23:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DE27C5C587D;
	Tue, 15 Apr 2025 14:21:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C28F8C4CEDD;
	Tue, 15 Apr 2025 14:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744727026;
	bh=aNmL0+H984WKGRSWMsb/StuKFDQU1an6R5Y3td+dyM4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GSji8SUddah2ECmiHhsDW1Z1tVfoNWfzNIZHgFUiVNVbvbTk9Q0Uayjc7cFFOEnQt
	 VGMG6qo8IqXiBe4+0sM4ZrHOtLhJDsrsjR4i3PJXUc4SK0O3XGHm1AiI5dJ3KVIqcR
	 L/14URvPdtJQGO48pz40qtb5a1EQIzJr7tb5q9wSW73vffvrDTB54ExE+tFGwUCLhZ
	 PaL3e4cXLbrXTHychiMS+7/UeJHQgZMoOfaAa/JsBBRcpOElHdUWuY5IQqWEidCIMa
	 EmdhJMJ+BCHekhbEUcIckjiTrfU9XcTgBMJanSRD57jKbkQCoruxZoEK1axd1ovLc8
	 71i0fLMHP4g8g==
Date: Tue, 15 Apr 2025 07:23:42 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Charlie Jenkins <charlie@rivosinc.com>,
	"Dmitry V. Levin" <ldv@strace.io>, Kees Cook <kees@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Avoid fortify warning in syscall_get_arguments()
Message-ID: <20250415142342.GA995325@ax162>
References: <20250409-riscv-avoid-fortify-warning-syscall_get_arguments-v1-1-7853436d4755@kernel.org>
 <4a0dc950-cda6-4bb4-a4e9-460bc56b5bb1@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4a0dc950-cda6-4bb4-a4e9-460bc56b5bb1@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_072347_751710_AF72A3AB 
X-CRM114-Status: GOOD (  35.55  )
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

On Tue, Apr 15, 2025 at 07:54:04AM +0200, Alexandre Ghiti wrote:
> Hi Nathan,
> 
> On 09/04/2025 23:24, Nathan Chancellor wrote:
> > When building with CONFIG_FORTIFY_SOURCE=y and W=1, there is a warning
> > because of the memcpy() in syscall_get_arguments():
> > 
> >    In file included from include/linux/string.h:392,
> >                     from include/linux/bitmap.h:13,
> >                     from include/linux/cpumask.h:12,
> >                     from arch/riscv/include/asm/processor.h:55,
> >                     from include/linux/sched.h:13,
> >                     from kernel/ptrace.c:13:
> >    In function 'fortify_memcpy_chk',
> >        inlined from 'syscall_get_arguments.isra' at arch/riscv/include/asm/syscall.h:66:2:
> >    include/linux/fortify-string.h:580:25: error: call to '__read_overflow2_field' declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Werror=attribute-warning]
> >      580 |                         __read_overflow2_field(q_size_field, size);
> >          |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >    cc1: all warnings being treated as errors
> > 
> > The fortified memcpy() routine enforces that the source is not overread
> > and the destination is not overwritten if the size of either field and
> > the size of the copy are known at compile time. The memcpy() in
> > syscall_get_arguments() intentionally overreads from a1 to a5 in
> > 'struct pt_regs' but this is bigger than the size of a1.
> > 
> > Normally, this could be solved by wrapping a1 through a5 with
> > struct_group() but there was already a struct_group() applied to these
> > members in commit bba547810c66 ("riscv: tracing: Fix
> > __write_overflow_field in ftrace_partial_regs()").
> > 
> > Just avoid memcpy() altogether and write the copying of args from regs
> > manually, which clears up the warning at the expense of three extra
> > lines of code.
> > 
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > ---
> > I omitted a Fixes tag because I think this has always been an overread
> > if I understand correctly but it is only the addition of the checks from
> > commit f68f2ff91512 ("fortify: Detect struct member overflows in
> > memcpy() at compile-time") that it becomes a noticeable issue.
> > 
> > This came out of a discussion from the addition of
> > syscall_set_arguments(), where the same logic causes a more noticeable
> > fortify warning because it happens without W=1, as it is an overwrite:
> > https://lore.kernel.org/20250408213131.GA2872426@ax162/
> > ---
> >   arch/riscv/include/asm/syscall.h | 7 +++++--
> >   1 file changed, 5 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/riscv/include/asm/syscall.h b/arch/riscv/include/asm/syscall.h
> > index 121fff429dce66b31fe79b691b8edd816c8019e9..eceabf59ae482aa1832b09371ddb3ba8cd65f91d 100644
> > --- a/arch/riscv/include/asm/syscall.h
> > +++ b/arch/riscv/include/asm/syscall.h
> > @@ -62,8 +62,11 @@ static inline void syscall_get_arguments(struct task_struct *task,
> >   					 unsigned long *args)
> >   {
> >   	args[0] = regs->orig_a0;
> > -	args++;
> > -	memcpy(args, &regs->a1, 5 * sizeof(args[0]));
> > +	args[1] = regs->a1;
> > +	args[2] = regs->a2;
> > +	args[3] = regs->a3;
> > +	args[4] = regs->a4;
> > +	args[5] = regs->a5;
> >   }
> >   static inline int syscall_get_arch(struct task_struct *task)
> > 
> > ---
> > base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
> > change-id: 20250409-riscv-avoid-fortify-warning-syscall_get_arguments-19c0495d4ed7
> > 
> > Best regards,
> 
> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> 
> IIUC, Andrew took this patch, if that changes, please let me know and I'll
> merge it through the riscv tree.

Thanks, I had Andrew drop it so that it could go via the riscv tree so
please pick it up when you can.

https://lore.kernel.org/20250411211833.E3DD1C4CEE2@smtp.kernel.org/

Cheers,
Nathan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
