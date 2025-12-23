Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F3FDE6F07A
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Dec 2025 09:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a8EPIN2WVuHvcoEYf01C/4JdZIrxTHabhIzbsMdgyfM=; b=pkH7vIcHR9joRe
	bzJizjoEpT18KGNQK6gbB4nkiURJ2iTZIrHo5KmKfZvSU9pQPvo8CIroihb8/CqZncFtIJXN+lmGt
	gVUvFFWyf8WfkQSUiodvRdwva/fjm0q5Qm5ITcxBXsibfIAAIfxFif66xHcRvKFU4+/naM7duQzsI
	bjH/AuBa8qa2CzCn9riBsCsg8IYn7R+oEJMK1Tb5R2KW9cCU1V3UzQwxEr+BB2maBBPsoQdIl95HH
	PbLdtglOYBH78mQ94tEGdc41TPOUfL+j5ucH56aVm0D87TyX6Yrwrpg96v2DrZygAXg5hK+0w5VbH
	uYLWjfLTeqqxoKCV15mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXyvc-0000000Emon-1mWd;
	Tue, 23 Dec 2025 09:43:40 +0000
Received: from mail-dl1-x1235.google.com ([2607:f8b0:4864:20::1235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXyva-0000000EmoN-3QPt
	for linux-riscv@lists.infradead.org;
	Tue, 23 Dec 2025 09:43:39 +0000
Received: by mail-dl1-x1235.google.com with SMTP id a92af1059eb24-11beb0a7bd6so8047507c88.1
        for <linux-riscv@lists.infradead.org>; Tue, 23 Dec 2025 01:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766483017; x=1767087817; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SxJbYsS9Flodz6V0WJwrBiZXTghxJcKYTBqtlgaql2c=;
        b=WJrrqudFDJAgfi4HGpQdPd5dKuguo0BRQ9tJnFkSAuGxnf/XbKlcQvmeGusNu1bu6/
         a3xDvzUk4aAHkKhNvTVlKlFDFGaQP0HxMhqvR1zu+rFWGQMLy/jJgde83qH7gIBgGiOL
         7Xf8t/XRX0Lg3EOzdKCoajY5QwcHCXLBfmO80+EwucBMG0u9mmfRhU2KCqW1wWNXSFmk
         ZyxDFrCeV2j6CV8T2nSM44Amk6t5kp1Y7grphJF35i3fsSYcJwz8DSChIqYBBxuGlhOV
         Kr1/XB15inHdZJb+UxNk4zRcCtPjn90Eq5DpbjcbbN53146PyLLV4lMq0DJzRkRd0Rij
         buPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766483017; x=1767087817;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SxJbYsS9Flodz6V0WJwrBiZXTghxJcKYTBqtlgaql2c=;
        b=rY0MM6UcTod/qAAsZzdFjJ8sU3ifPtrYBYHibKnPPhJ9wyOoL0uqQ36dS1MV3oks3P
         a433rHE++TSSNMof0JltHt49tX126UB9cwSxQpPN9vDoi4VNxdr5oaG+GfckrN0Ps4we
         H/+x9o5F75+KJM/he1ryOM5RUVab8AuAEWy+VMdDnsu/Htq+fd9JDIYgH6I6N6UfJi5S
         gnqtJOeoWIgh6BVDsLqLy3LKbJGJ+vH1y6RL7f/q5h9zAZ3MbeyvLIaWyJS6rrmWPCBf
         BCCn3BAm0N84CDIphrKwNT260y3B7LMG+GdPvqgDkfq4kx6yFX+91lKJyjYmRAoqKhy0
         NTuA==
X-Forwarded-Encrypted: i=1; AJvYcCX7M+Shdz8jEcDIIEaP1srwfKZ3eqf4134dRfUan4J9vSjA2ObmmlsmqyYVcDre0SaeLUq6yrdXudhDOw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyYV4dFAh7Ad/6I6FrXSUqzJ1CXrRd6Skf+QPJO/+CA8GMGAAWD
	TSnwrecRvRe2+AC6E/lJwIJ86TI96fTfcDig1qRxPo876W2XXKnDxpNWuix+30ck2h8=
X-Gm-Gg: AY/fxX5h2qhDaeO2Ea0/YvxTDwi50CKzgIv41NoY1G9wnochuvUfXZbBnpJhKUcosdx
	oNWTYYfhscdScyQXDgIV4HCO3P4DgwlLOQIEf+nsmsAsoqRh96ASwMiy05+yV+1qRiVl0niadS0
	T12lHBbqIR+nTqoafo67UUtbabMPa+fEtSRjcZ499NjqFrwe0JtFWAo7ZJ1iCEHRWDTExUf200a
	8tEQEUiT6Tv9l++Wyr7nfXRT7nDsc0idD9jKbYR2Dzh3ACu8ap/jJyUhX6ZbCjwP3a8xhln/dzJ
	PmjTnIJHnGvvCJSL7/EtZtnOJ2yjfdv9NARNVoBiNkYZH21w3sHPaPUDkHMQZ0Kngi4AOO6euW4
	8V2WnGjd6ZzA9OWU7GfKQZvmfuLdTmD3x7EOxYdxxwX+rulRKEQvzTpyvZckw1Jiw/lCczmUDOi
	4GhM8abTfxcw==
X-Google-Smtp-Source: AGHT+IEp+OSd9R0lrP291Dk7W1AafeaeXYagMJNjBu0iohEINVzAIJUCtwgGHA2QHs2m9CJoX6vTug==
X-Received: by 2002:a05:7022:608a:b0:11b:a8e3:847b with SMTP id a92af1059eb24-12171a685cbmr13887306c88.5.1766483017187;
        Tue, 23 Dec 2025 01:43:37 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724cfc0esm56367570c88.2.2025.12.23.01.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 01:43:36 -0800 (PST)
Date: Tue, 23 Dec 2025 17:42:26 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Linus Walleij <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 2/2] pinctrl: spacemit: support I/O power domain
 configuration
Message-ID: <aUpirQFWf3w-5PQ2@inochi.infowork>
References: <20251223-kx-pinctrl-aib-io-pwr-domain-v1-0-5f1090a487c7@linux.spacemit.com>
 <20251223-kx-pinctrl-aib-io-pwr-domain-v1-2-5f1090a487c7@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251223-kx-pinctrl-aib-io-pwr-domain-v1-2-5f1090a487c7@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_014338_878769_22622BF5 
X-CRM114-Status: GOOD (  21.29  )
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

On Tue, Dec 23, 2025 at 05:11:12PM +0800, Troy Mitchell wrote:
> IO domain power control registers are used to configure the operating
> voltage of dual-voltage GPIO banks. By default, these registers are
> configured for 3.3V operation. As a result, even when a GPIO bank is
> externally supplied with 1.8V, the internal logic continues to
> operate in the 3.3V domain, which may lead to functional failures.
> 
> This patch adds support for programming the IO domain power control
> registers, allowing dual-voltage GPIO banks to be explicitly configured
> for 1.8V operation when required.
> 
> Care must be taken when configuring these registers. If a GPIO bank is
> externally supplied with 3.3V while the corresponding IO power domain
> is configured for 1.8V, external current injection (back-powering)
> may occur, potentially causing damage to the GPIO pin.
> 
> Due to these hardware constraints and safety considerations, the IO
> domain power control registers are implemented as secure registers.
> Access to these registers requires unlocking via the AIB Secure Access
> Register (ASAR) in the APBC block before a single read or write
> operation can be performed.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  arch/riscv/boot/dts/spacemit/k1.dtsi  |   4 +-
>  drivers/pinctrl/spacemit/pinctrl-k1.c | 131 +++++++++++++++++++++++++++++++++-
>  2 files changed, 131 insertions(+), 4 deletions(-)
> 

> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> index 7818ca4979b6a7755722919a5958512aa11950ab..23ecb19624f227f3c39de35bf3078379f7a2490e 100644
> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> @@ -565,10 +565,12 @@ i2c8: i2c@d401d800 {
>  
>  		pinctrl: pinctrl@d401e000 {
>  			compatible = "spacemit,k1-pinctrl";
> -			reg = <0x0 0xd401e000 0x0 0x400>;
> +			reg = <0x0 0xd401e000 0x0 0x400>,
> +			      <0x0 0xd401e800 0x0 0x34>;
>  			clocks = <&syscon_apbc CLK_AIB>,
>  				 <&syscon_apbc CLK_AIB_BUS>;
>  			clock-names = "func", "bus";
> +			spacemit,apbc = <&syscon_apbc 0x50>;
>  		};

This change breaks binding, can we use something like <0x0 0xd401e000 0x0 0x1000>?
If you insist on a new reg field, you should change the binding as well.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
