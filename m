Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B0C5C00140
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Aug 2022 06:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+swdimqs3QE1tGBpRgIgyAVTusv0iqSmCVxkEzzyV5Y=; b=koBRYu+hdHXrAS
	ZZr2skJDPtYPnqzQz6+q+dNzEnEZuGZf/Zbd9ls6hyCBeQu1oYheNqk4WtM7bHJPbRACnsETumU9+
	hU2Yu65HeKfZpq04D/z9idcH3hqoNA1cWGIG7Ii5rkEXnGvYuZeQp0TMgM46gBUzdqTEJF03zUDoZ
	CPjUKqBrGthdTXJvXRFEEDDrsqd+Y8H/7o4kIvR8cfyqKQum4SC46DBM8BPwrh8FsKjw9rwIJUa6N
	6XHpP8vzlzA53FQIVatj1eJFCqeudtrRY05W7CKRlz3N3vdwZeEON9MTHa8e0tkYis+qDYO3NV+wM
	oxrYtOwpto35FtDh1baw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMO4o-00GZ1G-Rj; Fri, 12 Aug 2022 06:23:22 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMO4l-00GYv3-Kr
	for linux-riscv@lists.infradead.org; Fri, 12 Aug 2022 06:23:21 +0000
Received: by mail-lf1-x12b.google.com with SMTP id f20so45806lfc.10
        for <linux-riscv@lists.infradead.org>; Thu, 11 Aug 2022 23:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=ln6uw5ECmV28MFsRRMGsJGz2XJAnhGBl8re7vmnEV8c=;
        b=MnAnni1V95VJawZPTkqbeLMdNF/YKCDZcS2uW/XjWF4HSyfJiiAfJIWg/oNpEFwpKH
         hWBASb0RPRXLE+colDEWxscBM7uzEP8PJexmdvUtNeg0EiXqgQa+YMZpf8TGzkAN6WDQ
         Mq6opWU7BEzmHw2eYm4OZl05q6OQPlXoHG5J7OsMVYlL/ACcnklJfUpJh6XuBLAnsksf
         FP0QfhyCbWLhoj4ddbNcYhkCXDm2wnU8IHla6im5noKuHMc6ji7+ua+mdcs16unB5P2z
         LRFMpwA6hAyOH3oIaIFOBJA3zylvYxZMOC8PqeacxC+5YmlGqs7rlmZs0Ge9I6c0Zc26
         5nZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=ln6uw5ECmV28MFsRRMGsJGz2XJAnhGBl8re7vmnEV8c=;
        b=M5QcH9PuUig7IHZzZ8tkmSsG2O1ICdrFyyjsvU6m1pMZYg1QDw7d94/OnHfZ5mPm9U
         O7CIeWno04xONfFXcw8i5pGl0iEMqsvQGa0eq9jiyYFg2lUwFbQGJVERgKnF0J+xzy+M
         dO+v69aGJW5EuMtj7977ZhIoo5aM2l9Z7iWb57lgbrg6i5D1foDDuXdddaoK8b0YTubD
         9WFI++5jZMFmSs9CWlbvsFMCDxwDmLjpELI8rrCERyexhiFpg0oF8uqgHqSPLtiUktXA
         xkSy85HVlKwcCWaHeJoildW3bOfcPBYUMbFbFCYxwUB95c/WF1bq0/wN4KIp1tY+qLCC
         dtLQ==
X-Gm-Message-State: ACgBeo2JZ7tkzVEwP/41eUL3VaALHnMBV1IsuW2ktj0BSUhKNmBSGkfx
	wFovtwttO3TJWT9PZrKZjRK/0Q==
X-Google-Smtp-Source: AA6agR7W63XlCIJIdN24LYjn/IGHmyDjWxE/5M6IHSTSJK/mD87XUhFWMBUAXQaLEajW0bxFJGvCYA==
X-Received: by 2002:a05:6512:3d10:b0:48b:223d:da9b with SMTP id d16-20020a0565123d1000b0048b223dda9bmr791528lfv.332.1660285395758;
        Thu, 11 Aug 2022 23:23:15 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id d5-20020a056512368500b00485caa0f5dfsm104504lfs.44.2022.08.11.23.23.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Aug 2022 23:23:15 -0700 (PDT)
Message-ID: <1aa477b2-1d91-066e-5fcd-849ece62388d@linaro.org>
Date: Fri, 12 Aug 2022 09:23:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 4/6] dt-bindings: riscv: Add DT binding documentation for
 Renesas RZ/Five SoC and SMARC EVK
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
 "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
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
 <CAMuHMdWOdQ5HNU8CuWYXHqYs-UfdggTuCf1AARdJC-3WMTy7Hg@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAMuHMdWOdQ5HNU8CuWYXHqYs-UfdggTuCf1AARdJC-3WMTy7Hg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_232319_744941_DF303251 
X-CRM114-Status: UNSURE (   9.21  )
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

On 11/08/2022 18:42, Geert Uytterhoeven wrote:
> At the DT validation level, I think the proper solution is to
> merge Documentation/devicetree/bindings/arm/renesas.yaml and
> Documentation/devicetree/bindings/riscv/renesas.yaml into a single
> file under Documentation/devicetree/bindings/soc/renesas/.
> 
> What do other people think?

I am ok with it.

Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
