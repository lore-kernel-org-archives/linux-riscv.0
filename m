Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B20DC982D7
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Sep 2026 09:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pLGrE4s0Ryo+NxdrJibiJ5UB3BYry6H+bpdVqRzvnKE=; b=Pg3yXOFEWd0Z7s
	i8FPl2IZczHiwCwxEEHpjrISV+cVe++kb7pPQf0EoGnzoVUvVkGKspBWwCfhc6seGVdBFwKfLJpT1
	ROsvly6EOlCuY55X5Y6UANqGmPSKhUUGPsbP6BQjuYVhcwv1XlJZzFUoAHM5CPx8oF3Os8FmxDGNo
	OfeHdZNpTHQAftHiEGSUFaHCxO8mi5ex9HesTFHErSWof7e4Tjd7syYB03g7U6m94AgfjMCleKz7O
	pek3lMVULyipPeyVoTgJE163WQKav/610gfbtoqCDfiaXi7v2p1fGvjklvyw7xIr4BibQeB0a3Cwp
	yaes3YymJ2LU6xG4MWuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Ub9-0000000DtT8-3NHu;
	Fri, 18 Sep 2026 09:09:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Ub8-0000000DtSz-3NKA
	for linux-riscv@lists.infradead.org;
	Fri, 18 Sep 2026 09:09:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 42EA54012A;
	Fri, 18 Sep 2026 09:09:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 350F41F000FF;
	Fri, 18 Sep 2026 09:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789722574;
	bh=Y7Zaebw1o68QOaII7IAX+WBWMhMnWDpU9cGJblPhhhg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F0Rf/517Tzdkfa92kvtg3/aNokoH0pyK9SJLrrLOoWzCrg2nbArA071Jb9Y8c1SeK
	 Kc4mKrkHjumtZcHDqkWTVvR+ObgvgxHvzjWTy3NulJ5/k5K1KVwXS5C3erCbO7/+8b
	 qP0+fFaIhIJshDdq+0sLxia5S/QD8GfqlbMLhbOg1znf8l7K+HWjzI8xRSM839AkIB
	 f7WQtiB4n8QYW5oq01jKw/c+hcbQC2/kTW/0z6btbjiV+otGN2QE66Ncr+M+qzxhVR
	 QrDL6A7XWnYs7noqPcY1M1PWWmykbRxPJmTCJoYr0qWGPjQcbFSartu9GAwWi35Bkd
	 WAvxaQqWe0eZA==
Date: Fri, 18 Sep 2026 11:09:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yixun Lan <dlan@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, 
	Avri Altman <avri.altman@sandisk.com>, Bart Van Assche <bvanassche@acm.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, "Martin K. Petersen" <mkp@kernel.org>, 
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, Aurelien Jarno <aurelien@aurel32.net>, 
	Jennifer Berringer <jberring@redhat.com>, linux-scsi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/3] scsi: ufs: spacemit: dt-bindings: Add UFS
 controller for K3 SoC
Message-ID: <20260918-clever-daring-cricket-e82e8b@quoll>
References: <20260916-08-k3-ufs-support-v5-0-1f5d71f1027d@kernel.org>
 <20260916-08-k3-ufs-support-v5-1-1f5d71f1027d@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260916-08-k3-ufs-support-v5-1-1f5d71f1027d@kernel.org>
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

On Wed, Sep 16, 2026 at 02:59:53AM +0000, Yixun Lan wrote:
> Document the compatible for UFS (Universal Flash Storage) Host Controller
> which found in SpacemiT K3 SoC chip. Its features are listed below:
> 
> - Compliant with MIPI UniPro v1.61 specification.
> - Compliant with M-PHY v3.0 specification.
> - Compliant with UFS HCI v2.1 specification.
> - Supports up to 2 Tx and 2 Rx lanes, up to HS-GEAR3 5.8 Gbps per lane.
> - Supports standard low-power hibernate to reduce power consumption.
> 
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
>  .../devicetree/bindings/ufs/spacemit,k3-ufshc.yaml | 56 ++++++++++++++++++++++
>  1 file changed, 56 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
