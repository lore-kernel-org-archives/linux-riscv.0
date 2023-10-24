Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D06B9C00A8F
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Oct 2023 03:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FCVnPOj9HF+GdkX3FKEL9jVRSoGmTz61HVxbik2kTt8=; b=hEuZ7cRog8kGSr
	dzgwWfIcn+ZIqO5gNT2+myGfA8tMcz2gyKO+Z9+lZUMvPS3RC+AgfuTyOzHTV3AVJeI8MY2FbsxF5
	CMsVJyvHs8XvDYK5f+sn+V38AnUJi1S1AHMHC4lf6qTsckc+XtVZ2uRZHZaT/57xK0lkaTMWtoQm+
	8E6Y7KkxgpUVSbuTqb+CVT1xCS82euKr28/bjXlnrdGY9CPcozDQngd4Geyx89cdDQspMcL5DTgXN
	zqC+dNUfjliYLPzdGM4664h9Pq0BvrQI3l5Bmwz1/fQT/L4KbUke4pJnq2phSMlZe10SFSrDyA/AJ
	2lZ5faws45jSQ65prChg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qv7np-008hiM-0Q;
	Tue, 24 Oct 2023 03:09:57 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qv7nm-008hi2-0L
	for linux-riscv@lists.infradead.org;
	Tue, 24 Oct 2023 03:09:55 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-4196ae80fc3so23678051cf.0
        for <linux-riscv@lists.infradead.org>; Mon, 23 Oct 2023 20:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698116992; x=1698721792; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hN9IUFI6BlAMzBsGDYubLRAFahODywghGKhRYzTefJ0=;
        b=iz2Fw/OwiPbERkHZhm0UKUAiy9sDH+clr6wHyRWIjZtaosmTNNSCijIHmYeJLrSoEz
         TGucww+H5IzxfMCbFn7WfvUBtJyQezbBYgOe4lgjfzFmSrvAhqM3SH1FhMkXtbVCTWtN
         c+Aicn8RccaVHmCWydY+cjWst/IfoKSeOqo+H7ORHJSIu6T3G/4d1aNslmzMe/tVMMn4
         PO3yEb94AtuCq5/qk+/RBEXZaXg/P+xi5hL1V/mw4Gw7WWDO1h1o3+icm6a7w0ycHl5H
         TTSNZsGgzw+1pDz4RzTNk30+dcvFO0aEN+BYoA5oXw+TzMzJYwpU/ldUjVGZ5+xWzt7C
         N5BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698116992; x=1698721792;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hN9IUFI6BlAMzBsGDYubLRAFahODywghGKhRYzTefJ0=;
        b=NRARtiA8G6h1mr6iPgzHxx/u+f1dDuHBi8Iop8D+V6ANBmslEwvqT55PccD97lz614
         yUW2iJ/ndZb5+jzpiAze1FatsdnyvHSQDFiwABNyL+HBlLwc4JtyoGyoFO1F8OzPOyou
         B4p1gBH2KspRmOZ8cyH0dA+t27zhFPVpRHkzJ6xQY8EtEvvgGegnA4oljPQAF23vy5zn
         9bWtkzX4VrEtu5sXjdJR+ihSBtgoW5sZiHa40soYJZ5xxcfyh84PSBAvzDoeTvpav8J6
         BGSFwNExjQpxTxtn0w3wkavPoNkD/KpU+aYcMI9HuihcNaFB0kjBbRdBs4EAJ2trnEA/
         Bm2w==
X-Gm-Message-State: AOJu0Yyw0X/ftsPMB9IVxFTvQpevY8z845QpjAjKKPSQOnPKkstQzHxD
	jMOdrwlRrqh2nK4wGZqmBZk=
X-Google-Smtp-Source: AGHT+IFgtt7qitr+NPw6HUCaMALJuH0l8Wik05EqRQK2bUBhL+33C5ajSP6/54/3OXj0qZQjqMFg0A==
X-Received: by 2002:a05:622a:15cd:b0:403:a9aa:571f with SMTP id d13-20020a05622a15cd00b00403a9aa571fmr12883815qty.16.1698116991997;
        Mon, 23 Oct 2023 20:09:51 -0700 (PDT)
Received: from [192.168.20.212] (cpe-107-15-246-199.nc.res.rr.com. [107.15.246.199])
        by smtp.gmail.com with ESMTPSA id j13-20020ac84f8d000000b00419b67d2823sm3179750qtw.34.2023.10.23.20.09.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Oct 2023 20:09:51 -0700 (PDT)
Message-ID: <97e2decd-f6a3-91cb-6ca7-539f53b686f3@gmail.com>
Date: Mon, 23 Oct 2023 23:09:50 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v9 01/20] dt-bindings: PCI: Add PLDA XpressRICH PCIe host
 common properties
Content-Language: en-US
To: Minda Chen <minda.chen@starfivetech.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Conor Dooley <conor@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?=
 <kw@linux.com>, Rob Herring <robh+dt@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-pci@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Mason Huo <mason.huo@starfivetech.com>,
 Leyfoon Tan <leyfoon.tan@starfivetech.com>,
 Kevin Xie <kevin.xie@starfivetech.com>
References: <20231020104341.63157-1-minda.chen@starfivetech.com>
 <20231020104341.63157-2-minda.chen@starfivetech.com>
 <8ced1915-7b94-4abc-bd8b-cb4bf027fa01@linaro.org>
 <bd441e1d-73ae-4abc-8eb2-877419acb2df@starfivetech.com>
From: John Clark <inindev@gmail.com>
In-Reply-To: <bd441e1d-73ae-4abc-8eb2-877419acb2df@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_200954_328639_D7627F11 
X-CRM114-Status: UNSURE (   7.09  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

> On 2023/10/20 19:04, Krzysztof Kozlowski wrote:
>> On 20/10/2023 12:43, Minda Chen wrote:
>>> Add PLDA XpressRICH PCIe host common properties dt-binding doc.
>>> Microchip PolarFire PCIe host using PLDA IP.
>>> Move common properties from Microchip PolarFire PCIe host
>>> to PLDA files.
>>>
>>> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
>>> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
>>> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>>> Reviewed-by: Rob Herring <robh@kernel.org>
>>> ---
>>>   .../bindings/pci/microchip,pcie-host.yaml     | 55 +-------------
>>>   .../pci/plda,xpressrich3-axi-common.yaml      | 75 +++++++++++++++++++
>> Where was this patch reviewed?
>>
>> Best regards,
>> Krzysztof
>>
> This Conor's review tag. v2 : https://patchwork.kernel.org/project/linux-pci/patch/20230727103949.26149-2-minda.chen@starfivetech.com/
> This is Rob's review tag v3: https://patchwork.kernel.org/project/linux-pci/patch/20230814082016.104181-2-minda.chen@starfivetech.com/

Tested-by: John Clark <inindev@gmail.com>: 
https://github.com/inindev/visionfive2/tree/main/kernel/patches


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
