Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE84ED262A8
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 22:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T9yXLA9MdQCrDVIplf7BIFIlQFzJeQ1jXESy7aMSor0=; b=hFI8fbYARbL0tO
	1UQlUN1xf1bUUnpbnGTs3O7n9qnNJ68Y02lFlrQOIWy3a1P3JORWwXOpVafg+eezVheosN5Ddjhvn
	Nth7odEb8Igkk1cfQJrjMFk5Y3HUFDb3Nunt3NalHnylX/R+tDELT4ilIyPS6R+6yioQzA6FuXG9g
	6biuCcQh7FS9cc1Rw54FXAZKq+/6i4m9LMgX8B9JdbKtFSBacYL+ztJYTZszENj3m+WIPVMTF+3ov
	K+2EDf/X34WhPd/ZEdBbPiwUaFgiUugoFfQ23Po2BoOL6L4FlHsVdIUBUoBj0yW33RxXyL9bLqeRt
	JOOgr7QzAzMpk7CGH2TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viKKe-00000004aAu-3oyu;
	Tue, 20 Jan 2026 22:36:16 +0000
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viKKb-00000004a9o-1bQr
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jan 2026 22:36:14 +0000
Received: by mail-dy1-x1331.google.com with SMTP id 5a478bee46e88-2b6f5a9cecaso2387913eec.0
        for <linux-riscv@lists.infradead.org>; Tue, 20 Jan 2026 14:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768948572; x=1769553372; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NrbRZd+8qIGar6808P7aL6qI6sgZozZ7npqpjV5nqsk=;
        b=HqTo6o3tvewVWcglL+ON6DYul1RnkYolIElFFKFsAyrDPi+xdAUz1FkhQGkcKye/OS
         zRVJvF+Ths9zqEyG4Z7akcoXdNLqzMTpBrr3ikakUqOEzlrQSP3D8oZH0gx2IQWwmcFA
         5ljPw90ouyCXIlkRE515xtjRVSnpKcvISzWPOpxraFPllmGrQEnUxyGh0LI4KNKtTw9e
         inqa4uBiYucrg5KiMT+DPHQ/AblV/d+iOdqQB11AnYzAuo4d6jc/ngRCn/44KNMuovVx
         lM9np/RnchYP5lPp/OTkaBnVCCvNCfiriDXTqHOLu7GnrIkOyf+yOgN8JrlF2DrWTxC5
         VWGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768948572; x=1769553372;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NrbRZd+8qIGar6808P7aL6qI6sgZozZ7npqpjV5nqsk=;
        b=V8Zx5veOsEL9Lj9sGHZ2i4L6yApfyz3T5U2XYEApy3DHg4JPWkE2HU/Qq92yZcjY2b
         KMMZO9EM2Q496yGcMT1thj7co0eLU69SlYuTbUgNj6wukdSYWnj2OdHqM9lSxyClmSq5
         NuLYgond06quIMQ4ZQzQM9llBQ1es7kukGjE4DD4Ty6UoY4zBpo22Be4fNdCuUKfbyJJ
         UOAx3oeM8muzDXP7H2SEorSRjuqooyPa1L0xXOvjp6xjW76x3rf5U2f4479vS+7lsjGy
         xlIq4cLmpNw60ENHu3RRxhYWGJQN4TWglWDmaCvMXpdDhPAdYhT5JbPenerNKSfRZVsp
         /MIA==
X-Forwarded-Encrypted: i=1; AJvYcCX7w2jMHg6/tjvemHaSUDVI+i3o+sAgC03x82jDXMIT1YIUwGOazBn7TBwT3SkkJ5roh+o42LDBNRIK9g==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywx6EjHJ199RE3zurZNSTf98uPVsJ07YgRdIcwO3irYtufi3ziN
	zgKOwKvR5qAKqLpW9tRWazDNtipee4k9oJzQ8lhqyxzaMpLCY/3fXsZz
