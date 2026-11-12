Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7700606A33A
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 02:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=q1luyypw;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ey898JLY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=u6uDQHh0QAwo3/pThHYwO4yuj2m8l5kKqruU0TZNh50=; b=q1luyypwii1j+XK/Sxl1TOUcd4
	t/v07TvNmGHhYZAdhv2Om/u4p+LjXxL9ZS27x/qRdxfxranYdFeO58zbgjjkpiTy/o0gMKtC/26oG
	UC71GPFYE9QuugIOS3eFZTcjS6Bm5+2SY/qpuMBuoHefQmDBa2q9e/VagYeg830lAYiC1zRVLRndV
	x/A7rH1lDM2MoTLZe0A7qd+ly/YNK6k9kMadfOj0bgAARXZA+lajXb/Ez6PcqdxZg30lXP9o8dWTn
	eYi2Nx7diklTPuXNK1CE7EvJAPH8+22/GwE87Ed3+AFOgmaXYsn4Y2+h3DfZ+yaNgFBDZvtH/pOJT
	Ql9B2wYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRK7m-00000008Szr-11FF;
	Thu, 12 Nov 2026 02:01:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRK7k-00000008Sz9-2r6X
	for linux-riscv@lists.infradead.org;
	Thu, 12 Nov 2026 02:01:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 250D06112D;
	Thu, 12 Nov 2026 02:01:12 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794448871;
	b=HcAAE1RUN2m3BMtxB9BXLg+zBJ1DYbiC1RJAmzKpxR1FDT6P0PUXTl6sin2nviYWcidh
	 aizy55VUzrk0ebIc53DnptOVeeDmA6BFDOEqo/56GoWGalUSoHBnWMFXYAYhJRCmmM3P0
	 CeeTLS2irkPvcIZrnhvW5CA+nbx1tjCHzVDoLsO72K3izIqhPQD9wIHCNSXFzTm6YK+46
	 iFx52rJzXhIgr2xEfD1cNNN7I9ky3AqF8+wq7J8RzVp712lfXz0HCoqzaKfZlXt21Cx0V
	 9R+0+qE+FbK11c/ATOYmd8SH9lhoE/WmMvcMRJ6QX37iHK4faxS11gkwHvnKR0V4UsQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794448871;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=asQFsxgQNnggINI+MiaVE3YX0MoEnfTw/ot13XBv/9c=;
	b=MatjYWG5eLK6Q52TD0XLIpPLgfN5Uc4+vsI+UKWJcyRmenqN3Xern5L84X6CyVbpT3vQ
	 4NcuXCHM+lqmlvJTTJqJ8Aal0BEgTRzFR50wbARkrVnHxvr2EYRxF3zBv4DUyWPMRRPO5
	 xpFDSdFOG0OYvRNSaGinBy+Empk4ujP55urrWJfYFvipIF+4rriqTCCj4Ri6DuB8nex76
	 JAjZMdwj2oYVTPQd511LP7FrXGobbsdtNGNl7QFIys4etiIvpZcA9wgfeWZ6ES1nvG9bj
	 oD7SCoZ4rsAsQtI6WG/h30mI0tmBHJgmLHRm+OWEEfFcxHHzxN8Fgsqe8jAtE3ODrkw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 32BD51F00A07;
	Thu, 12 Nov 2026 02:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794448871;
	bh=asQFsxgQNnggINI+MiaVE3YX0MoEnfTw/ot13XBv/9c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Ey898JLYklsWS1uOlpMOkk4razn62k46S79XR/GPzEvXdjAf5AWGuV6jnO0VjF/FS
	 /w6m7BKa+k7s44+Ym9Zcg4PtvEkAap6XgTXiHxWwgPhBsfsDL646c5yO0U5nXybGZ3
	 2GZhhq+LMjxrGOFtKWiLQ9/1hBsgmxU5n1lTJJp5QAsKEpdKowaRpvPQ/0f2k3OygX
	 EnfcLwY2XI6SzYB0rfYt5x9KFcruaGpC5DuB5u8aHeAA+2WeUoYUPPNloomcchOMx+
	 h80q2WY73LtQbFgpYem7VCFvCvfyiJNrq22y8tPzD+llI2Qf8JzfEy7mlPZO84vgQ/
	 OJjpDMKyglinw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9C8AB491FA;
	Thu, 12 Nov 2026 02:01:10 +0000 (UTC)
From: Xincheng Ji via B4 Relay <devnull+jixincheng.ultrarisc.com@kernel.org>
Date: Thu, 12 Nov 2026 10:01:00 +0800
Subject: [PATCH v8 1/8] dt-bindings: vendor-prefixes: Add shenrongda
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261112-ultrarisc-dts-v8-1-14fa0834cac4@ultrarisc.com>
References: <20261112-ultrarisc-dts-v8-0-14fa0834cac4@ultrarisc.com>
In-Reply-To: <20261112-ultrarisc-dts-v8-0-14fa0834cac4@ultrarisc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794448869; l=887;
 i=jixincheng@ultrarisc.com; s=20260922; h=from:subject:message-id;
 bh=e/Kow+cCHmWBpSOP+t1oxwgy4BH4snNIyYRmuufij+E=;
 b=eza2T70a3lNyQpWiQMizBKy/7QSqm5B2i33Uqhd342GLcNBEwd//GSAHbPDzgDNrcG0DIwthp
 ey84uCMUgMuAGuubsWaTVPeHPMrhS8Bj7l5C7UVBnjf48rlWGwGRyb4
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Jia Wang <wangjia@ultrarisc.com>

Add Shenzhen Rongda Computer Co., Ltd. to the vendor prefixes.

Link: http://www.shenrongda.com/
Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969373..e100f3993e57 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1507,6 +1507,8 @@ patternProperties:
     description: SGX Sensortech
   "^sharp,.*":
     description: Sharp Corporation
+  "^shenrongda,.*":
+    description: Shenzhen Rongda Computer Co., Ltd.
   "^shift,.*":
     description: SHIFT GmbH
   "^shimafuji,.*":

-- 
2.34.1



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
