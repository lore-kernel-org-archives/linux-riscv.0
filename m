Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 329A4C04A68
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Jul 2022 12:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NRZK1rn8QSv4DZwTISVH7gXp5fk2bNjhAYLWUkx+UX8=; b=XSCokq1B8DNCYr
	cXpHnhTDCRuTSLDYpMlL9i/DHZmgX/SVJj3bm9Ls1K13CRO3zwEh2T59DkgD6ZqsgfKFYWh/TLcRC
	BkvIQY8emADeM89LustsxnUzyfBR3ezvtU9gRS704XZsZLAWLQjz0PnjGgMxBnb7TPeWYRJo2I3pA
	FsQ9SMuZrinZjepxsL1jmXPVsx09/tZcBbjbTLt7cZNbjnrizb/QgViTRP3dNWTcam+L34VQXspRz
	ySvojEN1/bLGJBVQIYzJ/F14LaHatImJrRes9anlsij5kqBwX/MLbRQ4GRSOCrD70DbEgksEOuu2h
	v1g8qO9O+kjPeZfYwzyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGgHj-00DZKs-RB; Wed, 27 Jul 2022 12:37:07 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGgHh-00DZHW-2R
	for linux-riscv@lists.infradead.org; Wed, 27 Jul 2022 12:37:06 +0000
Received: by mail-lf1-x12e.google.com with SMTP id p11so22080994lfu.5
        for <linux-riscv@lists.infradead.org>; Wed, 27 Jul 2022 05:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=LYHdsFsXmivDzoZyQpP5rFyuNapS+2oYgH6BpUjY7r0=;
        b=ps3hAB/tSpTRQMrzQ0DZsDbNUuGDA6ORksV285PMQlY5R/4Q+CkeAWJogtO/9sAbEr
         z24P4FjN3dMCjInos0rj25PqiS1hUoahUlcesdYi5lI/yJzonpsrOcU2UCB2nNojknCE
         5HZb4ZDJGR8ErboZSDSYF/4sGLcpi0V4BYdJM8m1vKVGdn7b/03XE03ues5+L5unkPt9
         i50cfcWOPwWXzzhH8UyFWVmDj9EhS+GSUNL2ENyRdLHBw6Z26UnI4/cjJVApseQwLVg4
         3xcpCk2K5pYAch7QwSfWcv9Uw4y0M0ut7lwtk1gndJ8NI2AxUdyElO4uWdbkFUN7ZHyh
         6a7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=LYHdsFsXmivDzoZyQpP5rFyuNapS+2oYgH6BpUjY7r0=;
        b=YUNbjAqqA79ctGjMmEQjQ/rMevuXXrmH6Hxohab4cFdVE7rzqSMKZGhfeYJ7xfqtlP
         A+/jM7R/ns8DzW7E4/39XCNXm86HDiQ6iIwQNGt3TOnT8ofes/tx0fKhhQnFHfC2I6Uw
         2Bv/dQrDCG5DhfGpr/zExXgqRlsxq2zuJQOSJFok6o9SKykduGoyo98fuERiWJzZIX2j
         T2+canEIvnkb/555DMEXiAA8/TEsl7r2OFeUg2QkxyIneQ//pfvw+q3UJF8AmOTXW2gt
         cWNJ0oOY57rRXkn6uNfCyr5+RDTboWHUKd/wCW1gZLN9iX+O7gi+ljQhpPeEkXwRpGje
         ajBw==
X-Gm-Message-State: AJIora+BvY6plzBmO70AXdslO3Oac1g59XnBkAmRw6GSa4KUIeBvuYjJ
	VerZxu9uadgpisY3dvuL8ehPAQ==
X-Google-Smtp-Source: AGRyM1v2UQwhAPwo+gzgOfl/ZKKrPyNKug+bl3yesKfQSUngR1PTahjeZaErm/TPIYZVOYziWximXw==
X-Received: by 2002:a05:6512:ac5:b0:48a:8817:a6df with SMTP id n5-20020a0565120ac500b0048a8817a6dfmr5700656lfu.388.1658925421307;
        Wed, 27 Jul 2022 05:37:01 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id k14-20020ac257ce000000b0048a7fa5bff1sm2534024lfo.248.2022.07.27.05.36.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 05:37:00 -0700 (PDT)
Message-ID: <80f08089-e3bb-983e-313b-45613364829e@linaro.org>
Date: Wed, 27 Jul 2022 14:36:59 +0200
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <OS0PR01MB5922763582B836DA45CDFF0886979@OS0PR01MB5922.jpnprd01.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_053705_189053_063C10FA 
X-CRM114-Status: GOOD (  15.77  )
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

On 27/07/2022 14:21, Biju Das wrote:
> Hi,
> 
>> Subject: Re: [PATCH 4/6] dt-bindings: riscv: Add DT binding
>> documentation for Renesas RZ/Five SoC and SMARC EVK
>>
>> On 27/07/2022 13:37, Lad, Prabhakar wrote:
>>>>>>
>>>>> I did run the dtbs_check test as per your suggestion (below is the
>>>>> log) and didn't see "no matching schema error"
>>>>>
>>>>
>>>> So you do not see any errors at all. Then it does not work, does it?
>>>>
>>> Right I reverted my changes I can see it complaining, dtb_check seems
>>> to have returned false positive in my case.
>>>
>>> What approach would you suggest to ignore the schema here?
>>
>> I don't think currently it would work with your approach. Instead, you
>> should select here all SoCs which the schema should match.
>>
>> This leads to my previous concern - you use the same SoC compatible for
>> two different architectures and different SoCs: ARMv8 and RISC-V.
> 
> Or is it same SoC(R9A07G043) based on two different CPU architectures (ARMv8 and RISC-V)

Then it is not the same SoC! Same means same, identical. CPU
architecture is one of the major differences, which means it is not the
same.

> Using same SoM and Carrier board?

It's like saying PC with x86 and ARMv8 board are the same because they
both use same "PC chassis".

Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
