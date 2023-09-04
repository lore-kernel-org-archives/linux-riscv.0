Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4744DC71153
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Sep 2023 05:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DqtiVbmkRTjAKpswIvW+reieohbSHI+kv89lTNdNW3M=; b=gtn4gmsoyGSvXu
	Flhvi/c++E3geVchOlDrnfxYF/lRgIdJrjU9jUamxHrCabwEuscPE1fzlxd13mbTR+tlA87rOsG/f
	1Y5UrQtKjdhOtjr/jR7W3M58r/PLo0YbmCGFqQNE4jkFHccsNKm2tP94MpgVN4Sr0Hj4CuWgLhkXs
	T3ioemW758d0slLdNoro1kUC5Bf5GeanKIzA3YufsmcsCCsrB4ip+h9eDG+l8IRcK6Fo+BGWbV2zi
	Mrd6agr2FdkxpVXkzpAoSEIzCajwhCFL7mOrutSKu+KuP0iOnXeXWOWjPMOtluRs8fOimC40Oyiaq
	1hsitSZsLcqbyMiOUcZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qd2Mp-003MhC-21;
	Mon, 04 Sep 2023 05:43:19 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qd2Mn-003Mgz-1s
	for linux-riscv@bombadil.infradead.org;
	Mon, 04 Sep 2023 05:43:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=xdrF6N8HL4EbV22j8WXgXy3Ah6H26H5auVEub33/Rkc=; b=mbcGefQPJvyy3MtsBJlEVmmU7z
	k6Vwbt0pfj59pUGR19y2nSS7PyBPJKcN66UzuSP2o3afH3ca43LitcWpevNNMu7HKr0s1JnJiaIwt
	tKoCTvvvTlX9UqzzGZeYWSO3bblaF3WiCIFEi+1d6PoAEf9CUZl3JogHluZIh9GG9txGH5cSwGZPI
	kW0qOgXxdq5iuknissB9P/wdEqTBBHNoccRktRYmtY3qH8QTHM3aJWOigbFUAJFOo3FmrxyENxRJa
	oSUsruI/K6FkXVKyJ65dmlOlBSm5NDXyh4jQFxTtYSRgeDH/FXcubrb/EkEXCdTj+US6KSpLxIxns
	FIpIPWNQ==;
Received: from bg2.exmail.qq.com ([114.132.75.215])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qd2Me-00Cjqn-2f
	for linux-riscv@lists.infradead.org; Mon, 04 Sep 2023 05:43:16 +0000
X-QQ-mid: bizesmtp69t1693806064t61ncw53
Received: from wangjiexun-virtual-machine.loca ( [120.225.34.249])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 04 Sep 2023 13:41:02 +0800 (CST)
X-QQ-SSF: 01200000000000001000000A0000000
X-QQ-FEAT: rZJGTgY0+YOS3vKl0NMirRR1pAhmed70/gLFuj/Gr660BtUWLKoHQ7PnNRXSp
	X4pSLbZOdfAkBI4khh9tRvTDbOaTQlmcKegcyzoPBsaxHw25F18pQGBZDtYpE5OJ3kdPkqE
	zwijwvHa/JIzv4ytcLinIVlEorFNeSv09106k4IKEpljgzyNnhgo+tah2zJJLYl1k8XWr4+
	eOKAT4b8ezpPcdUycki4Vdq+okzxerMB29oA6vgy7xa29tA7V8mwxuxL8Y5LtlGjkwYIyH6
	UYM2lN8Xy7WdmPIEXzR+HvsbvAOP+0YgUBM8CSyYsM4HgldighDFRgGbHJ6uj0goaRS1z8o
	L2CcmKGSJ7jAzVqa4fUbg/AWACFeCZJeUqWmjDi
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4421248991332191876
From: Jiexun Wang <wangjiexun@tinylab.org>
To: jszhang@kernel.org
Cc: alexandre.torgue@foss.st.com,
	conor+dt@kernel.org,
	davem@davemloft.net,
	devicetree@vger.kernel.org,
	edumazet@google.com,
	joabreu@synopsys.com,
	krzysztof.kozlowski+dt@linaro.org,
	kuba@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	peppe.cavallaro@st.com,
	robh+dt@kernel.org,
	simon.horman@corigine.com
Subject: Re: [PATCH net-next v2 0/3] add the dwmac driver for T-HEAD TH1520 SoC
Date: Mon,  4 Sep 2023 13:41:00 +0800
Message-Id: <20230904054100.142575-1-wangjiexun@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230827091710.1483-1-jszhang@kernel.org>
References: <20230827091710.1483-1-jszhang@kernel.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230904_064308_707997_24ECE90C 
X-CRM114-Status: GOOD (  11.68  )
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

On Sun, Aug 27, 2023 at 05:17:09PM +0800, Jisheng Zhang wrote:
>Add the dwmac driver support for T-HEAD TH1520 SoC.
>
>Since the clk part isn't mainlined, so SoC dts(i) changes are not
>included in this series. However, it can be tested by using fixed-clock.
>
>Since v1:
>  - rebase on the lastest net-next
>  - collect Reviewed-by tag
>  - address Krzysztof's comment of the dt binding
>  - fix "div is not initialised" issue pointed out by Simon
>
>Jisheng Zhang (3):
>  dt-bindings: net: snps,dwmac: allow dwmac-3.70a to set pbl properties
>  dt-bindings: net: add T-HEAD dwmac support
>  net: stmmac: add glue layer for T-HEAD TH1520 SoC
>
> .../devicetree/bindings/net/snps,dwmac.yaml   |   2 +
> .../devicetree/bindings/net/thead,dwmac.yaml  |  77 +++++
> drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 +
> drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
> .../net/ethernet/stmicro/stmmac/dwmac-thead.c | 302 ++++++++++++++++++
> 5 files changed, 393 insertions(+)
> create mode 100644 Documentation/devicetree/bindings/net/thead,dwmac.yaml

I would like to try this patch on my LicheePi 4A board, 
but I don't know how to modify the dts file.
Could you please share your modifications to the dts file?
Thank you very much.

Best regards,
Jiexun Wang

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
