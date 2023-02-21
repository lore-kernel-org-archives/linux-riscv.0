Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BA2CC6379F
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Feb 2023 11:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rdJFNkC9HzoUNdW07vCqdAE+aLfNOmZoHjNCfb4l4XE=; b=SGWIAtTKk41U40
	MpVBBZuZjoUrOOrA98lAIHTOsIZefCOzLbFWGn4RPCEisbp6FUDYJtBsvzSCkVfh+aZ6Bd2UsFuno
	SKSlOIJw9vK2th0yMVX7sxNPy+EkkuW8WAUc+o9z5GJQtngHuVJCP9K6/YkkbMkSEkrQdHhQBTVD2
	5PQqOXWeVxVcIK5TkoMvT3CD/qyx33wFRxL4+UU22ki0xI9ik0AYfGA7QALqq1U564/XKAnjLCzPR
	lWAurX0S/HYkqmfMuwfJGtYiU2nTw5d7vxEqoa2uv4SBzrsu5aTnRlRbvgAulb40L6XXpF1j5MdC2
	ZGfarEkN5KhcTEAmU3DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUQmN-007YSk-Hq; Tue, 21 Feb 2023 11:25:51 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUQmK-007YRz-Jj
	for linux-riscv@lists.infradead.org; Tue, 21 Feb 2023 11:25:49 +0000
Received: by mail-ed1-x52e.google.com with SMTP id h16so15960546edz.10
        for <linux-riscv@lists.infradead.org>; Tue, 21 Feb 2023 03:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GS/FuJCPhQ1uOLyGjkR0iAM8SEKwfPpWzwME5MLPJhM=;
        b=e7Loni/yJXd48Da9Dl6Q0CN99QB8bdYlsJD9tqOTTTgROY9tjFa+mhRq4YeAqspbmh
         1UcUCGn9b283dP37/+guJd1qaK1O+5ojvaIHvB4vIL3rK2Rc0fdR3rblSSO+BTAvv8Zc
         dFoTk/29lWYc+RuNNuJzSoYizvCuYLZMg7EehNrJXDD0Vb3mk52amkM5DbQsUkrYI3Wh
         TpJNHS8s1EQEo0vhBvuuVDguD46CYhOnQ3fj5/ReU4+7VgKymiF5PSe2YkuC/vVdGBfA
         9/BtrpQQZ9TutamhoSH6bn2CqdHy3FR+1pIp3tfsBxw1gkqyu5DAsTN4MqONTlmaBjhZ
         f0ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GS/FuJCPhQ1uOLyGjkR0iAM8SEKwfPpWzwME5MLPJhM=;
        b=ARMEepzWuvmr3mfMrVsLFlc0bCuPXFZjy8CYlE/ry8VG7khYl9CjPWwV7kEuy7uuGs
         BktsRj1BAhY1L06q2txevCWw+GmMOfoFYxUrj99ljYaLhhyng3qQLGq+xNfQMKKUjQTJ
         G6/ajHMkLOZOppXPNiHkaKx9jPkVzYxQsgkhpLS9VzJBcgcl6fo8hnRkFn4INZg/GsIB
         Jbp15iB+MDbaNAQ01Bh+6zbMHCztOGoGtwh1s7cAAlIUzDjytPVLjML2bsdEtchSi4CK
         yiIsIxjKUie1Z9gQI2lfaEl6zt9jARPVmjmoUyi10rC7sttSbpREnlO0XneroQZfUb9C
         cgVg==
X-Gm-Message-State: AO0yUKVBdyC7rYrKNq/VO7QwbGvJA/xAZEHBb0MWSyWxvGVSuMrsDUZN
	UAJ54/B97/3tjdRKisHciiMStQ==
X-Google-Smtp-Source: AK7set9i7iCdrmNLxS44tLm4Cod1bYIxstYUo7G3Yv7gMOYC2J4cFKB4FWle3mr9SoLL129HeBZZlg==
X-Received: by 2002:a50:ee01:0:b0:4ae:eb0f:892e with SMTP id g1-20020a50ee01000000b004aeeb0f892emr4242179eds.20.1676978743932;
        Tue, 21 Feb 2023 03:25:43 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id t10-20020a50c24a000000b004aeeb476c5bsm2040071edf.24.2023.02.21.03.25.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Feb 2023 03:25:43 -0800 (PST)
Message-ID: <430318ed-5b30-e549-a5ce-df83aa18adf9@linaro.org>
Date: Tue, 21 Feb 2023 12:25:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 01/11] dt-bindings: clock: Add StarFive JH7110
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
References: <20230221083323.302471-1-xingyu.wu@starfivetech.com>
 <20230221083323.302471-2-xingyu.wu@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230221083323.302471-2-xingyu.wu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_032548_689895_391C4269 
X-CRM114-Status: GOOD (  11.70  )
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

On 21/02/2023 09:33, Xingyu Wu wrote:
> Add bindings for the System-Top-Group clock and reset generator (STGCRG)
> on the JH7110 RISC-V SoC by StarFive Ltd.
> 
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>


> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 93eb504c3b21..2e70c9f21989 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19914,6 +19914,7 @@ F:	arch/riscv/boot/dts/starfive/
>  STARFIVE JH71X0 CLOCK DRIVERS
>  M:	Emil Renner Berthing <kernel@esmil.dk>
>  M:	Hal Feng <hal.feng@starfivetech.com>
> +M:	Xingyu Wu <xingyu.wu@starfivetech.com>

No improvements here. You add here new bindings for one device and then
- without explanation - add yourself to all Starfive clock bindings.
Either explain it or drop it or move it to separate patch.

You already got comment for this.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
