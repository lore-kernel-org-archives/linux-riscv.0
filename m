Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 887CEC71134
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 08:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PN2xcEM70uL1gnB8EobW0/QO+Bb2vK6hfoD+mXotYZg=; b=EzxF44+Swsmjgb
	Hih+W3MF2r9I8GJ2DtRHRNCelGYH4zk2ucsT0B6+BOoRLliPjVyRKrvaamFk4xEUk5MbIzAMAIDjx
	u6pUDDWIA9IXF7ZN2lheWBd+LZTZB6rznUStHsiw9uk+4A151p1KUMVEu8is3parP5rxCYf3AAgyO
	GiQpOlJ8bF8xDwUyAoqNrgnFd4bKGay6tXqCOzRC5ri8s628vo8odHvedhrNd9j3AO1KGBuXiOZlC
	ShIA9Ccbs7E3PCcJnGzR2Q2bs8U8MVktjMcmnbxwi2jRH4hVXi/i5xNiNGjA/9FqKwXw9gBgN/zeq
	rXybfYYJ75E1VvZStZYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGwF-00000009Hnn-1Lgl;
	Wed, 11 Jun 2025 08:36:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGgf-00000009FHG-2i7s
	for linux-riscv@bombadil.infradead.org;
	Wed, 11 Jun 2025 08:19:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=KtnmsqQ2LAN7jquyAdU6uljCSKsnGXAosUkfWdjP6+s=; b=qPp1w7D9nhtNYxhNFuPg9/Jp7x
	XS/fnCy7EuLNTCWNFgmHyYrCuaj3A+LNpQ5nDeL7pZsjwvykCGZV3FrikBvjrIfBHu2beTXrc4yD1
	dibzFXr77PmXTQHswS67kQN+ClZdjUWBUCbgrb90uFYLolFR4VmN7KC3258Iy74N3Q1JnGWMhHCS2
	/6Ht+9n0np1Ey8+YyKHv33jC7fvHvlEqaItfzrWexS8eWObc4O7n5AvfCT+znxLqaYdNvedVkgM0J
	WTMvMXam75yzrf6vqxosI8WuyP6aMorE+Uw4iHcAQTvsukMEQYgtC+TTYnq9F4gY+QvOVs5FpRCjj
	M1etzhGg==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGgd-00000002Bmg-3F9X
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 08:19:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0BC945C0FEA;
	Wed, 11 Jun 2025 08:17:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBFE7C4CEEE;
	Wed, 11 Jun 2025 08:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749629992;
	bh=LpOR7XcZXmzmGcfztdnzKluFpCfBqLJIBXVMouaN4m0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wue7G2fmsOdwpcBRX6+SWN21s+ZcCtwgSVV1Bgxb9qU0AaBwKNJIBfKyBnEkzmXcc
	 aGk4y/C0550irUJigcNd5MbdfRVJQPeWsYXlvPObTmR70E+rn1/dvCrqFUNx9b6CHD
	 d4SoNoyPtkNhMP+/pWk+SIfqrSNoyAtmNk7ta2JNzlINGSIhDb7dxdDPQtq5PREY4A
	 JxlnXKQCZuTigmoU87oXk6S7VS2Zfl5rIwJXN+0RyG/W9G1vlLCxEaocIyb7wDqF2y
	 cvTA/LTSeczdZ4GIwGxG4ufCvwjq5Z0JHEnKzsoqjwl2vTcbLOcZ5Rqr8fKlNBQ+9s
	 Z0BsJu0nq+Uug==
Date: Wed, 11 Jun 2025 10:19:49 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Vinod Koul <vkoul@kernel.org>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, Yu Yuan <yu.yuan@sjtu.edu.cn>, Ze Huang <huangze@whut.edu.cn>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Junhui Liu <junhui.liu@pigmoral.tech>, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, dmaengine@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: reset: sophgo: Add CV1800B support
Message-ID: <20250611-brown-turtle-of-election-87c324@kuoka>
References: <20250611075321.1160973-1-inochiama@gmail.com>
 <20250611075321.1160973-2-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250611075321.1160973-2-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_091956_010919_615F7BB8 
X-CRM114-Status: GOOD (  11.58  )
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

On Wed, Jun 11, 2025 at 03:53:15PM GMT, Inochi Amaoto wrote:
> Add bindings for the reset generator on the SOPHGO CV1800B
> RISC-V SoC.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml b/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
> index 1d1b84575960..bd8dfa998939 100644
> --- a/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
> +++ b/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
> @@ -17,6 +17,7 @@ properties:
>                - sophgo,sg2044-reset
>            - const: sophgo,sg2042-reset
>        - const: sophgo,sg2042-reset
> +      - const: sophgo,cv1800b-reset

Keep alphabetical order. That's enum with previous entry, btw.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
