Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C71CD1BDE5
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Nov 2024 19:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EB9Iq+TGfHlpHY0tTyTxevvfjJ4GZgKJnqlanfwuIOE=; b=MPt7cjmnw/zrC2
	7ANrfTxzArrhrDGdutnCooLcSeMk3YfqkfaQU8pV1iZ+AfYnDZKd2qhk4WYBqR372KHid2idFwoy5
	qz6ZFY9+RgBLjtFblFw/okom1fzEPry5zPO76FiKNC1IlRIx1ohUhZI4peEVY98QO3yzL2DfrUDu5
	Y/2IAkEZXEqu9gEXB7rcxVcN6xyutEc8vUHKOybClfn3WzDPjwfrgZD5vuu23T/MqpW6cvumnl1Nk
	W5zYfZOH8mu1Fm9bGgSJRy9ERBrl+/cckB5jT6++3yb7bmm1LNnGTGjTopcaqR7wkea6idDDWmVHx
	iBuNvcEMDengsjLhIH8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t82Ns-0000000EqPh-0m3Q;
	Mon, 04 Nov 2024 19:05:04 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t82MW-0000000EqIT-0s8h
	for linux-riscv@lists.infradead.org;
	Mon, 04 Nov 2024 19:03:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5B201A4331A;
	Mon,  4 Nov 2024 19:01:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08E31C4CECE;
	Mon,  4 Nov 2024 19:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730747019;
	bh=R0Qg56xIrvqgc08eimMMU708silAc/1YGu+MVJ96B7M=;
	h=From:To:Cc:Subject:Date:From;
	b=aKNGqZlihdRw2rke4lTQfc9RRkix/t9RVS6C6QdZmQXc6+doZoNT4gWh75xCaeEoh
	 XUZzqRFVp48X1VMaADhSvFMJroYcQ5UUInU1hjEOIQKtNd0O8nRi/aRemJb4eFz5uZ
	 Xhv7HBno8AkVaaNmr5Ta4nsioYKzPZl9Z/OFQBxigZQNlgfFBuXZBOgK9Sr3jKAupO
	 9omHqSpaJWK8XqN23ZOCsnB5eYyFPRs6kqPmrL0bDQo1jxyg3nk0/KhXckrHc4w24d
	 w/gc5RGSb59FMQaDJQCcho4kes94jjU0hDro1i1pPuYlc6e5cNMyX/KTc8sSW1QFwg
	 t1f0CrX9kx1Yg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: cacheinfo: Use of_property_present() for non-boolean properties
Date: Mon,  4 Nov 2024 13:03:13 -0600
Message-ID: <20241104190314.270095-1-robh@kernel.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_110340_331569_36E1B88B 
X-CRM114-Status: UNSURE (   8.27  )
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

The use of of_property_read_bool() for non-boolean properties is
deprecated in favor of of_property_present() when testing for property
presence.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/riscv/kernel/cacheinfo.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kernel/cacheinfo.c b/arch/riscv/kernel/cacheinfo.c
index b320b1d9aa01..0115051fa1e1 100644
--- a/arch/riscv/kernel/cacheinfo.c
+++ b/arch/riscv/kernel/cacheinfo.c
@@ -105,11 +105,11 @@ int populate_cache_leaves(unsigned int cpu)
 		return 0;
 	}
 
-	if (of_property_read_bool(np, "cache-size"))
+	if (of_property_present(np, "cache-size"))
 		ci_leaf_init(this_leaf++, CACHE_TYPE_UNIFIED, level);
-	if (of_property_read_bool(np, "i-cache-size"))
+	if (of_property_present(np, "i-cache-size"))
 		ci_leaf_init(this_leaf++, CACHE_TYPE_INST, level);
-	if (of_property_read_bool(np, "d-cache-size"))
+	if (of_property_present(np, "d-cache-size"))
 		ci_leaf_init(this_leaf++, CACHE_TYPE_DATA, level);
 
 	prev = np;
@@ -122,11 +122,11 @@ int populate_cache_leaves(unsigned int cpu)
 			break;
 		if (level <= levels)
 			break;
-		if (of_property_read_bool(np, "cache-size"))
+		if (of_property_present(np, "cache-size"))
 			ci_leaf_init(this_leaf++, CACHE_TYPE_UNIFIED, level);
-		if (of_property_read_bool(np, "i-cache-size"))
+		if (of_property_present(np, "i-cache-size"))
 			ci_leaf_init(this_leaf++, CACHE_TYPE_INST, level);
-		if (of_property_read_bool(np, "d-cache-size"))
+		if (of_property_present(np, "d-cache-size"))
 			ci_leaf_init(this_leaf++, CACHE_TYPE_DATA, level);
 		levels = level;
 	}
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
