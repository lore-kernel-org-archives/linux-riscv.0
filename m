Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34C38C54EBC
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Jan 2023 07:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uouvTw/BeEEGI0S07WYvhTjejpDhXIzPIzdtISna0oE=; b=lDNs+zIxlxU0qR
	PknnQCUh8+YKsXV0bzMZYGLu2wCmXCalrSX2z8IsWfwlihrQXDC4ZS+QDLWYuypS+3n3rw2VKQj33
	4KE9pavSl0fHB9PHtSUfQd1SEPSA3khkv3YpKacwLZNrvZMPbgEMX8akzGRQldlyvk2mhH9XKA1Fy
	eAjHWMnCnzCEZ9Xcbev8nx2gsQWOzTOmDKAGcvA7rrS8zWsnT2SYJJCVPtO5Ezp/otTrcKTj1THCq
	Wk4QEBSppH+KteulhUOcp5M0XnFI0nGhTFZgfu7X6dFJHj+nQ0sdkNN1GOLhr6ZQYl1Cez6HhrT+E
	V/B+uHbGUnPkGCT2DZqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEPhb-00Bu8k-RO; Sun, 08 Jan 2023 07:02:44 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEPhO-00Bu4F-Do; Sun, 08 Jan 2023 07:02:31 +0000
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 58BF0A25;
	Sun,  8 Jan 2023 08:02:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1673161348;
	bh=QGE4Hw9aWxGM442kPdYqiBgORm6SRQZOxcp0UzdWwFo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l1y2uzF4PqApHifao96ZpodLQiF41IlEJ3ykhi79Pz4/FDUK7VLkHOcflV38gXCeD
	 OUDSmUG2C6yf8ujV8+Af/dh9h3/eVVxOi+uJD9cYGv6dO/BqFtnN7T7Q6uTzLnO3Ak
	 9+puNMVgvreJ4DsJkLw3ckb2KLzWQ/1NEoliZmek=
Date: Sun, 8 Jan 2023 09:02:24 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Aradhya Bhatia <a-bhatia1@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Tomi Valkeinen <tomba@kernel.org>, Jyri Sarha <jyri.sarha@iki.fi>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime@cerno.tech>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Guo Ren <guoren@kernel.org>,
	DRI Development List <dri-devel@lists.freedesktop.org>,
	Devicetree List <devicetree@vger.kernel.org>,
	Linux Kernel List <linux-kernel@vger.kernel.org>,
	Linux RISC-V List <linux-riscv@lists.infradead.org>,
	Linux ARM Kernel List <linux-arm-kernel@lists.infradead.org>,
	Linux Mediatek List <linux-mediatek@lists.infradead.org>,
	Linux C-SKY Arch List <linux-csky@vger.kernel.org>,
	Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Rahul T R <r-ravikumar@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
	Jai Luthra <j-luthra@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>
Subject: Re: [RFC PATCH 1/4] dt-bindings: vendor-prefixes: Add microtips
Message-ID: <Y7pqgBgivE2TUbka@pendragon.ideasonboard.com>
References: <20230103064615.5311-1-a-bhatia1@ti.com>
 <20230103064615.5311-2-a-bhatia1@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230103064615.5311-2-a-bhatia1@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230107_230230_626679_F84DB941 
X-CRM114-Status: GOOD (  12.89  )
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

Hi Aradhya,

Thank you for the patch.

On Tue, Jan 03, 2023 at 12:16:12PM +0530, Aradhya Bhatia wrote:
> Add document vendor prefix for Microtips Technology USA (microtips).
> 
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index 70ffb3780621..516134cbcb3c 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -821,6 +821,8 @@ patternProperties:
>      description: Microsoft Corporation
>    "^microsys,.*":
>      description: MicroSys Electronics GmbH
> +  "^microtips,.*":
> +    description: Microtips Technology USA
>    "^mikroe,.*":
>      description: MikroElektronika d.o.o.
>    "^mikrotik,.*":

-- 
Regards,

Laurent Pinchart

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
