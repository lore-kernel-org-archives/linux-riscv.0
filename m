Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E40C433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Feb 2022 15:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qPtvXCmR2T/vEWoNDLiW3d9XnKF/vQ5AJ5+QXO6kk0I=; b=K0rvVnIGa2Erdo
	ocDhntcUKtsUScQg4Zh8tfzieuT2BKKhLdbYR/LSLY2tU28eoaw1owt1kx6XN25gHlkMLhe5Q/qn2
	FaBqm6meDKKc8MMjOc65ktWHyXa8kY+qHKeDHvrPoqSMzjcwcrZLQ6OE2wR8/vg2eOC+m0An6hAwB
	KlJ3aOMQaBqKTnls0846GR4/eVDMmnTN4V9l+w9KebjnXHkVV+aWdPzLmS7+BHHPmNny2ElSvNlfh
	SuLzwxaUeEP5BStBGzmJDCVZNW5RnY77tu+FPMhJy6bjRb1Hk3QTkEhZkEiIIgGBMsHx3gdoykmvJ
	KI390c6J5ck0fDYoSqaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIucv-00A5bJ-W4; Sat, 12 Feb 2022 15:47:58 +0000
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIuck-00A5Z4-5N; Sat, 12 Feb 2022 15:47:47 +0000
Received: by mail-io1-xd2b.google.com with SMTP id q204so14959217iod.8;
 Sat, 12 Feb 2022 07:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NgeFCi+7UEK+nuh5x7QmJDaX6DxRBY5bpSpry5mSd78=;
 b=Y88Bnv1NDKvFo/zSY71RycxR2B/ACxpaW4T8kK3tqHqqQbpUAV2I1OqHKgzbSdhrDb
 QawjU0J+cVvOy4E4YoIvfXhs2SIP+8Wjor7UFfj9vJs/WzufHZgiGsGzq6HHh/Ihr3im
 3Q1+qditD4ehYRA0/AO80uTEFs6air76y7OZR7ruaDev3sQ47gRVfyCjN6xPjWtWX9gj
 rlTdZE9Q1bvJnL7TULLZH5Q2e/XqaeGAUzpl5Ym7KRemoqCta6NysmF5neqHTJWlPRAS
 KE5tVCBrM5IjxzNOqNkAwn4DNyaUgL5Vx2/ERkqh5aHXiGOirP9g4jhrBxji8VuhuUbZ
 63BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NgeFCi+7UEK+nuh5x7QmJDaX6DxRBY5bpSpry5mSd78=;
 b=exfjLJoBGarc9Wpv/AEzKs4D3JA60Arc9z0MJ0eWJPT3sInr9ZWiiJ5i5YsAOYGdhi
 L09G78vDlg1XewAYTO+0pqnkQsYWR8OHZ6E7Hk5YfwmnM77gFDbYTMSrGVNr8DTOYrv0
 FaUhfeiemBRA+ZRyFF1ba4FI4QRzzDZhHcoW0D/K72wPIPWXVP3NyBmk3FqOGty+xRzw
 BnNZOcrCkQAdk0+7BkJdcV2GAayDThumyB8bmACfLZLd/ab+1xRhGeu3gnyCKa1fB5sc
 YCSHUHclBRZLnLLKGYkf0CsuZDnEU9H6OFsLdPxrlrz6HZa1dAfjin1/Loq+wjovkeh9
 640w==
X-Gm-Message-State: AOAM530mlb2MXwp9udhlx5NlkDgRHzlW1I6HI+gxqlil0M+JnPjpIfN0
 N3S9CfkybbFNZL3eaf4LnqAbaJi4smLK+6tpUMQ=
X-Google-Smtp-Source: ABdhPJzH9YyzNLTg9POFjsMYEBvv50IYOenD6jjVc2LJHnBnXQzNscn5cyEPVT4EBKpUx2wAjYDcVqVZhEvJ8smZXfs=
X-Received: by 2002:a05:6638:4105:: with SMTP id
 ay5mr3853138jab.186.1644680864074; 
 Sat, 12 Feb 2022 07:47:44 -0800 (PST)
MIME-Version: 1.0
References: <20220212130410.6901-1-ojeda@kernel.org>
 <20220212130410.6901-17-ojeda@kernel.org>
 <YgfBUhYdLXA46kOX@shell.armlinux.org.uk>
In-Reply-To: <YgfBUhYdLXA46kOX@shell.armlinux.org.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 12 Feb 2022 16:47:33 +0100
Message-ID: <CANiq72nMhUH1s0HMeLb+hfp5=u3h20ryC4uqAgB1Znuq52e=Pw@mail.gmail.com>
Subject: Re: [PATCH v4 16/20] Kbuild: add Rust support
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Miguel Ojeda <ojeda@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 rust-for-linux <rust-for-linux@vger.kernel.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, 
 Finn Behrens <me@kloenk.de>, Adam Bratschi-Kaye <ark.email@gmail.com>, 
 Wedson Almeida Filho <wedsonaf@google.com>,
 Michael Ellerman <mpe@ellerman.id.au>, 
 Sven Van Asbroeck <thesven73@gmail.com>, Gary Guo <gary@garyguo.net>, 
 Boris-Chengbiao Zhou <bobo1239@web.de>, Boqun Feng <boqun.feng@gmail.com>,
 Douglas Su <d0u9.su@outlook.com>, 
 Dariusz Sosnowski <dsosnowski@dsosnowski.pl>,
 Antonio Terceiro <antonio.terceiro@linaro.org>, 
 Daniel Xu <dxu@dxuuu.xyz>, Miguel Cano <macanroj@gmail.com>, 
 Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
 Paul Mackerras <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, 
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220212_074746_262264_0CB70EFA 
X-CRM114-Status: GOOD (  17.85  )
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

Hi Russell,

On Sat, Feb 12, 2022 at 3:17 PM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> Please don't use CPU_32v6* here.
>
> It probably makes more sense to add a symbol "HAVE_RUST" and have the
> appropriate architecture Kconfig files select HAVE_RUST.

We can do it whatever way arch maintainers prefer, of course. Why
would you prefer one over the other?

> Does Rust support Thumb on ARMv6 and ARMv7 architectures?

Yes, the main backend is LLVM. Some built-in targets and their support
level are listed here, if you want to take a look:

    https://doc.rust-lang.org/nightly/rustc/platform-support.html

There is also a GCC backend in `rustc` [1], which is making good
progress and may eventually give us access to architectures supported
by GCC. Furthermore, a from-scratch Rust frontend for GCC [2] is being
worked on, though this effort will likely take more time to reach a
point where it may be used for the kernel.

[1] https://github.com/rust-lang/rust/tree/master/compiler/rustc_codegen_gcc
[2] https://github.com/Rust-GCC/gccrs

> Please remove every utterance of "default n" from your patch; n is the
> default default which default defaults to, so you don't need to specify
> default n to make the option default to n. It will default to n purely
> because n is the default when no default is specified.

Certainly. I am curious, though: is there a reason for most of the
other 500+ instances in the kernel tree?

> As Rust doesn't support all the architectures that the kernel supports,
> Rust must not be used for core infrastructure.

Yeah, although I am not sure I understand what you are getting at here.

Cheers,
Miguel

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
