Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B4E8C369D7
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 08:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KqZVtBAbPEcj94pfBcMRM/6309ZoYv+xEZ0jkYMt7nU=; b=UJJoEFqrE3DPIr
	30Vbf5jZSjDZ68EY9bX9QusM939YmwWKVjtI0YQOQqqLXbgmcGWy6jGHE35tcVgXGwcN58/GobWqT
	Gnttr2Ge0cEZ+acBkX818YcS9A7PHQyfqOhnPg+05Ewbj4FhvlDrDySCxirsQMPKNnjbNrSVIhLXc
	+aQr88D+qXPH81Q+Fl7GqBSy9mIjAT2k9jAr3O22nWrxCOjnWFDqqgHuAnJu1n/hwY/tZ0e9uiYfb
	Z0cjPSdFZJehYPmDMvPGiR8Etmk4VqxYMQ8l3DLXKfM/ADx3kZNsau6HXhzZbPTj/bdOoMO/favSt
	B9+l8My7zeyjogXae5/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7rjz-0000000DIev-2Z6X;
	Thu, 24 Apr 2025 08:15:27 +0000
Received: from freeshell.de ([2a01:4f8:231:482b::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7rjw-0000000DIeV-0xJ5
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 08:15:25 +0000
Received: from [192.168.2.35] (unknown [98.97.25.173])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 712A4B2C201A;
	Thu, 24 Apr 2025 10:15:19 +0200 (CEST)
Message-ID: <60891c52-eeca-4358-8f38-789533016495@freeshell.de>
Date: Thu, 24 Apr 2025 01:15:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: pinctrl: starfive,jh7110: add
 PAD_INTERNAL_* virtual pins
To: Icenowy Zheng <uwu@icenowy.me>, Emil Renner Berthing <kernel@esmil.dk>,
 Jianlong Huang <jianlong.huang@starfivetech.com>,
 Hal Feng <hal.feng@starfivetech.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20250424062017.652969-1-uwu@icenowy.me>
 <20250424062017.652969-2-uwu@icenowy.me>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20250424062017.652969-2-uwu@icenowy.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_011524_426708_E2E306FA 
X-CRM114-Status: GOOD (  14.26  )
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

On 4/23/25 23:20, Icenowy Zheng wrote:
> The JH7110 SoC could support internal GPI signals to be routed to not
> external GPIO but internal low/high levels.
> 
> Add two macros, PAD_INTERNAL_LOW and PAD_INTERNAL_HIGH, as two virtual
> "pads" to represent internal GPI sources with fixed low/high levels.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
>  include/dt-bindings/pinctrl/starfive,jh7110-pinctrl.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/include/dt-bindings/pinctrl/starfive,jh7110-pinctrl.h b/include/dt-bindings/pinctrl/starfive,jh7110-pinctrl.h
> index 3865f01396395..3cca874b2bef7 100644
> --- a/include/dt-bindings/pinctrl/starfive,jh7110-pinctrl.h
> +++ b/include/dt-bindings/pinctrl/starfive,jh7110-pinctrl.h
> @@ -126,6 +126,10 @@
>  #define	PAD_GMAC0_TXEN		18
>  #define	PAD_GMAC0_TXC		19
>  
> +/* virtual pins for forcing GPI */
> +#define PAD_INTERNAL_LOW	254
> +#define PAD_INTERNAL_HIGH	255
> +
>  #define GPOUT_LOW		0
>  #define GPOUT_HIGH		1
>  

Asking about the choice of 255 and 254 values for virtual high/low pins,
here. There's not much result when grep Linux source for 'virtual pin'
to compare with. Are these the best values for this approach?

What happens when devicetree has in it to route PAD_INTERNAL_LOW to
PAD_INTERNAL_HIGH and other unlikely combinations?  Or a devicetree blob
with this computed value is paired to Linux kernel that does not have
the code to handle these virtual pins, for compatibility concern?

Do we know yet if JH8100 will share some of this design?

-E

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
