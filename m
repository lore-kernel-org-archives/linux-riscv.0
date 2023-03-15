Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ABEFC61DA4
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Mar 2023 07:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cwDBHNjIcyuJL7SqINRYfROhFyzRqbj+96Jaz3VJi7A=; b=4v3OBjIOxJiF8o
	+kephWbT36wLTaJBvSXfnEV9NHjMqDDRPAhJviolh9tjh/jvpdaHBtdkNYT1ShJ1gLlPLsXb+rvUd
	Sk2jKsbu0ceo/bdHYwsRGfoe1IC5nuHqk7mkT6Ju3UPr29M4tbZ9UH5qKLIZ3dW96TRFA9JHmvkjm
	J43LiFKQ40gERdlRR6gGgfS/062gewK6RNJYbk0bdpc9q0GjBf03ORHP60UeNHez3umkSEpRK7S1o
	Wq1+XhEzxZMYXHndoo7Y7PIcT7I6zmPchclcCSuAcwAfLnqlzNBrRoBT6WrWZDZ9llYyhPctr61m9
	NjXLJ8B3IHX0R6pjjP6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcLzQ-00ChvH-2b;
	Wed, 15 Mar 2023 07:56:05 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcLzO-00Chtn-0Z
	for linux-riscv@lists.infradead.org;
	Wed, 15 Mar 2023 07:56:03 +0000
Received: by mail-ed1-x532.google.com with SMTP id y4so42524809edo.2
        for <linux-riscv@lists.infradead.org>; Wed, 15 Mar 2023 00:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678866960;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HH3s1nadjYLiGCsTK9aOpzfD2+JERQeAQNU/Lvtc2Ow=;
        b=pyIUeB4eDEi6hzASiyAIA1sVSMEqON/+DatgKxKBc3woH5HcE8oKUMp65LSlTt42S2
         DIJvaCPExRHWYZyq6IN8N3DysbTvmhll3GL+WvT9XDMqSQP151PRcYdV4asn6GOP7Z+E
         RE4Wb4AJFD69kSj1LNkWSfTjBSHA1vTRylCNk4c/dVZ6gMIAhQb/2/bjY2bBdX7sPTa9
         OKDBk25hrlbHK/ZzN2WT7KBZdM17ZZgj0kSdpABOkdEY60fZrIqo+E4eOPIRSpptV7uD
         Np6lkFrUKCD3nYCdNtJMpyvOWNSKhrMBZwYbugwPtBEI3LWuEWOEZnaXBa6hrZh7FmlO
         inxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678866960;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HH3s1nadjYLiGCsTK9aOpzfD2+JERQeAQNU/Lvtc2Ow=;
        b=u/8xVI5ik/d/+7msdDT7aPJdHgeHxCWLjb0/LY+uavVS81nH6qrEVoPU5ObFx5jP24
         KJh1CicRjaYl/2tIZOAqMWXV2KFLe05IJoMku5gSGFOEXjlb1usfml6989KwJUzqphua
         Bzu4IB8UKDxTOi/crvV4fYpKPStU/F58zfSQduw0mr9PisQHUEQfe2EWkKj2ScRwgAof
         OheMYDo3BnlDcmB/DV3+T04iLHTQPgqOHQYRnsOOaHY6LaTUWG3i6qfUYd4bIrkPWjVW
         w4LwAaAiUgnMkw4Lx+0bw3KuQMYyQe3y2UlJ0hd+0MVGWgyLhf/onVdJGzQvXWWHDVM2
         pquA==
X-Gm-Message-State: AO0yUKUsxJIZ96GngT2292/Ysa/eTrVL8Bwh3K0pIlA1eJV7r8C6F8NB
	GdjrxnK7S9FYUHaFgaV70w2p5A==
X-Google-Smtp-Source: AK7set/ErDnbn3BQv8IhC67ttVzVAWaZY78GHDI3wn5ScSSkGhKNg62brrkV32t3unAb7CJcGuQqcw==
X-Received: by 2002:a05:6402:899:b0:4fc:183d:ee18 with SMTP id e25-20020a056402089900b004fc183dee18mr1717845edy.35.1678866960639;
        Wed, 15 Mar 2023 00:56:00 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:940e:8615:37dc:c2bd? ([2a02:810d:15c0:828:940e:8615:37dc:c2bd])
        by smtp.gmail.com with ESMTPSA id co2-20020a0564020c0200b004fce9ff4830sm1945756edb.88.2023.03.15.00.55.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Mar 2023 00:56:00 -0700 (PDT)
Message-ID: <478974c3-7302-e773-8d70-fcb2323f65ea@linaro.org>
Date: Wed, 15 Mar 2023 08:55:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 01/11] dt-bindings: clock: Add StarFive JH7110
 System-Top-Group clock and reset generator
Content-Language: en-US
To: Xingyu Wu <xingyu.wu@starfivetech.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Emil Renner Berthing <kernel@esmil.dk>
Cc: Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Hal Feng <hal.feng@starfivetech.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20230314124404.117592-1-xingyu.wu@starfivetech.com>
 <20230314124404.117592-2-xingyu.wu@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230314124404.117592-2-xingyu.wu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_005602_226636_22803DA0 
X-CRM114-Status: UNSURE (   9.48  )
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

On 14/03/2023 13:43, Xingyu Wu wrote:
> Add bindings for the System-Top-Group clock and reset generator (STGCRG)
> on the JH7110 RISC-V SoC by StarFive Ltd.
> 
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---
>  .../clock/starfive,jh7110-stgcrg.yaml         | 82 +++++++++++++++++++
>  .../dt-bindings/clock/starfive,jh7110-crg.h   | 34 ++++++++
>  .../dt-bindings/reset/starfive,jh7110-crg.h   | 28 +++++++
>  3 files changed, 144 insertions(+)


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
