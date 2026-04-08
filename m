Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2FEEFD5F9A
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Apr 2026 09:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e58H2Rk3ZkPX3UMGhLL2Q71lsFEg0XUwyFUPWKU5tEk=; b=Q9sCbbSYk4In1b
	fITttiG7+K8OmTXw9qmsEpRCP1IzgjcaOSaCJ1Yju7UFBp8F7TnFIvGERr9migI8i7tpTDPM7JVWo
	CsIdAFd1aG99un90idHeangcIGBXHUMMFriOpBwZJ+HVtdGhp6kKZpd1Cwe0FvRNYWCp5T5pdx3Yl
	MotfV4ZhNaPhujJ1FHPgSTbzATRsPijNyvLQ/3nt7P8+Hag+L8KLmRoUMVgz7OkE6KSQk202xim4C
	+qvFq+M2bStEK/pYvRitx/difeSRyhWNEqxa2sjwSB5+i4G3AYd5FsyrbBuPkEpESQwrkJHkcYKG1
	2YJSNL9WFcCmsBh1/lyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAOpT-00000008YkI-3mZ4;
	Wed, 08 Apr 2026 09:04:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAOpR-00000008Yjn-119Q
	for linux-riscv@lists.infradead.org;
	Wed, 08 Apr 2026 09:04:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7E740407F8;
	Wed,  8 Apr 2026 09:04:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C9F4C19424;
	Wed,  8 Apr 2026 09:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775639044;
	bh=wtwB4aX4vGpdDsXQMtAf8PcUF5GLYCxCdtiObzDC+qg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c5XbOLFMUlIfzCTyM2UGmy/9WjsTgNPbIfMq6sn+eHnHDPZP6ZOwfChBj2eiA8sMB
	 y/Fbk4VNxrqC7SsT7xVoYYK8ixiM4FvG/KmTgB+akyhJQnVFQQT1ZdJh+u1uo8pO6z
	 3xYWfeNKJ0vL1kkEPkKxOIE8ZWBGCXjnHn/zVS2FDs266IkdqEsaLGm3URVK1T0iXg
	 6ZX7wAp+6GHGC3G0E65M0yPGlDyryFtix0ULPskaFNtzGdNY7V971lvwPtOkJ2LQxk
	 RZZeVNd6Rskd1owPVK0RbO716BmnMZ2TMvX07M9Fj0SSwfeOSZbkXhNBrlD48mG4kg
	 GdWfCVi90E/Vw==
Date: Wed, 8 Apr 2026 11:04:02 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] dt-bindings: soc: microchip: document irqmux on
 pic64gx
Message-ID: <20260408-wandering-divergent-marmoset-b57df0@quoll>
References: <20260407-headache-reward-ae93bacdba0e@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260407-headache-reward-ae93bacdba0e@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_020405_298339_B0385015 
X-CRM114-Status: UNSURE (   9.84  )
X-CRM114-Notice: Please train this message.
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

On Tue, Apr 07, 2026 at 04:29:31PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Being practically identical to PolarFire SoC, pic64gx has a irqmux
> that's entirely compatible with that on mpfs.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> CC: Conor Dooley <conor.dooley@microchip.com>
> CC: Daire McNamara <daire.mcnamara@microchip.com>
> CC: Rob Herring <robh@kernel.org>
> CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
> CC: linux-riscv@lists.infradead.org
> CC: devicetree@vger.kernel.org
> CC: linux-kernel@vger.kernel.org
> ---
>  .../bindings/soc/microchip/microchip,mpfs-irqmux.yaml       | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
