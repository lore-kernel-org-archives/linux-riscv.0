Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23BF4D25B6E
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 13:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I356dSrVPz6wpry/gZSlqpesmv1/KE+2ChCSeQX/fGw=; b=yNIxoHgK8Ty5iH
	B5P9tIxAmrXcQkLm6jjtxDh1z/e7pN1myl7usIp9n05q+1ghM1G+e5z64hSM0wMXCeOpEcpfH678T
	3agzzj0O/BZrZoInl0mAs0zqrwv3eS1s5UPCgPEdUvFQ5246Xp+2pndnNiRMkwx3letONMlDVnbg7
	VlB5yskZ1ZHWvKcx06H6I58DlO46TWWKqKtShGd8bpa8+bS3IbsJ3WaqeMJiVS4cOErgVJe5Th6RV
	Jd6Qvb0hmdLBpT7yQ3JZfSYrDcdYsCt99FpyF0QiPUwpBcOllU7MEc6D5tWNpytTZM3FPutP4dC47
	etcKxgRsLI9Xgka30FKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl5bU-0000000G4C0-1lHN;
	Wed, 28 Jan 2026 13:29:04 +0000
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl5bR-0000000G4AJ-1m41
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 13:29:02 +0000
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-662fc35291eso263389eaf.1
        for <linux-riscv@lists.infradead.org>; Wed, 28 Jan 2026 05:29:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1769606940; x=1770211740; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O3+eV0m5YOcp1OGVa9q7WwRpTmAwgwaorWnGyCzBuiI=;
        b=Y2n83cc3LHRo8Z8bl6YwPzHw3DyOMXlW9xfI2gEr4f7DGYbmzredUNRP1SW4v3aumu
         E6SDcW1ITA1aCXvRpGxhicKkk5bB8WIUFluBI2Iyuu0aszSQlEHFbDVVhMB4TieP1XTO
         Jk6f/VgmLZBlEPTzZGTDcF8i7wxnrSkR9OQSUUDFqWl00uLLex2m2caTlOMEPtWLJu3D
         NealxqYD7M2qP9GsVz+VuuLT92/fgjd4KArDK9+MqYcIftGRSlrPZmSkdIMpqawZVF+e
         vMimkk1zCc7CkN8LCBNCevkTtZbKZyrQSwKKV0MeP3GIACPk3PgwzJgmsY+yztBQmMht
         G71w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769606940; x=1770211740;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O3+eV0m5YOcp1OGVa9q7WwRpTmAwgwaorWnGyCzBuiI=;
        b=UT6dj0SlPNgdg/dgH4sxfWJWTJM2HayHEYI4EHkeFNTepo0OQZK9Ebr6Q5BD3Yu5LH
         unrAqMcINmUKuh2IlwRBHCfhlfdZSGLEOqU5AP6pK1jTJ3PqfrWCpyvJShpECJV3cixn
         FXsAPsuaW2SLVfQmYKLivzDiLh3en5MfBRJ67gCsYDtliG1nJuA7OcHbD5xmyzyko4tw
         0CiJFaAfSygY9vg/vqXq9jM3clSxLQsyue3gNqj1a16rY08S6WC49cvK638KvIWuICdR
         kg3At6IUQRhOWQltGQWIm97GM40tzViCJxvq+b/76ojDFhtwR1+HCJR/aQE9C4yqmgkP
         K1dw==
X-Forwarded-Encrypted: i=1; AJvYcCWbrm6SyWfiMnPv63s2jL6VJ+N5QE0dOYLoZPqy+4amwjCRwevE1pef74CIuzlldyGYAPEb1+lFDYlXPg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxAN8DPtKn1NOlQOaSCX4RTZomF/fDDy64IX7Ko7g2h28QxG/TC
	U4AEVGR/6A5HYGz8EIlHqFxtSwL4EOsssrk80Gd3OGSVO5aEujcn9klhp9odyo5YLcQ=
X-Gm-Gg: AZuq6aLmwzP9zcYIk8pFjdv2n5N6nKvImY2g79pkInU3+Vs92+QnJN4LZXLxdm+DhnC
	rWMlTy0DiW6/bpoaNHyjirS8ez4SRKG1tPTzn6nXdSlxlkqwYoVZreBkgp9wx/lSIYKCBgcIHp2
	mvDxnAkxwAYLFdbf6AXigAiWZ57/US+sFD9fORagzzyUldu9MoDT8vVAcXubDHPjv9mqqkGHW+Q
	ITGbLsDrSMQgWRP4oiLkGbEFIN0USQnX4BhldrTGDC4QEOFsV1+WHnZWO4/l7AO0ZucAEv/5p2K
	qXoDhrLZLNwAF8ENVR7+mm+m23UYjpLzYwmXbkdQ3wT0wmcXWvBCv7IXOhY6SVAf81BCWlhjn0x
	x5S11Gbb+KAb1dCDooXL9vAjari3QtwyLF4alRl889g4nGILW+x2klFIEtpVmJF273z7DYjK2P4
	CPxrgdeCBnSOkmdtL9WQmeGzyiEQ2FfKF9cwYpgxr8FavOhxTRjv0=
