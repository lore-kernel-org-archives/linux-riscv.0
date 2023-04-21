Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88396C77B61
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Apr 2023 16:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uRHwX24Gl87l4v1fZbSIYrvWG4jU3m9s/hLYZ+ZRK1E=; b=VvQEGRhktFOMSV
	hfIZhsH/nhERVYSdZ/ctPELYwxsXNKzozpLtQ6V0JMKSj9Xh8UjjlDgCVBPMnlKnVbmp7A+9cnUAU
	uvOG33ZhwYqRgIJ/lOnQFvNsKMDyN3TA7qzaeZ+iu9e2SMSfG+0aEshZyQfY3f3ejWgsa23zxHzmB
	kCEFNcNHgMvnNY3dQbb9RhxiHhzOWY4GH980ZEqCsaEPEOl6VBdGbDV58R8Q7G5HNInpUE54eE2NK
	dGc3SIkwd9nIG5eZ5QtNYYe2ek8V0bFtKbDUgG3RSZRojWUgsAFxapIpSWUaG25bcZU1SFx4CQiPn
	vUlvLzqsqIQy1j1IPPyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pptmU-00BPGR-24;
	Fri, 21 Apr 2023 16:38:42 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pptmR-00BPFw-2v
	for linux-riscv@lists.infradead.org;
	Fri, 21 Apr 2023 16:38:41 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-504eb1155d3so13805151a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 21 Apr 2023 09:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682095117; x=1684687117;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f37z8CaRZJ71kt5G3XjzfdmlNPZE2d/uOWK39okAU54=;
        b=Yh+uT6I/cylCmOik3uAz+q7RnLYjpKL0xi2y7M3WWvKnZ/zvaMgljyj90TsRzp/sag
         6dWZEKjPfLlrTh7Lhuo7ZAueaUYXJ6CEM1ALziDuumr8u5OEQKYQpl7l5KpMYGBks1nr
         Fu9UDEx2uKV0YzlYyxW/USkR4ZDz96BoY1HkzGMbuTNLKPyyVF+1XSQSX4P5Z3GnJCEQ
         Hh1zHpOslffWEC4w8LonVQU/udxu9P1Yd2H57zHY27SITEzj74L+Ep5vxDlBdVhWiwL/
         mtGcg1ZSav168p+nsNz6gDRCcvmiNE3U6G1ve0WjR9N0v7BBrOvZCtpetCRaXpNrTVUG
         So7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682095117; x=1684687117;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f37z8CaRZJ71kt5G3XjzfdmlNPZE2d/uOWK39okAU54=;
        b=FdV/7fnJss9sCsC9R5EYIcgX5faT17Z280GbALm25VmYIGT9S6WbFdNwzvdtR8uMha
         oerkubY/uxOtyCVazkG9tgLtxbc7wO/9CWTwYJ6cCwgKMaB/Qky7I49KkAxBgNdJ5g1i
         5evdCmVzptvsSvBLhXM+LAl66Vg6XGan5XwWdJONtc3Pr4MTkiNCMSVrQwys4v5UzW4p
         u7B+owt9mSkIu5R3q23cTCpP5Rlz7EtEDNe7JtznqwulXiBAg1mwYTHJr2rCQQH9IsQE
         lxdWSMgxz9dj/P4wc/DSaOypetU1XVl0k/8+tSvy1dmFoaij6PQtrSiXnosYWKUmeosl
         RMTw==
X-Gm-Message-State: AAQBX9e39cwPBBnguHXpt5WAu0bJkTH5EEkvOvJGmOMtmH1fH1+1XpeX
	zXKQV6MhdIIQy5zSRm1qCRBuVQ==
X-Google-Smtp-Source: AKy350Y5t2Mc35ymMsh34woQ4uOvfYlOh9Dztn2hRVclw2MWmuBmIVK6FrtfRIKhUxRdQZI2OGeFeg==
X-Received: by 2002:a17:906:a007:b0:933:4d47:55b7 with SMTP id p7-20020a170906a00700b009334d4755b7mr3158319ejy.2.1682095117535;
        Fri, 21 Apr 2023 09:38:37 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:687d:8c5:41cb:9883? ([2a02:810d:15c0:828:687d:8c5:41cb:9883])
        by smtp.gmail.com with ESMTPSA id 26-20020a170906101a00b0095729352bf3sm802923ejm.215.2023.04.21.09.38.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Apr 2023 09:38:37 -0700 (PDT)
Message-ID: <246b2227-91c5-5425-7af4-b2d082f76fc9@linaro.org>
Date: Fri, 21 Apr 2023 18:38:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 2/4] dt-bindings: riscv: Add item for StarFive JH7110
 audio board
Content-Language: en-US
To: Walker Chen <walker.chen@starfivetech.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20230420024118.22677-1-walker.chen@starfivetech.com>
 <20230420024118.22677-3-walker.chen@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230420024118.22677-3-walker.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_093839_942703_10885796 
X-CRM114-Status: UNSURE (   8.17  )
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

On 20/04/2023 04:41, Walker Chen wrote:
> Add bindings to describe the audio board that works in conjunction with
> the VisionFive2 board.
> 
> Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
> ---



Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
