Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03D0CC021B0
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Feb 2025 13:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=H/HQZJ6JeCS6hx95jsO4zDN9ZEpSfOrSR4LQYCJZKVY=; b=3GMMoaJtfo5ky9omt1J3E4qJh+
	SRmPLeprW1v00GzaJUKqufPB+Pxl2s2yYt2sfWy2EpwfjUXJczFaUi2DAjCs6I6FDFrOJS57iiozS
	uoJuSjFrAKmfAnqPAH4cXlOzpFDspPP+rRt6daWB46V4QHVWBmr3efn8ypE+P+mcUW+80sc/XhsWD
	o1HB5XqkE50+2v8X/1M/leuPNs/o2DO+zYTaSoj666u4DySsl2mc76sEgl3vpHC8N9AYL6Oe2poCb
	3t7h900Jktqk3Vxu0kms4q/UUo6glkZ9mJurKpeeZ7rOmQ8BMRuhcMu7TEfC6k9Id8UK3y8bwY/pa
	/GF4haBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkkRp-0000000D3y1-3IaD;
	Wed, 19 Feb 2025 13:49:09 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkkRn-0000000D3wK-2HRE
	for linux-riscv@lists.infradead.org;
	Wed, 19 Feb 2025 13:49:08 +0000
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 3696D403E7
	for <linux-riscv@lists.infradead.org>; Wed, 19 Feb 2025 13:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1739972946;
	bh=vZ2L/MpVD9pi+KEJm9yQ5LlxRKJxVGZ45ty3yuLt/90=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=nEzbjkMWCJnyEWQBKILuTnDW97lTVU/aBTXW2aqzx3rC5S734Yb6BkrGSCEQuuZ+X
	 zcvHcndsb92buXpnQB7mKmbKhO7MMKe4YKoj6vSpuDuVCenqqJjW5/Hszp0KpG3My6
	 yG0encPaaPDwQXpT4rtKh2/pvuV3+KyWhjSoULAkdXr3FdEoPIzZchwmPz7GfcJBvD
	 YUMf27tiqfqpYwvL5j+e8Vb14ZwoUst7apMN01wa4vgW3HnIrhUHK1g5iMOtQoTq3v
	 2iCjpoTSHi0ATFRyvLkpEJJoTBH1DsDUUhioxb6dfbRfpLvJtKVQgGPXYDfaT0FjqF
	 UbylJ7ch0ayQw==
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-3f40db375e6so1278045b6e.0
        for <linux-riscv@lists.infradead.org>; Wed, 19 Feb 2025 05:49:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739972945; x=1740577745;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vZ2L/MpVD9pi+KEJm9yQ5LlxRKJxVGZ45ty3yuLt/90=;
        b=Q36sEP9NA97wUdhDS0tWu5xSgRVXfeA+OwmLqI2LhShjiNYSqysqth9JTGuuVd2fnl
         3mPDSi/1YvN6jkKgABomLUSzgBrDnT7/vuUX1T46xVlX42H/z/RhBtIXRqg3743q1qpe
         08yzWcz30GznqYMvCIhirOB15gWdBiKRa8cMjUoz5dg9VhChcktJH5RMtI+/ljPuucE/
         s6FjP+5CS6wLaFMcLHl/NVbxo8t1WuqOljsSrXiCKWJJXHN0g+PuTNuUIZ69qgZbePMx
         4dLiRq1a8I+Oe20TRqftrNEFFyt89UuVrz8SOKYIdU+kj55ZRbnyHfhrWLAV1mS0SgGV
         lP4w==
X-Gm-Message-State: AOJu0Yzw3QGUN2DeQsrITpyrR68RsEpwb+eIYGw8lQK/3LhQpToVt9Lf
	0QMo1gEUpxp8pol10TQJKY7RCczX+SVyltJJY1Z25iB53SZtc80xmIzZjA3ImzfaudE/haVpzze
	Fjrt6Bzb05tk0qv03WcOzna3bnWUDK/32jf4Yn6IJHjme5uLRx+WJGUS/FZ9wwhv78P+rHITIMR
	Q+ZFyR543b49fKSWfyoubQjV650T4kuYh/QJWBNVJ+EObCbFUNWEaiI+F0
X-Gm-Gg: ASbGnctMOR8tE6AFYsHetTKLpcDGDZ53yzaBG1P1oKFetMj/I6ldU1CBYIaBGn6HcPF
	H/ZBtANnoVVr6m92JYEKgGMBKL03XuXrzZWl2NKwpIL/Z7K0Jr6VnAb0uOmSbOKbY1fGLmQs2u8
	YSCld30uJXWwOIDfU=
X-Received: by 2002:a54:470b:0:b0:3f3:fd67:2608 with SMTP id 5614622812f47-3f3fd672befmr5957014b6e.29.1739972945145;
        Wed, 19 Feb 2025 05:49:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGemB5vEg69QJBbksFxTXFeiKLyjYXC6wA0L7MlZFlY9odqxeB6ktR9vGlUGBZLGLU/XQ5O+HGNQ5YSDDhmNxY=
X-Received: by 2002:a54:470b:0:b0:3f3:fd67:2608 with SMTP id
 5614622812f47-3f3fd672befmr5956995b6e.29.1739972944890; Wed, 19 Feb 2025
 05:49:04 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 19 Feb 2025 05:49:04 -0800
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 19 Feb 2025 05:49:04 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20250102183746.411526-2-e@freeshell.de>
References: <20250102183746.411526-1-e@freeshell.de> <20250102183746.411526-2-e@freeshell.de>
Mime-Version: 1.0
Date: Wed, 19 Feb 2025 05:49:04 -0800
X-Gm-Features: AWEUYZkTX4lQFT8guSxek473k_5pfX61Dv6EsoPJnhEMc3gblikrRm7DyM9abC4
Message-ID: <CAJM55Z-g4nQXcHe94KUj78W5N1PfSbRo03uPs31_8gH41z4aww@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] riscv: dts: starfive: jh7110: pciephy0 USB 3.0
 configuration registers
To: E Shattow <e@freeshell.de>, Conor Dooley <conor@kernel.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_054907_707831_4950482E 
X-CRM114-Status: GOOD (  11.47  )
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

E Shattow wrote:
> StarFive JH7110 contains a Cadence USB2.0+USB3.0 controller IP block that
> may exclusively use pciephy0 for USB3.0 connectivity. Add the register
> offsets for the driver to enable/disable USB3.0 on pciephy0.
>
> Signed-off-by: E Shattow <e@freeshell.de>

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

Thanks!

> ---
>  arch/riscv/boot/dts/starfive/jh7110.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> index 0d8339357bad..75ff07303e8b 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> @@ -611,6 +611,8 @@ usbphy0: phy@10200000 {
>  		pciephy0: phy@10210000 {
>  			compatible = "starfive,jh7110-pcie-phy";
>  			reg = <0x0 0x10210000 0x0 0x10000>;
> +			starfive,sys-syscon = <&sys_syscon 0x18>;
> +			starfive,stg-syscon = <&stg_syscon 0x148 0x1f4>;
>  			#phy-cells = <0>;
>  		};
>
> --
> 2.45.2
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
