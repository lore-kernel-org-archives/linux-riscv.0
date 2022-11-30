Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDB7AC433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 14:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z9EPvZhQwnVOfY1JFGw3AGhI65GDHwdC7D8q0DQrYSc=; b=1dKuZVby2j2d6G
	7BaUHGaQZYjBHTQVyQLFlnwzDUwuRyX3vaNm22mUejwB77uSzDkiJJO0XpJ3miBlQiUKnv+eaKE7D
	B+XyZpqM9iCTEAtx/1L3OAwEdlX3UL/Ic7dPpdTbV6NNTHSqBvOcH1a9H6PcZReaUcZLALccqDkNL
	5sAUlTSRfM7snEYsaczqcV27eJmUhJpF5u7Euom+gY8kzhEsdYlcX/Ei+fZ+1aFCTGkKuX9cDzNQJ
	O+EJrlIjT/MoIdfi5flGnIDpx5o30O1evi2SWtLk5rrfWh5Imo9ti1Ua3yd4U08o5M3oiODCo4xoG
	BLu5PjhVKrj6eo+Q8ssA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Nnk-00Gkk3-8s; Wed, 30 Nov 2022 14:11:04 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Nng-00Gkgb-3b
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 14:11:01 +0000
Received: by mail-ej1-x632.google.com with SMTP id td2so27505479ejc.5
        for <linux-riscv@lists.infradead.org>; Wed, 30 Nov 2022 06:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mOgJvaACK6m412Pq//jOqDeM9DNw9U2HKF0D1m/Gr8I=;
        b=HOk9u1Sg+qdFCqCn8DpEFujo6CgLzS9ivPBYu7Ie8ZXm5YBJ5pvH30hb84NAoymaR6
         lpH1/XmvQUI88UGRL/QWFcv1leC1Td58UoZvRD1buCY/8e+bFqY7fctEPtz7xTnyej8L
         pOMlgjZsE2h0FSL4bKaR1nwW5UZ5wS8UQM5jr4Ig/2iEwGIIQIwSr466yKK5YKVMGy8y
         +GyvcxdDRm1+fe4A+1ibrcx1+lWvNPz1yadJr7BBmOwNLyO/rlkU7oirDCzjF08QSTM4
         AQWpTLxph73ba4xKuUtFw3An49gaq+xABIO6u2P/sw4YrNRyVpEJvYvx/6ixPUBwPzyr
         DpYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mOgJvaACK6m412Pq//jOqDeM9DNw9U2HKF0D1m/Gr8I=;
        b=oeS2YsLmYOv8qVcnXn61kgZYmZDfdtXQyIEGclLrKNX6Tr+YNyXHQzq+nFV7ZYVe/r
         0heoAIz55kOnIfHrvcb7saL02y2ZztL9sV8X/njgavgjcY0rNgZz1APNwSLPB2sDXuqj
         9GqoOF50kI7CMKlVZWyBdURQVNf4nclZXoaywHk1WyZDiGjiLQsNiF2Y8V7WilqutWMm
         MS5W2Pspi6wDheLDC4werQek8wB9ijF5I5l2K/s/xSOk2uRg0B9XDyY2B8J9gIz0CHVw
         92VdCemSa3ARGUuRbxmUP5KHxxnk9eVACTR9rb7YT83soVciZyPrSep4TgCtmsGWs+E5
         xNMQ==
X-Gm-Message-State: ANoB5pk1dxqGqVWoLPSjj0ZXueDl1cQ5My2lpP0eFc6PO8tscpUle4vg
	nCXsqqnkR7N3KqfW97dhaRNXww==
X-Google-Smtp-Source: AA0mqf4RMbjyLmCejbssJYq1ql0qfWAbG+KWeb5B208YYnB+p5dGK1yLRPSeiEuyeFLL7y/bvZY3UA==
X-Received: by 2002:a17:906:382:b0:7bc:87b8:e6de with SMTP id b2-20020a170906038200b007bc87b8e6demr21544341eja.256.1669817456027;
        Wed, 30 Nov 2022 06:10:56 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-748-2a9a-a2a6-1362.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:748:2a9a:a2a6:1362])
        by smtp.gmail.com with ESMTPSA id kw5-20020a170907770500b007933047f923sm681452ejc.118.2022.11.30.06.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 06:10:55 -0800 (PST)
Date: Wed, 30 Nov 2022 15:10:54 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Cc: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, christoph.muellner@vrull.eu,
	prabhakar.csengg@gmail.com, philipp.tomsich@vrull.eu,
	emil.renner.berthing@canonical.com
Subject: Re: [PATCH v2 01/13] RISC-V: add prefix to all constants/macros in
 parse_asm.h
Message-ID: <20221130141054.mhjsp44kgwmhz3mb@kamzik>
References: <20221128102632.435174-1-heiko@sntech.de>
 <20221128102632.435174-2-heiko@sntech.de>
 <Y4aFjRTZKGq8EnfD@spud>
 <7363079.DvuYhMxLoT@diego>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7363079.DvuYhMxLoT@diego>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_061100_189074_0A3814DF 
X-CRM114-Status: GOOD (  21.90  )
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

On Wed, Nov 30, 2022 at 01:12:36PM +0100, Heiko St=FCbner wrote:
> Am Dienstag, 29. November 2022, 23:19:57 CET schrieb Conor Dooley:
> > On Mon, Nov 28, 2022 at 11:26:20AM +0100, Heiko Stuebner wrote:
> > > From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > > =

> > > Some of the constants and macros already have suitable
> > > RV_, RVG_ or RVC_ prefixes.
> > > =

> > > Extend this to the rest of the file as well, as we want
> > > to use these things in a broader scope soon.
> > =

> > What's up with the "weird" 57 character lines here?
> =

> that is my brain shouting "you need to wrap lines" too early.
> I did make them longer now, but the line count won't change :-) .
> =

> =

> > Either way, I hate these sort of diffs and my brain just switches off
> > while trying to read them. Perhaps there's a way to make git spit these
> > out that shows
> > -
> > +
> > -
> > +
> > rather than
> > -
> > -
> > +
> > +
> =

> I know that feeling well :-)

After b4'ing the patch into git, you can do

  git show --word-diff=3Dcolor --word-diff-regex=3D. <patch-commit-id>

to see just what was added/removed.

Doing that, plus some greps to make sure all names got changed
everywhere, looks good to me.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew


> =

> =

> > and I could be more confident, but it seems okay to me...
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> =

> thanks
> =

> =

> Heiko
> =

> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
