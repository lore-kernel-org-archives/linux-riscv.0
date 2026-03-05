Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7997AF30946
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Mar 2026 13:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AY2UcxuAKK4OFqHfkTZSj0EX0rKstsJ0OZgeWYE8BYk=; b=Q8z7BFaH15al2q
	HMcJkcbRyBekjhH1RyQzBlF/KXgWoy+XmNLgZpKcm4AdxZaUprwP7Aq84VAy0jxKhYkHTQQH+54/Z
	QRgf/PWcPZ/ztzXSDX4Xfn9ZllLxkmCS/fkTfh8OSrDiapP8WLGA84hzxcwdj13IOWbaDYJDJUynN
	fs4RFX6LWdsf3WOgxv6XgS1hj70tnNIi/HGVkH/yYhDfCK67iz8O9NSnfmbXSV2K8jpiQtL2ZX3Ur
	na8+86iJryZ+qPnIG/Ady/F8cFU+t0GPTi++Q0j2qlMJcvKoz5kO/LCmtc0GAPFOigPQywELtupVy
	FVw6MY0kdYSSHh8CjJjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy8P8-00000001qfn-2ID6;
	Thu, 05 Mar 2026 13:06:14 +0000
Received: from mail-pl1-f180.google.com ([209.85.214.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy8P6-00000001qf5-3IbH
	for linux-riscv@lists.infradead.org;
	Thu, 05 Mar 2026 13:06:13 +0000
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ab232cc803so37831525ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 05 Mar 2026 05:06:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772715972; x=1773320772;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z/3ao61LTSp6jCCF+e+2SF+gp23jwVu9a+x2K0Dcxpg=;
        b=nKuq2ve3gN5n1Bp+x08IbAkBtd2fOdxLQAMJVGK0vq33+cVSLKVWBkRLKCJMxchLwC
         3p+PbOKD+XdwVAlfyGZOaTQpgvRORkXD1b8tLNrnHqvMvsJq8NdJpReNdQQBU8KiDHjx
         /vbLZtwU/ihrun9ZY/cfY2RWoO9cwjdzNrmTLNy22vd9wDF8DjLi2VMPDvVXKderrVQ3
         Yim58PAjInAm4ZYS17WpXVtjWDFRJhUyGTWICQ28Oln3avnBj39mZfwWYeqY0UebCSAn
         o8QPoT2qZFGGA1kbhh6c2dQ2F7DzygbGpsPvL30hxy+ffhwgB+7FaYrSfoJvNzwYG1sm
         lZrg==
X-Forwarded-Encrypted: i=1; AJvYcCUxxykFoMNVZtPphBUEZh1acZuTjT0r0rQozaDvtj620MKI3wvMtHEgo2OxPb5PlyMulm39v6E4gR390A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzH9+DHsdT/VnpyLzYKm1zpD6X0tUbReR4w7h5wUOf+G9zrdJb4
	rYnEfQJeOu66scfqY5NA59TPdziBKxVvl0cSsOAkBiyXZNLdeVIEQ9LU
X-Gm-Gg: ATEYQzxRmtkN4szyeJwjfXbdPr9tiqEpW604xA92CMJ79uM41Z2Ddh3sEYc4JYOc0bW
	mFtujrGYF4AMJb6MdHXPR+zQ6AfNWbcmEfDnufLn0GAgd3CQ/k7bSHwT93F/cxWg/xI7KZHh3e1
	HPf/ITiQf+ZTdY6HW0L/iMCOGO4KZu1Vye05Oazpg1pDgwizVSPCQf01ObJAj8UboTJ6U71ySPh
	tt7bMCFlms71dRQyvJDHR+B2Sfby+vP+Ctb0J+Oj0Ir0v/v/8D/qJ6IBfGmB5qBmsXKYvpXKQHQ
	8cZ48louTl52vS3Rp0mmu1Wq1xx62ycYyYr8Ltm6W6hybJ2ExsBLKEyoVILYydj08DUFWADS608
	9e/DIH1XOXaoYUF/ZktElxFqAEvfD5GYTv9N05zZQ3KfU6o5ONc4jgW3BnRgR0Wj9SHTdL3GiHX
	NLjOB3iYH5J8TeFEalUSecy0d98AzWhkVg0osMgkCvFUNgn9uaUnWWKuLaO2VzO0aF5X0W//TnS
	nINPVdC0HyQp/uMRx7wvFQc6ftd8vg0fFD1TkOG2Z5e1Lp/HrQ=
X-Received: by 2002:a17:902:f68a:b0:295:560a:e499 with SMTP id d9443c01a7336-2ae6a9cd41cmr53596975ad.5.1772715971749;
        Thu, 05 Mar 2026 05:06:11 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae3d19559csm154128355ad.5.2026.03.05.05.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 05:06:10 -0800 (PST)
Date: Thu, 5 Mar 2026 22:06:09 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Joe Perches <joe@perches.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
	netdev@vger.kernel.org, spacemit@lists.linux.dev,
	UNGLinuxDriver@microchip.com
Subject: Re: [PATCH phy-next 22/22] MAINTAINERS: add regex for linux-phy
Message-ID: <20260305130609.GB1659133@rocinante>
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-23-vladimir.oltean@nxp.com>
 <a8fee1cd-1e69-4a9e-8533-c0988c480fb9@oss.qualcomm.com>
 <20260305085148.7cwo3yflp7vcfldf@skbuf>
 <f3a5aa3df78553ffc0fd0024f5fd36a4e2158c88.camel@perches.com>
 <20260305114352.2f7btqixg4tu5bzl@skbuf>
 <20260305121532.GA1649635@rocinante>
 <20260305123843.i47asdrjychwlgdt@skbuf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260305123843.i47asdrjychwlgdt@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_050612_845457_190A3B37 
X-CRM114-Status: GOOD (  10.56  )
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

Hello,

> > > K:    \b(?:__)?(?:devm_)?(?:of_)?phy_(?:create|destroy|provider_(?:un)?register)\b
> > > K:    \bphy_(?:create|remove)_lookup\b
> > > K:    \bphy_(?:get|set)?_drvdata\b
> > > K:    \b(?:devm_)?(?:of_)?phy_(?:optional_)?(?:get|put)(?:_by_index)?\b
> > > K:    \bphy_pm_runtime_(?:get|put)(?:_sync)?\b
> > > K:    \bphy_(?:init|exit|power_(?:on|off))\b
> > > K:    \bphy_|(?:get|set)_(?:mode(?:_ext)?|media|speed|bus_width|max_link_rate)\b
> > > K:    \bphy_(?:reset|configure|validate|calibrate)\b
> > > K:    \bphy_notify_(?:connect|disconnect|state)\b
> > > K:    (?:struct\s+)?phy(?:_ops|_attrs|_lookup|_provider)?\b
> > > K:    (?:linux/phy/phy\.h|phy-props\.h|phy-provider\.h)
> > 
> > What about
> > 
> >   F:    drivers/*/*phy*
> > 
> > or something along these lines.
> > 
> >         Krzysztof
> 
> I don't understand your suggestion. Is it meant as a replacement for the
> keyword regexes? Your file pattern matches on:

I was thinking more along the lines of using wildcards, the F: was just an
example.

[...]

> There are a lot of false positives, and a lot of false negatives.

Yeah, the "catch-all", for lack of better word, will not work here.

	Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
