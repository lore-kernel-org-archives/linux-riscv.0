Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C99C44506
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 16:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zItApmpVGq8QtDGTvtQ6l/4jCNYolli71JxHvoO4Sj8=; b=HIZlPwjR9QyWcE
	JfOdlAzbGQACBP3/5hFjsJVZuzSKbJhs5onLTx5wq7xGKB400DKx2oDFY1v065y53TQtwKpbLyUpp
	yOZ8EDzX9b/ayr0xA3yx9UA4hzLMLxIFx6EDAmphH/7UoeX5K02SY8gHpld+FcoVqBCXpH4HL3aHd
	VWFMoaugneoptALWbLV2TK1ZP0CfMUCR+f0y+//m/lcWWF/LUqMcuY+qh+TwISf6m/6kyP1PGHtd+
	K7X7NmF8x5rZM+fc/BMI79sB8hx19djh24LEKTPzfjA9PlH2j1TUblU5UuwJjfckumG7Lv59g8Ueh
	8I1zu/t866vzHMlJSQmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiDfY-00000005Ezn-2k4T;
	Fri, 10 Jul 2026 16:01:40 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiDfV-00000005Exz-3weK
	for linux-riscv@lists.infradead.org;
	Fri, 10 Jul 2026 16:01:39 +0000
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-8ee43b3e5abso7424256d6.3
        for <linux-riscv@lists.infradead.org>; Fri, 10 Jul 2026 09:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1783699296; x=1784304096; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mBrb1/xcTqbJkDmBUM03GUxf19wY42RaKRfKCOCo/XA=;
        b=M0vFGw8X3eruf0sMqDs0/cm+7Wy6vzmFHF6fa+Moa62AtoamhZu3AOZSF2dOU4WX49
         qYqfQYzG2wEM5lZzA5BaxFx2YaLrlYHA4osMf0HR0lEmmLv2YTcaFXdMj8YZh0JqCyid
         nkHC8m/cdAh76k4XsI2uffNzl5WZ/DgkljuPy/eLtjQDBs2jqFfU/OcTfK2tdkj2pXeI
         +tkIGRDbCppqxYdd2qHVuJAl9Nj6CVt6cVQ3+D9IJdi461qpiq3Rhv2PQkWUIkoyI37h
         k2IltS/EdVwnrIpWN6uauip658xY7/TZsau5dgEmLYHZFe780ps+mfwDYvsobslJi022
         GfdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783699296; x=1784304096;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mBrb1/xcTqbJkDmBUM03GUxf19wY42RaKRfKCOCo/XA=;
        b=mE5bYEaNcmKYO1SMzJ8/8nILuaCZTUw/Imec7+dMSPVw1UBhYRPZlvLVrvO7xsVKtm
         Z3Zt1Gua7U3emFTFkU45Wfukn0Btr1S43kwkDmRiJ04LlKcNCl81Vw4hQoNDgcnjeppU
         UMyC1PMP2Kmfb/7D7tzKPo+rCK22KbBOdMzXp+FyrupKyI822dQXLDK0wLQ6VRVab8d2
         mU0g9AIHJlmXHuMi5EVnQ/oBwKrWoEAGXQ/H+NGdG2HNuWnl/le+rS6omIuirNFQJkOe
         Ws1qFcTZDsDugetYzjPHyXI7YcJuMPWKry54Hqr3+JZCFB8lBlSgCkO3CW/9Dulg72vP
         +Dpg==
X-Forwarded-Encrypted: i=1; AHgh+Ror0Xzc5lqLgAMQhsZZg8qMGDo/MTak7D3RdcGTzn4nfpvGP5gKMgSZyX6/2OLcYgEqYMoLh52S4ppXBg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx78FAldY1XAnypU0vs71ogZQRTXeEDlff3w49vlIgdnWZQOQpT
	vIUubfDQ8X7NokYifxdRmQ31qfpIlkGNBEoti/W9Tam1UroNI05ABrZenfmmUrQuOcM=
X-Gm-Gg: AfdE7ckqYfoAoLVZWzBht1U8E9FiSQsomuqOeHVn5SvFFrgedi0BF65fKtSbEnCmhcQ
	fdc2bOj+c4VVKjZ6XMHey1KG5LSnUSRPwf0ih5n7ObzLsyKqtmG0MTbKcqB0v2YSqj9EGsSnyO6
	/aFW0jf2nIINhVPzU/zSnntZNnChnXvJDlMX0n9rNQV5qYEJKX0EvewuqWU8vVuhqgvJI3YIHpn
	sSEUVLCA9fGoqOOZ+GdutUHLWp61Lx519nhEsI0cBI5E5ab2y4SmjYIcTLxgvh0r2/2AyoA6FMB
	arWHtJF+wZRarU94M0TtDFyybCGK3/Iug70ePTpakHtK2c27cQiSnrtQGLvuWBjO23kWwV8tl30
	ulkjsJI/AcLXa7rSFd6s6QIcZtVyI/sMOm+kwbSGVX8XoDeCpYh2DTiNAeMVuN4aW8kII5IhY+F
	FJQAb+elnPw/MU
X-Received: by 2002:ad4:5c47:0:b0:8ef:8e79:bb51 with SMTP id 6a1803df08f44-8fec2279f84mr159256126d6.40.1783699294772;
        Fri, 10 Jul 2026 09:01:34 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9036e27f765sm8965376d6.11.2026.07.10.09.01.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 09:01:34 -0700 (PDT)
Message-ID: <79888a39-ac3c-440a-9299-582066868140@riscstar.com>
Date: Fri, 10 Jul 2026 11:01:32 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] dt-bindings: PCI: snps,dw-pcie: Add msi-parent for
 MSI handle check
To: Inochi Amaoto <inochiama@gmail.com>, Jingoo Han <jingoohan1@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Christian Bruel <christian.bruel@foss.st.com>, Frank Li <Frank.Li@nxp.com>,
 Nam Cao <namcao@linutronix.de>, Qiang Yu <qiang.yu@oss.qualcomm.com>,
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
 Xincheng Zhang <zhangxincheng@ultrarisc.com>,
 Siddharth Vadapalli <s-vadapalli@ti.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Vidya Sagar <vidyas@nvidia.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>,
 Longbin Li <looong.bin@gmail.com>
References: <20260709040027.958400-1-inochiama@gmail.com>
 <20260709040027.958400-5-inochiama@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260709040027.958400-5-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_090137_992609_61C1C1C6 
X-CRM114-Status: GOOD (  13.42  )
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

On 7/8/26 11:00 PM, Inochi Amaoto wrote:
> The IMSIC device on RISC-V based system does not require ID
> remapping for MSI. So this device only needs "msi-parent"
> property for IMSIC-based SoC, and the "msi-map" is not a
> necessary property.
> 
> Add new condition for MSI handling on IMSIC based SoC.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

I have nothing to add here.	-Alex

> ---
>   Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml b/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
> index b3216141881c..91bbbc8924f6 100644
> --- a/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
> @@ -27,8 +27,11 @@ allOf:
>     - $ref: /schemas/pci/snps,dw-pcie-common.yaml#
>     - if:
>         not:
> -        required:
> -          - msi-map
> +        anyOf:
> +          - required:
> +              - msi-map
> +          - required:
> +              - msi-parent
>       then:
>         properties:
>           interrupt-names:


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
