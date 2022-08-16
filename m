Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C64C2BB41
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Aug 2022 07:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sMlcho2BuTs/1PQ2Zk9L31dCff88/N60oqdZKRDsVgs=; b=h4okj13SKjeZ9E
	In/NXGDcJXYIF6kgKOR9WhFsNGMzayel/Vy9O+q/EJSkGTjTY01K/wnIdZlX1V22q61uXchHGsWXP
	5kPmS1jbktahz1ixr8i1NGA0eyO3eyFPRB+X25WfPVOlqFr+ItKQ9l90NgoGZ4eIltgpcvj4hA/wd
	/aa+Z8Dnjr5LCsqkcfWC6G0gSOgm7FzmQNG0wZmBsq0nPNPg8bNz/3fy/hFk7DoKhlXdj4ZWtvET4
	Je3c2F2wydWJ18zYOwSHoXTMA0+X/fVUwGvLFBapTftSpLlbew8enzp641RE5FFyv/HtL3w0oy12+
	GmOUPHZ9fZeweg6U0RHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNrAx-00FT0Q-Tc; Tue, 16 Aug 2022 07:39:47 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNrAu-00FSmS-5X
	for linux-riscv@lists.infradead.org; Tue, 16 Aug 2022 07:39:46 +0000
Received: by mail-lf1-x132.google.com with SMTP id c28so9635778lfh.3
        for <linux-riscv@lists.infradead.org>; Tue, 16 Aug 2022 00:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=btyntIg+6JbLy0894fPNlZeMSSyk53Lr6h4dc4QK0Co=;
        b=gLQxbMAXKhy40wWpKbzWV5WJdiOAFd8yiN9e/ugYXdxZgM51yId8ncUlykQBryCSFS
         gjkk2OImTlXH1dlcpVIJXPt9/NOM4XaJ1lZWiUgrEtEca3g/adpfaEdB0mbaYHKOr8g3
         NHCeRyWYN9fAkZQXFViueUT3z4Wf0DSGYKWwxV+11xGVdwHFXMhW0L2437v1NPhtugN5
         S+h+zf6a7Ixtt7x+xpnz6zZQIgDXAqFlXXdiA9XOOQV5NAmdhdy3jGL7CCD3+0B5RDHE
         uw1Z6QVDZWRSyxqAyowNEnMhk9pRXNVtf3Qcj58p/nE9g5UaPgTzfepzMdZOxSOzITxz
         lnZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=btyntIg+6JbLy0894fPNlZeMSSyk53Lr6h4dc4QK0Co=;
        b=mXl4WbOKlWqXc7lVw5bJSaJFAhVzS/hQ2iSntBQ81KKpfAJ0s6l1mXYTyycDwIjAGV
         HoX9sDBsH33vKZ86aQm36l/TanU5b89ErQ+PfPfIsT8KfE2duYzsXSCQyX5n9jKaE4pz
         qZ5g9/BCc0mXHcv8Li0jr/9dDmDSDD+/3C1ql7triDIaHudzezlH07HJVxp3pmjiR6A3
         ujfXZgLHjolmZbOWqEYyeEG7gCKf1IM4V3j/OAJJz260JoaRbCgNA1dhOCZ8iHc4njsv
         0EPWc4kB3IOQn4F1Ks8u1PTaWPi39dC3hUbujCh/4RJk+umglwTt7FzFx9QlQSXudDPt
         63hA==
X-Gm-Message-State: ACgBeo0WJEuLue7yx8VC2TL2YKJdjssDesIhUqV/OadRcT5/r7VKIgOp
	eF2RDJARFSirWD8HLjRkPCpEww==
X-Google-Smtp-Source: AA6agR5Otw3L/ye4I0Fc78uHZiVk2dPD8EYKzSpl1dan6fstRqLuZDDmi8GIEb65XgKTtqZpLahfbw==
X-Received: by 2002:a05:6512:25a3:b0:48a:e7e7:eea3 with SMTP id bf35-20020a05651225a300b0048ae7e7eea3mr6296301lfb.205.1660635580231;
        Tue, 16 Aug 2022 00:39:40 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ae:539c:1782:dd68:b0c1:c1a4? (d15l54g8c71znbtrbzt-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1782:dd68:b0c1:c1a4])
        by smtp.gmail.com with ESMTPSA id p21-20020a2ea4d5000000b0025df5f38da8sm1706327ljm.119.2022.08.16.00.39.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Aug 2022 00:39:39 -0700 (PDT)
Message-ID: <1f84e925-1a0f-6100-c444-a8157e14ab5a@linaro.org>
Date: Tue, 16 Aug 2022 10:39:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 04/12] dt-bindings: riscv: Add Allwinner D1 board
 compatibles
Content-Language: en-US
To: Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220815050815.22340-1-samuel@sholland.org>
 <20220815050815.22340-5-samuel@sholland.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220815050815.22340-5-samuel@sholland.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_003944_293661_05C14E13 
X-CRM114-Status: GOOD (  13.21  )
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

On 15/08/2022 08:08, Samuel Holland wrote:
> Several SoMs and boards are available that feature the Allwinner D1 SoC.
> Document their compatible strings.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 
>  .../devicetree/bindings/riscv/sunxi.yaml      | 64 +++++++++++++++++++
>  1 file changed, 64 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/riscv/sunxi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/riscv/sunxi.yaml b/Documentation/devicetree/bindings/riscv/sunxi.yaml
> new file mode 100644
> index 000000000000..564a89499894
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/riscv/sunxi.yaml
> @@ -0,0 +1,64 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/riscv/sunxi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Allwinner RISC-V SoC-based boards
> +
> +maintainers:
> +  - Chen-Yu Tsai <wens@csie.org>
> +  - Jernej Skrabec <jernej.skrabec@gmail.com>
> +  - Samuel Holland <samuel@sholland.org>
> +
> +description:
> +  Allwinner RISC-V SoC-based boards
> +
> +properties:
> +  $nodename:
> +    const: '/'
> +  compatible:
> +    oneOf:
> +      - description: Dongshan Nezha STU SoM
> +        items:
> +          - const: 100ask,dongshan-nezha-stu
> +          - const: allwinner,sun20i-d1
> +
> +      - description: D1 Nezha board
> +        items:
> +          - const: allwinner,d1-nezha

You grow the list unnecessary. Several entries should be an enum, unless
platform maintainer insists on such approach for all Allwinner Riscv
platforms. Just be aware it will grow...


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
