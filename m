Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A4DC00140
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Aug 2022 17:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CwLZ6JAgF3BOhod/SgL2ydxm8qoW/YiEkyUts/45xFc=; b=hJ0U0fAC8APP38
	JJCuB2E1b7eNjNNEyW79128gcqJ7l+21WmVMHDZip9rQGBBAOXoWS4g5mbGhkHQTdZX6OSBxvctEn
	xR1txbuSvloGM0RGAJNDnyslZkSXG/MrD/uzigoD3hWrzERXsXRNbiMAj5t0sVd3su0+KkGv+i7jL
	0mncwPdZjC0M86WSp1Sggh/yRIctN5hs5O6VWNtD9NIPHZ/MmWb/64rrDHjTFMLxswZsKsXFNxECg
	W2cithqUgRxEw0z5pfJUhys+n80eDBCa5q4ra65F/fz4ZXAGIw2RNhLSCXwvyRLxg8Hz4VkPeKgPX
	uo2iA4V42TyW1CKwFi5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNeFr-002b8D-EY; Mon, 15 Aug 2022 17:51:59 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNdYk-0023M2-22
	for linux-riscv@lists.infradead.org; Mon, 15 Aug 2022 17:07:28 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oNdYe-0005Ac-C9; Mon, 15 Aug 2022 19:07:20 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Samuel Holland <samuel@sholland.org>, Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 02/12] dt-bindings: riscv: Add T-HEAD C906 and C910 compatibles
Date: Mon, 15 Aug 2022 19:07:19 +0200
Message-ID: <1928358.CrzyxZ31qj@diego>
In-Reply-To: <20220815050815.22340-3-samuel@sholland.org>
References: <20220815050815.22340-1-samuel@sholland.org> <20220815050815.22340-3-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_100726_407406_BFB219AC 
X-CRM114-Status: UNSURE (   8.61  )
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

Am Montag, 15. August 2022, 07:08:05 CEST schrieb Samuel Holland:
> The C906 and C910 are RISC-V CPU cores from T-HEAD Semiconductor.
> Notably, the C906 core is used in the Allwinner D1 SoC.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
