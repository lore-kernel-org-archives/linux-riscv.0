Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF05EC982C9
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Sep 2026 17:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cdNO+5GQyYNPKUfzNBjTe3pvcnepUpGCoEQgbv5jj+Y=; b=lBgalqTZ2uCfVw
	NVCh2hywsureU8iwCbEEMjQjC4SCliW2kx3rB3r7vEIiWdN70sP7S/YUAdJaGnZLmT0FqM4p6ab/Z
	aeJPGd3BCXdRf8GEXI1LPbXtfnNLbsRTOxKXwkdMFyLvsTscT0qoBSIfKj7vuSPmjF/oQCA9Jj7dH
	QCQpmARfS6PAUwsezAv/4XqjI5AxrXtu02WAafsnDQyXlBkru1Hhp69vf5Iaut2V8Ri3wnT7Rys9B
	8UKZ0R5kTAhscBaQWX85cc4QgIZYQ9B/3QwnvQ+LzVhKPd0hIPIdAv/ympbaG2zlEiswZzpc9xJ5j
	X991N74T3HWA73GKrfrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6t9U-00000009q0T-4BKO;
	Wed, 16 Sep 2026 17:10:33 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6t9Q-00000009q04-1HQZ
	for linux-riscv@lists.infradead.org;
	Wed, 16 Sep 2026 17:10:31 +0000
Received: by mail-pz2-x10.google.com with SMTP id d2e1a72fcca58-85469b355ffso815045b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 16 Sep 2026 10:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1789578627; x=1790183427; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4QH7TCKimipR8xV32SdX4PILN4e3j5bJ+o9cYY2F4DU=;
        b=EBXyMA0kEqY1vWsXbK4ca/Dtrji1rIrQDBg/Eg33NQRxhtCpVJO+Z13pVtuRiE8Nlz
         ZwDoKBm/SPxGCmMUOF1r1HYMW6CYRvwxxNZowVLq2Vhwr3L2TPRXUOSi8vneXZOQPAkH
         /904uZRz3ba7b1AanenudvDOAumN2i9lWRly4qF3iPqXjIafCkW/3bjuhM1jtHeBstko
         AM0LchhjfqMXlIpLKCSCXj9VVoFFsYMBaGW4NQiytxaJt4s/L3FuvCcj9i1eHgqNQjLH
         KlxFJPUba+22/3TxMFZTVUrXf+3YvYp7XrLYAqk22OWLfKHPN71mjnpSzgEVUoLjtKCt
         ubhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789578627; x=1790183427;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4QH7TCKimipR8xV32SdX4PILN4e3j5bJ+o9cYY2F4DU=;
        b=luEgHFsTpyyUAqhkWe7JZM6ojf4+JpjUkItxd0InxOSPIoUWMYEthMHZ0jfXBF+DuC
         c8s430Bdvu6NJ/Fng1rMpL0sUq5aGGwVvsOxUJfyX+vyn8HZqHNa0XsjPTkwBlsmY5R/
         NmlV5mbhOG8WE3gNfBJj5urrGtdTBDFXEChX3k2QAsZf3ij2jdP4102v0O/qfolSTaJj
         u8J1lK2DeVRCqGRu1RVHNi/KDtsnNHqOvcszBY52BloIrlmL0GA6bWQ5eA0DCSS9zc6L
         a5qL4kF89qN4VmluKHBa3wDWwiHWfprz340/DJJMOvfemzjxE//jCFFlqRtz49jSbOCc
         Fy9Q==
X-Forwarded-Encrypted: i=1; AKwUvBz5chtE1i265bQve/AxAuDAEzJkjdQ4s2J11kxHSH2jbmwPOOe01ga7KjsKilA8kP7j3DM8WXx4ZxPaoQ==@lists.infradead.org
X-Gm-Message-State: AFuF++kS5ufn9rxBoECnmlDSYcgt2b/ZjfjYoBlH0AlmnGZO3qmvGdj/
	3SlrlEj7e0iYhLCtXyMc5IYzHus4lIgW9KV6YMF4DoPPGJ5vUEHqWDhExfW4fZgsZzg=
