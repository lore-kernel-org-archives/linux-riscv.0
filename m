Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 379BDC46CD2
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Jan 2024 18:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=77jyk/QXIxMJwW81VhOhn1PZtKgbCLi1IWkxDT6t5Ro=; b=cxt2duznvqs0z6
	qF0FOf1XspfKhRR6zjXaHydkfB9msTIgxcurSPWz/puPqt2yyFFnq4x99aZw4QQYqaQjapGucyxle
	YxqnBC+FYvZK+RRf+eTADHayWBGuIfhIYwy5l/kQ2e0QXt2k1YKCYIsBRtLOtXccKQs0Mv+OCdStZ
	aPs1Kyc6mKI/RnROVW5VB08Fy8A3J222yebuioS0DZ6zUQGFm97t6HTaysiKlN/aDwcpenmxSE9Md
	qaklOQ2KcJpeWznjMc9Vvzdup0bTPG9iTbqyN86yw2UWPWv2HEzLE0vQUTarRtW+tfyUW/L8zoNPb
	XNk4v2XX8E0bfEIsDb8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSiPG-004mTT-0c;
	Wed, 24 Jan 2024 18:55:26 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSiPB-004mS8-2e
	for linux-riscv@lists.infradead.org;
	Wed, 24 Jan 2024 18:55:24 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1d71e24845aso35107405ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 24 Jan 2024 10:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706122519; x=1706727319; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jDj/r0j6wjrBeKVb5gL0FLzmDiXz6FHRYIwfCvn46Xc=;
        b=PXkYeWRj3YhZp9tNpWGvhPIdQ/3ZUiqoEBAB1iBCu7djU1jXvVkACNEgwDf8145Yrp
         Krzo/Uyc/Y/rik9o1cHDBy0zhYn9j2TifapnSa21ulMrL4RbMkmFGBjnx6ZxuTPBTf+G
         /o3YeZsXc5ivoqDQI5NOBFgBFiWvOnvwQvkIp02KsOYAya2M3iL0maWUuJyQgkbhREDl
         kjIDhKSCtdqfdikaCxByal5P7Ip7nrDGRg4sr6/IfifzuypCjlgQjB7wZdncsNnNvAMH
         slit3NroZ7gws88kE1MvuqN2tqui0BIY+Z8/6QahfsYllPDlgrD7Q9oVk6Ax8SoNAJcc
         +jNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706122519; x=1706727319;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jDj/r0j6wjrBeKVb5gL0FLzmDiXz6FHRYIwfCvn46Xc=;
        b=VfgIsXWaaSL2yghuLntuaJxgoJYeYJy7zsbF1Mvttg+/sdEtfwJZQeDK1vdxrunfBD
         iZd6dYjJW8Rwe93q1cikHq2OJGCPB+EnRLhASTuF29gLo+QttvXow00FX6AtqCT120XE
         a5oyAGK71Aw8fQ5SqUPkhK0ASYF9IYLdvDohsrbRuV1BS3xBrHBNg1HLd2Id6THxMTz0
         zGzP7z0so1YPy3UpHtRLjUHs7OzqluN5KCqqJk/mGiEEYNJU32bNAxaUqE0tuL+QjUmw
         lGHowYNj+I+e65JCV1egF2SChe5caH0w7G8MuvY4nApfLz3p1B+E52CRCdcS/8lW2NSs
         +fKA==
X-Gm-Message-State: AOJu0YwVIP6Uw1MSXeO9qi+JM3fWF2IVJbXJTUitUj/QeCQvngKSGTbY
	ETQM3r0FCMelsEow+Fc5L9gYpzOyDlIsoJwJ+xEFpdB75m+7VmTXXckdp+k4UsY=
X-Google-Smtp-Source: AGHT+IEIpZf36EhWLz+OQgHES8qLiyZ0UwP9vaFkyqYaaf3TE93IIKGP2XO1CzR3BfCEE2NcFO6xbw==
X-Received: by 2002:a17:902:d4ce:b0:1d7:8e11:14a0 with SMTP id o14-20020a170902d4ce00b001d78e1114a0mr887617plg.91.1706122518713;
        Wed, 24 Jan 2024 10:55:18 -0800 (PST)
Received: from ghost ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id z7-20020a1709028f8700b001d71935e5c1sm9210654plo.195.2024.01.24.10.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 10:55:18 -0800 (PST)
Date: Wed, 24 Jan 2024 10:55:16 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>,
	Conor Dooley <conor.dooley@microchip.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Atish Patra <atishp@atishpatra.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v9 2/2] documentation: Document
 PR_RISCV_SET_ICACHE_FLUSH_CTX prctl
Message-ID: <ZbFdFARPQzjRd2g8@ghost>
References: <20240123-fencei-v9-0-71411bfe8d71@rivosinc.com>
 <20240123-fencei-v9-2-71411bfe8d71@rivosinc.com>
 <26808f34-d9c4-404a-bf09-45c4aff139ad@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <26808f34-d9c4-404a-bf09-45c4aff139ad@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_105521_858996_E6D24F4B 
X-CRM114-Status: GOOD (  38.67  )
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

