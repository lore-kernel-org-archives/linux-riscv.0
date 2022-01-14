Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E4ABC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jan 2022 16:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:
	In-Reply-To:Message-ID:Subject:Cc:From:To:Date:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fDdAuHqrwM21jF5lDNTK1UEvlJ+yq3sGUKZmwTec55g=; b=zs2vIi/JYqgRbU
	YjAJQGd+nB3bK1VkjJ0g4C16gG5lm+yW+GPu53vavs7Auio5rq3IZJBJA29yY+Pl3pSz6fVhzPN/R
	+aPR0zKhUDmWP8W6Lpt0o7mVSvTjEYHU1S4xiadyPgbGYlksvkaGpLPxmNKsTOqNBdRjBqEqYa6YH
	IV1phxcKORTOh9TKbOSTduO0+ywMz1/QTdy69K9Z+tWidNv6trtXr+fPmBXPONVky4tLqPTAR9rl0
	vnYaEsRIjkR7bOJfMImebrs/j44/UgjR/rhhaKPDCFx7tU0iueC2YEsBKvg8Ejy80Iq0+ukrp/V+o
	wboKk2gT/fUcbxNT+qxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8PI0-009it9-73; Fri, 14 Jan 2022 16:18:56 +0000
Received: from mail-4018.proton.ch ([185.70.40.18])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8PHx-009is6-El
 for linux-riscv@lists.infradead.org; Fri, 14 Jan 2022 16:18:55 +0000
Date: Fri, 14 Jan 2022 16:18:50 +0000
Authentication-Results: mail-4018.proton.ch; dkim=none
To: conor.dooley@microchip.com
From: conor dooley <mail@conchuod.ie>
Cc: linus.walleij@linaro.org, bgolaszewski@baylibre.com, robh+dt@kernel.org,
 jassisinghbrar@gmail.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, a.zummo@towertech.it, alexandre.belloni@bootlin.com,
 broonie@kernel.org, gregkh@linuxfoundation.org, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de, lee.jones@linaro.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-usb@vger.kernel.org,
 krzysztof.kozlowski@canonical.com, geert@linux-m68k.org,
 bin.meng@windriver.com, heiko@sntech.de, lewis.hanly@microchip.com,
 daire.mcnamara@microchip.com, ivan.griffin@microchip.com, atishp@rivosinc.com
Subject: Re: [PATCH v3 01/15] dt-bindings: soc/microchip: update syscontroller
 compatibles
Message-ID: <nK7Z7oZFnoE0yhMjColrEPJvSFc7SpHv54Ftu3PJzQjpLA0s1F0Rwa3P5qEQrcFhJVbcUvY3TOFppyaIAS9QX09qg5nPMiilhvOO_W0fmHQ=@conchuod.ie>
In-Reply-To: <20220114151727.2319915-2-conor.dooley@microchip.com>
References: <20220114151727.2319915-1-conor.dooley@microchip.com>
 <20220114151727.2319915-2-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_081853_681117_C0F60A40 
X-CRM114-Status: GOOD (  11.13  )
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
Reply-To: conor dooley <mail@conchuod.ie>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

> From: Conor Dooley <conor.dooley@microchip.com>
>
> The Polarfire SoC is currently using two different compatible string
> prefixes. Fix this by changing "polarfire-soc-*" strings to "mpfs-*" in
> its system controller in order to match the compatible string used in
> the soc binding and device tree
>
> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  ...larfire-soc-mailbox.yaml => microchip,mpfs-mailbox.yaml} | 6 +++---
>  ...s-controller.yaml => microchip,mpfs-sys-controller.yaml} | 6 +++---
>  2 files changed, 6 insertions(+), 6 deletions(-)
>  rename Documentation/devicetree/bindings/mailbox/{microchip,polarfire-soc-mailbox.yaml => microchip,mpfs-mailbox.yaml} (82%)
>  rename Documentation/devicetree/bindings/soc/microchip/{microchip,polarfire-soc-sys-controller.yaml => microchip,mpfs-sys-controller.yaml} (75%)
>
> diff --git a/Documentation/devicetree/bindings/mailbox/microchip,polarfire-soc-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml
> similarity index 82%
> rename from Documentation/devicetree/bindings/mailbox/microchip,polarfire-soc-mailbox.yaml
> rename to Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml
> index bbb173ea483c..9251c2218c68 100644
> --- a/Documentation/devicetree/bindings/mailbox/microchip,polarfire-soc-mailbox.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>  %YAML 1.2
>  ---
> -$id: "http://devicetree.org/schemas/mailbox/microchip,polarfire-soc-mailbox.yaml#"
> +$id: "http://devicetree.org/schemas/mailbox/microchip,mpfs-mailbox.yaml#"
>  $schema: "http://devicetree.org/meta-schemas/core.yaml#"
>
>  title: Microchip PolarFire SoC (MPFS) MSS (microprocessor subsystem) mailbox controller
> @@ -11,7 +11,7 @@ maintainers:
>
>  properties:
>    compatible:
> -    const: microchip,polarfire-soc-mailbox
> +    const: microchip,mpfs-mailbox
>
>    reg:
>      items:
> @@ -38,7 +38,7 @@ examples:
>        #address-cells = <2>;
>        #size-cells = <2>;
>        mbox: mailbox@37020000 {
> -        compatible = "microchip,polarfire-soc-mailbox";
> +        compatible = "mpfs-mailbox";

Example is wrong, should read "microchip,mpfs-mailbox".

Will resubmit Monday.

>          reg = <0x0 0x37020000 0x0 0x1000>, <0x0 0x2000318c 0x0 0x40>;
>          interrupt-parent = <&L1>;
>          interrupts = <96>;


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
