Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15828C4828F
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Feb 2024 15:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wSKLkTtP4u9XKu3e9tbaqb+lDHKUTXulIu48Q/YOCR4=; b=HunduFgHP9v751
	C6+fV+Ij8gRjQG68+/cCALt5arG+xceqUdOelPJ3zlUzY4nPDwk4ahydiIj2X7CQYZLD4hSgkR9DU
	5RxDBQccOP+SI4tvmarqpQvy5LvsJpY3IGtrxJ3gHwSVwz0G3hKZstDUa+bic6r5iGwjWH7Btem88
	PVh6nTQBx24JaF8M4qLNCRPkqUDOVkW9JBAmWr3sUEBkYm9s2e2uaawc82N16CDNRo9Qzbt7oyTbV
	Wd07rP4z9Kynu28FrZ578Tk8QBOmUm4JIDqTgPf0iN18TY0Apcg2NDi5NlP2Z4pLdOafyXRLoN0zZ
	dK//S6hL7F1SPAW5urHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY6kp-0000000EEW0-3Rtn;
	Thu, 08 Feb 2024 15:55:59 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY6ko-0000000EEVf-02t8
	for linux-riscv@lists.infradead.org;
	Thu, 08 Feb 2024 15:55:59 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-33b13332ca7so1104618f8f.2
        for <linux-riscv@lists.infradead.org>; Thu, 08 Feb 2024 07:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1707407756; x=1708012556; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jwj187v5DmD95irFdBgTanplv+ZSPDewhhqQqZrj+18=;
        b=qqDv09koeQSM0FOaS5v4YYNPrhemtPFTV4oStg0bZpJYVmxBUHYniR0hDp+OpoPbty
         mWhPcDbPJ/bNXFR7oi8QwQ2/sxE1U6tjnqI7INlC1o8v8bcCduTqycTd370OarBR0uUr
         vpSr0+NJOMpqBg7wVIHxB9s0YhRqie3uZMo6jerI5fKU4kJD406lUnbSM6BOEsaaBlKr
         9Df/MLMomKtfjb/S86UC/Uy04zlWEogMMHQoWSDflcxwdh+Sm8GYdvYI2pwI6W0E1mwj
         7MOn82nD7mEOk+/XelwmXiNROnmO+uwDlkFoAV3lVst+gZwTXXGdevWarcyALNJcmlBh
         WAlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707407756; x=1708012556;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jwj187v5DmD95irFdBgTanplv+ZSPDewhhqQqZrj+18=;
        b=NuCUNzGVRK+uiNlA81qI4CuKm6R2KC/ePjFJD6ONyxIN+Nyx4xkntGloTZM/Jfd6cT
         C2FhQg8YY1RatIDFZZfheEbq/YebydYpywNCCQIBeXOHzocqsphJlYxOPbzdEK3zE6+8
         OgLdlIOcQ1bUX29EzSZw4b6TP3kTgfDQ6M6sIAquxFm5wyJDKWubA2XZQ07Ei0DtHI3x
         miiRukpYIsp6eYAqaoqRq7ClvQyS9ucgYebPIJQ1Ax9Npdy2GbXslK4+t12DucleNxh2
         m07djhcmAgg8nooprrWr2VmM8x6ej1FDwNV8i1jMgEF7JLaAvcNaFq4ykUeyc+nM/y3m
         XkVQ==
X-Gm-Message-State: AOJu0YyhsOVFPt4EJFTX1GTbwwk9/7zN/Y56Zpb/Bp7M/akebLiSXdsl
	NFfCSeETwHMCaJQMV2nHnmW1yN+J3l8mpbox8ELTBcFrFZMvH9PZXWfjJK5aWws=
