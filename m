Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE2ED3CC84
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jan 2026 23:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q8tF2MclMbeiB4I62K5bljWHi1x9F5iQApi8cb3k7W0=; b=TXWl2ymXsQDzmX
	gKli3/8VmvpDcJmYXHhbBfMkJjCVVMPBV1+apWfCPaJ2zewT4OwyZFcmPeTU7cRaZFkq0C24A55YF
	QMezgbJV3+MZIbR2xRO8cn4dFi+At6n1zd4NyL4Yc8aDth6T+Ek+MSY3RMYzpPAERhhNKMlPLcB7n
	x9mruP7YSOXFZfAfKz2OYwgSNZD8p083QbFSg08DpzAiVCu+GllyYUwwN58GsvKs6lBPbz/I/YMqv
	xlW9ns1tj02fmWkEtsDujoRf/IuKZQTKMyBQAyA8qlrd6gFE0tbZkMF8nU1LQ0yfbYnSzFH9ZnoAI
	8QiveS3k41h+6TYNUL5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg9vA-0000000B1Gc-2AoG;
	Wed, 14 Jan 2026 23:05:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg9v9-0000000B1G2-3wMF
	for linux-riscv@lists.infradead.org;
	Wed, 14 Jan 2026 23:04:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0E97060127;
	Wed, 14 Jan 2026 23:04:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25451C4CEF7;
	Wed, 14 Jan 2026 23:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768431898;
	bh=5Kn6ZXpXDdtEnOpfSUDcw9fvtuyMFn4uC94zbV1j7ZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ItelGoIDscLo+hcxoNqsKmcbn8bg70Fh4uZqb3Dd3Ivwy+N4Uz7Te9uug1K0ffi/A
	 lFWJOjvx/Kx8FETWVXw9vLdfUO0OS38ofKRaVbaMV6QSBy6hmODEcEosI3/WYagDuo
	 XyV6e15Ng7eXub6Pr42U75YwN/rI/Cs29tUX8RgFlfMKOH3N/pmBVJzuamfqIiqh6H
	 NuzAhN5u42Kq/pjdVuj3UINQ2hJpe4cEmZvcEAZfs9DXZbJ6qZn30NCrTv2p8hIA8d
	 INzXNNRPLOgxyQ5UMeGaourFoqzPr64Iso5d2X9rbPZBe7o7dJO5Hu1CdHzxqm8P8m
	 MxNNOLI0SvZsg==
Date: Thu, 15 Jan 2026 00:04:53 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@gentoo.org>, Alex Elder <elder@riscstar.com>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Subject: Re: [PATCH v5 3/3] i2c: spacemit: drop warning when clock-frequency
 property is absent
Message-ID: <aWggz23QaXtQbK7g@zenone.zhora.eu>
References: <20251226-k1-i2c-ilcr-v5-0-b5807b7dd0e6@linux.spacemit.com>
 <20251226-k1-i2c-ilcr-v5-3-b5807b7dd0e6@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251226-k1-i2c-ilcr-v5-3-b5807b7dd0e6@linux.spacemit.com>
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

On Fri, Dec 26, 2025 at 04:32:01PM +0800, Troy Mitchell wrote:
> The clock-frequency property is optional according to the DT binding.
> Do not emit a warning when the property is missing and fall back to the
> default frequency instead.
> 
> Fixes: 5ea558473fa31 ("i2c: spacemit: add support for SpacemiT K1 SoC")

besides Alex' suggestion, please, remove Fixes here. This is not
worth being treated as a fix. What you are doing here is just
remove a warning.

Thanks,
Andi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
