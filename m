Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35909C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Dec 2022 02:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QJLYs9j7qxVQUf0sGGbxpkOu9mc0/VquBcVAeua/ZMA=; b=pDYWqHhGB1KV2d
	b4mAyhZLVb9S0QDZzbCd4/jTo35jXHNcbvh6mCfO5pC7hmWwBwrzTRUqz2l+CwD0+q+E2Yjv9KbKV
	Hwcom4OwQvSmUf+RvC8jfCGvUUFMyDuboeLTZqrb7FF2mXDKWXPbb3no0GGfZpXXccGM8ktpHB9rK
	/4Sm4hTvo7ftveaeNMXsX8VAJ8eUGwMbhf68GxS2gqfjTBvMPpOGtug3bSLQlV6ZkmnxDwKzedRJv
	FoG4gOpxMmsk3vcG5Z3M2ax2aTqFD7qs5ezYwDTzyB+zyIcOUxMigA5aOsqsDqrVG407k2dGims+Y
	O6YmD0OGYDxOcLDD/q6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8Xmt-0023IZ-NC; Fri, 23 Dec 2022 02:27:55 +0000
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8Xmr-0023Gd-6W
	for linux-riscv@lists.infradead.org; Fri, 23 Dec 2022 02:27:54 +0000
Received: by mail-ua1-x932.google.com with SMTP id j1so805471uan.1
        for <linux-riscv@lists.infradead.org>; Thu, 22 Dec 2022 18:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=T5uMSrtLuu9RORD8OGsSVOlpmTM1AJbSU+v28i5O2jc=;
        b=Jgkq2vT6Nv4Mj5Qx8YcJGsd2E16MF+OnlXNeCVIxPGz7EqovjRVVkPA1RdoJ6gBpyh
         CYjbRNGL55SHXLkTt7C7HafAUyP6vTTwkbWDPl+R6O65PG6AMngKwTKoL4u+G3TP2JOs
         jdX8QmEy/+4gF/aJdV5NXi4mmEbmNFixm5i0EkmbqBSCePcgYD1oZkjthFGVr4SQzwdv
         9uQ0sSo7BsXGBU6Qds1S0tLC7qTnCLI0cWwjgFJqvNUGKkl/GKKvg2N90y/nQwKM7Eay
         JFPlxU7s6LiFX5IUc2yVnuHTWPgCXoc9dJSUHlzQ1SSdnLqkl9vPpMW9e9Au9aYO84W7
         Txcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T5uMSrtLuu9RORD8OGsSVOlpmTM1AJbSU+v28i5O2jc=;
        b=jcQtqASRmO+0vJhk4h5M1QWCo66nDkfmrr8tlM9FmWtdDd6SOaJOhPiXfIBntf/nit
         xWhALLVEEwJMZVP04hk1qakPSFQ39uLs1dTWUHmEXfe2QftmZv31hzQ5uBdABVbU7a5N
         S3V91b+QzdLljLdBYKexMn6bXIPzxIVSdJ3Hs3ku8Hf5BgS6q0XsKrERzhhJvVEnPhPG
         n/zvY+oI7YbHcm9pFO4UoGDN6b9ITLR7QAm4arK/SKpCab1IecEqV1ZPlUVIZ26HqNBR
         d3MPTDckgINS263OwYs+Re+iHmQCJB6f+92GrE1kFp+nQ3lQSnSCenmGJD6PhDzKHfO/
         /ACw==
X-Gm-Message-State: AFqh2koLLzwri0QenOdGcWCrgctwuLLciA/EZ6v3umMTxvtNSMD0U2IV
	vBRy0tj5NBsn8RK7k1A2x5iYfnDJwU+i/UhVYTmOhg==
X-Google-Smtp-Source: AMrXdXuoglMLlAMWmT5MjunC88drKtLEW3p/9VX5wFKbukFrLvBz0VrvHImZZRFKebrgIzXx29wT72oxd5OyB2PadeM=
X-Received: by 2002:ab0:1c44:0:b0:419:9e81:21fd with SMTP id
 o4-20020ab01c44000000b004199e8121fdmr782371uaj.3.1671762470670; Thu, 22 Dec
 2022 18:27:50 -0800 (PST)
