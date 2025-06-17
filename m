Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04CC5C71136
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Jun 2025 17:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zlplHGqkptMoxx18oM2D/rP9OOYKXM0QeazeLtIVYv8=; b=q/XyMlAkthxRfi
	Rp8KDUp+H2VSViYXYiTsGa7e9fr3qzFzLmiPW4C3lJfKaJFrEhqD579ofl04PibYeH810LBGkvWes
	B5/QQ757nZZTrzCV7FevbbjXAbFoT63uV9y9LKLxGriQVsGFVz77Rh2PSKCi8GaiRKNJC2VozTUGC
	cXR+dY5gj68PqF8ojxj7PL0fQqEad/t7b3hufyXZTnV7IDje/wLQg0epWb5S79lk1sBzP6QVzgeH3
	MMn4nFkRis1kQT9kOrEo4HmmKqOtcTU54fpYYGMSmHQJJz5093GqQUHjMPKAlXpHXMqCGGs+zQ7zU
	L7TmDhXvnde8qXBEO8mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRZqN-00000007yl6-1VyJ;
	Tue, 17 Jun 2025 17:11:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRY1E-00000007iOI-1ITn
	for linux-riscv@lists.infradead.org;
	Tue, 17 Jun 2025 15:14:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 075674A3C5;
	Tue, 17 Jun 2025 15:14:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F14DCC4CEE7;
	Tue, 17 Jun 2025 15:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750173275;
	bh=BoHYyynRbOdi/J7e6GV88AV7YC8tPjdtVyMkr1OvIms=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fognmAZRhR8bgC8SdDmtiYNfalUFiVtKYJ8vNzE+N+0rAsrM2BQbj3XvL5zhOkxVt
	 OLpv+RwHfj3xLJw6c6ZC46iQluFhjTzOZK1At5ZCLudvGGtigH9L+ZxYAZSGFLySjp
	 WpJiA15SkQKquRVk1MTw/zVgjotvcMwOD0Pk+hFYqUeYEAVHVT5XWRFDDtGGUrVu5h
	 acNIR5NJl88mWXoFpYDTp5tg5EFEi6WvFqIA1J+7uVOJm0fuRU7YR566hhft8HTG/q
	 uBjAAQta+WfBO28I90Qgc2wO1V0JiTn3lrXsV1BFjaNBPSJCPC4Xk+dt6oJnqYGmFL
	 vKqWvtFeAA3oA==
Date: Tue, 17 Jun 2025 10:14:30 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Ze Huang <huangze@whut.edu.cn>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Yixun Lan <dlan@gentoo.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Chen Wang <unicorn_wang@outlook.com>, sophgo@lists.linux.dev,
	Alexandre Ghiti <alex@ghiti.fr>, Longbin Li <looong.bin@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: reset: sophgo: Add CV1800B support
Message-ID: <175017325268.2418026.3599473248491336605.robh@kernel.org>
References: <20250617070144.1149926-1-inochiama@gmail.com>
 <20250617070144.1149926-2-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250617070144.1149926-2-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_081436_367300_8BAF20EB 
X-CRM114-Status: GOOD (  11.45  )
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


On Tue, 17 Jun 2025 15:01:39 +0800, Inochi Amaoto wrote:
> Add bindings for the reset generator on the SOPHGO CV1800B
> RISC-V SoC.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  .../devicetree/bindings/reset/sophgo,sg2042-reset.yaml        | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

Missing tags:

Acked-by: Rob Herring (Arm) <robh@kernel.org>




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
