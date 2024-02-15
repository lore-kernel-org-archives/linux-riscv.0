Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21547C4829E
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Feb 2024 15:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2kjogl6LxCQ+gh5hY6u0wZQi0zwg9hqmJHX0OrX+N/4=; b=JhtABBlXarLKoH
	fcXhH+Il6ph4a5g+HoW3Nd4b2aVPwfXX6UQ2l5KXPXtHc8L5awyZri0iPlisbuDUhGth4YLUwGnGT
	56qMYONTTqcMuR4EyymiWozg0IRCj2RP2D2UrKawNPP7lQp9MdsoX2Sc8ag10osjyWNTUKEvlohJB
	ShwJ4jK8eO5I/mJ63tq61yJB04v+cRCYX19/KllV1lZBnG82Yj2EJSiK90N8S6ppwvjk65PxQa0pr
	5MgCYApoMXDifob/yr0MRWPnamhI7X2btR1IicFf7ZdRTuGyPesLrTq68Sws7SdMIpDJCK3sOpIYl
	e4uiJurPA0NLERS/HfEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1radQT-0000000GgOt-490r;
	Thu, 15 Feb 2024 15:13:25 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1radQQ-0000000GgOR-3JXq
	for linux-riscv@lists.infradead.org;
	Thu, 15 Feb 2024 15:13:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C0591CE23F1;
	Thu, 15 Feb 2024 15:13:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC2E3C433F1;
	Thu, 15 Feb 2024 15:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708010000;
	bh=yPtGushKE1HruuEyLpEa6VC/zl5SpKlQQqg0Lb6Wd8A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UtvLved+d01mkGf7xzEd9srUoOIy5JPOhruhV3dovutNXl52piRGfwR+Dj3olx5HI
	 PaPqIuXQr7CYX8nvZhAiG+kSU5oLJcnrKFeTgpIGqZvrSstJFRt/Zn1Pwq00NSdnZZ
	 MC/WL/7RHLEMsKW8odBbN0RFehhP8/6ckqjNL88MWBs9tF3BB1nf/hOiIMJBfASZX5
	 REmnJG1LXUyhB1ChaEbn/jVblNpcDpWKDcc25p85HDSbb2KaDmLz8kZ4NmIP+5IH7I
	 h4zAWbb8/xa1/+gxwfzYYWfVWrOSNoQ5u8Mz8QBZ0OkZvtNVW94T9AYmAT6VZXLiRe
	 PW3uy4Wq9m/Vg==
Date: Thu, 15 Feb 2024 09:13:16 -0600
From: Rob Herring <robh@kernel.org>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>,
	Liu Gui <kenneth.liu@sophgo.com>,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>, dlan@gentoo.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 1/2] dt-bindings: clock: sophgo: Add top misc
 controller of CV18XX/SG200X series SoC
Message-ID: <20240215151316.GA89268-robh@kernel.org>
References: <PH7PR20MB4962F822A64CB127911978AABB4E2@PH7PR20MB4962.namprd20.prod.outlook.com>
 <PH7PR20MB4962FFFB586489154B1403D6BB4E2@PH7PR20MB4962.namprd20.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <PH7PR20MB4962FFFB586489154B1403D6BB4E2@PH7PR20MB4962.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_071323_030527_2D04E08F 
X-CRM114-Status: GOOD (  16.03  )
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

On Wed, Feb 14, 2024 at 02:33:14PM +0800, Inochi Amaoto wrote:
> CV18XX/SG200X series SoCs have a special top misc system controller,
> which provides register access for several devices. In addition to
> register access, this system controller also contains some subdevices
> (such as dmamux).
> 
> Add bindings for top misc controller of CV18XX/SG200X series SoC.
> 
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> ---
>  .../soc/sophgo/sophgo,cv1800-top-syscon.yaml  | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800-top-syscon.yaml
> 
> diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800-top-syscon.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800-top-syscon.yaml
> new file mode 100644
> index 000000000000..619237532801
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800-top-syscon.yaml
> @@ -0,0 +1,40 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/sophgo/sophgo,cv1800-top-syscon.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sophgo CV1800/SG2000 SoC top system controller
> +
> +maintainers:
> +  - Inochi Amaoto <inochiama@outlook.com>
> +
> +description:
> +  The Sophgo CV1800/SG2000 SoC top misc system controller provides
> +  register access to configure related modules.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: sophgo,cv1800-top-syscon
> +      - const: syscon
> +      - const: simple-mfd

You have to define child nodes to be a simple-mfd.

You could drop it, but I now suspect your binding is incomplete.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
