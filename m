Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3FAAC77B7C
	for <linux-riscv@archiver.kernel.org>; Fri, 12 May 2023 07:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l3r7wKMWTDlSXVB8MleoKMmYWmGMHsGGFAPOLwhVCWQ=; b=4IF3uiBANZttgU
	uxZVDYM2/5UjAw8oRrLRILk/Z0w65Vvq2nwuxb0yWXyT07Ddui7I598KbY9Kgx2cIkNCbfl3kRSVj
	K6Y88KJTfDX3yE23rQuBtdPJhFg9c5Z4eJqlYdSXpWh5aXiVtUpfT843rGJrcWWW+BVgbvojP6yvE
	a4TZbYbIyoI6HOb/65+znUJISpWkbFnfCo+Xz6PwnGp3995AfVHKjOEpItQLbCHYKsy0DSCIrIG94
	h/38dw8Ek3r7X2mqrbkDn9l35YWFkoyd4We1VqLyzx1DGKKwyrfcKmSkFGuVGlVvONG3Lb96fmtUj
	pTvJbPvbMm8hf0SLtjug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxN71-00BBLB-09;
	Fri, 12 May 2023 07:22:47 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxN6y-00BBKV-0S
	for linux-riscv@lists.infradead.org;
	Fri, 12 May 2023 07:22:45 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-50bc4bc2880so14750464a12.2
        for <linux-riscv@lists.infradead.org>; Fri, 12 May 2023 00:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683876162; x=1686468162;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2/aA9jsvMbpCOcwE4/U6yU5Ge888LhQRk+VU/TYiZuA=;
        b=ewIWYIPJ8NTOphY0GZu6ffx9FkoFeva5FYwZc7xleZNadJ3RtRWP4OIeBvPanFW9o9
         02AqkiutjULhqvpof3ywrhMZL0A6xlgd4tWElwu5GVmaBYLbkt30VZ2hOe1ZqxM6PZyu
         jNzYQKg8tTCxC7hSjp64kgjVcTLlKmKB7egs7a6wcrW8mP1dI8rgvPK8GWzXkXqcQLxH
         JbKlNiBCPzMdpCHnqMBoiGtCszsOXjT4vS6stbyvd7BtgQdTMayk0GuTnrwh3kJswg8h
         hM/One6Zuc/QUFJk8taEpmR8EIndNsrQaAxnIwq0JADW6YSJH1UGutk1n13Dc2L2bm37
         K0JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683876162; x=1686468162;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2/aA9jsvMbpCOcwE4/U6yU5Ge888LhQRk+VU/TYiZuA=;
        b=ImOvQ0Jw+4IijzPoBriGE2VWJWk6q1DB9lY63DiMaK0GyrDQcgpIkwLqOW8wnBc7GU
         VjZE/LTYAHmwvASPb6CdbjMcNVRdv3DZR4ZtyQ1NYhdcy7ngQAFmvzjzotZGF5UwNm9L
         0dd33hJTOikOay6hv0tvcmI4GxZl9V68BfXquwOXYw3/SmMOlo6oV0TY3/pLuWkSxwlK
         W4BPWuDSD7noJLQtZuVpbCpqhZpnag7EhQhTrCmWiC/VlvaPWl2dQSlwq0SNqZ3Rs2eW
         USwKMwdk+JzW6uK6cSnCxb6/UNwd2mXgHFgyxvoDGLtYlg4vdYQIUF6IeGPJlEzTtTZ+
         FWRw==
X-Gm-Message-State: AC+VfDydd7eDKDhdjnklLGKaHNtkxzbpIaBgddGCq7ZqUXLF7Nej5df+
	drPzbeHI7Nm7Y8We2T/l0hpMSQ==
X-Google-Smtp-Source: ACHHUZ5u/Ss9b/bDnf30cMr1Nmq4PVgDVeqifi4CE7DHWwxByGSpw/29SsjXdeKlZd4l1OONhLjuyQ==
X-Received: by 2002:a17:907:26c1:b0:94a:6071:d613 with SMTP id bp1-20020a17090726c100b0094a6071d613mr20353616ejc.64.1683876162474;
        Fri, 12 May 2023 00:22:42 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:7ede:fc7b:2328:3883? ([2a02:810d:15c0:828:7ede:fc7b:2328:3883])
        by smtp.gmail.com with ESMTPSA id gz20-20020a170907a05400b0095342bfb701sm5115319ejc.16.2023.05.12.00.22.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 May 2023 00:22:41 -0700 (PDT)
Message-ID: <72c8f49e-ad3e-9241-f2dc-cd523ea19d14@linaro.org>
Date: Fri, 12 May 2023 09:22:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 7/7] riscv: dts: starfive: jh7110: Add PLL clock node
 and modify syscrg node
Content-Language: en-US
To: Xingyu Wu <xingyu.wu@starfivetech.com>, Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Hal Feng <hal.feng@starfivetech.com>,
 William Qiu <william.qiu@starfivetech.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20230512022036.97987-1-xingyu.wu@starfivetech.com>
 <20230512022036.97987-8-xingyu.wu@starfivetech.com>
 <c432c26b-27d3-80dc-fe6b-457996234871@linaro.org>
 <0463378b-60d8-ee05-2a2e-1e709b882bae@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <0463378b-60d8-ee05-2a2e-1e709b882bae@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_002244_207624_B382FB09 
X-CRM114-Status: GOOD (  12.36  )
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

On 12/05/2023 09:15, Xingyu Wu wrote:
> On 2023/5/12 14:37, Krzysztof Kozlowski wrote:
>> On 12/05/2023 04:20, Xingyu Wu wrote:
>>> Add the PLL clock node for the Starfive JH7110 SoC and
>>> modify the SYSCRG node to add PLL clocks input.
>>
>>
>>> @@ -465,6 +469,12 @@ syscrg: clock-controller@13020000 {
>>>  		sys_syscon: syscon@13030000 {
>>>  			compatible = "starfive,jh7110-sys-syscon", "syscon", "simple-mfd";
>>>  			reg = <0x0 0x13030000 0x0 0x1000>;
>>> +
>>> +			pllclk: clock-controller {
>>> +				compatible = "starfive,jh7110-pll";
>>> +				clocks = <&osc>;
>>> +				#clock-cells = <1>;
>>
>> This should be part of previous patch. You just added that node. Don't
>> add half of devices but entire device.
>>
> 
> So do I merge the patch 6 and patch 7 into one patch and add syscon and
> clock-controller together?

I am okay with adding users of clocks in separate patch, but the clock
controller - so part of SYS - should be added when adding SYS.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
