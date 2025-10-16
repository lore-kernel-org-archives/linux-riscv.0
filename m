Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1132ACCD194
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Oct 2025 09:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YyubwY1dzUpffBm3bd9rQ6X9M3ZO6cbtHuz4PTOeBTk=; b=kxT9D6LO/bOTcP
	VV1Gbq4kuB2VroOJjg13pJjCiEEzGyp2mYQd9KHTnwcJduUT3V3mqKbTK0BD6324T0ycPF1T7cLXr
	I4Man8SCqZlKl6uUQqsgWCemNPvCxl9giPgJRBjDDmjcsxM/TGtoh37/yEBPiFQN+t8Nsrtk806of
	hTUUFOjDDYAoXnYYR5ETnEbnCx0LOWKRIZkmsdtF/qd46V8osX+sbJ5Rrvwra6x7hAl3O9zDoGMaD
	CZDRu21otPV2pdR6hvjWJjwYM9qA+/M/HPFkVK//afoIaLswjYLNKk+8G+0TmvowYRpgVEbSNSIoG
	+xMw1xx8dZIf60iQSLhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9KDi-00000004BGB-2VK5;
	Thu, 16 Oct 2025 09:24:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9KDg-00000004BFo-3JDh
	for linux-riscv@bombadil.infradead.org;
	Thu, 16 Oct 2025 09:24:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Jj5YDavVXV4rN07jSdQ2E7BNofwSc+9mwEIbSMC3ewc=; b=nyA8REnzE2CvNNOTiMUjOWsQmH
	SPcv/R+/Ij0Ne1/mODkhmv81uFVNVgPcpfoND8k25S8yPpLNQwyTQZZ8cRDjJ5mdi7f8daSwx4PNl
	frabryrbTZp1+mYrJWgsNmQWNSX7A88wMmlnSG5EzNipoRHkcNWm5YGnTUJ8pQIAiKNlANal4c2dc
	laZLRsAAIOvdWxzCpDevmYBMB8kDQj7U7Ea/8NuyfmeQ3JAIxOfPSY8Jkw23u0ClDYtYmN/qBwHBD
	jHqXnXxH7w98/jhZ92U479ABUURq8rq/at45/DpxWCiMe7ZtTWBPMk0Ei0WKH8oWjzLKIny/uW0db
	ksC6qWJA==;
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9KDc-00000006d5c-3XGF
	for linux-riscv@lists.infradead.org;
	Thu, 16 Oct 2025 09:24:23 +0000
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id F07563F72D
	for <linux-riscv@lists.infradead.org>; Thu, 16 Oct 2025 09:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1760606656;
	bh=Jj5YDavVXV4rN07jSdQ2E7BNofwSc+9mwEIbSMC3ewc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=jWkhGFrtSSAohz9qa6Wk6lajLiJUbkPBFFxQfaIeL83NZzh1QA0lDIiJqUYN4+Khv
	 cVc9f3gtUiBvCCFDEKt6oNQIYHogCjIxNn7umTehQ8ykiaB+8wVrh8Ear3sqJfxqEp
	 e3QMQGgG3rjexWY86z+SBCdcxO5AjNmoaxeBTwautqCtZ14I17cEnHIeRU7WgJWOWt
	 WBTPZ9Yr5o0uvraU07RRQ0pqLfQobWUxIPIXsO7s6b6zOcrXT01Ux6HlwLjgcJ3/pL
	 ewa/L7+HklVdmW+fT32s6YsVJKNuWyfTpzHKjn33fADfynbs55ppCAkHHbCKVYXlFy
	 HQNfkvDE59qpxPUvuXl+A4tOAILB0SvWrc6Pw1UvuSD9mPZg+/kymVI1JDmJME7Dtu
	 9t/52rq3tfAAm8YjXCkaU3K0DsJe9NRQdG68gaG9E0aRi1QI4Z3g/qkcEfq+2Yt2y3
	 GiIKmU1JUk2sVsQyDje2OmUpW/r7IOp2UFhXq1t2rP2lXwnPoCz2qmuKbZiqJWIlBD
	 4hPy8rycCv9ik/wFyLR2dXcYS3WPL/pI8Bnjf0ADl//O6oyxctGAfsZ5gE0xu5R90j
	 QG9xZK4Rul8Aqssa0ksTecltC+g+d9Bc6BmkXjsd0c7AEhTdujpFgxP39JvE2FSFuw
	 GyrygkdbnMJQXu4HjqNzFkpo=
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-42558f501adso293075f8f.1
        for <linux-riscv@lists.infradead.org>; Thu, 16 Oct 2025 02:24:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760606655; x=1761211455;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jj5YDavVXV4rN07jSdQ2E7BNofwSc+9mwEIbSMC3ewc=;
        b=d8rjZtm7+egMmOYczCA8j0TrX1a6GW5SOx/6gjWGwj+v1elV6UFHfNwVVpJyc08vFp
         iBYobQjCl8FO7O5fnT+X4sz2p4NmAIndBS35AvxJ7N54qXL8CBErJYPvUz9I5zKDzKGf
         DrL13OCgTF7+E04YQqXfTrWO+3WSSRLyNgR1hopXSQyA+yfIR9xXhH0KOrNcfSVVGM+B
         L6VFmNXIBXEkLvBu18m9wlzdfuEJ5UMJWzrxQ9ncNEm4z+Ypeed7dVO4xiaIV4P7OK5r
         sLXuePjF0s7bHZUOkltanuZ2DkN0TmKL33S0nADoAtcUadF98FBeshG6I7UT1oW7yA/K
         W0AQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMDUgCoGj6MmVyYFgtReXgqWcA49O/DQ1XDOv73vXOOb0r6UQexD8fjBAtTdJrj0LVDGcHl/FN8OZOUA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5+OBI9HIBsADX5EBEWFh9KhOmMCZ/2l0PUepk0CNdkl3+0ozl
	ouLd0rXfHswFAtUEotXyXD9L8Hl3cusEIeSBvumhYqILyTunKtc6F0/8zP5LP1Luz6rIfnWafel
	Gdlum2Q3kEpJWaRSmqsDxNIWQ9/b8a006WS09rKB2ti6zyqVVtDVce5wpt0TKwKb+5YorSTvQy1
	V6JJXBkys27A==
