Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A8F6C04A68
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Jul 2022 08:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=970ksu1bRRXof3aveTkWTagHHZyKYTIF2QLw3cM4Ci8=; b=HOVgNcRvx2HQyN
	yvJvDDFJlIv+U20F+CygdWa7ZCoomaNGdUFfbS28Lt7DLyaK5k8cEnp25tSETA8D7TVzW7NCypRzv
	APkIDkbjvOPcnJSvPSmBERXiN8F3jeDDMX7/ePNcLRJcDHp+UQlrLhzcgEqui+r4YY9B1r6tgHc+J
	u6WGPlwlRWS7+xSL6Dp19AcT1d78TVqbc+aMeVOzQ+/vsF0zApcpRf0EktRk8383WWhgNHGSllhr6
	XIy4HKvdzH3LcijYBcs0TTq98iRWO/xeF7GdAsMe4Ch8rshH7fWW+yzVLcad49+CZ8ijhwFtyIYDJ
	TkSqui9CUtWZQK8m+Aow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGcpb-00BQJg-7J; Wed, 27 Jul 2022 08:55:51 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGcpY-00BQFQ-Ok
	for linux-riscv@lists.infradead.org; Wed, 27 Jul 2022 08:55:50 +0000
Received: by mail-lj1-x22e.google.com with SMTP id h12so1531770ljg.7
        for <linux-riscv@lists.infradead.org>; Wed, 27 Jul 2022 01:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Vuv1p7jjxhoLf3pl6CxfEW9ySyiN1TFLLwtvwe+It3s=;
        b=niNBmcan8R/3RdUV98uGLqwl8cQhwdYhfjDVALzrojVMoplHsWb16qG1S00+uIn+pf
         dSElWqy9craRDZY9wOc/EdXgTsA8gO/vWLc2RxlSRfwmw93lmti0FRzxnkwVI4ylKUwn
         ttgTRs8hGNe4Ns89VT8CpVajbSgwRdGkFSEO4CLZJR9PB5cYk7kmLY3lv0lsVT4DMUR6
         mH7uxRx/N4+BlMPW4x32aDrjDassyGxG9yom4SwAvl1bwAha4RrD87jLSY1HqpYBs5i0
         zh5bYHWoHhqwLFT/G62/x27nKtwMpH3P5pmAgdOjS6tkmLZ6RioI2tRMJHXFdynTNVhs
         5+3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Vuv1p7jjxhoLf3pl6CxfEW9ySyiN1TFLLwtvwe+It3s=;
        b=sDtwwqiVTkORFWBYlhUfnFEYVDtIm75/l10qN/Azb0j0cc9LEJpZ8Wem9OEp3dZ7Dw
         gCat9U9MHKnLI+gWEtJgFVHSnzBxBxjZrSmbSaL3bWgoZJlhRd6x6NWoteszJcku97F2
         bX248r3eQ5fWcrNR9l/8+3q+eVxEMHt9LGjLp7f66X6cMy4mY0qpp8rf1T19HP7iKFZt
         q35PBbwp5xvpoCDJDnKXnUXlz4SlNTC1RREo9IjMZGRsukR+4zQjAOXAvEW4eXdK4+mZ
         MF0/sbqTNzY/WlAgAmc4vz8LcalwyHvclflOMyXov6eg34SztH+v4vj0hPEiQQhZc51O
         sfhg==
X-Gm-Message-State: AJIora9pCxqnxpTVb+WUs9UM19EtY6GYEoKwDX6M4tOE1+N988K617iK
	cd88m0tKBh4YXgMw09xEmFnGSA==
X-Google-Smtp-Source: AGRyM1vJCX1i6V7I89K+c9fYQSciskM0/PYxd1o/dkCWLnV5x+RZ4SBIluxK5iib8VSoabYYu9QhJg==
X-Received: by 2002:a2e:bd13:0:b0:246:1ff8:6da1 with SMTP id n19-20020a2ebd13000000b002461ff86da1mr7256869ljq.219.1658912144950;
        Wed, 27 Jul 2022 01:55:44 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id k1-20020ac257c1000000b0048a8e831b38sm1610754lfo.245.2022.07.27.01.55.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 01:55:44 -0700 (PDT)
Message-ID: <6a87ee9b-f944-ab8c-cc00-fd8bbb22cad8@linaro.org>
Date: Wed, 27 Jul 2022 10:55:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 6/6] riscv: dts: renesas: Add initial devicetree for
 Renesas RZ/Five SoC
Content-Language: en-US
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Anup Patel <anup@brainfault.org>, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>
References: <20220726180623.1668-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220726180623.1668-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220726180623.1668-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_015548_835931_64D1483D 
X-CRM114-Status: GOOD (  14.84  )
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

On 26/07/2022 20:06, Lad Prabhakar wrote:
> Add initial device tree for Renesas RZ/Five RISC-V CPU Core (AX45MP
> Single).
> 
> Below is the list of IP blocks added in the initial SoC DTSI which can be
> used to boot via initramfs on RZ/Five SMARC EVK:
> - AX45MP CPU
> - CPG
> - PINCTRL
> - PLIC
> - SCIF0
> - SYSC
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  arch/riscv/boot/dts/Makefile               |   1 +
>  arch/riscv/boot/dts/renesas/r9a07g043.dtsi | 121 +++++++++++++++++++++
>  2 files changed, 122 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/renesas/r9a07g043.dtsi
> 
> diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
> index ff174996cdfd..b0ff5fbabb0c 100644
> --- a/arch/riscv/boot/dts/Makefile
> +++ b/arch/riscv/boot/dts/Makefile
> @@ -3,5 +3,6 @@ subdir-y += sifive
>  subdir-y += starfive
>  subdir-$(CONFIG_SOC_CANAAN_K210_DTB_BUILTIN) += canaan
>  subdir-y += microchip
> +subdir-y += renesas

What are you building there? There is no DTS.

Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
