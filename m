Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CE41C54EED
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 06:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zqkxl+ZrzHTMSf/zj5yCTBn+jCLE3wi6Idp0xH/js5k=; b=AbAMJSa/W5SczS
	X0GrlIFcBEhLEyw5Kt/LO/1zZaEVcTby3kZGhV8rDWVmeMWXNTsrJ1YY6/c8jy9DCAzilwDOHk5Yk
	RYjBZRVhn5rqQLNig1wScLzv33UVF9+UnFZ4mhOCXZRTPjkUdkaIt+fkBamgdprNRzX+WfPmQoZzU
	S/JZRgVWIJq21hXH8quce9SNPJNfnmlJbtUXj63LGwOxwQcO9dbW620GFALCQSIj+dCpYAn8GE0F5
	D20uSBDIxrtBjb/tw41XaKClOGZILt/DN9g1Gmyxs29a3sYXHnHcqUCc8/C0f4KzXVZw0PUQ5XPPX
	jnK1vzWipJXaLEwNzaYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMNou-002UHr-0b; Mon, 30 Jan 2023 06:39:12 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMNoq-002UGk-Jc
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 06:39:10 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id d132so12803114ybb.5
        for <linux-riscv@lists.infradead.org>; Sun, 29 Jan 2023 22:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=k/w3jr6cU/SPLd8Szgs8C4HZyivNbPsKjMXJDKWEI0E=;
        b=LVFQeYhjsIXKCV2C+1DEMd9ztzNQ2rESS1Vz631hrKNbZz2QICMJex09fotut4ebUl
         qWBuGE0GMnFG52g2VMs8xogcxDhQQhiHpNMR8b+MCpl2FAmj5yDq6WnUThRMIOf4MoQG
         4dGwg5ThvSzyho6oY/TUFWbicBLDY4i1RbP5YW9yJrUVC8cETdY8TvItGeyyZ+0WzIqd
         knfTz6ydj2GltoFwzQdLJhdz3/1CM8JGNLAgFXUYGQFAVqL7tRwSn+h97UFIibZbFo9J
         fk1f5yp8t+dWWDwu2PzswHuam+92orGememSqyn/uhvR4qbONYAQKlpbyikY2E1PuhYq
         KPSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k/w3jr6cU/SPLd8Szgs8C4HZyivNbPsKjMXJDKWEI0E=;
        b=fBiD9+nxjTpr+u+ZPlT1DaYVxwlLsFJVeYMXxsDN19RZKgzFYA7c8EguVPt+pX1BhM
         aj9rYl0VIz13gPK2lKpNGolNAtle+tYoD88tWwnATiWq14mo55AJ7zwspS+BPRU8P2Ad
         LGORz1m7RpsmnGt7Taaxa+3FCxYMwGoNp2pC6NpQZ1l62wgrs1ZMHxIVgHIy88gZ3eWQ
         23HEkSeyIIVHF6bepSUCvqq4zWf/YMtdxq0Ej4pREDF4RUOZmehbZxJ8N4G5bscbbpoc
         aG3PGm0++aqrmTxCXtXz5Hv5CyoNImEl25AvFHW9QBTw1zzdZznFiTr/QN5vMiemiyWp
         va5w==
X-Gm-Message-State: AFqh2kpaXu88qLAmr/WDVCjOVw8OvYzx88NVvsJaKPxLBOgXSpwJRFpR
	6JWKh+ejOP86lTMUd+H49OIlVOKeuYAAeQ6VHvG1ZQ==
X-Google-Smtp-Source: AMrXdXul0tNk+CXd8EYXzFJgjAnnIQvfNIIzeLbwoGFAXTtjhQb5Hg/X2zWSbHDpRhN3FNG4+kzRe/M/XNi0FYNsl/Y=
X-Received: by 2002:a25:71c3:0:b0:7b2:343d:6b11 with SMTP id
 m186-20020a2571c3000000b007b2343d6b11mr6222313ybc.75.1675060745665; Sun, 29
 Jan 2023 22:39:05 -0800 (PST)
MIME-Version: 1.0
References: <20230125142056.18356-1-andy.chiu@sifive.com> <20230125142056.18356-20-andy.chiu@sifive.com>
 <Y9GZbVrZxEZAraVu@spud>
