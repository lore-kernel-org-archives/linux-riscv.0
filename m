Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B6C9C282D3
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Mar 2025 01:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lj/1GuvdWQq02dHdZzhnS+TCZvA3s60zXGvXLrriCuA=; b=F6k6SPKtC0xd5O
	H+GRZsCxMcQx85i9p7mC9z1CNTdueJa4t25Jb3Q7oOAvw+DvuOBGftd/cvpb3KxkqlyhhFFFCPTeQ
	K0eDvtEcjS5PgHSrK0uhM1MR5DuzyhBZeqHlI262yAyyOjBCzhqwTKqD1cI35m0T7mImnhh5um7GU
	h3cS6k4d8dmMMtnzSrtG3l5woCMivh3PLW57tI4Ng29yEh+JA3PhBPRoimPzyfQYvOTCtURiqIx6C
	OqOTKCeVRN+7C5wt30tHO6p14GDJJCad83pk3EL8alSxqQKEopUn3Rir044UIO87Gusjpp/MzH+Pa
	BnGLdEdWO+VFS1j0AcoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpdZh-00000006it6-3vpS;
	Wed, 05 Mar 2025 01:29:29 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpdZf-00000006ish-0YJG
	for linux-riscv@lists.infradead.org;
	Wed, 05 Mar 2025 01:29:28 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-22385253e2bso86038575ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 04 Mar 2025 17:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741138166; x=1741742966; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lMhzBhCrPjIqQGQg1Wg59vv0ddj0LU+xkyGOMArKoKg=;
        b=fS/CHZF4pkz+RHvotrWeKJS7PDKsksj91obMB3bu9QmuOXpIYrojcNoSAZOQ3ob4eN
         ZJZvKMY4HRm88dZRVDMjkeFGxOeWrlY905CQ+AkvbgJsOqxyQrNLMRA2dTRQ1RbKqrNG
         qRn37Cj39ycNaZ6stwVl5YyChB/NhEUPk5kIsACUU32D6jLc7SSLKk3CELpkyrXoKazu
         2cd6dQMqwPAeJD+UqgWf0iQ+fg06k4WoCDPZ9Adz3Nuv8MiTCi4W3prShcSNwJ40hq3O
         JUWb9tG4vaMtd2qaCFd/VfuPWDmjb72XC3aknj16kSV7Bk3iSagZVqK9mc1CTyJDqGcN
         nuFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741138166; x=1741742966;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lMhzBhCrPjIqQGQg1Wg59vv0ddj0LU+xkyGOMArKoKg=;
        b=c/N7BBdL6VdFLoB2UMTuHNNAx/LP/aKwriZCrcJOMlDQdDUAGkyaz8fD/gcbXctcr8
         ZJnhILzOoNB2ZXvk7vH5ukuGBkJKPAW4TpoRZnEV/+hhC32o9R0LceIJmD+GWJhlJsuB
         RFYmHrzzZbsXZPXWR3Gblg8Bi2ZQHWcsLEz5ne/XEUNGkprVCCYrFpK9vPDojsdPOpKw
         ixhDEALq/jZsn5lPtiTQrrJR9CCdHzsruApltTiNH/MYxOk48vw+q2RF/CoccVl6ZiS1
         UwSGh6bNjF2b4gXxTp3yuYuMEpLBzzKf18qIJrAUTYqK8tLl5QIV4OU05eNdTweETfPV
         i9Fw==
X-Forwarded-Encrypted: i=1; AJvYcCWXzZXIAWrddXxsY+fCsQBIoGBBjEJs+MIvEGDqT63FdFaNksDMJUSculSN2F5DxLmnG2LVQX+INIkOVQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2TB7x5KOz5vr/jESqfV1BcRfi16EV4cP6kGpZPmHG/kVMXnu0
	cY1qbrI2alEbjtZeJOMeNZdQHoEeL3Ej2T51HpA3T59wYAbwmKyE