X-Google-Smtp-Source: AGHT+IFfdq3GR+jNAtlGIoRDXvcR8MQLIIZqMZPsMrgv6b4NoWs3p8MQUDAlqRR3ToqtEy/wPcKNIg==
X-Received: by 2002:a5d:4dcc:0:b0:33b:4d13:3e91 with SMTP id f12-20020a5d4dcc000000b0033b4d133e91mr3820391wru.45.1707407756251;
        Thu, 08 Feb 2024 07:55:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCULtDWAiTDbRxR7h0kvcsiu+OwZWCxku0b5SYZAaErDiFKeCuOOEqPUGLCtZgOuCtf8Ip8AbJdxJssk7bBOvR3rBCFEgHHjk2EYqEyBNOoBHo5KhtPaw9ZubnDqy5qaaePhYqDWQaoGgWY2JjEIPecqTMFop0/ZLyoCjIZ7KFaYo4dsW7LP3+CmmpalQje2sv1+lnZkGXX4bseVubc+J8Ius9BpkVWiCN/Ju0Fnw50gR2O/U13W6a+T7sJGHU28QuhAPqT1fLAp3DtFBMJCeSk6wWkwon1PZgYBm/lvKAUwYEUlmsRwZorlOWqlGaYxenBRQqZERJ3QZ7PFihZ4Mh6Id0bMDxzgRREJC/x3YR7pmrn3yU6Y7138sx4gwvJJ6DeyuC4Xf0d/zuu/HD0NBfPWt62HdnQdGoBpM7OP1ifpDE+M/aZR8SPVf/FUN07kd8JpQHQSAIsB8bzUfTS0AsK/y5hHU1Gnw2aXnsbsraqBpD0aKw7loIPDQOQWjrNrzG3X5wZgvEmlEYHhNlmzKcZHNWO5g5w+eQO23Gwg6TrsHQyOEda3pdXae2MPThgDDRiw2tIdPPkZB1+1sgQcH+ch5DIzgBVaEegH
Received: from [192.168.50.4] ([82.78.167.45])
        by smtp.gmail.com with ESMTPSA id m25-20020a056000181900b0033b4235b155sm3852770wrh.48.2024.02.08.07.55.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Feb 2024 07:55:55 -0800 (PST)
Message-ID: <0e45aef2-5fc5-4677-9370-b9e565f0767b@tuxon.dev>
Date: Thu, 8 Feb 2024 17:55:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/17] dt-bindings: clock: r9a07g044-cpg: Add power domain
 IDs
Content-Language: en-US
To: Biju Das <biju.das.jz@bp.renesas.com>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "sboyd@kernel.org" <sboyd@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com>
 <20240208124300.2740313-3-claudiu.beznea.uj@bp.renesas.com>
 <TYCPR01MB1126925EE70DA30AC2662862686442@TYCPR01MB11269.jpnprd01.prod.outlook.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <TYCPR01MB1126925EE70DA30AC2662862686442@TYCPR01MB11269.jpnprd01.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240208_075558_090256_159E24EC 
X-CRM114-Status: GOOD (  11.65  )
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

Hi, Biju,

