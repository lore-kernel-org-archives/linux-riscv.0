Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41C5BE7718E
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Dec 2024 18:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FlpdedwgF70U7cGC3mAn0LP6AnUizAV4z+SSxB4cB9s=; b=V7CoCcrItAKgl+
	OcJKY6f9M89N0vn47KAL55kcNFXP6gcVEAfAMHSpuKmf0ExKsGBoOnjLDY2vYn+Mpbbp+6GidDNVh
	VPiLBSS4V0TDhUuOtMFXGSdkl0FDcVH4wziQxLZz09ZJxY1C8pV5ZPZOCd2S3HOb31gBzt3ADZS0/
	CpqVCSKDSoFGHOze9D2we6ftdBhSDvUFv3PbXSujQdo0WD0MhoMNI7zBAdqHkaW/fzCBgqleMK1Qj
	IdjmaZBiHjFOzpsit3rgnJNKaN5WDvokZhq+OtTYyaXe7p3UySnw1V8e9ypjBWG49dXz1OKw3+Ott
	CwhodNzyQaPCnmQSQWjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPn6x-0000000AXkM-1HLp;
	Mon, 23 Dec 2024 18:24:59 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPn54-0000000AXQZ-2Nts;
	Mon, 23 Dec 2024 18:23:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8E9D9A40219;
	Mon, 23 Dec 2024 18:21:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52B66C4CED4;
	Mon, 23 Dec 2024 18:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734978181;
	bh=dvic7CQvdaQvsQq9bVY/SP52KhgXeQuTCZCa+4u5Vno=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Wq9mThRr+RpHKMktF0pHzR6SYDmsCgmKrcgnkf8IFOgc/SVMR4M1ilhnyRQoSA1BW
	 v78XhBo9UWIaqW5pnr3UX4zrH5im99okLeoC7dXhimup5ad8YDgIjepvBN3mvv1j+P
	 wLiSOlDv99IXYJnSkFbXGp/GtuwNWp3D6UjfdHhZ1DKVmcWJgLeRC+Q1L8xFISoBsD
	 XYlTAwaLPyzV6wIbQGZJyOUF+09BNRgwOUv2iAsarWpy4XvX7zIzHHx+Tmio/NCMAA
	 aa4bBEJrJe9R0421kkKF+3mcd53NW7iqpBibS++Fhog9LqvAMl1A30xraux7oBEQjc
	 7HFEbAcYsseTA==
Date: Mon, 23 Dec 2024 10:22:59 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen Wang
 <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
 <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next v3 0/3] riscv: sophgo: Add ethernet support for
 SG2044
Message-ID: <20241223102259.06661253@kernel.org>
In-Reply-To: <20241223005843.483805-1-inochiama@gmail.com>
References: <20241223005843.483805-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_102302_680066_786C97E7 
X-CRM114-Status: UNSURE (   9.06  )
X-CRM114-Notice: Please train this message.
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

On Mon, 23 Dec 2024 08:58:36 +0800 Inochi Amaoto wrote:
> The ethernet controller of SG2044 is Synopsys DesignWare IP with
> custom clock. Add glue layer for it.
> 
> Since v2, these patch depends on that following patch that provides
> helper function to compute rgmii clock, As for now, this patch is merged
> in net/for-next
> https://lore.kernel.org/netdev/173380743727.355055.17303486442146316315.git-patchwork-notify@kernel.org/

## Form letter - winter break

Networking development is suspended for winter holidays, until Jan 2nd.
We are currently accepting bug fixes only, see the announcements at:

https://lore.kernel.org/20241211164022.6a075d3a@kernel.org
https://lore.kernel.org/20241220182851.7acb6416@kernel.org

RFC patches sent for review only are welcome at any time.
-- 
pw-bot: defer
pv-bot: closed

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
