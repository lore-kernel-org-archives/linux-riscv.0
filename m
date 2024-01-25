Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D67BCC48260
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 14:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sgCO8cCNbal316sv4kgrj1DvyjS/a8hHuqEq5C9QYXE=; b=UDDlFNCSK2TV+M
	+0f9br/PCD/DAI+y0FcMQortvFFVyeqlx+20B806cGkIN8O98iRZKMUaMj2pP5B4KCYvawXdJFMQp
	bkUtlenOWWwQ389swX8lh9RStrw6psj+PtGy6L3fYi50N+HoLfMcauFg+tOXAU8ja5jhBcUaU7Ve+
	cUz6Ken4bymxNaKp62GvXQcmUyj5sPaTbBScDZml8mbT6r8n0s1qsxk0uzUJHOnb9kCkTEChNg+rJ
	WMcP1qDWQ8fOwRaOL2NMRYSa6Ko5X8XCA/hS56X/vNEHfumDWKoaqt07eSre2qjQF6kYDbOvW/xqi
	kuFZRprADPSGhV3BP/YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT0KE-00000000Cpe-1upP;
	Thu, 25 Jan 2024 14:03:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT0KC-00000000Co1-0gAP
	for linux-riscv@bombadil.infradead.org;
	Thu, 25 Jan 2024 14:03:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=aI26vRplbW/GhCDXdm3Ni3HuWgNba2vGputrnlHeaAI=; b=qCL/R1W97LkIutp4PJ3diYyewa
	aougBYxyxDs8tERSh944xxhpoHSKDh7P2LAA/90RFqx2VUznREcKG3gRho6MkQ/wNNwoLRG+0eMXD
	RJiXaATXBT3evYZSq8uJvmHex3jUQg1zZliXKO63XUP1FeADEsgtt9x3rEMOWQv9gx6geQcJX3ovD
	+p/Q0dZ4TOt0Y+AkOTGEOpp/vexcpnpkxZJ3H25QO2CKRT8bJBxBuFGQmlIlHcRwRt3/dZyYC5kRU
	DWJ6VA/a3OrmHBpbHkAfrugswZbpLRrcw65+vbQ6Sc6w+irlhCmq2YWmQ//EZzIDZHADpZTq6ctrj
	mLDhTbwA==;
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rSz2R-00000005Jug-1MSY
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jan 2024 12:41:02 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5100c3f7df1so3467522e87.0
        for <linux-riscv@lists.infradead.org>; Thu, 25 Jan 2024 04:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706186396; x=1706791196; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aI26vRplbW/GhCDXdm3Ni3HuWgNba2vGputrnlHeaAI=;
        b=HLMo7lLtpApJnwR+LFZDp1/Nbjr7lwbTvNrSiS4++0CnzTx8UtjCv47SRZkRgdxztk
         /N3I6WyQ82qjiD/tUdyl+FWE84G6GbhTjT+WmedBe1sDTHhFEErDzsn8on+6qQalfJOO
         DXnwHc50qZ6VHenchaXxeMz+oYEdvs7X4bXsTffD7f4XEd/X0Yb5ghA0s2Es3fGUipMu
         3qnFPmWuIQV47edFMR/D91Ul25JKkYvmeV8ujpd92JYePGskpdcbwrumOjG2w5zD8lQG
         l5VacnJDsa3IujuSP6enncqFzrYJre5aV0MkjkNX4HEkuPp71pVuv0BXzglgYZHvERun
         TRWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706186396; x=1706791196;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aI26vRplbW/GhCDXdm3Ni3HuWgNba2vGputrnlHeaAI=;
        b=qTteoEB0LnRZoMQlyioN0Ey2J0YXitr0pDZB3z0RWWpQckD1KrfZamRlq4tlDhLS4V
         LzRuOJek7Idqz41eV5T5Zq6ffmWHl9Y9CtQYDubRMw1RevmNfR4e4pafe5FsX2xaAaRr
         Xjqzz9AudNg1aowJkAeAkUV4Z5ZCvVv2O72veEs1ZxRFmZGeiX6Ch1RTW45DY4H/AuN+
         OgAhjthxQcrTIqKd/9wNUVG1007HJvpBEOAgERkuYbIe/sVyJ6G9nnajiaaZxxEUzo8H
         9NEMJdXfgHN14RVCNqxwu1pOl3/5QdlhY4LY3UtxIR/A5pmnA7tYHJ9mi4NgBLSgCghX
         FhoQ==
X-Gm-Message-State: AOJu0Ywrdw2LGBRSF7VI/ORvM73HnJenPgn6ozktiv4xIm3u1w0wo+qH
	DbPgJxPXCeYb3S/9hOZHcsKIG54s5k+iGUm3cy/Coa/PIgV3uwEW4KgxF3DIL7U=
X-Google-Smtp-Source: AGHT+IEtl+VtecbeiDpAaefQFqkqQ+VRih1/29/b8Qi4uWko5ioYhZPzqdmV6rPiydKp74gHaVWd6Q==
X-Received: by 2002:a05:6512:3a8f:b0:50e:7dd5:e5f0 with SMTP id q15-20020a0565123a8f00b0050e7dd5e5f0mr1035333lfu.12.1706186395866;
        Thu, 25 Jan 2024 04:39:55 -0800 (PST)
Received: from [192.168.1.20] ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id t16-20020a192d50000000b0050ea9654654sm2930763lft.176.2024.01.25.04.39.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jan 2024 04:39:55 -0800 (PST)
Message-ID: <9f9a1f5f-2104-4a5c-a837-cd8d18e173d6@linaro.org>
Date: Thu, 25 Jan 2024 13:39:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] riscv: dts: sophgo: add watchdog dt node for CV1800
Content-Language: en-US
To: AnnanLiu <annan.liu.xdu@outlook.com>, chao.wei@sophgo.com,
 unicorn_wang@outlook.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <DM6PR20MB2316366FC9ADCBC7B6E9C289AB7A2@DM6PR20MB2316.namprd20.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <DM6PR20MB2316366FC9ADCBC7B6E9C289AB7A2@DM6PR20MB2316.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_124059_466256_7B250912 
X-CRM114-Status: UNSURE (   5.72  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 25/01/2024 10:46, AnnanLiu wrote:
> +
> +		pclk: pclk {
> +			#clock-cells = <0>;
> +			compatible = "fixed-clock";
> +			clock-frequency = <25000000>;

It does not look like you tested the DTS against bindings. Please run
`make dtbs_check W=1` (see
Documentation/devicetree/bindings/writing-schema.rst or
https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
for instructions).

Also, why do you describe internal clock as stub?

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
