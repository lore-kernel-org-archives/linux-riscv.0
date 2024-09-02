Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08AA5CD13CF
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Sep 2024 09:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kCgmSXkuCqRlROGEmwPsDoDc6h92m5oBtWDy8lXL074=; b=J1/HkpLPIPHxnR
	WERR2QyrimM5NFxkHeox4sRNnz68rAAnkcsZIkkdbKbRRyImTNRDNB0ZZc1MgPjsfzsv8AXWDC8+x
	kSf0p4rUiaDcXwshrRd/7NB4FY00qbg9i/cIEdQZEeoul7Xj9ej2fff1nLrlrbwb2A7ifwRmK/LAA
	Bs2AUvenw/eBfdP6Vm97VfaiFXUSgcVR5EfWfM4RjC1ilHFBaqyj0uk1sFS36SiDB9Kc111Od8z5F
	r8597I7QIN18F9s23sCzbIQSNbCU2oHv1va91x9lGYQfg5gp3xvmDbx+iy4h0W2F/Gg2m8BvvtVZn
	BuToIL7AUH08h1t/yvYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl3oI-0000000DnZR-2OQh;
	Mon, 02 Sep 2024 09:57:22 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl3oF-0000000DnY9-1zvx
	for linux-riscv@lists.infradead.org;
	Mon, 02 Sep 2024 09:57:20 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1sl3o6-0004xr-F8; Mon, 02 Sep 2024 11:57:10 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1sl3o5-004s9i-JQ; Mon, 02 Sep 2024 11:57:09 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1sl3o5-000g7r-1g;
	Mon, 02 Sep 2024 11:57:09 +0200
Message-ID: <f4df713c2a5945395bbc73d6da412d7df4a0fc50.camel@pengutronix.de>
Subject: Re: [PATCH 3/5] reset: simplify locking with guard()
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Antoine Tenart
 <atenart@kernel.org>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>,  Damien Le Moal <dlemoal@kernel.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Vladimir Zapolskiy <vz@mleia.com>
Cc: linux-kernel@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Date: Mon, 02 Sep 2024 11:57:09 +0200
In-Reply-To: <20240825-reset-cleanup-scoped-v1-3-03f6d834f8c0@linaro.org>
References: <20240825-reset-cleanup-scoped-v1-0-03f6d834f8c0@linaro.org>
	 <20240825-reset-cleanup-scoped-v1-3-03f6d834f8c0@linaro.org>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240902_025719_530191_FA7E47A2 
X-CRM114-Status: UNSURE (   4.70  )
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

On So, 2024-08-25 at 16:14 +0200, Krzysztof Kozlowski wrote:
> Simplify error handling (less gotos) over locks with guard().
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
