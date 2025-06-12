Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 732EEC7114A
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jun 2025 19:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vgyNV+iENkH8XlgyI4dTSoDSBtridog9las6YINvT0s=; b=4ILjOyF3zGOvzq
	FH3hTmoq8QXqGmPAfadXj7BI5fOMgaTdZ2+O9vXNENruD3xv6giT7PlrJ2m48WlkvlHiM5jUwy0cl
	tqlyBIK+HhVqNW0SAapWsHYqqeV+OPnBK1PRkWTRoznAo1sUVFLseAn0ZqP931seO4Tsi/6ncXUcn
	3Jt+GAVnwIR/vIxBdy+6l1A5rCJoVEaUiFAF3RUxukcSFv1IMbQ/zD7ebJeqd84NhnFvslMHlpPMb
	QAHhxILeoBOpEnArRfZhW1FvtvD82Wf7yMyBQpDJguCC1ouDjDOWCHXg0frS/ebFHqYv293XnBW6K
	SjWjodFwLdKLr5W/UVMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPntQ-0000000ENcW-1wvx;
	Thu, 12 Jun 2025 19:47:20 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPm3Z-0000000E4oY-3xgC
	for linux-riscv@lists.infradead.org;
	Thu, 12 Jun 2025 17:49:43 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-747fc7506d4so1294014b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 12 Jun 2025 10:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1749750581; x=1750355381; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kKudhM6GP7ucCr8LJ/xGTzdQhmTfuZa6CNBowxM0Kt8=;
        b=KPuTZdmZTE6NXoN+5gltrhE7dVxUkEiUVKaSmbMEA9jKR84e/P8bKn0NJsj8Bj+DXC
         bQz2aalDagSmTjHmZI1LuMTOTHuc5X7N67k7MDZbvE48hGqKiENVH/p5rkcEyeh+nUZA
         jCCD87B6Qkxnkdct00LNlKmQerW95GAQvohtcmTSZ3w3H+bfwtH3hI2sWnfo67IO15wi
         7HYKig7r7R6Bc2zlowlNC4VexrF7aL7eFim+nHII0MaQectDuSrgSx2Vg1c8HkZiSKP4
         JnqQAsQm1ZumXXnSXEXmnRO6t3Lr3sheEhbYCwqq7Ugm3qNmuO7ha+e51EKj3dnuNJLH
         dqSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749750581; x=1750355381;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kKudhM6GP7ucCr8LJ/xGTzdQhmTfuZa6CNBowxM0Kt8=;
        b=wEUtfFPfBiyGtNG5naw9dqKUMNF6a+hOv1XYV1bigLV1dgYEclISIu3mSfd/MQ/LNo
         gP4TqtO2tnfGNP/ldG+ka8pTwiYhI34dZZZ0jo846+O7TOlVrDgnJm43kV2C9dfqlw7l
         I6SCcT2R4PTgfqDKl+SXwedO3CH2DqtcGWVgpmQyuOTKLHtA2cFnhqGpPY3Lqn/0m+91
         0mOptMDDNf+0AXJH4XcJEvOfyIl3BtQxql1Y3ccMzQQOJ4xuUEeCEhmNaK24Sg3K2VtE
         am0w9KcW/agBbIzXRn4wKzxGBvGlJVBYXl2Zmx5wBElgnwm3WKhlzJYhGU2lju2vSsAD
         BA2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUs4dPEraq78ZhpqK3nps8Ta7dvb+IgdoKhMh5aXgNd2wnctSfUZZBk0AK+eOoQLA2ZlZ0jSim07Eblpw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6rlHo787ecLerzLb9EtmHTMzgFNlvAPpu8UptXHjBeE8kCMZq
	/7UTVuXmCGBXZn427xcBk6tgAk/nNAXsx8NVEkvBZOFtKXrp+RZlWFXfUGF871uaNxc=
