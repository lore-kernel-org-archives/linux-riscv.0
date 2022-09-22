Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16432C6FA93
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Sep 2022 12:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J547MwdGeEZ9zPvDfCeg7VZ91gO9+A/eLbgKld8ANAQ=; b=m2Z71tBGM/F7h4
	1ghXuuLu4KxzEg3gE8j494jPOocWcLBYJYNePUy7KLTmbvqheNwjhozkjfJqF8bxkq9oNBB3Zj5od
	bv1AZvx7ED3v0zW6TaJS8y2rK9jxzinyY2nwJ9wfVZXemF93uRvLAtJSmIhmFCcbMt3EwK8RnWVBj
	a/EzBsiuNoBQCXmo1fvaj4M98gAb03ZXjdwEjZ2YPeMWlqqwzUgI7uB+T6Sc/AwW0rUvdFey1JTNm
	Ou1hGHehuSQcZWJMTdOaMKkqk5mlWZjTzaOLHpWp78a4el8Fe/nQASKanm9hESXsb79o1KBJ5Uh/z
	c2xB29muUbwu/ziuSm+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obLjR-00FVP0-NO; Thu, 22 Sep 2022 12:55:09 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obLjO-00FVLh-3M
	for linux-riscv@lists.infradead.org; Thu, 22 Sep 2022 12:55:07 +0000
Received: by mail-lf1-x12c.google.com with SMTP id a2so14524548lfb.6
        for <linux-riscv@lists.infradead.org>; Thu, 22 Sep 2022 05:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=XN7fgV/2m8FW879qnMRu32mCTvjCyjCSyyZpC6w7m7Y=;
        b=bd8040yxj3B6AtxorIhc9/ygokzyW+LzXuJiltYwNzYtvMGkWjxnq6RUjSBN8+YSyn
         tBq8XLybWMIOa0IGRhD84OT6q7nQAXNG2jVfQi/wZbnn2f0dseNmTKxXX5acp0NCDO4R
         FP3YRjPz9M/uTwNHZPkXsDWiDE51iUCHztk1IK3Dbuan4C8sNyP6RpzRAAXN/vVST8wJ
         tXMElj8UvBQtmcsteRYvfARwXjkyvEmLUXYq85ZsjhW7V0zgctWMvO2WUEL3qNomHCE1
         mmnAv1lu2KTsn7Z5xjRsw09wpNt6Sr/sJKURKEaJD2sSDp+IvoVDetwf7hNF73s30ACf
         WB+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=XN7fgV/2m8FW879qnMRu32mCTvjCyjCSyyZpC6w7m7Y=;
        b=PEej/Of2WwxwGylaKFam6tTHqG9vL+dId8R05CMY3zvfNGx64x/ynIbrPUzpKTKjkB
         zL+ltMDPg6HAs/K63u32Imkb03odDBlEuZs46Zs5gbeorQflSfe4KuTycuQ3blcINOd+
         ck+rwQ0N++lLrsU/UpdWrRTxvM3wV81b2R4a9jLwQ7Dvbu9vkF1QFDcr6xYW9ZQIuUpl
         1Jv7x3qH1Qu7SEnwcKTqrv3Joerpiu/EdKX9f7ENb6rQVWb3+sPc0OXgvBklfLlXr1mK
         R5Pb6NETgVzxCeXoPn7zxH/iBgiz9zvQ1Ps760FKzUhM1WG+ee21m4zD///Je6C3S8We
         n1fQ==
X-Gm-Message-State: ACrzQf1bgQ+m3NTtDA/NVDhl6px1pNl1HOXod6fbNfbiGhX960PwBtWA
	wjvquVrILtbwpAzA7f37E9q5mQ==
X-Google-Smtp-Source: AMsMyM7Ts2WYAUA7HLB8Cder/jargsWJeCqHAoRewDq3r0RDccZK3M1sGSZ3fGbUJYftoWM6fvW+bw==
X-Received: by 2002:a05:6512:39c3:b0:49f:dee8:c100 with SMTP id k3-20020a05651239c300b0049fdee8c100mr1330441lfu.168.1663851300504;
        Thu, 22 Sep 2022 05:55:00 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id v21-20020a05651203b500b00497ac6b2b15sm924644lfp.157.2022.09.22.05.54.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 05:55:00 -0700 (PDT)
Message-ID: <f1dd4e27-efc7-ef4c-cb30-5aeea6a55473@linaro.org>
Date: Thu, 22 Sep 2022 14:54:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v4 01/10] dt-bindings: soc: renesas: Move renesas.yaml
 from arm to soc
Content-Language: en-US
To: Prabhakar <prabhakar.csengg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Conor Dooley <conor.dooley@microchip.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Atish Patra <atishp@rivosinc.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20220920184904.90495-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220920184904.90495-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220920184904.90495-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_055506_183597_65F25EAE 
X-CRM114-Status: GOOD (  13.38  )
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

On 20/09/2022 20:48, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> renesas.yaml lists out all the Renesas SoC's and the platforms/EVK's which
> is either ARM32/ARM64. It would rather make sense if we move renesas.yaml
> to the soc/renesas folder instead. This is in preparation for adding a new
> SoC (RZ/Five) from Renesas which is based on RISC-V.
> 
> While at it drop the old entry for renesas.yaml from MAINTAINERS file and
> there is no need to update the new file path of renesas.yaml as we already
> have an entry for Documentation/devicetree/bindings/soc/renesas/ folder.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
