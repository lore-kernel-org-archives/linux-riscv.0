Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FBD0CA9ED1
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Oct 2026 10:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lDHZ8oHkYM7jRBP4VaT8yU5WHKIzC99b7KGA/1g3EdU=; b=jcG0fifSdu0cLF
	NlGKFx6RgW7n/rj0wPpuT8eYvOrzfi2NjJ9YSqYhvwjZH4AMzKMe73rJvgmhWW/WorHn5HBVDSOE9
	VoH4Jj3bI1s0rUgVOBNou12/jJDKWKKsPGyKSmA/0X2xJWNUkV+UMKLOoIPm8ExB0/6npcTG/Gs58
	8+G8bMghZtXRBn5bl23o0Y1Pqevj9ZrMe/zNXsnpl8YeNQgEj7iXhUv9aGg0mGFcsKXt5hLhzxZrF
	h4J3tLjAV+8QjsVyD/4NuJTBlfiD8bCRXroOypdQYsZ+SRuZ+Qa6AjSCrLPc77USAy5W86k/WvvN8
	ilT6vBEb4JXP9BgtpVVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGDAN-0000000ACu9-3jVJ;
	Mon, 12 Oct 2026 10:22:01 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGDAK-0000000ACoq-2hyL
	for linux-riscv@lists.infradead.org;
	Mon, 12 Oct 2026 10:21:57 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-487049569b6so1184098f8f.1
        for <linux-riscv@lists.infradead.org>; Mon, 12 Oct 2026 03:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791800515; x=1792405315; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IDRpy4zSY6i+1qqmwnCcDGBbpmjqBT66Voxyn6YTRCo=;
        b=e2J2hSiYMWoQTzBvdaiHDKp/pneA+HhxDiFvg6hms1zlvtYpGwI3FU8lxPCZAawpn5
         txBlmwvjO+f2nhMgRB7BwCyGcINRsaxjuBy4gDeS7iftbppqRFcw0xQxOQup+AHbDD2E
         0NXke8Voq5epqkb09pPtaLRyxG9c8qqIDsau4HA5qVT1QN5Dlchws9TLjtKZk42o2Ew3
         nodv2gyiWUoJqLA07Zkhfwqx8Q5wsrG6ZPoOAunCHhARUXlOVzIW1ErdeZIkFC6YP/Ci
         m8qRtXAP3BI/yXTYvUU63cnZ4r6QSl2LLVKlT0299KIzgZXwl+oyCwsjbLPmg1fvv6hG
         4Cnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791800515; x=1792405315;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IDRpy4zSY6i+1qqmwnCcDGBbpmjqBT66Voxyn6YTRCo=;
        b=ryKUHAcy5N3CGcPtydS4BPHKuf6l8lMIL0/Usm5HNgFo88A1NIQpV5I4YVAMQkqIn1
         UE9O4DUAtJPz/c0y49FXL8leRW1UihjXOPSCOASWOehGG1X0Nn4K9wIXsjuZ7YdPqf+J
         9IJ7IwQOYEBq7WXQtTxptUAWsanYjC4BCRgTwAeLhghMksor8ZyxXQ9232wO3LkViUoJ
         a0eiha0h5yxwm8FRY0PmsjopaMiqcAUWrOfDeEAU8IXtfJDCGOUcflGsNINKCHedpBFA
         196wbAbouUh2WKu2xeTA59TD08aPoZbBEQhBBDC5je/do6sBIo7BORI0vy9Cw9x4tDbh
         9Nqw==
X-Forwarded-Encrypted: i=1; AKwUvBzq2Wp/pbR7UGq+p7zdR3aQBPExrh5uR1fkZgKI37DZcIVhWvdOON8rpJlN4T61z24MfOinYlSRAJIrRg==@lists.infradead.org
X-Gm-Message-State: AFq9FYLy4s27VT8w2K/G6UDbhoJ/DjsHE2eTx0ttFMNKDdDnvjeNMyxK
	WSXA0PkMmULfoasu4+u0yBQpo2F5JoMGD02vKklGWOez9GswJxm2N2drqPMIXUmbGis=
