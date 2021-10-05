Return-Path: <SRS0=Z6yX=OZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47321C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Oct 2021 00:36:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9AC0613B5
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Oct 2021 00:36:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E9AC0613B5
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=NXPWwuv1KFYHNFTGRiRSDdvJ9bSGb9TsWp89gMQcTfQ=; b=x3EM0nMfGOkPPY6HJHn/L352dw
	IDGOxZL3zB6tuDzhVxG/OK4aVerkyqc1WeRWylmSfmMdZzN8i2AZOZhM2l0CFgQH0Dv5R2gRddkX5
	ZBOVlRpjtwtVbXQ0c7tfvWFSobj0j53WeUdr9l5I8VjbI7ffBHN7yoGTcp1B4YMthfI7UIKsSFezI
	P0TQdqzEDSU9WGnXZGxn9dXloRq3PXeEZx5Y6/NZYk+EOsB4iJfi8hOmz0xIqqHXN/8yBrFao1BOM
	VISgDOQW/g8LoqWdw1MkoSRWM6mXN6GCZYkUA0yLxdO2VsxBxQy6++WSKcPeT0o4wTxl+3cl9T7qz
	2kBCuQLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXYQs-008Sqn-R4; Tue, 05 Oct 2021 00:35:46 +0000
Received: from mail-ua1-x934.google.com ([2607:f8b0:4864:20::934])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXYQp-008Spv-Qf
 for linux-riscv@lists.infradead.org; Tue, 05 Oct 2021 00:35:45 +0000
Received: by mail-ua1-x934.google.com with SMTP id u5so10744468uao.13
 for <linux-riscv@lists.infradead.org>; Mon, 04 Oct 2021 17:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=0l5p0oE25SqlRLFMCCo2EWRTCPhDAqiXcOcdg7xVq1M=;
 b=ejuDgM8fmefZMUg3Jx2LeaRwi6b9kq8lSJKUxN8jCsFqiTUmXH3Svzmal9VU5eVFum
 Zg7tuD/lrSRPLUFFQTVcqjkO5q8zL4TA4a2zz8IgPZCArY7VUWYbxEF49COMMoP0nkTM
 teh8alqCaTTktQL69QAezC/jeF+DfIxnp0SEWUVbogUrB13IIBCmXbS3bRgLN9OxfRu4
 pNXAozDqp0gt/aO3BFvj6AvvkkuzwTOJWYXaP6J5fl0eptabu8o2uk+pW30JXyBK6bcM
 2gshRIWzj2LaRUMVRSXSh0LSxG8uHN8xqYY6iwU9jeAvs7Ogt9aIf/rEKhY83mDwm/HR
 0fwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=0l5p0oE25SqlRLFMCCo2EWRTCPhDAqiXcOcdg7xVq1M=;
 b=AZfuYvsX8oExqKiQEqMbSbrxN1S3qLAnuXABD3skdOJkIKscDW1iFQ0rMewyza4dkU
 MbVL1DyGjisJnF3U/lukL51ctzekcZ3aAnh3rWi2lfr/7dKkMSR4MJ7ivXnEXi7C+NZn
 pQmCR3E5fCQZ4nztHkdxhjwhwYbwNCCGdffoB5oeoS/qQFiIU0LmBYIbezi1X2mb1oSZ
 UWjRSqtFosO7vVxpVPWbMYbolDX3/79C458B8M7s/l6w/I4MIt/MdKArYcdsW9eMjgTv
 LSvIqiSwMyHtwvpC7NgpQvVQfhFBuYUvUg6V8Q0xL8WeXpKK0MrnOz92HDm6EVlSfTmU
 20SQ==
X-Gm-Message-State: AOAM53011n6HnBFaWtZsKkuTG47AC4wk/kQI5AFH2jUFJo0CfSq0Yz3K
 /A+K4dRlpDDTP1N1MEkKLyFL+Q==
X-Google-Smtp-Source: ABdhPJwwCbODZAmdlHTct0WG9V3q+5xFprMFyk6J4nicYFya2JLGnSGHMjclaFE/ckmqCOs8CKTF1w==
X-Received: by 2002:ab0:4a9d:: with SMTP id s29mr10047253uae.104.1633394142354; 
 Mon, 04 Oct 2021 17:35:42 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id o3sm7542542vsc.26.2021.10.04.17.35.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 17:35:40 -0700 (PDT)
