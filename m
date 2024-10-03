Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 509C7CF854E
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Oct 2024 02:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sXK/1HdgpXDWRBZYHYL88e6pXK2i8vpNik5Flf7yYc4=; b=kSs9aXehQHof8a
	fXKwAdx+9WtRNVIuimBAMeLvBt0AvHMsb8XTYxfvFZdTPeqkgbzPhShWuxOocMaHHU7QWKmUZ7FX+
	moK285dpzHWu/ViGVmUiQv1tUMEZPx2slHZvrs7JQsA4Znfl8vs6i9gLC19ze4Z/gUgjxpOFnfm/z
	oMmp73vf3rpVVQNts6BIq+vOPoPOspkvFPXqpTTFNO1dpMlCDvCRBWiiRiAmnsYH/tIBFKVBmNQ0T
	JsFMxqIKRuVN62miRvLelF7sSzH+fxR2xaSGvHdzEGfLoeoVDchlLYERL2rFE+1rVlC1PqFfSdPPV
	o2ReSDBj/S5PMPa3dPYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swBoF-00000008137-1KiO;
	Thu, 03 Oct 2024 02:43:19 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swBoC-0000000812d-1occ
	for linux-riscv@lists.infradead.org;
	Thu, 03 Oct 2024 02:43:17 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-20b7463dd89so4264505ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 02 Oct 2024 19:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1727923395; x=1728528195; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lXs8iVoA3xDw1I5xisdrYRt5+VMwKclfUTPuuGaalk4=;
        b=FAIUWR+C7W8Fre6lXCPIlVT9EnG+4d6jqCPzwE0OTzuThCPiHwGdJOCYWR4mbd1+bZ
         yp6/X5sQd5UtVKr0yEzQY+ugKTKSV7m0pcd8nSe296PJ5vnnXqVoJHp/9ICnXmkhOE4F
         t6MRXLZ5sbRulQivBwXxwl5O/eD6TYSENY0yuSX4l/kzTtqhKYzmfqevYUxdVUW5sAWR
         U6EWdYV7EZwrP9NPJ+0v2CSRbIqbbg9GGon/nWjKVFvdkgbk9k53npGqr+W3UD5qbvFT
         7mgPHuX089lne2bYKk9AgXrFldASZn7ILmHpW4Jn9Ln8hLjpwJScOxGmSD4wssbzNVv1
         0OUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727923395; x=1728528195;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lXs8iVoA3xDw1I5xisdrYRt5+VMwKclfUTPuuGaalk4=;
        b=S01utsjRoUOwjJHyP5biGClUeFT/qqzM0TtHTJ8eAQNMhkPoiJuhpKO3QObdvG1X/y
         m3I6plGbp5qO3zsLg7ga59RmCnngfHulcW+FnkGGSYrbKn0odsog36WNi5HCpsCa3IYQ
         cZoz5vAi8olB9CeB47FIrdOBi4kyzTGtutfmB4Dq8EZJhNmZuhNl9de/gVdXIRxOpi9w
         oeDN8xonnIZyT7lDihSoaRqxrA6/BE8N8J0LM2MLlwczvQvZjPIb9vNuDJarQuF3ESmC
         6k6qewleqaAJl7FibAPp+R+ndoCwrer8fsh+5jzEUGUo+BLwikRYluUH5uYO6ljiBcrU
         zYdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAcSb+p7rGjKMzbTMNu1dqQMuZgVxNpLT4Nj8uBDVizpVL0usZZfnRfxjcAhJuXRv8U+ygQ9NCuUWIGw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxAVuK/ssJ5teZ9Md4OvQ7UVxlNrOivJSpF07l80U8Mady708iG
	1vlgvPXH7IJrBBhQ3505AnpSLv4nH3EEItVSiSVKr2RiSbGEvk5FmQmsh2EGX/w=
X-Google-Smtp-Source: AGHT+IFmnarGxtfVMhsP2WlVCNvnBFTDrQupQCfaWA8uaZjTwWGK1PTCiEnToYrWYyuvGooZGOdFZA==
X-Received: by 2002:a17:902:ce87:b0:20b:9fa3:233c with SMTP id d9443c01a7336-20bc5a6a4c2mr70055895ad.40.1727923395210;
        Wed, 02 Oct 2024 19:43:15 -0700 (PDT)
Received: from x1 (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20beeca4ad9sm173235ad.95.2024.10.02.19.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 19:43:14 -0700 (PDT)
Date: Wed, 2 Oct 2024 19:43:13 -0700
From: Drew Fustini <dfustini@tenstorrent.com>
To: Kees Bakker <kees@ijzerbout.nl>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/8] pinctrl: Add driver for the T-Head TH1520 SoC
Message-ID: <Zv4EwWPoSMir1C2J@x1>
References: <20240930-th1520-pinctrl-v3-0-32cea2bdbecb@tenstorrent.com>
 <20240930-th1520-pinctrl-v3-2-32cea2bdbecb@tenstorrent.com>
 <87770518-5f63-4adf-b6ea-c7f92b58ce22@ijzerbout.nl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87770518-5f63-4adf-b6ea-c7f92b58ce22@ijzerbout.nl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_194316_493223_35177B16 
X-CRM114-Status: GOOD (  16.25  )
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

On Wed, Oct 02, 2024 at 09:36:59PM +0200, Kees Bakker wrote:
> Op 30-09-2024 om 21:50 schreef Drew Fustini:
> > From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> > =

> > Add pinctrl driver for the T-Head TH1520 RISC-V SoC.
> > =

> > Tested-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> > Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> > [dfustini: use thead,pad-group to identify the pin controller instance]
> > Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
> > ---
> >   MAINTAINERS                      |   1 +
> >   drivers/pinctrl/Kconfig          |  13 +
> >   drivers/pinctrl/Makefile         |   1 +
> >   drivers/pinctrl/pinctrl-th1520.c | 907 ++++++++++++++++++++++++++++++=
+++++++++
> >   4 files changed, 922 insertions(+)
> > =

> > [...]
> > +static int th1520_pinmux_set_mux(struct pinctrl_dev *pctldev,
> > +				 unsigned int fsel, unsigned int gsel)
> > +{
> > +	struct th1520_pinctrl *thp =3D pinctrl_dev_get_drvdata(pctldev);
> > +	const struct function_desc *func =3D pinmux_generic_get_function(pctl=
dev, fsel);
> func can be NULL after calling pinmux_generic_get_function
> Please add something to avoid NULL pointer dereferencing in the next
> statement.
> All other callers of pinmux_generic_get_function have something like this:
> =A0=A0=A0 if (!func)
> =A0=A0=A0=A0=A0=A0=A0 return -EINVAL;

Thanks for catching this. I see that another person has posted a patch
as a result so I'll respond over in that thread [1].

Drew

[1] https://lore.kernel.org/lkml/20241003023307.2138695-1-clf700383@gmail.c=
om/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
