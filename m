Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E77DC3DA7D
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jan 2023 09:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i7lbrjEk2taM1eKen3+s+DEOODqxLLsuxgG+W+9FRzU=; b=NuYY8dh3PHjjir
	0NmFQ/Z7W/9LGpJ9oNqIgoSIfT7rIwvaXYlq001ro454SeNeVktb5yn32wrLZLLvcP5YnG+HQUaPX
	P2DDWxAvXuDnjqBiAd56Ux3IGl9tFjIkzX4XHCxBQRRRERsOmG32z34qu+kRAWnlctU5HBa+ykpoT
	Sj/wRZlJ2pCcgCs5TXqNZwFfIxI8TvJaJCeDhGxEa5wPQimRmMXOZq0mG9LOh+5/sdNEILuClkdO8
	4FWrYf5rPwH3DsqKE0sDTkBVnnjwffsABuEEXEmH8xrGbere/fYq6byfZ+3w/bS3kixWSKHN64z5Z
	X+MUyGv66M7Pa2IvB85w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCdGj-000P3u-9t; Tue, 03 Jan 2023 09:07:37 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCd8g-000No2-6g
	for linux-riscv@lists.infradead.org; Tue, 03 Jan 2023 08:59:19 +0000
Received: by mail-lf1-x131.google.com with SMTP id p36so44753854lfa.12
        for <linux-riscv@lists.infradead.org>; Tue, 03 Jan 2023 00:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CU2+WCtX132tL/fh6bJF3ka2kMaMnHZImYWVwAwJcNg=;
        b=jnXRGe2Jocg1Et6CPXmA0ayhtQyqcs/lFZ9v9hbhDS1roPksNnHbq/UdAYy2DOvag3
         1WOjGyo76716wwQbD2OOBm/yoOZFeF9njwqT+CkoZjMkDpo8+0cxTUR+SQMsLUv8WSyO
         w+Q+AujQ2T4WWSUGOR8+wS5E7H/xMFFsNLUJ7yTk+DCZ/sem9SHuCz1YDHFlIXi6pjLx
         YIz/rXPcStFY4+wx84+xMUGl78EUw/kYa+hvTUj2zdk8//N22qDbpijD676GEArsM6pN
         4oiQzfWe/Dg7AuYLk7Z91jEauegvCS3k6znTJnMMdeeE8qrQHQ70iugxYkeRktkvSCsT
         lBiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CU2+WCtX132tL/fh6bJF3ka2kMaMnHZImYWVwAwJcNg=;
        b=5abGNT9fkC+iDkJv69pI+ZlXh/ZNsiMDMC5mix03Q0KOsWWJkmWd3RA/uvp1Cy3YPc
         vKN3X22AfVygjyTMZT+NoloUHn3hrPr3DSVu+Bf4q+WWz1Qvr0d0AevQXCmEaLpeYhK6
         fn1caEJdQyF3OlvD8Drc80sJj/nxx/VMTp7kO2eoV/WNBSds452w9a4tzpVCZXBSeoLl
         i6UTYitQfpByHdQjnhjFxJwf+iA4djhTKgHHyOIoLnFDAy3WNG7kRXQa1bwYyzeCT+Gu
         rrZjY2zLmmVoe+y/xv1jwiQmBcAA/4wazWQOxlpMrOZhSp1NnoF5TXgjShws1hQ6JbGw
         o/zQ==
X-Gm-Message-State: AFqh2ko61ZxVifzOf4Fq9iBTLmgVyzI3AT2v70Ay8KtBz01JBls1BXoI
	D5Omy1iZ4DEtAd38Z/SfEQPfIg==
X-Google-Smtp-Source: AMrXdXu9HYqwwCox3GXFGttfDpq2qBsn94BYzOx9Wk/R+XJGEb1EUFh/MBYkFyYmIWneezkJokov3Q==
X-Received: by 2002:a05:6512:e9d:b0:4b5:5476:4c27 with SMTP id bi29-20020a0565120e9d00b004b554764c27mr15897513lfb.43.1672736346664;
        Tue, 03 Jan 2023 00:59:06 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id w5-20020ac24425000000b004cb0256116csm3733546lfl.26.2023.01.03.00.59.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jan 2023 00:59:06 -0800 (PST)
Message-ID: <082eb006-75b8-dead-c014-9ba41a697e50@linaro.org>
Date: Tue, 3 Jan 2023 09:59:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 6/9] dt-bindings: Add RISC-V advanced PLIC bindings
Content-Language: en-US
To: Anup Patel <anup@brainfault.org>, Conor Dooley <conor@kernel.org>
Cc: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Atish Patra <atishp@atishpatra.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20221111044207.1478350-1-apatel@ventanamicro.com>
 <20221111044207.1478350-7-apatel@ventanamicro.com> <Y3EQ4JU7uGbIMGiW@spud>
 <CAAhSdy2UAMmX+W5Cm3DuTJzZ0jJ3=CW4PhjctQNdfeS+4hqWqg@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAAhSdy2UAMmX+W5Cm3DuTJzZ0jJ3=CW4PhjctQNdfeS+4hqWqg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_005918_305714_D5DD5229 
X-CRM114-Status: UNSURE (   8.26  )
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

On 02/01/2023 17:50, Anup Patel wrote:
> On Sun, Nov 13, 2022 at 9:14 PM Conor Dooley <conor@kernel.org> wrote:
>>
>> Hey Anup,
>>
>> Ditto the $subject nit here.
> 
> Adding "interrupt-controller:" to subject makes it longer than 80 characters.

Because you added redundant double "bindings". Subject line is precious,
so do not add useless words.


Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
