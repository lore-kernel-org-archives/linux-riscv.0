Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71C8BCCF2C4
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Oct 2026 21:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5keRrYy4kTOdJVVkZ7zIy4+T6ewdzvoG4HCpatl4hUI=; b=yDa658gTF9Yfra
	ezLEQXPE9SWonrWWrfSpgDeEkbpsB7fx3wrbcEz7lk3MTxbLe/q2xeFQesosPgJJ+YDeDz1AUViCK
	bClP3xO34DM+j8zoYHQE1W50ly4BOoavxZbIvbnkk4oEKW0Tk78UKShdbvNUhbo/rSHwXnZTh0720
	Lg6ez9PRZnU0dfSGyauiOZEJ/TKK8TEAmBG7pPt2vi9ciozbyMwQlPRu4SxQcAqN4rkSo9RVZxLbl
	MfLY4cQrxQZCkzcnAvz7He3FTllVdElmVDhHxwLj9pKZETJ1f+NLo8j6+jY0Qm5VzReGqRjDsoLem
	9Wslmii+giA+WR4MbCqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHpjj-000000047Zr-1NbX;
	Fri, 16 Oct 2026 21:45:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHpjh-000000047ZX-03Wn
	for linux-riscv@bombadil.infradead.org;
	Fri, 16 Oct 2026 21:45:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=hRe2PR2tdyQY60o52xnKS0aVdTlGJcembbzwjk6xYRs=; b=kQl8BKhSaqqFPFznHlflMImcRE
	L3m3y213F46ztTFPTN1fym33Ju87+AQ3d49yMS4la33C4K/jiNMz6Iauw8PleAkHyJOehwRV1V4Yc
	KJ59k+XDZ8bL19CERfIhJEcH/at30AHo1x4+vtTFDg5mSYL0H8Ev1A3iZRHCUMWSDF4ohm2NwphaY
	0zE/PX2k2lsm+xJMPJOjcxMES81DdjHC10UvUIx2VkDkgC0XNMJ8NKZ5Fj7irCFmwmxLr7wi/uIWV
	LjD5Dy4t1TYp0FoR00XJqspaPtKgIp3Zg6T2cW59+iDorucAdjuptxj7OSFzlzgJnXGunSA1UeiFt
	oi+AyiLQ==;
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHpjd-00000001yve-2FYs
	for linux-riscv@lists.infradead.org;
	Fri, 16 Oct 2026 21:45:07 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-8a83d2706fdso3436317b3.0
        for <linux-riscv@lists.infradead.org>; Fri, 16 Oct 2026 14:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1792187103; x=1792791903; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hRe2PR2tdyQY60o52xnKS0aVdTlGJcembbzwjk6xYRs=;
        b=FdDNMXdx//gBAti6q3mzNteYDjBz3PzJdjk/8gsDLFKXxsUFLLj2mE1zxmQXfcsjEg
         hpy8bZJg4pvLQRrrHoiSmfC2tz5kDg9vWQJqDOxwTwimxMhhLS5JRrcsqv86yGopZB7b
         Jgk2q62ZueRjiFRkjW6PZIP9Fb10Zr1VIArciRtGJU3oQBjqJaX59jcSk+pcP5c8xBhy
         tJIaiXvdU3zjqFdqmM5d53wFW3GVdSKhtJmCyB1nBSu9Ow6WjOukiUMjM9PGmvmtoiRN
         mNYqT3mhL9dJQayXWykur8TiyVYeM/R53VzSgsE/ArNwVNqqKERTVTUo8IrgbvuNc2yP
         Qw8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792187103; x=1792791903;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hRe2PR2tdyQY60o52xnKS0aVdTlGJcembbzwjk6xYRs=;
        b=GZgM3WrJZlsgrshDtZ0xrhvi4FoWsnhC7ee35ZCn1AOVXlFeIT+d8m8xXyWjJ3eas+
         vCHeet9Y2sQwYPQGSW5GrXm5Xx5RTxY0qEWh0PHi4XdkFwdlsUlPPusTD+aKXU9vPvTn
         3CP3vEYmekCimeZ65m2MHaupJ7YX5/dcOL92qqRyO7XN5Ct+IrVQHmd36Sml4aXfMrB1
         lBVtmXKRBGcuCRW4bNXI2qbv//vep96BiKcHj2JjQ/FGi+eAl3cebiyCXEt5biLvvQHf
         445gEMayOKKvaD1ahEmaXA/9MRKsPARmXJuWMvF2zEzVJb4vTeF2SweJmXnWCqSp1x00
         Jlxw==
X-Gm-Message-State: AFq9FYJklfi1XQC1M1Y6MoGRFS9j1tpZBLD1NPKr8d5owGye2wolL9GK
	RfwCLrurmjy5vnqAo94/0hPQEprHFjYx5Mi2KFpRbNSzBPo5Xfz7I2PCUDvJEiB8ImA=
