Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65A8FC19F2B
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Jul 2022 13:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MBGkDzlYkbokiZr+iOjoJh+L8AalosopDKrjjgvwVpo=; b=WXNYFqfyMBEXXi
	oPuDrOFJwgwUhdlPYAeA6voeIx+vJ9hGMjUMRazy+WwIY5EIuc8xaOZiHodjb+UNYlkHkbw3EevvX
	/ADrTK9x4AZluO/x62juOn0Rz9L2nVt55lyvLjUn0406/xxyJwy5B00Wh+a/2Gwf14PsMR7FU6wUx
	9s/UvgIT+R8Gdoa9Gx7zom9UYegU+KEcRZzba89H/7eUt14IrzRaNqPpG4D2mS6Ld+zDKSvuoTtza
	Z0o4qTgnD9+Sr7pTs08+RGjNw0n/IeLGQVEF2k9PcOvpXjj5of3FBKISJNGe4viRZ6cAuXPyY6+CN
	d8jjvGv5CZuV39JjlmIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGgeg-00DnHl-98; Wed, 27 Jul 2022 13:00:50 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGged-00DnCc-5O
	for linux-riscv@lists.infradead.org; Wed, 27 Jul 2022 13:00:48 +0000
Received: by mail-lf1-x12c.google.com with SMTP id y11so26832587lfs.6
        for <linux-riscv@lists.infradead.org>; Wed, 27 Jul 2022 06:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=xt/iFa0Gww8PQ4QvOwKstYasksWx1xQKZXD7icliRMg=;
        b=nbUaUiRllsTbFH3Eus9e9UO4svt+vu8pCbP4kZQ1WT8glgkQh76sC4B6uwYKBgcsgG
         2xahkgtvpatCU6uSb9gtnePlK6Yaz5GKnH6PKRHc6yDcDaGHo03vfdwj4nZv0/8H+FtS
         CAqLBZnrGAx5Vb/z1k+kaPvbI7xZhQb9pS8F1ppy/zdpq+qLjsh18zolWqj3H6y+LOdL
         XFimzwZKqd7dJET7E5G85tNvJdiBYQDp3yiBGcDez1HrYZVoJWsIXhuWf8vRghlK/Qcf
         5GLPT8J4ljVPbZ0xp1W3lNkz83IcNq+ejVOUgUaQsWBDfZeKmb5EGtrEsTR+63o2+VUD
         D5qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=xt/iFa0Gww8PQ4QvOwKstYasksWx1xQKZXD7icliRMg=;
        b=1qY6dleWq4IYkXJ28pcHWKbO2TtFSMlYof38t8gmQLxHQ4gkVXy9CewoBym3HwIytH
         vgzJhLnoEK/8eI9SoIZ2MXVJ8XmkIR9Rg0UCiWVkSQYIE/PlniqOuOBinbR/NHtC54Dh
         pAebZionNIdAldkWFi4wYGfh5Yrd5/wKV/pTtdT/t49V8Yj8YgpCHgbxb94enUoCFUgu
         jZY7VdAzDZgqBZzWOcz1lFZu/JYsIBw50oQYz6N8XzxH1i3HKF4B1kVHuGqLOMf1By5P
         6w6fcsa7rzBaBB5nSBkItpnO/1lMELsVYtgC15vFr7XYqd/LTq04dJgQw0F8Rnsc+Sw4
         s/4g==
X-Gm-Message-State: AJIora+lnvFOH625+LW3W0w36piA0rMeC1mlGGyDuo5sRa+ZtskRdjuO
	/F311SWK2wslM6dQL25dzb1i8g==
X-Google-Smtp-Source: AGRyM1um+pnIbZzevQmvuQYPA79p7q3V9/eshGhbnk08XsshNMDjZQ3pVxUN/3rrgAfllb5kV38jFg==
X-Received: by 2002:a05:6512:1050:b0:48a:2319:59bc with SMTP id c16-20020a056512105000b0048a231959bcmr7964312lfb.665.1658926842477;
        Wed, 27 Jul 2022 06:00:42 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id z20-20020a056512309400b0048a93325906sm1438931lfd.171.2022.07.27.06.00.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 06:00:41 -0700 (PDT)
Message-ID: <75e5ace3-3255-2302-65f5-9fbef9cb1147@linaro.org>
Date: Wed, 27 Jul 2022 15:00:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 4/6] dt-bindings: riscv: Add DT binding documentation for
 Renesas RZ/Five SoC and SMARC EVK
Content-Language: en-US
To: Biju Das <biju.das.jz@bp.renesas.com>,
 "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Anup Patel <anup@brainfault.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
References: <20220726180623.1668-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220726180623.1668-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <636e9214-4b36-e9a6-3c6b-b6edb944335e@linaro.org>
 <CA+V-a8sTw1qzuTeD2vb7RgDmmNdEP5qEcxXCjrFgkyrBrLrt5Q@mail.gmail.com>
 <e64cc15e-b31e-876d-b3cf-b60d255c495b@linaro.org>
 <CA+V-a8u1VW9xaj2KjySyMuegpisLVENO_6uJOpAFZGbKziYLYw@mail.gmail.com>
 <e31e0c1f-4755-704e-8428-93970877d8f5@linaro.org>
 <CA+V-a8sX=Frs_cds9MriauTFRvcZUNCvoeZ+SaC0GUpL7L6qhg@mail.gmail.com>
 <9f32a4a9-66b4-ba2e-1713-436103c2faf8@linaro.org>
 <OS0PR01MB5922763582B836DA45CDFF0886979@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <80f08089-e3bb-983e-313b-45613364829e@linaro.org>
 <OS0PR01MB5922FDF8CFFE44A611D3783886979@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <OS0PR01MB5922FDF8CFFE44A611D3783886979@OS0PR01MB5922.jpnprd01.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_060047_258312_7DA33C75 
X-CRM114-Status: GOOD (  14.66  )
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

On 27/07/2022 14:56, Biju Das wrote:
>>
>> Then it is not the same SoC! Same means same, identical. CPU
>> architecture is one of the major differences, which means it is not the
>> same.
> 
> Family SoC(R9A07G043) is at top level. Then it has different SoCId for taking care of
> differences for SoC based on ARMV8 and RISC-V which has separate compatible like
> r9a07g043u11 and r9a07g043f01?

This does not answer the concern - it's not the same SoC. The most
generic compatible denotes the most common part. I would argue that
instruction set and architecture are the most important differences.
None of ARMv8 SoCs (SoCs, not CPU cores) have "arm,armv8" compatible and
you went even more - you combined two architectures in the most generic
compatibles.

> 
>>
>>> Using same SoM and Carrier board?
>>
>> It's like saying PC with x86 and ARMv8 board are the same because they
>> both use same "PC chassis".
> 
> What I meant is board based on Family SoC(R9A07G043) that is either based on ARMv8 or
> RISC-V cpu architecture.

I don't see this related to the topic at all. What board do you use,
does not matter. The board does not change the fact these SoCs have
entirely different architecture - ARMv8 and RISC-V.


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