X-Gm-Gg: ASbGncuko1geUh2osrsa2GQ3iomasoKJ1X1IXtPnBB+vC6HYC3odNqNUTWTzx/o865E
	6JMWIMbD9NbIcMeTrrxJvwtBreD9riYf8yVTPD2uuJ/cfe1Re5MLGQhsdcPlSh10AwJ+dSuHBOn
	Tv78sPR8zdfF3Hjzs/vYLIdYzfhQrfke2uIdiQGyKfqsYSgftlHjK5+PKU6Pbp3mSngU1cvaQE3
	zWZ0X66yKbzfnFgdldpUkVG5tzu1DEwOXhQ1mOEXbLbzF5i2qX5NUE21o530o6TvtIfZu/7NLNY
	LqZOelb+3P8fW1QnJfXaPcVC+USta6nJxfgG1TOWFrnv5vtslEaU+jeCLZoDPGpP2yeghjg7mA=
	=
X-Google-Smtp-Source: AGHT+IHLquFrw79+co4boFO8pJOfM9btk60nayGRQuNX/0ZumrQqIBCAkSYORT1Ip62N3F8udvKXLg==
X-Received: by 2002:a05:6a00:984:b0:739:50c0:b3fe with SMTP id d2e1a72fcca58-7488f6cb9b2mr295006b3a.8.1749750581050;
        Thu, 12 Jun 2025 10:49:41 -0700 (PDT)
Received: from x1 (97-120-245-201.ptld.qwest.net. [97.120.245.201])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748809eb146sm1837808b3a.109.2025.06.12.10.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 10:49:40 -0700 (PDT)
Date: Thu, 12 Jun 2025 10:49:38 -0700
From: Drew Fustini <drew@pdp7.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Benno Lossin <lossin@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 0/7] Rust Abstractions for PWM subsystem with TH1520
 PWM driver
Message-ID: <aEsTMrdmC7drMJIs@x1>
References: <CGME20250610125330eucas1p2a573627ca8f124fe11e725c2d75bdcc9@eucas1p2.samsung.com>
 <20250610-rust-next-pwm-working-fan-for-sending-v2-0-753e2955f110@samsung.com>
 <aEifXZnLxKd2wa0w@x1>
 <6ca6016e-3b17-48a0-ad8d-bb05317aa100@samsung.com>
 <aEoWtviFl0vYATXe@x1>
 <t26bhukukjzy7e4d2omtvjchxxzlnfyx54ku7xbytcnxkuk7xk@6tap2t3z2oaq>
 <b3252042-e7fd-4ac9-a4ad-0226d21fd477@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b3252042-e7fd-4ac9-a4ad-0226d21fd477@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_104942_067414_052A4F9A 
X-CRM114-Status: GOOD (  17.41  )
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

On Thu, Jun 12, 2025 at 03:27:09PM +0200, Michal Wilczynski wrote:
> =

> =

> On 6/12/25 07:01, Uwe Kleine-K=F6nig wrote:
> > Hello Drew,
> > =

> > On Wed, Jun 11, 2025 at 04:52:22PM -0700, Drew Fustini wrote:
> >> I also enabled the pwm fan driver. However, there is a probe failure:
> >>
> >> [    1.250921] pwm-fan pwm-fan: Failed to configure PWM: -524
> >> [    1.256546] pwm-fan pwm-fan: probe with driver pwm-fan failed with =
error -524
> > =

> > 524 =3D ENOTSUPP, so it seems the request had duty_offset > 0. Does your
> > fan use PWM_POLARITY_INVERTED? If so, try without that flag. If your fan
> > really needs an inverted PWM this of course makes fan control buggy.
> > With the next revision it should work fine (as a duty_offset > 0 should
> > get rounded down to 0).
> =

> Since we're running the same DT, the polarity shouldn't be inverted. I
> see you have CONFIG_PWM_DEBUG=3Dy enabled, which is most likely the reason
> the probe fails.

Thanks, I've disabled that options and the probe completes okay. The fan
is now spinning :)

Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
