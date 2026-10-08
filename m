Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8005FCA6004
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Oct 2026 02:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:MIME-Version:Message-Id:Date:Subject
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uTJCdAyRZENHdvdxlIw2N8ZvYmVfyjqyT9IdScNGen0=; b=mi5MstAOOgDO4K
	gQCIlOewsBxrLsF2t2f9z3xCQxgKhV/ZGOjFe26H8l7bd/ARzk5kYM/KjIuGr1YOlQTLotmKbOmm5
	mx+0DkgefpVJEZpu8EvDOCRccAlc0fpERVvq+8FlvG9ypvsGvNYP/+WTJG/ryDrUVDAmzgDxJ9Ikb
	o+XFi6Heah3Lt179WOPGTG6nGH/1cuunSjQisnAyNlvHUkuASF6d57xhUrIF0g+JBL8z86mScqQf5
	VJ/F+raMQKhKAP/ONilkxKHsa9zAlEjBo3uCTv418mRBB5xOR1N3Kn3Jk9v8TnqFeXcD4jt9dJ+7W
	wusMBbwmSltubFoPD/kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEeKl-00000003QED-4B4E;
	Thu, 08 Oct 2026 02:58:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEeKk-00000003QDy-0BvV
	for linux-riscv@lists.infradead.org;
	Thu, 08 Oct 2026 02:58:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8A05C432BD;
	Thu,  8 Oct 2026 02:58:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD3141F000FF;
	Thu,  8 Oct 2026 02:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791428293;
	bh=kqQFBKuueEa6Y0WgZw0AeqBkSpOARrf4znZxbkxqu7c=;
	h=From:Subject:Date:To:Cc;
	b=A25DeaQhdfV9zQRboNNmj4SYXFFZ7xtbDE6aNJ1e83lub7wAuWaKF35VltWK2sayF
	 W0I1Is5mB3mWdzthWIKnWh/nxSWm2JhF1Bl6Z/C2dziXw3hg6VrCnJcBbPDPTZ0zWZ
	 AKoaaI0IzgWZw1PfzvE3ZfkvyGux8EC3HXMuwn4IHliKRJneygZAo0r4WfAbbkUupQ
	 Aj2006Ms+vwYR2Z85Oapxv5St86MviIS3ZVPEc8pJveqOVOZdkRbc52AGPN9dDlNDH
	 Gl143Xi/oYe9xjHYI3OcpNd884tpzKDb8CC7CGXc7K4CUCt0cRU6ZDkZnzJIt4lRtl
	 Wm6taqbOVTlxw==
From: Yixun Lan <dlan@kernel.org>
Subject: [PATCH 0/2] clk: spacemit: extend to support pm domain driver
Date: Thu, 08 Oct 2026 02:57:54 +0000
Message-Id: <20261008-04-k3-clk-pm-aux-v1-0-8372d7307694@kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQqDMBBA4avIrDswakjEq5Qu0jjq+FdJqgji3
 Y26/Bbv7RDYCwcokx08rxLkN0WkrwRca6eGUapoyCjTKVGBpLDP0Q09ziPaZUOTG63IKK2tg5j
 NnmvZ7uX78zgs347d//rAcZy6z8zQdAAAAA==
X-Change-ID: 20261008-04-k3-clk-pm-aux-7376407466ac
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=961; i=dlan@kernel.org;
 h=from:subject:message-id; bh=cHbILVKSdizFNPE4GEMMhNM1jFSHqMY5od3vYov6rSA=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBqxwa3CVMliR1Pf+TzndmUndjvfjIsh/fxobPrd
 uxGemsKcxKJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCascGtxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+29CQ//RD/mM/4hWKkiJ4PA+22Q6lyJkZKFWszlUg6sxXmr+OjqfMOsV2Xyu
 JtlaGQKKtcpArvZvWlp7V3y63FwfGh4DlFeyPu/w+lnstSvdfi78KlVfW+jEoLfbAJ9Tl9OII8B
 +tJc5YBKyY1fdi6c3O4xEeUKZkdrLCUgTdsqySmX6XYWmnIFL33GTgL5wt/rh/t4AeTHOmmwwU5
 EnkUqEfYfOFFA2m25tS60MWFXt4mtDUkxjBmNy+uGql5LFjrNYgc/dpOq23Bm9uWIeC2GYSXBVO
 vF45wVYJZjG5LX2lwSpTlRnLVKUzy1dljhDP+LuaCP4mX92d4pfHO8djVkER7mhCrWz6Du4yqrM
 yphrWO77pYYtoPFBtZ9eQbE6diFdWjz9pZPxrbVhuMONJVYPMBzc8AH5yHARxydC5TMdbbUd/mu
 Z6mXj6mwKIVZJoakwFlPGQHBXTi+5FbogQizPQTFiFzOaS79/e6ms2virl/pk5d9U6bG9GOIqXE
 szx28DIOx0v/2K+9x8AUACYF0d52Kzkjt1z/b9WVG9XRocMdFJM1KhTdJE4sa3FdjIklcLYpL2x
 f2WL1HfHrqGfr99xaIRTGfQBBfvqfJhTJS3eahyRWVfIKVeo2xy4TiOWpuYNL1KX8Y9YWLw9RR4
 PMIi1tCCv9Z4mcRmJQNq4TqiWolqBU=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
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
Cc: Alex Elder <elder@riscstar.com>, linux-kernel@vger.kernel.org, Yixun Lan <dlan@kernel.org>, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, linux-clk@vger.kernel.org, Iker Pedrosa <ikerpedrosam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The APMU (Application Subsystem Power Management Unit) register region block
not only provides clock and reset support, but also the pm domain management
capabilities, so registering pm domain driver via auxilary bus is feasible
way to go.

The series try to extend the CCU driver to do some preparation for addition
of pm domain driver via the auxilary bus.

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
Yixun Lan (2):
      clk: spacemit: rename to generic ccu aux register function
      clk: spacemit: register pm domain auxiliary driver

 drivers/clk/spacemit/ccu-k1.c     |  1 +
 drivers/clk/spacemit/ccu-k3.c     |  1 +
 drivers/clk/spacemit/ccu_common.c | 16 ++++++++++------
 drivers/clk/spacemit/ccu_common.h |  1 +
 4 files changed, 13 insertions(+), 6 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20261008-04-k3-clk-pm-aux-7376407466ac

Best regards,
--  
Yixun Lan <dlan@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
