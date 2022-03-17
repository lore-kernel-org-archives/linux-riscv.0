Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BE76C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Mar 2022 19:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=1GwoETXrHYu4CzGWVie2v8wx0ikZwsQhmXn5vs8pwGc=; b=naELA+3khLvsenwasJQERzOxHW
	Ge+CfBmBTr72Z7iinNPQIohcZcOUp16W98EmYTbXmzqaJxcOTF+HRqhxguFMPxUJhGtfT9iMjBSGj
	xJw9P49RKIdRubLObFcecVIUCtiSwdvFjJHtVPOyd5N6mmrYTiH+WuzhxinJBx2MI1Lw+7fVwC1yl
	KIE+7u4qr0EaOrqOPh4zZuuMcGrJ9njMy7OE2pfeJnI3neRra2ipahRYKN5I90wfnOVAcGbq0qHg4
	u/xiBdyV7wjNIjEOThiknHFgei6BenlGLJoGYQXPRsLskrPAtOPE8ZjJKx5dph0bUs3E7u/uB8Ljg
	CNcj8AXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUvcA-00H9fp-Cd; Thu, 17 Mar 2022 19:16:50 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUvbG-00H9DQ-M3
 for linux-riscv@lists.infradead.org; Thu, 17 Mar 2022 19:15:58 +0000
Received: by mail-pj1-x1033.google.com with SMTP id m22so5744587pja.0
 for <linux-riscv@lists.infradead.org>; Thu, 17 Mar 2022 12:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=vB5f3WAF1j14ezOj7+5eexYupdGogMxyhohhnTpJG3I=;
 b=rsLp6M4LC+ha3ufnaOhyywMK6wmY6Hf56U49g+9vNFfpqvMCyNPyBpiXhCkP4xvbFY
 9E0p8IUr27FGHaoK7iyxQC3LZEG+aoMEI0eUOhXhY5l8IV7wep6uEjjREn4iPEyxIWfa
 wbW2PSjskg54Dad/119rVJKOnZZ/dKg/Yf0disLS6nfuXqzpBD2K+wgg44U2t++ZNdaj
 nwwN1p3XtunPwuDDi16+096nin1zKvJ1Iwz0M45yHJl5c4CRlf06irAv0f0VrmFpc5jp
 GmsJaef8JdJ61XJO/g5QB+dOFOqwY55fZwTUT9FvXAolqNcCT0I12Uu8mpBgBGF9/QUB
 MMuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=vB5f3WAF1j14ezOj7+5eexYupdGogMxyhohhnTpJG3I=;
 b=CDIeLFpJ3Uh2jrSZLBrvgGHSb91FujnjdoKfzsP3pPJkamwPTdB/D2d+M3jfpf+G+u
 v/Sf2jmpi9C8RK7EhKAMh+BqLiEY783ocRME43mbXcHUU81txayucgUXUbyNrujBu3Ty
 Hgh9KAc4PApOUVQYa5DJxvTF87e/GEhZxH9MjI+5uVkVYY6RCjDq0PohiTEpNhpapH46
 B9X4m3a0f5IUj+eDiK3TeKMySm4v3v9yNERUwg19Yd5W8n2WS0o0pgKRzVecZg41HFka
 IP3gzg+RGL0bTJk6HUxThXky5tesKqp3jQqjb3ly+PvMjukPj3q1nRRqaj7zDBHCHPMa
 v+qg==
X-Gm-Message-State: AOAM532gapO63mdcwaa+Bsqs9jqXT7BF3LvwC0GY+Q56drA64vxIVGCe
 sdazpWN4INtDS43lTYTc9sLwew==
X-Google-Smtp-Source: ABdhPJwHtQFbcAMtkjIIk7TTag/gBPH400hGz9/wqUBz3Ag9FMPGaHQJZvaF1c312w1xdnvPWdUyvA==
X-Received: by 2002:a17:90b:4d11:b0:1c2:1939:ca83 with SMTP id
 mw17-20020a17090b4d1100b001c21939ca83mr17770961pjb.65.1647544552516; 
 Thu, 17 Mar 2022 12:15:52 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 j12-20020a056a00234c00b004fa042e822bsm7558479pfj.14.2022.03.17.12.15.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 12:15:51 -0700 (PDT)
Date: Thu, 17 Mar 2022 12:15:51 -0700 (PDT)
X-Google-Original-Date: Thu, 17 Mar 2022 12:15:46 PDT (-0700)
Subject: Re: [PATCH 17/18] dt-bindings: irqchip: sifive: include generic schema
In-Reply-To: <20220317115705.450427-16-krzysztof.kozlowski@canonical.com>
CC: tglx@linutronix.de, Marc Zyngier <maz@kernel.org>, robh+dt@kernel.org,
 krzk+dt@kernel.org, afaerber@suse.de, mani@kernel.org, linusw@kernel.org,
 kaloz@openwrt.org, 
 khalasa@piap.pl, michael@walle.cc, mark-pk.tsai@mediatek.com, daniel@thingy.jp,
 j.neuschaefer@gmx.net, Paul Walmsley <paul.walmsley@sifive.com>, nm@ti.com,
 kristo@kernel.org, 
 ssantosh@kernel.org, narmstrong@baylibre.com, dinguyen@kernel.org,
 cristian.ciocaltea@gmail.com, 
 qiangqing.zhang@nxp.com, l.stach@pengutronix.de, paul@crapouillou.net,
 jiaxun.yang@flygoat.com, 
 claudiu.beznea@microchip.com, jason@lakedaemon.net, paulburton@kernel.org,
 tsbogend@alpha.franken.de, 
 mail@birger-koblitz.de, bert@biot.com, john@phrozen.org,
 geert+renesas@glider.be, 
 sagar.kadam@sifive.com, s-anna@ti.com, lokeshvutla@ti.com,
 linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-actions@lists.infradead.org, 
 openbmc@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-oxnas@groups.io, krzysztof.kozlowski@canonical.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: krzysztof.kozlowski@canonical.com
Message-ID: <mhng-8f60f19c-40cb-4b5e-b392-9cdf8adc1d13@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_121554_759264_53840FAD 
X-CRM114-Status: GOOD (  13.66  )
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

On Thu, 17 Mar 2022 04:57:04 PDT (-0700), krzysztof.kozlowski@canonical.com wrote:
> Include generic interrupt-controller.yaml schema, which enforces node
> naming and other generic properties.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml     | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> index 27092c6a86c4..e3c08cff89d2 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> @@ -44,6 +44,9 @@ maintainers:
>    - Paul Walmsley  <paul.walmsley@sifive.com>
>    - Palmer Dabbelt <palmer@dabbelt.com>
>
> +allOf:
> +  - $ref: /schemas/interrupt-controller.yaml#
> +
>  properties:
>    compatible:
>      oneOf:
> @@ -91,7 +94,7 @@ required:
>    - interrupts-extended
>    - riscv,ndev
>
> -additionalProperties: false
> +unevaluatedProperties: false
>
>  examples:
>    - |

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

I'm assuming this is going in along with the others.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
