Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B15CAC46467
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jan 2023 13:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WyDa+gupc3v219drPjb7Fq6cMNxkwQX+Xi9Zbsk8n+8=; b=y7wVNcl9/PL2ep
	F7VHR1a9UCuTCUS35/QV7hakg3XZOdvirVG5WFGOyM/5Cj0LfSr0mY3S/tR2fhqxvVPXxSK6dVJcQ
	N4Cx3NM0r1VJ782TavD9VSVRA/kIIfAUK8hCGCq0CqY6fprlAqnBqcpewYSEXbAY+rNdx8TN67Wr9
	6ZKGZUJ0fprPrwI4NcrZGL0N38VYbD/yd1cWUY4y+AmZgdDGHwO0a05qfngjPC+BmhqQNaM1CRlSg
	L6FJxSHOoUqtpY1RU3qdwLoCjoxl7fh6kwpBPZODi5XBsCrGVngHuCSSfgAUzTANlgoj21YCiMVma
	QytB0D5qA6HBk764eJjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFbS9-00BfVr-L9; Wed, 11 Jan 2023 13:47:41 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFbS1-00BfSP-RL
	for linux-riscv@lists.infradead.org; Wed, 11 Jan 2023 13:47:35 +0000
Received: by mail-wm1-x32c.google.com with SMTP id m8-20020a05600c3b0800b003d96f801c48so14388974wms.0
        for <linux-riscv@lists.infradead.org>; Wed, 11 Jan 2023 05:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nzDwcOH0HBcVXqEzCPrdA/1fC3bSYGg2xKSrXrmO3cY=;
        b=f4gsa0QMMGJA5BD7YlTmXCE997XyUgu4YMay92fsiFhlxrE99e+akBadI4YY7M6USk
         yaSV6eXIZBOMmALehr7md4COp1vwuMEZOXTgYW9qtP104wPhTJZm8cWFiQ1GFlVqqZub
         2wNqcvwUkbpTVWa4rYjl9IqOUPlWAbkZnk6j8lKC6JEKDh074XFZ2STOQWVGisNhkePN
         J4tVFJecYlSfKqR24gR/YPdUODTgx42U9PgxoSJ/lynrc/EgCPd4PTNVl01/ToLYh+i5
         p83UwlPwAP6+SmD9XjHbYdCqAyTfayqiAoAtJUm2QPWQw6z31jDnQuDMyeiWV0es6tNS
         GSqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nzDwcOH0HBcVXqEzCPrdA/1fC3bSYGg2xKSrXrmO3cY=;
        b=GyUJQYZ0WB1U7io8ed0pNrLIlkEOuCMDCxDqwXYYcaw65xgIEeVYAwK45dxj5CF7Pj
         jEkLWJJ9Fls3LNfkQhbVxypekmMTHYObZBwNLyKhpTXN0wqbVLHnjW+6OjyoX44VqiBj
         WvGsG/An4wReaNl5NsVLtHP4DHn2GU2748qCpl1QKIrOkqYs+wtkW4ttF5g7g0lBovUU
         YP0Wx/JmBXbyhaMj5+FIWbYiClFJ//YHeBx0mlR4RRndfodC/PP63PYkOS1+lrb654Fu
         Zux/TXohf0dhBi2kYCYXoiiqOGj2r/ePl34tXx/kG7YttWIyWW1HDd/X88tNq4c/z2Y7
         XzDA==
X-Gm-Message-State: AFqh2kob56n3kiboWR0j1q7pyWRXeKp1novOjJV4BjIaGwRv4mU+iin2
	8+wHEgwxXaglJtLEk/JINHeiTQ==
X-Google-Smtp-Source: AMrXdXtXV5I97BqzpwnEGOKZAtyaWM6u2as28SUlSa7hZ4QSmUS3VfqSzxMchoLJJFifUxgo50TaYA==
X-Received: by 2002:a05:600c:3491:b0:3d1:f16d:5848 with SMTP id a17-20020a05600c349100b003d1f16d5848mr52996173wmq.26.1673444850065;
        Wed, 11 Jan 2023 05:47:30 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id az20-20020a05600c601400b003d96bdddd3dsm19075237wmb.15.2023.01.11.05.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 05:47:29 -0800 (PST)
