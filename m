Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7054DC433F5
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Apr 2022 19:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lIwcMEXmap+MfsV/d6gmMEGBnS/NsMlhZQyEEio8bCY=; b=RxRN1i69henMNy
	F+9+DOGz466E+xrYIvS66XL4u4NeiWIhYweA9bxBvQN3iMy0EtW0LZaQ6Qk43x2S9kkntlQdzwXqc
	PgUt94RlPXkgGHHXIlSCQL5ZUJL4HKuOHmIIVGqUzOOFNQNpYe1bFY3uJ0AONbbIkzo3+on6NQg+y
	LjFfu4kD1Z9X3Rvd7kRLYAHF7ztbEhBwGAPfqsGktIA4LnYJymFAbZyQoWEQzBPM7bnLq0Sdnuzc1
	3X6Fzsh9m9OazvrtW4o690baH0ac1GqY4COYN2YKIjhBiGsbi66YHOy8dqrIhUvLCQlu8rtvcUCyq
	4B6aBZexoGA4vpeLbeiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncXqW-00Dive-I5; Thu, 07 Apr 2022 19:31:08 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncXqH-00DiqR-P8
 for linux-riscv@lists.infradead.org; Thu, 07 Apr 2022 19:30:56 +0000
Received: by mail-ed1-x52d.google.com with SMTP id q26so7590343edc.7
 for <linux-riscv@lists.infradead.org>; Thu, 07 Apr 2022 12:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rNwKqGxuMSmu4ITdMt4hiQ6a/iL0Wffb/UMWAJM9vH0=;
 b=hsmvyBbxXvdx21ikiwmuVndGz4VB9w7Tp8QBKQn+4CNqn/NDD64qxOegLGjhBwUvk3
 1E+8EUa5A2Auwb3N3Llk4fxWapEcn3LN0wxkTDB1P9oj27ObGxdhFs1Fmom5yEAvf4+0
 Sv0kaRJ/+TffnA0DPFpUTnFmRLwCPyKQvOmGmGM9rnwe+GURB2bz0ghQGZSfxK3QHZrk
 NqAUOD/MDWWFbu4ci+xw0dluP9fgDaVkoG0pVyFmoRAvxyYTBdu00RdXAJ/pAqd4S6aR
 fozXIq5Ahdtd4zb8ETOFZSYh6dMmR0zl7kVWfhmWN1TufP0wK2yDZGelYLssdjZzPHsr
 edfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rNwKqGxuMSmu4ITdMt4hiQ6a/iL0Wffb/UMWAJM9vH0=;
 b=xeJoSEFzQcJ721F3dYHwA+C49GTzWEi2zRU377kSvHyC+QxE5KIRJ/78xVcaZdvxpk
 sir4AwGXmYngXfEAlhsq/nEjRqwMxVgNHOr5ciZVviqkTXkEKsEfmjBy3EZhgp573GiE
 vUZSeDbxAS8wFnhAhVD4QTSdgq94u2b34pqk8335+3rvsQ8M9UWaKJho04qxgnKYS7r2
 2GHQDE9uudmA2yVJGgFZXmclvVrROutYrXOyMY5OY+YT3KnVXtpVKk3XmkYwzTYTBAhH
 cTRf5hx4sX/WgDmTXSH7VcbsufDgiG4Cm9E+xSk6+8kTJRsy+Um5UK6zyam5cgZPZpHV
 tqgw==
X-Gm-Message-State: AOAM530cvJPcShl45q2ejY29ahOdrGx2X+3I4OxiPYdRs35z5soIIhNf
 GhzpTa5iLJcqlYnypje39bomGA==
X-Google-Smtp-Source: ABdhPJx538vA9HnshG5J/vO6w3P62mH/HcbQXvcsr2oa0UiljWyZJm8pcZNCtCmIOY/cboHmSFz0hA==
X-Received: by 2002:a50:c3c6:0:b0:416:293f:1f42 with SMTP id
 i6-20020a50c3c6000000b00416293f1f42mr15809234edf.187.1649359849767; 
 Thu, 07 Apr 2022 12:30:49 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 ds5-20020a170907724500b006df8f39dadesm7964617ejc.218.2022.04.07.12.30.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 12:30:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Paul Cercueil <paul@crapouillou.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Dinh Nguyen <dinguyen@kernel.org>,
 John Crispin <john@phrozen.org>, Tero Kristo <kristo@kernel.org>,
 Daniel Palmer <daniel@thingy.jp>, linux-riscv@lists.infradead.org,
 Marc Zyngier <maz@kernel.org>,
 =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
 linux-actions@lists.infradead.org, Jason Cooper <jason@lakedaemon.net>,
 Krzysztof Halasa <khalasa@piap.pl>, Lokesh Vutla <lokeshvutla@ti.com>,
 Paul Burton <paulburton@kernel.org>, Imre Kaloz <kaloz@openwrt.org>,
 Sagar Kadam <sagar.kadam@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Bert Vermeulen <bert@biot.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Nishanth Menon <nm@ti.com>, linux-oxnas@groups.io,
 Linus Walleij <linusw@kernel.org>,
 Mark-PK Tsai <mark-pk.tsai@mediatek.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Michael Walle <michael@walle.cc>,
 Manivannan Sadhasivam <mani@kernel.org>,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Suman Anna <s-anna@ti.com>, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Joakim Zhang <qiangqing.zhang@nxp.com>, openbmc@lists.ozlabs.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Lucas Stach <l.stach@pengutronix.de>,
 Birger Koblitz <mail@birger-koblitz.de>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH 01/18] ARM: dts: nspire: use lower case hex
 addresses in node unit addresses
Date: Thu,  7 Apr 2022 21:30:39 +0200
Message-Id: <164935983571.16396.11670729285639659849.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220317115542.450032-2-krzysztof.kozlowski@canonical.com>
References: <20220317115542.450032-1-krzysztof.kozlowski@canonical.com>
 <20220317115542.450032-2-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_123053_881536_CFC1C255 
X-CRM114-Status: UNSURE (   7.90  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 17 Mar 2022 12:55:25 +0100, Krzysztof Kozlowski wrote:
> Convert all hex addresses in node unit addresses to lower case to fix
> dt_binding_check and dtc W=1 warnings.
> 
> Conversion was done using sed:
> 
>   $ sed -e 's/@\([a-zA-Z0-9_-]*\) {/@\L\1 {/' -i arch/arm/boot/dts/nspire*
>   $ sed -e 's/<0x\([a-zA-Z0-9_-]*\) /<0x\L\1 /g' -i arch/arm/boot/dts/nspire*
> 
> [...]

Applied, thanks!

[01/18] ARM: dts: nspire: use lower case hex addresses in node unit addresses
        commit: fa04ccac619085332563fb433ffc4ecc8ba5489e

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
