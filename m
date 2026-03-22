Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41FAED58CA3
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Mar 2026 22:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZuAROlW4C0xuXghDq1Y1Ez64r4QwvHP1Ug8MOtiQhhg=; b=vDvuuRr9X3DWOL
	TFrfibseF6+Lf6t1/wEP+Fz073LbwcBZr8qb2bm3bK/kUZdGfS5yPOa3uPwgglEWVV73ZZYcJrqqp
	mN7wSAa0kYdc0/qIPkO13oXMvz7bucQlBfVwEdRDXGANB9ac6fyZhPQQqP4KGAdEVw56RtWADg+Zw
	iykRRsIdp3uSKNNMCFBjB4L/YowtJwlcNlGcA6DKowcFJ3LYzFPSKTHn2Xpvsk2tTVMewoL7Cp806
	wx11q9O2xKXZ+2LNHGn2+ucBjV7vFWfEt1yVI7Zpq/dT5GhYDNqA4bEYpdTONIVD+OwUD/XGFT8aZ
	yov71FzutMrRFIX79kgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4Rim-0000000FjJ1-0GJl;
	Sun, 22 Mar 2026 22:56:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4Rik-0000000FjIt-3VSz
	for linux-riscv@lists.infradead.org;
	Sun, 22 Mar 2026 22:56:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 533DF60008;
	Sun, 22 Mar 2026 22:56:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7458DC19424;
	Sun, 22 Mar 2026 22:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774220192;
	bh=oCbRxSNH1GuDwX+8hbSmIUfP9Ox64Oewx5GCbypmbrE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sYfyquHHkQAVCrmwdtiaYpNhgK08pwTkqNMi3BlSAhMeQRwoQ17Kds49Lg/OGqmCL
	 SWCjyCpgWftnu/AWJvxj/64iOQS+iQz1qj7oSPQSXyYP8N1iRfaPBeKrZykMD8KBZK
	 mkF7FsdOUiwBjsTf7fWF+ZgCMadBvYaRAvl1ev9b/BYnFRNBNcxfCIr1Rl6/jADjGx
	 j34+fk2qe+PBJpLOpC6vqhskMkZ0O4ZGlPMBBkNGV3nuAB1A8VXFhUcbvBO/XmYIiD
	 T2k6JGgykJ98veW45UkW9VvkpLVAcTcn3UDeVqBUaQaaZRXr5CDguRkflSGm/UcPJc
	 9aEQ8oHR7u8pw==
Date: Sun, 22 Mar 2026 17:56:31 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Palmer Dabbelt <palmer@dabbelt.com>, devicetree@vger.kernel.org,
	Herve Codina <herve.codina@bootlin.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Paul Walmsley <pjw@kernel.org>, linux-riscv@lists.infradead.org,
	Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>
Subject: Re: [PATCH v13 3/5] dt-bindings: soc: microchip: document PolarFire
 SoC's gpio interrupt mux
Message-ID: <177422019104.46273.4844839015391961546.robh@kernel.org>
References: <20260318-gift-nearest-fd3ef3e4819b@spud>
 <20260318-whisking-steadily-91b2497f6fb9@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260318-whisking-steadily-91b2497f6fb9@spud>
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


On Wed, 18 Mar 2026 11:04:34 +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> On PolarFire SoC there are more GPIO interrupts than there are interrupt
> lines available on the PLIC, and a runtime configurable mux is used to
> decide which interrupts are assigned direct connections to the PLIC &
> which are relegated to sharing a line.
> 
> Reviewed-by: Herve Codina <herve.codina@bootlin.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../soc/microchip/microchip,mpfs-irqmux.yaml  | 103 ++++++++++++++++++
>  .../microchip,mpfs-mss-top-sysreg.yaml        |   4 +
>  2 files changed, 107 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-irqmux.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
