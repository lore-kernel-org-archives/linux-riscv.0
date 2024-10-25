Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 478BBD116E3
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Oct 2024 03:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=92EIbOan3jQ/kY2p45Kd4DgED6PGSDEIl70VF/it50U=; b=KO/P67GOeju/dJ
	ArqgWDNpmPuB+0/sYPeTHC4jV2FRJWjrfcdPav+4oV86ENgQ9QiUVfNLNPIWmtWqYnV7Ws9QGcpLs
	VgBFvmqQlWciObHJELwJxFrSV5sP+HFeZAT6Z9Jm496cAcKyTnJ0cHqvtSYnR7ZHKX5ZFWWIF+SaG
	ht5TvGOamHOSoE9DYr1PsfWcFxAAHvgw2xMccAEaceMxlQuFvM5in1IpESihjq2suAc+aT42BiLsN
	HNl4aKS+lR/ArLT6o2LoJGzf7re/3BAjcPEdoa9zsu4uLvVQ3+LpcdvHUHJivlTZmgc2dCYhoFsNG
	xv60o7prMxVJ450jtD6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4B0d-00000002Ncv-2kkL;
	Fri, 25 Oct 2024 03:29:07 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4B0a-00000002NcT-3R5o
	for linux-riscv@lists.infradead.org;
	Fri, 25 Oct 2024 03:29:06 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2e2b549799eso1210286a91.3
        for <linux-riscv@lists.infradead.org>; Thu, 24 Oct 2024 20:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729826944; x=1730431744; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Sl03rwfXTghu5TO4DIsVs3ACSusq5Si6Ig0V2GjyFFw=;
        b=QT8ev3seHGwiLHeytj2+L9MzxujbYaEgom+93cp/qMTl9vVM71xWY3CP8n661KQ2sb
         ZRiumIg2eEH81SH2FVaBQzaXUN4yFSngNtu+er0m0i7hI8DeKTeM1nMYZOM4xLgo1WMv
         XvRrWfn/a4dtcM2QmuMhufltZcS6YNJNo5/bLJzE9jXQaIwUhpmQlCn88TC4kyugr766
         Pw+W7280sVgDnA8aU3tc/fexlxD2PwA/ijWP6XYLr9KwENrXck+OsiFMkjpXKk1auoGt
         0tO6lrpcpUCT8Ug7nvkBqnb4ANg9A7GtYxdvC597et/hwlipXeMRErDss8cU/tL9xl3H
         c2fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729826944; x=1730431744;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sl03rwfXTghu5TO4DIsVs3ACSusq5Si6Ig0V2GjyFFw=;
        b=VQuNWyiR7epfEEDu+yQkbf0mQAbhvz7CwCNdvyXlHQjq5M9GOSlHPG46sip7jOv+9A
         ka0mCgR8clkNvl0TI156tqNssyOvnGPIm5hwD8f8bc8mUQaqM8qJ8LWxpAxb6xmSpKc6
         TgoRo64nbrI5xQ1zQyQ313D3BfruDl9lkR4lX2DE4JSR68WexoFINg4RmwUc3grZYvKu
         K1pLfSCNqVKgcISVYVpxBBUK5Nsi1i5N32WhHLyRx9LIZtVwMoYW/B3QN9ddMpI/ywSz
         wGvacOwb2Uru+WchGEeMk65sk4zu2PBwX8YHCsq9nU7C2oPba8q7YHsr96irvLAa5xjD
         +04Q==
X-Forwarded-Encrypted: i=1; AJvYcCVCa6fMi3qAkidGyicRjcym9nUhGvB88PoU29dk0hMnIea/Yg2YVKD/4BRAwjy/KGM4sul8SN58NrF+Ag==@lists.infradead.org
X-Gm-Message-State: AOJu0YydnBrKjjwT5kXJm7xE9Q45HTvnbXZfH019JxmKHii65AeooOTC
	Rgaby9QwdhG4g3tKq9nwH1iya3tmA0mHH/PDBv6H665lyUmYPYSBjNx0pA==
X-Google-Smtp-Source: AGHT+IGisdWRfEyvyGXXRh7g5blq5MkQ0Xl2pOeYb3wvbIHUDx4j/4H0wcRJTEQHYF63X2oR5HNGMQ==
X-Received: by 2002:a17:90b:1047:b0:2e2:af52:a7b7 with SMTP id 98e67ed59e1d1-2e76b7116d7mr8890347a91.34.1729826943738;
        Thu, 24 Oct 2024 20:29:03 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e77e51539dsm2308811a91.29.2024.10.24.20.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 20:29:03 -0700 (PDT)
Date: Fri, 25 Oct 2024 11:28:41 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicornxw@gmail.com>, ukleinek@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, unicorn_wang@outlook.com, 
	inochiama@outlook.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org, chao.wei@sophgo.com, 
	haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com, chunzhi.lin@sophgo.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 1/3] dt-bindings: pwm: sophgo: add PWM controller for
 SG2042
Message-ID: <2mwkqy7xqj6bydwutwjmyeq4swnqfmljr45rl474uqciglmpt4@2kgwci2oxyp2>
References: <cover.1729037302.git.unicorn_wang@outlook.com>
 <fec7163144d7f7b615695b5fd22a182ed7f1e7e9.1729037302.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fec7163144d7f7b615695b5fd22a182ed7f1e7e9.1729037302.git.unicorn_wang@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_202904_900491_DC71EE90 
X-CRM114-Status: GOOD (  16.91  )
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

On Wed, Oct 16, 2024 at 08:19:22AM +0800, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
> 
> Sophgo SG2042 contains a PWM controller, which has 4 channels and
> can generate PWM waveforms output.
> 
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/pwm/sophgo,sg2042-pwm.yaml       | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml b/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml
> new file mode 100644
> index 000000000000..fe89719ed9dd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pwm/sophgo,sg2042-pwm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sophgo SG2042 PWM controller
> +
> +maintainers:
> +  - Chen Wang <unicorn_wang@outlook.com>
> +
> +description:
> +  This controller contains 4 channels which can generate PWM waveforms.
> +
> +allOf:
> +  - $ref: pwm.yaml#
> +
> +properties:
> +  compatible:
> +    const: sophgo,sg2042-pwm
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: apb
> +
> +  "#pwm-cells":
> +    const: 2
> +

Does this ip need a reset? I see a RST_PWM in the reset bindings.
If so, please add reset support for the whole patch.

> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    pwm@7f006000 {
> +        compatible = "sophgo,sg2042-pwm";
> +        reg = <0x7f006000 0x1000>;
> +        #pwm-cells = <2>;
> +        clocks = <&clock 67>;
> +        clock-names = "apb";
> +    };
> -- 
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
