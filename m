Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69F85C6FD19
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Mar 2023 08:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w5stHqKmqkeUQ2NbxPlab3JsIE2KzK00UQvFVOvlboQ=; b=d/XDLsXpUlIphH
	+6pFF+vjSA4vSlMbuBOU343fTm84i1Rpc9uBm330P0AGxBj+oGaq0k4uYuDjWFdpLD2/2Xzr20EQz
	NUZunPRgUMpPxm0aw0C1vvxL4N6GumrozOwDc9HJlqCFvb/+bF65vI+b/sl/3DHW3FE8ejP+R27J0
	kSr4MyNGVVZhjazpPxGE5jiY6sEwURJpuychoO6HlJ+fN5W7k1rzsVevsWu/6t+8UvPLEtR/0ONpx
	cgN/2NzcVhh0o1EcVx4AFde2lJNm4umfRZUyzOJ4qOIE7y3fOXq3DUMezytZsrbuFmr/F1Ki0hixr
	4gw1Q+cBiW/JQ3EPGEpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paC54-008fMO-H6; Thu, 09 Mar 2023 08:56:58 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paC51-008fJO-En
	for linux-riscv@lists.infradead.org; Thu, 09 Mar 2023 08:56:56 +0000
Received: by mail-ed1-x534.google.com with SMTP id g3so4152508eda.1
        for <linux-riscv@lists.infradead.org>; Thu, 09 Mar 2023 00:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678352214;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/rCAQVKSrz0FwZyYOlDSHoKDBXybcsPfi8bbV/mESho=;
        b=mK8f1i3oEKsmSI+KJXHLoeP4iU9lhs0wLs5rwKmiO0qzJmsemC3CTF127p+dVSfgun
         CgtaLKak+dzzOcmif4JloBuwnvWR5UemuUqKDPjCLH/AaP7kD6SmVUx811o6bh9fWnMU
         r62FCgYzzQaqIJHOJTp7aSWBNgaDm7WoG64ULr3/QGZAliorhMNYqQdKY2ErX7O8dV6V
         U+/AuBR7Ev6/mCENCo7KMBFp9DVch4Qq5pKGJKCh15Tvx5y7GEMyJSNGeUWV0QZxrTn6
         y2+K4ppCy5qdqqwfNYsokCF9rpTze92IQgzKfkmrs0/mTtiiDYr6MYB4CYPbf0I2TVFx
         3J0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678352214;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/rCAQVKSrz0FwZyYOlDSHoKDBXybcsPfi8bbV/mESho=;
        b=kAmqLVzQtw2w1ehBXu2Yec9a15s/y15XS/XhdUTlt3R/tquPGyFL1I9DpIMCAJjmPk
         OlNgvp78Gz97/wtPdmfvCR5woS55qI/+3s3qm11elId5NwA3TV8zS5jakJqLtVtDpJk7
         MXtFeQgcF7p/bxTC/r+vMHShSSgXvdHfp3idCkVBgR4Jfy3cLo/hKGMwlXSDpj3xNY8T
         QHyVWaAXmA8nt6leQh1tJ1aqMg9G4Kda94kjVHBcRxFJzvwkb3T+BLUQOnJmveVjdaN4
         VB70owWnmjzxiRz70iNS53YkxbjHZdfm3WdB8ndmtgUOGYfaItI3hmI77JEw7SSDRy5E
         WXzw==
X-Gm-Message-State: AO0yUKXtMpDyakyMN2MT68QOlZVIRylYXYGdX4uzeYob0l3DKacnVeH5
	JmtBQFYf/HLlwEYmImVRSJ0qfw==
X-Google-Smtp-Source: AK7set+fDQpPHW8bqOKviqoGm8B/ByRW0DS3O8BeIg8fcotXryimjWinXMwZURKP6vy5S32ngtiqZg==
X-Received: by 2002:a17:907:3da7:b0:8de:baf0:338c with SMTP id he39-20020a1709073da700b008debaf0338cmr23213386ejc.14.1678352213882;
        Thu, 09 Mar 2023 00:56:53 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:7ee2:e73e:802e:45c1? ([2a02:810d:15c0:828:7ee2:e73e:802e:45c1])
        by smtp.gmail.com with ESMTPSA id ga2-20020a170906b84200b00882f9130eafsm8491562ejb.26.2023.03.09.00.56.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Mar 2023 00:56:53 -0800 (PST)
Message-ID: <94b3f478-4806-f2aa-eba4-58f4b5bbb00c@linaro.org>
Date: Thu, 9 Mar 2023 09:56:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 1/3] dt-bindings: watchdog: Add watchdog for StarFive
 JH7100 and JH7110
Content-Language: en-US
To: Xingyu Wu <xingyu.wu@starfivetech.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>,
 Samin Guo <samin.guo@starfivetech.com>, linux-kernel@vger.kernel.org
References: <20230308034036.99213-1-xingyu.wu@starfivetech.com>
 <20230308034036.99213-2-xingyu.wu@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230308034036.99213-2-xingyu.wu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_005655_535403_A6A313F0 
X-CRM114-Status: UNSURE (   8.02  )
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

On 08/03/2023 04:40, Xingyu Wu wrote:
> Add bindings to describe the watchdog for the StarFive JH7100/JH7110 SoC.
> And Use JH7100 as first StarFive SoC with watchdog.
> 
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
