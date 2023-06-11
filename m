Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C395CC7EE2E
	for <linux-riscv@archiver.kernel.org>; Sun, 11 Jun 2023 09:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gcsC/hxXrQgvNzDI/SKI0ygwUWvOdnc9an6I0OsOR68=; b=c2ZJcjBsPvhkI2
	R5jJYwy8wmJ3zf9tLPlFMOlIs+f9p6sK0PKsPtqnpvkRaSlAUEdvZHte/ZOY7DTXhQM1iKcBvQISy
	hM7HlTn2egavUI9z0CTjWrZ5xjDhr+CJx+kAnns/Wj0fOAlvuDXj+d+pr4eIEasjdLyWuC76Ol9jO
	l5C4GlPRUSjVXzyK2uMCL+6VbhtrpWkiiYNaBfteCx1xkI6pL6VEhEgU1d528wH3fxnqfeACKwWkt
	/1fET/reWC3nuNs/tZiem7ezUZ7eIKvN1VsNC2Z7kZto9ECRccyIeSvDPM9wbkO+DhohJGv6PLiOU
	ftmLxokaa2RaZyTDWb+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8HeO-000UFm-0O;
	Sun, 11 Jun 2023 09:46:20 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8HeL-000UEK-0v
	for linux-riscv@lists.infradead.org;
	Sun, 11 Jun 2023 09:46:18 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-97467e06511so545326466b.2
        for <linux-riscv@lists.infradead.org>; Sun, 11 Jun 2023 02:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686476773; x=1689068773;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kgj2E8ULVnK2Tdu4A0s7nIRfjHGYYKYecJtglfc2Rgk=;
        b=jZVzqoFY7komMteaw86mZNCDGRSfWwZf+2JYLj/QEnP9wLpTt4Fl99AFTkfamxyjEc
         P3O0uuI9JJwFNFEVTS00IyOXJnemS63PPzaAGq0f+ncpBLq1nixh0zaf5hDwASAIm9Tq
         A1JSGsvwRzJ8rzGp761JUvT1X43LFthxlDZcWzXuOfPIyE+n+NS+Ilaphx8pdXdv7r3q
         6LshwE1FYIpEAYWP0jzzgm3xtdZnvz0ciEnIKPBVmEuL1pdKHSR0YcoZPR3ZedArNn5H
         4dXKrSMvzG6GE64zHkwrRgA+gDkniwTK3om5c6nz2fiVIjw/QloPVMdMQ4vs+tHaq5x6
         1RVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686476773; x=1689068773;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kgj2E8ULVnK2Tdu4A0s7nIRfjHGYYKYecJtglfc2Rgk=;
        b=knb/IzSzxDbzRdGJ6uBsBOuL8LGAKpLMDJbI4jmwzV7XZLSCJ1IIz1wyd5ScgH1SlX
         tXZSmPOhObnh7WYDZTt4RwCt5plHzNx51sAH5D/Gv8DIxz3XC+WSdScSKwv5sjarjuKs
         UQ4ceB08tv0rSM3u1yPwkJmATScXEwc+LW41UJopBDEevTVX10TuFJPIAAhCX5chc9NJ
         HJ8A6Qys4uHZ2JV0TkceO8L0etkrwncOz3wDgJc3bECcyi2u0t76b4HinUsrdFrwMOlO
         U7TbTF4xLwovsKXAxRrjSin8225BiUkMOfPc/I8JMtP9LxGt91vnornI2H5fkgS17Bj6
         6bUA==
X-Gm-Message-State: AC+VfDwHxAMXeAqRY8soE5I5jmz3s2nqLIw41r1BsewQYnLAWJ//LmXo
	l2NG/vwlqCgjnIQkbfylCIE3XA==
X-Google-Smtp-Source: ACHHUZ5rFvnEPdfaRg5ZSWf2Ja6DZrQv8duWnhdFSOc2DCo69LdKdJqe2hSqT2E0pyrAaiMALMhVlQ==
X-Received: by 2002:a17:907:5c6:b0:974:1d8b:ca5e with SMTP id wg6-20020a17090705c600b009741d8bca5emr6689735ejb.14.1686476773245;
        Sun, 11 Jun 2023 02:46:13 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id z20-20020a1709060f1400b00977e7f7d599sm3589682eji.71.2023.06.11.02.46.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jun 2023 02:46:12 -0700 (PDT)
Message-ID: <f132af34-e1b1-1278-316e-ac2c3cfbbbbc@linaro.org>
Date: Sun, 11 Jun 2023 11:46:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 1/3] dt-bindings: thermal: sun8i: Add binding for
 D1/T113s THS controller
To: Maksim Kiselev <bigunclemax@gmail.com>, linux-kernel@vger.kernel.org
Cc: Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li
 <tiny.windzz@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria
 <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-riscv@lists.infradead.org
References: <20230610203549.1127334-1-bigunclemax@gmail.com>
 <20230610203549.1127334-2-bigunclemax@gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230610203549.1127334-2-bigunclemax@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230611_024617_477722_99FFD930 
X-CRM114-Status: UNSURE (   8.09  )
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

On 10/06/2023 22:35, Maksim Kiselev wrote:
> From: Maxim Kiselev <bigunclemax@gmail.com>
> 
> Add a binding for D1/T113s thermal sensor controller.
> 
> Signed-off-by: Maxim Kiselev <bigunclemax@gmail.com>
> Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>

You are the same person, so use only one SoB.



Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
