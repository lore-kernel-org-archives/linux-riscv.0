Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23180CE7A96
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 14:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UjYwjPjampPQ3WCMBWtdah9m5rXkCh9A1qkX6Q9+aTk=; b=KiX5loA1wBHSMc
	Dmc8wpcoRFml3NeWTk9yrNTjOFk8skAhuOs6h74HtwMAsjLn+ciDY68fcDlUPIeOG0V362+OU+tbS
	3ZkR5DyP4nBehdwcYqGGyA1MCvxWjIlengilShaz69v55HHqeofrdtLp4CnQMFP5XG+9B0IcdyFku
	SOwY0WsNwzyUa16cVCfi7Yeptp+fxrTZW0ibGbodGGMsvV14KcHamDxiehJB2cR8REZFzDTHWTTQE
	RcpvC8k0RekUcrgz61Cqxh/JKs6sIGI19bTX7e+5/kAhr7l+bAcHQ5bbl3zNEnqH/IqPTGPPFpKRq
	mtFbBDiaXJQdPNk/kGJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkmoH-00ESPC-1Y;
	Mon, 25 Sep 2023 14:43:41 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkmoF-00ESOe-0h
	for linux-riscv@lists.infradead.org;
	Mon, 25 Sep 2023 14:43:40 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4054f790190so49673655e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 25 Sep 2023 07:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695653018; x=1696257818; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t/sMphRuA0VcjIhUu52wZChuZavyxtp56aeA36+PYxE=;
        b=zw6/WzXM2Gxcjt5ovrGCiOQj3WsZruM4jiT1R0sQPtLouQrzO0TcmQ0oI8WAAedYAk
         HaViK37iW9lcWOtoA+isAnGxvKFZuiVyJsxBKDB5Ry/E2wTgb0yfrdmJKuK3yh3YdzeK
         lUfouBYe3oFxErVwx5zUOGPo5PVB5LXhGJP23OahLT7krP4vV1LvAUUeB6yya2et0A+I
         o+nknun+gX90NsR0ngA2SqysV0YY6DD8M9pEhRI+qbfHpYT4H1rZ1HgdLliXxNduC5yJ
         rZS0JwZKZi506+/cCt/CJZWGdeUvSqDML/5Fle/TKrGl3bZabDi+CIiW0GOnMdYTzwed
         I9FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695653018; x=1696257818;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t/sMphRuA0VcjIhUu52wZChuZavyxtp56aeA36+PYxE=;
        b=ABbWOqKNsUWuMKqYc54TWnFL0ZYEAaiTmgHW+wYK5ZKi8fs9rNhrpGpnve09iUjKbL
         S9r0TNGOgIf2+vAyhfSQhzPJWP96BwGU1IaG/HEZvPwDw86vcAAglciGg6WoRvIaOGXt
         hNBkQYYYi8XFG5CtFrn9ELsqzZzg6/G0ZD0wXlRzVxaepmtzWQsu1trQn1urCwFKEP2w
         hD6TQnDAS3exRhIZAecJzdaOL4C3Vi0/k0B8/G17ve51f80TO/bqjWzQEW+HI57d/bFd
         v0WaFzUaO5+SAwi6NzozwaaS0IX9MxmD/4g9KXIl0Skx9RvpNLA+hoWx7NyuwhZ4Q4lf
         FjJA==
X-Gm-Message-State: AOJu0YyNxkOvhFi0vcEanUx3krdknVGpcZuQeJ1ftb1RXWRB/f4Kb3s/
	oRXK7gJHi0tv8i1DiytVPhKSDw==
X-Google-Smtp-Source: AGHT+IEbGAlM/VewJdTcTv5/aTJRKALQYUm6lwgRKY3S9S1k9trypjsl9J42XlYhfQuHu1BmTqd4sg==
X-Received: by 2002:a7b:cd07:0:b0:405:3ae6:2401 with SMTP id f7-20020a7bcd07000000b004053ae62401mr5847424wmj.14.1695653017666;
        Mon, 25 Sep 2023 07:43:37 -0700 (PDT)
Received: from x1 ([193.52.24.5])
        by smtp.gmail.com with ESMTPSA id n13-20020a7bc5cd000000b003fee53feab5sm12588862wmk.10.2023.09.25.07.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 07:43:37 -0700 (PDT)
