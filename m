Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13C2DC282D3
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Mar 2025 09:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e41zI/exU+OZKDKgr/5L/LAFbbOEhZEdMn/ODf96bU4=; b=DZY6EpwbF9Rl5C
	Llh6/vpg3/X/MGjl+86pFR4dVGw+wgSAqqhqP0IcboPtneIYuNTvnpqXoedwGLl5APP4ddZyb7XlS
	eEJnE8CKxFJZW4s3HH4XnGCpogdb0qfxXiRa59oRZgXWFmv6j9YpMmyuY4xU3BoSymPkfo+yLfjh6
	g+6Ns5QVsLJSZqoW3lYRVFhZUmu3kclq73kHEN35eHZCBlPkq7Sim+k4h65NiiYhDYd7aCtX+uX4+
	OkNrbJG24MC2ZKHlio9ehkkoohxBOuCvNwrVTHAGZqaFATqMeHgurwcgMoOo/VrsGD7XCrGVsNF7N
	Tc9+gpFdvozsGZHoQHFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpOMM-00000003pJ3-062p;
	Tue, 04 Mar 2025 09:14:42 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpNCU-00000003XuB-1eGw
	for linux-riscv@lists.infradead.org;
	Tue, 04 Mar 2025 08:00:27 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-7be6fdeee35so969414585a.1
        for <linux-riscv@lists.infradead.org>; Tue, 04 Mar 2025 00:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741075225; x=1741680025; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q1GaFj1uo9b1rPoRpPsJa9v8kqyTjyZ1mM2gRt9a58c=;
        b=SzsIGADR8n9Zko04WExA+/RsK885SH77yfJMJXJ0wbqrkMW0q6zH1wRoxs2XPpjHLG
         QLflWDw4TaLt/q5Xd1xu0R+Pg4xGoJQcXbpPPKYTEJqLlO/ESv4kkQ7D+vXdkVBaBY1o
         jYwXmWmKYJ5J9Hgu5Di5kMKs3j2AGhTVczWMOjx9Z2VHTUXUGFrVRVDbdCgmjXjecHu8
         7sb7+7QpsldLUpVqUgD1tCuLBG3m1S5Ggilg7gq971WqrqOWiuHCXuEBPbMASifwkfex
         lmYRteRYI+IEa6oANzSQh0qK6abI/r7nZooZeyZS1q06KknKH08H73XTzTgduV+QptQa
         uAsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741075225; x=1741680025;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q1GaFj1uo9b1rPoRpPsJa9v8kqyTjyZ1mM2gRt9a58c=;
        b=Ov/9NIs5Bc1+YUW8l3lf5q4TotNJqe5jC+R33woDY5rziyPzBj+hGcWc0KewtDMDAn
         DbKgxnhu/Q2VH/H07fMwo7qTMC07CxE0jbK/pIz/ehTIbzeqvVtz54KYVbzFPwadfUVP
         LtB8jQIWjAPw2dqZFf6eLMHAvTUC4k02r8562NxVSmGIQKwwEOo9IOpoRpC/wNE1dcvo
         tzNHnuzpsxTT5w1z9Tef8X8Hioj+JsiYZ+uIy0HAyhJrlXngcPCp0A5Seu2EY9+y4Ubc
         afM0ml6Sf0HWWPt+EWsYDZIJnsFJiheWOlymRT35AWsNWYk9B0oq2XEXWZHGaRMwuiee
         opiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUhykEWK0+yhixE1CdAJSj1rVzj5xJ2sLJoz0daoXfbPiKrzq05Tl82rAkdi8MIujSZ7r2Awf6baF9mA==@lists.infradead.org
X-Gm-Message-State: AOJu0YySEfxi62J2DaT6ZUoj2WXEV4LEcdoDAUbzbI1rpz6NLg829Y1R
	hlyi2EqGbhwmu35uINAqALrPFKnem+tDtUxlVR8dH9zqRsKmRH5O
