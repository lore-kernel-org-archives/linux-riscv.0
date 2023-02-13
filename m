Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94983C636CC
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Feb 2023 09:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=USD5m7Qmo6KicRO7njNBzYKWVMwWPFXYsVsUTlQeqHs=; b=gWjK37/FK+XrmB
	hHE9d8hksfqO+V+vPjxejMMKV0zvlbgCj9OhoHVOmx36PCRtIQGVnxpJnxDXSk4wNp+sS3uLEOx3R
	DfZH18ZGTmzMWKIuTfbGTC89KvK+MFj3wnofjPbwh8eMzGimCWYdJjRBykzcTZ5qLx26sDSG+4TAX
	oji+u3eD+lqOzzNaNT2LyS9UqqXed1EIFOCir3NBeJJR1wy0umjWvahkZW2ifE7blMYcG1au37DyN
	0Quv1Vwnw3XD9LOV3umtu4XGGMbcKg5pQ6FkhXGCCNhoNfQFY5KBJpJiXcOUgewsY574SBPzkt5yj
	203+B3ls3jCl+YWUDQCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRV3c-00Dp9a-19; Mon, 13 Feb 2023 09:23:32 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRV3C-00Dozx-Qw
	for linux-riscv@lists.infradead.org; Mon, 13 Feb 2023 09:23:08 +0000
Received: by mail-wr1-x42c.google.com with SMTP id k3so3763973wrv.5
        for <linux-riscv@lists.infradead.org>; Mon, 13 Feb 2023 01:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nceynFwfOSQ9gK3dwBYGl+Y9+g5oSlogmBdnLLAMDvE=;
        b=qF9OgKwoIo3IN1BRJSx1gzKZ8I4VRcThWO2fHPpvwU/3bFl/NndvGECxwJCyvo05tD
         S6hmSGetGMkTK1MSG4AkXFW+t1rV7Adxnv+oGwp5L7s//YXWBqku8JzYmTVUWZ4+XG18
         IcZp4C637ehPWZONZ0dTO256y5ayeOOcNR41VtTYZsRizzcPOiYKg1tanzLmBiYnpEw/
         TjzrW5HsIu1uqQ1Eq1w9deYclwP+PH2A8juwEUrwXSLWEF8ngX07zdhgK9wUHHo3Opra
         l5jcyE/Bp886nNY/JyOQjsypQB9pLUme36IO70cvMByt/5R6yoTD7zx0ev38D5a8LKf+
         bCEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nceynFwfOSQ9gK3dwBYGl+Y9+g5oSlogmBdnLLAMDvE=;
        b=zueNpPhh0Mse32EzB/1mMMZNNLu7sohH2+HXYTViLbfXgxkbe8nLn44SzDZEoNh+o9
         bDWaIjCOBCEUjncuLY4WICXHCYJPGA13HfDJv8LOYWbRMvAPzjbefKsksxCPa61QX0h+
         8DRDAIxzw/F/YDP1cokyXakmB8HeYXkjBSHHOTm5hNoOJXJbcCoYCHn5WZL6C7DF/E2Q
         zgsMlJqMd6xUwMWpxToozKzfkkKCQit7Jn205pJGSw9nE/yqSyfcmnXLVtNDtMFMgYhN
         r45chy2siHVY4uRuc5UqMBEX9w2cWRPZayaBGzyQsWRu3UPK9eIBsUUl8cLtMYelZgTe
         9yXw==
X-Gm-Message-State: AO0yUKUMVul41aoFZMqTa431o5BGdesnPmlAXyCdsbpmhUlfyyFbF8iB
	WzBfB9XDM2OcPirNI8SjORHKsg==
X-Google-Smtp-Source: AK7set/WMjt6si446XYviUem9Dvz4X7zmBCVn/zBEupkIDEh5g+cbzG/LyjEhdhl1+XKTXHF20iTbw==
X-Received: by 2002:a05:6000:1f8a:b0:2c5:5297:24ae with SMTP id bw10-20020a0560001f8a00b002c5529724aemr4519362wrb.2.1676280183186;
        Mon, 13 Feb 2023 01:23:03 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id o7-20020a056000010700b002c559def236sm1438290wrx.57.2023.02.13.01.23.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 01:23:02 -0800 (PST)
Message-ID: <c895f199-2902-4c22-2453-829d946a8d11@linaro.org>
Date: Mon, 13 Feb 2023 10:23:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 02/12] dt-bindings: riscv: sifive-ccache: Add
 'uncached-offset' property
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
 <20230211031821.976408-3-cristian.ciocaltea@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230211031821.976408-3-cristian.ciocaltea@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_012306_891261_EC667BF8 
X-CRM114-Status: UNSURE (   7.56  )
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
> Add the 'uncached-offset' property to be used for specifying the
> uncached memory offset required for handling non-coherent DMA
> transactions.

Only one offset can be non-coherent? If this is for DMA, why
dma-noncoherent cannot be used?

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
