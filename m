Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04AE0C10F16
	for <linux-riscv@archiver.kernel.org>; Fri,  3 May 2024 07:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AAX16UvBzuqELG53Yv3MlBIDcaRL7Y4QmUV5tI+/cNQ=; b=nDE00DeqXHtfRaEhBjYYkWrtSj
	0r2i8r1qc/y9yTIPz6hOqYbwo2Xw1kmOISrj/Y49tRIjKCKEttO5Wauks4X36Tb0oTeOaLtnrPkEH
	XHij9as3wzRz8yrr4/5uOfROYdRnKGYgn02axbaB/fhcatvnoMMRYOpDiJKRUqeuOU7Sqpvd1Kpa8
	mwrPb2h8h4nuPKEJo6G72yMhkWoQIjA31l1MkhiILxQ83xZ2F86Ci2d1a5egRJFDIVYy4jePZe57f
	mqOLatflcTIDa975yesGUs92/SsmT8dksycwmE9vu83o/AYSovA+hDi2T8Bg+3caCegtgtDjkoOO+
	Qg1YxIjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2nOi-0000000FTbu-03NQ;
	Fri, 03 May 2024 07:32:00 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2nOf-0000000FTZv-2upy;
	Fri, 03 May 2024 07:31:58 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-51f300b318cso1785572e87.3;
        Fri, 03 May 2024 00:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714721509; x=1715326309; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8nIAbUzFZ0W2jGneqHDrLTTJJlX3iJTnQjqRXAlljl4=;
        b=kHDE8K0Z07UHJ3x+ljLrqpXkIPP58bVoFh0hDkA6710JDKRBoQ3Hk/tKl341CbCqhB
         f4SqzLV8N8HeiDZXPpS/6n04BOhbITchRLl8Zr9NzISZMVjbjMmiZ36nnCr88/NuZF4M
         XfIgiQraIGKQwjmSAAiJLq5JbLr4ypsnpW5vxt14MTBQwrYGJK6z3yV1VFLwFQcKQjm7
         hz6BCxUfulyw2ClJwwDvRYtL/Jg4sZEBrFE+5vgYFFiGdEVquKuYWlmPHNqgFudwdFZj
         ai7DAtMjjaDYjmv8G3Zgz9oTGAHLvRSCFyJkQgH03NdItRu+TdmFwmZB37X8zJ7lu7ip
         ro5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714721509; x=1715326309;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8nIAbUzFZ0W2jGneqHDrLTTJJlX3iJTnQjqRXAlljl4=;
        b=w5UaiohU/eWYYqQTGW5bRqrQlNSpk7xzmD5m1f8LMTriBVCCepAoiA8B148bcXIfEM
         c/ZPTRQV9Q8v65H3f3aQOhepbvCdynLQunq/uzBLswfl5Lyxl6lsRmUkpzLmEb+x/rmv
         8aelH1uRyh8+hSX86f6q+94S2ueFn7I9Qp5JQWC3nO5iw3YYBwscdzBqWZIxHuaEdvD8
         JVJv46qt3KmR2mnB09ccTpbOT5e0exXJ92VeNaw0U9iQ43TVbEJDmBx2+a4UDZizAZIg
         arS6pgeXinygUFdSABebGLulAWPzzdydMRBRNaGGmcTsedzryeH9u9u5SY78Tf//OMNQ
         dC2w==
X-Forwarded-Encrypted: i=1; AJvYcCXaGbUZ2kzr+VdsVwEvsj0F+Gz2d7+Hzdd1y5iyTQ4g9205X1ydArzTR0id4BykgNbud5uE2OfkeZu3ZaPVlzTTH3/xmH9fZw42V0xDHv/lSseqrN72qL3vqicbUBlUwKELQjO/l+FqCGCqJOd9b2R/ZfP307+KbkGExJo4jqhIveJ2IAIl+foauACjENbEXUtvE/T7T38h0g4=
X-Gm-Message-State: AOJu0YwAW7DXypnxu3XhfNcV+w2DMf3gSybgX+HGWgwrK1Kz84NG2C0S
	1+xAeAwwzbYzS8GOcf8WJ1F5DMpZzP11yPW7Xlf8nuPiSXN1Ygr5