X-Gm-Gg: ASbGncs4xfqxKCMvzv+JhDgKLyyHpOChkyy1RIw84zdKSOoA5IVopPoyZoUxPMW1mjG
	ddQvhPU65q8M3RxRvSN9EO7emEypf8Z8B1TkkD8VXv10FfVBtxvE01j5lJFm3LtJ2jCUDNRK3Ap
	ALFljlmYF770DYQ5Nsn6Ngl+lfmkIibXVcDUUPuv02zvluH6cRWFEYHQBTygWuuHIqr5ehi2gN1
	BZd0Fyxnbnu8AXXDN/0Ly+yunRXP3qK0r3Fd6EawmPN2MbYNL1rTLYDwH1QU01/lVA96zVrbkuh
	3MMOLYSTDrvUXCme+K/WcMULzhL/H48Y1BS7HiU4+DV6OhlvT5RZFGbR96Ana0BNChM+rg3U9Vo
	+NZMwkVeidi3Y1xXGKCVpBEIY+CoJVYzPNGoaNDugZCj1BrX0wiDctj6UBKALCz65j5EtWscL
X-Received: by 2002:a05:6000:4305:b0:3c8:d236:26bd with SMTP id ffacd0b85a97d-42666ac2ce9mr21148706f8f.11.1760606654869;
        Thu, 16 Oct 2025 02:24:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcbBGP+l5exuqbqvAtjI14viHyp0QSM9sOIa9CsXS1ysxI1h4z19klvDWfmi0DQ1uixQfYDg==
X-Received: by 2002:a05:6000:4305:b0:3c8:d236:26bd with SMTP id ffacd0b85a97d-42666ac2ce9mr21148675f8f.11.1760606654414;
        Thu, 16 Oct 2025 02:24:14 -0700 (PDT)
Received: from [192.168.103.116] (ip-005-147-080-091.um06.pools.vodafone-ip.de. [5.147.80.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce57cce5sm34412027f8f.1.2025.10.16.02.24.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 02:24:13 -0700 (PDT)
Message-ID: <64772268-54a1-4495-a901-bfd0e4b06f78@canonical.com>
Date: Thu, 16 Oct 2025 11:24:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/7] dt-bindings: riscv: Add StarFive JH7110S SoC and
 VisionFive 2 Lite board
To: Hal Feng <hal.feng@starfivetech.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, "Rafael J . Wysocki"
 <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 E Shattow <e@freeshell.de>, Paul Walmsley <pjw@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>
References: <20251016080054.12484-1-hal.feng@starfivetech.com>
 <20251016080054.12484-4-hal.feng@starfivetech.com>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <20251016080054.12484-4-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_102421_402280_E6000570 
X-CRM114-Status: GOOD (  14.95  )
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

On 10/16/25 10:00, Hal Feng wrote:
> Add device tree bindings for the StarFive JH7110S SoC
> and the VisionFive 2 Lite board equipped with it.
> 
> JH7110S SoC is an industrial SoC which can run at -40~85 degrees centigrade
> and up to 1.25GHz. Its CPU cores and peripherals are the same as
> those of the JH7110 SoC.
> 
> VisionFive 2 Lite boards have SD card version (default) and eMMC version,
> which are called "VisionFive 2 Lite" and "VisionFive 2 Lite eMMC"
> respectively.
> 
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>

Reviewed-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>

> ---
>   Documentation/devicetree/bindings/riscv/starfive.yaml | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/starfive.yaml b/Documentation/devicetree/bindings/riscv/starfive.yaml
> index 04510341a71e..797d9956b949 100644
> --- a/Documentation/devicetree/bindings/riscv/starfive.yaml
> +++ b/Documentation/devicetree/bindings/riscv/starfive.yaml
> @@ -35,6 +35,12 @@ properties:
>                 - starfive,visionfive-2-v1.3b
>             - const: starfive,jh7110
>   
> +      - items:
> +          - enum:
> +              - starfive,visionfive-2-lite
> +              - starfive,visionfive-2-lite-emmc
> +          - const: starfive,jh7110s
> +
>   additionalProperties: true
>   
>   ...


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
