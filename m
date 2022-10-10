Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9021FC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Oct 2022 22:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HNXhBUiUi2hNIiYrLCcXPUdwZ/mcTNsgc3QBkRjg4Us=; b=i0HhnIcJItTxd0
	uUKZndBtAJPx06Lj+leCHcBQcoxJ4S2dzDah4nDXWC2Hs3pfQjY5Yxa0amxNhGMdXbWv8Wr+FzQnS
	vTR4QjvIg/Il8ItoRHTd+goAY9+eqpY9KPunCJmlB7Rt4d3cnDr+x9NwrTtv/CHmatiwWmE9zU5Ob
	x2WmEDJ0NKmarYgxA+NeX5tri9KR5zL9EoywLuu557EEdHj4/eE7De6qbij/1GUiDKlh8euEoa7TM
	H3ziNz1zUto9KNacwMxMeLIJQHr/9Q754h/v8fb3v/ROU3pFO6bVjNDKYZvY8EbHzE6uuop5KUqf5
	vtL35hsdw1t0OOv+YOCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oi15y-002Qq0-0W; Mon, 10 Oct 2022 22:17:58 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oi15v-002QnM-Ac
	for linux-riscv@lists.infradead.org; Mon, 10 Oct 2022 22:17:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 9F702B810EE;
	Mon, 10 Oct 2022 22:17:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79E00C433C1;
	Mon, 10 Oct 2022 22:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665440266;
	bh=/Orn8PJpcl4Esy+ZQtwNhwbiNMH101gvw3w6Yupw1Kw=;
	h=From:To:Cc:Subject:Date:From;
	b=lgCxkCHyKAywSuuXom8A1fSW22VJokpeBzEaUAuuxjgpdn3Tf2Vpb6uTTX8N8WYgy
	 uxbb+VBItQtlhTcBrT67QWzdPCpznfgUNXVLxLKTuycyAAfok+BLIM9wb7O4ldEnTY
	 3ddJrckn/BrqS5rj1K52lcSp45UzYlGZWZExTC7F+aiokx4IDvLtpbUcTn78durdVB
	 dHImP7l3YNLjbxxe6+Q6YAz9XM6SVcxMzes29cmXoZpEDDsxfamFy408cLYCfsLN2d
	 lPFeovwt58JFr3bQqnuW/UhuO2iVXmtjsxNNyI7843ZaRiI5nwYotLJgTtTE+ahzb0
	 fLjJ3Y9DTfTlg==
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org
Subject: [GIT PULL 0/2] microchip maintainers updates
Date: Mon, 10 Oct 2022 23:17:03 +0100
Message-Id: <20221010221704.2161221-1-conor@kernel.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221010_151755_538193_DDD24772 
X-CRM114-Status: UNSURE (   9.07  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Hey Palmer,

Two maintainers changes that I posted on the lists a while back.
Neither applied at the time b/c the maintainers entry was being updated
in the soc fixes branch and in some for-next branches at the same time
and they conflicted.

If you could pick the two that'd be great.

Thanks,
Conor.

Conor Dooley (2):
  MAINTAINERS: update polarfire soc clock binding
  dt-bindings: riscv: update microchip.yaml's maintainership

 Documentation/devicetree/bindings/riscv/microchip.yaml | 4 ++--
 MAINTAINERS                                            | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
