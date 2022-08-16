Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 702AEC2BB41
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Aug 2022 09:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IaYy24Z2o4gSeQbu1CHAGygimscUiIjFdQRwjfkUzBU=; b=p7FyFndgLwJwLQ
	JyEc8z2QCRG6Os+xXeACX6j4KBvSNzPdBK49dS2aLqiJrcJMY7yJvmsjx5QjhXUNsAugmdcos2j6f
	GyC0crJxJjgkgdMEKDDdP76+kYdonDdydb77667N1ah1Zv7OI8W5Rwwj5k93HHsytQfkXtyY76XD0
	jr8ZS0P3GeioreUmMJklxqFPG1xVaKWijvtvFVUA/K87FqZrxyrErv7p9Ecw1Htg+Nbiq+UJcO4C+
	FDq7Rm+6iYyKinomYTQWYXApyUYXFzgKMc3pJGzbRXs8iPBbZpTYxb/AgNnPux1UNRGGXMfLLOQxn
	sc1hE0j7ArHG/ripOa0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNsbx-00HWMn-J0; Tue, 16 Aug 2022 09:11:45 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNsbr-00HWH1-TY
	for linux-riscv@lists.infradead.org; Tue, 16 Aug 2022 09:11:43 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oNsbl-0002oW-HD; Tue, 16 Aug 2022 11:11:33 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Samuel Holland <samuel@sholland.org>, Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 06/12] riscv: dts: allwinner: Add the D1 SoC base devicetree
Date: Tue, 16 Aug 2022 11:11:32 +0200
Message-ID: <1861548.g5d078U9FE@diego>
In-Reply-To: <20220815050815.22340-7-samuel@sholland.org>
References: <20220815050815.22340-1-samuel@sholland.org> <20220815050815.22340-7-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_021142_356938_032E6014 
X-CRM114-Status: GOOD (  10.50  )
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

Am Montag, 15. August 2022, 07:08:09 CEST schrieb Samuel Holland:
> D1 is a SoC containing a single-core T-HEAD Xuantie C906 CPU, as well as
> one HiFi 4 DSP. The SoC is based on a design that additionally contained
> a pair of Cortex A7's. For that reason, some peripherals are duplicated.
> 
> This devicetree includes all of the peripherals that already have a
> documented binding.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Tested-by: Heiko Stuebner <heiko@sntech.de>




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
