Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CECDBCEBF61
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Nov 2025 14:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5q/UE8NKFwRpYH98F7fS5tqaqIvY5cfennN0PDpHg30=; b=U4Y4T4YklBgZ0n
	ZpmD2IoD7+4eZ7DrlO9Zk5vK/wS9R5LDOr6v7tBmPoGYMETECx/e7XLNZi4b13pax05nphR8Fm0eB
	31rN8UIpLwMaipUEgBi0b9NGIfy/RGo1hulgztQp/bCNt7vdNAqtn9scT8dx+oTVuj/pneYqMj5dz
	wt/1fjuQyuAVzac8t8BiBeCIMPp49jYiHIgdnBhgWWcbHG0yo3yRyCrAg/QWQFTzYyIJ6YyQ/s1zd
	/SKtih4msX9sREzKrsYRNG4iv5pNfGsK/Gs2QB6tvVqN7ETnEtnjwwOx/kWlMtSVqMilvGowshtEx
	tamOdP8cKjhypTQ+LXJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL09t-0000000GG2N-0W3T;
	Mon, 17 Nov 2025 14:24:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL09s-0000000GG29-0Sx3
	for linux-riscv@lists.infradead.org;
	Mon, 17 Nov 2025 14:24:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8489460207;
	Mon, 17 Nov 2025 14:24:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 347AAC116B1;
	Mon, 17 Nov 2025 14:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763389483;
	bh=BDKG7XUa8rnXnpXGUzZd9vrLZaSbarLWWRV5Gl7xd0k=;
	h=From:To:Cc:Subject:Date:From;
	b=Di+l2jkCHPmhuWmywggLQnHetuBxRMnf14nf7l7MMwEJH7G0QGy0Ce80g0jq9hQog
	 tIY59KpG0T0mrYhGTmqXeM8PB1TKvOkDIQ/bTrIXw77Nkv6rn3HS7I+UZZ0osSb4PO
	 IxA/A4MCglkJmKIpv9STMXel1vr87VWCO8veWM1ZhHPnkev5kj84CE2j+EaHO+l+/7
	 tp/As5Sgqa2C76PCkfHL3RWq1wkGCgyVgJjXQMGNomeIKhP8Ijdcm/bIyAZYag9c+/
	 yyZJOQOTdRPihh/iMHzeEGRTaAnNQLT8DJixrtqpsrtlIpnjbuBU6JLSIqlGmuVDVY
	 lJNc8jjWwLcFg==
From: Conor Dooley <conor@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: conor@kernel.org,
	Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1] dt-bindings: cache: sifive,ccache0: add a pic64gx compatible
Date: Mon, 17 Nov 2025 14:24:37 +0000
Message-ID: <20251117-colt-carnival-8aab0a900816@spud>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1336; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=xVC4naZvJqIKQsdgFTu1CkfEm/T81TARj47gE0EvuZw=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJnSBqoiD6qv9mknuldP/a5W1aaW8cf68HT7CIdPCeo2K Qdaes06SlkYxLgYZMUUWRJv97VIrf/jssO55y3MHFYmkCEMXJwCMJGanwz/M63zJwp077leVNhy 0DT/0nQX4enO+tMrPq/7rPSWIcSAk5HhTPRf86tJ9ffXX5q11Fd44RWOa0H8p970FWUYv/ypl6b PBwA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
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

From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>

The pic64gx use the same IP than mpfs, therefore add compatibility with
mpfs as fallback.

Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
CC: Conor Dooley <conor@kernel.org>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: Paul Walmsley <pjw@kernel.org>
CC: Samuel Holland <samuel.holland@sifive.com>
CC: devicetree@vger.kernel.org
CC: linux-riscv@lists.infradead.org
CC: linux-kernel@vger.kernel.org
 Documentation/devicetree/bindings/cache/sifive,ccache0.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/cache/sifive,ccache0.yaml b/Documentation/devicetree/bindings/cache/sifive,ccache0.yaml
index 579bacb66f34..c0e5ebb1fa4c 100644
--- a/Documentation/devicetree/bindings/cache/sifive,ccache0.yaml
+++ b/Documentation/devicetree/bindings/cache/sifive,ccache0.yaml
@@ -48,6 +48,11 @@ properties:
           - const: microchip,mpfs-ccache
           - const: sifive,fu540-c000-ccache
           - const: cache
+      - items:
+          - const: microchip,pic64gx-ccache
+          - const: microchip,mpfs-ccache
+          - const: sifive,fu540-c000-ccache
+          - const: cache
 
   cache-block-size:
     const: 64
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
