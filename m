Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04349C636CC
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Feb 2023 09:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A4m5p8V1Emn7+3G1R7Rluxx6Q+BU9NyAJ/28hkuQgpA=; b=eJ4urlsZEb2JG9
	nuw+dkzYT3f0ro5jsdrALsFwU88o3LY+RZbxDenFBaC0lTYbnpHVb9RTx9phnaomGjRGnvh1zLc39
	DA53tQ2rK3X8WvroPW+6ILS4Mt7HNRNxNKAZchw3P9D9rthfo12E4QrxzNng8q+ysB0mGp0ncPKp1
	n8tmv6ZRVLEQkV4cc4yJvBgCn+/i1XSH6u+Veo61ifULjYXBqc8Msqw75cITpiYuFgmXWVMimim+n
	zje05TwQri8kQo3XeDHr2KVHKtF76wZQadwJiFJkMADUvFjSs7z/L+seAz+zOPPjha7qJttz1DuZp
	BLVIYBI6Ft/y/ofmV0sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRV3s-00DpGZ-Lz; Mon, 13 Feb 2023 09:23:48 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRV3m-00DpDh-Nr
	for linux-riscv@lists.infradead.org; Mon, 13 Feb 2023 09:23:45 +0000
Received: by mail-wr1-x42f.google.com with SMTP id k3so3766130wrv.5
        for <linux-riscv@lists.infradead.org>; Mon, 13 Feb 2023 01:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cHoRZcfHnIFM/oC3aOpK3TRch8E+QyoPOEKfxdwkBv8=;
        b=KoDMYqGadRN7PsbcW9GwxNijCYtY/+rQK2zDk7nJQcE1QA2dP049DBiOqVnnig+9Cy
         +FveKLRo76vu/dhorjmsfqKskxbu2Vx8oekRd72gpDbZYSPXJ9o2WnU8OmSbb0+aDdsc
         IRP2L+1znjb/SUtUD4X6zbxGyYft3Fc43vZ0TlNunnuCeAuKhlrlCw2Ihgsi7H632u5C
         4qDd8ULILsIncDdioChS4WYvKKyt0OFfHWp8OtAIOHdMl6TQtEbm6P+t1lF87aOHiwss
         VPJdeIlDtY0tRvCBShC8O0ufhE5n0W7LStEO8OCgE5zfzMxvOx8fekOTwFqXMFc0+KPO
         +2sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cHoRZcfHnIFM/oC3aOpK3TRch8E+QyoPOEKfxdwkBv8=;
        b=wGZYKBAsoRhwtOEnCEftRctwO4YsdnAr2hwyO3kH0mgmw8VyQHAavuNBROBYf0ZStq
         DvWtoi8LYkL4Du0bpsbKCdImREn7QWrqjWjO41pv/dT6PDxUG7vzoV3oQ26qQzAblLzl
         ys+xgv/1BUDnAV72gxFv94LAwV99fwTz/3zZngvu24no9HDl36+JBuDaqrhQ/wVc82rp
         nzsZocNpWfi5A8bIbDjgSPe4hwgKS4ytjB79HUYMA8f21e2UHptg5W75utTtF50b5zJw
         ZChXOjvS0aOyxFJb7AlhJdtGaTn/JLMlPkCNcns15ibYyZAp31YNaqfP3S5fGZJQ3Pqd
         oOpw==
X-Gm-Message-State: AO0yUKVe/BEWfU91i+5KZ8ZzQvB+PNI/yAvXTDUwHlrm5orY4+gieJ0v
	unfL2GEPVYf+ZiRm54FE8ywJrw==
X-Google-Smtp-Source: AK7set+5J2AHVY7RTQkkXF+Kq1camPxBbxMZhhHAmk/fwsI1GQPGvSOL9sQseWRnR6eKLc1S3b1XlA==
X-Received: by 2002:adf:e442:0:b0:2c5:4fb2:80a8 with SMTP id t2-20020adfe442000000b002c54fb280a8mr5675765wrm.12.1676280221262;
        Mon, 13 Feb 2023 01:23:41 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id p24-20020a05600c1d9800b003dd1bd0b915sm16209935wms.22.2023.02.13.01.23.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 01:23:40 -0800 (PST)
Message-ID: <44d672f9-2a79-4291-9ff8-7b3a48e61c16@linaro.org>
Date: Mon, 13 Feb 2023 10:23:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 06/12] dt-bindings: mfd: syscon: Add StarFive JH7100
 sysmain compatible
Content-Language: en-US
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Sagar Kadam <sagar.kadam@sifive.com>,
 Yanhong Wang <yanhong.wang@starfivetech.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
References: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
 <20230211031821.976408-7-cristian.ciocaltea@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230211031821.976408-7-cristian.ciocaltea@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_012342_837474_C453B2D5 
X-CRM114-Status: UNSURE (   6.00  )
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

On 11/02/2023 04:18, Cristian Ciocaltea wrote:
> From: Emil Renner Berthing <kernel@esmil.dk>
> 
> Document StarFive JH7100 SoC compatible for sysmain registers.
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
