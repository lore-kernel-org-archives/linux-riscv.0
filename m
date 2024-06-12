Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A0A6C27C77
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jun 2024 15:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=23iQHnnWIm+OewVMPrRbqXru6zj40QoKGgAokzwOoJ0=; b=CEXwf4dAmOTVf4
	rpkGLTEfJa7pvLi0+2qzqKnCtGM/GKWQQ4MiN25klwPeQrOMsgiiylvNDVwLuTDppCGq2cxCxFgpw
	bPzafUrpip7C4Tcj4s0EEoCquyNZzZLRO8NtM7sC3QdPsrttzrol7QK/nJeKpS8St20ncc4xbPP57
	rR4wxD2ACg3XbsAgK/P0NyBEKCrCetOtLmb85eTz1EJ2Ca+hqaKx9W8L91jBh/lCg5x844gc1+bv1
	kRdxfOcJFRyaO9Bbbpk0HFvBc1vJz6gfiT1vds8dmfW0t4Vs9gVf4g8+kzNmlQBlq0Bv1NxWjC9Iu
	f5W3eO/sMtM737h//NLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHPwA-0000000DAzB-2kJS;
	Wed, 12 Jun 2024 15:30:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHPw6-0000000DAyB-3FPD
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jun 2024 15:30:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7B011614BF;
	Wed, 12 Jun 2024 15:30:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA8DFC116B1;
	Wed, 12 Jun 2024 15:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718206253;
	bh=CUlq4d9WwLarlHKch8/wOlIU1KBwXlSH4EPb02NZQBk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MmGs0RywaTnZC4quAJ0PEgt7pvh09ZXcb5OYLjUgkqKwkHAKGxzOiJkOFbIJw3usv
	 VLv/S9jmg8sttMUF622W6bUGdFmWfPqsX9imxlDrYRK+pxF9XsWyVTFo3HXT3g9vdc
	 E5IZxmw84RAL472ncu6iYJd3265aGxgPsryDXs0cQnZHz8wGU1eBDusA1OJxJb7ee6
	 PxWzWiUvMljtOvzUL/WoKq0B5Pl9pgSavJa8HuqoUomuWkYZWQCvnPON27UmxaDvtA
	 4/8tIIuW0F0IO+A6+JW4cI7qGDdo9R8DR3KGXOQun0O2LJLqXKN213tosCSNQKPr5a
	 t0ldmbBnRGkBg==
Date: Wed, 12 Jun 2024 09:30:51 -0600
From: Rob Herring <robh@kernel.org>
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Chao Wei <chao.wei@sophgo.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	=?iso-8859-1?Q?Miqu=E8l?= Raynal <miquel.raynal@bootlin.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/6] dt-bindings: interrupt-controller: Add SOPHGO
 SG2002 plic
Message-ID: <20240612153051.GA2633500-robh@kernel.org>
References: <20240612-sg2002-v2-0-19a585af6846@bootlin.com>
 <20240612-sg2002-v2-2-19a585af6846@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240612-sg2002-v2-2-19a585af6846@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_083054_974956_0E488738 
X-CRM114-Status: GOOD (  12.18  )
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

On Wed, Jun 12, 2024 at 10:02:32AM +0200, Thomas Bonnefille wrote:
> Add compatible string for SOPHGO SG2002 Platform-Level Interruter
> Controller.
> 
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>

Missing Conor's ack. When sending new versions, it is your 
responsibility to add tags.

> ---
>  .../devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml      | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> index 709b2211276b..7e1451f9786a 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> @@ -67,6 +67,7 @@ properties:
>                - allwinner,sun20i-d1-plic
>                - sophgo,cv1800b-plic
>                - sophgo,cv1812h-plic
> +              - sophgo,sg2002-plic
>                - sophgo,sg2042-plic
>                - thead,th1520-plic
>            - const: thead,c900-plic
> 
> -- 
> 2.45.2
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
