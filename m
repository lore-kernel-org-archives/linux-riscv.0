Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F1BC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Dec 2022 16:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tybnT3DxH+MvxY7+RJp7MQefuh6LwxU+0SV0TWdHUKE=; b=403SZqLU5h9WSw
	/FTNZJ7YjiUqoYwWVk9tXYNmgMSv84v1YvlnzLklPlapD0zjoT4bAanBZDua/s+ooNqMtnkCa/8nY
	uKVU7BUzH1Z6MbJ2niXbvPUdLe2bLWuljj1DJuOW6zqJ5IAw1WNTQcehCEu13ScH5DVvQuZVzTVoD
	6dEtdKvbBOa9L9CwBF81+Y7kGQ0hYUEInjfR8pYwTWRErNQqbugP5wTPtRB0FFCQTdc5jgyZEHVNX
	lzT6Xi3UEVjy50FEBcCq3Ip+EznpbI8nwKiCFrbj/9yLhqIFjMZAs01/ZVJx1jJleO7yAk541PMSj
	INbIOpENNlUreyRM4LrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7JTP-00GPN9-4R; Mon, 19 Dec 2022 16:58:43 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7Hxe-00FIHr-PR
	for linux-riscv@lists.infradead.org; Mon, 19 Dec 2022 15:21:52 +0000
Received: by mail-wm1-x32c.google.com with SMTP id v7so6702070wmn.0
        for <linux-riscv@lists.infradead.org>; Mon, 19 Dec 2022 07:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ah1XfLb1oRte6SMokDx7hbNvXEAvKr70rzYhUhq1E7Y=;
        b=ijDMPek0chBV48nDJ22NRicFT+sTyv5d6nyklbgFNwaHDJhYRxoWPpa+RfxeZunQja
         MeGuhx8KrFtQ+kXi+hrxxqUF5vRB5sBUnN7nFBsM6CrUoDoeSOBSuLjkM5dYf1f836x8
         BlpVNOmclJhCD7SDoeR/s21zS5FoDZY0ndQkm9C6L/2mP1g/vTcH4dlSeL5YVOd/mTeD
         vfqjk5zYLO57xT1SDyuQO+/qXPgdShK/l58LQvpolVEdbkYjnZ1VAldJ0acDdJu+rCQ/
         lpHA1aZFX2TIlla9GEEaOSZCFXR+ToxYWT7wsBatlzsnS7ao1JUzJSPO9AagpUQLw1Xm
         RMPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ah1XfLb1oRte6SMokDx7hbNvXEAvKr70rzYhUhq1E7Y=;
        b=Yk9FSSRaBZCSvsDElcL5lnJ8OrKP8eeJhomLZ0EHVzg7DF2Ok3hOsr9kUpVAfqnXIW
         nJFuc85zGCtg3cjjIJpeEj2IHUH6I5VSex59qywhqKY35OSPFoOxGYYEqGqAbV9eF9ny
         ARrt5y5Bdp0lWzXzdqWSTtytw0FvBEbyqUUx9bSWb5ZPAjMB/rpG/uIFcwz7+25RuDa7
         d5QsrxGzCd/+wKy0gwuP/6Qbe/IEXlWgY7RMIKf1cEkN55XLKDmVbPe74JIP62FMTLnF
         9JsyWEgtJnspsP8bv5k2Ul2DEpxK/j6Qz3HzMtXhIX2shigV8BAwVLujnYJD36gAClHT
         o5wQ==
X-Gm-Message-State: ANoB5pnJNhvgQ3KXzuSVx95vtnkozVl+xg44g6WDYggcgshPCy0YXZla
	NmkzXqeVPt2T6tlBDh10FV/Ohcwe4b5JjwWV1EBK/g==
X-Google-Smtp-Source: AA0mqf4IUPBiTbYGN4SrkL+NSourN3QywnwqvdYhkVuocdmUXY+YASSPmrR5bIBRumwhhcl30Waa52cRa+ZI7FcIO5g=
X-Received: by 2002:a05:600c:1c99:b0:3cf:71e4:75b with SMTP id
 k25-20020a05600c1c9900b003cf71e4075bmr1615009wms.114.1671463303463; Mon, 19
 Dec 2022 07:21:43 -0800 (PST)
