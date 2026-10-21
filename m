Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DB1607D9A5
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 19:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0Pj1wMua;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bnlCBH3b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ODnwOh8fnjKTEqrsUOBtTXDLm/kYXWkCuLrOX/QZJkg=; b=0Pj1wMuaFwkryx
	h7/JIG1vqXP+w3uDp/7QksGRCKw2MPuDOCfC0VGaRiV5MnUwAYqRAx/3dOEhsuGnjdeQN4NKIDZPo
	Z9XKZvDR44F6kZMo2ZedYh5qc77y/jMRmGLabu1oLuFXakZgBKhwYfyGjYJ6WRwjSM7ONZ0y6bXJT
	bvtibVYmQGCYrvN0DeJJ06UO3h94QuvBqtSuArooyQig/xHnlhNOAag9fgJ7gpheLW/mFCpgU3ZTN
	2jPVUW+0eNYqMVh3sfoSFVbRccSZV5n7hITf7PpswQ8+DdvnQdyNjvm+hB2qDPtHqJlSqODCIrY9O
	F3c6QdSyt3tAEuoAZdGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJcNP-0000000CmZ3-2VhR;
	Wed, 21 Oct 2026 19:53:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJcNM-0000000CmXF-2xKR
	for linux-riscv@lists.infradead.org;
	Wed, 21 Oct 2026 19:53:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7425D44798;
	Wed, 21 Oct 2026 19:53:28 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792612408;
	b=wPsfWM1mkuVo/i2ilRpytef5gUISS0jFdNQTuC215gXJOuIhQhR0GSEuKh+0Kh5GqBeE
	 1cJcmiiRN/IlymIrFceJllc6IexMTPNvAejAxsLrDHzsxf5Ukmta/DmzeLk9ClgVLIH/R
	 p7pdSS2Vy3AVs43zqRpH/JDRkIisJ3ZX0OfBMYVMMAaesPqPG4RVnx+J0B7JD12FLkM4W
	 yA63Pk5gAtsNjPMfqt/ir7OiJhc8RqYdvZCJFf5m84VAKN2sJ9dano751mxnrZd8Bn6GK
	 DHs6h6ZfjCFGTAhsEf0kGGB8Vf5vv2sMQ9hTOVee/RMx9JW0I1X9N9RiYvAaX/EHOcw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792612408;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=RsU/Miju2jeqymvYcNJXTnmmqKzjTj43vuEKKcaUunA=;
	b=vw9GdsQlPddD3NbjBRGSwmAqGc40N7aVknn8W0FAKNtYC9RxTmo+03nwCXi5mrg6eujk
	 7+nEmqWAe7Ycg4dxysWpf0kCWOSY3QOsMdFi27TtpSSxLawocWGV8fAezW9MJO1OMfoNR
	 +4pXPzJW2Q8C9T+NSOUEGwtWlfqy2qGzB9tomqndmSpDSO022uOXrv2De9t5/7IDDz0mN
	 Clr6imu9TS19msBEHVO5NE0Fmij/VfzOSG/WFk9PB/5YaGB0EK1kEWcLnS5RknK93hUJ2
	 gmIaFr0M90qwlxNw5wwPbmKupVi+dMZ57bPrj49IxHQru5aX70jkcdhD9eZHl/GKVJA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5D78A1F000C2;
	Wed, 21 Oct 2026 19:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792612408;
	bh=RsU/Miju2jeqymvYcNJXTnmmqKzjTj43vuEKKcaUunA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=bnlCBH3bNTfL2w/5DKcbZS/2oAbxh6Wf8W0IFvfHLN7KsRM23UQbyCZRwuYADigVi
	 48vlh5TQqwlYDyjy4wTDXBignuk+5QnIcygUh0AnUkS96k1kJHFidLcWzPV3njsYy6
	 SaZKk05YLFYZTjfECpDJFX9tCzVXK3gKJCCg5dRjceH674ssyRKZpb9Ei7D5TguLWB
	 0G+2aqhDVdgJw6FdEnbtj6yRL1kkDYrarZSYncrCsgGLJKAKmWLSQMF4WYL2s5GI4F
	 efccX17QCjV/ee8QhfoCjIO4TuekWF/OuARuTF2VTnTOhhKN+7uPAxrOeO3V94Jlwh
	 P/HreXwXXDl/g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id DF21B4342E;
	Wed, 21 Oct 2026 19:53:25 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Thu, 22 Oct 2026 03:53:21 +0800
Subject: [PATCH 01/18] dt-bindings: vendor-prefixes: add Zhihe
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261022-a210-init-v1-1-5e438f972d24@iscas.ac.cn>
References: <20261022-a210-init-v1-0-5e438f972d24@iscas.ac.cn>
In-Reply-To: <20261022-a210-init-v1-0-5e438f972d24@iscas.ac.cn>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Samuel Holland <samuel.holland@sifive.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Icenowy Zheng <uwu@icenowy.me>, 
 Drew Fustini <fustini@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Han Gao <gaohan@iscas.ac.cn>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792612403; l=842;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=78H4CNA6muw7rwfV33m2sQ0QfyIqTcYL4B8JahPXMn4=;
 b=t+8nmRY5jqUnjhsyJuU5bc0XAjgdW0Nc/aLBwFxClNEhBrv3hKm41Bh0UldozVyP7v1NVjg6W
 TYA3io+Zy/zDPwEFWFtpNEnG2PU5Aar5s1XUownQN7JDOebw2WOo9KY
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
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>

Add the vendor prefix for Zhihe Computing.

Signed-off-by: Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>
Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969373..21142578837b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1973,6 +1973,8 @@ patternProperties:
     description: Zealz
   "^zeitec,.*":
     description: ZEITEC Semiconductor Co., LTD.
+  "^zhihe,.*":
+    description: Zhihe Computing Limited
   "^zidoo,.*":
     description: Shenzhen Zidoo Technology Co., Ltd.
   "^zii,.*":

-- 
2.55.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
