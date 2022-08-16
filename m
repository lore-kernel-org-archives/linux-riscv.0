Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE27FC2BB41
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Aug 2022 09:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D8QE12PPNYa5FWTPrORICJgvIJeLHFMNmO7ktI5BTto=; b=P+EZ3b/g356W3j
	OGIz1c9p9kJuWh6z1CQUsCw6ZF8DQvrfhTJDLT3r+Aqht3ogt4C0lV5sBAvKBYMPkBGI0zZqCuh97
	dejqEyJOIsSv3mEOJ4wVqQeb87cZyDzUh5oM6WBtu73gszkoEvYwbF716a3CcKFslbf6SgpzxMWrp
	CF49gFdQnz3P18a63qY2rkKnO3Eiddxx2Kz0nQxz+9Qoec6PV+Rj2RqcH5pTD9Ht0FHAz+cJ+cUX+
	EqotTfxirpq9UKJ9m3Mv/UwNJ9iZorgDxsqo+V2JBAKRxmz8fe6d6PvDF2Z2JLdaiQ+YeRrMxwJVf
	xcAVTC0LzP2SLAHzzQUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNsdL-00HXn5-EZ; Tue, 16 Aug 2022 09:13:11 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNsdE-00HXgp-Lu
	for linux-riscv@lists.infradead.org; Tue, 16 Aug 2022 09:13:05 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oNsd9-0002pT-7P; Tue, 16 Aug 2022 11:12:59 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Samuel Holland <samuel@sholland.org>, Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 04/12] dt-bindings: riscv: Add Allwinner D1 board compatibles
Date: Tue, 16 Aug 2022 11:12:58 +0200
Message-ID: <2865102.2VHbPRQshP@diego>
In-Reply-To: <20220815050815.22340-5-samuel@sholland.org>
References: <20220815050815.22340-1-samuel@sholland.org> <20220815050815.22340-5-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_021304_801382_B288F1EC 
X-CRM114-Status: UNSURE (   8.03  )
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

Am Montag, 15. August 2022, 07:08:07 CEST schrieb Samuel Holland:
> Several SoMs and boards are available that feature the Allwinner D1 SoC.
> Document their compatible strings.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Tested-by: Heiko Stuebner <heiko@sntech.de>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
