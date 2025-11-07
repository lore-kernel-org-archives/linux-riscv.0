Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC196CCF9F8
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Nov 2025 11:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JCBWxHhDnWWlocwYjpWrRuZWBNQsIp9xHeurRhb+b4I=; b=LCJ4BweA/U7ujv
	kP+dG7I1heeSEWp2/XVPfTPLjrAmgKFY2ZvYqdiHsEG7lTJWmkjk1QeXnVp6Fd8I8UNPrqDFi530S
	vptMh8rCF6o+8NM+o4evYo76MzOYOXjUXg8q0kwU1bP7Fnvgi4+srUsKlbM7USsO35QtsB8H3s1Cz
	sVYW0bizYauHjDPKPb1qU/EOpjxT7rBz77g/HOx+GiVHAwuIsD8bcHCYWLXTGbw0OHdpbE6+qLh5/
	i6DuQ/An00ImOG9/YuIi0UF5H3WudoNzPeLsGztLyypIyMJn/OepLX5rzhWv7FuOHGptcJ90GPZUr
	4mIDv/tu7PRB5cq0JNOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHKV2-0000000HByn-3j9J;
	Fri, 07 Nov 2025 11:19:24 +0000
Received: from freeshell.de ([2a01:4f8:231:482b::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHKV0-0000000HByP-2YQm
	for linux-riscv@lists.infradead.org;
	Fri, 07 Nov 2025 11:19:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1762514342;
	bh=lhFcy5Ig/Qga8G7LRC6PM1MhO7lb4A5TShXc2mRUdDM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JJitGvotvmm2lBkF0RwI16nnmDt+iJgwWH9S+fG0JcI0qrFPOxgNL08pwL5JhUdHJ
	 X+KeMlZ0eFU0Sj5rPuPwpKiMBRUjz05NY2nbv5Dwpq5+qpIY1Ux00hwE6hYlgGOjO5
	 I5Afy5iOdVim8lZ9s72EJ/7HKXi1fcWM+m33SYr6EZBrpajnU3z/G3R0fi3h3l0p7L
	 QCf3AwiH+I822e8jhbnpdRtpSrKx8Fp4cdCSm6CaYwIWaGR0hVEWyhetCenJ+R7/DZ
	 nl6yIeOmJVvcD24wDL892tXV8d3/1bYxJbtQkcI6CpWLDQ9JdFUvqRIRdi2hw9Q/Uu
	 XxQ8myplwdK4w==
Received: from [192.168.2.54] (unknown [143.105.119.212])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 5D427B22046F;
	Fri,  7 Nov 2025 12:18:59 +0100 (CET)
Message-ID: <4642392c-f44a-453f-992c-e28da67159aa@freeshell.de>
Date: Fri, 7 Nov 2025 03:18:57 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] riscv: dts: starfive: Rename jh7110.dtsi to
 jh711x.dtsi
To: Hal Feng <hal.feng@starfivetech.com>, Conor Dooley <conor+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251107095530.114775-1-hal.feng@starfivetech.com>
 <20251107095530.114775-4-hal.feng@starfivetech.com>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20251107095530.114775-4-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_031922_798550_BFE39A50 
X-CRM114-Status: GOOD (  10.52  )
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



On 11/7/25 01:55, Hal Feng wrote:
> JH7110S uses the same devices as JH7110. Rename jh7110.dtsi to jh711x.dtsi
> for preparing to add JH7110S based board device trees.
> 
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  arch/riscv/boot/dts/starfive/jh7110-common.dtsi           | 2 +-
>  arch/riscv/boot/dts/starfive/{jh7110.dtsi => jh711x.dtsi} | 0
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename arch/riscv/boot/dts/starfive/{jh7110.dtsi => jh711x.dtsi} (100%)
> 
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> index 083ec80b4e44..809274625615 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> @@ -5,7 +5,7 @@
>   */
>  
>  /dts-v1/;
> -#include "jh7110.dtsi"
> +#include "jh711x.dtsi"
>  #include "jh7110-pinfunc.h"
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/leds/common.h>
> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh711x.dtsi
> similarity index 100%
> rename from arch/riscv/boot/dts/starfive/jh7110.dtsi
> rename to arch/riscv/boot/dts/starfive/jh711x.dtsi

Reviewed-by: E Shattow <e@freeshell.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
