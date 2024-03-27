Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99BA6C54E67
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 17:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EzBiq55D4+KYZhM0eU84hlNnW7qeILw1cXGOpqfHtGU=; b=ckY+kG1Jy/Fxuv
	kUIS0hsy8pvXmYu5SxaCLzKIKIxT+/TYegJp9EUYgKdJFjjni5xptEqjKo/9qdOTaccT40N+Sfusl
	q2qaLII09AYraWWRIeMCkWcSzTwKenmGPoKojVGWi7aAX9QG37MaEnPJa0TlwLLycRVIX4GJU9zCC
	XmLRxsINJxHDXiQMutEe8qVMp8hcBfZ2bnUML8KuAJUi0FJY3Ie1AokVYIRR7ognsnrhnSsdadVzt
	Jmi3UTIpu7EIekAXd5w4IpZyyAEr36CSj2Zdo6tL3pK/tMo0044zDckx1b7yWOmeQx6nG5CTZA6+c
	xSMJ3aQxnjoKaSlpsPyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpXWc-0000000APzc-1rqX;
	Wed, 27 Mar 2024 17:57:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpXWZ-0000000APyi-1Qlg
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 17:57:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A69C061638;
	Wed, 27 Mar 2024 17:57:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D9FDC433C7;
	Wed, 27 Mar 2024 17:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711562238;
	bh=egDvY//d5uLWhDbId3Gj3GOZ8P3e61TVzkK5mB8057g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BAfN+w34ooSEjlr4N4tMnNyxMFrF5/EpcTE51vjwBxcJD9GsqkRp2+W4EshY7MA/S
	 18j+uu/6prCgQ7zs4DC5M8z3bzuY9iXqbW/8pmsPlvjJsuceHOGUZCzYCTsPe9vI2y
	 PMCa4M5fz9m8QHRx5DLSndnwNM4TOGfq+Jno80JtG01E4BrBaSWCukrsaVXnIeMfIE
	 nwylsW0V8w5F55dm80yPxA5GYO1LCqFLjCc9u+j5UjzcaxsPwGiX+ehhKt6PjtQIKK
	 7Z38n7hrivQB9t/nytn7BepjyEeWYpbAedcYlvHYO3WJ/HO/BjCgEcbQaDwgzv4k0S
	 Ex99/ChM42h8A==
Date: Wed, 27 Mar 2024 12:57:16 -0500
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Jamie Gibbons <jamie.gibbons@microchip.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-pci@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	linux-gpio@vger.kernel.org,
	Valentina Fernandez <valentina.fernandezalanis@microchip.com>,
	linux-riscv@lists.infradead.org,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v1 2/5] dt-bindings: gpio: mpfs: add coreGPIO support
Message-ID: <171156223562.3706464.15520740960365102234.robh@kernel.org>
References: <20240327-parkway-dodgy-f0fe1fa20892@spud>
 <20240327-procurer-rascal-33bca7d5d14b@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240327-procurer-rascal-33bca7d5d14b@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_105719_695848_D259DC2A 
X-CRM114-Status: GOOD (  11.56  )
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


On Wed, 27 Mar 2024 12:24:37 +0000, Conor Dooley wrote:
> From: Jamie Gibbons <jamie.gibbons@microchip.com>
> 
> The GPIO controllers on PolarFire SoC were based on the "soft" IP
> CoreGPIO, but the inp/outp registers are at different offsets. Add
> compatible to allow for support of both sets of offsets. The soft
> core will not always have interrupts wired up, so only enforce them for
> the "hard" core on PolarFire SoC.
> 
> Signed-off-by: Jamie Gibbons <jamie.gibbons@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/gpio/microchip,mpfs-gpio.yaml       | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
