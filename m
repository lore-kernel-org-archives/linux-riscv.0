Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3741C55ABF
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Aug 2026 21:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DqGmRIrVkOkZfBApycUf9v2nd2/qid1fLROUZIxCSAo=; b=0WaPTP2cRsmcb3
	0HSdkSrvu+haEF0avZFgtl1sihoKI6dupigdSdmhTZK+QaGqgC0ebBCoNNNIkuBy7mhLvrajrz1Cm
	xLex1PBa8BDlAIOY72uUQLx490XQ0WasYw4cVRgerSBHF8P+JLH6b9e23olWUwBxS8MI3p/uItjet
	YjcDO+JnrHCCenFYuQsZR8csPNLz9pQQ/Cs+zGZNvAX8wWnbZ1nWXglgccGeUx23Zj1N4alE74y6D
	f09jueA1YLAM02zO+Ph3W7DUVUKIb9JJpXWvzxksqbweoM2/2rqPgq+O8wjfkQjj1i3Is6ME4LEj9
	lYaX6QiJ5bW8YYpmgtRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrjCJ-00000004Zyz-2mrM;
	Wed, 05 Aug 2026 21:30:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrjCI-00000004ZyL-1tlY
	for linux-riscv@lists.infradead.org;
	Wed, 05 Aug 2026 21:30:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 82E5C60A6B;
	Wed,  5 Aug 2026 21:30:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DF331F000E9;
	Wed,  5 Aug 2026 21:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785965445;
	bh=LIYuNqqsy52nkDWooad99ullowWQhLlloisZtkNeyTQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aTL/64jWXqVC9Ac1SMFh4jfckzTR62V1iCawCgDK+dLarq8M3tAYYbnnwFHmWWK2w
	 0x/pVfefFZno1c6pia3Azkai5l7cighEPkHTpYjiQ2Wrk4p2sz+7OPu3d05I7dipCd
	 lYag+pZ9qy3NXRKgr4rMSet2KGOLqnALBtdYRnteJT3KjF1afsHuc2agc65ZlT39n5
	 WBRD0PZfDgTuc9ddxUailQPeSjOQROfDlXjfRimlQRq0awAkKUKduQ4r9Nmxv8Fm4H
	 Ye/GJos3gHvoAtKk3uR2hVOyRvteooIqbA+92CrTbMPMLOrCaIORbKiew0hM7t/A3q
	 L0bWI1dJLo+RA==
Date: Wed, 5 Aug 2026 16:30:44 -0500
From: Rob Herring <robh@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Subject: Re: [PATCH v4 05/21] dt-bindings: pinctrl: Add
 starfive,jhb100-sys0h-pinctrl
Message-ID: <20260805213044.GA1808833-robh@kernel.org>
References: <20260801072711.153217-1-changhuang.liang@starfivetech.com>
 <20260801072711.153217-6-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260801072711.153217-6-changhuang.liang@starfivetech.com>
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

On Sat, Aug 01, 2026 at 12:26:55AM -0700, Changhuang Liang wrote:
> Add pinctrl bindings for StarFive JHB100 SoC System-0 host(sys0h) pinctrl
> controller.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../starfive,jhb100-sys0h-pinctrl.yaml        | 162 ++++++++++++++++++
>  .../pinctrl/starfive,jhb100-pinctrl.h         |  14 ++
>  2 files changed, 176 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0h-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0h-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0h-pinctrl.yaml
> new file mode 100644
> index 000000000000..80acc64834df
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0h-pinctrl.yaml
> @@ -0,0 +1,162 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/starfive,jhb100-sys0h-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JHB100 System-0 Host Pin Controller
> +
> +description: |
> +  Pinctrl bindings for JHB100 RISC-V SoC from StarFive Technology Ltd.
> +
> +  The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0, per1,
> +  per2, per2pok, per3, adc0, adc1, emmc, and vga.

These all look about the same other than 'function' values. I don't 
think it's worth splitting just for that. I just put all the function 
values in and just document which ones go with which compatible. 

If there are more differences I missed, then perhaps the split makes 
sense. Maybe it's 2 or 3 different ones?

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
