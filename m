Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A6FECAAA1
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Sep 2022 20:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x5ujaQO1kUzYf3CkUQQ90tKR04ogp1uiQgSXSEd6p0k=; b=IlsW/VO/3ui1q+
	onZsAMwagpgU2DAGfG+tli/MCbU0gtgUSNd3JU8wfx4zaQsUPQP+1tcNcF8qgCPBnnRJzlotxDZk3
	XTkPKbz914l9D6483hSH032+ifAHVIo/04hxEaENMO6lKz+U6EMdra0RUflk2hOREZ1+Jf7B0H/82
	BGDFMAO+z01E+FOwm8VV7JY0gCy2vGe1H6piBcmSsWcvK91iwzcDMWIQma04l5d/6lxk3E/BWbtyf
	4qfs7E61RbhkuiaJs0XqT/M6pjfHlqUd/lI758WkrsbCYntb8lgReuxwQc1WsaLGsyia+iXNjl5bS
	K81pOqzNGd8djvJNrsVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYvrc-00HA4p-BK; Thu, 15 Sep 2022 20:53:36 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYvrZ-00H9u0-Ew
	for linux-riscv@lists.infradead.org; Thu, 15 Sep 2022 20:53:34 +0000
Received: from [167.98.135.4] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oYvrO-00079Q-DO; Thu, 15 Sep 2022 22:53:22 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Prabhakar <prabhakar.csengg@gmail.com>
Cc: Atish Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 02/10] dt-bindings: riscv: Sort the CPU core list alphabetically
Date: Thu, 15 Sep 2022 22:53:20 +0200
Message-ID: <2526125.Lt9SDvczpP@phil>
In-Reply-To: <20220915181558.354737-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20220915181558.354737-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20220915181558.354737-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_135333_541159_4EA31DB9 
X-CRM114-Status: GOOD (  13.93  )
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

Am Donnerstag, 15. September 2022, 20:15:50 CEST schrieb Prabhakar:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Sort the CPU cores list alphabetically for maintenance.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

That makes a lot of sense

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> ---
> v2->v3
> * included RB tag from Geert
> 
> v1->v2
> * Included RB tag from Krzysztof
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
> index 873dd12f6e89..2a1c5ae5b0aa 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -27,17 +27,17 @@ properties:
>      oneOf:
>        - items:
>            - enum:
> -              - sifive,rocket0
> +              - canaan,k210
>                - sifive,bullet0
>                - sifive,e5
>                - sifive,e7
>                - sifive,e71
> -              - sifive,u74-mc
> -              - sifive,u54
> -              - sifive,u74
> +              - sifive,rocket0
>                - sifive,u5
> +              - sifive,u54
>                - sifive,u7
> -              - canaan,k210
> +              - sifive,u74
> +              - sifive,u74-mc
>            - const: riscv
>        - items:
>            - enum:
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
