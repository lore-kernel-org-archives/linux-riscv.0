Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 307A2C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Dec 2023 16:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rU89xNzhpFZfNR4inkpq79tal4EMEwVXm67IC4eWFI0=; b=k4YWRUyzewAmho
	NtA2FYHlDAgZ3YgssHEEJjFFp8iU1QKX3GqACTQNb5XK6Hose63pgYhdcys9rSE7xjULYGgqll1uS
	fcG+FYXRPHl+snEZ3h1eQYE35fUBJuKNqdo2Y8KtLUkon6fSoZ9evS/kNs25/ivG2g3p5jNl605L2
	rVaP4N5HQEPhXxOn57BZStr+IVZa9ATq2T7bhhfIkldNqNc7Azwo4WeBhYvCHZXChhEv19++pcuBM
	pwvDO6QzGy//ZwTXLXDWKOkMC56Ombi38G8WrWIzDEIEZ1HjPa2rd/ptRVyhDxgQ2wyKWOOwDXeZD
	F702hGzOGY8zQ7JssHbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDobU-000nuh-0q;
	Thu, 14 Dec 2023 16:30:28 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDobR-000nsc-1I;
	Thu, 14 Dec 2023 16:30:26 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-40c48d7a7a7so40704035e9.3;
        Thu, 14 Dec 2023 08:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702571418; x=1703176218; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xE01ZdGgOUbKW6jdSRaQsPD8axcaxCU7gBZ6Hb9nfkU=;
        b=ZCSFRJShWYM10ch3roml7tsaDtU3vkQwXIVp4jYOF5t3eJgUB113cM3gF8HVrEW8KN
         xYHaX0ou/2SgYvw7Av5uadH6qoAhcIdj9v+pBnUJXQvcLYIiTdGGqz+D73AvQ2FRipjt
         0aJl7H2MCGtpg6xvYBjHpULptnHRMGKnStZUUetoW+wtcvE3V/NvbCIDbHtvPd9OiaUB
         eJNphMw2R0pjYKYVChhRQBa+tBbNo7bB8U8oqF1yX32f2C9ARDDy78S1HKXZcxwngIA0
         Y8c7RY9ECIK+hchIru3ey0ztmiki3PrEjhjXizQOhDAiVcjUqPERONrw7FexkNfgy4cY
         xuLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702571418; x=1703176218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xE01ZdGgOUbKW6jdSRaQsPD8axcaxCU7gBZ6Hb9nfkU=;
        b=Ug6RdkDxJFvOV57EzUIKdnBlnlu4D9s1XN5LC0TSi6B+LQsQGnw/snrha4JpZvxXDq
         iZJOjRL3NMGqmi8ytI1Vf5Uwm31c6nPico4LvU5Nc2ol7rWvMkv1gMwyDsWYiCYEMLwj
         ds1ks83Dg0sh8NsoFQDcq9oLDo7lMDent/dhoDyoDBrYVt9SWK/QqoOkPOyJa89MnaVI
         Fi2Ebj92Ey2yYupVTPkC535i8oVIkGvLwfOorvD0TUGh17OA14tL68MqylzSgh4tMZV/
         8dsN3Kafkq+INWjeur6ZWHRZlJVF+Ljtei6ByBOQdM+s6xtUGSiUOj8JXyQpwybEQTcS
         vbtw==
X-Gm-Message-State: AOJu0YxkXkWhjjgLVGWB4xf0uJSGCwRLvuFtmbE/iRzzGJ+TfHePW4Dm
	vhpw7kR+k+ekAnvBUZoITk4=
X-Google-Smtp-Source: AGHT+IEt3Nf2FCXCesN3uRpXrcfJ59x2f6UcAcLrd557rYe94mku6UBCBQZa/o3m9hOoz7r2BA5Z3A==
X-Received: by 2002:a05:600c:1392:b0:40c:55c4:45ec with SMTP id u18-20020a05600c139200b0040c55c445ecmr2704032wmf.46.1702571417702;
        Thu, 14 Dec 2023 08:30:17 -0800 (PST)
Received: from archlinux.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id i1-20020a05600c354100b0040c411da99csm19770588wmq.48.2023.12.14.08.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 08:30:17 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Yangtao Li <tiny.windzz@gmail.com>,
 Brandon Cheo Fusi <fusibrandon13@gmail.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 Brandon Cheo Fusi <fusibrandon13@gmail.com>
Subject: Re: [PATCH 3/5] cpufreq: dt-platdev: Blocklist allwinner,sun20i-d1 SoC
Date: Thu, 14 Dec 2023 17:30:15 +0100
Message-ID: <3459481.QJadu78ljV@archlinux>
In-Reply-To: <20231214103342.30775-4-fusibrandon13@gmail.com>
References: <20231214103342.30775-1-fusibrandon13@gmail.com>
 <20231214103342.30775-4-fusibrandon13@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_083025_439843_068C309F 
X-CRM114-Status: GOOD (  14.20  )
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

On Thursday, December 14, 2023 11:33:40 AM CET Brandon Cheo Fusi wrote:
> The Allwinner D1 uses H6 cpufreq driver. Add it to blocklist
> so the "cpufreq-dt" device is not created twice.
> 
> Signed-off-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
> ---
>  drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
> index bd1e1357c..2febcfc2c 100644
> --- a/drivers/cpufreq/cpufreq-dt-platdev.c
> +++ b/drivers/cpufreq/cpufreq-dt-platdev.c
> @@ -104,6 +104,7 @@ static const struct of_device_id allowlist[] __initconst = {
>   */
>  static const struct of_device_id blocklist[] __initconst = {
>  	{ .compatible = "allwinner,sun50i-h6", },
> +	{ .compatible = "allwinner,sun20i-d1", },

This should not be needed since you're using H6 variant for a fallback.

Best regards,
Jernej

>  
>  	{ .compatible = "apple,arm-platform", },
>  
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
