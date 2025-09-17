Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5581CCAC59A
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Sep 2025 15:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u858I6xjHdsEWoi4hT8unG7L/WvjTbtohnfpaEJ6QWg=; b=QV/BJsp2A1JB7/
	CHm9abjT2xDNKES/BdRgjplskPKI5S/776JZoBZ9x6/VgCbPkxLwzEQtssJQu1yHuSClREe6SLn60
	tb1f7TI+jxW4wgU/PB2X3nrfBSWJedkCt6PYAAcGSSSSpFPfxklQZSn6AZDByQAnU0KeOfvcVVc62
	d/+KwrQO22Cq+elTxGiUk2kxpbnIrC7/GlBtkDmm8Q2wryoBTEne1XYPxNG+23b/Gkx1BO5/8eG/L
	1p25HRz4uBHSVOeXe6taQsG80E3W07QjU5ewgBT6M2ozN39avZ7FluuzBsGHzHUhVNiapYIyNAtIO
	FgEnSaRbIV5EQ0bYrBqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyu2J-0000000Cgj4-0h6m;
	Wed, 17 Sep 2025 15:25:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyu2H-0000000CghJ-2cLP
	for linux-riscv@bombadil.infradead.org;
	Wed, 17 Sep 2025 15:25:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:Reply-To:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description;
	bh=q27fzm1U+HTtOJk/CZd2YtayE6m/1WFC4/HuVd7xPus=; b=avmTq4TAND8jVWvff8CoGK8EOb
	xDN9aPGr6XzKHCdZ0hyzQSADxAsKKyhkpyT53bU45nxaqtrFH7SKMPu8XgweThSRTuNfGR1RWyS5m
	jWS7qbm/7yflsCqVXDKohhPA1y6PXKm8aEnjFk/5H3DdZOwL0faUGiBwHjCyii8j3HpkUmfAlJ6jj
	9voYunE3X1ub8DR/utJsgAqDPcv6qqqze99hvzNuIGpP9JF8MnP/wjNcFztzhrRUjboQ8D0qBuskb
	oH63o7U9kVH2mLBjHyBBF2dtAnr2H57NkXasQqyjGF2+0RcIRkuF8n08PO4OOJx5CakePlOkBuaVZ
	+T9R2RbA==;
Received: from mail-lf1-f46.google.com ([209.85.167.46])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyu2E-00000007Qdc-0OJ1
	for linux-riscv@lists.infradead.org;
	Wed, 17 Sep 2025 15:25:32 +0000
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-577232b26a6so1498007e87.2
        for <linux-riscv@lists.infradead.org>; Wed, 17 Sep 2025 08:25:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758122725; x=1758727525;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q27fzm1U+HTtOJk/CZd2YtayE6m/1WFC4/HuVd7xPus=;
        b=e5ue0KLNFrQMFYG4DOBGCyQmEjXTPI+8Ieva62yaEMhM2SVV2w9zj+oOJK4ZPjU747
         XwygoD/QI2PY5pNjaS3D93aBrs4OajtlU+72K5ptUU/BDbXSNqimUME0UZbeBzFgtHPm
         SKT5FSl3xLFYA5hkMT/9qvcfoD5+RMa0BlGuEHwcFb+YAqJgcVO39gI9qCA15kCtUgoS
         TWGFY6JHuHQu68OiOz74w64HOL9CWRdAB2cPy6vTxf6uVYdgqogkfozzZWLEAr13bo9k
         3vxYSHbwe4w4bJlHKgjdMzEL751uCZZPBU846YggHNH22lqqXFM/mj347eQQ1Re7Jq4Y
         6Wsg==
X-Forwarded-Encrypted: i=1; AJvYcCX1F6VaJ8wdCGQfRo2+/f+B/vsZ7V1u4LboGUaEajo97Tbf9wdVcr8MRwdnvFbwIM/ezEU9jysuMywy3w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyO/Cei+yIiJ5EhSpYCmxqmwQLAtv4r7I0LnAUuJah1IKuED72B
	5HQh7IEGTqmfEjTtuwjPO/97v+zfH1i0+HcgiUrQJAjwtgN8Yw4Rv3Dsd621eW4x
X-Gm-Gg: ASbGncucRQ+cMkz02BxpJc7uUHodrPLrcnEH1MiUvwuE+WzoVDOUC4bp16nI2Ku1+iO
	+dnS0i6RCwgeu/zXIl/DviaCrD43KMoc9Aq0ZgMmLWBDeydGZqLhmH2HMMuomLSphKYTmiVq7x2
	SqEqKofQjP0Wvvkd/1PPDXAhQ9l9F32HUQ5N0dCrctL7g+MBJYhfa+Hkz9H+U1nEs7SsHUFUgMj
	dhuQ6Nk8NzJYp98v+mkp1UNC2YQBLPW0CbTgLjHKOiP0mJJzCk+PT8nS3b1QQbgVfEYqy8JcDiO
	/WIbzbUGECWeDZHWwLYexIGWxNBjtWOfywtPlxwlwe9jVysj1eK3zM1si7puRt7pdhh/6lXzZJl
	8mEW+YOnjMDfNchbL585hIzx0G/UsOtg5cnWJPhWVoDG5VAzuQy0=