X-Received: by 2002:a4a:ee06:0:b0:659:9a49:8efc with SMTP id 006d021491bc7-662f208c524mr3076054eaf.13.1769606940245;
        Wed, 28 Jan 2026 05:29:00 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-662f994388fsm1374132eaf.4.2026.01.28.05.28.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 05:28:59 -0800 (PST)
Message-ID: <4395bea9-44d7-4f0f-81d6-c1e05976a308@riscstar.com>
Date: Wed, 28 Jan 2026 07:28:58 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] regulator: spacemit-p1: Update supply names
To: Guodong Xu <guodong@riscstar.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, devicetree@vger.kernel.org
References: <20260124-spacemit-p1-v2-0-2c86b06694ba@riscstar.com>
 <20260124-spacemit-p1-v2-3-2c86b06694ba@riscstar.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260124-spacemit-p1-v2-3-2c86b06694ba@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_052901_476801_42ED6BF0 
X-CRM114-Status: GOOD (  20.57  )
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

On 1/23/26 6:20 PM, Guodong Xu wrote:
> Update supply names to match the P1 PMIC's actual hardware pinout where
> each buck has an individual VIN pin (vin1-vin6) and LDO groups have
> dedicated input pins (aldoin, dldoin1, dldoin2).
> 
> The supply is a board design decision and should not be hardcoded to any
> existing power source. This allows boards to specify their actual power
> tree topology in devicetree.
> 
> Signed-off-by: Guodong Xu <guodong@riscstar.com>

These are good changes but I have a suggestion on the way
you define the DLDO descriptors.  I might be mistaken but
I think you should make this change.

Aside from that:

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
> v2: No change.
> ---
>   drivers/regulator/spacemit-p1.c | 25 ++++++++++++++-----------
>   1 file changed, 14 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/regulator/spacemit-p1.c b/drivers/regulator/spacemit-p1.c
> index 2b585ba01a93..57e6e00a73fa 100644
> --- a/drivers/regulator/spacemit-p1.c
> +++ b/drivers/regulator/spacemit-p1.c
> @@ -87,13 +87,16 @@ static const struct linear_range p1_ldo_ranges[] = {
>   	}
>   
>   #define P1_BUCK_DESC(_n) \
> -	P1_REG_DESC(BUCK, buck, _n, "vin", 0x47, BUCK_MASK, 255, p1_buck_ranges)
> +	P1_REG_DESC(BUCK, buck, _n, "vin" #_n, 0x47, BUCK_MASK, 255, p1_buck_ranges)

That was a simple change...

>   #define P1_ALDO_DESC(_n) \
> -	P1_REG_DESC(ALDO, aldo, _n, "vin", 0x5b, LDO_MASK, 128, p1_ldo_ranges)
> +	P1_REG_DESC(ALDO, aldo, _n, "aldoin", 0x5b, LDO_MASK, 128, p1_ldo_ranges)

As stated before, I believe the 128 should be 117 here.  (If
you change the earlier patch, make sure the change to 128
doesn't persist here.)  Same comment for the DLDO regulators.

> -#define P1_DLDO_DESC(_n) \
> -	P1_REG_DESC(DLDO, dldo, _n, "buck5", 0x67, LDO_MASK, 128, p1_ldo_ranges)
> +#define P1_DLDO1_DESC(_n) \
> +	P1_REG_DESC(DLDO, dldo, _n, "dldoin1", 0x67, LDO_MASK, 128, p1_ldo_ranges)

Why can't you use _n here like you did for P1_BUCK_DESC() above?

> +
> +#define P1_DLDO2_DESC(_n) \
> +	P1_REG_DESC(DLDO, dldo, _n, "dldoin2", 0x67, LDO_MASK, 128, p1_ldo_ranges)

So this is generalizing the input, which is good.  The use
of "buck5" here was a Banana Pi BPI-F3 design and but it
doesn't have to be that way.

>   static const struct regulator_desc p1_regulator_desc[] = {
>   	P1_BUCK_DESC(1),
> @@ -108,13 +111,13 @@ static const struct regulator_desc p1_regulator_desc[] = {
>   	P1_ALDO_DESC(3),
>   	P1_ALDO_DESC(4),
>   
> -	P1_DLDO_DESC(1),
> -	P1_DLDO_DESC(2),
> -	P1_DLDO_DESC(3),
> -	P1_DLDO_DESC(4),
> -	P1_DLDO_DESC(5),
> -	P1_DLDO_DESC(6),
> -	P1_DLDO_DESC(7),
> +	P1_DLDO1_DESC(1),
> +	P1_DLDO1_DESC(2),
> +	P1_DLDO1_DESC(3),
> +	P1_DLDO1_DESC(4),
> +	P1_DLDO2_DESC(5),
> +	P1_DLDO2_DESC(6),
> +	P1_DLDO2_DESC(7),
>   };
>   
>   static int p1_regulator_probe(struct platform_device *pdev)
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