On 08.02.2024 16:39, Biju Das wrote:
> Hi Claudiu,
> 
>> -----Original Message-----
>> From: Claudiu <claudiu.beznea@tuxon.dev>
>> Sent: Thursday, February 8, 2024 12:43 PM
>> Subject: [PATCH 02/17] dt-bindings: clock: r9a07g044-cpg: Add power domain
>> IDs
>>
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Add power domain IDs for RZ/G2L (R9A07G044) SoC.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>  include/dt-bindings/clock/r9a07g044-cpg.h | 58 +++++++++++++++++++++++
>>  1 file changed, 58 insertions(+)
>>
>> diff --git a/include/dt-bindings/clock/r9a07g044-cpg.h b/include/dt-
>> bindings/clock/r9a07g044-cpg.h
>> index 0bb17ff1a01a..e209f96f92b7 100644
>> --- a/include/dt-bindings/clock/r9a07g044-cpg.h
>> +++ b/include/dt-bindings/clock/r9a07g044-cpg.h
>> @@ -217,4 +217,62 @@
>>  #define R9A07G044_ADC_ADRST_N		82
>>  #define R9A07G044_TSU_PRESETN		83
>>
>> +/* Power domain IDs. */
>> +#define R9A07G044_PD_ALWAYS_ON		0
>> +#define R9A07G044_PD_GIC		1
>> +#define R9A07G044_PD_IA55		2
>> +#define R9A07G044_PD_MHU		3
>> +#define R9A07G044_PD_CORESIGHT		4
>> +#define R9A07G044_PD_SYC		5
>> +#define R9A07G044_PD_DMAC		6
>> +#define R9A07G044_PD_GTM0		7
>> +#define R9A07G044_PD_GTM1		8
>> +#define R9A07G044_PD_GTM2		9
>> +#define R9A07G044_PD_MTU		10
>> +#define R9A07G044_PD_POE3		11
>> +#define R9A07G044_PD_GPT		12
>> +#define R9A07G044_PD_POEGA		13
>> +#define R9A07G044_PD_POEGB		14
>> +#define R9A07G044_PD_POEGC		15
>> +#define R9A07G044_PD_POEGD		16
>> +#define R9A07G044_PD_WDT0		17
>> +#define R9A07G044_PD_WDT1		18
>> +#define R9A07G044_PD_SPI		19
>> +#define R9A07G044_PD_SDHI0		20
>> +#define R9A07G044_PD_SDHI1		21
>> +#define R9A07G044_PD_3DGE		22
>> +#define R9A07G044_PD_ISU		23
>> +#define R9A07G044_PD_VCPL4		24
>> +#define R9A07G044_PD_CRU		25
>> +#define R9A07G044_PD_MIPI_DSI		26
>> +#define R9A07G044_PD_LCDC		27
>> +#define R9A07G044_PD_SSI0		28
>> +#define R9A07G044_PD_SSI1		29
>> +#define R9A07G044_PD_SSI2		30
>> +#define R9A07G044_PD_SSI3		31
>> +#define R9A07G044_PD_SRC		32
>> +#define R9A07G044_PD_USB0		33
>> +#define R9A07G044_PD_USB1		34
>> +#define R9A07G044_PD_USB_PHY		35
>> +#define R9A07G044_PD_ETHER0		36
>> +#define R9A07G044_PD_ETHER1		37
>> +#define R9A07G044_PD_I2C0		38
>> +#define R9A07G044_PD_I2C1		39
>> +#define R9A07G044_PD_I2C2		40
>> +#define R9A07G044_PD_I2C3		41
>> +#define R9A07G044_PD_SCIF0		42
>> +#define R9A07G044_PD_SCIF1		43
>> +#define R9A07G044_PD_SCIF2		44
>> +#define R9A07G044_PD_SCIF3		45
>> +#define R9A07G044_PD_SCIF4		46
>> +#define R9A07G044_PD_SCI0		47
>> +#define R9A07G044_PD_SCI1		48
>> +#define R9A07G044_PD_IRDA		49
>> +#define R9A07G044_PD_RSPI0		50
>> +#define R9A07G044_PD_RSPI1		51
>> +#define R9A07G044_PD_RSPI2		52
>> +#define R9A07G044_PD_CANFD		53
>> +#define R9A07G044_PD_ADC		54
>> +#define R9A07G044_PD_TSU		55
> 
> Not sure these PD id's can be generic and used across all RZ/G2L family
> devices and RZ/V2M?

That may be another approach. I chose this one to have everything SoC
specific in a single place. With this, e.g., we can have all the SCIF
related IDs grouped together (as we know from the beginning how many SCIF
blocks a SoC has):

+#define R9A07G044_PD_SCIF0		42
+#define R9A07G044_PD_SCIF1		43
+#define R9A07G044_PD_SCIF2		44
+#define R9A07G044_PD_SCIF3		45
+#define R9A07G044_PD_SCIF4		46

If a single file with all the IDs for all the SoC will be used then, as
every SoC will have a different number of SCIFs, I2Cs, RSPIs, to keep the
DT binding backward compatibility, we will end up with these IDs not being
grouped on functionality, e.g., we may end up with something like:

+#define R9A07G044_PD_I2C0		38
+#define R9A07G044_PD_I2C1		39
+#define R9A07G044_PD_I2C2		40
+#define R9A07G044_PD_I2C3		41
+#define R9A07G044_PD_SCIF0		42
+#define R9A07G044_PD_SCIF1		43
+#define R9A07G044_PD_SCIF2		44
+#define R9A07G044_PD_SCIF3		45
+#define R9A07G044_PD_SCIF4		46
+#define R9A07G044_PD_SCI0		47
+#define R9A07G044_PD_SCI1		48
+#define R9A07G044_PD_IRDA		49
+#define R9A07G044_PD_RSPI0		50
+#define R9A07G044_PD_RSPI1		51
+#define R9A07G044_PD_RSPI2		52
+#define R9A07G044_PD_CANFD		53
+#define R9A07G044_PD_ADC		54
+#define R9A07G044_PD_TSU		55

+#define R9A07G044_PD_SCIF5		56
+#define R9A07G044_PD_SCIF6		57
+#define R9A07G044_PD_I2C4		58
+#define R9A07G044_PD_RSPI3		58
+#define R9A07G044_PD_RSPI4		59

Of course, I can adjust it if Geert wants it differently.

Thank you,
Claudiu Beznea

> 
> Cheers,
> Biju
> 
>> +
>>  #endif /* __DT_BINDINGS_CLOCK_R9A07G044_CPG_H__ */
>> --
>> 2.39.2
>>
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
