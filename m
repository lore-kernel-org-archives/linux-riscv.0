Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA4CCCC6B3C
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 12:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XLqu14zT2tzReGeZmSwYQvqRVWhS57rodkf6kE/1Sto=; b=HTfmNj53D0ionw
	kA59cMySjBku6YubUWYXDDnLag+Zfa5f64eU9K8klbSskb8z7lUGcZdPZf/GK4gLyJZhzuEQXxR06
	MWJCpf9doK+0cJQD3ffHHsJJMpp7rgaacMX++z8YuywVNG77tOc4652azBEs+qYYaF3VR70X6qST3
	aRsIaxUgX7E29dlLfIsjPg8JDKFX7YRN8fonTG1uZqgSxVqkkYjzMu7+It+mnA5pRYxQSgbQbPENj
	gzCUEvUAxUSWH/35hj+qDzBFDN8iB3/TDLtU8ZeEUx9nDYhDNyZG1/AujWS/M1kTj1eYS+lygKGix
	/bCrIgxwaamPE5uzcJsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHKW4-000000006Tj-1k2E;
	Thu, 15 Oct 2026 12:25:00 +0000
Received: from mail-ua1-f52.google.com ([209.85.222.52])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHKW1-000000006T9-1Aow
	for linux-riscv@lists.infradead.org;
	Thu, 15 Oct 2026 12:24:58 +0000
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-980c4f5c921so1501644241.2
        for <linux-riscv@lists.infradead.org>; Thu, 15 Oct 2026 05:24:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792067095; x=1792671895;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gQc0B6ddBetoMPj6D5PkGmJUAko65vy6l7KddjggnuQ=;
        b=xnWmiRt0wW48CAVNhEIL7uRlOoGaNjXLUIoPDbf8vXc8w/Or2Gb2M3UrBeZPVnDoVd
         sQVLpxErJsngZme3FS+oi2TfiCSrc9Ei5Gs/9NBg+oFwNGE/Bj1Rb8JgSOE/2sLL10Lv
         TzvKgLp64DaaLu3YKIIrIQuBBg67M59F+OUq/42F/AfidJS8FbLW1RquSUZGKbqWOviq
         NDk2xgcg5MbfYii2uvfM1z5H4QoRXBZqTpfJcyJY6WpARyKna8rO+jQdCKrOSg/wSh8k
         Iq8ylSNFhsNz/gqWeAZT4bTKk6TY52VP4vDaVr/qQPuGmHNul5QhFCAbPa8OBzsYJ0uc
         tUhw==
X-Forwarded-Encrypted: i=1; AKwUvByxpZzEB/xZIiJ/eYBCJe7hpW7smE6pl5BdEB1870hYR/2vXdqtGeYcSGWkaduESxbXbAyr9/W0xTke0Q==@lists.infradead.org
X-Gm-Message-State: AFq9FYJaq4VmdXQrLsqDQ3grDJRCMCJXY+yY40hYuuZ+LVPqx5DeS4rZ
	ne6nIsXT2DJth/CBtS7NLkVudzwSTJlaRl1ny8nU86kk68iUhLf+EGUa1XpM7kAAaU8=
X-Gm-Gg: AYBFou2yNdspm7NZSU+zKK9CYX8IOsje6iMuh50eHMVVfMNdduYbyQx5H8zSCoGYhJI
	ZfeOhGqTiexQE8QBHEIWn9TzVgE6oqKoWzUJyK0kDGGx11wYFUbb1SvZLnOE8NAVAyLUCxF/FOQ
	aVqnY4tCvbt5pGGogTL00e9nHKbTYsgYk/SDh7tgWYm+q1ENu69wIkIQ+q9NRbl+56tm8PyH5ru
	k+gmJYzEyHQS4XBqk5pRuee+fIXNSDUKOnTUuYg+tfhFO64dlrs4LTBuoSG5AriopVk93kPfPk5
	OXamq0CkQmDzfss/LD35woALLGwbwwZu6DGIGFGFfBiesaUxD7KXXXguisrtbJTF7Le7KDCXm0t
	Sfo61ShwSA/VpUWPtlA5tnXddHekcuatImB8d8WPegA/jalJmNCvD0YJHxk1QBZHokQbIRjfFfA
	7h8yG2OQmnp5qjPY1aZruUk33QHmng52fYGPiWxQoyThVcAd+IVKRAvklBos2J7Uim7/OGr3dG6
	PnGVlfLPN18HBJvKYMgTK7NoQ5QI9ah6GckBVTnpf8s5y8=
