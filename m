Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD1ABCD11C2
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Apr 2024 12:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T2icQ7isws248soCS+8sRFQqXf3kJ3a9KRf+nhDW/bk=; b=LjEMJ99jeCsVfe
	up3o6iMXWxHrZLrElO13YLUb7BvAkV0YibY5YIEZG5dvaN5SQUD43qKPfMNPgbh0H+dAEKaF30veT
	ILRcOMwJSZLw+8x9R6s0vnrU1BtYvJ5I++C6XkhUru7ezcQTI/+j0uBnSQGgaJUFOKkvaEs5V9FYZ
	THAZlw/XDdQ2rbadbt/cGiLv+jCXKXbra/X0Ofvt4DtpaVBdU49N9WyCWc9DOmiVwNfLiWKZCOu9V
	/s0ykN3yfN33PDeHy6vd7pQqSWFm6Q22nV+gBlXun4GHQpcmGZUiYd9qn55i12Poyaq0CBarloZ83
	tutPHldlibrgkr2ny8Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsizW-0000000724A-22uF;
	Fri, 05 Apr 2024 12:48:22 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsizT-0000000722u-2alk
	for linux-riscv@lists.infradead.org;
	Fri, 05 Apr 2024 12:48:21 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-516ab4b3251so2503951e87.0
        for <linux-riscv@lists.infradead.org>; Fri, 05 Apr 2024 05:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1712321296; x=1712926096; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1gqJXCFhYHxuGeDzQHXUm6mF/uMGESwP7Rig2uzwTrg=;
        b=aHnVkrpbZuzA19VkZsjH+/fTTVVOXzsqbZztygam4jnWKpzIKIODx+DgnX1ym+SVBn
         07TY9ZsUCOmOdM73s+05KaJifDzr6x/KfN5BW4R3TRk9HeEebUZcWW/oSyvQ18o26qFp
         XeOxnrfBPdBB43c0M8FkD2V7NNDEQTwsUyZrj8qtuTG6Edz6wCI21Z+EGBxifNBAgqvP
         EFSFybMbn70FwwLgrFsX6IT2I+jZg+Dmv7GfoWalOvEnB/myYvqdLtimHjgB38ZmSDx2
         2b0F9OF8Ub8fpmKGbrXuMdAU+UYRqJlimKq7YfpgCYJa7LqvUKfMeO+VQCSD2dp/xxaP
         QHGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712321296; x=1712926096;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1gqJXCFhYHxuGeDzQHXUm6mF/uMGESwP7Rig2uzwTrg=;
        b=LqZvS/DaqTARCLEOwHlBnnRK4f+niq2QQLhwO4ccJJllnE80pct17JTprU13iK7VHX
         rRxkV1Oi1FnnKvZDBY5i4yaNVdMrX3AdfIhYW1y1ch6nmQTGtW0r3z6zQ04XbOMYts5N
         Mdg6Wpf4S9b2ujwdZjWwmICkpfO0QUtx5WABosAKB4Qpm590/wcggiDsZcMLGWD5mOQK
         pL8zD+6viNxyBB8EKgbMEQdn7Q11hFDlwJ7ucvQveiin7SGEfqxCLAQSD8fj7yk/3epr
         pMhfc1WzzFoBn5wTeq7aI2IkaG7lt82aSDamDQOIRik5K1V27Adq9txd8xcdWpCw6ty/
         fojQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWdT1Td9OwicX6ZSevBys1qQ61A0zMUzF4js7n+DJl7qIZUFXd+tE5/9/pZN8m+tHCGBGTzIW110+s1L+F6Vn4Vyjqq3xYb7mShNC/2EcY
X-Gm-Message-State: AOJu0YyEbtTnW9hGjOcsFogfeqsWPpxhitZFxWQobwV2R6tOCuBMA8N1
	KT+aarON9SC+MsiDr09bFSFLaHtt/3eF933q+yhda8uPQEl8MWFR0uXtNhBkUDM=
X-Google-Smtp-Source: AGHT+IFEgm+u9cR3VSBSNQtYk5knjRxPrUMvf+kSAsf2mgyfdrQjMfXWeVpxY5HnY8fvu518V/oPuQ==
X-Received: by 2002:ac2:446d:0:b0:513:eeaa:8f1f with SMTP id y13-20020ac2446d000000b00513eeaa8f1fmr1128144lfl.47.1712321296604;
        Fri, 05 Apr 2024 05:48:16 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id n20-20020aa7c694000000b0056c56d18d07sm761088edq.48.2024.04.05.05.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 05:48:16 -0700 (PDT)
Date: Fri, 5 Apr 2024 14:48:15 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@atishpatra.org>
Subject: Re: [PATCH v4 13/15] KVM: riscv: selftests: Add SBI PMU selftest
Message-ID: <20240405-3242460b23ce1daf905242df@orel>
References: <20240229010130.1380926-1-atishp@rivosinc.com>
 <20240229010130.1380926-14-atishp@rivosinc.com>
 <20240302-ed6c516829dc0ed616f39a45@orel>
 <CAOnJCUK2D6-zP4=DiXRMeFQsMc9iG5nWY-yYHMhg83h_q+OtnQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOnJCUK2D6-zP4=DiXRMeFQsMc9iG5nWY-yYHMhg83h_q+OtnQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_054819_788334_425F55B5 
X-CRM114-Status: GOOD (  26.35  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-kselftest@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, kvm@vger.kernel.org, Will Deacon <will@kernel.org>, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org, Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Apr 02, 2024 at 01:34:54AM -0700, Atish Patra wrote:
...
> > > +static void guest_illegal_exception_handler(struct ex_regs *regs)
> > > +{
> > > +     __GUEST_ASSERT(regs->cause == EXC_INST_ILLEGAL,
> > > +                    "Unexpected exception handler %lx\n", regs->cause);
> >
> > Shouldn't we be reporting somehow that we were here? We seem to be using
> > this handler to skip instructions which don't work, which is fine, if
> > we have some knowledge we skipped them and then do something else.
> > Otherwise I don't understand.
> >
> 
> This is only used in test_vm_basic_test to validate that the guest
> will get an illegal
> exception if they try to access without configuring first.

Yeah, that's good. I just don't see how we know we were ever here. We
either got the exception and then stepped over the CSR read or we did
the CSR read. Either way, the test progresses the same. Shouldn't this
induce a test skip or something instead?

> > > +
> > > +     counter_value_post = read_counter(counter, ctrinfo_arr[counter]);
> > > +     __GUEST_ASSERT(counter_value_post > counter_value_pre,
> > > +                    "counter_value_post %lx counter_value_pre %lx\n",
> > > +                    counter_value_post, counter_value_pre);
> > > +
> > > +     /* Now set the initial value and compare */
> > > +     start_counter(counter, SBI_PMU_START_FLAG_SET_INIT_VALUE, counter_init_value);
> >
> > We should try to confirm that we reset the counter, otherwise the check
> > below only proves that the value we read is greater than 100, which it
> > is possible even if the reset doesn't work.
> >
> 
> Hmm. There is no way to just update the counter value without starting
> it. Reading it without stopping is not reliable.
> Maybe we can do this.
> 
> 1. Reset it to 100. Stop it immediately after and read it. Let's say
> the value is X
> 2. Now reset it to counter  X + 1000.
> 3. Do the validation with the above reset value in #2.
> 
> Wdyt ?

OK

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
