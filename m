Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB0DDC44515
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 17:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QzKTkJWbaAPV0DUbGBWZS1xuCKxX/7DtI4oXt3Gvaw0=; b=ashRv66lJtFvXE
	xES9Eswq0LaqaljdKnE38g0o5AKjwnbHn4YV9JYNR0zLuWIeeXpc8lh1FUhuGOsXqir2GOHzbnwCl
	wb09WBgwjlM4romtO/HQN00tCP0BFYk13hs7J8ftwwOVV6j2hWPtue97ZJ6l85XFvVEyMkGi2/OmY
	oGaw2vjRYJEDZ6VQH7023sJj0HA0C/xjktCaFBK5itERlm5j5wHFCncDPTrp4af3nSGaCr4SJG/dm
	lngdZ+EHGRsRQLIJBwwPL/6Telp5nApLjaVS357X07fQgLuNx77iZzUB8Oe1X5twikv5xcvyGO+8D
	bwlOKyeVXnHdOdXiAeaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkQ4h-00000000Ib0-0tuv;
	Thu, 16 Jul 2026 17:40:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkQ4f-00000000Iai-3YJA;
	Thu, 16 Jul 2026 17:40:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 35C7660A5E;
	Thu, 16 Jul 2026 17:40:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C16FA1F00A3A;
	Thu, 16 Jul 2026 17:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784223640;
	bh=JybiWbfiaZr00Rdf/DsbwkKIST2oJ+WNcEjStes2TLI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EYV2Nhqsz6SjNvJ+a55nlCvJ5OB+ZB62OoQoNFVTecINTlhj1vvCQeUvcj793xr1h
	 Z5oj/bkzcgAZ6pUHT2qDfZSqIbihkolR22VczBJvwnObxNzH5wfZty1pGDR2S4GHHe
	 yLkGR42MLl6etZa3j1/tY1Ehjon6ylLOY+mnXAVqUjWdskfeRhf5Q/9QfsvUB8950T
	 F5StoQdpduxNz7BIglh6rQfDfr4gJUHi9z9/RWXIljPKeDS0W0W0beRiQ6GKzsMdtv
	 G05iwBRGgqUcRFKv/lSkWJKxUJ5qM5Tpo+R7iLlopHBDGPdK3Gqm4FQac7atyIYYw3
	 4OSgEBdgBCvyA==
Date: Thu, 16 Jul 2026 12:40:40 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: linux-kernel@vger.kernel.org, spacemit@lists.linux.dev,
	Ze Huang <huang.ze@linux.dev>, linux-hardening@vger.kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>, linux-phy@lists.infradead.org,
	Kees Cook <kees@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Vinod Koul <vkoul@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Longbin Li <looong.bin@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	Alex Elder <elder@riscstar.com>, Yixun Lan <dlan@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: Add Spacemit K3 USB3/PCIe comb
 phy support
Message-ID: <178422363982.585904.17467058424948637917.robh@kernel.org>
References: <20260703021024.495433-1-inochiama@gmail.com>
 <20260703021024.495433-2-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260703021024.495433-2-inochiama@gmail.com>
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


On Fri, 03 Jul 2026 10:10:22 +0800, Inochi Amaoto wrote:
> The USB3/PCIe comb PHY on the K3 is a complex PHY group that
> can provide multiple phy for both PCIe and USB controller.
> Its mux configuration is controlled by the APMU syscon device.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  .../bindings/phy/spacemit,k3-combo-phy.yaml   | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/spacemit,k3-combo-phy.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
