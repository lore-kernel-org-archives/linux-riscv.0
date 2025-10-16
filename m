Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DC66CCD194
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Oct 2025 08:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BARHDWUx8SaN/qbXZpMccT3CacMGVf3tzcb/tMJDqrQ=; b=c0fWB8L412IsOU
	vPNPSp1ow/XQuuDVxHhjqNmmkTFdi0RqknialiDHznLUdtsK1LviGPheEatY67YoZMz9DsQs9GA6e
	T2xfeE4aae2V7FDXMjQ5yIyjdeHNLs7gy29meBVFda9rvQKsxdHG3hGjv0O2iI5NJKBbEo9VtL44u
	pkvstHXGWzY98PtKxUsL2Rxm2LYS/DcMVVZgkJTgjD3Akj5UMgMdrV5JsOTWXamPwU11B35fybVEa
	+DkAihxqzivSsoanuLFLw0As+i8cE3YcRI8ZhAMITse/m4cLkr7nXVAzIkqyaaqo2u//HIMhiimXz
	6KAxI6u2+ArHBnf2HMOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Joz-000000044pN-1iPU;
	Thu, 16 Oct 2025 08:58:53 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Jov-000000044mx-27eR
	for linux-riscv@lists.infradead.org;
	Thu, 16 Oct 2025 08:58:51 +0000
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id BC6853F75A
	for <linux-riscv@lists.infradead.org>; Thu, 16 Oct 2025 08:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1760605125;
	bh=9ahU9OdbDocKDvc07Qj5/lY6cHzOHOb3fbgPU7Jnmq4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=JWJmEZrSnJ0mV185qI++hJWrjx8MeXGxPnUeRk+YgrvGB1kt45EcfucATu+EkZKqK
	 gPo8yOpY9osDmhkc3/wQpBSowHSVAN+AB8CDW3Inb1S6J04egw+ZVYlG3v4uUJQr8n
	 RCVy0nBFx+3GcPAN7bnmcUKwE7iBILceiP2t7FMhKsEN4l9vRuJ+7KpECasVlxcV6p
	 FJAYtjkxvipFRQ4v8ew96M/myhiQAaN4IOVQQLUc2FAv9nx82IqxIdsR+7A4Vfm3FK
	 H6T3gLYDw3wgeokHDqxx8HmWH59i+araBlrvpE1ThsJERdv7l+ThQHgTtV4nM6UoUF
	 3U4cpG/32p2Qjg0IstmtbaPO6TLsDk9timnmewYwgBdXRnyZOCBk6+MB2ue/m3jmqs
	 Wzn3DSCMXkbrFoilp+usD27lobu0nIPdO9Q75NUN/9S7NCZ10ZzcSk3BhDAuMUthws
	 ad9vw3sufE5hMB0nvMWUM5iJknlQ1418A0A+3jE2NcxAxlBoeVK3Byg1wuaZzlIwJw
	 ddTqclhRnYlWiDPPDiabUThQi9LHWVmgxYukKsgNIO/lXPaXsYXqr+kwXTxh1br8UJ
	 MQXEruBj4sZatLLAHhmP7Qjkx/1JWpvdqZjoLoDYNP3yurJ4oAt8vaKGQKmtmyT/CE
	 3QxSQ1O9IcqenQ6b5ZbSPCc8=
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-470fd49f185so5032145e9.2
        for <linux-riscv@lists.infradead.org>; Thu, 16 Oct 2025 01:58:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760605124; x=1761209924;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9ahU9OdbDocKDvc07Qj5/lY6cHzOHOb3fbgPU7Jnmq4=;
        b=NX6Y0rAPGLDPTf+IbtRzpVEc8BOIAVs1gO25qEhyrevwvsyUa3RJyrBLJZTqGVwZGJ
         b3IYQpU5FNwaJN9VqZvFa57Ul/Gj3RC1oWLps7M+7GJNTEMLZgPiXR1mnaUOppOcVFfW
         ZK7rvDKn91957vPBM9sckY8EcsMURBrkLjDkY3adcIuro+hMclH/Zn+O+pnixf3rEUgZ
         mZGeepEcAs4kbEa19l7MLf3v54I+/vECupQtKcUkRbMGJciZd89NRMZjn/d6kkKMOZbw
         mW9mrMaDwdgfPrs2cRyl8zu+XCIJlx6ZRwPtzbS9RbcO13iwVHBLmgpYEns+JnZ1kwGu
         kBUg==
