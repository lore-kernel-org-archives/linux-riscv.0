Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0577C021BE
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Feb 2025 13:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q1yWbAYPcrmCC+V2mgbuFq+BgVQ8z9V5Hh1+7zaAojI=; b=nDD6H6Sn9iiG1w
	CXsLC9ogxDnAu7DNElih1ET3WLotuVrvX6dFJ/GhdDRfWZlrBWEv4AbUWpNqj4aAQhlau35EWu1fZ
	EDgPEcS/A6fZbi3w7phqwLN5VahtFqgsQoJtab/xmnZqFTWlrjrHBbQChalMrGIeg1E3BSFXMTTai
	2kHDCGlry2dyiyKVzakgyrkdgdBfcNgJGer65MPlxAs/S6I1WhapFn4MsRq8/U+NTDi+19YRs5iv+
	GEqOQ+yRf6NwtMHfpv0TW926KrgZQFCGMq8XrvkTzlqXYyUroD9SvXZIoC167WWhIOhnhIOhG1MuN
	7EFr5izzZC+xs9/KT5MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tne3u-00000007YV2-34U8;
	Thu, 27 Feb 2025 13:36:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tne2i-00000007YJX-2JPa
	for linux-riscv@lists.infradead.org;
	Thu, 27 Feb 2025 13:35:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F35FA5C05BB;
	Thu, 27 Feb 2025 13:34:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42518C4CEDD;
	Thu, 27 Feb 2025 13:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740663311;
	bh=Rr/ZAs6GmOH5Zx/oWHv7ST2gf2X9v75nhFcxZDN+WmA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ksKRITalBMRrx8PI2TYjkm6vqOT15c6BEkYcq9R7/5hpch/3Nw6p4/kOieKMPaw4J
	 7GgLzIYzIMOBgD6A/WdxtiUD0jaj+36l+qoiwF7o9rCr7lxIn3NzgJKZJ9j0D1iHPd
	 HTuST4IABwd0KVMebmBehOzqITu+4rkxfhtZfXTAMs+hD48dp9n85DgtJgIhJlA921
	 zM5Ta2d5Rd16mLjG5ab3OBw7XqdyINkexNUjcIGdgxTpU+1iULIfNJeNBneD52cXh2
	 ZSbo62gxrAsG0IrH64z3y41cNX7KDfO22hj4zMDV0REErtAlWEPDCwRNTIJqyVwW7U
	 gUmGMdpg4PVLw==
Date: Thu, 27 Feb 2025 07:35:09 -0600
From: Rob Herring <robh@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Guo Ren <guoren@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: reset: add generic bit reset
 controller
Message-ID: <20250227133509.GA2021892-robh@kernel.org>
References: <20250226234234.125305-1-inochiama@gmail.com>
 <20250226234234.125305-2-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250226234234.125305-2-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_053512_674038_39895803 
X-CRM114-Status: GOOD (  10.39  )
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

On Thu, Feb 27, 2025 at 07:42:29AM +0800, Inochi Amaoto wrote:
> Some SoCs from Aspeed, Allwinner, Sophgo and Synopsys have
> a simple reset controller by toggling bit. It is a hard time
> for each device to add its own compatible to the driver.

It's a 1 line change. That isn't hard.

> Since these devices share a common design, it is possible to
> add a common device to reduce these unnecessary change for
> the driver.
> 
> Add common binding for these kind generic reset controller.
> Check the binding description for its requirement and
> suitable scenarios.

We generally don't want 1 register per node type bindings. That level of 
detail in DT has proven impossible to get right.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
