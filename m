Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B337E95A77
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Dec 2025 12:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7dOc7S8pGi1K7MzIkkJkvo9Ei2OY0swVru+Kz42svDo=; b=te5DZ22pjCWns6
	m70WcFJLYFAdqOnlnlR8w6y8uTVQHdwyVrsD7sBu4ww5bQ0oZZat+PUEsTzGog7F87MS0hHusswlK
	F9TCYV7RdTzL2NBexMqTcQJYexgMQNueq8OKAgAL0dftEC9nLw+bgt/GMwhXYh7Otmqxn4YwW34kC
	M/RhlBt+Ze+rRgpItistDGhdeNSPuZodH0A5Uv/ivD4Vw0WNWAcL9ip9idfFWk342iowLz+LRyb0s
	yq+dU/GJFfSeUXnD01jy2Yieca32+kOQVhiCZ7BgUGjEdMNuUf/NgvwKuexfrbwwLDN15Tp+58IpL
	ZXmUqKtlB22CwsNlIg5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaYjQ-00000004nKC-07hR;
	Tue, 30 Dec 2025 12:21:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaYjO-00000004nK4-30c7
	for linux-riscv@lists.infradead.org;
	Tue, 30 Dec 2025 12:21:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D019160018;
	Tue, 30 Dec 2025 12:21:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CD36C113D0;
	Tue, 30 Dec 2025 12:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767097301;
	bh=QKQ5eoIAn/js5eOEFKHYKJSMufjyeI6KZAIRALCLBgA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eodlMm/Eq7PwChFtTphOGsaKVCSGp2WMv/2Jf6WjbML0qTHtggSiiPllMvgKJCrXQ
	 WbIqU21S3Ts2x31nnAyc6EsQ/+dK9KERTl6/DuLOuSRPfw3AmNT0wW6UsT5bEcZ++Q
	 O8m6bihbIz+8znAnTvO2kMoHmQv7KsQaMmMKLvHfij7SrAr9MmmvspBSg7eL8NyH+d
	 A96/fROTFltCPnOvX20/R0GHFCsF+iNYQiltZkSid2WTBXBGV1W71AmE6u98dcg4xI
	 1IFCpzoVrpa8t8427wrHJr2Nvl5F2Bhn/M3z/D2wuv9Xdgp6Vv869WHE5xgkssDJG7
	 3gNw8bedVf1rQ==
Date: Tue, 30 Dec 2025 13:21:39 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Alex Elder <elder@riscstar.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 1/4] dt-bindings: reset: spacemit: Add K3 reset IDs
Message-ID: <20251230-charming-nonchalant-goat-98bbde@quoll>
References: <20251229-k3-reset-v1-0-eda0747bded3@riscstar.com>
 <20251229-k3-reset-v1-1-eda0747bded3@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251229-k3-reset-v1-1-eda0747bded3@riscstar.com>
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

On Mon, Dec 29, 2025 at 07:04:04PM +0800, Guodong Xu wrote:
> Add reset IDs for SpacemiT K3 SoC.

Why? Where is the actual binding? You have entire commit msg to explain
that, instead of duplicating subject.

I am pretty sure I already asked this for a different patchset from
you...


> 
> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
>  include/dt-bindings/reset/spacemit,k3-resets.h | 171 +++++++++++++++++++++++++
>  1 file changed, 171 insertions(+)

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
