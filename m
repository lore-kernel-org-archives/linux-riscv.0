Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC29CD342F
	for <linux-riscv@archiver.kernel.org>; Wed,  6 May 2026 01:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cnbj2WCQo8dkBuPoDM64t3JSi3MeXFdwo5XWCk6NPoA=; b=R9Tv2qhx05Ua3B
	8REvmxMq3g/lEoJRVvezg4Sd0ltBJxeH8eof+cNGADTUOKkxq3Fau14KBZ2i1mTd51Kbl57AyWTqc
	zOjLzs7B1U7XaJFUnSCVKcLD+aG4Gbe9j1HI8JJOWI1uzc8djrxW4sBkPwNR7ZNhFVdd0ymazEq1q
	kbeqXByQdiRc88fQqHSecEwEzna6GIZid6HTLFZZO1QHrLHih9xrSM7OM6fZsPFR7Z4gCFsNk0BKr
	xDUI1iKudnZHNPeKaPTiwgviETVn4TV08AHG/jluLHMCELbFJavB1TWVXv1gkeCoU3r0MkvqefW4N
	UJUTngeZb70Y/ca6jRSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKRG5-00000000R8F-0495;
	Wed, 06 May 2026 01:41:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKRG3-00000000R7g-2eg7
	for linux-riscv@lists.infradead.org;
	Wed, 06 May 2026 01:41:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C4FBB60123;
	Wed,  6 May 2026 01:41:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 409D5C2BCB4;
	Wed,  6 May 2026 01:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778031661;
	bh=hhMyhYQkEibov8dn8mpF2dhq9pE2vOf4P3z3yErV8Bo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SbmIvA0CoRDijT5PixCvhBpVGsf6Pe4U9+n6QJfiJ1GfQfJxpMKA9fg7rOuw/7ee4
	 RhVtgKO4zwQx35Z0rvxTLveNcyBatCa0K7UzyOINYii6rOdpBwHhaS4Zx1w/VkT9Kp
	 cqDiL/eY4RhGnXKBHNAsrtUq80zHpAhA508Khi7b2lhL3iIVs0UxNtv4mVhAcqtvjQ
	 xpEQQ4vEuvcxEXQBpoQp9XF6dTaKCvi7oB2PBkKNDkdfJhoyb7oRBDBKgw6zChytNE
	 btd0bvsL7VmTgd6cSCwpGQ7B7yFJ+/aO4vW+AnBIgpj/EEJ4JuIyP0/iFuEFhjnqEW
	 AGfeQUsMYrnmg==
Date: Tue, 5 May 2026 20:40:59 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jinmei Wei <weijinmei@linux.spacemit.com>,
	Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>,
	spacemit@lists.linux.dev, Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
	Yixun Lan <dlan@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 4/7] ASoC: dt-bindings: add SpacemiT K3 SoC compatible
Message-ID: <177803165885.276520.14965394611244579892.robh@kernel.org>
References: <20260429-k3-i2s-v1-0-2fe99db11ecb@linux.spacemit.com>
 <20260429-k3-i2s-v1-4-2fe99db11ecb@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260429-k3-i2s-v1-4-2fe99db11ecb@linux.spacemit.com>
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


On Wed, 29 Apr 2026 09:38:49 +0800, Troy Mitchell wrote:
> Add the spacemit,k3-i2s compatible string for the K3 SoC I2S
> controller. The K3 I2S IP is the same as K1 but requires additional
> clocks: sysclk_div, common_sysclk, and common_bclk. These common
> clocks are shared across multiple I2S controllers on K3.
> 
> Also add the spacemit,fixed-sample-rate property which constrains
> the sample rate when multiple I2S controllers share a common bclk.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  .../devicetree/bindings/sound/spacemit,k1-i2s.yaml | 31 ++++++++++++++++++++--
>  1 file changed, 29 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
