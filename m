Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E8A3C71135
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Jun 2025 00:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9WW8VznP0j8Mxo77Y7TvDDoF8dFeWGTBwtxoRnYnlXg=; b=PwS9tLiLG/PkNQ
	ZywPqkV5FkRj0SkAe+p1L+l3W1fK9DWz4HXeC6bhRHieLaX2WhpwMeQ80BxwU7ln2W8Zh1xj7zjQD
	H9qXiFbdo3taCtL214D9a54JfwREobBv8DR9S5e7X9yLPcaNjXtVeRPxH/jdbS32aK4E5U7FRdWSf
	Q0q+FDaOdjpO/QhhTk5gk6rN0ZLiIKaC3lDWoAxKB0pahNUPvbdqePxd8+d0lV9NpQm9BkDEng+d4
	xhQjZ8bTE/rgZoRl8wAYP/BsqZnXY/F/DQSFeok8f62fMpp8vQewHepEIvpZqFHpYHiFlMb4YBUI2
	LE0zA8xYLJjJhbmTjnng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQy9q-000000032Tr-3LHK;
	Mon, 16 Jun 2025 00:57:06 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQy9m-000000032TT-3OFS
	for linux-riscv@lists.infradead.org;
	Mon, 16 Jun 2025 00:57:04 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-b2f0faeb994so4352919a12.0
        for <linux-riscv@lists.infradead.org>; Sun, 15 Jun 2025 17:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750035422; x=1750640222; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oT/gl9ntzgnLVv3Iy2roEt0j1rQ3Tf60S9oriE2bToo=;
        b=ALrE1R8xwIZkM95mw+DFpEPmB/5rHqEQ0NUqD6nr4i13V0NkCLlgcrEe7FrdxK8Eig
         /FWxC/4veAvLbH7ua5vVhVLNHiywsdz6DzrS1ud6+STxxFzQCTPxgLnNEDBg3mkrTqiO
         Afus/+rFiwqDyycKl4Pu8fKbX1vAv65smNZigg1CQ+d2DcBgMkjvq6MM8/2nmbt4yffx
         GJiGs+HG5KIRP/HlbZ8hL/BbhHVtZdC82qF5nO8OWVqQAampEWTNTTPcS7mRcBgVm9Fb
         I1PcLP3jVAOG2a4mqKunCjS7Dyjneat18WGqN/SQGIkoiULxTaEzddXBpR1JASghDOt7
         fW+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750035422; x=1750640222;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oT/gl9ntzgnLVv3Iy2roEt0j1rQ3Tf60S9oriE2bToo=;
        b=C3x2ij0HSPEQqRBrfThH6W4n5EmBNWh95L/0CUw3RO1vkvrOLCVwpj2KVafysjoUMw
         pZk8k3SrVDFpbytPjtpVRQbFhtnhQUQY43fWkzV+jP2bfugLxib05izNeqVNbOQX0KUj
         6/px8fdWbmmohesbVHVi2308bVlufXdz0osfO+PVUpeEHKX8QvtpSFM3sTEECWMLmVDQ
         IgKTiM5qqfGsiQSCM6NoSsHYfa53TDWSlwEExacRt8urVpa76dU+niVnYknkYu5VBuKd
         Zjf5jXk013GCn05Y3aKW0AdyJlJfjC7F4L2E96Zh7eKgu2GjrVFK+iGBQ7D+Xkc3wFDA
         Mrcw==
X-Forwarded-Encrypted: i=1; AJvYcCXIvbEuEke6w3sqAfd99EgMQjTGVR47ZHPQJ/ZowrtZX6BYO3IBPu3mgtDZwCAyf3B6J9B7auxO0Cm/Kw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz71oz48oyvGDq0m/XyQ3cWw21OBbpl2afRqMNcGVKu3xAmaVg8
	XWd1ccuhAo5df9f0Bhy4yGGjUJu3O5lcZXi6z4Xp5yTbmG5YFyTYd3Y4UfDZsEaDRoI=
