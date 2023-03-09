Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF0AC6FD19
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Mar 2023 08:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mDDPs/dzo7cokrVtA7dou2/9RWD+Qmnm++67tGMIGFU=; b=4OITIAWVYyD0qw
	8kspHZa3Dm0b1rK/Zd5ZFT32HRnqm3I4JwayUog2DlPV70BU1VBKczNncDnYhAeMZRaIbSGRbpt3g
	/ojMl4/jmCpz2sCqjSCURtG65a2yOKSN5AkojyF27DRDzvmCJrd0RUoQA+pHy4Pyrc7IsShkk5Odj
	fnSAgdTGibBUuTn8AqjGb4o0ok+ZjjD+ZetpaLW24wF6Uz4gI65ii+Yg1apUk30HleLVxOwLMcITR
	jQkCaudQqo4Xkz23QGvMSAO58+V69uISs6II2O1m9jE1rPzX9xh5eMITahO7CWit8S6iSp0jX1rhS
	ROT8IlFhnp9u5/eA/wUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paBkR-008YpL-77; Thu, 09 Mar 2023 08:35:39 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paBkM-008Ym0-UD
	for linux-riscv@lists.infradead.org; Thu, 09 Mar 2023 08:35:36 +0000
Received: by mail-ed1-x535.google.com with SMTP id o12so3837589edb.9
        for <linux-riscv@lists.infradead.org>; Thu, 09 Mar 2023 00:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678350931;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+NyMJX4FZ3z6nATgV0EdUV/35bcDn63ExD7FXocSHwQ=;
        b=beZxlMjCfAyByrqCP1yZUFN3nwrIP2o3p4mKeKmm/2jtSRKfQ7vXwtbBZnUkU0oT1o
         G3kvpfp3/muQrnx8BzSSfSCz/VVIjIPMh/pzZ+UEruH11fmEBtOf/9lkHn3aws0fgjzQ
         NiI9ysN6s+7pSI3mUEpf8v8t44TktAhR5xtgLKqu9a3cbP8gBs8UGdvFbgFf+uQ3rHzI
         LhZRLEgRP2vJZQ0FEm7r4BhFV2frPqljwxZ0ZBVfWNJp10pdvgpqb4ZIGs3btMsNghwJ
         fn+/PaOtfufWVFMVTp974ly8++sI/AaZHKZp6+3gpECRAW1rsWdwmMUypbFLijUAbDwe
         B9CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678350931;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+NyMJX4FZ3z6nATgV0EdUV/35bcDn63ExD7FXocSHwQ=;
        b=4v530luTtLdXqsCbk+oHp2RH+vUjV4oR18Aja0Xg+XtxvUy7w/J7FSjQAWuGqGel92
         pXXJlt9J72Eax/iXkhwk839jp17OLQtDYx6f4U0HgrFSaIuZmpI1KJz7ke1/FWh3xdip
         qMRL+Yjst05fT1CElspC/3d30LJmzAMqctTqS9uzB4r3wsgVy9IkqQDTdNuPyQJtAkn+
         byxkdKSxyGpsX2szvkhT2bgV6t43h+4WT+j8jngvWWnxzfYwFrE46s7YUS+yZ07h2Nnd
         dbLQU2EQ1hlUKHd6F1oypLSw66aOvkpMACgdKEKUtNcLsHSOB9rJEO9Dv3+zzs7oKoZX
         S9Aw==
X-Gm-Message-State: AO0yUKUIqdGHkmHMuLUeHzie+Ygu47JxrHohDr9/wDULxwMOsAYglwJF
	M/LJeAyG9UfyRNKAgxf6getn3w==
X-Google-Smtp-Source: AK7set87YYU0STxYSpXAizBhk6fkMFPOfS6B+k0H3u4azZuDE6eaLE5lDdU6zPtcpVzcXX/x3T+URg==
X-Received: by 2002:a17:907:8a06:b0:889:ed81:dff7 with SMTP id sc6-20020a1709078a0600b00889ed81dff7mr26422496ejc.9.1678350930905;
        Thu, 09 Mar 2023 00:35:30 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:7ee2:e73e:802e:45c1? ([2a02:810d:15c0:828:7ee2:e73e:802e:45c1])
        by smtp.gmail.com with ESMTPSA id d25-20020a1709064c5900b008b17de96f00sm8543850ejw.151.2023.03.09.00.35.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Mar 2023 00:35:30 -0800 (PST)
Message-ID: <812bbccf-010f-1138-f104-7db7d47ebc9a@linaro.org>
Date: Thu, 9 Mar 2023 09:35:28 +0100
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
 <94ba1427-21ea-86ee-d60d-7817f8e673fa@linaro.org>
 <783fe50c-1649-b1c4-06cd-ac81bcad5117@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <783fe50c-1649-b1c4-06cd-ac81bcad5117@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_003535_022419_9F123F7F 
X-CRM114-Status: GOOD (  19.05  )
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

On 09/03/2023 09:13, Xingyu Wu wrote:
> On 2023/3/9 15:30, Krzysztof Kozlowski wrote:
>> On 08/03/2023 04:40, Xingyu Wu wrote:
>>> Add bindings to describe the watchdog for the StarFive JH7100/JH7110 SoC.
>>> And Use JH7100 as first StarFive SoC with watchdog.
>>>
>>> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
>>> ---
>>
>> What happened here? You wrote in changelog "Modified" but what exactly?
>> How am I supposed to find it?
>>
>> Provide detailed description, since you decided to remove my tag.
>> Otherwise, standard response:
>>
>> This is a friendly reminder during the review process.
>>
>> It looks like you received a tag and forgot to add it.
>>
>> If you do not know the process, here is a short explanation:
>> Please add Acked-by/Reviewed-by/Tested-by tags when posting new
>> versions. However, there's no need to repost patches *only* to add the
>> tags. The upstream maintainer will do that for acks received on the
>> version they apply.
>>
>> https://elixir.bootlin.com/linux/v5.17/source/Documentation/process/submitting-patches.rst#L540
>>
>> If a tag was not added on purpose, please state why and what changed.
>>
> 
> I am sorry I did not elaborate it. The dt-bindings was only supported JH7110 watchdog in v3 patchset
> and you had sent Reviewed-by tags. But at the same time tried to add JH7100 watchdog after discussion
> and used JH7100 as the dt-binding's name because JH7100 is the first StarFive SoCs about watchdog.
> The compatible also add 'starfive,jh7100-wdt' in the dt-binding. It is different from the v3 patch and
> I did not add the Reviewed-by tag.

So what is the difference? Filename and new compatible?

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
