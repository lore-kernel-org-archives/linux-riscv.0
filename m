Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA9A9C4332F
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Dec 2022 02:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SmEzvlc0VVCoaPkJnPk7xTk2y4S7jdsAQCb2G5Ed8M0=; b=vJQFc47kjgoCe1
	tjNWXvYvL9dXDGdporxzD0F+M/4x7coM/O+xoZDimJNJNadwzh5b3QRcOe+QHSppjXMfhoTliXouQ
	U9lRxpH2DaClYa7dRIJb7uemRRB179GHiHx15RXE7rus9v44qrCvJjI3kd0eSNgtfgJU1OsCR0QgD
	ad0g1vO0j0Zrn0qCl8xdOCIQgMiVW0fLoPM4aWCbFA5X2Ny+CerdaoeGnE8PNuguX9nH5r8KIfL7x
	AQwPvcDSULyHmk2rNdW32mgIGmhSkIGJ7Ho9fLeYz5Yb/vfvm2cmVY3hbmLDV33enZACzhJmGRO8M
	GVeNBtVlWZIt9vBz5b6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6MX1-0040Fl-Qo; Sat, 17 Dec 2022 02:02:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6MWy-0040Cu-JY
	for linux-riscv@lists.infradead.org; Sat, 17 Dec 2022 02:02:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0B4A1622C1;
	Sat, 17 Dec 2022 02:02:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F19A0C433EF;
	Sat, 17 Dec 2022 02:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671242543;
	bh=hWsOsRWCPRQzGgj30nGOWM5Z6p5zGzmmLaNLn5OgsUs=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=ZGv/1x5INDx3SYs62tpgQuKKSqx+ghEqerALquiN6xBfHsVfATsKS+fr5lMSxgB1K
	 AEkgEKnnJg2PL28stQpRsWDV+cL9eXigvsOQ+GwcouQvkeJG8QyfnsAPWHfgK9j5Yb
	 IHAMgTSwCGGL3Xnhslm89L5Z6M2/Xwqc5AOdftYSL57e+ZghxQfPJ0UKMNIK482Ntb
	 4A+Vt9aTYx3O7u1lnLGPSw4NTRpJmkh/DyarK2v6KYnymvn9DmJJ3Exdl5Z8yo8fy8
	 cWDvZ3ce3qlW/pIyMiVByLkB6ttuSBAriTt7CJ7Kw1ECZEcWcesqXWYfXVazlldA7J
	 3A2nbJyhIATcQ==
Date: Fri, 16 Dec 2022 18:02:15 -0800
From: Conor Dooley <conor@kernel.org>
To: Saleem Abdulrasool <abdulras@google.com>, Palmer Dabbelt <palmer@dabbelt.com>
CC: ben.dooks@codethink.co.uk, ndesaulniers@google.com, nathan@kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: avoid enabling vectorized code generation
User-Agent: K-9 Mail for Android
In-Reply-To: <CAO8XFHth5tJWi8EYag1FnOgD38i2pDe87G3u2dkkP+-gkYBZkg@mail.gmail.com>
References: <39636675da60fc6c54cc8bbab64ddbac@codethink.co.uk> <mhng-d601613f-1c73-48e0-bb06-7f87acd60cfa@palmer-ri-x1c9a> <CAO8XFHth5tJWi8EYag1FnOgD38i2pDe87G3u2dkkP+-gkYBZkg@mail.gmail.com>
Message-ID: <E9917D44-4C61-4806-8A79-7F24AF504DA3@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221216_180228_741784_F762A5DA 
X-CRM114-Status: GOOD (  22.38  )
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



On 16 December 2022 12:56:23 GMT-08:00, Saleem Abdulrasool <abdulras@google.com> wrote:
>On Fri, Dec 16, 2022 at 11:54 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>>
>> On Fri, 16 Dec 2022 11:45:21 PST (-0800), ben.dooks@codethink.co.uk wrote:
>> >
>> >
>> > On 2022-12-16 18:50, Saleem Abdulrasool wrote:
>> >> The compiler is free to generate vectorized operations for zero'ing
>> >> memory.  The kernel does not use the vector unit on RISCV, similar to
>> >> architectures such as x86 where we use `-mno-mmx` et al to prevent the
>> >> implicit vectorization.  Perform a similar check for
>> >> `-mno-implicit-float` to avoid this on RISC-V targets.
>> >
>> > I'm not sure if we should be emitting either of the vector or floating
>> > point instrucitons in the kernel without explicitly marking the section
>> > of code which is using them such as specific accelerator blocks.
>>
>> Yep, we can't let the compiler just blindly enable V or F/D.  V would
>> very much break things as we have no support, but even when that's in
>> we'll we at roughly the same spot as F/D are now where we need to handle
>> the lazy save/restore bits.
>>
>> This looks like an LLVM-only option, I see at least some handling here
>>
>> https://github.com/llvm/llvm-project/blob/a72883b7612f5c00b592da85ed2f1fd81258cc08/clang/lib/Driver/ToolChains/Clang.cpp#L2098
>>
>> but I don't really know LLVM enough to understand if there's some
>> default for `-mimplicit-float` and I can't find anything in the docs.
>> If it can be turned on by default and that results in F/D/V instructions
>> then we'll need to explicitly turn it off, and that would need to be
>> backported.
>
>Yes, this is an LLVM option, but I think that the `cc-option` wrapping
>should help ensure that we do not break the gcc build.  This only
>recently was added to clang, so an older clang would also miss this
>flag.  The `-mimplicit-float` is the default AFAIK, which is why we
>needed to add this flag in the first place.  Enabling V exposed this,
>which is why the commit message mentions vector.

You've said "enabling V" in the comment and here.
By that, do you mean when V support is enabled in clang or when it is enabled in Linux?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