MIME-Version: 1.0
References: <1631497278-29829-1-git-send-email-vincent.chen@sifive.com>
 <1631497278-29829-3-git-send-email-vincent.chen@sifive.com>
 <871r5sd1zq.fsf@oldenburg.str.redhat.com> <20210913135247.GL13220@brightrain.aerifal.cx>
 <CABvJ_xjGZ3S0oAkT08x4DToQFdcUH06omk2OTT1EHDZRJ-2wKg@mail.gmail.com>
 <87sfy5ndid.fsf@oldenburg.str.redhat.com> <CABvJ_xjSREsdemJkCJMGSx+09jrNoSbXCwuxF0zEQmZtHrWMvg@mail.gmail.com>
 <d613968f-0fae-1994-3bee-fb10765167c3@rivosinc.com> <73c0124c-4794-6e40-460c-b26df407f322@rivosinc.com>
 <CABvJ_xgDsthnm_h6mYowK03VUKqYk=nZsSZ7R=0BTwFHGKEAMw@mail.gmail.com>
 <50c598a6-e3b3-3062-abe7-23a406067533@rivosinc.com> <7430f494-9b43-5e03-c1e9-6b83e2611a11@rivosinc.com>
 <CABvJ_xg--0Gia9Za9endcz5kaqfDugrcdpkg-f1u=2mt7AE2cA@mail.gmail.com> <fa18d2a8-92bd-8e01-fce2-d5af9455558e@rivosinc.com>
In-Reply-To: <fa18d2a8-92bd-8e01-fce2-d5af9455558e@rivosinc.com>
From: Vincent Chen <vincent.chen@sifive.com>
Date: Fri, 23 Dec 2022 10:27:39 +0800
Message-ID: <CABvJ_xjXAj+d2hr4yY821+YDYkbJMNppOeG1c6dJWeh4fVwydg@mail.gmail.com>
Subject: Re: Adding V-ext regs to signal context w/o expanding kernel struct
 sigcontext to avoid glibc ABI break
To: Vineet Gupta <vineetg@rivosinc.com>
Cc: Florian Weimer <fweimer@redhat.com>, Rich Felker <dalias@libc.org>, 
	Andrew Waterman <andrew@sifive.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Kito Cheng <kito.cheng@sifive.com>, =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>, 
	davidlt@rivosinc.com, Arnd Bergmann <arnd@arndb.de>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Philipp Tomsich <philipp.tomsich@vrull.eu>, Szabolcs Nagy <szabolcs.nagy@arm.com>, 
	Andy Chiu <andy.chiu@sifive.com>, Greentime Hu <greentime.hu@sifive.com>, 
	Aaron Durbin <adurbin@rivosinc.com>, Andrew de los Reyes <adlr@rivosinc.com>, 
	linux-riscv <linux-riscv@lists.infradead.org>, GNU C Library <libc-alpha@sourceware.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_182753_357051_A480A230 
X-CRM114-Status: GOOD (  27.45  )
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

On Fri, Dec 23, 2022 at 3:25 AM Vineet Gupta <vineetg@rivosinc.com> wrote:
>
>
> On 12/21/22 19:37, Vincent Chen wrote:
> > On Thu, Dec 22, 2022 at 3:52 AM Vineet Gupta <vineetg@rivosinc.com> wrote:
> >>
> >>
> >> On 12/21/22 11:45, Vineet Gupta wrote:
> >>> 4. Kernel with RVV support + user program using original Glibc sigcontext
> >>> In this case, the kernel needs to save vector registers context to
> >>> memory. The user program may encounter memory issues if the user space
> >>> does not reserve enough memory size for the kernel to create the
> >>> sigcontext. However, we can't seem to avoid this case since there is
> >>> no flexible memory area in struct sigcontext for future expansion.
> >> This is not an issue, if we don't change sigcontext (in kernel and
> >> glibc) - it is essentially the case of existing binaries.
> >> kernel still saves regs on user stack, in rt_sigframe, its just that
> >> userspace is not able to access them in SA_SIGINFO signal handers.
> >> aarch64 have this implemented this approach and it is likely they can't
> >> do that either for SVE regs.
> > Sorry, I don't clearly describe the case. As you mentioned, the kernel
> > will save the vector registers to the user stack or user-specified
> > memory region by struct rt_sigframe in your patch. But, if there is an
> > existing binary compiled with the original sigcontext.h, it will
> > assume that the kernel only occupies the sizeof(struct sigcontext) to
> > save these registers. It will not aware the RVV extension is supported
> > and not expect that the kernel with RVV support needs an extra huge
> > memory region on its stack or specified memory region to save vector
> > registers context. In this case, the user program will encounter
> > memory corruption issues if the size of the memory region specified by
> > the user program is not enough to store these vector registers'
> > context.
>
> No, it will not. In this scheme struct sigcontext remains same as
> before. Kernel is copying the RVV context not in sigcontext, but beyond
> the canonical sigcontext, in layout specified in the rt_sigframe. Please
> take a look at my patch again. It works.

If I understand correctly, in your patch, the kernel uses rt_sigframe
to back up all register contexts in the user space, including RVV
registers. Therefore, the user program needs to reserve enough memory
space for the kernel, which enough size of this memory space is the
sizeof(rt_sigframe) plus rvv_sc_size. However, the rvv_sc_size is
unexpected to existing RISC-V programs. Therefore, some memory of the
existing program may be corrupted by the kernel when the kernel backs
up the RVV registers context.

>
> Again I don't care what scheme we follow, I just want o make forward
> progress.
>

 I understand your thoughts and I sincerely appreciate everything you do.

> -Vineet
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
