Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 188E4C282C6
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Mar 2025 08:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8+08sNOWL+k5h3Zamz1hSNYz44Xlu36i0hjAljsbmo4=; b=acLXrnL9gZ8S9X
	U1gaC8DCj+mZT3yQV8o2H+Grb4SrgKDZwM5FsSsQbtNulsboW2poByi8vHhNZ9ea0mifNSJzwHK9n
	EhWp4sllY4yrhQFi/GTGzXsrsv5BB3ZB/2MZ9XaX7EM3Q/XmeA5BUcEvZYwgfe1ILNyM00TlRgdvR
	QWXcSj0St/4G60QROuexuAzm/Oqn9BwFilpYQnAqKMBwe8nkeOHGD558E1skSyxwJAVL96J+Hija5
	7lvTxg3uR2vqmAvKCOzsI3OgF5MapTOjg5nPRjsS1i7nwn0QcY+p6vg8HJYP3NlViuk67FPt7/YdA
	KrPc6zB/cFpnVAkn7bjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp1NZ-0000000HZNl-05ro;
	Mon, 03 Mar 2025 08:42:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp1Ky-0000000HZ0l-1bO0
	for linux-riscv@lists.infradead.org;
	Mon, 03 Mar 2025 08:39:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B30115C4CD3;
	Mon,  3 Mar 2025 08:37:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CE6EC4CED6;
	Mon,  3 Mar 2025 08:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740991183;
	bh=o6KpAk/cHOkdyQxji4Md4vbG85WwT5ZCP2e8Bj9+SVc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g+v6SHHCaXHRdjo/E7YJDyoVkrEqLnqngo1VeXN4hajnEozZmp3jhvc/3ILIg6e9N
	 LjREPpKcLJhCngKxgngK/FoZAdS4IfccKj9T1tnmxqJ8RFMpHfFXfJzUPx41G3GQ7P
	 x2mWXKI1qscGRrdNnw3Ga1bTCGVMMveJ0gQNjmJv3pVjtELtUPDrGFDW4ep82XWVc+
	 AjEsTn43xy6OezZFxVeN/ckL/pYo3JhhtSEvHGpdi2C4q5yriGFFQwiq05iCeBckMJ
	 0sANJnSaPI+S5/vACvPfUm0XHkargVmmMTnqfghbPfZooappeAInUVoyJaN3IZDR1d
	 Y48ccPMMFfLxQ==
Date: Mon, 3 Mar 2025 09:39:39 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-rtc@vger.kernel.org, Jingbao Qiu <qiujingbao.dlmu@gmail.com>, 
	Inochi Amaoto <inochiama@gmail.com>, dlan@gentoo.org, linux-kernel@vger.kernel.org, 
	Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, sophgo@lists.linux.dev
Subject: Re: [PATCH v12 1/3] dt-bindings: mfd: sophgo: add RTC support for
 Sophgo CV1800 series SoC
Message-ID: <20250303-loud-mauve-coyote-1eefbb@krzk-bin>
References: <20250302195205.3183174-1-alexander.sverdlin@gmail.com>
 <20250302195205.3183174-2-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250302195205.3183174-2-alexander.sverdlin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_003944_530978_5121E440 
X-CRM114-Status: GOOD (  21.97  )
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

On Sun, Mar 02, 2025 at 08:51:54PM +0100, Alexander Sverdlin wrote:
> From: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
> 
> Add RTC devicetree binding for Sophgo CV1800 series SoC. The device is
> called RTC, but contains control registers of other HW blocks in its
> address space, most notably of Power-on-Reset (PoR) module, DW8051 IP
> (MCU core), accompanying SRAM, hence putting it in MFD subsystem.

Assuming this is integrated block in the CV1800 SoC, then this should go
to soc/ and probably called system controller or similarly.

How is it called in the datasheet?


> 
> Signed-off-by: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> ---
> Changelog:
> v12:
> - maintainer Jingbao Qiu <qiujingbao.dlmu@gmail.com> -> sophgo@lists.linux.dev
> - dropped Reviewed-by: Krzysztof Kozlowski
> - link to TRM
> - mentioned 8051 core in the description
> - binding is now MFD, not RTC
> - added "syscon" compatible
> - added "interrupt-names", "clock-names" (because of added PM/remoteproc)
> - main compatible "sophgo,cv1800-rtc" -> "sophgo,cv1800b-rtc"
> 
>  .../bindings/mfd/sophgo,cv1800b-rtc.yaml      | 86 +++++++++++++++++++
>  1 file changed, 86 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/sophgo,cv1800b-rtc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/sophgo,cv1800b-rtc.yaml b/Documentation/devicetree/bindings/mfd/sophgo,cv1800b-rtc.yaml
> new file mode 100644
> index 000000000000..b80d68502c48
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/sophgo,cv1800b-rtc.yaml
> @@ -0,0 +1,86 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/sophgo,cv1800b-rtc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Real Time Clock of the Sophgo CV1800 SoC
> +
> +description:
> +  The RTC (Real Time Clock) is an independently powered module in the chip. It
> +  contains a 32KHz oscillator and a Power-On-Reset (POR) sub-module, which can
> +  be used for time display and scheduled alarm produce. In addition, the
> +  hardware state machine provides triggering and timing control for chip
> +  power-on, power-off and reset.
> +
> +  Furthermore, the 8051 subsystem is located within RTCSYS and is independently
> +  powered. System software can use the 8051 to manage wake conditions and wake
> +  the system while the system is asleep, and communicate with external devices
> +  through peripheral controllers.
> +
> +  Technical Reference Manual available at
> +    https://github.com/sophgo/sophgo-doc/tree/main/SG200X/TRM
> +
> +maintainers:
> +  - sophgo@lists.linux.dev
> +
> +allOf:
> +  - $ref: /schemas/rtc/rtc.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: sophgo,cv1800b-rtc
> +      - const: syscon

Binding is fine, but still open topics are: placement and compatible
name.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
