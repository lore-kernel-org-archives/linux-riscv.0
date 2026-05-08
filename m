Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 335B2CD342F
	for <linux-riscv@archiver.kernel.org>; Fri,  8 May 2026 22:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=26sWVJ+BmF3FN4I5Ew4dQDXPh0asnO/hje+ItSLByXk=; b=IEpsrVJGVS4lY0
	ydrLSyBpLtN9j1+s7L08FzYYWV72D0+10S5RO3LpNszkD7KowIYsInC5mpuspWZlP5gjvtwlu7yAk
	YfJVLcE6OXttZz4+DakERk6LYAULFdP5llmN1N1rP5N3p3czsZgs9U51tsvsg0elfstEj8LKh6avc
	X9BzOX9rQBhF3azRL0CNNQ773onssPMGY5c+NJh6b4qkhHJhCmXovG2/PQulKeozeZvi7JcFII1Ob
	ca9wDJ3whGbbqb9aJ+PlJTLrojbFzjFdmXj2Xl56N6Ho271CmVo6GsMLdeRlMY4Pssu12uoBH0s6a
	ph/03sNxscJzF2JpLogQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLTfE-00000007dob-40K3;
	Fri, 08 May 2026 22:27:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLTfC-00000007do7-2zp7
	for linux-riscv@lists.infradead.org;
	Fri, 08 May 2026 22:27:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 58148443E8;
	Fri,  8 May 2026 22:27:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7953C2BCB0;
	Fri,  8 May 2026 22:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778279237;
	bh=ARXB7IXHajXNXClhcBq3h8oAt0A8+aZDLCr3/8KxfqY=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=Q14sNOL/eiPwdP3e+3zHr0JzszikuMTxc6cRHiRSPs4RiC6YNtwehVosdJWfo4gSJ
	 NF8iCTtzbnvpTjyBeo4l2jEvTCvrJcDOVFlRkmKMDjewpV/P1FEBtfcPtXdCA3iJnW
	 2z4MjcJC9S+Ywfwx62aiQ3O4BJnBlnVwWqoGSFc5CSTbGT52RmKzWyKhzl32msJ1pc
	 9V5RWKv4QpiP1PPKSm6WJjsqx4dfnxQMNM/Ne2ciHLGf3DTuXzkNXXu//wFQXMFg1Y
	 dfPgrXQfbDFd98LFcr4xQ78caV/fGPKhOHZ+kfITSv/nAE17xrpsloMLz5/N53m2cU
	 S/BlIJbLTz8eQ==
Date: Fri, 8 May 2026 22:27:14 +0000
From: Yixun Lan <dlan@kernel.org>
To: Iker Pedrosa <ikerpedrosam@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Troy Mitchell <troy.mitchell@linux.dev>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, Anand Moon <linux.amoon@gmail.com>
Subject: Re: [PATCH v8 8/9] riscv: dts: spacemit: k1-bananapi-f3: add SD card
 support with UHS modes
Message-ID: <20260508222714-GKA3590877@kernel.org>
References: <20260413-orangepi-sd-card-uhs-v8-0-c21c40ec16d0@gmail.com>
 <20260413-orangepi-sd-card-uhs-v8-8-c21c40ec16d0@gmail.com>
 <afzZ6Fjdt4puGjZ6@aurel32.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <afzZ6Fjdt4puGjZ6@aurel32.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_152718_774990_68354F6B 
X-CRM114-Status: GOOD (  12.00  )
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

Hi Iker,  Aurelien 

On 20:28 Thu 07 May     , Aurelien Jarno wrote:
> Hi,
..
> > +&sdhci0 {
> > +	pinctrl-names = "default", "uhs";
> > +	pinctrl-0 = <&mmc1_cfg>;
> > +	pinctrl-1 = <&mmc1_uhs_cfg>;
> > +	bus-width = <4>;
> > +	cd-gpios = <&gpio K1_GPIO(80) GPIO_ACTIVE_HIGH>;
> > +	cd-inverted;
> > +	broken-cd;
> 
> Card detect is marked as broken as a proper definition requires pull-up 
> support in pinctrl. Support for that went into 7.1, so I guess it's not 
> safe to use the proper definition. That means using the following 
> changes on to of this patch:
> 
> --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> @@ -406,9 +406,7 @@ &sdhci0 {
>  	pinctrl-0 = <&mmc1_cfg>;
>  	pinctrl-1 = <&mmc1_uhs_cfg>;
>  	bus-width = <4>;
> -	cd-gpios = <&gpio K1_GPIO(80) GPIO_ACTIVE_HIGH>;
> -	cd-inverted;
> -	broken-cd;
> +	cd-gpios = <&gpio K1_GPIO(80) (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
I agree, please see this patch which was merged

https://lore.kernel.org/all/20260312-k1-gpio-set-config-v1-0-8c3541da16b1@pigmoral.tech/


-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
