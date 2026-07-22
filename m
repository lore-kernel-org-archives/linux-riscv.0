Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 482A7C44539
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2026 12:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qu7jF3p/f6yj8famn+DOI9dVjcXl5yOC8XdLHqYHiFo=; b=pnMmDAcrHFDn45
	//CwsPZbrc8j0KsWV8qbVLvpcvz03HRQ8bL6j0Aym7HHfxSqTawIZ2geNYj4tff1Dfk/MCT6szGPy
	Rqj/94MY8ZntE/SwNlwsxrvIzzeExoj3bTajQc2oQ6boyNF/xtv8jew0DVkOweMY2qyWbfrjDAlCA
	JDBTgjoQWGaEcylacY+cODjOP9un25U5dEWLdxs0lbgGaRNJV3U4lDJ7RXrcP3brNZQRMShLO7dZv
	pngRV4fuhHAjtX6gSPKo+3tokIygB4nbOfXSh9aQnys3DeH7m4nDttKwSvv1DUsA4yc99wUcCYZSR
	LXGx7hFSwfQ1kg4C8RSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmVvj-0000000BkBb-22PL;
	Wed, 22 Jul 2026 12:20:07 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmVvg-0000000BkAM-38V6
	for linux-riscv@lists.infradead.org;
	Wed, 22 Jul 2026 12:20:06 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-92e7c6ec9dbso673156585a.0
        for <linux-riscv@lists.infradead.org>; Wed, 22 Jul 2026 05:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1784722803; x=1785327603; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5qvzOJZC5dLwV+0rw2sHYPHDnXSJxTaB22HkTCSR960=;
        b=0OkzFdVor5qCL76tzTOSPD0lBdHBIBtk9dprPPpaIavQ1dn5yW1MNVixYNgOIba5c3
         s1DOEtWPIvl4/ZX+ZBNkiBDEj/Ut3AE6yNsrtKGpMW3LN0473B2RkbJx2kmojyFwWIam
         4Vvsf3sEHTPSC0rP+tYjcqk2MOmVqrvyVC8RjnRkR7yK/E3C62S7GLEcIFNJIxPSAB6U
         m08ywbwyOoVJxnqde7BOMhImSBrezL/T2dAE6WnSd3njUmYeOxiGm2vufANm3/Y0D2UV
         BXXmus2IRpEJfuQUMBSnU3zfJvGKz7DuP2opu2kE9HqIaOlJs07rsbRH2uIirVMUsW8s
         1OXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784722803; x=1785327603;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5qvzOJZC5dLwV+0rw2sHYPHDnXSJxTaB22HkTCSR960=;
        b=WjC5U50HbtzSjunzOO0SYdXmeXM8lS5f0nYg5QYgqkr6wnZtQ6KkcfYW7kPzLmwwgp
         DW9IResQiRCGkCyfE9U6EDHGLI01VuU6zsd4R28Q5vuknmlW1HaFEUnqTLTV/9kVw3iW
         6qRu1ujsxlQJp4tpb/O6H1XWcCYLYRLUiMFcuLVKPcRxrRP5Z3A2U4C158IyzaWXj7o+
         67ETFON1fWZ4VrHDcEOPxAr2Z0GRqN/yvbSKO6xNXEuByt2EXvAfkSuZdOjICU+tdMft
         R8dFzTIREkApknBneaX0r1szZqWlEr4S4ZYhgsBTxJhNtN/Q8rUUcT5jQrt2eTQaxJk/
         ecGA==
X-Forwarded-Encrypted: i=1; AHgh+RqCqHSQuDyedG2Urg5lKa88nnrzQxmq3q8qbFKZel/T/7XoKY7x+olgTZ3P6RYxsb/vTHqt7f7c0cKl5Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0TM5s+w31AeIUs6gttsAPTDafVG6oH42xAXeOBnlCfANJ9oL5
	OLD40pb6UeQtqaK2NVOw5nwrFV2Pf6cynPHPyfyUplssKShyfjdaStl4ICEC0qxOn84=