X-Gm-Gg: AYBFou2enJtzBDXApXA3FXlehqhZtN4seQ7oGzGV5e5OHofcRYJaDj5644dEj7JILvD
	AG93CQavxDIZrjFR3X4q7HTVbl2k+HgVT5HE8JfHqLgT2pF/RHSAYf8VMMjSAQKsSprPMX18eml
	DjfR+xotZEWzXQO9DJouTMwNhQguAnNQlQcd7YDJwhUP9EirQMKNodEw0TCsaa76WP8UfbW/izX
	VmnXgKYjAmLA+FcDxZrKWA4Z6R9A+ijX+2Tz7kEU0d5Z5N9OUSB/g0eXMG0gmSmNqfB77GbJhKt
	Sn4pdQLZz0VlC6+wlQVe/02QRoZ8dOWrhLyudeUUJ/iI33yKmIEjsv5sJZdZYdIxyAQ/Vrm/6AR
	q8bEZHGUiEgild/SxodvoSElID1J2qQAfRte+JN6Mhxo4GwUDsVBqATM8nmC7eryZLJYlFh2ay8
	IqCUIpaKGTFgKWgoYGfV2VUSNgiVyraiAwdBwrK6dCl/wwuHKORXVKWKEBQn6qC1e/GfSFXh7eF
	3g+6iZgjq/pqzI8K+5y
X-Received: by 2002:a05:6a00:181b:b0:86d:3958:6b13 with SMTP id d2e1a72fcca58-872391ab57emr6854570b3a.19.1789578626409;
        Wed, 16 Sep 2026 10:10:26 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.13.74])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87201d1b275sm1607393b3a.51.2026.09.16.10.10.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 10:10:25 -0700 (PDT)
Message-ID: <6e4b5c98-7d48-4629-a6a0-4d930327f9a0@sifive.com>
Date: Wed, 16 Sep 2026 12:10:23 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: dts: sophgo: sg2000-milkv-duo-s: reserve memory
 for RTOS
To: Andrei Lalaev <andrey.lalaev@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Chen Wang <chen.wang@linux.dev>,
 Inochi Amaoto <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260916-milkv-duo-s-rtos-memory-v1-1-6ca72d5a3924@gmail.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20260916-milkv-duo-s-rtos-memory-v1-1-6ca72d5a3924@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_101028_356831_783049AD 
X-CRM114-Status: GOOD (  17.17  )
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

Hi Andrei,

On 2026-09-16 11:06 AM, Andrei Lalaev wrote:
> The FSBL loads the coprocessor firmware into the last 2 MB of RAM.
> Reserve this region to prevent Linux from using it.

If the FSBL wants to reserve some RAM, it should modify the devicetree at
runtime to add that reservation. Adding the reservation here creates an
unnecessary ABI surface between the FSBL and all consumers of the devicetree.

Regards,
Samuel

> Signed-off-by: Andrei Lalaev <andrey.lalaev@gmail.com>
> ---
>  arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts b/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
> index 78a257839f6f..693c9fd7b771 100644
> --- a/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
> +++ b/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
> @@ -22,6 +22,17 @@ chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
>  
> +	reserved-memory {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		coprocessor_rtos: region@9fe00000 {
> +			reg = <0x9fe00000 0x200000>;
> +			no-map;
> +		};
> +	};
> +
>  	wifi_pwrseq: wifi-pwrseq {
>  		compatible = "mmc-pwrseq-simple";
>  		reset-gpios = <&porta 15 GPIO_ACTIVE_LOW>;
> 
> ---
> base-commit: 9b87fdc9af2fbfcdb5c24a64139685ef80f6573f
> change-id: 20260916-milkv-duo-s-rtos-memory-7a94933e35bd
> 
> Best regards,
> --  
> Andrei Lalaev <andrey.lalaev@gmail.com>
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
