Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE92C54ED0
	for <linux-riscv@archiver.kernel.org>; Fri, 23 May 2025 11:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:References:
	In-Reply-To:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tOG68p02BI//7D9OQr9Im9acJcu8IEyj0gBCoKskAYY=; b=e+GhrOhr6MS2vu
	uMUMzec+6zKBb3ujky4SEqIcusEc69iVY9bbW3wj2h+h53gO1QCYNxCUn2+wsWjtCnrKeFnVjym3Z
	KnwT11weyomNHYNusw0cgcsql82XDPvptUf6HTbEswUu2OiHIALOwJfSJGjEtgidoVDsZxRq70Jne
	CHCjpVEelQLoYg7xoeOdsJFmi2AkgvU2NfQUgwy3liORdqq46HzP4x05trUohjHOOCthNWNp0kFQ7
	ulHV+CoOpmWVW6le0sJjdsV9WuAp+ZCwUa9mxsbO6NmqTQR0sKoJc6T94zvxH+oakSg6/crVi9/R5
	4VRjOWpAythQNdI7jZ+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIQGE-00000003fnt-1KiP;
	Fri, 23 May 2025 11:08:22 +0000
Received: from zg8tmja2lje4os4yms4ymjma.icoremail.net ([206.189.21.223])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIPGF-00000003Wx2-1vGQ
	for linux-riscv@lists.infradead.org;
	Fri, 23 May 2025 10:04:22 +0000
Received: from linmin$eswincomputing.com ( [10.10.96.205] ) by
 ajax-webmail-app2 (Coremail) ; Fri, 23 May 2025 18:04:00 +0800 (GMT+08:00)
X-Originating-IP: [10.10.96.205]
Date: Fri, 23 May 2025 18:04:00 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?5p6X5pWP?= <linmin@eswincomputing.com>
To: "Pinkesh Vaghela" <pinkesh.vaghela@einfochips.com>
Cc: "Conor Dooley" <conor@kernel.org>, "Rob Herring" <robh@kernel.org>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>,
	"Thomas Gleixner" <tglx@linutronix.de>,
	"Paul Walmsley" <paul.walmsley@sifive.com>,
	"Samuel Holland" <samuel.holland@sifive.com>,
	"Palmer Dabbelt" <palmer@dabbelt.com>,
	"Albert Ou" <aou@eecs.berkeley.edu>,
	"Daniel Lezcano" <daniel.lezcano@linaro.org>,
	"Pritesh Patel" <pritesh.patel@einfochips.com>,
	"Yangyu Chen" <cyy@cyyself.name>,
	"Lad Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"Yu Chien Peter Lin" <peterlin@andestech.com>,
	"Charlie Jenkins" <charlie@rivosinc.com>,
	"Kanak Shilledar" <kanakshilledar@gmail.com>,
	"Darshan Prajapati" <darshan.prajapati@einfochips.com>,
	"Neil Armstrong" <neil.armstrong@linaro.org>,
	"Heiko Stuebner" <heiko@sntech.de>,
	"Aradhya Bhatia" <a-bhatia1@ti.com>, rafal@milecki.pl,
	"Anup Patel" <anup@brainfault.org>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 04/10] dt-bindings: riscv: Add SiFive HiFive Premier
 P550 board
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2025 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <20250410152519.1358964-5-pinkesh.vaghela@einfochips.com>
References: <20250410152519.1358964-1-pinkesh.vaghela@einfochips.com>
 <20250410152519.1358964-5-pinkesh.vaghela@einfochips.com>
MIME-Version: 1.0
Message-ID: <12b31aa1.107c.196fc99801d.Coremail.linmin@eswincomputing.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: TQJkCgDHZpUQSDBo3PiJAA--.14149W
X-CM-SenderInfo: 5olqzx3q6h245lqf0zpsxwx03jof0z/1tbiAQELCWgvUWdFOQACsN
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_030419_759207_261A548B 
X-CRM114-Status: UNSURE (   9.22  )
X-CRM114-Notice: Please train this message.
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

On 10/04/2025 23:25:13 Pritesh Patel wrote:
> From: Pritesh Patel <pritesh.patel@einfochips.com>
> 
> Add DT binding documentation for the ESWIN EIC7700 SoC and
> HiFive Premier P550 Board
> 
> Signed-off-by: Pritesh Patel <pritesh.patel@einfochips.com>
> Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
> Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@kernel.org>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Min Lin <linmin@eswincomputing.com>

> ---
>  .../devicetree/bindings/riscv/eswin.yaml      | 29 +++++++++++++++++++
>  MAINTAINERS                                   |  7 +++++
>  2 files changed, 36 insertions(+)
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
> +
> +additionalProperties: true
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index bfcdf2bced61..f90c940f286c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8768,6 +8768,13 @@ L:	linux-can@vger.kernel.org
>  S:	Maintained
>  F:	drivers/net/can/usb/esd_usb.c
>  
> +ESWIN DEVICETREES
> +M:	Min Lin <linmin@eswincomputing.com>
> +M:	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
> +M:	Pritesh Patel <pritesh.patel@einfochips.com>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/riscv/eswin.yaml
> +
>  ET131X NETWORK DRIVER
>  M:	Mark Einon <mark.einon@gmail.com>
>  S:	Odd Fixes
> -- 
> 2.25.1
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
