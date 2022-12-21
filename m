Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC913C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Dec 2022 17:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BNJ66/rXocjs7O0vDwxR1HsZJrNDyeeNTNLZG+U+ipU=; b=XqHzCBmK8/Ttbv
	BMJbNVopXD3K9A/TpyBzC99JrrRE0dYyebTLkwmKPrgZi9sRDabGrNDfNBBoZ+fe9yQmdv96UxEaq
	iuruWZE2Ge6A38+g/f0RdSs4zINAhLu52aIPsOJBkki30UWDEsN4uqSlbvQ+WkUBVlDm9bqegzFT5
	4RbjYUCODMuZu0nJU4xxoSqJFrP3D8kTagtWWNCIsjRav2dnYInweXu/gyVbl7g/j9HHm7v38U3Cs
	TgooeL4mSvFSZi0fKTT9QznwqeRT5VhL3rxCitTik3c9tk9MkMEeKR+pY62YF9JVPR36Wq8i4E12D
	xDX8c+YVGGC4S0tyQCtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p834i-00Hb7k-CK; Wed, 21 Dec 2022 17:40:16 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p833s-00HaWx-Ir
	for linux-riscv@lists.infradead.org; Wed, 21 Dec 2022 17:39:26 +0000
Received: by mail-wr1-x42b.google.com with SMTP id f18so15680639wrj.5
        for <linux-riscv@lists.infradead.org>; Wed, 21 Dec 2022 09:39:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fR1kbCDUkA9DvVzs/WSk5pBrfny7Vm/0ugw0mQRZKMc=;
        b=UcpPcCzlTg6O7p4UU3mS50/UlE8ElDXkJVzXxNw0j+PVmRIF0GJYY5QeDNHyqDQ5Pg
         /SgFNijVGIjIyqOosw9KjkqPExMt6fmY5lCSSmz2zj2r6skVbDAhUTvGB7qAjK2h1qrl
         hRCi2YmDlYSGUZPn2H1uMzIi2RpwhkkQtyWTlivZR89oX1dAk4QZtY0FQyNrprEu0tUy
         q9LTJ9yPDZ5NZn8xOGFgdjU0k2pp5tUmutGqzdYTOoKlKCgbLy0kFmyQd3IYdqLlaUIE
         d0+DpYfwK3ZxbyTHts4i+oJAn96CpHlR+ZF9sVSZz2EJ7bEdLNFx6a9ng5Zz01SggLv8
         Xesw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fR1kbCDUkA9DvVzs/WSk5pBrfny7Vm/0ugw0mQRZKMc=;
        b=L4iv8IHv0UqYsxQS0E8/69lpNubDXRBv3m9hj6Mqv5yYricpBT2UBiQfFlUjsiprMd
         7nz15Wd8ABg5hR35NJMRn3k4eG3S0O2K3rJ3DPQvEsSmCFs7+lHCfZYts3wwd3e7aRzl
         pxAcq3oMXr7R5ApHEuFPr9w7gvWlNMlrBY5Wbl9HXuDfNgX2rPGMlD4EX54oBICo/6CZ
         /gBushEnhVgJFGZQAhlm8gU7iCgExHK1rCSJ8coeDfP7EoKRJXFYK/1MBL9+ul9DT1Yw
         CufMNqNrgHIapSXYRoC1rm8drddbAPUWpwSqyDKfi5zrUd1ROBcajVmrM7hzFmo7jFj/
         8H+w==
X-Gm-Message-State: AFqh2koiibm+s1nsIn05dD6GMXW0vkaB9MtvGDDS/mqIgr4aKiBxht8h
	0EebEbhN0S6GfXWtpG01g68qrB8wMrLDx0mUtZikgg==
X-Google-Smtp-Source: AMrXdXvwgkUIHGbRYtwbc3maX91bHhDzczQHQxN9LoNIF9j0O3LJznArds+7tZrUlrS1lITiA7W8NoNZMQJhR8axU6w=
X-Received: by 2002:adf:eb09:0:b0:242:739d:7f85 with SMTP id
 s9-20020adfeb09000000b00242739d7f85mr75763wrn.407.1671644354463; Wed, 21 Dec
 2022 09:39:14 -0800 (PST)
MIME-Version: 1.0
References: <20221216185012.2342675-1-abdulras@google.com> <CAEUhbmUsFt0H-Dd3XHjuk6sUq0hrV9SFU=1jD2LQ10xywZOZiA@mail.gmail.com>
In-Reply-To: <CAEUhbmUsFt0H-Dd3XHjuk6sUq0hrV9SFU=1jD2LQ10xywZOZiA@mail.gmail.com>
From: Saleem Abdulrasool <abdulras@google.com>
Date: Wed, 21 Dec 2022 09:39:02 -0800
Message-ID: <CAO8XFHv_wV_oSuS+e412yr6vjm-44Vf2gJuMO4FvgPeodhWQww@mail.gmail.com>
Subject: Re: [PATCH] riscv: avoid enabling vectorized code generation
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221221_093924_675288_BB904654 
X-CRM114-Status: GOOD (  24.78  )
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

On Wed, Dec 21, 2022 at 8:17 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hi,
>
> On Sat, Dec 17, 2022 at 3:12 AM Saleem Abdulrasool <abdulras@google.com> wrote:
> >
> > The compiler is free to generate vectorized operations for zero'ing
> > memory.  The kernel does not use the vector unit on RISCV, similar to
> > architectures such as x86 where we use `-mno-mmx` et al to prevent the
> > implicit vectorization.  Perform a similar check for
> > `-mno-implicit-float` to avoid this on RISC-V targets.
> >
> > Signed-off-by: Saleem Abdulrasool <abdulras@google.com>
> > ---
> >  arch/riscv/Makefile | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> > index 0d13b597cb55..68433476a96e 100644
> > --- a/arch/riscv/Makefile
> > +++ b/arch/riscv/Makefile
> > @@ -89,6 +89,10 @@ KBUILD_AFLAGS_MODULE += $(call as-option,-Wa$(comma)-mno-relax)
> >  # architectures.  It's faster to have GCC emit only aligned accesses.
> >  KBUILD_CFLAGS += $(call cc-option,-mstrict-align)
> >
> > +# Ensure that we do not vectorize the kernel code when the `v` extension is
> > +# enabled.  This mirrors the `-mno-mmx` et al on x86.
> > +KBUILD_CFLAGS += $(call cc-option,-mno-implicit-float)
>
> This looks like an LLVM flag, but not GCC.

Correct, this is a clang flag, though I imagine that GCC will need a
similar flag once it receives support for the V extension.

> Can you elaborate what exact combination (compiler flag and source)
> would cause an issue?

The particular case that I was using was simply `clang -target
riscv64-unknown-linux-musl -march=rv64gcv` off of main.

> From your description, I guess it's that when enabling V extension in
> LLVM, the compiler tries to use vector instructions to zero memory,
> correct?

Correct.

> Can you confirm LLVM does not emit any float instructions (like F/D
> extensions) because the flag name suggests something like "float"?

The `-mno-implicit-float` should disable any such emission.  I assume
that you are worried about the case without the flag?  I'm not 100%
certain without this flag, but the RISCV build with this flag has been
running smoothly locally for a while.


> > +
> >  ifeq ($(CONFIG_STACKPROTECTOR_PER_TASK),y)
> >  prepare: stack_protector_prepare
> >  stack_protector_prepare: prepare0
> > --
>
> Regards,
> Bin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
