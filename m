Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E657606D488
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 22:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BEYzlPhz;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NkfHNVQ2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yKJfCX+5xaHP2i//U+z2RMtuuTGo52qxXrUCYk2PMJs=; b=BEYzlPhzkcoeo8UdHAV9rOeDFU
	g6Y/PuLAjiMI6PEYub6lKJws4bxOkjVbPV3fIk7Oi90Dik8IbYpDKogWYNhi7ZPFgVOMMXr0kv5kj
	APbzcIKJT4CraZW4Z4E2lUyAOsNqhqdVR+aDkj1wEGYnp85H8Z+aaCtgkMBKxXpSO1BqI8J/96CQ7
	lz1oBjHP3LKZVRxbMFGlwRBlEW5/Vune2nzcRpNO3Cpy3YC91vLADzK7idSk0AHmZgOUaBPhRimjD
	vBCKD2sG6Bqsh0uFR6VDahFbdKUOYBw7QU2w+9MWIpb1+UlJyMSALdEG2q3KRwemIdMZQek3yRZAd
	WQYd+OdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRzpx-0000000EhiU-16rP;
	Fri, 13 Nov 2026 22:33:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRzpv-0000000EhhL-1rC9;
	Fri, 13 Nov 2026 22:33:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A65C262279;
	Fri, 13 Nov 2026 22:33:34 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794609214;
	b=X7Nk/tZ7GonNx2KBw/8y4OaHJ5i7FCx8F7Vj1hsZFRhpxGtoYW59w76uQgBX493EgOCd
	 mD87NDzx6MTRA9HakTlPL0MpVUgtKBofSunRxLAkVv4BVHyryv3IAFgmQ2aiauMZjMmqK
	 B1oAgi/gO0Jn5zoQkb5hxY/EUVZ3J/H/lAcwYFr/dHkG5tcr0yRCTrlAyEM1Nj2o+sjiL
	 GRADLAPwSr70itdqlRIQilL0GFehQ1QnDQefOA+0FdMsGuHh7baLdd5fGisnmsorRd/AR
	 +lBLlGDJP/nJXSYptVvEr2aCOOfOtUyz9l9Vpwf08x5O1AL+WYEsvrdQkfzSSkRQCBA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794609214;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=TOlclL4YMcO1403e1qiCF3GU/nuLdoHldjlrv0LH3a8=;
	b=d0GE6jupYk62y2sKYS/5FpGJDkn42D0xd7bDk5SFe65Vv4ghP6InG7lhVSEBgjaaVVaK
	 /1vcSRm5xlZvFjRi5dzKWUuUYOYUqn1DA15py6vxIxD+fm+mfL85lHj7hP4+gH7Rj32rG
	 oUq6qz/I8ffNvPbgiQyYImr94+tbK4tigRXWAM3aDCJXfN3EuiPIsUzSzM2AlEDc6TqRg
	 W1/dMSKvKdcl2vVmpteLEVFzGzip4NwKtomYPir7B48thsIMPAh/mCb9aHkgbMAslElBO
	 nr4VKmdPJUvInZc2GBIs90JF+tPCcxbqPkjUMCuj77yUmgRC3rqg3xFPPIoyovmlxIg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3286A1F000C5;
	Fri, 13 Nov 2026 22:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794609214;
	bh=TOlclL4YMcO1403e1qiCF3GU/nuLdoHldjlrv0LH3a8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=NkfHNVQ2TMvbmMXE6fHwvBl9xcmpq9ky0p9rvXKU8tCScCglkZl3L/h/IS23zeIgj
	 4WlapfQCcG63cdRxJkgHoUa5ta94XtV1YB0VFKL9QwsIp5QJ+dERlhTaFOxLamvr7G
	 +6DTAQpTDl4xbvdR9Ts/X3fBIEtNJRg6CVdQDuGSuuKUHOFj6sbeUk8caDwbC/65Cd
	 JGsdB/alXmyDqQpNl5OphsA9VvGmaJ+qZiAcBKqCQkRTOvNC6MdY6FWiI8N+N6Hhhb
	 J10jihh2o7g0l0tzyewbVoYhZEyQh9DqYYNC6DHFWtEhFNQxipo7I7UdmqmJz9D0Vz
	 S2OJKXYUweEzg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B1FFB49B5C;
	Fri, 13 Nov 2026 22:33:32 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Sat, 14 Nov 2026 06:33:28 +0800
Subject: [PATCH 02/19] dt-bindings: riscv: cpus: add the XuanTie C907
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261114-v861-v1-2-eb71ec3ee523@iscas.ac.cn>
References: <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn>
In-Reply-To: <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Han Gao <gaohan@iscas.ac.cn>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Maxime Ripard <mripard@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, linux-csky@vger.kernel.org, 
 linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794609209; l=986;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=Cm+aoOEvEdfEXFBW81kE8hGffN29ckzRUH816nQCB7k=;
 b=mWoK/d3s7E1yljsgEDG5AOvjeGoZNBwoSoucC5cXcDHH1Ezvl8ge/m6Rc2ZMX+fXR9/JUk6Cd
 sgDp+kyX4ikACJQQaTT68CWvbDPAa7lgh8Bv3nSSLDGn7sHbxhQnbqQ
X-Developer-Key: i=gaohan@iscas.ac.cn; a=ed25519;
 pk=J8WHEK3filS86QaCaIHDGafqhxKyQ4K7+vFgRirTIiY=
X-Endpoint-Received: by B4 Relay for gaohan@iscas.ac.cn/20261021 with
 auth_id=1262
X-Original-From: Han Gao <gaohan@iscas.ac.cn>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Reply-To: gaohan@iscas.ac.cn
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Han Gao <gaohan@iscas.ac.cn>

Add the XuanTie C907, used in the Allwinner V861.

XuanTie is a brand of C-SKY Microsystems [1], whose JEP106 ID 0x5b7 [2]
is what the C907 reports in mvendorid, so use the csky prefix rather
than thead.

[1] https://www.xrvm.com/declaration
[2] https://www.jedec.org/standards-documents/docs/jep-106ab

Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 0da219ae6769..bdb119ab8ee0 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -48,6 +48,7 @@ properties:
               - amd,mbv64
               - andestech,ax45mp
               - canaan,k210
+              - csky,c907
               - nuclei,ux900
               - sifive,bullet0
               - sifive,e5

-- 
2.55.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
