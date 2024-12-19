Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96FCAE77184
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Dec 2024 11:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y0SN7KMjpMSXYTcQpag88d3fTQ/Jse6BjsYdJW2GYnU=; b=ko2OFMKO6mSU2c
	QGtWUcnhb8qFkjPStK6oqWDZYontqYfVvW2v00WcAi2ccaU6zyluabFQHCbJuOpokoD6qXXq2Az3P
	jX9qqiHXrIaou0wHEHPwrFIMZ1PiED51YIEpgMRhQ6iIuzIPXPjFhJ/sCbeIyW1WuEDERXP33DvCO
	zh2ae+tuTrE2OG/HFTgY/pAq66xNCo0wm+cRjyTks0/gh9Hp/3qoX3TdI6Lfnh7/jAakhof2aEtYU
	Erb3liIpz9MzOG6LrwIwHxzaiD1zVEAMlf5dyKaOVEzj5AhqXs1png3UAjKWXJ6g48gdjUGoyVeI6
	lhyDE2CdcP8vNl3GCozw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOF3X-00000001i8G-02DW;
	Thu, 19 Dec 2024 11:51:03 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOF3U-00000001i7p-2Cu2
	for linux-riscv@lists.infradead.org;
	Thu, 19 Dec 2024 11:51:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E05C3A420B7;
	Thu, 19 Dec 2024 11:49:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 462B4C4CECE;
	Thu, 19 Dec 2024 11:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734609059;
	bh=e/PtZOP08X9uNbZQClRarcWAa1DyAY26IrldpLYTJqk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M+KtOd11HqB7s4qStP9fuBKoSyOay1t0gOaC0YPPhFy2n6FXati0Aw59LbBC2F/3w
	 IDHDKGZjU0LoQcpFAT5XmMDiVKuY5x/oWSPD+La8ehi1abGSVZ2Znbsn5vb2RmqDMN
	 mY7HR79mGbStOdAAq43au2PRIuPletq5XvGe9Qlbczxsq9x27d0FbMow3fDmpbu83X
	 8HEZEPqNBedvxDSVC1cNbUBiKJFihZKPto0Xt1Sg2xl1sNEd5kmpCDDeMHOegl3NIY
	 rGA4F5phQ/QlaPFq6YgPZkipOzyjUlxfY00PfZE/wEAy4ppAotkQu1A6f6ARhxeAZx
	 keEllArR2rjxw==
Date: Thu, 19 Dec 2024 12:50:54 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: linux-i2c@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Wolfram Sang <wsa@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Microchip CoreI2C driver fixes
Message-ID: <axscykf5n2lutd7pqljaiyyfwgw2vuh7knnxcv6vlphu2fxefp@7kmgimahqop4>
References: <20241218-steadier-corridor-0c0a0ce58ca2@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241218-steadier-corridor-0c0a0ce58ca2@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_035100_633462_A469EFFE 
X-CRM114-Status: GOOD (  13.78  )
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

Hi Conor,

On Wed, Dec 18, 2024 at 12:07:39PM +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Yo,
> 
> Here's a v2 with one of the minor items pointed out by Andi resolved and
> a new patch for an issue fixed in the months since v1, plus some minor
> checkpatch things that I seem to have missed on v1. On v1 there was
> unresolved discussion with Wolfram, but it has been two months without a
> response so I am sending this v2 in an attempt to make progress.
> 
> Cheers,
> Conor.
> 
> v2:
> - remove extra () Andi pointed out
> - fix some {} use that defied the coding style
> - new patch for "ghost detections"
> 
> v1: https://lore.kernel.org/linux-i2c/20240930-uneasy-dorsal-1acda9227b0d@spud/
> 
> CC: Conor Dooley <conor.dooley@microchip.com>
> CC: Daire McNamara <daire.mcnamara@microchip.com>
> CC: Andi Shyti <andi.shyti@kernel.org>
> CC: Wolfram Sang <wsa@kernel.org>
> CC: linux-riscv@lists.infradead.org
> CC: linux-i2c@vger.kernel.org
> CC: linux-kernel@vger.kernel.org
> 
> Conor Dooley (2):
>   i2c: microchip-core: actually use repeated sends
>   i2c: microchip-core: fix "ghost" detections

Thanks for your patches, they look fine to me. For self reference
I'm going to add

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

to both of them. If you don't mind, I'm going to queue them up
for next week, as I'm not accepting anymore Fixes for this week
(unless they are trivial).

Thank you,
Andi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
