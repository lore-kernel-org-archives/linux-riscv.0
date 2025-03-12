Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D0FCC28B28
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Mar 2025 14:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tIMfU98LJR+t1naNRyIVfdj3ViKTY4oFZFyDlEmcW4s=; b=B+GTFbVexfMEui
	TYWjxLYcuUJ26qKFQacNfdiiF1UFqx8OsN4pWM9zPrM3FkxK6gQbLetweQUrMvYqmgyBjTN2IZ7gs
	RxgF/L+DjSPaWEi68pXW/ge1/CMahKkQIoOFmA3Ce+S32xKS91DVHuu0qBIMOvNluEVVndb9oesIN
	Nt5JlAxllYgSV65cac1UbG1dU9T+2Kf2V6MqyLGHrnfPTNtXAHslC94qiSqECOX9XGPGVolO/nwr+
	DBu3MU2i6FlAaVjJegjdYFI6g+bKZc2Am7sGiFxxjfTfsZb7u7d1JOBkav+Zq9ZjOOYjflwe1Lj9T
	K21egpbI8OFaMsbwIB4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsMiS-00000008eOn-1IEh;
	Wed, 12 Mar 2025 14:05:48 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsKnv-00000008LW6-1D5m
	for linux-riscv@lists.infradead.org;
	Wed, 12 Mar 2025 12:03:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1513EA4710C;
	Wed, 12 Mar 2025 11:57:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2C3EC4CEE3;
	Wed, 12 Mar 2025 12:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741780997;
	bh=7fyVSWAB8Ertria+vE/ZF+M57y8nsHzIxjq/lWexlzY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WQHqGr280PrWdMuhLX6TgwQYWT1XEsPRZi/aGuLUufvkxrLutUR/PenBmMclmv9yd
	 gPpbnjLWMBbRGBjASWhRVGQH7F6eUfw/sa8snCkEkLrCuHiuBS+ET6LBnpoK60rh2q
	 q6rRvPH6m3lucVqdN8YvzSXgUhDFQG2Ut3Uxhl7GaLIoxBNyQo75Y/0dJXHoNxkKGO
	 opGU+MVwm4b4QBfD0cYC8gsmJe/czNM1q31T7je8i9qqNpoWcMrhU2qFk78vXcD/XE
	 +N2060+q9Jyqj65y/V6uvMiLr265IgXnbf49XCQgQXceZj27wQG9hI/6OGBS4mwaPv
	 Di60w3Js6WqGA==
Date: Wed, 12 Mar 2025 13:03:09 +0100
From: Matthias Brugger <matthias.bgg@kernel.org>
To: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Min Lin <linmin@eswincomputing.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>,
	Yangyu Chen <cyy@cyyself.name>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Yu Chien Peter Lin <peterlin@andestech.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Kanak Shilledar <kanakshilledar@gmail.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>, Aradhya Bhatia <a-bhatia1@ti.com>,
	rafal@milecki.pl, Anup Patel <anup@brainfault.org>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/10] dt-bindings: riscv: Add SiFive HiFive Premier P550
 board
Message-ID: <Z9F3_Zb4RvHLvgSd@ziggy.stardust>
References: <20250311073432.4068512-1-pinkesh.vaghela@einfochips.com>
 <20250311073432.4068512-5-pinkesh.vaghela@einfochips.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250311073432.4068512-5-pinkesh.vaghela@einfochips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_050319_456190_DBD286F6 
X-CRM114-Status: GOOD (  16.12  )
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

On Tue, Mar 11, 2025 at 01:04:26PM +0530, Pinkesh Vaghela wrote:
> From: Pritesh Patel <pritesh.patel@einfochips.com>
> 
> Add DT binding documentation for the ESWIN EIC7700 SoC and
> HiFive Premier P550 Board
> 
> Signed-off-by: Pritesh Patel <pritesh.patel@einfochips.com>
> Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
> Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
> ---
>  .../devicetree/bindings/riscv/eswin.yaml      | 29 +++++++++++++++++++
>  MAINTAINERS                                   |  6 ++++
>  2 files changed, 35 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/riscv/eswin.yaml
> 
> diff --git a/Documentation/devicetree/bindings/riscv/eswin.yaml b/Documentation/devicetree/bindings/riscv/eswin.yaml
> new file mode 100644
> index 000000000000..c603c45eef22
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/riscv/eswin.yaml
> @@ -0,0 +1,29 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/riscv/eswin.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ESWIN SoC-based boards
> +
> +maintainers:
> +  - Min Lin <linmin@eswincomputing.com>
> +  - Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
> +  - Pritesh Patel <pritesh.patel@einfochips.com>
> +
> +description:
> +  ESWIN SoC-based boards
> +
> +properties:
> +  $nodename:
> +    const: '/'
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - sifive,hifive-premier-p550
> +          - const: eswin,eic7700

That should be the other way around. You could have, let's say eic7701
with different peripherals but smae p550 IP core. I don't expect a new
eic7700 with a CPU IP other then p550.

Regards,
Matthias

> +
> +additionalProperties: true
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 25c86f47353d..901d0e0adb25 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8572,6 +8572,12 @@ L:	linux-can@vger.kernel.org
>  S:	Maintained
>  F:	drivers/net/can/usb/esd_usb.c
>  
> +ESWIN DEVICETREES
> +M:	Min Lin <linmin@eswincomputing.com>
> +M:	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
> +M:	Pritesh Patel <pritesh.patel@einfochips.com>
> +S:	Maintained
> +
>  ET131X NETWORK DRIVER
>  M:	Mark Einon <mark.einon@gmail.com>
>  S:	Odd Fixes
> -- 
> 2.25.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
