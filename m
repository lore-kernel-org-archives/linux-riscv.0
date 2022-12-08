Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 558CFC4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Dec 2022 09:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g2jziivpWj6GbU6OKLyPlEjse7FlwihoVJWCRBd7lZo=; b=UBljlmOitXuwB2
	Xn43yTy3O4zM0DcMdvglLoZx3rKltUw0y4tGmKqfj2iwBwvhjV2PYv5MtJxFlZYlicKTaPdF7r2Oe
	PzNK6UNZOOLNp+qWyY4d+99WC+ZEd8N+a44zZkHCnS1TKe8k0XuHAAvKPFPclSagD3P0N6PuAWwzw
	E1nUrbKowAt+ZdHj41vyWXA7up5tFzwOOwKS2V968mjAZtaf3khRrm00/HGlXEiazM2mmD83ludeq
	SN8QKd55AwTFp2azOymx95e9pQncAjGd6tZwx4ExpekwB5Sb8F5ISAgRzhLOinIdDpV4Sp2/1bgwx
	Gb/198JT/kRiFcsYipIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3D5I-00Am9Z-L7; Thu, 08 Dec 2022 09:20:52 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Cob-00AYHE-7z
	for linux-riscv@lists.infradead.org; Thu, 08 Dec 2022 09:03:38 +0000
Received: by mail-lj1-x235.google.com with SMTP id a7so845759ljq.12
        for <linux-riscv@lists.infradead.org>; Thu, 08 Dec 2022 01:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zEvaXwfwqSzOoHW10MEDPIfbZ9OLutRaMA8i2YGQwvI=;
        b=aIkzLftuSRZKtfnIFiekFOrwTJsxp/QyAB/6XfYm9E8xgXWpK5EanAZgNkhW46QHHf
         VVM1iI9wQ0q75uDJ+M/wrVlDiTmDzgioer1m8oPZGz9FHyBD1cvbO7sHWsvcHkLUdfdN
         WpOdRHA+UlcX/Xy92NaFlZhaTN/0LcNyTX4OF5gQ0ZJ+tYanQLuZG8NJWT9N+fkA8upT
         NFjAO5+Mi3XvZ57qdoZOQzTM5Geq4b/F3RXVV+fBoYWy5JeHfNi83fM50q7jZ67Fs+Z8
         LQ0FiJHYcmB6rUYz46nUZJJPPDZ7az9LSvOEgIohRWsndh5RCrsybkYz8LaZ5pl6dc7H
         tUHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zEvaXwfwqSzOoHW10MEDPIfbZ9OLutRaMA8i2YGQwvI=;
        b=TttQ3BXhQXbP0DCFrokq12Kf8jFdJFYYpGOR4O4mfQblCFSvDM+C0/GpQumtWzuTVd
         7qy4Hfv07nA+Zb9iUE9Elk1qrmA5RTBnxPbA6/07oWOXEwC6CRNp5fO6QDF8aq7GdPaY
         mUaajkFB0czt6nMU/G3/fNcRLf1anXsj+saP5yy0Gjro6yDjANXU/gOI4D6RhvQIyU4+
         uPzHRE/ZZQppjvi8R+LLPltiKHksdKogkz7eZx1o1/GJ7t1S9+i/Iu5zJ0oEZAxcIVEP
         /eO3GGpK/zv/DkY7z+2RiqbTkWObLnXp3zrqQM4lLoD4OF1qm2+TCKr+vRAiOp8siIaQ
         1JIA==
X-Gm-Message-State: ANoB5pme4F9xJffsJR7jQOCvMu8E0htZWpMWJUiQrl/gxF6rqzMsufGE
	wLn4yHW2AVogb3/TFzecoSVvDw==
X-Google-Smtp-Source: AA0mqf6O33YWpaLk6sFSSTi+41ETMZdxHV8vPSwu4LnLTcj1qhWk9Zs4fkhnpaXAEDKpj5+y+hfk4g==
X-Received: by 2002:a2e:a804:0:b0:277:81ff:c2c7 with SMTP id l4-20020a2ea804000000b0027781ffc2c7mr27471475ljq.23.1670490214614;
        Thu, 08 Dec 2022 01:03:34 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id b26-20020a2e895a000000b00279e0b8bae7sm1689484ljk.65.2022.12.08.01.03.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Dec 2022 01:03:34 -0800 (PST)
Message-ID: <ac374e10-fb5b-c56c-7c76-b131446533fe@linaro.org>
Date: Thu, 8 Dec 2022 10:03:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RESEND PATCH v2 1/3] dt-bindings: power: Add starfive,jh71xx-pmu
Content-Language: en-US
To: Walker Chen <walker.chen@starfivetech.com>,
 linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org
References: <20221208084523.9733-1-walker.chen@starfivetech.com>
 <20221208084523.9733-2-walker.chen@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221208084523.9733-2-walker.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_010337_355338_607AC5C7 
X-CRM114-Status: GOOD (  11.83  )
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

On 08/12/2022 09:45, Walker Chen wrote:
> Add bindings for Power Management Unit (PMU) on the StarFive JH71XX SoC.
> 
> Signed-off-by: Walker Chen <walker.chen@starfivetech.com>



> +    };
> diff --git a/include/dt-bindings/power/starfive,jh7110-pmu.h b/include/dt-bindings/power/starfive,jh7110-pmu.h
> new file mode 100644
> index 000000000000..73c6a79a2181
> --- /dev/null
> +++ b/include/dt-bindings/power/starfive,jh7110-pmu.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */

Why different license than the bindings? MIT is pretty compatible, but
if it does not matter for you, keep same licenses as bindings.

> +/*
> + * Copyright (C) 2022 StarFive Technology Co., Ltd.
> + * Author: Walker Chen <walker.chen@starfivetech.com>
> + */
> +#ifndef __DT_BINDINGS_POWER_JH7110_POWER_H__
> +#define __DT_BINDINGS_POWER_JH7110_POWER_H__
> +
> +#define JH7110_PD_SYSTOP	0
> +#define JH7110_PD_CPU		1
> +#define JH7110_PD_GPUA		2
> +#define JH7110_PD_VDEC		3
> +#define JH7110_PD_VOUT		4
> +#define JH7110_PD_ISP		5
> +#define JH7110_PD_VENC		6
> +
> +#endif

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
