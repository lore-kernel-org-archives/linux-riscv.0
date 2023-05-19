Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDCAAC77B7F
	for <linux-riscv@archiver.kernel.org>; Fri, 19 May 2023 03:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gWjIflBxR4z8X7vMyYREfc4+cIDNqx3wCIZjQZbnkiE=; b=oLt4Xjp1DCVVKX
	yo+jmBnxcpds0tjLKv50LSplvMGSFEZTmy30dnxAopCPKEy012nYRIIeVcPl3dws0QMox67dkMiG9
	rPaj2hDfU9fmVRCCFBcz+1+YHfL0+mV8ZOwLQVseC8oGWnyKj/DLxkZGfq4S2o821UVM4Z1K/MC61
	41rAxDhb5C5sOrI+SRVBqjKzfwVrkTFdGPhAj6UJ8JIy0oMI0irdGsisAzmWtgkib6kdjHrrEv2zj
	6PB0tc3xuwRvw4E85ieMgCyKehgptuu9nt8b9FGQHAOYxMABvNjMDBTl6NxS5Eg53N1ABMZDYc5Xo
	anbmtseMt7DS9cb5vvIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzqqG-00Ewtj-0e;
	Fri, 19 May 2023 03:31:44 +0000
Received: from wout5-smtp.messagingengine.com ([64.147.123.21])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzqqC-00Ewsw-27
	for linux-riscv@lists.infradead.org;
	Fri, 19 May 2023 03:31:42 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 9FAA332007D7;
	Thu, 18 May 2023 23:31:37 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Thu, 18 May 2023 23:31:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1684467097; x=1684553497; bh=Po/ogvPWUOXjRWtD3eSRZTMYszH7hxYjNm1
	SSZFz8Ag=; b=A0R0m+TSMqktHrkPrL9VqAT3f4aINfWvUXypjlxWTDx6o1QY+vM
	WLi8SlvdHxvtXzqUtaIVznbwomt3JX2/k5tde3bKkZDM1WpxLJMtyVvYHPuRlQRy
	ghISHthfBF+22z4nihxbKYAJ3A22uWF1GmZc5Y1xGCeIWCmirqlIHbZNXWBGKK68
	67ZuvbAQOC+GSzo1a3dHo3KJhYO9AW0pJz2RKZbkLyMxmj6bN+YdxvjEFCh+e8Ma
	vxeW39/Hgk7RPC2un7r40jimbb828m4Osdx/Wr4w5fRQOycCHcqt/K+oDgsVI6Cs
	ABuxm6LL9RAoOXZR9+bqbxlj8FybWFD8Vvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1684467097; x=1684553497; bh=Po/ogvPWUOXjRWtD3eSRZTMYszH7hxYjNm1
	SSZFz8Ag=; b=n+V2uXd6XU9+8SwnC3Wd8UEeF0CsUodCgjU2IRdzaqnaKeCJP2F
	DrhigMLjcoBlyoLJRKk9cl15JuNzBG5gVqAliuHavCyFiTI6Koh621of5+HHbp8q
	hPpQEalIl5faa6SokhJcnCDgXOjXgsKdwtE+crYLDhsgLPXH1i8IauDB4nChk0b/
	mk3QaapXq0bCW63rFVvRlHpsnpgy3/lOxaXOXqCxSVwyDWVp7ggBZpeQ4h6LzXdq
	poRhGcq3bSUIvmnjXwnNDpreikmpVZ1qRwVW8xiT/gf4i10HWjPidUcJymKdkAhw
	Y7uBsKLKhHPlK4HfmNhGsOZXdil6WpxsoAQ==
X-ME-Sender: <xms:mO1mZChzbyEqY4cpb-3pXhlVytmnirLNR3dLFkfAOx1u0m_R8DaztA>
    <xme:mO1mZDAUwH7bdLlq71zXjVJwhnDPMxz5Edm-U4A9GN-vErXrYsMnw8XU9IakhoeT6
    JhgOh5FZpoeioQ4CQ>
X-ME-Received: <xmr:mO1mZKEQjL04REfqRlUFUuleD62wuE_58SbByw2adh39xjhPV2FDEiCHeK09260W_0lDrCKxMEpMpzVe-SzNf4rXA651dKbcVWkcoxPRyX1ue9DpLPstxtUhgg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeeigedgjeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkfffgggfvfevfhfhufgjtgfgsehtjeertddtfeejnecuhfhrohhmpefurghm
    uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
    ggtffrrghtthgvrhhnpeekheegueeiteeghfehvefgkeefgefhtefhgfdukeekueffkeei
    fefhffeliedtfeenucffohhmrghinhepuggvvhhitggvthhrvggvrdhorhhgpdhgihhthh
    husgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
    ohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:mO1mZLQm48IUIUyPWewYXpHB--oCenY9m4ybvF714-mFENhCmbh_YQ>
    <xmx:mO1mZPz2sBFSr-pI-JrY2rxhMJhzHaG4nIJpIT4zPCUM22v3m1SYIA>
    <xmx:mO1mZJ4tdj-Ah7gwWe8PoLLMLFkONa1XyAvHIY5j9IxnSclaG_J0XA>
    <xmx:me1mZPB365adlT_MO0zbMomtAp81BcTpg90ul8MylYJB2iW2fQfwVg>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 May 2023 23:31:35 -0400 (EDT)
Message-ID: <c6e44e14-35b2-da09-5e8c-4d47e7a7a055@sholland.org>
Date: Thu, 18 May 2023 22:31:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Content-Language: en-US
To: Jisheng Zhang <jszhang@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
 Palmer Dabbelt <palmer@rivosinc.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
References: <20230518152244.2178-1-jszhang@kernel.org>
 <20230518152244.2178-7-jszhang@kernel.org>
From: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v4 06/10] dt-bindings: riscv: Add bouffalolab bl808 board
 compatibles
In-Reply-To: <20230518152244.2178-7-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_203140_733556_E959A167 
X-CRM114-Status: GOOD (  21.11  )
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

Hi Jisheng, DT maintainers,

On 5/18/23 10:22, Jisheng Zhang wrote:
> Several SoMs and boards are available that feature the Bouffalolab
> bl808 SoC. Document the compatible strings.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/riscv/bouffalolab.yaml           | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/riscv/bouffalolab.yaml
> 
> diff --git a/Documentation/devicetree/bindings/riscv/bouffalolab.yaml b/Documentation/devicetree/bindings/riscv/bouffalolab.yaml
> new file mode 100644
> index 000000000000..3b25d1a5d04a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/riscv/bouffalolab.yaml
> @@ -0,0 +1,29 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/riscv/bouffalolab.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Bouffalo Lab Technology SoC-based boards
> +
> +maintainers:
> +  - Jisheng Zhang <jszhang@kernel.org>
> +
> +description:
> +  Bouffalo Lab Technology SoC-based boards
> +
> +properties:
> +  $nodename:
> +    const: '/'
> +  compatible:
> +    oneOf:
> +      - description: Carrier boards for the Sipeed M1s SoM
> +        items:
> +          - enum:
> +              - sipeed,m1s-dock
> +          - const: sipeed,m1s
> +          - const: bouffalolab,bl808

As mentioned in the message for patch 5, "The Bouffalolab bl808 SoC
contains three riscv CPUs, namely M0, D0 and LP. The D0 is 64bit RISC-V
GC compatible, so can run linux."

I have also been running U-Boot and NOMMU Linux on the less powerful,
but still quite fast, "M0" core. However, this core needs a different
DTB because:
 1) The CPU is different (T-HEAD E907 instead of C906).
 2) The interrupt routing is completely different.
    a. The M0 core contains a CLIC instead of a PLIC.
    b. The peripherals in the SoC are split between two buses. Those
       on one bus have their IRQs directly connected to M0, and share
       a multiplexed IRQ connection to D0; and vice versa for the
       other bus. So each bus's interrupt-parent needs to be swapped.

Using some preprocessor magic like we did for Allwinner and Renesas, I
was able to share most of the SoC and board DTs between the cores[1].
However, this still ends up with two DTs for each board. So here are my
questions:
 - Is this acceptable?
 - Is there precedent for how we should name the two board DTs?
 - How does this affect the board and SoC compatible strings?
   - Should there be a separate "bouffalolab,bl808-d0" in addition to
     "bouffalolab,bl808"?
   - Is it acceptable to use the same board compatible string for both,
     since the _board_ part of the DT does not change, only things
     inside the SoC?

It would be possible to avoid having two DTs per board by guarding all
of the differences behind "#ifdef CONFIG_64BIT", but that seems wrong
because you would end up with two totally incompatible DTBs named the
same thing, depending on how the DTB was built.

Thoughts?

Regards,
Samuel

[1]: https://github.com/openbouffalo/u-boot/commit/3ca800850f30


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
