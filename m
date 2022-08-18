Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15DF4C25B0E
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Aug 2022 05:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QlzvWIhA55mIjrpQjC8qo2zSrW5nPc/zx7L0Kt2vE8A=; b=KB6W0Fj2UzAkRp
	4DMpn9pwfm/axdMI2TCbURbMfML/U8wc4y2Ru0S8/XXLAZJ/Iy5BeZaCii/l8YIYpGzjyW+lyAnvr
	gu5TIu5JpLOaWxusd3uqkUfXhKP03hGJad0QSCW1CaPHDeioJDP5MyIhjJXfhHBNOso3PJEY7t5NZ
	bAlXidZc2hONxvvotkS7t7ZbLf1zJ+gyOfYO2Ec64Umas6w9QNZUaWyOkroYO/VbH5Lx3csRCRwbj
	vCQayJWkNQMSu5trdca6SKQUs6a2/1HNCbb2WFizwWaH2a13rmsamPRZukcP8/O66KWACV822zmA0
	C7s5bXbR+ai4otGVXvvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOYGV-00G98r-EE; Thu, 18 Aug 2022 05:40:23 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOYGS-00G8ux-0O
	for linux-riscv@lists.infradead.org; Thu, 18 Aug 2022 05:40:21 +0000
Received: by mail-ej1-x636.google.com with SMTP id w19so1273814ejc.7
        for <linux-riscv@lists.infradead.org>; Wed, 17 Aug 2022 22:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=co317W61JM86wn5SpVyHhhw/IObSsmC/ASfLX4XlATs=;
        b=BPpw95zJMGlqVarXqqxpRJYVpKvOPdcS+VLwCrc/VR1X4q25zj6Rd4ajymUq+07rDL
         gomGk73qCBDbrR/aYhXrHRa4jrp5IDm3gWwnlARARvY+wyon2JWVM0H/kNEsFw6G5c9N
         LpXYo35m0X3UGBj5nsZbYCepal3X1RgYSnENlh3PAfcbE216nzQK/3N+LT3WLJp27Jfi
         ch4obhMM5NyyuwpWAM9KEXE5sZZw8prfsC4IKI9YaeqqyyLrM3Xy0x8Fy6y7wMGgL4vZ
         bf+XLjgJABTfKuCUxe3U0naIjEHnYpLgY1jxzomLLF1HbxvSDh3cgzzFoHV7Rj2zC/+m
         A7Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=co317W61JM86wn5SpVyHhhw/IObSsmC/ASfLX4XlATs=;
        b=LU2BCoJ0DQ0aSw8pJdKNOuTTJKxNNm95pH2M2V/qSjSdrCgjl8+S5xvfzXZuCWAZ2Z
         aMuSR/W5ZeSAJJ0XkMKuRH4Xsh2qJYCEolnDG10q99Pjyms2TeByfbL+5Du1K3Y/wk4q
         V1m78klCl24p3v5yFFMMbQ+rfdmKf2MpvtI8dG31Z32gxcoMklwYoAHuPgxigg0a9Yhx
         URYpYdc8KiqB7HFGmhpHNvoQALGvAU/g6GSHA/XJTeByDj4Kxz8Zp+BX0/a1vbHsLkJH
         GMtjkFYByh9nAtkqy6EUanZoeJC0CihoCFtrqvkUaW9DdOW1LAjCYbzkQQP3EwxXJF2H
         9FSA==
X-Gm-Message-State: ACgBeo3JUm/m8Nxyfmht46iTPckNTlWT1gB8lU2DH3xkbR7b9uKZmVXR
	M3arBIseU5i+i0W+sYc1Rf8omQ==
X-Google-Smtp-Source: AA6agR6DTPfa/DC6k9ouJhP4Wm5AirLbz4CXhH6KSzKZNQaoXfqhee31UWXbRLG+aWxz/Vko9Tgg7g==
X-Received: by 2002:a17:907:1c87:b0:6f0:29ea:cc01 with SMTP id nb7-20020a1709071c8700b006f029eacc01mr854089ejc.671.1660801215722;
        Wed, 17 Aug 2022 22:40:15 -0700 (PDT)
