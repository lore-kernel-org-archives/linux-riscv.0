Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26446CCD194
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Oct 2025 09:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zyRgRSwjgUzlQluaUGmf23hhsE4suUq/SREmbmSlldM=; b=c9bco5Sodk8Z1Y
	m9HMnKlvyhLZj7OQPy9iiBCaDtbyXNFs7JKtQS9V2z6XZ4J3pdY83Hn3S9R1HFJwhl7xkrg+FlDUo
	ayc8mpqFo0oBJupWCIGlbfQFPkdn4Kx14tURwxMoWWdzW3XkwUJ+rsL+GoZakTjlTsmS/diR9a2DI
	z8jvn887MKLZeaco4kXJU5u2r0lQnwMxYOauAFkj5hqsSQnteMdkMojPXnCpEEXrDERatLvK+J9DS
	MMNYHsfmukQQcAOa40BDyI24IKPClZwpQt9ztfO83ztoIFOsqPDOezLWWn8N5OBkG0Wm7Ngen0sgX
	fxo5TLLPMjVZWd8gYJAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9K9q-00000004Agn-0Btt;
	Thu, 16 Oct 2025 09:20:26 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9K9m-00000004AfD-3wWr
	for linux-riscv@lists.infradead.org;
	Thu, 16 Oct 2025 09:20:24 +0000
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 107B33F72D
	for <linux-riscv@lists.infradead.org>; Thu, 16 Oct 2025 09:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1760606419;
	bh=OJ0lJAET4g4vdkI+q0D39xN1UQb7n+ShPw3yodFDk1I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=LK7n//8DFwcsHAjVmYZh+l6OS0t6kSvL6IhJTGD53XmQqpZ0//9tzw0GUaSA/LS8+
	 h+/nCFGhNkzYOvGjX1aKScLgKL/qGDo1ZjE5hG6T14Srl4PhqvF1y7PPlOrvo+a7zv
	 mjBc1SCsA9/9sbsxiu6Uov5+k4FONBbcisgxILu91bQyruAOwKUeMW6sSLmMiF4/U4
	 lvX9PlLs45YhPnEJIf1FmEbrk4jtbQ1jvROsLXLZknIM8KAFPNfX0UOSo0KXUhWX7z
	 6uuQIukGRjRZ4rd9z9XCx235kUPpSfavT/SLN4uI/5hBJqDdvWEzYfm5lKXRlEMbX+
	 JI3KgdlQYfkhDPFXQkYrJNBuTuuzdZHJ6JYoKwyA85GlK10sLJxda0uEZ0k3lNwoJB
	 I0NKx1e1AeGIEJMbXPfxPftd0/2AnzCFMtDxC6Q5ows6hSErDICW7hsLTKNG0P2OEg
	 XKB/ub3Jaz4LR1wHIQ8ZG0e27wtbKY0dDmtQdy24ScsvMljSUI5P8mzQyKwNDBBOwu
	 UuvwghxM/T7cGtlc8eYnMbH6zLEvfHXqqum/KWhxnAB6+QSBEG1+STb5LKaR1q7YT+
	 ywRhW+SmH3f9ONtuzbeJ78qjNLBx7ezeWnfWvwQmoQdNyeEm3xSaXMSPdDZr9HPGZz
	 Q7HkrrjMJjUkzMt6Xjs6HSIE=
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-46e39567579so2959535e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 16 Oct 2025 02:20:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760606418; x=1761211218;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OJ0lJAET4g4vdkI+q0D39xN1UQb7n+ShPw3yodFDk1I=;
        b=BbTxNsZJfqH3Ohz//PWD+wMctSvLv2jgBNJo6QOit39EVW04hxufIBOhF6CPn06LtH
         BE+7HKLM/nEGF1FZYydRAxjqVsdAldcvY9Tmtc8WZToliLI9fXIYBF5UGBLaJtBrkyuz
         hCQrpCeBWaid/+1Ry7uyTdp3V5IR9odrtba12LB7KUDyw8X+MtLvawUeGX9wIbrXng2u
         HBBdOnHzILZTmtUWgx28Au/GmcUQ8e4j65y6rh56D2RHDHKIkU9FKzbpa81+DJ80hW9F
         tWOUYAE2iDE187hsf0/jj4JbbhferLbY6aX+R60ux++gx4MfZmvpVb0ElNdEBmJwSmw+
         uTQw==