On Wed, Jan 24, 2024 at 08:19:42AM +0100, Alexandre Ghiti wrote:
> On 24/01/2024 00:29, Charlie Jenkins wrote:
> > Provide documentation that explains how to properly do CMODX in riscv.
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > Reviewed-by: Atish Patra <atishp@rivosinc.com>
> > ---
> >   Documentation/arch/riscv/cmodx.rst | 96 ++++++++++++++++++++++++++++++++++++++
> >   Documentation/arch/riscv/index.rst |  1 +
> >   2 files changed, 97 insertions(+)
> > 
> > diff --git a/Documentation/arch/riscv/cmodx.rst b/Documentation/arch/riscv/cmodx.rst
> > new file mode 100644
> > index 000000000000..2ad46129d812
> > --- /dev/null
> > +++ b/Documentation/arch/riscv/cmodx.rst
> > @@ -0,0 +1,96 @@
> > +.. SPDX-License-Identifier: GPL-2.0
> > +
> > +==============================================================================
> > +Concurrent Modification and Execution of Instructions (CMODX) for RISC-V Linux
> > +==============================================================================
> > +
> > +CMODX is a programming technique where a program executes instructions that were
> > +modified by the program itself. Instruction storage and the instruction cache
> > +(icache) are not guaranteed to be synchronized on RISC-V hardware. Therefore, the
> > +program must enforce its own synchronization with the unprivileged fence.i
> > +instruction.
> > +
> > +However, the default Linux ABI prohibits the use of fence.i in userspace
> > +applications. At any point the scheduler may migrate a task onto a new hart. If
> > +migration occurs after the userspace synchronized the icache and instruction
> > +storage with fence.i, the icache will no longer be clean. This is due to the
> 
> 
> Nit: I think you mean "the icache on the new hart will no longer be clean".

Aw yes, that should be more explicit.

- Charlie

> 
> 
> > +behavior of fence.i only affecting the hart that it is called on. Thus, the hart
> > +that the task has been migrated to may not have synchronized instruction storage
> > +and icache.
> > +
> > +There are two ways to solve this problem: use the riscv_flush_icache() syscall,
> > +or use the ``PR_RISCV_SET_ICACHE_FLUSH_CTX`` prctl() and emit fence.i in
> > +userspace. The syscall performs a one-off icache flushing operation. The prctl
> > +changes the Linux ABI to allow userspace to emit icache flushing operations.
> > +
> > +As an aside, "deferred" icache flushes can sometimes be triggered in the kernel.
> > +At the time of writing, this only occurs during the riscv_flush_icache() syscall
> > +and when the kernel uses copy_to_user_page(). These deferred flushes happen only
> > +when the memory map being used by a hart changes. If the prctl() context caused
> > +an icache flush, this deferred icache flush will be skipped as it is redundant.
> > +Therefore, there will be no additional flush when using the riscv_flush_icache()
> > +syscall inside of the prctl() context.
> > +
> > +prctl() Interface
> > +---------------------
> > +
> > +Call prctl() with ``PR_RISCV_SET_ICACHE_FLUSH_CTX`` as the first argument. The
> > +remaining arguments will be delegated to the riscv_set_icache_flush_ctx
> > +function detailed below.
> > +
> > +.. kernel-doc:: arch/riscv/mm/cacheflush.c
> > +	:identifiers: riscv_set_icache_flush_ctx
> > +
> > +Example usage:
> > +
> > +The following files are meant to be compiled and linked with each other. The
> > +modify_instruction() function replaces an add with 0 with an add with one,
> > +causing the instruction sequence in get_value() to change from returning a zero
> > +to returning a one.
> > +
> > +cmodx.c::
> > +
> > +	#include <stdio.h>
> > +	#include <sys/prctl.h>
> > +
> > +	extern int get_value();
> > +	extern void modify_instruction();
> > +
> > +	int main()
> > +	{
> > +		int value = get_value();
> > +		printf("Value before cmodx: %d\n", value);
> > +
> > +		// Call prctl before first fence.i is called inside modify_instruction
> > +		prctl(PR_RISCV_SET_ICACHE_FLUSH_CTX_ON, PR_RISCV_CTX_SW_FENCEI, PR_RISCV_SCOPE_PER_PROCESS);
> > +		modify_instruction();
> > +
> > +		value = get_value();
> > +		printf("Value after cmodx: %d\n", value);
> > +		return 0;
> > +	}
> > +
> > +cmodx.S::
> > +
> > +	.option norvc
> > +
> > +	.text
> > +	.global modify_instruction
> > +	modify_instruction:
> > +	lw a0, new_insn
> > +	lui a5,%hi(old_insn)
> > +	sw  a0,%lo(old_insn)(a5)
> > +	fence.i
> > +	ret
> > +
> > +	.section modifiable, "awx"
> > +	.global get_value
> > +	get_value:
> > +	li a0, 0
> > +	old_insn:
> > +	addi a0, a0, 0
> > +	ret
> > +
> > +	.data
> > +	new_insn:
> > +	addi a0, a0, 1
> > diff --git a/Documentation/arch/riscv/index.rst b/Documentation/arch/riscv/index.rst
> > index 4dab0cb4b900..eecf347ce849 100644
> > --- a/Documentation/arch/riscv/index.rst
> > +++ b/Documentation/arch/riscv/index.rst
> > @@ -13,6 +13,7 @@ RISC-V architecture
> >       patch-acceptance
> >       uabi
> >       vector
> > +    cmodx
> >       features
> > 
> 
> I don't know how man pages are synchronized with new additions in the
> kernel, do you? It would be nice to have this new prctl documented for
> userspace.
> 
> Thanks,
> 
> Alex
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
