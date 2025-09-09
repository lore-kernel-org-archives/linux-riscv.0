Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60D12CAC589
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Sep 2025 07:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QeH5R50f/0nmTaqpm+b912wCVgTF+dq3uB05N3dCw+U=; b=osfUuya6vXzx12
	ZIzI81FXibN5bkpPTwfhguuaxL5JxW6KfJ0zXqkHwrx6kROIfCRhVee40O6VcxO96M393sxyKCguY
	vSNueyGoCN25YoO6s9lDvRf2jGtAOXqemUBEzRGlQ/GYWDLU8mzIsoDYOI8KvkgBok95cRQ9EaLK+
	IGTmimBMGlIzWYQRVQyTp4/xX0ZHiVGrw6GTSCmtUNwgA+1dW0bmydpCpOtH3TlNngiA0yKS+WcgD
	zNxqw8rFgKvdm871Sm7l3kPRfqPW+a3u5CnF5Fh7WNqff64ISYUIE75zNfADzKzkp5wV2N/pHQMHU
	kCx+2sK41ST7HkdoYidA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsyo-00000005HSi-0MJ4;
	Tue, 09 Sep 2025 07:41:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsE1-00000004sAL-3kbM
	for linux-riscv@lists.infradead.org;
	Tue, 09 Sep 2025 06:53:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 88E1A6019D;
	Tue,  9 Sep 2025 06:53:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E7D9C4CEFD;
	Tue,  9 Sep 2025 06:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757400788;
	bh=Hco75eSdLR65M9UxB56opHwogsO7S9rVeVew59lMe44=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IcoH4q0V9L6wYM5vZtTXEaG+WZLTyAAYEEgG4sP/iA9TiqX7Jlp3Al/6aP+h35naQ
	 ofLn+bPrHtTkDCZgQYOi+xVyVqmFVEtX+3ck0IJGGkgSGAWjIIibJIonmrj6IEnHq5
	 lkgqYJTJ8RTW3E1tnSdW1UpUmH/dVYEwzkg8ER2FojlHaQFibw76xU37RL66VSntym
	 S0O955c/VGkE8i1/4GcMNKwkJOoEFjvv+3SqUiciLppanY+y6fiE4+Itt3Y+xJwhyP
	 B/4o+3TG7bsmGrcRT/EnaIRihAeeUmZkycH5ZFuNj2zskFnl6XpwCXIyHMYDGLgR15
	 FFXlHnayB6BPQ==
Date: Tue, 9 Sep 2025 08:53:05 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
Cc: conor.dooley@microchip.com, daire.mcnamara@microchip.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, robh@kernel.org, krzk+dt@kernel.org, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/6] dt-bindings: riscv: microchip: document icicle
 kit with production device
Message-ID: <20250909-accurate-wisteria-spider-222341@kuoka>
References: <20250908115732.31092-1-valentina.fernandezalanis@microchip.com>
 <20250908115732.31092-3-valentina.fernandezalanis@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250908115732.31092-3-valentina.fernandezalanis@microchip.com>
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

On Mon, Sep 08, 2025 at 12:57:28PM +0100, Valentina Fernandez wrote:
> With the introduction of the Icicle Kit using the production MPFS250T
> device, it's necessary to distinguish it from the engineering sample
> (-es) variant. Engineering samples cannot write to flash from the MSS,
> as noted in the PolarFire SoC FPGA ES errata.
> 
> Add specific compatibles for the Icicle Kit with Production device
> (MPFS250T) and Icicle Kit with Engineering Sample (MPFS250T_ES).
> 
> The icicle kit reference designs in the v2025.07 release include the
> Mi-V IHC IP v2, used to send/receive data between clusters when
> using Asymmetric Multiprocessing (AMP) mode.
> 
> In reference design releases prior to v2025.07, the MI-V IHC subsystem
> was included as a proof of concept in the design prior to becoming an
> IP available in the Libero catalog.
> 
> Among other improvements, the new Mi-V IHC IP v2 includes some
> changes to the register map. For this reason, make use of a new
> reference design compatible to denote that v2025.07 reference design
> releases are not backwards compatible.
> 
> Signed-off-by: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
> ---
>  Documentation/devicetree/bindings/riscv/microchip.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)

Why are you sending patches which are already applied? For two weeks?

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
