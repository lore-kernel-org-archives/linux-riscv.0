Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6567E606A8B7
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 11:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PqYO/4AO;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cSXZtWT/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wzgfDjEHGCVjYsIdozRel3C/262NhgIVxKl6CsPkSNM=; b=PqYO/4AObBSdDBMfFm7wSOcMk4
	DmlO/adc/9bZpJ9MzGwRmFeKhPzuDYK2yfOQev36qkRtYA8yS+LGilUrZbZp6CINAFdUgbk5UHfzV
	W0s/lkz4SpdsDxkq+II/kpCYdBGlcUoorOB6KGpRt2ehFOEqZiqCYNwuZ9PAAr3tXY+BLTAqX0HiS
	hkiWvaJgNWwEV7SC2qqnIjowj1sURQAIZkLLZ6i0ZTNHWvgYtLeg80zOzhGncW0CdkCKgDKAK3hh4
	xlBrCAX6S77AxYtcPYqv96l5+o2DAn4tu8SP2Di+yWHCJ2yAdfpCg1kc14LNdHfCDieBs/jydQQr9
	hC8jco2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvJ8-00000002Fjz-1H4L;
	Mon, 16 Nov 2026 11:55:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvJ7-00000002Fim-0Nra
	for linux-riscv@lists.infradead.org;
	Mon, 16 Nov 2026 11:55:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2B2BF6261F;
	Mon, 16 Nov 2026 11:55:32 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794830131;
	b=ndVY2WGEphCPSRcu0QNGMoZhOhAl8PdW8JJlHQWJReeCOEosT46t0ecufw9f8kG898+i
	 Z4i03D6OUV0T2gKF36Tx/cMQayg1QIjjOGCu4Xl9I35SFWp+bJHL1ff7dPm3ccq33+SR9
	 6ys+Szdet+jjTuX7+9cFP/JsoTVObZUdjZgB65US8uwWc81KTmYomQacjZHH0YFpSg5lt
	 YJqjYYHBa4niKbukpWimlxJdfN0MbWLXprYQWn/7YbO2DB+HTxF6TYDj8kiLG/QMHp4PR
	 BBXbVoWftVuyqUW+pzSXmHlmHiFDcX8J4lPziL2mcZwUfR7XHGLfd+j2HV3+vQgHbWQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794830131;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=hV/k/f5fbJcjPJ2ZODj4J4biesErKEozmiKxvry9Ils=;
	b=0iZNw8mc/cG47cib2XpiHwS0LOSwBe+BhVGUSnhJOYXJGna1hBijFRiGUmzBGhIA9ZXP
	 wrYiugQleDTF4oMuVcU7VIcBAduWnTgnRQHpMaFW8MmAScbov3eUbvsoTv7ZjiGli46An
	 tu6LDBlhWpAuVUceOr62klIq9r17rVxoShapcHCFBTcQfoEgJpkPuUrLvb4/FEBOV3Cyi
	 DYSdLG+Hl7VuMioTapYMdi2vg9CsJjnNkWeBzOalz0mPRelDaC8tItne7xIUe+XY/VohK
	 HjIDpzjT4Ocji6x5HS9w4CZn/UjGqKP94L6D6A7bX7dzlD9ufXvt9boGQheb9SQlTJQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 43BA31F000C5;
	Mon, 16 Nov 2026 11:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794830131;
	bh=hV/k/f5fbJcjPJ2ZODj4J4biesErKEozmiKxvry9Ils=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=cSXZtWT/CVs7hiKyLCra57wCqzeWiCdlfmUJUxov/+0wHYo9lcLjcghaNlrXtB2ZN
	 9xnP7LoE8ahuEc2qn2xC5uw4gTo8RLhpMpgeftdaZ1k+I+NJgQoCUMJuIjX3PkTCSF
	 atFndwx/pFjV4GEMQr9duASAplrVUlHr7MQ9Alb3TLb4Bm3rUTzFaJO5G/FfDzDIBW
	 bya9iMoXZlhvrf6xQLZUvFOH7QMj3D6LMgWXYMPYjl1F//oBA4loUEJGKSRcmO65oU
	 iQACjOCKDiqL/IWLLxW134/p0SMj6RJ0TvG5qaIiUfuYS3+K5c8/UFSfXTn4jBoK0j
	 DND6u3s7bLhvQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C96424A44A;
	Mon, 16 Nov 2026 11:55:30 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Mon, 16 Nov 2026 12:55:08 +0100
Subject: [PATCH v3 1/8] dt-bindings: riscv: cpus: add mips,p8700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261116-p8700-dts-v3-1-ec5d4b7de39f@htecgroup.com>
References: <20261116-p8700-dts-v3-0-ec5d4b7de39f@htecgroup.com>
In-Reply-To: <20261116-p8700-dts-v3-0-ec5d4b7de39f@htecgroup.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794830124; l=841;
 i=aleksa.paunovic@htecgroup.com; s=20250806; h=from:subject:message-id;
 bh=lv7fN/1sfes4OW73tQF/sEOIFoYV8Fh2hXDbsngJw9E=;
 b=kN62qoyjoQ10HEK4mKnCJ3zptssPyJYyrOZaHxCayLaCKBKUW2G7Gtc3b3tu0uTnLgLJJJOSN
 FO+e8nK0ujCDdTEEcW1aGXL4NeGlcId8F2C9tnu2HXP6XrvNKnmp2kR
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
