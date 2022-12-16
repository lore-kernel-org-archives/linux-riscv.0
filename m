Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D20E4C3DA78
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Dec 2022 22:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fHa7l/yWS3i6ZJzM7J8Vaobbw0u0jLKpo22tPqYRsn8=; b=eOtHscEALxjhFy
	HH6BSclOocD63wuOGsdKS5EVWFIZp6A2sPggl8TIYkCkAOc4CmOhk2UHb8UTyfxhMXZx1Z8X02PcZ
	NG1qVAkFdfldWBreT4DaZnrmIBdccwYHCzCBgeu1RV7FjKYYxCPUuzf+Hrwn4M8RNI9sCJCAv8NTq
	SKfqOxXx1cwQ0yx17al9wSzw7NJHEYXfxlRQT8r4jyJH1v50KPCR+wO0ISacjGUYAeuMbJFevPs2s
	CZq0WKxZzVsX3nnf83O8dEksDjukk45uTYfudlq1HKvgThUOATPqCybcGgacnA94MSljVCPmW+pLf
	FHa1Bynz/JRmif7SvaDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6ImL-001e1N-1n; Fri, 16 Dec 2022 22:02:05 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6Hl3-0010TZ-0v
	for linux-riscv@lists.infradead.org; Fri, 16 Dec 2022 20:56:45 +0000
Received: by mail-wr1-x42a.google.com with SMTP id f18so3670364wrj.5
        for <linux-riscv@lists.infradead.org>; Fri, 16 Dec 2022 12:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v+Af/DEV4PdtRUjyfJ2iTdV76TVrp0C2ayMFKFEVB2c=;
        b=E5nwDI3bKXkw8yYS054w9i5MakXEtfxaEfjrTsaWzDT8rID7jNtodv6vGdTjzbVLTn
         HzkuP1U8qOky4kZukAUFJq8+rJFejRpTu087aZqdvfHilYSouF9Z87dFsx8Y7dyrZFN0
         FCdPQBiS3t6TDK9xjH9TNlf4intPX5+yA85JIhA2ivJgfOK717jVa/qgHsCjlRa9vUfB
         XF0Aqz42To+vwDyVoRRkUqxSGlfW0JNq7CQTws9X5bUP4+sYkd+o4maTBS382zHIGdgB
         UxRHqhHNTFlXWxIqn40vi8jHkgKf3tIQ7ycUfHCFWuZN06WkAdR+GXcTNRLd9zxZxihr
         7VHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v+Af/DEV4PdtRUjyfJ2iTdV76TVrp0C2ayMFKFEVB2c=;
        b=Csirn2fPeuOh3rIUkTJnB7c3p5dib0xitdm6x8B6oOJLxiJoxG5fqaxQgGGD4C3B6L
         nSe06XHQMAYaZL40qteTO/awJlzT3qnxGcKFpaKcTiVJbHzLm0UDRyIegXbzAyNFzSn+
         QXgkS80NmEWb1sfD7CdqHNLr6XSSezubwYxDgC2k8w1b3A+efVKrv1S3bYCra/WrR4Vt
         1Z3sB56+YSWKiJP3dMgmv/TqH6gDhsvm1/Co1JsHw2TJXwlqCvQB8LQM/gPGNOzo3Ko9
         2glqWUR3sZBfMXhlXw7HlONSLdqx8KSR2SbkO82bxR5wLhsCnspoztgRUip8AXGgQsbZ
         JdXw==
X-Gm-Message-State: ANoB5pmXHj5l45jPnj9XCe/bv34k0cOnQ4JRRV4qPYGRh9fKSkik73HK
	aOrMdPhbSsxn3rUGT6niwJMgWL3Gf7zizkiPtwEqvA==
X-Google-Smtp-Source: AA0mqf7EZWN+aK6uCCQcaEO8qTPQ06ENG2JaQIflqu52uZFG510VEzbCZSsopN8buqhZukBi5ngAKcwlaSZnZU4P/cg=
X-Received: by 2002:a5d:5e89:0:b0:242:739d:7f85 with SMTP id
 ck9-20020a5d5e89000000b00242739d7f85mr7843187wrb.407.1671224194704; Fri, 16
 Dec 2022 12:56:34 -0800 (PST)
MIME-Version: 1.0
References: <39636675da60fc6c54cc8bbab64ddbac@codethink.co.uk> <mhng-d601613f-1c73-48e0-bb06-7f87acd60cfa@palmer-ri-x1c9a>
In-Reply-To: <mhng-d601613f-1c73-48e0-bb06-7f87acd60cfa@palmer-ri-x1c9a>
From: Saleem Abdulrasool <abdulras@google.com>
Date: Fri, 16 Dec 2022 12:56:23 -0800
Message-ID: <CAO8XFHth5tJWi8EYag1FnOgD38i2pDe87G3u2dkkP+-gkYBZkg@mail.gmail.com>
Subject: Re: [PATCH] riscv: avoid enabling vectorized code generation
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: ben.dooks@codethink.co.uk, ndesaulniers@google.com, nathan@kernel.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221216_125641_171564_0B2552EB 
X-CRM114-Status: GOOD (  24.05  )
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

On Fri, Dec 16, 2022 at 11:54 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Fri, 16 Dec 2022 11:45:21 PST (-0800), ben.dooks@codethink.co.uk wrote:
> >
> >
> > On 2022-12-16 18:50, Saleem Abdulrasool wrote:
> >> The compiler is free to generate vectorized operations for zero'ing
> >> memory.  The kernel does not use the vector unit on RISCV, similar to
> >> architectures such as x86 where we use `-mno-mmx` et al to prevent the
> >> implicit vectorization.  Perform a similar check for
> >> `-mno-implicit-float` to avoid this on RISC-V targets.
> >
> > I'm not sure if we should be emitting either of the vector or floating
> > point instrucitons in the kernel without explicitly marking the section
> > of code which is using them such as specific accelerator blocks.
>
> Yep, we can't let the compiler just blindly enable V or F/D.  V would
> very much break things as we have no support, but even when that's in
> we'll we at roughly the same spot as F/D are now where we need to handle
> the lazy save/restore bits.
>
> This looks like an LLVM-only option, I see at least some handling here
>
> https://github.com/llvm/llvm-project/blob/a72883b7612f5c00b592da85ed2f1fd81258cc08/clang/lib/Driver/ToolChains/Clang.cpp#L2098
>
> but I don't really know LLVM enough to understand if there's some
> default for `-mimplicit-float` and I can't find anything in the docs.
> If it can be turned on by default and that results in F/D/V instructions
> then we'll need to explicitly turn it off, and that would need to be
> backported.

Yes, this is an LLVM option, but I think that the `cc-option` wrapping
should help ensure that we do not break the gcc build.  This only
recently was added to clang, so an older clang would also miss this
flag.  The `-mimplicit-float` is the default AFAIK, which is why we
needed to add this flag in the first place.  Enabling V exposed this,
which is why the commit message mentions vector.

>
> Maybe Nick or Nathan knows what's up here?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
