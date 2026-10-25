Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D641606A325
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Oct 2026 12:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RHQcjwYv;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bIVYBXef
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=S80OpsIgPqh0Js6FeyVGyRFNhu+X0WXAsWgRqNhpafE=; b=RHQcjwYvazIoZO7Vy+82jiCh8y
	XaoFuEPfO+t3FbdDhh5/Vd+hxAhOgvQ0gpTipC8SPbbVnevruygQi7+Bg1y5yWirW0XRmusdiulwf
	+wf4F0TbrIyDeozKp+jUCmiHb0jLL3H28yFWfERLtMb6VOcZYoxncN2HBDJAeWG5kpjyhnDGQl8JL
	g30LoCpRUtZQbxv9S4aK+2cgVNmL1b6xhUM5MUWkAH2q8oFOJmLOd74wlEmTUN2Hou0yjuyepUCw2
	wkR1X3tdQ4OVNTEC1fNGDzj5cfEmRsXX6hiJiZMmmgsT2+D6a3TO9Iml+t10EwLW/dSmxjN4atdx0
	leXmDx3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKxGm-000000011zn-1Bis;
	Sun, 25 Oct 2026 12:24:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKxGk-000000011yf-13xp
	for linux-riscv@lists.infradead.org;
	Sun, 25 Oct 2026 12:24:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 987EC60207;
	Sun, 25 Oct 2026 12:24:08 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792931048;
	b=H+2zsLvJPaLX+4eE+VuvZxztsoniSbHYsK9NaHKvuLEwOXsc5vIKZ19r09x3ppW0H2ZV
	 uH03tK8emGFxvZfww5r8MDVZHsJqZIoG/wK1/MAMyeQZJc33bgdjdGhQcCX95EqNaj6T8
	 ZZ0kUPtofDM7Mpwsn/UTE5yry8/hGC2E4sCZsNrZFiCZcS52iiies/Pm5Ffb9lXY2NM18
	 9L4oVbxQaA226lq8kIhj/NXwl/Mhy7+z76uhqrxnhegKnjB1MrlEjvtHOyN+9+MDcxp8s
	 2AKXUDyITkmdC6h56Zgl67v3QINFPJEygzJFtATBEkjSrg47kALko7a6+1A9ZGv3kiQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792931048;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=0UzY1m+EAyJWVSs3KsoWgdS/aUibFQ3ee2IxYj8gwaw=;
	b=YQlWfWEAZQONpBTwxn894if0SKpzgQeIxYPFP3lXc3TgrIKzW2j2s8ICv/fOxEh2kAtu
	 IFyZRtho0KtmtMS8K1GiwXOnujKlulmqTuN/p+w6iaFQuJ5C/CjsSvG4NEMgYLSJs/Mit
	 TtkhgJ0MpLSjqrOWZdXNSMCmA5iYWEYgbzhp4EWIRBYMRNjosCj+HpeVAmeREepZlwOB5
	 xxIN9FRzQbN5URJ2SdnLd1gYQOHR2mKu8zOy8x/se25+6o/EGO1B91JbtI65DQ86i1f3k
	 4R6bbmDYZaXrVFGS5vUPed6pBF70wrh7XcShxvEZKh73AU6xyi0OZhPVtGF/yONO3YQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B3FC01F031E1;
	Sun, 25 Oct 2026 12:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792931048;
	bh=0UzY1m+EAyJWVSs3KsoWgdS/aUibFQ3ee2IxYj8gwaw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=bIVYBXefXB4Bo9GXPf3fLx4FtFFEq8Gv6Bu7El0f2AVkz/EMDpQcRyr/5M/UGsCSO
	 /krByL1nXHEMUkYhEni2ghEWRcd+ulMb8CPBmja5G8j3XQwvCq4NejAkcWSUQ4816S
	 kACEtx583NSDdmJRWDlaI0uDC9b2xiQo6tTQVYlVDsdr92ru87GrrKi666zx5TRkrN
	 GlabCHg4cmAmm293Tafni0Hp139FDtmmT/hBn6RzWowzbPK7VLtR0wo7Ibvwqnv4Nm
	 zoBihbwhUjv7bo9lnTDSt6R8Omth7dKW0RKjKpkpTf+atz9dtw9F3rUwYEs9xCEStT
	 0ajQRJ1o7G47A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 234A644A08;
	Sun, 25 Oct 2026 12:24:07 +0000 (UTC)
From: Xincheng Ji via B4 Relay <devnull+jixincheng.ultrarisc.com@kernel.org>
Date: Sun, 25 Oct 2026 20:24:02 +0800
Subject: [PATCH v7 2/7] dt-bindings: riscv: cpus: Add UltraRISC CP100
 compatible
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261025-ultrarisc-dts-v7-2-621eca2b8790@ultrarisc.com>
References: <20261025-ultrarisc-dts-v7-0-621eca2b8790@ultrarisc.com>
In-Reply-To: <20261025-ultrarisc-dts-v7-0-621eca2b8790@ultrarisc.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Andrew Lunn <andrew@lunn.ch>, 
 Jia Wang <wangjia@ultrarisc.com>, Xincheng Ji <jixincheng@ultrarisc.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792931045; l=804;
 i=jixincheng@ultrarisc.com; s=20260922; h=from:subject:message-id;
 bh=4TAyfkBcv/s6Kdb5vlK3fVOCoBkGrwHfHTtS6V/To4w=;
 b=lh0QieY16hYzdE4o3bLdgoukKnbuMZbzb8Lqi3so082dAbKol1tJjEp8ctu0hCGapMBO2vVnH
 IZCQ2IVyN+zC80j6bWIhxMEpz+pvrZmxw/9qg/xtcg5/R8Oq+n1ATlW
X-Developer-Key: i=jixincheng@ultrarisc.com; a=ed25519;
 pk=n848dcS5D6g0vLad/rjp4Gf/1eedTe1a3pYUrkt2260=
X-Endpoint-Received: by B4 Relay for jixincheng@ultrarisc.com/20260922 with
 auth_id=1046
X-Original-From: Xincheng Ji <jixincheng@ultrarisc.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Reply-To: jixincheng@ultrarisc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Jia Wang <wangjia@ultrarisc.com>

Document the UltraRISC CP100 CPU compatible.

The CP100 CPU is used in the UltraRISC DP1000 SoC.

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 0da219ae6769..85adf72899c9 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -67,6 +67,7 @@ properties:
               - thead,c908
               - thead,c910
               - thead,c920
+              - ultrarisc,cp100
           - const: riscv
       - items:
           - enum:

-- 
2.34.1



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