X-Gm-Gg: ASbGncv/24i6Nk3VO93J2vDlnL6WpXsXW7hc+0UG245RvYarB8h3cAM7NHJ21Msa1TU
	n9L+zt5y7CO3S24t14ZJaByPdOVXn4mh4acgsqHcBelLwFNEGJHodqUFO9qk0M3jLaYvXIA6vr0
	tgKGBU9fBt9FcQArmi3/HfDy3jWi/XqGKPRkeokivyXDKpTBF5TV342a56SUYJfoJw44ayi9yH9
	BqJEglRZtKCRGxHX2LiuBLLns3WCGQeHZBY/Z7R38zN4NPUQe9oZWx66xUrfref6ezgSDU5frxk
	npDn38fztBV67A2TeeafmTw=
X-Google-Smtp-Source: AGHT+IGMYeB1wOukNuf5Z9VnV6HZIq+bca5LXw8M9agga6DcCzRyxOH6Zle9qOflX6ikXDadlX9ecg==
X-Received: by 2002:a05:6a00:1788:b0:736:533b:f6fa with SMTP id d2e1a72fcca58-73682bef664mr1796095b3a.13.1741138166235;
        Tue, 04 Mar 2025 17:29:26 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::460])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-7362c92271fsm8578986b3a.1.2025.03.04.17.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 17:29:25 -0800 (PST)
Date: Wed, 5 Mar 2025 09:29:24 +0800
From: Longbin Li <looong.bin@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Inochi Amaoto <inochiama@gmail.com>, linux-spi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	sophgo@lists.linux.dev
Subject: Re: [PATCH v2 0/2] spi: sophgo: add Sophgo SPI NOR controller driver
Message-ID: <oghkqkoilkg7ny5saa4fi77hcawkdbeih5zg5aaliv6kf42jee@2nmyxje7itse>
References: <20250304083548.10101-1-looong.bin@gmail.com>
 <PN0PR01MB10393099D28CF3DF75A0F414CFEC82@PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <PN0PR01MB10393099D28CF3DF75A0F414CFEC82@PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_172927_169030_6EEFBE14 
X-CRM114-Status: GOOD (  20.47  )
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

On Tue, Mar 04, 2025 at 06:14:54PM +0800, Chen Wang wrote:
> 
> On 2025/3/4 16:35, Longbin Li wrote:
> > Add SPI NOR driver for Sophgo, including read, write operations.
> > This driver is only suitable for NOR flash.
> If there is a next patchset, please also replace "Sopgho" with "SG2044" in
> the cover letter, including the email title.

I will correct it, thanks.

> > ---
> > 
> > Changes in v2:
> > 
> >    Fixed following issues as per comments from Yixun Lan, Chen Wang, Inochi Amaoto, thanks.
> 
> I feel like you left out Rob, and you also left out his signature in the
> first patch ;)
> 

My fault! I will add his signature in the next patch, thanks.

> > 
> >    - Replaced "sophgo" to "sg2044" to avoid conflicts with other drivers.
> >    - Improve driver code:
> >      - Improve coding style.
> >      - Removed the [PATCH 3/3] in previous submission that based on the baseline not submitted.
> >      - Added error handler to destroy mutex if probe fail.
> > 
> > Changes in v1:
> >    You can simply review or test the patches at the link [1].
> > 
> > Link: https://lore.kernel.org/linux-riscv/20250224101213.26003-1-looong.bin@gmail.com/ [1]
> > ---
> > 
> > Longbin Li (2):
> >    dt-bindings: spi: add SG2044 SPI NOR controller driver
> >    spi: sophgo: add SG2044 SPI NOR controller driver
> > 
> >   .../bindings/spi/spi-sg2044-nor.yaml          |  52 ++
> >   drivers/spi/Kconfig                           |   9 +
> >   drivers/spi/Makefile                          |   1 +
> >   drivers/spi/spi-sg2044-nor.c                  | 500 ++++++++++++++++++
> >   4 files changed, 562 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/spi/spi-sg2044-nor.yaml
> >   create mode 100644 drivers/spi/spi-sg2044-nor.c
> > 
> > --
> > 2.48.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
