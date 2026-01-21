Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FCA8C44536
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jan 2026 16:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oJY4my6mrMygTq4BRJRjPNQdBr05PyhzN4cEWT5QyMc=; b=blPAcQvBZQ4Df+
	5u7s0Tb9uiQYR0nPSVwGrGomCxCAYQvFiEctkBU4XYOQ1/qHRz0I/hmaEaZHrLw5IDprO47JXlVYO
	oLI1eVPNHGPpsyCjHuJdF8B9vUvzbEESu8mUTCUDqswbYWfk0bt7Xc0ExgKGyFEuYoKlYT31bt7CZ
	ACJo5jtm/ZjTuf9hJKSn+PlyLiE9fIzqV34AEWmM4CzieyVjmvHiMN1RR7CVT/kT0KZ64L+7jnAWU
	anhHAnX7DddIbszdXNU5EDpDDsxlEKtNXxl02psauYDcGMJBCfOMVuUoZpbbgEGVFiQ/TXgCd3vcV
	8GlWe/otLAuSz7Q9xubw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vibMA-00000005oyY-1vq2;
	Wed, 21 Jan 2026 16:46:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vibM8-00000005oyP-3gYF
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jan 2026 16:46:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C432860130;
	Wed, 21 Jan 2026 16:46:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6122FC4CEF1;
	Wed, 21 Jan 2026 16:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769014015;
	bh=Z7AKcqKCdVo5K9fbbsB5xIAy1McNGsgeezfpuSs7aiA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=meoGeEWMh9HsFWabKvkgvplnCsGRr9lNvPY7lZVMnK8hGssgoTaOyapsiLs/RwxCV
	 X47RUwGKe3P6y8dfoZZesztRtEBVwLTS7j5eHnScJyUmz9VjwkDbsx9pMM1MZUfj/E
	 yz7ZcQOmkT4DFfJjsc4FDTDcn4WlX6n/4rhXIScKGO0zSzNOKAmKzIq6XLnPHUAx7c
	 bC7pB4wBDciqkeECt+/tqbLYJzZLgDXEh1lJ8O3+X/WKikNo7YBGWV2xreq2DM4lC7
	 oLhoXwW7F6vbYQs7NGoipsuaAHQ8Z7jAWZsHX57sX/cL+ndIWYHO5yqtyKZuWTjBDg
	 PO1o9Y2bPhg7w==
Date: Wed, 21 Jan 2026 10:46:54 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Yixun Lan <dlan@kernel.org>
Cc: linux-mmc@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	Ulf Hansson <ulf.hansson@linaro.org>, devicetree@vger.kernel.org,
	Adrian Hunter <adrian.hunter@intel.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: mmc: spacemit,sdhci: add support for K3
 SoC
Message-ID: <176901401388.3439509.9465691892166826989.robh@kernel.org>
References: <20260121-07-k3-mmc-v1-0-ff77c07bfdf6@kernel.org>
 <20260121-07-k3-mmc-v1-1-ff77c07bfdf6@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260121-07-k3-mmc-v1-1-ff77c07bfdf6@kernel.org>
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


On Wed, 21 Jan 2026 15:27:35 +0800, Yixun Lan wrote:
> The SDHCI controller found on SpacemiT K3 SoC share the same IP with
> K1 generation, while fixed the broken 64BIT DMA issue. Introduce a
> compatible string to enable support for it.
> 
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
>  Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