Date: Wed, 11 Jan 2023 14:47:28 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Christoph =?utf-8?Q?M=C3=BCllner?= <christoph.muellner@vrull.eu>
Cc: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
	linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	conor@kernel.org, philipp.tomsich@vrull.eu, jszhang@kernel.org
Subject: Re: [PATCH v4 4/5] RISC-V: add infrastructure to allow different
 str* implementations
Message-ID: <20230111134728.lz3gmu2hrwynnkqr@orel>
References: <20230109181755.2383085-1-heiko@sntech.de>
 <20230109181755.2383085-5-heiko@sntech.de>
 <20230110093936.nzc3nkrkqkkzxkaq@orel>
 <1994655.QkHrqEjB74@diego>
 <20230110111647.vg4fdclz4hzcuaj3@orel>
 <20230111123436.6qq3syh24prrs7o7@orel>
 <CAEg0e7gJgpoiGjfLeedba0-r=dCE1Z_qkU53w_+-cVjsuqaC3A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEg0e7gJgpoiGjfLeedba0-r=dCE1Z_qkU53w_+-cVjsuqaC3A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_054733_920911_ADBA3AAF 
X-CRM114-Status: GOOD (  29.54  )
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

On Wed, Jan 11, 2023 at 02:39:36PM +0100, Christoph M=FCllner wrote:
> On Wed, Jan 11, 2023 at 1:34 PM Andrew Jones <ajones@ventanamicro.com>
> wrote:
> =

> > On Tue, Jan 10, 2023 at 12:16:47PM +0100, Andrew Jones wrote:
> > > On Tue, Jan 10, 2023 at 11:46:40AM +0100, Heiko St=FCbner wrote:
> > > > Hi Andrew,
> > > >
> > > > Am Dienstag, 10. Januar 2023, 10:39:36 CET schrieb Andrew Jones:
> > > > > On Mon, Jan 09, 2023 at 07:17:54PM +0100, Heiko Stuebner wrote:
> > > > > > From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > > > > >
> > > > > > Depending on supported extensions on specific RISC-V cores,
> > > > > > optimized str* functions might make sense.
> > > > > >
> > > > > > This adds basic infrastructure to allow patching the function c=
alls
> > > > > > via alternatives later on.
> > > > > >
> > > > > > The Linux kernel provides standard implementations for string
> > functions
> > > > > > but when architectures want to extend them, they need to provide
> > their
> > > > > > own.
> > > > >
> > > > > And the compiler provides builtins. In the previous series it
> > appeared
> > > > > to be a bad idea to compile the kernel with the compiler's builti=
ns
> > > > > disabled. How will the optimized string functions which will be b=
ased
> > > > > on this patch be selected?
> > > >
> > > > yep, the consensus seemingly was that the compiler knows best when
> > > > to use builtins for some cases (which is probably correct), hence t=
he
> > move
> > > > away from the inline bases.
> > > >
> > > > So I guess the first decision is the compiler's wether to use a
> > builtin or
> > > > the kernel string function (same as for mem*) .
> >
> > Hi Heiko,
> >
> > Thinking about this some more, I'd still like to understand how/when the
> > compiler makes this choice. Are compiler flags involved? Or do some
> > heuristics dictate the choice?
> >
> =

> 1) Arch-independent expansion is used e.g. for calculating the result for
> statically known strings.
> 2) Arch-specific expansion (not mainline, but my series can be found here:
> [1]) can do whatever is reasonable.
> My series emits a bounded unrolled comparison loop for str(n)cmp with a
> bound that can be adjusted via flag.
> But it only triggers if both strings are known to be aligned.
> =

> [1] https://gcc.gnu.org/pipermail/gcc-patches/2022-November/605993.html
> =


Thanks Christoph!

drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
