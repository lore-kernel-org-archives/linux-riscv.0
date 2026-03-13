Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11A6A106FD6C
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Mar 2026 02:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wBxbOWKem5RjV5gfYeqN2fX/7E7ntTWr1uWgn5Jjy5o=; b=eOEzoRT+yUtCTn
	l3frPB+j3EIXk2pgmenTPZ2XI78QTXJ7agfdqi4S944HtrfqE9/Ub1ORs52d3bXXJmKjgYg6zJYcc
	YgK3F1MvjHSeDW52UlbiHykTNnEquFdiXhkUxU3Ng7yamDWpwBTmsUSOMzUkhGIT/p/P/CQNQCFEy
	7MjRmmAbyj+a2PNqMryIQHTqk8b9AYNVvJwFVuew4mcUV5WztNLF1Yh5ZkziO3AHPCE7rRyPvGqWF
	m5C9eESN99XliPrcgkTQOADp+32evFn87qXw9c3MSkm/edm0s4UInK6TN2yPXYWBiFjU5hQy6GagW
	yUisDywI4cneXvhbiH5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0sVD-0000000GHGL-1tTs;
	Fri, 13 Mar 2026 02:43:51 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0sVA-0000000GHFF-18XH
	for linux-riscv@lists.infradead.org;
	Fri, 13 Mar 2026 02:43:49 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-5094b54a250so12140711cf.2
        for <linux-riscv@lists.infradead.org>; Thu, 12 Mar 2026 19:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773369826; x=1773974626; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q9hCuzuHEN/sMOidNnhHLkJz/g4iSobaxo8mhYZkdNU=;
        b=b+7czi3vmOhXwpsN0OjQGCunBmsqIMIL0Yxxw2l4uhS8hhZWHEaek2gpbLxUvsnMTs
         mqJLL/LakbsZoDeOCg1IxpjhigzPEeN6ei3NqdKE2y6aKDX1RvrRh9MPLxWpCbAvn/JZ
         9JCl4uUHgJti1VUlKj1adYZ8axAy9zNCLRL0JXgaYDsZhu2ug35CrgcN5YMfcPiQc9YU
         mlm8tWSH8Px/VcZf5ER3iuVZlsoe+Iy2Lw8siINd7Ejv2J7pSwW/4xaEa63ZIOBqqK9A
         oI3eUK7XwGU6pz1owto46w2dvmuVu87qkfjCF3nftuCZnGvAMM8nOb21xKWETmdR3NN5
         6mYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773369826; x=1773974626;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q9hCuzuHEN/sMOidNnhHLkJz/g4iSobaxo8mhYZkdNU=;
        b=H/zsbL4vE7yBejNkildgSYLZm3lpotUYE8TtRZ3h09WqfBVHtPxcBuUhsMdE6C5DJc
         NFA+QlwgfCz0lOWpR/h70ktPbauX2gr0I8IwohUALVKorkoD/TN4xYxNaVEKwiqOCc5L
         +q2MLXZo5NL//jfNycGixiKspoHF53Jo+/ZUjv9pAxnKh0spTK4x8WIe//MQbC4NVedP
         qth8yrv3uWcV1zJL6LYaLyvKj3yQZQ12W0alOSx/31rtJAJv9BjND3M+NIENbu8dHxIp
         OI20v2V//xSmGQusCBz3KlVpiI8O2337mpt+fzPUNVmT7qmL97MALY5jBu5GAcilo50O
         itfA==
X-Forwarded-Encrypted: i=1; AJvYcCWBtc/E5RDe8cuJ7UwC4wpDI93KDhRsQsz/9cJB2qQCCo7oc7GQsiSyK48Q5PaVeQYGXm9EWu5WjfIzBw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwNy/opIg7KEoKmWb8dBG0+LO2bSbwZvo4xEdHEsPX4+WdvYFBW
	z71cDMfr6jUXbWdfzbkBndOYFWD4ZauhcDpX8UGEwuxFRSEAr/tPk5Ov
X-Gm-Gg: ATEYQzx/e3jgbDXlkLWfpNmoV/SwCi4uMyTmQ1u7CbZ/xgzx8Px8+UyKWcYUmBoXJ1m
	LxGCHlXB3s6DqhfO1KuC3XbirZX1Lt0kx753uUQFJi3hyNp47GBQuyL4Ai3hD5rXJ3CD0y6fLE9
	2QiNxLhmLJe13zHgR1qS5eg7Xr0VyYSHb2o8R9aG34BXSuYIhiV0aN4wvcmCzlzreIn8C8l58Sl
	4RIAii4WUcfwUk8FgbFmpUybDFgS4asIPbN8EEF1HIi4YJMwWp4/qFh+rDlySidoXhdj53cETFe
	tXBshvwiJU0YiA1tJ+ihNydSuwdgSTdp5JQNC4RVWmaXuMtWYKD1e9A4WP7BIqGvSzBVAAeUB87
	yL9gMTz8AFvbnLrxjEFPbFUORrVTIXvhXo3QWWOmRuJzxSWs+rAS956oRpVrypZDvtX4QlNdrSd
	0tLbasN2ftjh3T8CTCpiGyHeQ=
X-Received: by 2002:ac8:5fcb:0:b0:509:329e:bd5 with SMTP id d75a77b69052e-50957b909c8mr24981181cf.3.1773369825770;
        Thu, 12 Mar 2026 19:43:45 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5093a0ea844sm53518871cf.17.2026.03.12.19.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 19:43:45 -0700 (PDT)
Date: Fri, 13 Mar 2026 10:43:05 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	Yao Zi <me@ziyao.cc>, Yanteng Si <siyanteng@cqsoftware.com.cn>, 
	Vladimir Oltean <vladimir.oltean@nxp.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Shangjuan Wei <weishangjuan@eswincomputing.com>, Boon Khai Ng <boon.khai.ng@altera.com>, 
	Quentin Schulz <quentin.schulz@cherry.de>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next v9 3/4] net: stmmac: Add glue layer for Spacemit
 K3 SoC
Message-ID: <abN5Xn5GCa_UqCbO@inochi.infowork>
References: <20260312012232.373713-1-inochiama@gmail.com>
 <20260312012232.373713-4-inochiama@gmail.com>
 <20260312193801.61c30de4@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260312193801.61c30de4@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_194348_323131_8B65B4C5 
X-CRM114-Status: GOOD (  13.73  )
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

On Thu, Mar 12, 2026 at 07:38:01PM -0700, Jakub Kicinski wrote:
> Some nit picks only to be addressed in case the AI complaint on patch 1
> is legit..
> 
> On Thu, 12 Mar 2026 09:22:25 +0800 Inochi Amaoto wrote:
> > +config DWMAC_SPACEMIT
> > +	tristate "Spacemit dwmac support"
> > +	depends on OF && (ARCH_SPACEMIT || COMPILE_TEST)
> > +	select MFD_SYSCON
> > +	default m if ARCH_SPACEMIT
> 
> I know other STMMAC sub-drivers do it but isn't the defconfig for 
> the platform the right place to add this sort of default?
> 
> > +	apmu = syscon_regmap_lookup_by_phandle_args(pdev->dev.of_node,
> > +						    "spacemit,apmu", 2,
> > +						    offset);
> > +	if (IS_ERR(apmu))
> > +		return dev_err_probe(dev, PTR_ERR(apmu),
> > +				"Failed to get apmu regmap\n");
> 
> looks mis-aligned 

Yes, that's true. I will fix this.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