X-Forwarded-Encrypted: i=1; AJvYcCV3k08tVoBA/Y95lfMHCgSEX6hkzqMw5A7wI6arRF3QbAJrYGzelr45p9f+RI7h9JB79HPCLADH0vYERw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyuQVzdA6eACXPBbp7HTOrNoSzRPkg5gA6frrYQw7nfYhggXLR+
	Uoid6nKh4l8P872d0XvILCjnR8KfDp0bG2pIR8QF8249Nf5yYgLvM20K8MFqb4vB5NZuuMvb9wn
	agCMlD8MT3K1q3Xfhw9/lUuDxnD6Y9m/k9iQlKEH8xTUkgO5hLOMCG3G00aA2+CGpyZ8p1bacdZ
	gFskj4zgmShw==
X-Gm-Gg: ASbGncuz4PC+Ud77FfZUwz3QzcLtnfk6DmF0xpGDbN5dXD/qgmuaLPhkmuSttPMGvGx
	Q7eSaxmBe7Mim4fBYqAKwJLhqFXVfKcSCClF3q2XfcRBRV9QtDdPMUo05t3TORYr1SbAu1B6cij
	u9jL9oUhgBrT0HRRql3Zo7GxJed2pnYzf2i/d3Xr16/KH+VMBpMUaABybuhUkJvIlmrKGhZYzLd
	/swe4bFJ4xgPSRyTuzf+MZVyal8h2gopiEFE9sFY77f6gs2MvLcLdWXldbxasnLsS+FlLVNG8OT
	botm00ltxglO2rX2OC0jnCvWs/N5GWUodztePzLp32PVvRSrtVAXTSYVM3rn5hDT8ye8HT30bLr
	NT+hBARQ3GRB95Z7PMwrRoEsuG7xQL3DVQNIRYRmuq4kRBjE9mugDHwhlY0H9/5Zf+Mmahg1/
X-Received: by 2002:a05:600c:548d:b0:46e:49fd:5e30 with SMTP id 5b1f17b1804b1-46fa9a8f4e3mr242027575e9.6.1760605123703;
        Thu, 16 Oct 2025 01:58:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFascJJzEL6t6HgTISBwE+c0s63Iq7ev5oNUTb431XUwDd7m3F5ONlxv+Pvfs4GHfcbeXxcPg==
X-Received: by 2002:a05:600c:548d:b0:46e:49fd:5e30 with SMTP id 5b1f17b1804b1-46fa9a8f4e3mr242027245e9.6.1760605123256;
        Thu, 16 Oct 2025 01:58:43 -0700 (PDT)
Received: from [192.168.103.116] (ip-005-147-080-091.um06.pools.vodafone-ip.de. [5.147.80.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-471144d1765sm18286875e9.17.2025.10.16.01.58.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 01:58:42 -0700 (PDT)
Message-ID: <a4c5e7fd-a37d-4729-ad58-81523f813fb3@canonical.com>
Date: Thu, 16 Oct 2025 10:58:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/7] dt-bindings: PCI: starfive,jh7110-pcie: Add
 enable-gpios property
To: Hal Feng <hal.feng@starfivetech.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, "Rafael J . Wysocki"
 <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 E Shattow <e@freeshell.de>, Paul Walmsley <pjw@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>
References: <20251016080054.12484-1-hal.feng@starfivetech.com>
 <20251016080054.12484-3-hal.feng@starfivetech.com>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <20251016080054.12484-3-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_015850_284855_7A391E30 
X-CRM114-Status: GOOD (  15.28  )
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

On 10/16/25 10:00, Hal Feng wrote:
> Add enable-gpios property for controlling the PCI bus device power.
> This property had been supported in the driver but not added in the
> dt-bindings.
> 
> Fixes: 22fe32239770 ("dt-bindings: PCI: Add StarFive JH7110 PCIe controller")
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>   .../devicetree/bindings/pci/starfive,jh7110-pcie.yaml         | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/starfive,jh7110-pcie.yaml b/Documentation/devicetree/bindings/pci/starfive,jh7110-pcie.yaml
> index 5f432452c815..f254c7111837 100644
> --- a/Documentation/devicetree/bindings/pci/starfive,jh7110-pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/starfive,jh7110-pcie.yaml
> @@ -60,6 +60,10 @@ properties:
>       description:
>         The phandle to System Register Controller syscon node.
>   
> +  enable-gpios:
> +    description: GPIO used to enable the PCI bus device power
> +    maxItems: 1
> +

Shouldn't we try to keep the entries alphabetically ordered?

Otherwise looks good.

Best regards

Heinrich

>     perst-gpios:
>       description: GPIO controlled connection to PERST# signal
>       maxItems: 1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