X-Forwarded-Encrypted: i=1; AJvYcCUP4AFj9cGzog7fL/KteEyl7ZIqeITRm12YF9OOfkIjdNyMOSC+f5wnPWIWxdo6ZHECRmfBbOfLuGeJeA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwiGk9qllOHPcyT8Iaw3qUwDSWpyDDhkeuw00nEJB8zFbeBUZmY
	CzYbdGQ1hOrBIjBPbSaaqJVRouZ9HCzBAkwPh57F7x2jRC2LszMKVp5cHrap09L7W9YO/bD4LPe
	JGl4trUoGQ2EVObzpU/GWzzfhpM/QljRTf6ACeGPw45Fiz2jZRQ9AkSd/5GunAX4OwAZQPDLQQ9
	JwG0viGp/PIQ==
X-Gm-Gg: ASbGncsMJdZtY+6Y8CKG96k5/J42Sn009Ww6VxkRhyFCKR24rk7CbSy5p5jgqfUHIpv
	DC8wH9jfqFu7Hi3SP/5HY0aOgk/76kZjzF7g6KaY4sR5z0mH0h8T3jS/ZVsJEFavIdDFssTvYUu
	Scw7jAGegDPNH6wxXlXYWrZ51IlRs9Ki5dhsHSFPGwtujQrE6mT8Zh7zP/L+CRh14NLN46AfBFQ
	DRKdgyRGMdmdahg5iPcvZ4si+ueWCdX+WmMMnORbbocTYdZLdJA4o7GHLtaSE/EXwjQPB5NwSOR
	umEKkfPp1cBQb1bnVRh8EHLXf1zH27Kq+vmOCS8hdFjxGIYhDrNUgNSDkZHK7MpPsJZpRTo79QH
	8rqyfP5BBOLhqqgaRI0W6pIxrUpbWMPB5d/IzLro02vDXWbk1/chL+EmCoe4C3kO6Dln9CB/J
X-Received: by 2002:a05:6000:2486:b0:427:38b:cbc5 with SMTP id ffacd0b85a97d-427038bcbc9mr260380f8f.46.1760606418627;
        Thu, 16 Oct 2025 02:20:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWHxnhRr0zKaTqXSmx48RroXO5zvyasty5TJo0MiU49h1Rjj308rIrfJTyIkIDwj6SkbzYYA==
X-Received: by 2002:a05:6000:2486:b0:427:38b:cbc5 with SMTP id ffacd0b85a97d-427038bcbc9mr260346f8f.46.1760606418226;
        Thu, 16 Oct 2025 02:20:18 -0700 (PDT)
Received: from [192.168.103.116] (ip-005-147-080-091.um06.pools.vodafone-ip.de. [5.147.80.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5e8207sm32742853f8f.47.2025.10.16.02.20.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 02:20:17 -0700 (PDT)
Message-ID: <48c20b5e-ad6e-425c-857c-79f76742456d@canonical.com>
Date: Thu, 16 Oct 2025 11:20:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/7] cpufreq: dt-platdev: Add JH7110S SOC to the
 allowlist
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
 <20251016080054.12484-2-hal.feng@starfivetech.com>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <20251016080054.12484-2-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_022023_196963_795AF57A 
X-CRM114-Status: GOOD (  13.20  )
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
> Add the compatible strings for supporting the generic
> cpufreq driver on the StarFive JH7110S SoC.
> 
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>

Reviewed-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>

> ---
>   drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
> index cd1816a12bb9..dc11b62399ad 100644
> --- a/drivers/cpufreq/cpufreq-dt-platdev.c
> +++ b/drivers/cpufreq/cpufreq-dt-platdev.c
> @@ -87,6 +87,7 @@ static const struct of_device_id allowlist[] __initconst = {
>   	{ .compatible = "st-ericsson,u9540", },
>   
>   	{ .compatible = "starfive,jh7110", },
> +	{ .compatible = "starfive,jh7110s", },
>   
>   	{ .compatible = "ti,omap2", },
>   	{ .compatible = "ti,omap4", },


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