X-Gm-Gg: AZuq6aKs4UNEMN8hq+m64OHK2WmgMRyDz21RFG6NVc5Q9nWhONTWMLTWQCeN9RZQYuO
	rCZ+SNvoZaccatOfOW1KQcwWiejAiM8536zh/d4vStCUKeC24vnseb3Eoi0Pt4d3DtnTDO10znr
	4iWIKHniuQWAAbQw1f3tt5qXRxyLVt0Tpzmw/+4D9TScuTSjIvMcnLTMdR5p/ivJ2GBzDJNrcmZ
	EC1zf7G4TX9+B+7nzU30D+PJ2bJ+9YNM7+3/ri/K9WErG2b+IUqZCbGv3r1Cm4HouVRNjEVYhUc
	iSNo2ANTIwnLbEAEK25oXKutCAj9Qy9G6QAdsldngn/nJdzCAD7uv+zUpFqqjzJNCsLqdfeLm0Y
	OrRQhM5Mu+RedMnUiJrAdAq3p7xjpcjEvATT+Qkeny92tgpugEvQC1tBraeKj0zLdTpJR18wUwm
	Z80bVi8gicUQ==
X-Received: by 2002:a05:7300:fb94:b0:2ae:614a:3307 with SMTP id 5a478bee46e88-2b6fd7eee95mr2453605eec.42.1768948572147;
        Tue, 20 Jan 2026 14:36:12 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b367cbc9sm21042996eec.32.2026.01.20.14.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 14:36:11 -0800 (PST)
Date: Wed, 21 Jan 2026 06:36:01 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Inochi Amaoto <inochiama@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	Yanteng Si <siyanteng@cqsoftware.com.cn>, Yao Zi <ziyao@disroot.org>, 
	Vladimir Oltean <vladimir.oltean@nxp.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Choong Yong Liang <yong.liang.choong@linux.intel.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Shangjuan Wei <weishangjuan@eswincomputing.com>, 
	Boon Khai Ng <boon.khai.ng@altera.com>, Quentin Schulz <quentin.schulz@cherry.de>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next 3/3] net: stmmac: Add glue layer for Spacemit K3
 SoC
Message-ID: <aXACRN7BaumIySp3@inochi.infowork>
References: <20260120043609.910302-1-inochiama@gmail.com>
 <20260120043609.910302-4-inochiama@gmail.com>
 <f8e4c5ec-94b1-4da0-8a40-976770514828@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f8e4c5ec-94b1-4da0-8a40-976770514828@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_143613_414634_6714CA70 
X-CRM114-Status: GOOD (  20.59  )
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

On Tue, Jan 20, 2026 at 02:56:26PM +0100, Andrew Lunn wrote:
> > +/* Note: the delay step value is at 0.1ps */
> > +static const unsigned int k3_delay_step_10x[4] = {
> > +	367, 493, 559, 685
> > +};
> 
> Am i reading it correctly that RGMII delays are limited to these four
> values?
> 
> If so, please add this list to the DT binding.
> 

No, these value are just adjustment interval, and it is also
controlled by another code register, the final delay is calculated
by the following formula:

delay = delay_step * delay_code * 0.9;

So the delay configuration needs to be calculated instead of
directly assigned.

> > +static int spacemit_dwmac_detected_delay_value(unsigned int delay,
> > +					       unsigned int *config)
> > +{
> > +	int i;
> > +	int code, best_code = 0;
> > +	unsigned int best_delay = 0;
> > +	unsigned int best_config = 0;
> > +
> > +	if (delay == 0)
> > +		return 0;
> > +
> > +	for (i = 0; i < ARRAY_SIZE(k3_delay_step_10x); i++) {
> > +		unsigned int step = k3_delay_step_10x[i];
> > +
> > +		for (code = 1; code <= MAX_DLINE_DELAY_CODE; code++) {
> > +			/*
> > +			 * Note K3 require a specific factor for calculate
> > +			 * the delay, in this scenario it is 0.9. So the
> > +			 * formula is code * step / 10 * 0.9
> > +			 */
> > +			unsigned int tmp = code * step * 9 / 10 / 10;
> > +
> > +			if (abs(tmp - delay) < abs(best_delay - delay)) {
> > +				best_code = code;
> > +				best_delay = tmp;
> > +				best_config = i;
> > +			}
> > +		}
> > +	}
> 
> With the four values listed in DT, i would make this a straight match,
> not the nearest, and return -EINVAL otherwise.
> 
>     Andrew

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
