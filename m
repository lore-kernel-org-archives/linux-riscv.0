Return-Path: <SRS0=diLN=LP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA9B4C4743C
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Jun 2021 17:56:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB1776142C
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Jun 2021 17:56:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB1776142C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sF1sSA6vqGTUFzDxse6Xp9ud6vUqM3olTRHtLfaUKnc=; b=aW/ttTBWzN6PW7
	pxpe7qeghcjddXjjwlWfW6S6q/AR3X6BYW2RYBsMAmzys057ByftZrzl60W6TB+X3zDBU2jAZO+3M
	rdjYe7eUm0Rs+s2iicKeZ/bKyfNQj+NQCpUynRwtP+iKwUmCS5LUagBRB4Uw10Bq4BNl+9mtRLG/3
	r3FOx6melTUMOgcJt4IbGvt638UpNZ6dzO27KBD0SYYGW6BFo6+kUQXRcK9YMG5dwmunTDhXOVHu4
	nRurorNQIYdsLOK5GvFALaDMP0AE/X4CFBCe6I/UxsS2qhsbibGjZeV6JoYAPLfoojHMSXeVqM+Jg
	SQEl1CMvc69g3E02I6qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvO9s-004MLE-Mf; Mon, 21 Jun 2021 17:56:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvO6T-004KGL-RN
 for linux-riscv@lists.infradead.org; Mon, 21 Jun 2021 17:52:59 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B367561378;
 Mon, 21 Jun 2021 17:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624297977;
 bh=GHk/7znoJ06sxET6U+HlMgG+SebJ6C1htOLeASBDXB4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=j4RCFwqoneSQ7RkkkTG57d0KaKYhdHVZhDZZB2OJRbEzKfcE0EWFPr3Czti5hMD1a
 HkNCbbKqnkdgn5MHfLKaeggL9oamGOcg2nLG9Xa3a0BdZF6RZDXjH+T3fSkcK5fjMP
 l6YG2Hc8dCYe8GgBAuprffg7LiTkxWAm53JJdZE9UCxXZk/gSUL3284KrKVF7/Ort6
 JjxgQhlBACjF1/+MaxO46cSztK5cuQMaqhSojoFDXowqJIYzqeK7Bnig6J9wR/hrU4
 dwePUPYBz8qlRuo/776ji4KyILNEWcsnzGbWoMzYrIRsSn1rVgWNkSwsURcmE3g4Ze
 MGWpc5HZKSBxA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: David Abdurachmanov <david.abdurachmanov@sifive.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Sasha Levin <sashal@kernel.org>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 5.12 39/39] riscv: dts: fu740: fix cache-controller
 interrupts
Date: Mon, 21 Jun 2021 13:51:55 -0400
Message-Id: <20210621175156.735062-39-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210621175156.735062-1-sashal@kernel.org>
References: <20210621175156.735062-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210621_105257_945916_9B1A2058 
X-CRM114-Status: UNSURE (   8.76  )
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

From: David Abdurachmanov <david.abdurachmanov@sifive.com>

[ Upstream commit 7ede12b01b59dc67bef2e2035297dd2da5bfe427 ]

The order of interrupt numbers is incorrect.

The order for FU740 is: DirError, DataError, DataFail, DirFail

From SiFive FU740-C000 Manual:
19 - L2 Cache DirError
20 - L2 Cache DirFail
21 - L2 Cache DataError
22 - L2 Cache DataFail

Signed-off-by: David Abdurachmanov <david.abdurachmanov@sifive.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/riscv/boot/dts/sifive/fu740-c000.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sifive/fu740-c000.dtsi b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
index eeb4f8c3e0e7..d0d206cdb999 100644
--- a/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
+++ b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
@@ -272,7 +272,7 @@ ccache: cache-controller@2010000 {
 			cache-size = <2097152>;
 			cache-unified;
 			interrupt-parent = <&plic0>;
-			interrupts = <19 20 21 22>;
+			interrupts = <19 21 22 20>;
 			reg = <0x0 0x2010000 0x0 0x1000>;
 		};
 		gpio: gpio@10060000 {
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