X-Google-Smtp-Source: AGHT+IFsUViOgQWBfed0iW3it0Tz8tCjvrW37J5LJ5nqlT1r2qRnsl694GKdCGtShTdCqT/cBC7gsQ==
X-Received: by 2002:a05:6512:3ba:b0:51c:d528:c333 with SMTP id v26-20020a05651203ba00b0051cd528c333mr570067lfp.20.1714721508677;
        Fri, 03 May 2024 00:31:48 -0700 (PDT)
Received: from [172.16.183.82] ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id x27-20020ac259db000000b0051d71292d5bsm450650lfn.74.2024.05.03.00.31.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 May 2024 00:31:47 -0700 (PDT)
Message-ID: <017b2462-f9c9-42c0-bfd9-1a0e76d2ea3d@gmail.com>
Date: Fri, 3 May 2024 10:31:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: mfd: Use full path to other schemas
Content-Language: en-US, en-GB
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20240503072116.12430-1-krzysztof.kozlowski@linaro.org>
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20240503072116.12430-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_003157_774401_ABC0793C 
X-CRM114-Status: UNSURE (   9.97  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 5/3/24 10:21, Krzysztof Kozlowski wrote:
> When referencing other schema, it is preferred to use an absolute path
> (/schemas/....), which allows also an seamless move of particular schema
> out of Linux kernel to dtschema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   .../bindings/mfd/actions,atc260x.yaml         |  6 +--
>   .../devicetree/bindings/mfd/brcm,cru.yaml     |  8 ++--
>   .../devicetree/bindings/mfd/brcm,misc.yaml    |  2 +-
>   .../bindings/mfd/canaan,k210-sysctl.yaml      |  6 +--
>   .../bindings/mfd/delta,tn48m-cpld.yaml        |  4 +-
>   .../devicetree/bindings/mfd/iqs62x.yaml       |  4 +-
>   .../bindings/mfd/kontron,sl28cpld.yaml        | 10 ++--
>   .../devicetree/bindings/mfd/max77650.yaml     |  8 ++--
>   .../bindings/mfd/maxim,max77686.yaml          |  2 +-
>   .../bindings/mfd/maxim,max77693.yaml          |  2 +-
>   .../bindings/mfd/richtek,rt4831.yaml          |  4 +-
>   .../bindings/mfd/ricoh,rn5t618.yaml           |  6 +--
>   .../bindings/mfd/rockchip,rk805.yaml          |  2 +-
>   .../bindings/mfd/rockchip,rk808.yaml          |  2 +-
>   .../bindings/mfd/rockchip,rk817.yaml          |  2 +-
>   .../bindings/mfd/rockchip,rk818.yaml          |  2 +-
>   .../bindings/mfd/rohm,bd71815-pmic.yaml       |  2 +-
>   .../bindings/mfd/rohm,bd71828-pmic.yaml       |  4 +-
>   .../bindings/mfd/rohm,bd71837-pmic.yaml       |  2 +-
>   .../bindings/mfd/rohm,bd9571mwv.yaml          |  2 +-
>   .../bindings/mfd/rohm,bd9576-pmic.yaml        |  2 +-

For the ROHM stuff,
Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

>   .../bindings/mfd/samsung,s2mpa01.yaml         |  2 +-
>   .../bindings/mfd/samsung,s2mps11.yaml         | 12 ++---
>   .../bindings/mfd/samsung,s5m8767.yaml         |  4 +-
>   .../devicetree/bindings/mfd/st,stmfx.yaml     |  2 +-
>   .../devicetree/bindings/mfd/st,stpmic1.yaml   |  4 +-
>   .../bindings/mfd/stericsson,ab8500.yaml       | 48 +++++++++----------
>   .../bindings/mfd/stericsson,db8500-prcmu.yaml | 40 ++++++++--------
>   .../devicetree/bindings/mfd/ti,tps65086.yaml  |  4 +-
>   29 files changed, 99 insertions(+), 99 deletions(-)
>
Thanks!

Yours,
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
