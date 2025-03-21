Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13199C28B30
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Mar 2025 00:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BqtcT0r/VmB9ytFeB+XDcbYxujBjhu4z7BI0XhlCJtM=; b=xNs/7wG3f3V6CI
	5EL1LWTaD7qTM7zNanPze9aS3DGVZe0XMLG9jICzEG/m04/IRKtyG4joYrpiI5Dq8zWeJ3+fvcm9W
	CGdAkHZmxiYOI2y3y2HhI0XD/JhO2dYNKlLnZDbSdL5Wjol+2aXZEdnYvgX5JbZzLL+qa/e2Ywjk7
	y8hKbSWN1KpvgJ9v7kSDsPyRV8kvwr95rzcq7qrrssa701XTL2GaX064RdMwnx6bYje+Ozpb3bFMl
	AO+PwdjF+psojuMDXKyN3PbPflznQIQtYrypjAOGerobHHICNU1H0uPpnMz7WahwM58s6Ml8Gp+hI
	w3Z6+zlTMSbX4S0GAe/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvQSN-0000000DZyW-3v7S;
	Fri, 21 Mar 2025 00:41:51 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvQ3W-0000000DX9u-2wxJ
	for linux-riscv@lists.infradead.org;
	Fri, 21 Mar 2025 00:16:11 +0000
Received: from localhost (unknown [116.232.18.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 6ED493431C2;
	Fri, 21 Mar 2025 00:16:09 +0000 (UTC)
Date: Fri, 21 Mar 2025 00:16:05 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Alex Elder <elder@riscstar.com>
Cc: p.zabel@pengutronix.de, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	heylenay@4d2.org, guodong@riscstar.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] clk: spacemit: add K1 reset support
Message-ID: <20250321001605-GYA10514@gentoo>
References: <20250320194449.510569-1-elder@riscstar.com>
 <20250320232128-GYA10498@gentoo>
 <fe26de4f-5593-4f34-a752-5fb051972c31@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fe26de4f-5593-4f34-a752-5fb051972c31@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_171610_762481_FC5E4CB2 
X-CRM114-Status: GOOD (  13.09  )
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

Hi Alex:

On 19:05 Thu 20 Mar     , Alex Elder wrote:
> On 3/20/25 6:21 PM, Yixun Lan wrote:
> > Hi Alex:
> > 
> > Thanks for sending this patch series
> > 
> > Can you also CC spacemit mailing list: spacemit@lists.linux.dev
> > it should be handled automaticlly in next 6.15-rc1 version as the
> > MAINTAINERS file updated
> > https://web.git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/commit/?id=4a0c4e723c94
> 
> Sorry about that.  I will copy it on my next version.
> 
> Are you asking me to RESEND this series with that addition?
> 
A resend would be great, so people subscrited to that list will
receive the emails.. in this case, I will wait to add more comments.

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
