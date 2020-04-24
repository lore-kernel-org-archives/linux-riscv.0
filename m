Return-Path: <SRS0=rCLW=6I=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FAABC55186
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 24 Apr 2020 06:45:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 564AB2074F
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 24 Apr 2020 06:45:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E1DNWF8L";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qaQCGMbh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 564AB2074F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/5EA8JeRrfnBN/0CmhL4oF38pY+Q3bFW76pYDktcYRw=; b=E1DNWF8LR2kvpmh4MXeeMKAKh
	WQRRNc7vEU1AfGrp6FpNq5wdY3X0Tpq/wxjByhb5LMK5WlGpEFxPIEH/jHQPJGg4uumQ5wSqizFiv
	1P6uquQNtUSxQFAzY1l5MxNbhspPlgZK/DH0izXvD3MFq0KBLISfa4pVGbmqt4m3QylM2yeb3lvsX
	iLN3gWESv7Muc7v1NE2pMZ7Daj9/e91Snd1tvJb6a/GKf2LCNRFFiDbIJI5G+LD6VgcLr331gDJzk
	Gech2JwYjpYUBVIaMvWiB6/PesorrshgMcwXz8yTG0hBjXPVHmQkvOOn1R8RaXmG6CHLyVOAGNAsM
	gXezE31Bw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jRs5b-0004KE-Gv; Fri, 24 Apr 2020 06:45:31 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRs5Z-0004B9-Gb
 for linux-riscv@lists.infradead.org; Fri, 24 Apr 2020 06:45:30 +0000
Received: by mail-wr1-x443.google.com with SMTP id d15so7765932wrx.3
 for <linux-riscv@lists.infradead.org>; Thu, 23 Apr 2020 23:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=/5EA8JeRrfnBN/0CmhL4oF38pY+Q3bFW76pYDktcYRw=;
 b=qaQCGMbhx8IDtzfWMP5CF/r8O9LbhiUitChvAw/zVhGUUivyqv2bxkBE/bfelVQqli
 rXSz6aa4D5EX0GOw2I9J3tyKgfhlgS2vNz1y9W20o7KblT7NrV6yCUkoPgwX8Ecd20M6
 0Q6Ez7OKeodE6A89xu8rFs/J31VJ/HkgcFFymO4Xt3EKKXjIxTJX2Tk1EaVAISp1u2OL
 IX5sCJbjDAS8/EykFdYFoDqSGqyePkzGwnZHDCES0/z4ZdgDN5wDL0LNciszIrTFgiAg
 il1oRZcQc2R+C9PCfYSRp0ubEqrs0Tayi0JweMScifN57VNRBGAyvykFw0++KSYFL3md
 uhkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=/5EA8JeRrfnBN/0CmhL4oF38pY+Q3bFW76pYDktcYRw=;
 b=P45Oq4wTN2e9UyscnfffrF4jxY2TQ4wk2vaxo/7kBjVXF7qSUUnQG3QcnE7nRi9Y2b
 kDP8851ryquV8cfr3FVpSJ/vzKs7WTuwP3/XfLL/MK5XAtC5MDRDHcPP/D7h+ZwD4Xsh
 qBrQYDvMee+/a0K4KsZwl03crtvzTq8tej4gVTbWLxgUwRVOIMHusMrjX/L1hgxVZnR8
 T0SVpcYzGYg4OMMGH9FANFsdFPJPRaBDtZiZHwnVSxviMtaFP+2MAgkUBHGkt2eLnld4
 WUH/Lxrln1HosL2op0SiFyFSMH7hWLTqKLLiH2wVZ+Ze0I8p5XZZXcBqrBBYO8MoDlhW
 oJMA==
X-Gm-Message-State: AGi0PuaKUcnmb1eXkSVrelc3ETlWOMRSvIS4V6iLz/1FrXAQN55T6kUE
 bOuQ8zDhe5cX4JfcuvYpMk5w0g==
X-Google-Smtp-Source: APiQypJKO9ZTEVxhHxuzk3DXA0gtm+wb8f+2rdl3cAcDpSyLV+FcCC5MuNqHtUpSdtqw4blucZ+P3g==
X-Received: by 2002:adf:fe0e:: with SMTP id n14mr9781916wrr.247.1587710727165; 
 Thu, 23 Apr 2020 23:45:27 -0700 (PDT)
Received: from dell ([2.31.163.63])
 by smtp.gmail.com with ESMTPSA id r2sm1570946wmg.2.2020.04.23.23.45.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2020 23:45:26 -0700 (PDT)
Date: Fri, 24 Apr 2020 07:45:24 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Guru Das Srinagesh <gurus@codeaurora.org>
Subject: Re: [PATCH v13 00/11] Convert PWM period and duty cycle to u64
Message-ID: <20200424064524.GK3612@dell>
References: <cover.1587523702.git.gurus@codeaurora.org>
 <20200423114857.GG3612@dell> <20200423215306.GA8670@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200423215306.GA8670@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200423_234529_569817_15B60262 
X-CRM114-Status: UNSURE (   9.41  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Kate Stewart <kstewart@linuxfoundation.org>, linux-fbdev@vger.kernel.org,
 David Collins <collinsd@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>,
 David Airlie <airlied@linux.ie>, Michael Turquette <mturquette@baylibre.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Kamil Debski <kamil@wypas.org>, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>, Atish Patra <atish.patra@wdc.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-riscv@lists.infradead.org,
 Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Alexander Shiyan <shc_work@mail.ru>, Chen-Yu Tsai <wens@csie.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>,
 Guenter Roeck <linux@roeck-us.net>, linux-media@vger.kernel.org,
 linux-pwm@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 intel-gfx@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Mark Brown <broonie@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
 Thomas Gleixner <tglx@linutronix.de>, Fabrice Gasnier <fabrice.gasnier@st.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Allison Randal <allison@lohutok.net>, linux-hwmon@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Fontana <rfontana@redhat.com>, Stephen Boyd <sboyd@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, linux-kernel@vger.kernel.org,
 Yash Shah <yash.shah@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Dan Carpenter <dan.carpenter@oracle.com>, Daniel Vetter <daniel@ffwll.ch>,
 Joe Perches <joe@perches.com>, Shawn Guo <shawnguo@kernel.org>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 23 Apr 2020, Guru Das Srinagesh wrote:

> On Thu, Apr 23, 2020 at 12:48:57PM +0100, Lee Jones wrote:
> > What's the merge plan for this set?
> 
> I'm not sure what you mean. My assumption is that first all the patches
> need to get an Acked-by and only then will the series get applied by
> Thierry... Could Thierry or Uwe weigh in on this point please?

Yes, that is the merge plan. :)

Whoever takes this will have to offer out an immutable PR.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog

