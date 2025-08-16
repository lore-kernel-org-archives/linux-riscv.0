Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 398F7CA0EE4
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Aug 2025 09:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cCXNIKzuLv5uIhOF9Q4K2Qb7LwrtzYveA6Q05aBiSG4=; b=5GbgjNwkZCoPBo
	N9Di4uqwQBQN4gylKEt6asiZE/rPYttW7jAa6c7e9tlAxG9cu1eiQoW91GFny1WaVHk/tqn9OA/4z
	B/aqnPJ7+kpLD5/zwo8zYILnBKg3IrN9q8uuTfeQLeUQ2H6jPK15rTayvo7rCKG27Ivq66ri2GzT4
	VYNMHGRQaqym+yqqh2222Xr7KBpL4V8DA83OzU7sXwf4Xl6spWexyua/U5TRwPGK/hfOzQ9cmg9a4
	4LZXtiwelUBhyrJ0jnOibvZQqIQAAALU8tXnNeoKMOS4HaBb6mvOSxMAlsbUsxxU5sp2K3kmkU7zC
	nCgey5DLybW4m4gMcftA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unD0M-00000004NaI-26Un;
	Sat, 16 Aug 2025 09:15:14 +0000
Received: from smtpbgbr2.qq.com ([54.207.22.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unD0J-00000004NZ8-0rAI
	for linux-riscv@lists.infradead.org;
	Sat, 16 Aug 2025 09:15:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1755335633;
	bh=hbXtoR3uWxiKczQIaq//GQkhVV7HPaIDh8JT8/clkDc=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=RjmnY+qKhskPZWZ5Zsut6+u4UJaKdbiGEguukpdKyqdGgk0lCSBi1Z2PVeqVZCLsY
	 kp/rmwD+2Ct+3r7hTi7d6gqLC2fUhqBdkSD/81cEkNAqFoun31u28gw8AafHMx+Kpd
	 Er3ma36QXXyC6PpNl863OcM1qzxHB6srVJiStI1M=
X-QQ-mid: zesmtpip3t1755335624tdfc22a4d
X-QQ-Originating-IP: q1QVFsw6Qn/8GxGPXxJhBWdr66tYEr9pdlAVtNoZFY4=
Received: from = ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 16 Aug 2025 17:13:43 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8634151311153834424
EX-QQ-RecipientCnt: 15
Date: Sat, 16 Aug 2025 17:13:42 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH 1/2] dt-bindings: i2s: spacemit: add support for K1 SoC
Message-ID: <67A5AD581BFFAEE1+aKBLxuQLDlf3JFVN@troy-wujie14pro-arch>
References: <20250814-k1-i2s-v1-0-c31149b29041@linux.spacemit.com>
 <20250814-k1-i2s-v1-1-c31149b29041@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250814-k1-i2s-v1-1-c31149b29041@linux.spacemit.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: N2K7JO7TcIoEo4bQxstuthcJ3EFVDSMsD2PXtUIgj+oyG/rf2T7WhXG2
	+JbrkAp4th8UQjTe+VgZBAo2d3Gq01j5ZRXRmITGIzF3eHeI5x7OFQRei+VOW+TCS2cJuZE
	N3wkpZ4lulCzowpjAkqKqHfIlfXaGr9ZFV2QvXVsiVQ921yokON1HNKEDIPu60f3OkoNV/Z
	kTA9Z3B3S/d7Es7vbg8BNpUxpdTxQkrYJ3G3CEfx4tzNsB2JgLE0QO6lRQ9Iusw9sKihdVH
	cSzRSyPEpdx3RpvNhG4X7bN/IN6g2+dU5L7QLaXRU4PIGXILD8OBuMKJEONDw5c/LRE7efq
	iSHvLIg2Uy/QUkjqawGYN1gXfariCcKDWyHHh0G1h3y/wdIAL9tLu2tBTQMp1YvOkjOcRrs
	oXnN4TZK77QUIrpk4LQ0szidPbKnjKyhKtVs2INYqIx56EKoNy8CgfOB1+/xYbPDAAXb+oX
	K+yHOhqPdFUOYOfaDKQGfVvxHUi60QYBscqBn92JVcqbl8H7lxlCQF5TRTAUAeqhcENHII4
	n0l19gZTgZcCNcfuO9sN0IvNN4GgUp5lWD8QfR7jiEOZ935Z92hY+eXFLUOmnudNHqaJZJw
	hHQOO2Pt32CQAgQf2nTPnz1uuBiuJtuNfkMGF8rL+sI1LrDoSv48MpzQ9Cp3Avjbwjd7YRE
	tGe6XG/alL89kViLJElu/2SbLN54gm/otd49TkSz35a5L6LFr8JJovgWOYOoHq6cF0kGAvE
	p8Cji8rgoKpSoY6cR9bJC+XAHflcuqUVzoxl7SROzMnzgQeZEVZ0QY8YhfRZZXlSuyw/pxZ
	pgu5EoLnnDbjzMr89QafKWuh4r1B8kFvXw2c7C3hOVwWS/KF85llfNRzZo2hyPA6C0Nl3PE
	LINHePKaWk1obi3pyD/mOWLEsiVwS0IHqWrsR1usDDm+4hE/obnzUXOhWXBaiUu/qkGq6f4
	j0Nl5+oXFUbbcjYJtJ8C9J52DoUqsnMhyiJPJ9G4qhozyk6QICA8kGhHDy+u9k2hr/s79mI
	Z4LgDVB/2Q0WFc32lqeny0GiRCpCTgKlll33Oz8ETr3qKO6AizNfZkMFOPOtM=
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250816_021512_228655_5FEAC7B7 
X-CRM114-Status: GOOD (  16.94  )
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

On Thu, Aug 14, 2025 at 04:54:19PM +0800, Troy Mitchell wrote:
> Add dt-binding for the i2s driver of SpacemiT's K1 SoC.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  .../devicetree/bindings/sound/spacemit,k1-i2s.yaml | 88 ++++++++++++++++++++++
>  1 file changed, 88 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/spacemit,k1-i2s.yaml b/Documentation/devicetree/bindings/sound/spacemit,k1-i2s.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..7d9110638d71792db6e5bb72559f6abaf4cb59bb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/spacemit,k1-i2s.yaml
> @@ -0,0 +1,88 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/spacemit,k1-i2s.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: K1 I2S controller
> +
> +description:
> +  The I2S bus (Inter-IC sound bus) is a serial link for digital
> +  audio data transfer between devices in the system.
> +
> +maintainers:
> +  - Troy Mitchell <troy.mitchell@linux.spacemit.com>
> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: spacemit,k1-i2s
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: clock for I2S sysclk
> +      - description: clock for I2S bclk
> +      - description: clock for I2S bus
> +      - description: clock for I2S controller
> +
> +  clock-names:
> +    items:
> +      - const: sysclk
> +      - const: bclk
> +      - const: bus
> +      - const: func
> +
> +  dmas:
> +    minItems: 1
> +    maxItems: 2
> +
> +  dma-names:
> +    oneOf:
> +      - const: rx
> +      - items:
> +          - const: tx
> +          - const: rx
> +
> +  resets:
> +    maxItems: 1
> +
> +  port:
> +    $ref: audio-graph-port.yaml#
> +    unevaluatedProperties: false
> +
> +  "#sound-dai-cells":
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - dmas
> +  - dma-names
> +  - resets
> +  - "#sound-dai-cells"
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/spacemit,k1-syscon.h>
> +    i2s@d4026000 {
> +      compatible = "spacemit,k1-i2s";
> +      reg = <0xd4026000 0x30>;
> +      clocks = <&syscon_mpmu CLK_I2S_SYSCLK>,
> +               <&syscon_mpmu CLK_I2S_BCLK>,
> +               <&syscon_apbc CLK_SSPA0_BUS>,
> +               <&syscon_apbc CLK_SSPA0>;
> +      clock-names = "sysclk", "bclk", "bus", "func";
> +      dmas = <&pdma0 21 1>, <&pdma0 22 1>;
I'll keep to 1 cell in the next version.

> +      dma-names = "tx", "rx";
> +      resets = <&syscon_apbc RESET_SSPA0>;
> +      #sound-dai-cells = <0>;
> +    };
> 
> -- 
> 2.50.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