Received: from localhost (cst2-173-67.cust.vodafone.cz. [31.30.173.67])
        by smtp.gmail.com with ESMTPSA id u21-20020a170906409500b007330204dccdsm317825ejj.140.2022.08.17.22.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 22:40:15 -0700 (PDT)
Date: Thu, 18 Aug 2022 07:40:14 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <mail@conchuod.ie>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>, Sagar Kadam <sagar.kadam@sifive.com>,
	Jessica Clarke <jrtc27@jrtc27.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	qemu-riscv@nongnu.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 3/4] dt-bindings: riscv: add new riscv,isa strings for
 emulators
Message-ID: <20220818054014.wad7uqqnmoc2wrbp@kamzik>
References: <20220817201212.990712-1-mail@conchuod.ie>
 <20220817201212.990712-4-mail@conchuod.ie>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220817201212.990712-4-mail@conchuod.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_224020_098846_4BDE4386 
X-CRM114-Status: GOOD (  31.51  )
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

On Wed, Aug 17, 2022 at 09:12:12PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The QEMU virt and spike machines currently export a riscv,isa string of
> "rv64imafdcsuh",
> 
> While the RISC-V foundation has been ratifying a bunch of extenstions
> etc, the kernel has remained relatively static with what hardware is
> supported - but the same is not true of QEMU. Using the virt machine
> and running dt-validate on the dumped dtb fails, partly due to the
> unexpected isa string.
> 
> Rather than enumerate the many many possbilities, change the pattern
> to a regex, with the following assumptions:
> - the single letter order is fixed & we don't care about things that
>   can't even do "ima"
> - the standard multi letter extensions are all in a "_z<foo>" format
>   where the first letter of <foo> is a valid single letter extension
> - _s & _h are used for supervisor and hyper visor extensions.
> - after the first two chars, a standard multi letter extension name
>   could be an english   word (ifencei anyone?) so it's not worth
>   restricting the charset
> - vendor ISA extensions begind with _x and have no charset restrictions
> - we don't care about an e extension from an OS pov
> - that attempting to validate the contents of the multiletter extensions
>   with dt-validate beyond the formatting is a futile, massively verbose
>   or unwieldy exercise at best.
> - ima are required
> 
> The following limitations also apply:
> - multi letter extension ordering is not enforced. dt-schema does not
>   appear to allow for named match groups, so the resulting regex would
>   be even more of a headache.
> - ditto for the numbered extensions.
> 
> Finally, add me as a maintainer of the binding so that when it breaks
> in the future, I can be held responsible!
> 
> Reported-by: Rob Herring <robh@kernel.org>
> Link: https://lore.kernel.org/linux-riscv/20220803170552.GA2250266-robh@kernel.org/
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> Palmer, feel free to drop the maintainer addition. I just mostly want
> to clean up my own mess on this when they decide to ratify more
> extensions & this comes back up again.
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
> index 873dd12f6e89..c0e0bc5dce04 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -9,6 +9,7 @@ title: RISC-V bindings for 'cpus' DT nodes
>  maintainers:
>    - Paul Walmsley <paul.walmsley@sifive.com>
>    - Palmer Dabbelt <palmer@sifive.com>
> +  - Conor Dooley <conor@kernel.org>
>  
>  description: |
>    This document uses some terminology common to the RISC-V community
> @@ -79,9 +80,7 @@ properties:
>        insensitive, letters in the riscv,isa string must be all
>        lowercase to simplify parsing.
>      $ref: "/schemas/types.yaml#/definitions/string"
> -    enum:
> -      - rv64imac
> -      - rv64imafdc
> +    pattern: ^rv(?:64|32)imaf?d?q?c?b?v?k?h?(?:(?:_[zsh][imafdqcbvksh]|_x)(?:[a-z])+)*$
>  
>    # RISC-V requires 'timebase-frequency' in /cpus, so disallow it here
>    timebase-frequency: false
> -- 
> 2.37.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
