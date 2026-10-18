Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA20CCA490
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Oct 2026 23:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=koG8hAhXmWmr0A9SI2LOQpnFLocLsqPnXyQ1Jm5pACE=; b=WjHTf/GvfkpuGu
	TOchgBxXxjZ989aSEffeETuxjsgTAD4x0JvlHU27ye65RuCuCZC2BUyZ3u5Jk5tQMjSvrMldsQpnH
	dlWijbQR59QD5SK9WXuCoWymNyBV4cJz1crc48MYVOjRF+BBwYw5Y45mApqQdF6+6D88BaZJSBdVH
	uy07LmJrDGHGoSOgzEJJZ0C0RIXX+TgzNd95RjdfwWfMwLfPQbKSogSmP6oRdHXzeGy/oDeWGwJUM
	7R2kmAgME6C8VA6Glfb9vWP/XZqnxKCc5cHC+us0/ySAQ1qjR1w2H7SF3vGFRaon5lxGGgL54D4mC
	MuOCbF0pR2yPAWaOt+FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIa8Y-00000006I9m-2Grh;
	Sun, 18 Oct 2026 23:17:54 +0000
Received: from buffalo.tulip.relay.mailchannels.net ([23.83.218.24])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIa8V-00000006I9S-0S3V
	for linux-riscv@lists.infradead.org;
	Sun, 18 Oct 2026 23:17:52 +0000
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id D4CC44C17FF;
	Sun, 18 Oct 2026 23:17:48 +0000 (UTC)
Received: from pdx1-sub0-mail-a253.dreamhost.com (100-96-8-137.trex-nlb.outbound.svc.cluster.local [100.96.8.137])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 703D64C0FF5;
	Sun, 18 Oct 2026 23:17:46 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Average-Bottle: 4eeea253467d22e0_1792365468709_783431510
X-MC-Loop-Signature: 1792365468709:4135546109
X-MC-Ingress-Time: 1792365468709
Received: from pdx1-sub0-mail-a253.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.8.137 (trex/8.0.2);
	Sun, 18 Oct 2026 23:17:48 +0000
Received: from offworld.tailf5af7a.ts.net (unknown [172.56.178.135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dave@stgolabs.net)
	by pdx1-sub0-mail-a253.dreamhost.com (Postfix) with ESMTPSA id 4j7F2d4pyHz1044;
	Sun, 18 Oct 2026 16:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
	s=dreamhost; t=1792365466;
	bh=nX42rawjGZS9uhRXyyy2xQVWTYF1zQD/dRyD2IOTcAg=;
	h=From:To:Cc:Subject:Date:Content-Transfer-Encoding;
	b=X+xHex6oMrORNOUXARQhlKJGbN6kWM7Eieol2jajImP/J9e5Gu+/5x4cekat7Vopz
	 MWDNlwIXimCjJx+5nCEVU6TWkU4b2UXKkgFvgLUl52po56vzLhGKrGGBhZWYzi++pq
	 uadxa/BUFRO7HQZmkSVNKhKtddMX5bQJepAfjg1bM74Ew/uKTfmxgNMgQZVuHAEqt/
	 K63pgwbYnDF4eCAFpqeK9kdxcTrLoFDtemYJewztkniKusErfLlumlNgpiPQPA/Dx0
	 hEHh2kd5mPi36LZi+v2vMEYWFdR7UgR5cd6/L1mSLiWBUW/0P1XNgNgrio75Rxgnkg
	 k/fQAz0rOkgSQ==
From: Davidlohr Bueso <dave@stgolabs.net>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: alex@ghiti.fr,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	dave@stgolabs.net
Subject: [PATCH] riscv: atomic: Drop stray semicolon from __atomic_release_fence()
Date: Sun, 18 Oct 2026 16:17:39 -0700
Message-Id: <20261018231739.1770964-1-dave@stgolabs.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_161751_289056_5A5607DF 
X-CRM114-Status: UNSURE (   5.99  )
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

... correct this.

Signed-off-by: Davidlohr Bueso <dave@stgolabs.net>
---
 arch/riscv/include/asm/atomic.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/atomic.h b/arch/riscv/include/asm/atomic.h
index 616b8b332ac5..c6f05ffe0cf0 100644
--- a/arch/riscv/include/asm/atomic.h
+++ b/arch/riscv/include/asm/atomic.h
@@ -22,7 +22,7 @@
 	__asm__ __volatile__(RISCV_ACQUIRE_BARRIER "" ::: "memory")
 
 #define __atomic_release_fence()					\
-	__asm__ __volatile__(RISCV_RELEASE_BARRIER "" ::: "memory");
+	__asm__ __volatile__(RISCV_RELEASE_BARRIER "" ::: "memory")
 
 static __always_inline int arch_atomic_read(const atomic_t *v)
 {
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