Date: Mon, 25 Sep 2023 16:43:29 +0200
From: Drew Fustini <dfustini@baylibre.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Subject: Re: [PATCH 3/6] mmc: sdhci-of-dwcmshc: Add support for T-Head TH1520
Message-ID: <ZRGckWotC4RYHLNZ@x1>
References: <20230921-th1520-mmc-v1-0-49f76c274fb3@baylibre.com>
 <20230921-th1520-mmc-v1-3-49f76c274fb3@baylibre.com>
 <a420c2e5-db23-4b61-a110-476f8fb8636a@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a420c2e5-db23-4b61-a110-476f8fb8636a@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_074339_252565_3C2B9367 
X-CRM114-Status: GOOD (  19.82  )
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
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, Albert Ou <aou@eecs.berkeley.edu>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jason Kridner <jkridner@beagleboard.org>, linux-kernel@vger.kernel.org, Han Gao <gaohan@iscas.ac.cn>, linux-mmc@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, Robert Nelson <robertcnelson@beagleboard.org>, Rob Herring <robh+dt@kernel.org>, Guo Ren <guoren@kernel.org>, Xi Ruoyao <xry111@xry111.site>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Sep 25, 2023 at 01:35:36PM +0300, Adrian Hunter wrote:
> On 22/09/23 04:49, Drew Fustini wrote:
> > Add support for the mmc controller in the T-Head TH1520 with the new
> > compatible "thead,th1520-dwcmshc". Implement custom sdhci_ops for
> > set_uhs_signaling, reset, voltage_switch, and platform_execute_tuning.
> > 
> > Signed-off-by: Drew Fustini <dfustini@baylibre.com>
> > ---
> >  drivers/mmc/host/sdhci-of-dwcmshc.c | 456 ++++++++++++++++++++++++++++++++++++
> >  1 file changed, 456 insertions(+)
> > 
> > diff --git a/drivers/mmc/host/sdhci-of-dwcmshc.c b/drivers/mmc/host/sdhci-of-dwcmshc.c
> > index 3a3bae6948a8..7294bf1afb7d 100644
> > --- a/drivers/mmc/host/sdhci-of-dwcmshc.c
> > +++ b/drivers/mmc/host/sdhci-of-dwcmshc.c
> > @@ -35,6 +35,26 @@
> >  #define DWCMSHC_CARD_IS_EMMC		BIT(0)
> >  #define DWCMSHC_ENHANCED_STROBE		BIT(8)
> >  #define DWCMSHC_EMMC_ATCTRL		0x40
> > +/* Tuning and auto-tuning fields in AT_CTRL_R control register */
> > +#define AT_CTRL_AT_EN			0x1 /* autotuning is enabled */
> > +#define AT_CTRL_CI_SEL_SHIFT		0x1 /* bit 1 */
> > +#define AT_CTRL_CI_SEL			0x1 /* interval to drive center phase select */
> > +#define AT_CTRL_SWIN_TH_EN_SHIFT	0x2 /* bit 2 */
> > +#define AT_CTRL_SWIN_TH_EN		0x1 /* sampling window threshold enable */
> > +#define AT_CTRL_RPT_TUNE_ERR_SHIFT	0x3 /* bit 3 */
> > +#define AT_CTRL_RPT_TUNE_ERR		0x1 /* enable reporting framing errors */
> > +#define AT_CTRL_SW_TUNE_EN_SHIFT	0x4 /* bit 4 */
> > +#define AT_CTRL_SW_TUNE_EN		0x1 /* enable software managed tuning */
> > +#define AT_CTRL_WIN_EDGE_SEL_SHIFT	0x8 /* bits [11:8] */
> > +#define AT_CTRL_WIN_EDGE_SEL		0xf /* sampling window edge select */
> > +#define AT_CTRL_TUNE_CLK_STOP_EN_SHIFT	0x10 /* bit 16 */
> > +#define AT_CTRL_TUNE_CLK_STOP_EN	0x1  /* clocks stopped during phase code change */
> > +#define AT_CTRL_PRE_CHANGE_DLY_SHIFT	0x11 /* bits [18:17] */
> > +#define AT_CTRL_PRE_CHANGE_DLY		0x1  /* 2-cycle latency */
> > +#define AT_CTRL_POST_CHANGE_DLY_SHIFT	0x13 /* bits [20:19] */
> > +#define AT_CTRL_POST_CHANGE_DLY		0x3  /* 4-cycle latency */
> > +#define AT_CTRL_SWIN_TH_VAL_SHIFT	0x18 /* bits [31:24] */
> > +#define AT_CTRL_SWIN_TH_VAL		0x9  /* sampling window threshold */
> 
> Here and elsewhere, please try to make use of BIT(), GENMASK(),
> FIELD_PREP(), FIELD_GET()

Thank you for the advice.  FIELD_PREP() and FIELD_GET() look like they
can make the code simpler.  I'll make use of those macros in the next
version.

thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
