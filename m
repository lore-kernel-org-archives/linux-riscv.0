Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 088D4C61DD3
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Sep 2026 10:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zBvlgzNdL3Mbkqu1DMyxhiXkCXCbjGUClkbL2wy1wV8=; b=aQGYCr6CrnwBlH
	7bciJfeRxRmHzg9efWxXq9VBnDLizWnIOJsaYdQstfl4uWynxlGG/y3cIJexQ52PZ8TMHviTZL5B+
	1qdGUB8V+6FzV2G9bLZeHtUzRRiam07Y/WWRPtj4Rrwsjcha4RoZsB2w4DRm6A9lMtFip3zOjYQ2o
	1qbvW/alT1niijzPNWybLKaKC8HpF59JQa+TOWCUWF0s5bLVeeH6y4sYMjx2w4VlmX9rxQYjZFC1o
	OEboveb7p1SoBRfZGKiVzWwCUWu/9ZVyetq42jud32rqGqadRshuQXKePp6+ntZycXrl7pnfIE8ky
	DOv5APqtqfFuONLrP/jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x24gw-0000000H5oH-2DYW;
	Thu, 03 Sep 2026 10:29:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x24gv-0000000H5nf-0UNh
	for linux-riscv@lists.infradead.org;
	Thu, 03 Sep 2026 10:29:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 98E20406B9;
	Thu,  3 Sep 2026 10:29:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3BE31F00A3D;
	Thu,  3 Sep 2026 10:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788431348;
	bh=Xl6S+lrfej0E5kqwaHD3xh0FXNTExpQMqDVcQS859OU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a64GfkJlH7aSPaW1PZ5YurY5GcRkZ75SkIo0aEr+LmN2Gb0G1XQFNUPIYFBjBFNDu
	 +Ioh3VkWf6xEUr2oEMEk5yVcXOYGHa9Xy5lHHs1I5JpzOthfyFcjeEjvAVEK1bBGaA
	 B0UyR5A6tIkM8oKdS2ROuugbsXFmYF76UPTEgCOL+/xrRgk+iOiWPdOiJT1MDMFGiB
	 zmzSKKWNuA38FgtOrQw8Lzo3GIwXEkbobWIubk69vChTlIwedkcprZNm0zgpfNIaYC
	 Oalb3M0AEQKG88a8JzW4NEHCj107BfwSqhZ3pz2th71p90vZEo8R6wA7eB719wZV0L
	 y0gXsGpewocjA==
Date: Thu, 3 Sep 2026 10:29:05 +0000
From: Yixun Lan <dlan@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Long Wan <long.wan@linux.spacemit.com>, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] mmc: sdhci-of-k1: Set clock-frequency of io clock
Message-ID: <20260903102905-GKB1974@kernel.org>
References: <20260902-07-k3-sdhci-dts-v1-0-4e7909cf4233@kernel.org>
 <20260902-07-k3-sdhci-dts-v1-3-4e7909cf4233@kernel.org>
 <DL5D2ETDDPX1.3QTJ53KUA3JED@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DL5D2ETDDPX1.3QTJ53KUA3JED@linux.spacemit.com>
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

Hi Troy,

On 11:29 Thu 03 Sep     , Troy Mitchell wrote:
> On Wed Sep 2, 2026 at 3:03 PM +08, Yixun Lan wrote:
> > From: Long Wan <long.wan@linux.spacemit.com>
> >
> > Add a clock-frequency property to set the rate of io clock, for SDIO
> > case, a clock frequency need to propagate down early.
> >
> > Signed-off-by: Long Wan <long.wan@linux.spacemit.com>
> > Signed-off-by: Yixun Lan <dlan@kernel.org>
> Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> 
Thanks for looking, this patch is obsolete, I will drop in next version

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
