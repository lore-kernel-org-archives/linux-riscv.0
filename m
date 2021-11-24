Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85384C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Nov 2021 08:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9wvHMbKPK0u+SgTMId3e/C2j+98MJ1F7SOCQ+SeY5PE=; b=W43jjCU+MUAIC1
	1a8W9sd035NskuJt4s0iZMWZAK70HqXRRfDCbbOp077q2ViWyCANFj2XHG/Tx4H24yeOF69tIgoa0
	gR81H5kck7Q6jdCMLRH9OeUpMgNoNIB3igN7oBsfyfTLynETlfgOhVo1kgSsU5HUVAEQnkuJJNwur
	UURCQPpEDtgSnhyzXcqqIVYz2CEKc8ku6lQttzIZPnJHoPcHR8AueGYHsjvyCMaCgJpbLL7Z7iJW8
	WDf9cQRnyct3Gkbx0g4LOu2m7iK8Sui88NtiF5k+SW3BH5FUw/HCFhyIKd/RMIn+SwtNCx5bx+uSP
	jMiI7kZjnWiplqd7LMYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpnQl-004ESD-Ck; Wed, 24 Nov 2021 08:15:03 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpnQh-004EPp-Ev
 for linux-riscv@lists.infradead.org; Wed, 24 Nov 2021 08:15:01 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 277286101D
 for <linux-riscv@lists.infradead.org>; Wed, 24 Nov 2021 08:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637741699;
 bh=dko9EeLRbwlSDjDLJNhUXUtMjKbVVTOsFc2Z8Xm8EYM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=oOShSW/snMf2l47amNurzb1YazgWBF0jFLhgJ9/LrMhwdOjBXln3LxBxabY5CAPz9
 SRPlX12JfovoIk+FcWI/pmVA+LyUDo8Kq9eHTCT22QWRSJt913Ax1aZbfZBLDu0uUF
 UeS35Cwm7GL9nG/5zST7///6DVXeY/hSI8kfAZeicsMupG8G4WVZxg0U6BpF/93511
 0jvpUiGDhEshMd3x/J2OWc79UfCCZmRT9IzW8Zxug4OrLyRn1dprApwBebLmns1ckJ
 kOu9cvIr+9yQ8vRShCXoqWFy1/zJt57+8G0VK5JIyL6zI/1xlcSItfAgJWdxOHAVc+
 VvI67ZohYk7Fw==
Received: by mail-yb1-f173.google.com with SMTP id e136so4970789ybc.4
 for <linux-riscv@lists.infradead.org>; Wed, 24 Nov 2021 00:14:59 -0800 (PST)
X-Gm-Message-State: AOAM532TQ+EA/xZjGO1r7JhKxlXPec0lHbAuCfuoYX5p+xQF1018NOTE
 N7x721/gMNjiZlvsiKWBuPktG2pMd/ZLqvo2c5A=
X-Google-Smtp-Source: ABdhPJwkh+xkx/h2SQ1t5DS0cTDPoNSK7vXv6fwwvYjVa8G70GBlI/v3I9rjRGzuZJrw9su8IxEHobLfI7hp1UWhGUs=
X-Received: by 2002:a25:344d:: with SMTP id b74mr14908992yba.317.1637741698268; 
 Wed, 24 Nov 2021 00:14:58 -0800 (PST)
MIME-Version: 1.0
References: <20211120165528.197359-1-kuba@kernel.org>
 <CAPhsuW4g1PhdczQh=iqDR_CzB=6FoM4QPF9DmknEP0hZ_Ac3TA@mail.gmail.com>
 <d4c52f8f-7efb-3d2a-8f2e-c983cd0c8cce@arm.com>
In-Reply-To: <d4c52f8f-7efb-3d2a-8f2e-c983cd0c8cce@arm.com>
From: Song Liu <song@kernel.org>
Date: Tue, 23 Nov 2021 22:14:46 -1000
X-Gmail-Original-Message-ID: <CAPhsuW6CMBymKpOMdL-bianESBLfbKa5JwmFypKL3dx4k0rmSQ@mail.gmail.com>
Message-ID: <CAPhsuW6CMBymKpOMdL-bianESBLfbKa5JwmFypKL3dx4k0rmSQ@mail.gmail.com>
Subject: Re: [PATCH bpf] cacheinfo: move get_cpu_cacheinfo_id() back out
To: James Morse <james.morse@arm.com>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>, fenghua.yu@intel.com,
 reinette.chatre@intel.com, 
 bpf <bpf@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, dave.hansen@linux.intel.com,
 X86 ML <x86@kernel.org>, 
 "H. Peter Anvin" <hpa@zytor.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>,
 linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211124_001459_556428_72C11E44 
X-CRM114-Status: GOOD (  25.69  )
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

On Tue, Nov 23, 2021 at 8:49 AM James Morse <james.morse@arm.com> wrote:
>
> Hello,
>
> On 23/11/2021 17:45, Song Liu wrote:
> > On Sat, Nov 20, 2021 at 6:55 AM Jakub Kicinski <kuba@kernel.org> wrote:
> >>
> >> This commit more or less reverts commit 709c4362725a ("cacheinfo:
> >> Move resctrl's get_cache_id() to the cacheinfo header file").
> >>
> >> There are no users of the static inline helper outside of resctrl/core.c
> >> and cpu.h is a pretty heavy include, it pulls in device.h etc. This
> >> trips up architectures like riscv which want to access cacheinfo
> >> in low level headers like elf.h.
> >>
> >> Link: https://lore.kernel.org/all/20211120035253.72074-1-kuba@kernel.org/
> >> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> >> ---
>
> >> x86 resctrl folks, does this look okay?
> >>
> >> I'd like to do some bpf header cleanups in -next which this is blocking.
> >> How would you like to handle that? This change looks entirely harmless,
> >> can I get an ack and take this via bpf/netdev to Linus ASAP so it
> >> propagates to all trees?
> >
> > Does this patch target the bpf tree, or the bpf-next tree? If we want to unblock
> > bpf header cleanup in -next, we can simply include it in a set for bpf-next.
>
>
> Some background: this is part of the mpam tree that wires up resctrl for arm64. This patch
> floated to the top and got merged with some cleanup as it was independent of the wider
> resctrl changes.
>
> If the cpu.h include is the problem, I can't see what that is needed for. It almost
> certainly came in with a lockdep annotation that got replaced by a comment instead.

Thanks for the information.

I can ack the patch for the patch itself.

Acked-by: Song Liu <songliubraving@fb.com>

But I am not sure whether we should ship it via bpf tree. It seems to
me that the
only reason we ship it via bpf tree is to get it to upstream ASAP?

Alexei/Daniel/Andrii, what do you think about this?

Thanks,
Song

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
