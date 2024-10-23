Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46261D2E01F
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Oct 2024 07:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HEMLbaCPMCe731t/Utz3ZiLXKoBYsT/cguGoFpy7EBw=; b=DQHPLPPs27Vkgt
	YavHl3PAvvMnPpAMU5yASdBunlh9/96ev8Pd/IcUiLyhbD2+mBqi7W5ut8IsMlJ7iXxtbIXqkA5j8
	Rf4R8SoXtth3kB2KAwk3tMJ9bdAtY0JMkI5kHfY35gGQum+wPXNxT+WZL2eS7ynV64a0h4f+Zy3P9
	P861kxEECTUwMD4yvtUF8X+NknrgjaYLdBMs038Iz0E/C79oOIKkukim7tS4BGdkzFBy5O6Y4Qk1Q
	WiF6WF+0C4p0yYGL9BC8sIc0/UoUx34+hDwVz40kOoeQpEHK7QwscMgi3VaMHlj6sW2snPGO1M8RO
	AJz0VCJNcGRILvnDbVlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3VyQ-0000000DQCZ-3J8J;
	Wed, 23 Oct 2024 07:40:06 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Vgs-0000000DMmS-2nnR;
	Wed, 23 Oct 2024 07:22:00 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-20c7edf2872so4381805ad.1;
        Wed, 23 Oct 2024 00:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729668118; x=1730272918; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3JpW5l4cHfObYzl7+2svJ3Qk3MetE1pLsV3fZ39aook=;
        b=OsoK0TTNpPT1alNrqNNGnROT2P/RhBy3GK4YiRvQgLIT/0RdNDxB4x1oIdi4QQmvYp
         XJQ7XIqzQMaNf+spYe1cwHn3ZpsjzDArHPckWu8bkahEgUNY2dmge559HAohWoYbE6ks
         pl1jnyoG4oL5uOTVrSU6l881iq/Xjoe5dJ3Q7ywg/MGrgXSCSD/Q8yRO6wA6yhsEpnVE
         o7waEfkxhV40FpwtiPorrBZSGOHroge++ctpYa2kdRPZJcHvMF+rPWdeD8vizkBXj/oL
         2Nw9esiOFJ246s96DqI28ihe0c6t89TJ9nuUc4vBL7Vaxlya2CYlZChWaXLICmd07ngi
         EWMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729668118; x=1730272918;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3JpW5l4cHfObYzl7+2svJ3Qk3MetE1pLsV3fZ39aook=;
        b=WA8JnlTfkiIiJUTx8Mi302WQxY02PX3/4jF4S06zzn+BUNC/CEtRxp8oh5qY3v142U
         cFCKVeQGoqOp/DBRwEOrI0leHA2FcXP9XhK7fOkSsN3DlTyNKXgPsPxB0VUOV14aV/0N
         JzUijfGgYbpF/B6gWozLHpSG+6BDwO37L/1UHgltAvKirZ1JQ+asDSIUQAm4MzE7H77d
         FsxritN8aJ1xJsZnYHt8t/8l+7LcSSSIKiGJuYOgqtysK6c+YjwulHZNKB39ncsZ+ulS
         vRbuQK/+yK7LBzgb+b3fI4+s+wyQAiShJPgnK4l34UO0wQ+594cnrXLUUVDMZ8JOU+wi
         1jIA==
X-Forwarded-Encrypted: i=1; AJvYcCWFpFM6k0nHiA3zswIGIRGbGNxW25uGYMAMg60mYT9aUCJooTYTfBzuHz22qkawKcTT9PPwEDAl7M95Q8Y=@lists.infradead.org, AJvYcCXMJ9CwM/Zc0qWuwmjaW3YgAQ+77vm8UDnL7jHYLI1gGGQ3MDg7dnGofJoIbu7vH/GIRQmjKFfObvmuQS+a+euD@lists.infradead.org
X-Gm-Message-State: AOJu0YzwvZeKHTD88/YZM8EEyC0NEFTYHttYNc5QDOHwl8WSILTFZljC
	VqMq0RIWeFtFaRzuE+FvDlLvDaFAH614rKM2CclVTq9pFt6qtmFY
