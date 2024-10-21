Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB52D15D89
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Oct 2024 12:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oEynmxbp7rBqU1NYTAJ0tB5elghMfFHm4gD1ntbAl28=; b=aF/zgjc/kleKvi
	5Rf3J05i/Ac75JH+JnUX8h0hwVKrxBw4fjrAlKWkFZtjpf7i/3Lk2NzlXPMMvp5S+5r6PD/CViC8k
	KBS5jYosAEge4+dwcIBQMuEDGVQZZMhMn1l7RZ4PUI71cnMWJ9PxcFyoflsPXKSNmanxNZJhYEZpt
	U91FLcxQxD1hinCiEGHeELW/EexDL/oNI5GUVgnel4WCJvNkf6+b13kP19qZW86m9MYV6ZaOehHNa
	AuKb3u1gunjDr554tyerJU/UOrTQlvTW2Bnx4+JKeuIi9NMecjNi99IwMnhR1rNXA+EOZ4i3V4RTa
	7nxybbUZEf9zVASyquCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2rvX-00000007KeC-1vdM;
	Mon, 21 Oct 2024 12:54:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2rgC-00000007Heq-2McE;
	Mon, 21 Oct 2024 12:38:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=5VdkMJahzYM4ARizPLfC5JGwlmy+1HUcx/YnyM/NNsU=; b=WYuLq0pM0eg0fs2jmWEndrL5e4
	JR99voRUVDGgugh/eY0j6E8t5K2gNOgMjcXgE20URw2GS2TJtAtVvNtfgsGXoZq+H0lUJwTHk4J0y
	7gwOjEM/yOIW46j6xYVFG9tEa3FlxfKle4GYoxgRbCqDa7aWrQImXn1rYuI60AEM1j6dF/CxLKG0g
	YNKTODUOYMDQFu+iHllUnSDyHHnQWkevjzQ3o+VB9c0nDfAhh4CeudXCGCNG33vqgvU6yht5OxdQV
	0fwsqkjf0G7X/XKmqUgZi7G/fI5DW+WIeUt8Ydh1OAuvVlWz6QbN/FdgMWRj+eKD1NUzw7iW0NjbW
	ne2mtwhQ==;
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2rg9-00000007vBG-1mOT;
	Mon, 21 Oct 2024 12:38:35 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-7e6d04f74faso2788377a12.1;
        Mon, 21 Oct 2024 05:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729514310; x=1730119110; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5VdkMJahzYM4ARizPLfC5JGwlmy+1HUcx/YnyM/NNsU=;
        b=jlPScwvLa7z5eIS/ES3aqU1BYTqAb+BYm8jcvFqZPq/wpbOXbc7zpdBSgCVvXwE5XK
         jKlYmotHDcDfOEH+0afKQ/6O9GzVNY4s7hlq1evhZGUpRQOnvqny0vu9/c9niPTWt6l5
         JVfLMbe3c8SAaSaBPvPrBKi1g2y9k+8JZxE73sswEBtWCnLcuwMvwNd5pmsSdnI6Ju2O
         FqEVAm8/DY0j5WRhgNOmh3o7Jg1z649UwoVALu8Gi2rpAr3o7Kk67VQXDOuz4e2pKIYc
         JnduLb+iSUcbyzEK5bThiTGbsLREMWu4U88GLFXAVVtICRDB+MwQR5pRhw5J+KR128m7
         UGqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729514310; x=1730119110;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5VdkMJahzYM4ARizPLfC5JGwlmy+1HUcx/YnyM/NNsU=;
        b=bC7Wla8yjDCvIXyNF+pZI3boXIyX3cZk6MuukD49eRRaiEDTqWRHZoV39UmvCEvdBm
         aS9Ja1ZgQeyQ38IxYPRrrwTBuMx8kIULNeVT1CFmN3V4SCgcc5zlsV4oPgtOhwWkQu/4
         4ev9kVBFPhc4VExS3IyoZCh8dScX1Ga2FOPuSbENwzKrmdJMmshbs8Cg225Qxek8Yxvx
         0wUpaswGY+0OtyIyJtXI4cEgIoFX6wCAfoI6umCGE7iweok4xMI2mO+7V+EchJeLFTmG
         75tSDbqb5icB00U+n615+VJFhILlRCYjXCSwr49P/SlMDsv3oHcVBKQpXFw2sofTc685
         W1yw==
X-Forwarded-Encrypted: i=1; AJvYcCU//MgRygWKUpj0udJlcfJ5BSMN1Zwp2izGwFw/K0cAGdp2N122mXR1hkkl5aRWLSKaS9I6JEUpRZ5yYsfKxJbq@lists.infradead.org, AJvYcCWDShD7WrydP+rS/h8gEcs+gafFJUr8wkQBA3dPZtfHn8phReoFRJxJ/kOAMHym5gtsVLnxFW5EW/G+LMQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0W5kFBtyOa8rELPe9Xc6uqpRE5vVGSlJ8S1GhlKLTNw1R2qC4
	tLESFvC8dUqRvPZ0iTV/KTVc2WDsoah9v9A0BevRcexhL+h9X0/R
X-Google-Smtp-Source: AGHT+IELTG5U+pOWjQan4mOzNnHckdPe5BPOOI3wlomTskXwd3e2mPKfcYsxX04oUIZTOqrQqVQjwQ==
X-Received: by 2002:a05:6a20:ac43:b0:1d7:109f:cac4 with SMTP id adf61e73a8af0-1d92c9f873amr17387168637.3.1729514310059;
        Mon, 21 Oct 2024 05:38:30 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec1312d6bsm2750800b3a.29.2024.10.21.05.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 05:38:29 -0700 (PDT)
Date: Mon, 21 Oct 2024 20:38:11 +0800
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
Message-ID: <gwtiuotmwj2x3d5rhfrploj7o763yjye4jj7vniomv77s7crqx@5jwrpwrlwn4s>
References: <20241021103617.653386-1-inochiama@gmail.com>
 <20241021103617.653386-5-inochiama@gmail.com>
 <227daa87-1924-4b0b-80db-77507fc20f19@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <227daa87-1924-4b0b-80db-77507fc20f19@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_133833_566930_743787B3 
X-CRM114-Status: GOOD (  18.24  )
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

On Mon, Oct 21, 2024 at 02:22:47PM +0200, Andrew Lunn wrote:
> > +static void sophgo_dwmac_fix_mac_speed(void *priv, unsigned int speed, unsigned int mode)
> > +{
> > +	struct sophgo_dwmac *dwmac = priv;
> > +	unsigned long rate;
> > +	int ret;
> > +
> > +	switch (speed) {
> > +	case SPEED_1000:
> > +		rate = 125000000;
> > +		break;
> > +	case SPEED_100:
> > +		rate = 25000000;
> > +		break;
> > +	case SPEED_10:
> > +		rate = 2500000;
> > +		break;
> > +	default:
> > +		dev_err(dwmac->dev, "invalid speed %u\n", speed);
> > +		break;
> > +	}
> 
> There was a helper added recently for this, since it appears
> repeatedly in drivers.
> 

OK, I will change it.

> > +	ret = regmap_set_bits(regmap, args[0], DWMAC_SG2044_FLAG_USE_RX_DELAY);
> > +	if (ret)
> > +		return dev_err_probe(&pdev->dev, ret,
> > +				     "failed to set the phy rx delay\n");
> 
> Please could you explain what this delay is for. Is it the 2ns RGMII
> delay?
> 
> 	Andrew

It is related to the RGMII delay. On sg2044, when the phy 
sets rx-delay, the interal mac is not set the same delay, 
so this is needed to be set.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
