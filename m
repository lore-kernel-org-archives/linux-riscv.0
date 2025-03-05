Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60906C282D3
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Mar 2025 05:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jpTYr+U6qYqiHoMOeeuHVfF0SRaepXuhsO2SNvBpHMY=; b=TzeQyBGogGyFfB
	pm7LPY7AVhS6DkswPesMJ4WTSot00Y+trodfrYx5CQMEWaxEYr5qGrIiTzZMe3Jjg3mmbc3aMQjFO
	Mm1NIc3pB6wWDLzVvkHQhBkk9szQhm5dvtgIp/7wy1DO6Z1SA1m+6hx/TDI9AOI7XM7hfDdJaKAw5
	MrIZiCN6zCLE7HdifA9iJlOm+01H0yQHvDvIPpT5CqjHGM1wlh1ux7AWiMbIoQZRxxt6urfMMLpjV
	+ADiDM5ZScRQRXUWY2bBKQ271CRq9eeWjWrqHZUumY+D/S1CZs6VYlu3QYQNghHhX8M+tRiykbmKg
	8DpjsFCZ0CI/JWc9MPxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tph9d-000000071IN-2IvT;
	Wed, 05 Mar 2025 05:18:49 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tph9a-000000071Hx-2rOr
	for linux-riscv@lists.infradead.org;
	Wed, 05 Mar 2025 05:18:47 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-474e0bd966dso28364471cf.0
        for <linux-riscv@lists.infradead.org>; Tue, 04 Mar 2025 21:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741151925; x=1741756725; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1P3+iYzJ+YpQ9FI2rKYP4r/ocmp23KFw2lq/RJsTz1Y=;
        b=j5tTvoerGa0owglSBb6xR/E/kQvgBkt0mREU5KB3RfEfRuiM+bOE1E05OPwHmN7S2b
         zgI0aE67kjo4YXgegWlysWyEtKgBmtXu2rIcJSuqfzSqSWyPTiF2EInhhoiRRyMFMO5x
         sh64t48mwk/w1gmHWGcWpIwOZ2uSMy6Cmam+prq/ibTbFy+M32edHycD41iH202n6G6w
         E+zBXjXuptFMldbzkYlbWVt07ARDK5L0hervOuIt1s9isvhIzB2oQp/aNOypigLRw0og
         qfJKW9ezUZZPGZFS8hXHwjj7FvM0mORrJoEBBxkLWfS/mYTWI7hk/S0DD4V4xldjEX3/
         84AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741151925; x=1741756725;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1P3+iYzJ+YpQ9FI2rKYP4r/ocmp23KFw2lq/RJsTz1Y=;
        b=l7GUYJ8ma9lYxk1fgVecTomne3fRiiMROxosb0wCYiSav8FRzQTS1F/leH479NyiZi
         VwPVzRG5EiR3bV8l+0rYw+eV/WDuP8BPretDu9hv3YEvZF33o6Z/36Z3E9EK77rmroQH
         0KRBP6f+hptyhz3voMrZR1vD8e7gyhTHHMnIs9Z54yglyrmdhZzUjb45ghtn8Xvq66hp
         ppBDsmyHx8l/tFAteU9TVQ4XkKg38AazaUchuqlNCLWXdSVeS8htnn+MMFDeBxWlRoVZ
         kh62G2AlHLKAGZ3qu3JS3EBRWzBsMf/hQ34o1/e6rbRl4IMY6Z1c5tAtsFvUF4R+ugnM
         XM9w==
X-Forwarded-Encrypted: i=1; AJvYcCUUiQqLkyEEQvabq/aj74q4QaxHg/97H5bkqK1wqL4CNzkOnmaV9womSWqbdLmCNA3oPdyx0vbCy6G9pA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyDnHykVAjHhnPxn/+b818P5SdacYS+u3MK6uvxM5GmqVH+sxjX
	RKJt8qd24ziZ5DHNMo2YfoNIvLJ39oJZX8b104dEV+x6vSrUz4cG
X-Gm-Gg: ASbGncvWC7LiOK6Lhg17ZNujDWcc84mmWQAwEcCNXOYln8ZbEJ9yQTvqtu6JRUb/zQv
	P7hlFx8D9kRyKHy9yQDvWXRl8hngiTgEVxCRnFeN71Fu26pz0c7MxR1rqoODO+niXbNMJ5FJCHy
	+JZRxsEN9hFb7QaIJeGysohIa2uAwoPiqDCJwJf3IN5JoAox8nY3XRZnQOplqoLipadUXKNRTIg
	qkzjZ7c3NUduH58vFy6B9JYLLAuIikNRYJ/3ZrGMcwhcYHOr93EqNtKko5+ZBk37zAxBpZTHvf4
	Mwo5B9EZRj1CFz+9a/Cx
X-Google-Smtp-Source: AGHT+IEL+SRXWaxNqoLf2fRqsU51Nuz6KF+mx2D44cet7M+NDkMLl3pM/VonNiECdPjeLo+ew7jsDA==
X-Received: by 2002:ac8:5715:0:b0:471:bbd5:aff2 with SMTP id d75a77b69052e-4750b23bd92mr21798421cf.10.1741151924641;
        Tue, 04 Mar 2025 21:18:44 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-474f73d8145sm27595631cf.55.2025.03.04.21.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 21:18:44 -0800 (PST)
Date: Wed, 5 Mar 2025 13:18:17 +0800
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
Subject: Re: [PATCH 2/2] PCI: sophgo-dwc: Add Sophgo SG2044 PCIe driver
Message-ID: <borpjzjwtdeigqs4szogy2ozzqsqj3ucvppl3k6cdzfoukgdur@23wwl55dmrfj>
References: <20250304071239.352486-1-inochiama@gmail.com>
 <20250304071239.352486-3-inochiama@gmail.com>
 <PN0PR01MB10393134B6BD714C1F070F0BEFEC82@PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <PN0PR01MB10393134B6BD714C1F070F0BEFEC82@PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_211846_723898_7BF67C02 
X-CRM114-Status: GOOD (  16.97  )
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

On Wed, Mar 05, 2025 at 07:57:14AM +0800, Chen Wang wrote:
> 
> On 2025/3/4 15:12, Inochi Amaoto wrote:
> > Add support for DesignWare-based PCIe controller in SG2044 SoC.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >   drivers/pci/controller/dwc/Kconfig          |  10 +
> >   drivers/pci/controller/dwc/Makefile         |   1 +
> >   drivers/pci/controller/dwc/pcie-dw-sophgo.c | 270 ++++++++++++++++++++
> Will this driver work for all sophgo chips using dw's IP? If not, it is
> recommended to rename it to "pcie-dw-sg2044.c".

It should. As the DesignWare PCIe ip is widely used and I saw
limit changed across the vendor. And the implement on SG2044
is almost like the Synopsys one. I think it is possible to 
represent all DesignWare based PCIe driver for the Sophgo SoCs.

Also, please think twice before giving some suggestion like
this. Although it is a good practice to keep the driver
specifc. keeping everythings specifc make us miss some common
things. 

Regards,
Inochi

> >   3 files changed, 281 insertions(+)
> >   create mode 100644 drivers/pci/controller/dwc/pcie-dw-sophgo.c
> > 
> > [...]
> > +
> > +static void sophgo_intx_irq_eoi(struct irq_data *d)
> > +{
> > +}
> Why define this empty callback function? Please add a comment if it is
> really needed.

See https://lore.kernel.org/all/bxwsvluj6amgoelk7r55gqhmhjwpewnfyhvvw6zpxen7kqzvwc@fxcebjzo5axk/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