X-Gm-Gg: AR+sD11CUTxij6jMUAe2jgbtphikfBhRbFYLGs1lPofE60+qLx8o+Wty8OwJqm2SQwD
	UqmOwq/ov1JQsarrrOtETVw+hRJVd1JneQE1glrmFyLe9d8Uw6MsudDKT7E6bU5TycPi8frTh5l
	W376z8J50XVkYvhTB/8NL70jO7oQSncXUGQSi3JvgEhjq+mkSLvy1BQtki+rJo2c/2vvKRrLJDD
	1U68VhwGZG/Kuu73ChyFW4WpPHziKBwaSV+CbN8+HXZij7sNv8xB4SW6UWK1PmOE+FGdoXDO43H
	CTh9ITPQzGXyrQcKlJvbDusGaYQ18o6zdmppz86UZBxZY03mcc3ClELzPQodeCZ0WIj4UwoVCGR
	39gzR0i2+a2WVxePg4w5EUdSOjY6DjvQXGegNFccduX9tYwWGl/nrBZkg8f94DJwPFf3bAzK11u
	oQTw==
X-Received: by 2002:a05:620a:2989:b0:930:f306:8275 with SMTP id af79cd13be357-930f30682bemr389512085a.9.1784722803506;
        Wed, 22 Jul 2026 05:20:03 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930f68d323asm151978385a.19.2026.07.22.05.20.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 05:20:03 -0700 (PDT)
Message-ID: <7d7938cd-80bb-448b-89d0-6ac6d2717e98@riscstar.com>
Date: Wed, 22 Jul 2026 07:20:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: spacemit: request IRQ after controller
 initialization
To: Linmao Li <lilinmao@kylinos.cn>,
 Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Andi Shyti <andi.shyti@kernel.org>
Cc: Yixun Lan <dlan@kernel.org>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev
References: <20260722094302.2284191-1-lilinmao@kylinos.cn>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260722094302.2284191-1-lilinmao@kylinos.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_052004_811207_FFA2FF70 
X-CRM114-Status: GOOD (  16.95  )
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

On 7/22/26 4:43 AM, Linmao Li wrote:
> spacemit_i2c_probe() requests the IRQ before it enables the clocks, resets
> the controller and runs init_completion(). If an interrupt is already
> pending, the handler runs too early: it reads registers while the clocks
> are still off and calls complete() on an uninitialized completion. Request
> the IRQ after the controller and completion are initialized, but still
> before the adapter is registered.
> 
> Fixes: 5ea558473fa3 ("i2c: spacemit: add support for SpacemiT K1 SoC")
> Signed-off-by: Linmao Li <lilinmao@kylinos.cn>

This looks correct.

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/i2c/busses/i2c-k1.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> index 51a0c3d80fc9..3fe716cc153d 100644
> --- a/drivers/i2c/busses/i2c-k1.c
> +++ b/drivers/i2c/busses/i2c-k1.c
> @@ -723,11 +723,6 @@ static int spacemit_i2c_probe(struct platform_device *pdev)
>   	if (i2c->irq < 0)
>   		return dev_err_probe(dev, i2c->irq, "failed to get irq resource");
>   
> -	ret = devm_request_irq(i2c->dev, i2c->irq, spacemit_i2c_irq_handler,
> -			       IRQF_NO_SUSPEND, dev_name(i2c->dev), i2c);
> -	if (ret)
> -		return dev_err_probe(dev, ret, "failed to request irq");
> -
>   	clk = devm_clk_get_enabled(dev, "func");
>   	if (IS_ERR(clk))
>   		return dev_err_probe(dev, PTR_ERR(clk), "failed to enable func clock");
> @@ -755,6 +750,11 @@ static int spacemit_i2c_probe(struct platform_device *pdev)
>   
>   	init_completion(&i2c->complete);
>   
> +	ret = devm_request_irq(i2c->dev, i2c->irq, spacemit_i2c_irq_handler,
> +			       IRQF_NO_SUSPEND, dev_name(i2c->dev), i2c);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to request irq");
> +
>   	platform_set_drvdata(pdev, i2c);
>   
>   	ret = i2c_add_numbered_adapter(&i2c->adapt);


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
