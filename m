Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB8EC77B73
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Apr 2023 06:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=99af4NmE53FUuYpgVDf56RTf+0AFdaUJtIazvA37CNs=; b=NxUp+UBqDjXS2z
	+Rx1sVHuKBTUfmWjiYm+ZtV1rLQRS6l8U8/a2jS4i51tKzPEwjM1uS7DzudfmBG1acb07uRf84cvQ
	MLq3cd4YL3H9VhyuKiCWzIht22b0C0g4njUinMB2AvRG32GkzR4sHc5tUVYxacidWxIVQ3Ue8CICi
	90sY46H6UzYnPfgtHs18CXy6LJQ8RhEnxZgpNapPuLOlOMXT1sDHZkTeEIktC3sHh77X+5oin0+yD
	lqJWFCi4bv08gGpQ7al1Ga4zdXzZueVeobI1Xn2Nl0HmkB/expOGJBmszAlhIvR2rUrTWDCs0ZgJQ
	AIip2/tF5mKJ7jy4LAzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppNTh-0079mR-1m;
	Thu, 20 Apr 2023 06:09:09 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1ppNTd-0079ll-1v;
	Thu, 20 Apr 2023 06:09:05 +0000
Date: Wed, 19 Apr 2023 23:09:05 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Christoph Hellwig <hch@infradead.org>, Conor Dooley <conor@kernel.org>,
	prabhakar.csengg@gmail.com, Arnd Bergmann <arnd@arndb.de>,
	Conor Dooley <conor.dooley@microchip.com>, geert+renesas@glider.be,
	heiko@sntech.de, guoren@kernel.org, ajones@ventanamicro.com,
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
	samuel@sholland.org, linux-riscv@lists.infradead.org,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com
Subject: Re: [PATCH v8 0/7] Add non-coherent DMA support for AX45MP
Message-ID: <ZEDXAV7EJn9MH0Hd@infradead.org>
References: <ZDzs3eYIKPFcv0HQ@infradead.org>
 <mhng-e296c86c-71b1-46f8-88c6-16eda3590a3d@palmer-ri-x1c9>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-e296c86c-71b1-46f8-88c6-16eda3590a3d@palmer-ri-x1c9>
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

On Wed, Apr 19, 2023 at 08:59:03AM -0700, Palmer Dabbelt wrote:
> IMO we should just take the support in Linux: trying to hide stuff behind the
> SBI leads to more more headaches than it's worth, we end up with a bunch of
> broken firmware to try and work around.  We've already got a mess here because
> of the D1 support, we might as well just live with it.

I strongly disagree.  Adding more and more per-vendor ops simply does
not scale.  We're getting us into a giant long-time mess that will be
unfixable.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