X-Gm-Gg: ASbGncuz1gKQO/zLY4ex8Ak2fG1z72bEhF5a4ERnJZQjQNe0LFrHOreSmdufrknrygd
	/GpBoDaFt3la0qEDkkpFgWd+Ndk7gDSq77TG44yoZfzWYo8gEcyiVfHrcf2jeMG1Zxh+YjoiWu1
	7FTEquA6GM8jQSm/H9SuJ468HtLZ0//aSQZwJdmUstqP+8d1krT5WGZ23HWCUGCz8zAP/KD4xzr
	WVbtIPT6qEkqUb6EFojTN15dsKK0BClXsi2RsqHeRCUAIlMPWU2fKOlbXIhe9b882dbWnRCiwVq
	mrEUTg6sB6jJ0wCqLx6aju1yLforEbC4vrVu9VsW+HtX7ZUEJBj6JbtckTclJA==
X-Google-Smtp-Source: AGHT+IEJZx+RvcW/dbXwya7QUE7sY7JBiNDXSGJnioj+9AXE7S+LvtvlFoRF1iJqrMM91idUaTWYJw==
X-Received: by 2002:a17:90b:3805:b0:311:ea13:2e70 with SMTP id 98e67ed59e1d1-313f1cfa1afmr13643569a91.14.1750035421829;
        Sun, 15 Jun 2025 17:57:01 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2365d8a17e4sm49582235ad.56.2025.06.15.17.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 17:57:01 -0700 (PDT)
Date: Mon, 16 Jun 2025 08:55:47 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Richard Cochran <richardcochran@gmail.com>, 
	Yixun Lan <dlan@gentoo.org>, Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
	Ze Huang <huangze@whut.edu.cn>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next RFC 0/3] riscv: dts: sophgo: Add ethernet
 support for cv18xx
Message-ID: <dex2g5mafop6vtc5qdkdlunk5te53u7xxntcz6sjhwldhah6hl@gs6inqeuzlo2>
References: <20250611080709.1182183-1-inochiama@gmail.com>
 <d3b20a9ce58fa296034fe3aa8b60ecde4c4192f4.camel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d3b20a9ce58fa296034fe3aa8b60ecde4c4192f4.camel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_175702_847084_AD5FC866 
X-CRM114-Status: GOOD (  18.83  )
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

On Sat, Jun 14, 2025 at 11:19:34PM +0200, Alexander Sverdlin wrote:
> Hi Inochi!
> =

> On Wed, 2025-06-11 at 16:07 +0800, Inochi Amaoto wrote:
> > Add device binding and dts for CV18XX series SoC, this dts change series
> > require both the mdio patch [1] and the reset patch [2].
> > =

> > [1] https://lore.kernel.org/all/20250611080228.1166090-1-inochiama@gmai=
l.com
> > [2] https://lore.kernel.org/all/20250611075321.1160973-1-inochiama@gmai=
l.com
> > =

> > Inochi Amaoto (3):
> > =A0 dt-bindings: net: Add support for Sophgo CV1800 dwmac
> > =A0 riscv: dts: sophgo: Add ethernet device for cv18xx
> > =A0 riscv: dts: sophgo: Add mdio multiplexer device for cv18xx
> =

> Have you noticed any problems on the board you are testing on?
> I've added the patchset + pre-requisited + the following into my board DT
> for Milk-V Duo Module 01 EVB:
> =

> &mdio {
>        status =3D "okay";
> };
> =

> &gmac0 {
>        phy-mode =3D "internal";
>        phy-handle =3D <&internal_ephy>;
>        status =3D "okay";
> };
> =

> And the PHY is being detected and the Ethernet controller is being instan=
tiated,
> but the PHY behaves really strange: LEDs blinking wildly, link status is =
bogus
> 100FULL UP even without cable insterted and the real traffic starts to tr=
avel
> only roughly a minute after the cable has been plugged in.
> =


This is true and may be related to a wrong pinctrl setting or the
phy setting. But I am not sure the right configuration is at now.
IIRC the phy is inited in the uboot and the kernel does not touch
its custom part.

Regards,
Inochi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
