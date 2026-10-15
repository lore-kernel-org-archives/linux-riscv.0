Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BA72CC6B34
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 10:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eX7hoA5pXxFCOSw9puWmww9WLRUPpXaSgHvx2u93B5c=; b=UzmSvSohw2biAT
	+vQN2r88qLa7qw3FdcCeC2ci+j7/CVmSzseOMqjXALfCoWg4s6Ha2ikmUcfbZ8cYskaX44oEzDmwm
	x2jJHL9Ijup1oc9uxlxUv0vtQaJLvT4HzrbRd2qenvi9WfsTx7WG8deyFWZh2NuTBbBetjvJeplhR
	8xURzV9szh2QAFDVV84AbXF7WCNUA0bWdSyKNQyzAXlPemfADFy0Ax/3hhWp5DE9y7kAUK94VzlV/
	bvN8S81CrTONrvoODwwbBZWzKCHyYn2VkjH5zURvX3yZQwd3tvSoVa58JOSzSNDoo55q2b1llDSy0
	nR+samn7SeIx12JLw0NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHIze-0000000HTgx-18tC;
	Thu, 15 Oct 2026 10:47:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHIzc-0000000HTge-3Qh3
	for linux-riscv@lists.infradead.org;
	Thu, 15 Oct 2026 10:47:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F2E1860120;
	Thu, 15 Oct 2026 10:47:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A8F91F000C4;
	Thu, 15 Oct 2026 10:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792061243;
	bh=bn1RVhh00tR2vWhDxqlS04Kzhv5cg4PHb+mrabZlf2M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Qp9GsYQFpkwJFALLlWyLztGsBZGaiC8y9HyLf54K4ElVhjIsLpZFVXaaIsqRrb2SI
	 BCzlrWoYyljSUUVVJb0M9DevB4bp+VkxEav2UluERBUpIh+DXw4wG9NBG4itegwGqC
	 CINJalsZSHC0wjo/6i1HZDyke6vwB1UCYurjooRGZMJJsCw5XIWFmGzDkuAjW7qXIj
	 gh+GLZWuMtBYcFkkOycW4/vdRjZEaWaXSIacmF0X17YK2aEi1RilGLXhTPMdb98I7d
	 Bv6bbJqBOqlNiIe55UaNQr4w2qYsPFEkp3LNonL7d0mqH/b5Pd2ez2HShcNJb/Z+F5
	 sfX19PQDxzIvg==
Date: Thu, 15 Oct 2026 12:47:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Baihui Liang <liangbaihui@linux.spacemit.com>
Cc: Alessio Belle <alessio.belle@imgtec.com>, 
	Luigi Santivetti <luigi.santivetti@imgtec.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, imagination@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH] dt-bindings: gpu: img,powervr-rogue: add spacemit,k1-gpu
 and spacemit,k3-gpu
Message-ID: <20261015-cordial-unstoppable-jaguarundi-bcf668@quoll>
References: <20261015-spacemit-gpu-binding-v1-1-a7a23c7e7788@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261015-spacemit-gpu-binding-v1-1-a7a23c7e7788@linux.spacemit.com>
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

On Thu, Oct 15, 2026 at 03:00:48PM +0800, Baihui Liang wrote:
> Add compatible strings for the IMG GPUs in SpacemiT K1 and K3 SoCs:
> - K1: IMG BXE-2-32 (adds a dedicated entry for a single core
>   clock and power domain).
> - K3: IMG BXM-4-64 (shares the same configuration and entry as
>   the T-Head TH1520).
> 
> Both SoCs require a single power domain provided by the APMU driver
> (currently pending mainline):
> Link: https://lore.kernel.org/all/20261008-04-k3-pm-support-v2-0-6f778a53dd2d@kernel.org/

That's not relevant here, drop paragraph.

> 
> Signed-off-by: Baihui Liang <liangbaihui@linux.spacemit.com>
> ---
>  .../devicetree/bindings/gpu/img,powervr-rogue.yaml      | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