In-Reply-To: <Y9GZbVrZxEZAraVu@spud>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Mon, 30 Jan 2023 14:38:54 +0800
Message-ID: <CABgGipWndcnUxUvWtyxyETtLaJT42VaZoiat7uDmnOjREEt9tg@mail.gmail.com>
Subject: Re: [PATCH -next v13 19/19] riscv: Enable Vector code to be built
To: Conor Dooley <conor@kernel.org>, Vineet Gupta <vineetg@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, anup@brainfault.org, 
	atishp@atishpatra.org, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	greentime.hu@sifive.com, guoren@linux.alibaba.com, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230129_223908_729707_8C20E830 
X-CRM114-Status: GOOD (  34.97  )
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

On Thu, Jan 26, 2023 at 5:04 AM Conor Dooley <conor@kernel.org> wrote:
> Uh, so I don't think this was actually tested with (a recent version of)
> clang:
> clang-15: error: unknown argument: '-menable-experimental-extensions_zicbom_zihintpause'
>
> Firstly, no-implicit-float is a CFLAG, so why add it to march?
> There is an existing patch on the list for enabling this flag, but I
> recall Palmer saying that it was not actually needed?
> Palmer, do you remember why that was?
>
> I dunno what enable-experimental-extensions is, but I can guess. Do we
> really want to enable vector for toolchains where the support is
> considered experimental? I'm not au fait with the details of clang
> versions nor versions of the Vector spec, so take the following with a
> bit of a pinch of salt...
> Since you've allowed this to be built with anything later than clang 13,
> does that mean that different versions of clang may generate vector code
> that are not compatible?
Thanks for pointing this out. We found that Vector in clang13 was
still an experimental feature. And the first version of clang which
lists Vector v1.0 (ratified) as a standard support is clang14. Thus,
we will require the minimum clang toolchain version to be 14 in the
following revision.
> I'm especially concerned by:
> https://github.com/riscv/riscv-v-spec/releases/tag/0.9
> which appears to be most recently released version of the spec, prior to
> clang/llvm 13 being released.
>
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index e2b656043abf..f4299ba9a843 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -416,6 +416,16 @@ config RISCV_ISA_SVPBMT
> >
> >          If you don't know what to do here, say Y.
> >
> > +config RISCV_ISA_V
> > +     bool "VECTOR extension support"
> > +     depends on GCC_VERSION >= 120000 || CLANG_VERSION >= 130000
>
> Are these definitely the versions you want to support?
> What are the earliest (upstream) versions that support the frozen
> version of the vector spec?
It is 14 for clang and 2.38 for GNU binutils
>
> Also, please copy what has been done with "TOOLCHAIN_HAS_FOO" for other
> extensions and check this support with cc-option instead. Similarly,
Yes, updating it.
> you'll need to gate this support on the linker being capable of
> accepting vector:
> /stuff/toolchains/gcc-11/bin/riscv64-unknown-linux-gnu-ld: -march=rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zihintpause2p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0: prefixed ISA extension must separate with _
> /stuff/toolchains/gcc-11/bin/riscv64-unknown-linux-gnu-ld: failed to merge target specific data of file arch/riscv/kernel/vdso/vgettimeofday.o
>
> > +     default n
>
> I forget, but is the reason for this being default n, when the others
> are default y a conscious choice?
Yes, I think it could be y if V is allocated in the first-use trap, as
far as I'm concerned. Hey Vineet, do you have any comments about that?
> I'm a bit of a goldfish sometimes memory wise, and I don't remember if
> that was an outcome of the previous discussions.
> If it is intentionally different, that needs to be in the changelog IMO.
>
> > +     help
> > +       Say N here if you want to disable all vector related procedure
> > +       in the kernel.
> > +
> > +       If you don't know what to do here, say Y.
> > +
> >  config TOOLCHAIN_HAS_ZICBOM
>
> ^ you can use this one here as an example :)
Ok! Thanks
>
> I'll reply here again once the patchwork automation has given the series
> a once over and see if it comes up with any other build issues.
> Thanks,
> Conor.
>
Thanks,
Andy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