MIME-Version: 1.0
References: <39636675da60fc6c54cc8bbab64ddbac@codethink.co.uk>
 <mhng-d601613f-1c73-48e0-bb06-7f87acd60cfa@palmer-ri-x1c9a>
 <CAO8XFHth5tJWi8EYag1FnOgD38i2pDe87G3u2dkkP+-gkYBZkg@mail.gmail.com> <E9917D44-4C61-4806-8A79-7F24AF504DA3@kernel.org>
In-Reply-To: <E9917D44-4C61-4806-8A79-7F24AF504DA3@kernel.org>
From: Saleem Abdulrasool <abdulras@google.com>
Date: Mon, 19 Dec 2022 07:21:32 -0800
Message-ID: <CAO8XFHvf9UE8abprkjiKx0RvMCDkyGdpc_MSoFk2pQCyA2qmxA@mail.gmail.com>
Subject: Re: [PATCH] riscv: avoid enabling vectorized code generation
To: Conor Dooley <conor@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, ben.dooks@codethink.co.uk, ndesaulniers@google.com, 
	nathan@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221219_072150_940426_0CF5E2EC 
X-CRM114-Status: GOOD (  29.78  )
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

On Fri, Dec 16, 2022 at 6:02 PM Conor Dooley <conor@kernel.org> wrote:
>
>
>
> On 16 December 2022 12:56:23 GMT-08:00, Saleem Abdulrasool <abdulras@google.com> wrote:
> >On Fri, Dec 16, 2022 at 11:54 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> >>
> >> On Fri, 16 Dec 2022 11:45:21 PST (-0800), ben.dooks@codethink.co.uk wrote:
> >> >
> >> >
> >> > On 2022-12-16 18:50, Saleem Abdulrasool wrote:
> >> >> The compiler is free to generate vectorized operations for zero'ing
> >> >> memory.  The kernel does not use the vector unit on RISCV, similar to
> >> >> architectures such as x86 where we use `-mno-mmx` et al to prevent the
> >> >> implicit vectorization.  Perform a similar check for
> >> >> `-mno-implicit-float` to avoid this on RISC-V targets.
> >> >
> >> > I'm not sure if we should be emitting either of the vector or floating
> >> > point instrucitons in the kernel without explicitly marking the section
> >> > of code which is using them such as specific accelerator blocks.
> >>
> >> Yep, we can't let the compiler just blindly enable V or F/D.  V would
> >> very much break things as we have no support, but even when that's in
> >> we'll we at roughly the same spot as F/D are now where we need to handle
> >> the lazy save/restore bits.
> >>
> >> This looks like an LLVM-only option, I see at least some handling here
> >>
> >> https://github.com/llvm/llvm-project/blob/a72883b7612f5c00b592da85ed2f1fd81258cc08/clang/lib/Driver/ToolChains/Clang.cpp#L2098
> >>
> >> but I don't really know LLVM enough to understand if there's some
> >> default for `-mimplicit-float` and I can't find anything in the docs.
> >> If it can be turned on by default and that results in F/D/V instructions
> >> then we'll need to explicitly turn it off, and that would need to be
> >> backported.
> >
> >Yes, this is an LLVM option, but I think that the `cc-option` wrapping
> >should help ensure that we do not break the gcc build.  This only
> >recently was added to clang, so an older clang would also miss this
> >flag.  The `-mimplicit-float` is the default AFAIK, which is why we
> >needed to add this flag in the first place.  Enabling V exposed this,
> >which is why the commit message mentions vector.
>
> You've said "enabling V" in the comment and here.
> By that, do you mean when V support is enabled in clang or when it is enabled in Linux?

Excellent distinction.  I meant enabled in the compiler, enabling it
in the kernel is not yet possible without the pending patchset.  This
makes us robust to when that patchset is merged, but in the meantime,
this protects against the V extension being enabled in the toolchain.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
