Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93480C7EE2E
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jun 2023 20:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zWwvc2ZchBSJGGcvaCyg8xB+b/ZFNyriyO5QNqH35EI=; b=Qfwvqiinx6HoNa
	S+bD2JDV3OjTBgUMVQizrcmpVgXIAPcU2D7hMn7XR9J2CS5Vw15LBn+Uy06oD/8OmRdKWICYhFAlX
	NwHMhkWv/T0hQyXb71wlHuTL8YwOGRR/e6rPj5Oz+5Tg+w55X1EWrqNY1KCs4XujQoy+u+88zfSv/
	as5vbvQU5qb3Z1FKfqfR79uEqqqO1xM9od60iCnwe5NaznFG20pzThRCkYKCwTYkmFCSqX49Yf9fs
	Sj16F/xmgeI/F25L+kYpXtnkHj4k9NVyS5okfes18AGmUVpd581Cl4hRA5geMXDzPTScdZf8+iSuV
	j9ZPq6+A52E3mftTOVhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6zqU-0078mx-2Z;
	Wed, 07 Jun 2023 20:33:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6zqR-0078m7-2N
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jun 2023 20:33:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CC75A64537;
	Wed,  7 Jun 2023 20:33:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B313CC4339B;
	Wed,  7 Jun 2023 20:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1686170006;
	bh=8gLREu9AqGvhfWkDrd1fdGlrvPw1bgsl5k3Y4NIUpm8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q+OMtAsrorVyqKp/s6VHJGQwKVGahX+X9nvoP76ShxtdtUbvpws08ypDd/w0I8c4t
	 yyHbAGP6lxv88K2gZpOhQchFGI9/R00VnGIhKzHy1FgMgZimZBj/kp1ceuin35jabI
	 0NSI+eb5JerlDB3d8z3dOWWYMLIX39wphffuqhX4=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	patches@lists.linux.dev,
	Randy Dunlap <rdunlap@infradead.org>,
	Jaswinder Singh <jassisinghbrar@gmail.com>,
	Boojin Kim <boojin.kim@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Russell King <rmk+kernel@arm.linux.org.uk>,
	Vinod Koul <vkoul@kernel.org>,
	dmaengine@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 4.19 10/88] dmaengine: pl330: rename _start to prevent build error
Date: Wed,  7 Jun 2023 22:15:27 +0200
Message-ID: <20230607200857.647381551@linuxfoundation.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230607200854.030202132@linuxfoundation.org>
References: <20230607200854.030202132@linuxfoundation.org>
User-Agent: quilt/0.67
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_133327_854128_EA835633 
X-CRM114-Status: GOOD (  17.66  )
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

From: Randy Dunlap <rdunlap@infradead.org>

[ Upstream commit a1a5f2c887252dec161c1e12e04303ca9ba56fa9 ]

"_start" is used in several arches and proably should be reserved
for ARCH usage. Using it in a driver for a private symbol can cause
a build error when it conflicts with ARCH usage of the same symbol.

Therefore rename pl330's "_start" to "pl330_start_thread" so that there
is no conflict and no build error.

drivers/dma/pl330.c:1053:13: error: '_start' redeclared as different kind of symbol
 1053 | static bool _start(struct pl330_thread *thrd)
      |             ^~~~~~
In file included from ../include/linux/interrupt.h:21,
                 from ../drivers/dma/pl330.c:18:
arch/riscv/include/asm/sections.h:11:13: note: previous declaration of '_start' with type 'char[]'
   11 | extern char _start[];
      |             ^~~~~~

Fixes: b7d861d93945 ("DMA: PL330: Merge PL330 driver into drivers/dma/")
Fixes: ae43b3289186 ("ARM: 8202/1: dmaengine: pl330: Add runtime Power Management support v12")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jaswinder Singh <jassisinghbrar@gmail.com>
Cc: Boojin Kim <boojin.kim@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: dmaengine@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Link: https://lore.kernel.org/r/20230524045310.27923-1-rdunlap@infradead.org
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/dma/pl330.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
index 9cb1c42282051..5afdb9e31c885 100644
--- a/drivers/dma/pl330.c
+++ b/drivers/dma/pl330.c
@@ -1042,7 +1042,7 @@ static bool _trigger(struct pl330_thread *thrd)
 	return true;
 }
 
-static bool _start(struct pl330_thread *thrd)
+static bool pl330_start_thread(struct pl330_thread *thrd)
 {
 	switch (_state(thrd)) {
 	case PL330_STATE_FAULT_COMPLETING:
@@ -1690,7 +1690,7 @@ static int pl330_update(struct pl330_dmac *pl330)
 			thrd->req_running = -1;
 
 			/* Get going again ASAP */
-			_start(thrd);
+			pl330_start_thread(thrd);
 
 			/* For now, just make a list of callbacks to be done */
 			list_add_tail(&descdone->rqd, &pl330->req_done);
@@ -2076,7 +2076,7 @@ static void pl330_tasklet(unsigned long data)
 	} else {
 		/* Make sure the PL330 Channel thread is active */
 		spin_lock(&pch->thread->dmac->lock);
-		_start(pch->thread);
+		pl330_start_thread(pch->thread);
 		spin_unlock(&pch->thread->dmac->lock);
 	}
 
@@ -2094,7 +2094,7 @@ static void pl330_tasklet(unsigned long data)
 			if (power_down) {
 				pch->active = true;
 				spin_lock(&pch->thread->dmac->lock);
-				_start(pch->thread);
+				pl330_start_thread(pch->thread);
 				spin_unlock(&pch->thread->dmac->lock);
 				power_down = false;
 			}
-- 
2.39.2




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
