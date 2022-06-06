Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68214C433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jun 2022 07:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DgmI9ky4n9/AtA7Ot6nSN0F33/4cmm9XMWd3yeJUvF4=; b=e/PlreNmqQ2S4V
	JDiXfPAU4CQmKO774h2jPGY6oe3b6Y7loyqEdMqTpmPA8TVwmO0W/tiol/SMULj9D5n2qxgc7KmfI
	HuF6+GQeN4IsbTUDQUOus++gN20yohPICS3i2NyTlmRvx2QWjAbyTHZZ0I4bR8nYw7hAFK40c/rhV
	GxAD0vI+z8sZgYNA5c2ShP2ykOYqXO6gbPrsrGgZ2osisR6MQV/EvSt8phFBZyKrBKyhABzAkHq3o
	aHhR7Y9/lvuWRkhRFR0iK++LdGZQDoKUaXZQEIblyGFoiUxLCGhGKNF4wAy0aO/GSNLd7z2hnNRwV
	Uk6XJBJBU1LgIVTGsg3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ny7G4-00HVwl-OU; Mon, 06 Jun 2022 07:34:40 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ny7G2-00HVvs-CW
	for linux-riscv@lists.infradead.org; Mon, 06 Jun 2022 07:34:39 +0000
Received: by mail-ed1-x52c.google.com with SMTP id w27so17584460edl.7
        for <linux-riscv@lists.infradead.org>; Mon, 06 Jun 2022 00:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=f+ScugHy4AlcscEnldL2i5PmbfvQGH4t+6gM1Or5hQU=;
        b=vClp7zDdiSSua3oBwwpibNjZV1/FgtOu6YjrqDwUTJeboiE7xMBaRmFzZMij4Ifk4V
         wi1bRx7Z9cZm8iePc4KGYsAxqQaczdTNO0TuWLC8sfYe58H85wFqY/tTJYRNnFpoENnd
         q/Q6OcXje+KY0K+IBjZYvdv9ubDHESPmjIzGv/ZQHo5WiZzovNe1QccTp6zliv/2bjRy
         8bO8xx8Rx5LzCmfv8xmrsU9sHqkxzHw14kni133wgXHF+3wjZDjumWn+4mZkQyH+ygl9
         Od415jviG4Ua4gqf4lZaqwnvChKc2TkvTQaRd05vx77YDjoRUphETVbVnVhB5QUpH/9Q
         mVAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=f+ScugHy4AlcscEnldL2i5PmbfvQGH4t+6gM1Or5hQU=;
        b=lwqbwTX5lc8pUBr7PvywoopLyfk4pjeHxXAeh/ZkJ5AgynQh2tawnvYrJvp4M+KvNX
         3xhv63e2dily6/XIFmDfyLq7RcRwtolPUeVTzaeyDg4RXmoDdU5y0CJdqlLN4c8zPZzR
         VaOre9QE7XmqNyRUHbahUQB2pQgNprdN+3D9ygLe8q+9+zok+4Da+8uNkNlC4uW30QbK
         ML3WGG4IG/aWmrU1OCXc26pi6fzbQ3bjTJ7K8lBf3YS1nj4huio5rnvrYykvE9lhskJ4
         VUZ6WqWf3oblS5yhLGCKzUmpDE0DuYSerxfuvb82rqR5q00UTa2FDtSkIRMM67GmI80Q
         HO0g==
X-Gm-Message-State: AOAM533QWo9QkCouBC/i9cEcEE0/Myfa0u0VN+qDj2Mg4Zhn3rpCAPPw
	pYGt7dvblT8+C/NLGc5wHMquPg==
X-Google-Smtp-Source: ABdhPJzsdrYxbqs5FgA4BhHAFfwRp0nwo5WvSOzpYDmPzZFoFqOex6Gm7p+2PUm7Ju5jyIpMQcx65g==
X-Received: by 2002:a05:6402:1cb5:b0:42d:ddda:7459 with SMTP id cz21-20020a0564021cb500b0042dddda7459mr25843817edb.16.1654500876277;
        Mon, 06 Jun 2022 00:34:36 -0700 (PDT)
Received: from [192.168.0.181] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id f7-20020a170906560700b006fef5088792sm5980417ejq.108.2022.06.06.00.34.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jun 2022 00:34:35 -0700 (PDT)
Message-ID: <a83be47b-4cba-e397-51ba-c2093fa0d46c@linaro.org>
Date: Mon, 6 Jun 2022 09:34:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v1 0/6] clear riscv dtbs_check errors
Content-Language: en-US
To: mail@conchuod.ie, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andrew Lunn <andrew@lunn.ch>,
 Support Opensource <support.opensource@diasemi.com>,
 Lee Jones <lee.jones@linaro.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Steve Twiss <stwiss.opensource@diasemi.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-riscv@lists.infradead.org,
 Atul Khare <atulkhare@rivosinc.com>
References: <20220605133300.376161-1-mail@conchuod.ie>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220605133300.376161-1-mail@conchuod.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_003438_476638_B1D0E5D7 
X-CRM114-Status: GOOD (  11.76  )
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

On 05/06/2022 15:32, mail@conchuod.ie wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Hey,
> Couple conversions from txt to yaml here with the intent of fixing the
> the dtbs_check warnings for riscv. Atul Khare already sent patches for
> the gpio-line-names & cache-sets (which went awol) and will clear the
> remaining two errors.
> 
> Rob/Krzysztof:
> Have I correctly expressed the mutually exclusive properties?
> I had a look around, but wasn't able to find an obvious binding to ape.

I'll take a look.

> 
> Wasn't sure if a txt -> yaml conversion's MAINTAINERS update was meant
> to be in the same patch or not, so feel free to squash.

It's the same patch, so please squash with next release.


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