Date: Mon, 04 Oct 2021 17:35:40 -0700 (PDT)
X-Google-Original-Date: Mon, 04 Oct 2021 17:35:36 PDT (-0700)
Subject: Re: [PATCH] RISC-V: Include clone3() on rv32
In-Reply-To: <20211004111758.rl2zq6l575hmcv22@wittgenstein>
CC: Arnd Bergmann <arnd@arndb.de>, linux-riscv@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 christian@brauner.io, linux-kernel@vger.kernel.org, 
 kernel-team@android.com
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: christian.brauner@ubuntu.com
Message-ID: <mhng-73210076-6df9-44e7-8c1a-09ced50fe4c0@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211004_173543_914904_FC446446 
X-CRM114-Status: GOOD (  26.31  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 04 Oct 2021 04:17:58 PDT (-0700), christian.brauner@ubuntu.com wrote:
> On Sun, Oct 03, 2021 at 05:30:24PM +0200, Arnd Bergmann wrote:
>> On Sun, Oct 3, 2021 at 2:58 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>> >
>> > From: Palmer Dabbelt <palmerdabbelt@google.com>
>> >
>> > As far as I can tell this should be enabled on rv32 as well, I'm not
>> > sure why it's rv64-only.  checksyscalls is complaining about our lack of
>> > clone3() on rv32.
>> >
>> > Fixes: 56ac5e213933 ("riscv: enable sys_clone3 syscall for rv64")
>> > Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
>>
>> We should probably reverse the polarity of this symbol and force
>> architectures that don't implement it properly to say they don't
>> have it, but for now, it definitely makes sense to treat this the same
>> way on 32-bit and 64-bit risc-v.
>
> I think we had that discussion back when I added it and I think I even
> proposed that or you did but then we settled on __ARCH_WANT_SYS_CLONE3.
> Most likely because it fell in line with the other
> __ARCH_WANT_SYS_{CLONE,FORK}.
>
> I think at this point its alpha, ia64, nios, sparc, and sh that don't
> implement it. For some it looks trivial at first glance at least (Fwiw,
> nios implements sys_clone() but doesn't select __ARCH_WANT_SYS_CLONE3):
>
> diff --git a/arch/nios2/include/uapi/asm/unistd.h b/arch/nios2/include/uapi/asm/unistd.h
> index 0b4bb1d41b28..6c4f45abd3ab 100644
> --- a/arch/nios2/include/uapi/asm/unistd.h
> +++ b/arch/nios2/include/uapi/asm/unistd.h
> @@ -18,6 +18,7 @@
>
>   #define sys_mmap2 sys_mmap_pgoff
>
> +#define __ARCH_WANT_SYS_CLONE3
>  #define __ARCH_WANT_RENAMEAT
>  #define __ARCH_WANT_STAT64
>  #define __ARCH_WANT_SET_GET_RLIMIT
> diff --git a/arch/nios2/kernel/entry.S b/arch/nios2/kernel/entry.S
> index 0794cd7803df..c1804bda8259 100644
> --- a/arch/nios2/kernel/entry.S
> +++ b/arch/nios2/kernel/entry.S
> @@ -396,6 +396,15 @@ ENTRY(sys_clone)
>         RESTORE_SWITCH_STACK
>         ret
>
> +/*
> + * int clone3(struct clone_args __user *, uargs, size_t, size)
> + */
> +ENTRY(sys_clone3)
> +       SAVE_SWITCH_STACK
> +       call    sys_clone3
> +       RESTORE_SWITCH_STACK
> +       ret
> +
>  ENTRY(sys_rt_sigreturn)
>         SAVE_SWITCH_STACK
>         mov     r4, sp

Thanks.

I've put this on fixes, but if you're trying to do that refactoring I've 
merged it in as a single patch on top of 5.15-rc1.  That's on 
palmer/riscv-clone3, in case it helps someone avoid a conflict when 
doing that refactoring.  I'd usually offer to do the refactoring, but 
I'm super buried right now with all the RISC-V stuff ;)

I want to call this fix because it's breaking my builds, these 
checksyscall warnings have recently turned into errors.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