X-Gm-Gg: AYBFou3aMZDh4UlrobWT/ST0omqlqrs68ZS83e8QiqA/yU7AuJJSfV4/8jJWKcPC0P2
	n7ZZ8AT2Ubggl6ox/tvBu2t0UwOlbuXY3425Qj3AyPaOqVGWB0yBGoOoc+riXCAbNyY61zLh+GQ
	jMAC6AYHem+bvBBZYkS4MzCZQqhH5JwHSZ8FszswYOQ2PNQr1K0/awl9UJlw3BtE9SRyXoSkhHJ
	heDUDK7tyAWesWBZhoPsAyX8P2e9h0Lbr7OU4NPVhaPOgqM1FdxMEWX9YA0yUlqKWWAd5Tt9g9G
	TYH01P+Irwv1bfslMcUEZ/VPGCxb58E/M7GX5wA4V/53E2AFuO4DbjvXI0q5bRnw+MfrNNNXeZn
	d1LCYOeIdiisQffUN4ED8C6w66Y4XLzutWiXjAYwN0ikzU/9AQldkyGq56+FYLELl+zWBgmrXYu
	4v/LEKN9nPB5wkN/LjY/aL1Rb2oBdxoeG+Y25oFTFbYJ7lC/h7coTY84I9snsl/XbEl3vjyOr1B
	3MwxAMeI6/x8JEOdM2S
X-Received: by 2002:a05:690c:dc8:b0:8b0:cf3d:7b39 with SMTP id 00721157ae682-8b0f2163c7amr4052177b3.38.1792187102771;
        Fri, 16 Oct 2026 14:45:02 -0700 (PDT)
Received: from localhost ([2600:1700:220:5c80:6dfb:85d9:d6b:fdcb])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b0e5889c2esm14150177b3.15.2026.10.16.14.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 14:45:01 -0700 (PDT)
Date: Fri, 16 Oct 2026 16:45:00 -0500
From: Andy Chiu <tchiu@tenstorrent.com>
To: Radim =?iso-8859-1?Q?Krcm=E1r?= <radim.krcmar@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andy Chiu <andybnac@gmail.com>, Guodong Xu <guodong@riscstar.com>,
	Zong Li <zong.li@sifive.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>
Subject: Re:  riscv: hwprobe: Report Supm only when available
Message-ID: <atKa3JDynQmx2KS3@Tao-Chiu's-Mac>
References: <20261006075303.205216-1-radim.krcmar@oss.qualcomm.com>
 <20261006075303.205216-5-radim.krcmar@oss.qualcomm.com>
 <atKWa5PU2ECSgocI@Tao-Chiu's-Mac>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <atKWa5PU2ECSgocI@Tao-Chiu's-Mac>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_224505_664717_AE0FC69E 
X-CRM114-Status: GOOD (  23.32  )
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

On Fri, Oct 16, 2026 at 04:26:03PM -0500, Andy Chiu wrote:
> On Tue, Oct 06, 2026 at 09:53:01AM +0200, Radim Krcm=E1r wrote:
> > The RISC-V ISA defines Supm as
> > =

> >   "An extension that indicates that there is pointer-masking support
> >   available in user mode, with some facility provided in the application
> >   execution environment to control pointer masking."
> > =

> > Our facility always returns -EINVAL unless Supm support is configured,
> > the pointer masking ISA extension is globally present, and the user-mode
> > is running in 64-bit mode.
> > =

> > Hiding Supm in compat tasks would add complexity that doesn't seem
> > justified as 32-bit code has no reason to look at Supm anyway.
> > Reporting based on the a global sysctl toggle isn't done.
> > =

> > Do not report Supm when some harts lack the extension, because it's not
> > available on any hart in that case.
> > =

> > (Reporting Supm when only PMLEN=3D0 is supported isn't great, but doesn=
't
> >  violate the text of the extension and we ought to have Supm7 and Supm16
> >  extensions if we care about precision.)
> > =

> > Fixes: 3c2e0aff7b4f ("riscv: hwprobe: Export the Supm ISA extension")
> > Signed-off-by: Radim Krcm=E1r <radim.krcmar@oss.qualcomm.com>
> =

> Reviewed-by: Andy Chiu <tchiu@tenstorrent.com>
> =

> > ---
> >  The compat hiding and global sysctl toggle better fit in Andy's series.
> > =

> =

> Sorry, I am not aware of any ongoing series that does the compat hiding,
> but I will keep an eye on it.

Now I know the series you mentioned. That series was dropped because the
mechanism was not in flavor of reviewers and we are going to deprecate
the prctl[1]. But I can see there is still a need for understanding if an
extension exists at runtime. We will take time to revisit that

[1]: https://lore.kernel.org/all/20261007085126.222688-1-samuel.holland@sif=
ive.com/

Thanks,
Andy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
