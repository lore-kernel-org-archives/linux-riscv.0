Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9D41CD5BB1
	for <linux-riscv@archiver.kernel.org>; Thu, 21 May 2026 13:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PBswE2pjf58LE5Kjm5SalHVH3BYHkzqfgZieki04g34=; b=CuWls8ixKZOqQ6
	QoDX7piiRAKau1QEqQNU3HwEzlEbektDdBheY4BM1SJR4cT1Y8mFZCFFrCzgW8URvu2OoTEY1Yjxv
	ZoqngXDeGXJhfDox1dHMAt5zbjSHqxmCp4R2OYya3aSkW3dwQLJ86pkZCvmJ0efGUX1paZQBrMpfs
	11zPU/1vA8TiBnRPXZ+G0Cmb5SV5UqvZemj2SKIyXoYWYYFpyWvfAcEbvMOMAYgm9HwkfvPJZDTc2
	X33ry7swo8/0kirN06QJ+YfkLPe0vmUn0u9d/u8CcRTb6f9Ogl0kAv/H+NkL6ZGgBwH43xTIIGBNF
	hf8LyJf5GpODUyi4kjtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ3D4-00000007pav-28A4;
	Thu, 21 May 2026 13:13:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ3D3-00000007paS-3kwB
	for linux-riscv@lists.infradead.org;
	Thu, 21 May 2026 13:13:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 33296601F4;
	Thu, 21 May 2026 13:13:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FD4C1F000E9;
	Thu, 21 May 2026 13:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779369188;
	bh=igWpYRd7nceDsGMf2M6kAUT9G6B5P9tILKlWPpy71w0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Bp31nYHS+InA9kOjCwJNq2G2DxBetezP2RDP123toJzCTE6xUkye/TnRndYkVidmC
	 WeJRnS8KjJLsb7bUWu5mq095zAELK/KSmzLEyfhLF0HKb5UBN9FLjxQtCG6MFbdhrj
	 QXn8W5FEU60Jd2t/6jiOtf35im5SEXXPaOudwZyXoSF3y1vnJyNejVFo4p0nE780nU
	 KtHd1dOFxc5pW/RjRwPWh62h+ce3kWHcnNjp5E/8Ck520yvCoeJ8Jfoz1Ee7Okx6R6
	 jUNCvRgYvZVHExeDqyMsQ0ZSNAJ4iW3JVqc+SibgTYmnS/2PFhyW9mRjVTjX/fMb2k
	 RCrCJ0Xlg95hA==
Date: Thu, 21 May 2026 13:13:05 +0000
From: Yixun Lan <dlan@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Rob Herring <robh@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v2 1/1] riscv: dts: spacemit: enable USB3 on OrangePi R2S
Message-ID: <20260521131305-GKA3727373@kernel.org>
References: <20260518100030.2354606-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260518100030.2354606-1-amadeus@jmu.edu.cn>
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

Hi Chukun,

On 18:00 Mon 18 May     , Chukun Pan wrote:
> Enable the DWC3 USB3.0 controller and its associated PHY on the
> OrangePi R2S. The USB regulator provides VBUS for USB2 and USB3
> ports, but the USB2 ports are handled by a separate controller.
> 
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
Applied, thanks!

[1/1] riscv: dts: spacemit: enable USB3 on OrangePi R2S
      https://github.com/spacemit-com/linux/commit/c5ad6737df88bd3c3e83145edb25737cb19f9a1f

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