X-Received: by 2002:a05:6102:f8b:b0:7a7:5355:7fb6 with SMTP id ada2fe7eead31-7cb3737be51mr3908581137.24.1792067095322;
        Thu, 15 Oct 2026 05:24:55 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-990138f4fe2sm10567914241.6.2026.10.15.05.24.54
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 05:24:54 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-98c7353395fso1464777241.3
        for <linux-riscv@lists.infradead.org>; Thu, 15 Oct 2026 05:24:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz6Pk4XJncdVCHBtxJNLecFy/yl1MWZ1VXKrVRJuW142QYF+05colNUzZRxrpExWYcCNyJBk8U4eZX0tQ==@lists.infradead.org
X-Received: by 2002:a05:6102:5792:b0:7cb:288a:b68b with SMTP id
 ada2fe7eead31-7cb373ecaa6mr4423446137.37.1792067094049; Thu, 15 Oct 2026
 05:24:54 -0700 (PDT)
MIME-Version: 1.0
References: <1b1ca4208d725ae0bb834a61636e48728d79cf80.1791973171.git.geert+renesas@glider.be>
 <atAQAI0WWtwh8kvf@xhacker> <CAMuHMdWB+Aj7HK3YaHgo8VcypBamN9Yqi-M8WYtKpRu+ZG7yFA@mail.gmail.com>
 <atC9jZIF1T1x0w1X@xhacker>
In-Reply-To: <atC9jZIF1T1x0w1X@xhacker>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 15 Oct 2026 14:24:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXkzgE7=n7MJ1-QS10y=f75vO7OribUgM3wb134LN+5kQ@mail.gmail.com>
X-Gm-Features: AclHuK8AEmS4BjewOhDIhzzUqFg00oT4fEiD3JuX6PdEzowUpGV1zfOobCzXRp4
Message-ID: <CAMuHMdXkzgE7=n7MJ1-QS10y=f75vO7OribUgM3wb134LN+5kQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: RISCV_ISA_SV48 and RISCV_ISA_SV57 should depend on MMU
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_052457_333175_971A1EFA 
X-CRM114-Status: GOOD (  29.58  )
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

Hi Jisheng,

On Thu, 15 Oct 2026 at 14:08, Jisheng Zhang <jszhang@kernel.org> wrote:
> On Thu, Oct 15, 2026 at 09:43:40AM +0200, Geert Uytterhoeven wrote:
> > On Thu, 15 Oct 2026 at 01:48, Jisheng Zhang <jszhang@kernel.org> wrote:
> > > On Wed, Oct 14, 2026 at 12:20:39PM +0200, Geert Uytterhoeven wrote:
> > > > These options are irreleant for nommu systems.
> > > >
> > > > Fixes: 36de74049ec8cb1a ("riscv: introduce RISCV_ISA_SV48 and RISCV_ISA_SV57")
> > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > > > --- a/arch/riscv/Kconfig
> > > > +++ b/arch/riscv/Kconfig
> > > > @@ -605,7 +605,7 @@ config RISCV_ISA_SSQOSID
> > > >
> > > >  config RISCV_ISA_SV48
> > > >       bool "Page-Based 48-bit Virtual-Memory System"
> > > > -     depends on 64BIT
> > > > +     depends on 64BIT && MMU
> > > >       default y
> > > >       help
> > > >         Add support for the Page-Based 48-bit Virtual-Memory System.
> > > > @@ -617,7 +617,7 @@ config RISCV_ISA_SV48
> > > >
> > > >  config RISCV_ISA_SV57
> > > >       bool "Page-Based 57-bit Virtual-Memory System"
> > > > -     depends on 64BIT
> > > > +     depends on 64BIT && MMU
> > >
> > > hmm, I think we also need to make RISCV_ISA_SV57 depend on
> > > RISCV_ISA_SV48. Otherwise, there's a case: RISCV_ISA_SV57 &&
> > > !RISCV_ISA_SV48. Human won't make this wrong combination, but
> > > the random config can.
> >
> > Is that really an issue?
> > If I build a kernel for an SV57-system, do I really need to enable
> > support for SV48, too? It builds fine without...
>
> This is to align with the spec:
> "implementations that support Sv57 must also support Sv48"

IMO that is something different.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
