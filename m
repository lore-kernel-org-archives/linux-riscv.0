Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D74CDC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Dec 2022 13:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=333nZZAxk5G/GxejAVvWjeDm+h5kRlB1jkJHLWQl8Ww=; b=E7WX8I4D40EORY
	w2BMo0qhf6Tdzc47e/DjU8yX8PruUQrgOgDir0EA6NRtfrg+hu3uCB77ADWHXfW1chsfEcUwp3QeQ
	T40s6ensa0nsAdwB3Xm5jDl9Ut/nWY2KofrURFnFxNwCvIgqPJ7z4puTxdaolT+g1qje/ltoFLCZ4
	iL8MKX1Vz8hDkn131dc9w6DLsPGSNSQA9HGspj8qC9w/QHgRLyoK+Va7ShPDoACFRfWvP/INNRrj2
	RUzeORVfhKf8SIU1TurdsdpBD0aqS47gcdTuIdqsTWa51wXza+0GPlfXXXcsCDO9uNChxLai4+Okk
	cIEnrUdouazNxm1dUr0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pA9oz-00DC7S-B0; Tue, 27 Dec 2022 13:16:45 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pA9fh-00D7pA-4S
	for linux-riscv@lists.infradead.org; Tue, 27 Dec 2022 13:07:14 +0000
Received: by mail-lf1-x130.google.com with SMTP id y25so19548538lfa.9
        for <linux-riscv@lists.infradead.org>; Tue, 27 Dec 2022 05:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fryBc2ReBKYkm7biN0NMY5X+SgbelRAYfE7u3q3Vjvc=;
        b=g1+FfsFLLO3Au2G2wQyk+87Ld6OTtPTu2OndtMJegNU20G1rTnG0h0PB61VJ4AhU4m
         VFv161Um8Wtc4TPXv/gOObd5JhEtosjD1hS/0yTSJZmkSZ5CeQFGdUhL7sch8k4xHqj3
         H1DvbfoukxNChz4bTCYSaKQbAbI5PfNqibuCDeapOgwB9abfSyowXdQjIuMNcCnu6s7h
         4PM2ToaHrf2kTR0eAJ2Bm5NcVNHJmKJRYchXCTRcyr19A0OmFgXChM2O0COzcHDvpPNk
         KTFVQXZs27Vci23VfQ4fmimwjET/uVnnUMsmmcY6JqnJZe+zFr46JsCRh/Y9nNVa3bnR
         s+9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fryBc2ReBKYkm7biN0NMY5X+SgbelRAYfE7u3q3Vjvc=;
        b=wDyyJI7CHzzjeYKL5d3k1/Kmvlfz2dfZlmvx1H9OjuR/lrOihXUcKswo2Gm6HWHgl0
         +IAdLWCps+91CvLTRGBtv6VvtbUT4fY8bqtcBSGYgAjEEzNx9iQzGCyomvxgO4dhkY53
         rCF3IjlwCM4kMZkD9usMCbvWLo1UxYV0sqN6af4SaD6oVqM87mqdi4Akqk+qgX8xSlhl
         97OLGqwXhIA0Oi8/cwbtAiwySd5/dXhI1XlRw1WVmgMC17V+t2WE5OmCGvp0M7uBNr5Y
         1zg6dGaJjjQ8LBwmK1RVcCsnHDa9U6+SYFnkIfuxdmIgk1dPm8aLv6aAMXggqsEe2V5c
         avMQ==
X-Gm-Message-State: AFqh2kpwEhUTIq0wCnZ0c8c6ut1ut95h1ASn7qOg+qp65714A+RqHcQ3
	z6ZShaFqAdDVfaqzYxjTmRgDPQ==
X-Google-Smtp-Source: AMrXdXuEJ2vq5a5iMYzw9r11cWpAKWUMFX8b3JRMjpyzCwOIaKmFhfpmQPHLLXnrMGdf3awwezLogg==
X-Received: by 2002:a05:6512:210c:b0:4a4:68b7:deda with SMTP id q12-20020a056512210c00b004a468b7dedamr5468462lfr.54.1672146423528;
        Tue, 27 Dec 2022 05:07:03 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id q27-20020ac246fb000000b004b48e0f619asm2295003lfo.48.2022.12.27.05.07.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Dec 2022 05:07:02 -0800 (PST)
Message-ID: <02e8c75f-658f-320c-7c90-64ccf2beccbe@linaro.org>
Date: Tue, 27 Dec 2022 14:07:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 0/3] StarFive's SDIO/eMMC driver support
Content-Language: en-US
To: William Qiu <william.qiu@starfivetech.com>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Hal Feng <hal.feng@linux.starfivetech.com>, linux-kernel@vger.kernel.org
References: <20221227115856.460790-1-william.qiu@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221227115856.460790-1-william.qiu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221227_050709_321074_8E4BE97F 
X-CRM114-Status: GOOD (  10.60  )
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

On 27/12/2022 12:58, William Qiu wrote:
> Hi,
> 
> This patchset adds initial rudimentary support for the StarFive
> designware mobile storage host controller driver. And this driver will
> be used in StarFive's VisionFive 2 board. The main purpose of adding
> this driver is to accommodate the ultra-high speed mode of eMMC.
> 
> The last patch should be applied after the patchset [1]:
> [1] https://lore.kernel.org/all/20221118011714.70877-1-hal.feng@starfivetech.com/

It's a duplicate? Why do I have two of them in mailbox? Isn't this v3 then?

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
