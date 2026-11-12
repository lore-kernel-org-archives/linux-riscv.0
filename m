Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9870A606A88E
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 02:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IUXCrU4x;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BtaLN4hx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=O7A1hkJ7YSIz555AhcQtKuF59BijjMvdN5AM94flf1w=; b=IUXCrU4xC4bXWe0aSbhCRKGA+b
	kdYg1NqpNJ6PQ9gXC+ip0aG8mWKHlB6+NC/4dtXmAgpE6DWQNS2vQk8Gu0Cx9ZhpJ6t6I61TTSP+1
	1fXcuVDti2yM2AysRlxLOLg6jj6Zd5GRrBNTII2SlVpIX2vFmamG9oFMOVEKJWxx0qMW/Tusum0hn
	ViPLn4gS1qN/bQKBQsc8sxF/Y60i/hc0yMo8mlSGdCDvPmLPX5U4Uh0mD8/8tZXtxLeEmmeAKhKMx
	2UhzWkDifklMYRLv155sOZqBaHLNBGQA/iezLik4e1ltn0elnjWWpjuu6xDo91ujZBi+Y6XYlT5ZX
	++hlEmHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRK7u-00000008T1p-3KfE;
	Thu, 12 Nov 2026 02:01:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRK7m-00000008Szk-27U4
	for linux-riscv@lists.infradead.org;
	Thu, 12 Nov 2026 02:01:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0D206437D7;
	Thu, 12 Nov 2026 02:01:14 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794448873;
	b=G3yXBtn86v7C3OaGCRWsi2i50JqSOT9odd53ehv64afVzEwdmGeMphBHbYf5Jqdv9JMX
	 e/Qobu8ygZJXBG4uUqHC125kPQRydk0ymiNLgQD3s1WlJZdEq88X3gSXxJl3T0nE/I+a6
	 eRANhGuT/1pW1plz7kZPzUtUHhPbQkj7jkNVrx+EuSMt5fV+uB3RzwgtU2SgL/07utR+t
	 UxcwRouet7xCphQiJJRvB8YONjyYfbnke24cKvfkyPzeRlrgHBwQ5/+L7TqQIwDXHoboM
	 u38Rl0M0mZeMATpSzeNAC+ru9HrD10TRoyMHh+YlztD1aP8G6xLIAgSrdNSD0iPbYkA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794448873;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=k5PhuZeyqtV0IkxdYw7Vv+ZE7sQNkascqyFEdJ0HxPg=;
	b=Cg4HcyXpb3HgICHS/wmN3O4DllyDa5kP7IE31mnU0jNdLZvwknupCmoDwUss4CLMU65R
	 w5ZV5jbTMD5UCOaMB88MWW7Ob/24PPGRBkRcHoLS61PkWrveuQeTXPtbX0/FeZqGON/FT
	 QVuSlVJvaLB8ZZwkv5F2pHSOL49MPSsH1iGbs6ivKaQAWRJhMTR/Qv0ndDNL5YHRMcwvJ
	 XOSPsy0XoYxzuIaoccW+cuFdzttkun7N4oxk2k/QBQJJgh2FjVqpbr7tTa6iC1KIK7DwL
	 T1gm/UjIxIW4HWgjei8z6ZEiiDzPALDvnKKd/81qn4gF/zjq8EVsOIAhossU0gjAdgg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DE7EB1F00A0D;
	Thu, 12 Nov 2026 02:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794448873;
	bh=k5PhuZeyqtV0IkxdYw7Vv+ZE7sQNkascqyFEdJ0HxPg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=BtaLN4hxXEcQtYIu110oezUJW3oGDxqhrCroNPrntnA7e3uo2WNAsZxMR23u73Rde
	 TATDBlVII4o9RZ45sU+lg8S61fThVjt/LKitSEaZLfm/V0JcqHONhjhstbvlniyp9f
	 gVbm90z/+DE7/BCOyViXyBELH/dh1jxFt+vf+uWJyCkQePAkxjLJv2ywwB6IdeEovM
	 uzYzaiMsWh56pdZnCJsBNhZW+Erdoe05Kl9uT12Z79vTjXvMJuxPXd4Ialju+C0DMd
	 AbfH/pgO728yz4da8dF6HWURpx+3zhfa0FBmODHZ9iBoDycTV8i7HjNGp6RvKW9DMF
	 MLG1RWC16V8Ag==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3017849227;
	Thu, 12 Nov 2026 02:01:11 +0000 (UTC)
From: Xincheng Ji via B4 Relay <devnull+jixincheng.ultrarisc.com@kernel.org>
Date: Thu, 12 Nov 2026 10:01:07 +0800
Subject: [PATCH v8 8/8] MAINTAINERS: Update UltraRISC platform maintainer
 and tree
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261112-ultrarisc-dts-v8-8-14fa0834cac4@ultrarisc.com>
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
 linux-riscv@lists.infradead.org
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794448869; l=1040;
 i=jixincheng@ultrarisc.com; s=20260922; h=from:subject:message-id;
 bh=zzbzfVX2pHKjlzmFHTGwjk6Q4jGYy9Bm9HpLwCsOw8U=;
 b=2iQS3anfVEQo5/QZ4GHyJmpaKBXwQ5QlnDN75lLOfZURdhnA3hll1agaX7JCqLgox4KoiwCVN
 LftIjGMayl2CLv2xDGPW05MkMKn/d1R9nsZaeHBU2RggGCQcqEng9D8
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
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Xincheng Ji <jixincheng@ultrarisc.com>

Jia Wang has left UltraRISC. Take over maintenance of the UltraRISC
platform and use Conor Dooley's tree for platform changes during the
handover, as requested by Conor.

Link: https://lore.kernel.org/all/20261110-amused-strobe-d6cf2bf24861@spud/
Signed-off-by: Xincheng Ji <jixincheng@ultrarisc.com>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a97926dadba4..67bf01e20560 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23640,10 +23640,10 @@ F:	include/dt-bindings/reset/thead,th1520-reset.h
 F:	include/linux/firmware/thead/thead,th1520-aon.h
 
 RISC-V ULTRARISC SoC SUPPORT
-M:	Jia Wang <wangjia@ultrarisc.com>
+M:	Xincheng Ji <jixincheng@ultrarisc.com>
 L:	linux-riscv@lists.infradead.org
 S:	Supported
-T:	git https://github.com/ultrarisc/linux.git
+T:	git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/
 F:	Documentation/devicetree/bindings/riscv/ultrarisc.yaml
 F:	arch/riscv/boot/dts/ultrarisc/
 

-- 
2.34.1



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