X-Google-Smtp-Source: AGHT+IHHVU/+iSpwoAj9egFU/Lgglgw1jCiYxnXwZOoXtHi+hbOW1aWtsqWfM6wn2oKrvgJ92JS73w==
X-Received: by 2002:a05:6512:694:b0:570:daa5:de18 with SMTP id 2adb3069b0e04-57799115167mr946200e87.33.1758122724666;
        Wed, 17 Sep 2025 08:25:24 -0700 (PDT)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com. [209.85.167.47])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e63c63cd7sm5376915e87.90.2025.09.17.08.25.22
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 08:25:22 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-577232b26a6so1497858e87.2
        for <linux-riscv@lists.infradead.org>; Wed, 17 Sep 2025 08:25:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW8CBrof4sHDgCkjSpTILRHtOcRMLDKdm32nJ8WICfzy/jTyoqT2PYtRAolt4yVgwGj/HzO9aB+ZnV5Cg==@lists.infradead.org
X-Received: by 2002:a05:651c:2129:b0:336:ba05:b07f with SMTP id
 38308e7fff4ca-35f63f7b5famr7302181fa.21.1758122722394; Wed, 17 Sep 2025
 08:25:22 -0700 (PDT)
MIME-Version: 1.0
References: <aMrPpc8oRxqGtVPJ@shell.armlinux.org.uk> <E1uytpl-00000006H2k-08pH@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1uytpl-00000006H2k-08pH@rmk-PC.armlinux.org.uk>
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 17 Sep 2025 23:25:09 +0800
X-Gmail-Original-Message-ID: <CAGb2v64ThmdFN7jHTs6Kf6pG0rhHzQn=X8XXt21qna2HLx3f0g@mail.gmail.com>
X-Gm-Features: AS18NWAKSCnNyj6DLBKT_D2jbUlV9UmfcpG5sUkS8PNH_1L_6YQPZfrfuWMUlOI
Message-ID: <CAGb2v64ThmdFN7jHTs6Kf6pG0rhHzQn=X8XXt21qna2HLx3f0g@mail.gmail.com>
Subject: Re: [PATCH net-next 08/10] net: stmmac: sun8i: convert to use phy_interface
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Drew Fustini <fustini@kernel.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, Eric Dumazet <edumazet@google.com>, 
	Fabio Estevam <festevam@gmail.com>, Fu Wei <wefu@redhat.com>, Guo Ren <guoren@kernel.org>, 
	imx@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Minda Chen <minda.chen@starfivetech.com>, 
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, netdev@vger.kernel.org, 
	Paolo Abeni <pabeni@redhat.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Samuel Holland <samuel@sholland.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_162530_176375_02949B48 
X-CRM114-Status: UNSURE (   9.65  )
X-CRM114-Notice: Please train this message.
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
Reply-To: wens@csie.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBTZXAgMTcsIDIwMjUgYXQgMTE6MTPigK9QTSBSdXNzZWxsIEtpbmcgKE9yYWNsZSkK
PHJtaytrZXJuZWxAYXJtbGludXgub3JnLnVrPiB3cm90ZToKPgo+IGR3bWFjLXN1bjhpIHN1cHBv
cnRzIE1JSSwgUk1JSSBhbmQgUkdNSUkgaW50ZXJmYWNlIG1vZGVzIG9ubHkuIEl0Cj4gaXMgdW5j
bGVhciB3aGV0aGVyIHRoZSBkd21hYyBjb3JlIGludGVyZmFjZSBpcyBkaWZmZXJlbnQgZnJvbSB0
aGUKPiBvbmUgcHJlc2VudGVkIHRvIHRoZSBvdXRzaWRlIHdvcmxkLgo+Cj4gSG93ZXZlciwgYXMg
bm9uZSBvZiB0aGUgRFRTIGZpbGVzIHNldCAibWFjLW1vZGUiLCBtYWNfaW50ZXJmYWNlIHdpbGwK
PiBiZSBpZGVudGljYWwgdG8gcGh5X2ludGVyZmFjZS4KPgo+IENvbnZlcnQgZHdtYWMtc3VuOGkg
dG8gdXNlIHBoeV9pbnRlcmZhY2Ugd2hlbiBkZXRlcm1pbmluZyB0aGUKPiBpbnRlcmZhY2UgbW9k
ZSByYXRoZXIgdGhhbiBtYWNfaW50ZXJmYWNlLgo+Cj4gU2lnbmVkLW9mZi1ieTogUnVzc2VsbCBL
aW5nIChPcmFjbGUpIDxybWsra2VybmVsQGFybWxpbnV4Lm9yZy51az4KCkFja2VkLWJ5OiBDaGVu
LVl1IFRzYWkgPHdlbnNAY3NpZS5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
