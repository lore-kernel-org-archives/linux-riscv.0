Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A81EC54EBC
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jan 2023 11:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pQAVdc3sccKjYDQqLUMvxYO6QSqLHZ1Y7dHgcUSaXzk=; b=cwazUJ41tXS5bN
	a0wjp0faduf/mwkzgo+eioMsjgDD8hJMn+AN61lWmH7YYDN391imCiVmFhXBnYch0WxVSKGzdN/W7
	tQnFnjO37MUAdeUW6Pv9Yue0wJtj7JJXMzRt3vGHY+NfR6UeXNkCiKesYSEXl23++pSKNnTQNFnCe
	KJdGfLtllm7V80A1MXNM11stNaEEBYz/1ned1Xl4gT5/mqtZjDNEQKW5WXOgXWD+9E4lIywsaDYYJ
	xD2OgRQIVgxzSGs6YdphjHNJ8d+cGTK+IYaSoCVInJgdeB+vG5SSxJe1qnZ8J30Hqy5mXKH3UWl5Y
	ywSy7CyNsgsflAsjmgBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFCch-006bvd-VH; Tue, 10 Jan 2023 11:16:56 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFCcd-006bsv-RR
	for linux-riscv@lists.infradead.org; Tue, 10 Jan 2023 11:16:53 +0000
Received: by mail-wm1-x332.google.com with SMTP id g19-20020a05600c4ed300b003d9eb1dbc0aso6632663wmq.3
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jan 2023 03:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I6H63hdE0+S27FiqCNFGVRGmLRmIbv5jISHG4FEx88Y=;
        b=Yb9dQymQa2toP4LKPraOYd71KSSx5xG6aWHpuIJxg3RNm5pBX8hbpkldo+x8Ev8oqN
         I+MiMHyRjWH7SG2xE6/s/ddzSQuXqkfqmUkT6R6R3M7lZ3aEJZG2Jz+btRJ8ruaAtcHf
         +mIt9QZz7mxPMaA56KrFY/Maqtz3H3aav+7OI1TACp7qdxWHI2yRju1TXwNhquYwH5+F
         wKQKA4s79gd5sYLWCLPV9eQFoqa1lNzkcEqjuCQ6A1EfbQ7+DuQmmgXxOF2et+0rUro+
         5HpSokB25EQPLxbDHpowgWtPNqFGIGjE6bPAz2ddM1zZbGSl0Ctvj+i+VjDg8lMW1QBG
         5B4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I6H63hdE0+S27FiqCNFGVRGmLRmIbv5jISHG4FEx88Y=;
        b=3sd3xF+e9tEJH4v/i3IwMwwJQfx2GcVlB1A30JyR0uguh23eCdlmOr4/b8TOfpACes
         fH8sMItrDFc+KHrsaSunMWpNXMsTVz2vtN4tybpsTAhiTr+x46RTg9DjjH3mnyavkyWq
         mRUyIF6kC7jrz5M5G4RArJAFb8lL3yQv1uHM9EIOvApaQQTT/jF5YJbKAYKDKZTa01od
         rul5Ti43GTLVeTIM1Q6mKi5CftFEaijIUrsju91ChdL6LDpp/kP/q3xgWOl2pUmZaj8t
         70BqB75nbOfNLa3LMZQZ0a3R1ZSSrAb+gdYlXFB1ed0Qshxb+7tJIQDxWGmb7g5QrHyb
         lLbQ==
X-Gm-Message-State: AFqh2koaigh8kZ8+x+mpOVcp52eVGuAcL3wntb2b5kZOUnHZmU9teI9C
	/PsRHtO6KWmIG2tq8pS/HajOtQ==
X-Google-Smtp-Source: AMrXdXsRFsIjNqY+DoYF49SEyOQVQbON9Z7yVTIDndnAl0FqN9CI76eRWDHCBWVw8HwaoP3hGU31KA==
X-Received: by 2002:a05:600c:4e53:b0:3c6:e60f:3f4a with SMTP id e19-20020a05600c4e5300b003c6e60f3f4amr47668453wmq.1.1673349409310;
        Tue, 10 Jan 2023 03:16:49 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id k30-20020a05600c1c9e00b003d9b89a39b2sm16003166wms.10.2023.01.10.03.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 03:16:48 -0800 (PST)
Date: Tue, 10 Jan 2023 12:16:47 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	christoph.muellner@vrull.eu, conor@kernel.org,
	philipp.tomsich@vrull.eu, jszhang@kernel.org
Subject: Re: [PATCH v4 4/5] RISC-V: add infrastructure to allow different
 str* implementations
Message-ID: <20230110111647.vg4fdclz4hzcuaj3@orel>
References: <20230109181755.2383085-1-heiko@sntech.de>
 <20230109181755.2383085-5-heiko@sntech.de>
 <20230110093936.nzc3nkrkqkkzxkaq@orel>
 <1994655.QkHrqEjB74@diego>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1994655.QkHrqEjB74@diego>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_031651_938507_25DDC740 
X-CRM114-Status: GOOD (  29.27  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jan 10, 2023 at 11:46:40AM +0100, Heiko St=FCbner wrote:
> Hi Andrew,
> =

> Am Dienstag, 10. Januar 2023, 10:39:36 CET schrieb Andrew Jones:
> > On Mon, Jan 09, 2023 at 07:17:54PM +0100, Heiko Stuebner wrote:
> > > From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > > =

> > > Depending on supported extensions on specific RISC-V cores,
> > > optimized str* functions might make sense.
> > > =

> > > This adds basic infrastructure to allow patching the function calls
> > > via alternatives later on.
> > > =

> > > The Linux kernel provides standard implementations for string functio=
ns
> > > but when architectures want to extend them, they need to provide their
> > > own.
> > =

> > And the compiler provides builtins. In the previous series it appeared
> > to be a bad idea to compile the kernel with the compiler's builtins
> > disabled. How will the optimized string functions which will be based
> > on this patch be selected?
> =

> yep, the consensus seemingly was that the compiler knows best when
> to use builtins for some cases (which is probably correct), hence the move
> away from the inline bases.
> =

> So I guess the first decision is the compiler's wether to use a builtin or
> the kernel string function (same as for mem*) .
> =

> In my tests, I did see both getting used - so it's definitly not lost wor=
k :-) .
> =

> After that when landing in these here, we want to select the best variant
> for the host-system the kernel runs on.
> =

> I.e. this one as baseline or for example using zbb as an "alternative".
> =

> As for the "more" variants, I currently have more patches on top, that
> then use an ALTERNATIVE_2
> =

> ALTERNATIVE_2("nop",
>       "j variant_zbb_unaligned", 0, CPUFEATURE_ZBB | CPUFEATURE_FAST_UNAL=
IGNED, 0, CONFIG_RISCV_ISA_ZBB,
>       "j variant_zbb", 0, CPUFEATURE_ZBB, CPUFEATURE_FAST_UNALIGNED, CONF=
IG_RISCV_ISA_ZBB)
> =

> with the "errata_id" being used as a bitfield to use extension combinatio=
ns.
> And a "not"-field, so I can do a has-zbb + has-not-fast-unaligned

Thanks, Heiko. This was the info I needed. It might be nice to put some of
it in the commit message too.

drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