X-Google-Smtp-Source: AGHT+IFtrw0bTSDjOUHwOCouu0KJSU1+vA+nX8p6eBupMmcRvLXscxMVgLjlJ5OaperPpo2phGpacw==
X-Received: by 2002:a17:903:244a:b0:205:8763:6c2d with SMTP id d9443c01a7336-20fa9ea22f1mr30676555ad.9.1729668117790;
        Wed, 23 Oct 2024 00:21:57 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7eeef535sm52795975ad.44.2024.10.23.00.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 00:21:57 -0700 (PDT)
Date: Wed, 23 Oct 2024 15:21:36 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Inochi Amaoto <inochiama@gmail.com>
Cc: Chen Wang <unicorn_wang@outlook.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Inochi Amaoto <inochiama@outlook.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Yixun Lan <dlan@gentoo.org>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 4/4] net: stmmac: Add glue layer for Sophgo SG2044 SoC
Message-ID: <amg64lxjjetkzo5bpi7icmsfgmt5e7jmu2z2h3duqy2jcloj7s@nma2hjk4so5b>
References: <20241021103617.653386-1-inochiama@gmail.com>
 <20241021103617.653386-5-inochiama@gmail.com>
 <227daa87-1924-4b0b-80db-77507fc20f19@lunn.ch>
 <gwtiuotmwj2x3d5rhfrploj7o763yjye4jj7vniomv77s7crqx@5jwrpwrlwn4s>
 <65720a16-d165-4379-a01f-54340fb907df@lunn.ch>
 <424erlm55tuorjvs2xgmanzpximvey22ufhzf3fli7trpimxih@st4yz53hpzzr>
 <66f35d1b-fd26-429b-bbf9-d03ed0c1edaf@lunn.ch>
 <zum7n3656qonk4sdfu76owfs4jk2mkjrzayd57uuoqeb6iiris@635pw3mqymqd>
 <d691a687-c0e2-48a9-bf76-d0a086aa7870@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d691a687-c0e2-48a9-bf76-d0a086aa7870@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_002158_730961_3A55B511 
X-CRM114-Status: GOOD (  32.21  )
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

On Wed, Oct 23, 2024 at 03:08:52AM +0200, Andrew Lunn wrote:
> On Wed, Oct 23, 2024 at 08:41:36AM +0800, Inochi Amaoto wrote:
> > On Tue, Oct 22, 2024 at 03:51:08PM +0200, Andrew Lunn wrote:
> > > On Tue, Oct 22, 2024 at 06:21:49PM +0800, Inochi Amaoto wrote:
> > > > On Mon, Oct 21, 2024 at 03:27:18PM +0200, Andrew Lunn wrote:
> > > > > > It is related to the RGMII delay. On sg2044, when the phy 
> > > > > > sets rx-delay, the interal mac is not set the same delay, 
> > > > > > so this is needed to be set.
> > > > > 
> > > > > This is the wrong way to do it. Please look at how phy-mode should be
> > > > > used, the four different "rgmii" values. Nearly everybody gets this
> > > > > wrong, so there are plenty of emails from me in the netdev list about
> > > > > how it should be done.
> > > > > 
> > > > 
> > > > The phy-mode is alreay set to the "rgmii-id" and a rx delay is already
> > > > set (a default tx delay is set by the phy driver). In the scenario 
> > > > the extra bit is used to fix 2ns difference between the sampling clock
> > > > and data. It is more like an extra setting and the kernel can not handle
> > > > it by only setting the phy-mode.
> > > 
> > > This sounds wrong.
> > > 
> > > So in DT you have rgmii-id? You say the PHY is doing TX delay. So you
> > > pass PHY_INTERFACE_MODE_RGMII_TXID to the PHY? It is not clear from
> > > this patch, i don't see any code mentioning
> > > PHY_INTERFACE_MODE_RGMII_TXID. Could you point me at that code.
> > > 
> > > 	Andrew
> > 
> > The phy on the board I have is YT8531, The config code is here:
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/phy/motorcomm.c#n868
> 
> This PHY should be able to do rgmii-id, so there is no need for the
> MAC to add delays. We encourage that setup in linux, so all RGMII
> MAC/PHY pairs are the same, the PHY add the delays.
> 

Yes, this is what I have done at the beginning. At first I only
set up the phy setting and not set the config in the syscon. 
But I got a weird thing: the phy lookback test is timeout. 
Although the datasheet told it just adds a internal delay for 
the phy, I suspect sophgo does something more to set this delay.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
