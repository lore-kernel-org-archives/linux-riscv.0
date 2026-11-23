Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6A160A2604
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 14:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GD1yiGdV;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=beluUJgU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wzgfDjEHGCVjYsIdozRel3C/262NhgIVxKl6CsPkSNM=; b=GD1yiGdV8VSTztbIsYQDQi9a3Q
	VkEnZukhI9mUpEn33IT0d0d3QoNJleJjFbKd+grEYOh4vk8FAZHzT6qDJnTw4SspdOJjrZ1LK1nrT
	qwvdGQlURhwUND8kEuMZCLe4omZfDNM6x1XxHLrfIztgyiZ2nt/vRPLzD4KA7HgfWBsudMy8SLG1D
	y/uiSTatUatdab5K74ynI2a4/DFYIzbzS3xmnpIZUfz490vj6qNIXkIuhMVwbacNl1Cclt8akjH9+
	mP4aBVl0Etm5Dd1xpNFMGdaOfkTEROiaiIXqT/YL33Pa3bkD6UfhGkKvIghQYaei43FBCbggH5wKT
	zdKpFNLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVKd-00000003ml6-3XVm;
	Mon, 23 Nov 2026 14:47:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVKa-00000003mjy-42EV
	for linux-riscv@lists.infradead.org;
	Mon, 23 Nov 2026 14:47:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0BC116138B;
	Mon, 23 Nov 2026 14:47:44 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795445263;
	b=LBywtNLS2c+dsR/P8hVhC/z4ZLbvSorsopXIaSA5JGv/AGs8IzfX0rvI0FaE0hTOxPb/
	 aDY56CpvdKhpBE4I/Vv1sT+4WkMYteFPLVnS5f9es7YjwiavIKmDFeUYyjLwtSZzLwb8/
	 SNIdWeRtQgGjwjj6jrT3Ey9hQMB/76T/vBIFInTt8EJMLW6vWYApaixhW5JACUjZOcLO8
	 z1HcKVyTSDPE2L3btjnEuLxvT3M8zaqJrE9pRGoWatwNdQJfhwjrKj8+rcVRONl0JXwLL
	 Qn+F+beSvHTZQiuMJIegJH70n/r00XVo6xov19nBdBrN3NJjZzanwYTiobVOxVOOwlA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795445263;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=hV/k/f5fbJcjPJ2ZODj4J4biesErKEozmiKxvry9Ils=;
	b=ILq4Uj4kWHaDN5ZuikePFt/yD0mA9Fzfa+8MwcczdNxKbS2gI12CEkCSwulR54+2wx4+
	 rCZ+hkFHHgQJDpUz7eQDT/3ayhBRhO3iuHdo41oumNgQWuScVq3ntegepaWmfPJ4upSO7
	 6pf9eVvOBDFXEMM4fIbdMCgFaxBWXzh/dnxbrBWsdpLazryI/9lDt4WXJijf4S0PF9Azy
	 vRfJ8fmz/SeQMjc7YG4Ng6Qw1yfY8051sY+oER9vrBAHoAqcLKKgcvBUGlw44PFWvM1t3
	 U7gXGEBlj89XPCJyymiDJpR5QfspIcH9G9JcrXDlwPm/dCCRVHn354DBUC/cXoikv4A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 924511F00A19;
	Mon, 23 Nov 2026 14:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795445263;
	bh=hV/k/f5fbJcjPJ2ZODj4J4biesErKEozmiKxvry9Ils=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=beluUJgUZr7cuzIz6a+RLyXcc/pCItNueqUmRFjJeaBGmtUd3UGfZO+9wzSBzn0yg
	 i2D3dIlJyvaajcaz5hLHe8pUTAFi3Rb8u/nYOQSktX2DnZiscMqq/h+B/0AyXrXCi1
	 q3vle9mAkrUqyE81DTSuYur1MX/o12UDLlf65ySaolN4eor4PmcsYDpWZsNID0D/P7
	 sQWEO/VPznaUVLQF780UAtICu+ZqoAMvj0vksKQAdHn0xcWL1k9k/MNJWidAzI/sER
	 u+MtR2MNRJaRLs3VI5Db+aqu7MVmdUySgnSwjfNAPyZd/SmiM9NI0RgXl9pzkFXY+a
	 14JZfw7qHd+AQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1A2E74C4EE;
	Mon, 23 Nov 2026 14:47:24 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Mon, 23 Nov 2026 15:46:56 +0100
Subject: [PATCH v4 1/8] dt-bindings: riscv: cpus: add mips,p8700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261123-p8700-dts-v4-1-60bb7bf8a7a1@htecgroup.com>
References: <20261123-p8700-dts-v4-0-60bb7bf8a7a1@htecgroup.com>
In-Reply-To: <20261123-p8700-dts-v4-0-60bb7bf8a7a1@htecgroup.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, 
 Djordje Todorovic <djordje.todorovic@htecgroup.com>, 
 Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Inochi Amaoto <inochiama@outlook.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Joel Stanley <joel@jms.id.au>, 
 Aleksa Paunovic <aleksa.paunovic@htecgroup.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795445243; l=841;
 i=aleksa.paunovic@htecgroup.com; s=20250806; h=from:subject:message-id;
 bh=lv7fN/1sfes4OW73tQF/sEOIFoYV8Fh2hXDbsngJw9E=;
 b=7m5bAOpwqYkpt80MXV55MvSifM+b3kzld3tR8d0XpVoesAhdVu9LhDKC8cIKyVqwnwC1MLZ7V
 wUo05RzAz9eBAZA57ms645+N+Efl9+A5V7bTJRJIdJ4oAdsqnbjGRTv
X-Developer-Key: i=aleksa.paunovic@htecgroup.com; a=ed25519;
 pk=Dn4KMnDdgyhlXJNspQQrlHJ04i7/irG29p2H27Avd+8=
X-Endpoint-Received: by B4 Relay for aleksa.paunovic@htecgroup.com/20250806
 with auth_id=476
X-Original-From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Reply-To: aleksa.paunovic@htecgroup.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>

Document the MIPS P8700 compatible.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 0da219ae6769767a9b7f41f179a3559ae7160d69..3e7016687fb67c53856310f97f4ba587ba6b89e0 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -48,6 +48,7 @@ properties:
               - amd,mbv64
               - andestech,ax45mp
               - canaan,k210
+              - mips,p8700
               - nuclei,ux900
               - sifive,bullet0
               - sifive,e5

-- 
2.43.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
