Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E834D6CFAE
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jan 2026 01:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BWB7Bxz/EdEnpbS9ev/+N06Y4H7QhXqGJnFcWJN2p4s=; b=JqJmFHc9P1sAUK
	kQnpO/umfHYzSrd52J7P+hcwFxx29/GsIBcA+dFyJDWVKWOAR0aG7HrVKS/pQ0hR3gQN4RduZCGSj
	qoNam+6RxzSWOg80djX57VzJ1EUCDDWrNODCIpygogEC8n6vSWKAo3sX2TyPB1LSrwAl/ez8pdljE
	xAS1bNS/lGIy8nPWYgM/aCjAdVQxDb2sXh/uQQk+6igxlgRMu0aRsilRogZ0jQReQfIA8Rp6NDiVk
	Nmhdei+Bd5fic7kG3qNpd2SUXzDjkQJ9Chdx8tv+fD3eKB2x+lkcb2V1UvGXZccsiQgSR1Wq9K4rm
	K1PZkQjXR30tg3dnJvvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj5uP-00000007xcw-0IHQ;
	Fri, 23 Jan 2026 01:24:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj5uM-00000007xcQ-2OD6
	for linux-riscv@lists.infradead.org;
	Fri, 23 Jan 2026 01:24:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9DACD43438;
	Fri, 23 Jan 2026 01:24:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC3B3C116C6;
	Fri, 23 Jan 2026 01:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769131455;
	bh=/UCYbgTfvHqzeFToJOfvHYkGR2P9KrAkiNHmRMcwnsk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tQFwwSK5R5L4zJP22A9CMJaT1uLiAkkw/ScNxv+0agEIKGejgWBOWyfm/RjgHRrfo
	 j1OWBZWTFTcQv8j/jJhhMPclAkZuHLPRfQZTf2+k2LqE5D6Mjxh47Qs5snlURgbzbE
	 dH8jnsdt3RG0g4yC8eMuS78GrKRGWR4OzboBfLAgZ6RTm8aRjoSz49NoEFDy++e7XZ
	 LDrui+/w4MvmAKHLNHg7MrGZRpkuwJleBBqmYBT0M6tADiEJmrO6AABMNuipcJmah9
	 lYLwY8o2lxk2THQogWbVIl/hqP25PHt0ocPYKT4S8Dn080s0O8exsVS3dqwncCP/mS
	 EyWQTfclzXJyg==
Date: Fri, 23 Jan 2026 09:24:13 +0800
From: Yixun Lan <dlan@kernel.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Haylen Chu <heylenay@4d2.org>, Alex Elder <elder@riscstar.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/4] reset: spacemit: Add support for SpacemiT K3 SoC
Message-ID: <20260123012413-GKA71138@kernel.org>
References: <20260120-k3-reset-v3-0-effe87f4bdbe@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260120-k3-reset-v3-0-effe87f4bdbe@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_172418_636472_C567394F 
X-CRM114-Status: GOOD (  17.46  )
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

Hi Philipp Zabel,

On 19:10 Tue 20 Jan     , Guodong Xu wrote:
> This series adds support for the reset controller found on the SpacemiT
> K3 SoC.
> 
> The clock driver changes, which defined new auxiliary device name
> patterns for reset on K1 and K3, have been applied to the clock tree.
> To facilitate merging, Yixun Lan has created an immutable tag
> (spacemit-clkrst-v6.20-3) within his pull request to the clock
> subsystem [1]. Hence, the dependencies mentioned in v2 have now
> been deblocked, making the reset driver ready to be applied, if it
> gets approval from review.
> 
> In this version (v3), the entire series has been rebased and tested
> on top of the linux-next tag: next-20260119.
> 
> General informaiton about the series:
> 
> The K3 reset controller shares the same architecture as the K1. To
> facilitate support for both and future SoCs, the existing K1 reset
> driver is refactored with the following changes:
> 
> 1. The existing K1 driver is moved to a dedicated 'drivers/reset/spacemit/'
>    directory.
> 2. Common reset operations are extracted into reset-spacemit-common.{c,h}
> 
> The K3 driver is implemented using this common infrastructure.
> 
> Link: https://lore.kernel.org/linux-clk/20260114060410.3340540-1-yixun.lan@gmail.com/ [1]
> 

Just want to ping this with my SpacemiT maintainer position, the reset
driver is the last piece that I hope can be accepted during this merge
window (target the v6.20 release), it would help other drivers since it
is a fundamental dependency..

The clock PR which is a dependency for reset has been pulled by Stephen[2],
and the driver also has been tested for a while locally
https://lore.kernel.org/r/176902257445.4027.5972559722832621691@lazor [2]

Reviewed-by: Yixun Lan <dlan@kernel.org>

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