X-Gm-Gg: ASbGnct1/7YgBuIyvrKxzNYd3ZGHqO3RQ5VZbQ9924YRCFPA9xlMY9tZIxJ7wF7kT5T
	Lkld1DGgoFkAve+woJOq7qhJ/YI7N7/iq3M5M+XXyetw6z+O44odXckOorbgr/ON+mO5EUyggEG
	gCZuTkVf2bKJXVsK0ICUFICYYpauYWPkhVNs1wZVCj3hDBNYETtI5LvxmMtuco4sDzj47K9x+oK
	KQjI+HujVwtc6ThBpxAv2s2fT2d7cmlhHGhFGyp7F5B3iKwHTUI87JNJBidqcjrUPFGxTVFBOjO
	E/ob+SunRuzRYO8ZBluE
X-Google-Smtp-Source: AGHT+IFdkylbVxqjDte09eicMFW7LnS9CUylFe+DIP4qpzozVLfERjJXNp00RzgPd4cBPvEXx1CsRg==
X-Received: by 2002:a05:620a:199a:b0:7c0:ac2a:ed0 with SMTP id af79cd13be357-7c39c4c6b8amr2201869485a.30.1741075225155;
        Tue, 04 Mar 2025 00:00:25 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c3c57684dasm161673585a.77.2025.03.04.00.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 00:00:24 -0800 (PST)
Date: Tue, 4 Mar 2025 15:59:57 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Johan Hovold <johan+linaro@kernel.org>, 
	Shashank Babu Chinta Venkata <quic_schintav@quicinc.com>, Niklas Cassel <cassel@kernel.org>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 0/2] riscv: sophgo Add PCIe support to Sophgo SG2044 SoC
Message-ID: <7un3pk7ukjay6ntbnlvif7mdpdfngtvbwrkcsresxmmtaxah3z@mrfezotyabsr>
References: <20250304071239.352486-1-inochiama@gmail.com>
 <PN0PR01MB103930AC8CABC36771EAE089CFEC82@PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <PN0PR01MB103930AC8CABC36771EAE089CFEC82@PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_000026_429059_8F9BDE5A 
X-CRM114-Status: GOOD (  21.15  )
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

On Tue, Mar 04, 2025 at 03:53:57PM +0800, Chen Wang wrote:
> I think it should be v2, right? :)
> 

Yeah, I have made a mistake. This is v2, not v1.

> On 2025/3/4 15:12, Inochi Amaoto wrote:
> > Sophgo's SG2044 SoC uses Synopsys Designware PCIe core
> > to implement RC mode.
> > 
> > For legacy interrupt, the PCIe controller on SG2044 implement
> > its own legacy interrupt controller. For MSI/MSI-X, it use an
> > external interrupt controller to handle.
> > 
> > The external MSI interrupt controller patch can be found on [1].
> > As SG2044 needs a mirror change to support the way to send MSI
> > message and different irq number.
> > 
> > [1] https://lore.kernel.org/all/20250303111648.1337543-1-inochiama@gmail.com
> > 
> > Changed from v1:
> > - https://lore.kernel.org/all/20250221013758.370936-1-inochiama@gmail.comq
> > 1. patch 1: remove dma-coherent property
> > 2. patch 2: remove unused reset
> > 3. patch 2: fix Kconfig menu title and reorder the entry
> > 4. patch 2: use FIELD_GET/FIELD_PREP to simplify the code.
> > 5. patch 2: rename the irq handle function to match the irq_chip name
> > 
> > Inochi Amaoto (2):
> >    dt-bindings: pci: Add Sophgo SG2044 PCIe host
> >    PCI: sophgo-dwc: Add Sophgo SG2044 PCIe driver
> > 
> >   .../bindings/pci/sophgo,sg2044-pcie.yaml      | 122 ++++++++
> >   drivers/pci/controller/dwc/Kconfig            |  10 +
> >   drivers/pci/controller/dwc/Makefile           |   1 +
> >   drivers/pci/controller/dwc/pcie-dw-sophgo.c   | 270 ++++++++++++++++++
> >   4 files changed, 403 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml
> >   create mode 100644 drivers/pci/controller/dwc/pcie-dw-sophgo.c
> > 
> > --
> > 2.48.1
> > 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
