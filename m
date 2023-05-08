Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBAF6C77B7F
	for <linux-riscv@archiver.kernel.org>; Mon,  8 May 2023 09:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8sSPdJRltQk2w/esPzc4rm2NTKXBZ29I0eEmPwGQfUM=; b=Nn3rSGYw7z6yXh
	0vJ9gCp7sgVDSKt6xEw04eFRlbeNpxXME6CrGxGrrt9ENQKAdapJRcdh+ss8C2rHwmgJw7T43H1Bk
	iNla6nyCShiZnjMMFkkPkwU4d52IWxIN/YmGBbdbalGA8a7agEXJrwd6FWQDUD5AGfIayZCJigdff
	66OiQ/GylGB76XCi9GUCYu87+/Or6T1YRSsRUwv6P3i5PFl9iATyW+2JF1XDiDhmaAbOtzZPZthNr
	UyowKuvxMsMDHTTFor9KmL5G96vG+aznZARPnyX2iQbS9yF6B1OLg6Xn49uYtL/upsuVyqfVaAiOP
	CPa77LMBy5YXaspDISmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvwzj-00045K-1t;
	Mon, 08 May 2023 09:17:23 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvwzg-000440-2z
	for linux-riscv@lists.infradead.org;
	Mon, 08 May 2023 09:17:22 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-9661047f8b8so372059066b.0
        for <linux-riscv@lists.infradead.org>; Mon, 08 May 2023 02:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683537437; x=1686129437;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aT/uFog44v7hpe9khQhwWHiG/nU5zZuhtL/MLZy+P0w=;
        b=KFBWvKtd8EkCKNFrYmQPvtrs8JoO+F4vhM5jslgPgiFIxcsG6/OTdhe8GQkrEqjM72
         Q5Wbd7d1G+mf1VwHBuNK+wW0c1XRSvB7Nt565PeJ4bdiJwZFMhMIseHbTZ8rfsTqzJgq
         rs79IL8R2r6o0XPY39KZ95lVZTgU7pjdM42/TLnlqV6F6cn7Ih1jyOm7kMD0WbGFp1HR
         2SOpbS6RVms+lWJI5U3dxbK4Lx3C7uIcWfJ9cOKYqlP/Kf2z3KQjVe4jWHauMSgPZPXK
         MuRiVC+aZTUlIDJnkLnn/SLZHjFSQObUfRPhkpx7rtk0zG3ApLY3K9K6uxgPKVhE/4bw
         sPqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683537437; x=1686129437;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aT/uFog44v7hpe9khQhwWHiG/nU5zZuhtL/MLZy+P0w=;
        b=TdiTc1YqnFcdYHn6zfSewQNtUjl3lyXijYWhqS/TFXI4NotFRDOUl0RHDoSFAClXFz
         GhZ4CFzzT0/Gb53tOTOOhmE0UbdN65pKcpS2e0chW251g7KM6j2FzosgPBQZVai+72cT
         XTvskBYLY5Q7OIG8clsxIYpcU8LPno+2bejEKswPsCuflhqYIpaPRVsG8oe7js5TDGIK
         Wml4jyljS7kbfHujb2WaRoeSxBsAp9thLSKJ/B9yKBMF5P+l22i67bdsdcM/LkTQYfnQ
         fVsBK7As9VWBEO8Q7QddeCgjdQ1iWRA1gC3bzHhyvPOwiwoIsUpI2MVa++4Tp1PPQ4jM
         bXuQ==
X-Gm-Message-State: AC+VfDw7oNVu82tGCHnD2CP6TUqE7agQHy2JeeD4jbzD63j6fFdAUef3
	MQ/Du8lLgbuYVuwFPWPPSwt5yg==
X-Google-Smtp-Source: ACHHUZ5w7QnqTgHovRPNxpPaDJe6uCeFRlRxrvq/cwBsXBwk1T2v4ljWDc/la/6PD4AxiWyiwYXCzA==
X-Received: by 2002:a17:907:6e93:b0:962:582d:89bf with SMTP id sh19-20020a1709076e9300b00962582d89bfmr9026804ejc.55.1683537436956;
        Mon, 08 May 2023 02:17:16 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:50e0:ebdf:b755:b300? ([2a02:810d:15c0:828:50e0:ebdf:b755:b300])
        by smtp.gmail.com with ESMTPSA id ze16-20020a170906ef9000b00965ec1faf27sm4341570ejb.74.2023.05.08.02.17.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 02:17:16 -0700 (PDT)
Message-ID: <4375d93e-a21b-3dff-9d1e-44aa9637eefb@linaro.org>
Date: Mon, 8 May 2023 11:17:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/5] irqchip/sifive-plic: Support T-HEAD's C910 PLIC
Content-Language: en-US
To: Jisheng Zhang <jszhang@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, Guo Ren <guoren@kernel.org>
References: <20230507182304.2934-1-jszhang@kernel.org>
 <20230507182304.2934-2-jszhang@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230507182304.2934-2-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_021720_967271_C3432032 
X-CRM114-Status: UNSURE (   9.62  )
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

On 07/05/2023 20:23, Jisheng Zhang wrote:
> The T-HEAD's C910 PLIC still needs the delegation bit settingto allow
> access from S-mode, but it doesn't need the edge quirk.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml      | 4 ++++
>  drivers/irqchip/irq-sifive-plic.c                             | 1 +

Bindings are always separate patches.

Please run scripts/checkpatch.pl and fix reported warnings.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
