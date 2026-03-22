Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B87CD58CA1
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Mar 2026 22:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GYsoVHNNL0rH3Awq+6gvsBvHq6sd0pUwgHIr5uwL7cY=; b=z6iKN1w9iP4ptH
	byj8XBIkIzsWd3ebCvWhSAFe/O18Pa3vCP0Zr+nCh17r8CckP1P6/X0wJS4vS/yT0FcQFlsZ17XnP
	/ICR289e9sQ61qvR1js6Lqxa5xv1Y9G8wXOCwST3dB0RaQgdOrmNjF2bP6Atn4cehxYTysrCy0Bwz
	hjNCS0brB4FMXyCRVC+6EklfIJMSHZl5ydvlQRb65e5NS3h4VHnJUrd+fAfr8ynWTZWzizzGnv7Gi
	EZHaQ+N89sp5sgXoeorSn+hdVyOtJi3rVAOH98izNDfjfVGVZ4uZg09LFlqm7hKhNPTsbTa8rNY+Y
	UIdT+eaAMWmcOqlUmlCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4Res-0000000Fj7H-0pKA;
	Sun, 22 Mar 2026 22:52:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4Rep-0000000Fj6W-2bEO
	for linux-riscv@lists.infradead.org;
	Sun, 22 Mar 2026 22:52:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1A196404E1;
	Sun, 22 Mar 2026 22:52:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F4176C19424;
	Sun, 22 Mar 2026 22:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774219949;
	bh=/E0I7SHxfbeMY2aFFQs5bRnGazi8aAt/7tDku6BIrBA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tWacZ4Q2HRu9WdBHT3Qbl+yGMKMpoz3ysKkTq0SJkkAp/ee6vAw6l1ohZxKCr/mKM
	 ksxo6akJ2IIkf/Q9S7o/+Ao9SCkkAJxl966eCTuE7edbfu07l3Slifb9LcV2GrYW8S
	 BetyvETbmo8jnVC8ttebN4BBNnlbOmJC8/ugpzMbF9yh4AK/y+gOGdn0qDH1AvGDde
	 AEwjbsZNnOyj2KRSZZfA4MB8qpUqYHj0qB4pIu7FflbcqqvZjrFPstSvWCEZYvDvml
	 oIDoJ/67f01AwjYH53+RIFVUl+VXdanzuwwHRzti1/0dPnn3ZRPKLDNh4ipM5l55yp
	 wlF95bD5Tevow==
Date: Sun, 22 Mar 2026 17:52:27 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>, linux-gpio@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	linux-riscv@lists.infradead.org,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v13 1/5] dt-bindings: gpio: fix microchip,mpfs-gpio
 interrupt documentation
Message-ID: <177421994732.40940.10998133655165024029.robh@kernel.org>
References: <20260318-gift-nearest-fd3ef3e4819b@spud>
 <20260318-fondly-tradition-90b8241f0cc8@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260318-fondly-tradition-90b8241f0cc8@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_155231_683213_11362EBF 
X-CRM114-Status: GOOD (  18.11  )
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


On Wed, 18 Mar 2026 11:04:32 +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The microchip,mpfs-gpio binding suffered greatly due to being written
> with a narrow minded view of the controller, and the interrupt bits
> ended up incorrect. It was mistakenly assumed that the interrupt
> configuration was set by platform firmware, based on the FPGA
> configuration, and that the GPIO DT nodes were the only way to really
> communicate interrupt configuration to software.
> 
> Instead, the mux should be a device in its own right, and the GPIO
> controllers should be connected to it, rather than to the PLIC.
> Now that a binding exists for that mux, try to fix the misconceptions
> in the GPIO controller binding.
> 
> Firstly, it's not possible for this controller to have fewer than 14
> GPIOs, and thus 14 interrupts also. There are three controllers, with
> 14, 24 & 32 GPIOs each. The fabric core, CoreGPIO, can of course have
> a customisable number of GPIOs.
> 
> The example is wacky too - it follows from the incorrect understanding
> that the GPIO controllers are connected to the PLIC directly. They are
> not however, with a mux sitting in between. Update the example to use
> the mux as a parent, and the interrupt numbers at the mux for GPIO2 as
> the example - rather than the strange looking, repeated <53>.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/gpio/microchip,mpfs-gpio.yaml    | 24 ++++++++++++-------
>  1 file changed, 15 insertions(+), 9 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