X-Gm-Gg: AYBFou1K1aNPvnMUCpgK324J3f04sLqLfpU8T16DLvOwg24x3pXIuW201s9jqXbRkzV
	Su42bZT2tfew6Lz+sPraHifOaDA/8clMJyNFg4OoOkdJjp2wL6YCz43oS9x7j7Nnn+Z0EecAzYG
	ek1nyUJvAlv1TAOaEzu0s8vOufjelxQoWmBzzTKqniNHz8lp7fhNGM3kX0KKPxDRzDOXl8fqCWR
	rcBfY3nFkws5GqQJfeeYYXNL+fTrTaeJqIchEvGt5pa+e2HDkOd5bR8jC0A9TXPfCCtkUf4wn88
	I1U0/y5D/nulimPCMEm4pd+wn553rOFp/9+5WmCAIuz4gTsCialPQRyLX8GP1jelbhIHs0mz4Dn
	XIaSPH2gD9cmIp/TYuQF9nodaEqvDZh5PPdblIkyXREuMzgtPsugUUt2D6/zNwR5EqzuAREC/p4
	/rHaaoSeiK0XnBw2wy/GxItOWWQIFQqJomSfT+CQbL6otb/pg/LKroRk1r4UnkZUOYMIK9JDp4s
	l4+qUpoKnaPznGyDA==
X-Received: by 2002:a05:600d:82e4:b0:4a1:a45a:88f with SMTP id 5b1f17b1804b1-4a1a45a08f7mr10336415e9.20.1791800514835;
        Mon, 12 Oct 2026 03:21:54 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bbbdd75sm217256615e9.1.2026.10.12.03.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:21:53 -0700 (PDT)
MIME-Version: 1.0
Subject: Re: [PATCH v6 02/15] clk: starfive: jh71x0: Move reset controller
 registration to jh71x0 common code
From: Jerome Brunet <jbrunet@baylibre.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Brian Masney <bmasney@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <20261008123338.11081-3-changhuang.liang@starfivetech.com>
References: <20261008123338.11081-1-changhuang.liang@starfivetech.com>
 <20261008123338.11081-3-changhuang.liang@starfivetech.com>
Date: Mon, 12 Oct 2026 12:21:47 +0200
Message-Id: <179180050741.66744.12503537219212348990.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1143; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=KTzcEEIV8+14IdfGz+5QCVuiMenTgSz2gLNd0nToSAs=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlntuzPP8dXy6Hr7ZO152eGBWOgUS/bpau8T2csOdxxT
 Sj8zfWojlIWBjEuBlkxRZYa7mrxd5JaX2ZN17kNM4eVCWQIAxenAEzkbTDD/7pj0c87FNevWHG1
 a452YO0SH3a59MS5FbdNrxdybVry8ykjw6bjd1TtJc8WC+b4f46K0zzHpCwlInF3m4bNw+ir6Vl
 irAA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_032156_765778_0F130E73 
X-CRM114-Status: UNSURE (   9.12  )
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

> [ ... 238 lines skipped ... ]

> +
> +int jh71x0_reset_controller_register(struct jh71x0_clk_priv *priv,
> +				     const char *adev_name)
> +{
> +	struct jh71x0_reset_adev *rdev;
> +	struct auxiliary_device *adev;
> +	int ret;
> +
> +	rdev = kzalloc_obj(*rdev);
> +	if (!rdev)
> +		return -ENOMEM;
> +
> +	rdev->base = priv->base;
> +
> +	adev = &rdev->adev;
> +	adev->name = adev_name;
> +	adev->dev.parent = priv->dev;
> +	adev->dev.release = jh71x0_reset_adev_release;
> +
> +	ret = auxiliary_device_init(adev);
> +	if (ret) {
> +		kfree(rdev);
> +		return ret;
> +	}
> +
> +	ret = auxiliary_device_add(adev);
> +	if (ret) {
> +		auxiliary_device_uninit(adev);
> +		return ret;
> +	}
> +
> +	return devm_add_action_or_reset(priv->dev,
> +					jh71x0_reset_unregister_adev, adev);
> +}
> +EXPORT_SYMBOL_GPL(jh71x0_reset_controller_register);

Could you use the helpers provided by the auxiliary bus instead ?
such as auxiliary_device_create() or its devm_ variant ?

A lot (if not everything) of the auxiliary related code here seems to
implement what auxiliary already provides

-- 
Jerome


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
