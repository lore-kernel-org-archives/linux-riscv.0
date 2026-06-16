Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7875CCD98E1
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jun 2026 23:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tC4EIr3rWOSEWhXc4fKtLyfmbSH7wgSBfPhLAw+Xjeg=; b=wI88AGLnSz2nuy
	Gz63Oc0qHBYW0fXiilvG/oUzHFcBT5LHISbUOkWsmPn/bnWpN1WEeWLagDGNN0b/FilqXWIrleo+6
	qMON6Xw2MeWSW8GCeq9En9Rs/ZdZ7nqJtwXHCk6S0Vr1pQ/Ozzka2nqEWiqaXPRflDaAciQ6wgUma
	7LXb/dGuhLyZJXyIt1nOZpVq1+lzsi/S551uwK1RDmG1W7G1+qMSYpgK5CE45AJef43mfMfHtnUlO
	BMulQRfDfgUniY8aO7G8tSO59XehB8uqfzTKYKs8qDYG5KyPx1jWBMcbk5Ow5kLN85l4bhyhnsLG3
	Ez8Z+JX0R+8L5Yx21r2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZdTB-0000000GPno-0xsX;
	Tue, 16 Jun 2026 23:45:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZdTA-0000000GPnX-0PT3
	for linux-riscv@lists.infradead.org;
	Tue, 16 Jun 2026 23:45:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3A75E409D4;
	Tue, 16 Jun 2026 23:45:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 244E61F000E9;
	Tue, 16 Jun 2026 23:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781653523;
	bh=fnZctqJ9JUJa0dpu1bMXxLaV39Qis4wHH7G2XZVYwa0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BNObnnaCxsJaaexQf3i7p5ci/YKP54imBKssllRd5lEMhfJ/p/E3zt0G57ZsvS30T
	 nINv+khVxP7T4RlHm2SakjpQv58OJHR6kq2Zk0v45/qkgcv5NpVbV96OQhBGbZLNHP
	 4yPMeWLfV1+wZ23fvVzzAb3k5zrOpHEn1GSgxkYhtV8a5jGyGcXhlYti4MQLmXtGfk
	 BlMpLX4ZviPnAemSC/JylnXuumzr+DbsYYsrEU0sPviA+64zcqOs1TNJ1hqpejJNBT
	 WO+HNbJm1qV101YsAbMY1c7pSUCNt3dr6JAvfejCk++6QAQN8X7wEMqyexwr8NdWKd
	 hH4/eDt6OJf6A==
Date: Wed, 17 Jun 2026 01:45:18 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: linux-i2c@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: i2c: microchip,corei2c: permit resets
Message-ID: <ajHf_colM2_15FZU@zenone.zhora.eu>
References: <20260506-bronchial-kitten-e3697fb66ba7@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260506-bronchial-kitten-e3697fb66ba7@spud>
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

On Wed, May 06, 2026 at 04:00:46PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Both CoreI2C and the hardened versions of it on mpfs and pic64gx have a
> reset pin. For the former, usually this is wired to a common fabric
> reset not managed by software and for the latter two the platform
> firmware takes them out of reset on first-party boards (or those using
> modified versions of the vendor firmware), but not all boards may take
> this approach. Permit providing a reset in devicetree for Linux, or
> other devicetree-consuming software, to use.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

merged to i2c/i2c-host.

Thanks,
Andi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
