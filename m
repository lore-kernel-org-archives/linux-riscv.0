Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCD35C04A68
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Jul 2022 11:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qqGVh2iu8k+AQS5om4BJWYWH1bqS09GhjlNQ5DbvBTk=; b=b/K+HOzYI8Niq5
	6AObZkeE/sqYDrcDtyEIrpEhHebrRV0RolTl1tD1AiuzvC2R8gwiuZSNS6RfLt3UW6/SGzqVn83Zk
	JBxvRcHA8KDZ3f/878CQ6eJhWdg8trLPR9AiXG+bpmID1VGKEof9BC3665nGflIm7HI0OnjdWlYVF
	uvir0a7QA7Cs/fMgzEkFaNDD01QG069It/5Hp3/IlLCUPOUolXzqiqEToAevrYaZovRoE9UbFP3Zm
	NMjWoUxLIoE5MypLXNjwwEPsavwXZX3EyddxpYhAWW46SP5o4BeMcL/Gx5NoltCO8Kadob1aazUKA
	LPZXZ6AWpb++d6CUAI7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGfTI-00D5s1-Kn; Wed, 27 Jul 2022 11:45:00 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGfTF-00D5oL-7H
	for linux-riscv@lists.infradead.org; Wed, 27 Jul 2022 11:44:58 +0000
Received: by mail-lj1-x22c.google.com with SMTP id q7so4076268ljp.13
        for <linux-riscv@lists.infradead.org>; Wed, 27 Jul 2022 04:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=jtn8/pXZqVmyVmHFD0ROY+AOvBnJkk+T5jet+Sm8Mvw=;
        b=dyptcIS3dLYiYzrlsmmZOGIFth86TvW5l6M+4b0Mr9yn3urso9iRQ8rrR+W6NJXyte
         5wUp/Y9tUrZurvjY8+ZAJMb6OHPUFlDkKz7oyecCf62uJpXyr1ZO7ZLgLiNlHY5Fkt4R
         /dpHOcf947Ov7D8EhsepB/JwpSU8g3etAeE6vzsV1mrOSD8A1zEYB7bRuEr93FTaCZTY
         +y07iTbyKMJB1/WNq35+23UBJlm7NWtygCOAJUjsxXqzaABbVnr+IFMZJ4JoV0dlaR3b
         D+vLSZZKd+EsmqYaht1OLj05H+041oIkPOjblXPTeuAQ4lQPLzQjHGJ37ZNFf9kcQt+W
         0TNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=jtn8/pXZqVmyVmHFD0ROY+AOvBnJkk+T5jet+Sm8Mvw=;
        b=H2P6IeqGhAf244jU334QBcE4RlxfK20ZqoV8J4FIql8WlLUS++LeGiMPXzr8vf53Ac
         5RfLMHymFh+8bNENc64ulgBhKF6zVkIOlq7tIdYAkdsV0H0DuMdf+cztlbzQHTWVhOsm
         MS2OUNRIpqWEZ1n83rTap999be1MlRUvLkDJhlepoeJ8U6qfBTTEfj2fuvShKxXNetUl
         zlvI0ZR3UBHIMJSiKRN5hEdriiTD81l3csuiRFRgtG8bxFFgwyiPnj2F+Qxbr7gRgO5o
         O0BBu1UVGSON4Bfo9bvKGnassOKNTGmFgiWflAq12i7/AB1nL87cI4rkQcWqZPBKbW/y
         vnbg==
X-Gm-Message-State: AJIora8bsL7i032zGI79kCkMhta2WBw5pHzcwAli8DsHnEc8dKOtqDEt
	7NA3DTB46KJH145JjNY4Uv3rDoYhrKd2TGUU
X-Google-Smtp-Source: AGRyM1vKJFrPlmDXjA4BYKoOZrKRj/fRP1aoIdOTCo6UEZmXfLZ4iTyhVjD9Nptbds6dKOvZYwUDIg==
X-Received: by 2002:a2e:9ada:0:b0:25e:1109:b067 with SMTP id p26-20020a2e9ada000000b0025e1109b067mr3243919ljj.425.1658922294916;
        Wed, 27 Jul 2022 04:44:54 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id o5-20020ac24345000000b0047920d89606sm3745948lfl.187.2022.07.27.04.44.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 04:44:54 -0700 (PDT)
Message-ID: <9f32a4a9-66b4-ba2e-1713-436103c2faf8@linaro.org>
Date: Wed, 27 Jul 2022 13:44:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 4/6] dt-bindings: riscv: Add DT binding documentation for
 Renesas RZ/Five SoC and SMARC EVK
Content-Language: en-US
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Anup Patel <anup@brainfault.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>
References: <20220726180623.1668-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220726180623.1668-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <636e9214-4b36-e9a6-3c6b-b6edb944335e@linaro.org>
 <CA+V-a8sTw1qzuTeD2vb7RgDmmNdEP5qEcxXCjrFgkyrBrLrt5Q@mail.gmail.com>
 <e64cc15e-b31e-876d-b3cf-b60d255c495b@linaro.org>
 <CA+V-a8u1VW9xaj2KjySyMuegpisLVENO_6uJOpAFZGbKziYLYw@mail.gmail.com>
 <e31e0c1f-4755-704e-8428-93970877d8f5@linaro.org>
 <CA+V-a8sX=Frs_cds9MriauTFRvcZUNCvoeZ+SaC0GUpL7L6qhg@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CA+V-a8sX=Frs_cds9MriauTFRvcZUNCvoeZ+SaC0GUpL7L6qhg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_044457_303754_B1D177AB 
X-CRM114-Status: GOOD (  12.51  )
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

On 27/07/2022 13:37, Lad, Prabhakar wrote:
>>>>
>>> I did run the dtbs_check test as per your suggestion (below is the
>>> log) and didn't see "no matching schema error"
>>>
>>
>> So you do not see any errors at all. Then it does not work, does it?
>>
> Right I reverted my changes I can see it complaining, dtb_check seems
> to have returned false positive in my case.
> 
> What approach would you suggest to ignore the schema here?

I don't think currently it would work with your approach. Instead, you
should select here all SoCs which the schema should match.

This leads to my previous concern - you use the same SoC compatible for
two different architectures and different SoCs: ARMv8 and RISC-V.

Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
