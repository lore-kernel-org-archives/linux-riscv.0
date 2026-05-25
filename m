Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1E3ECD5BBF
	for <linux-riscv@archiver.kernel.org>; Mon, 25 May 2026 07:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=18TXUl3SpRxwHALe69JXbBzAM1NjQoRbs5nHcfxfEJQ=; b=mlaHItxz2WLGSS
	/XvClbWaBrgwSYvR4HYJl1Frp53hfHGQvKZ1uRF2b9H7e9Ds+6PEwgdfTjTCtztPSYDxUHK3q/VpW
	sc/z7WiyDsZav8rclc19bQY1PaV0VOlHC69EvLetFYOARN81apz0JmbZiJwhqEtH4AzSV8eHt1Wdn
	TZTVymVLen90xrt9UNlaiDpEW5x8QZ/IEng0VH953AXsfPnCBpSr2fCO73ij+qY31AxacWOXO+9/R
	dhoJZUmH6zJvzSn35zCC/BjEaw2rNNYoWwxMY6OX9h07oQAnU1b5Zbf8h+9nYJLeEeNGNLNWu8bH9
	htT/wrt6Jt1QyeSm+0qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRPO4-0000000GUcx-0dP7;
	Mon, 25 May 2026 07:06:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRPO1-0000000GUc2-03Zg
	for linux-riscv@lists.infradead.org;
	Mon, 25 May 2026 07:06:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 511D643F09;
	Mon, 25 May 2026 07:06:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE72C1F000E9;
	Mon, 25 May 2026 07:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779692764;
	bh=tKq39zSlshz2JLk+A5C/A0JVi3d04SAkhIgiWqzfHEo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cRNLva+AUPtjAKJT9R2UpnuDsbcjzO88XyV3jCC41OegEeHO7KnSMOIK4Y9FF+s3w
	 SdBGNMEet92u2p4bMzvh2ccpOGcxDUIK2JVuelossrYGQ3VbwcYtNh6b39PBhj6uLX
	 LwDWsj3PVe/IoG3T9SB4iqX/xPKOLaaLHNAAxE25vfY5U1jK38inIFMOtWsNmlA0uO
	 OPMenGAyGK7AgiBxApliPhXU6/LkWkEJwhjmwI1fZMbb/pzzIJj14UfNI9veVeE210
	 QpSIoOI2H8t8YbeU4DB1r/AUx7koJk1PSfCU/OmXO4YXA/j4V+iHAyninVjnKhUBkL
	 7QYfaYBIFNYvg==
Date: Mon, 25 May 2026 00:06:02 -0700
From: Drew Fustini <fustini@kernel.org>
To: Tomasz Jeznach <tomasz.jeznach@linux.dev>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: iommu@lists.linux.dev, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Joel Stanley <joel@jms.id.au>, Joerg Roedel <joerg.roedel@amd.com>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4] dt-bindings: iommu: riscv: Add bindings for
 Tenstorrent RISC-V IOMMU
Message-ID: <ahP02vU6WTN_etDb@gen8>
References: <20260521170652.1880662-2-fustini@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260521170652.1880662-2-fustini@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_000605_069097_10689A14 
X-CRM114-Status: GOOD (  11.31  )
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

On Thu, May 21, 2026 at 10:06:33AM -0700, Drew Fustini wrote:
> From: Nicholas Piggin <npiggin@gmail.com>
> 
> Extend the binding to cover details specific to the Tenstorrent RISC-V
> IOMMU. In particular, a second register range is added which contains
> M-privileged registers, e.g., PMAs and PMPs.
> 
> The RISC-V spec S-privileged registers remain in the first register
> range and are compatible with "riscv,iommu" so the Linux driver does not
> notice any difference, but the binding will be used by OpenSBI and
> potentially other M-mode software.
> 
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> Acked-by: Joerg Roedel <joerg.roedel@amd.com>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> [fustini: fix dt_binding_check errors]
> Signed-off-by: Drew Fustini <fustini@kernel.org>

This has been applied to tenstorrent-dt-for-next.

https://git.kernel.org/pub/scm/linux/kernel/git/tenstorrent/linux.git/commit/?id=33583baeb1ba7d328e6a9775d889036900b74cdb

Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
