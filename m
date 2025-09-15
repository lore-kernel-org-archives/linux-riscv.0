Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D052CA101F
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Sep 2025 06:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kdKVgSmq4d9yWR65yBMSrY8BhmCVKDRRSLGRz0pYWAU=; b=U5EKDuxa+o/Uqh
	xX6eA5sVq70xhTQZgrHOwkRmC8d9fjd6400i5R73qedHrzofNV5qao1lXUWFo6RiF4lk7bFrlxnfQ
	Nfp+tUehfeRxuh9FfyURy8PxLg3W7CcTyCzvXnAm9PvG155TLUcJ2JpkAGsPS9D1gVhFQeS/8SUXd
	ZOdCbeT7jJlxiymK84TWmiu8jd64nQmCmc+Q/OVbwWWbOEKI9ZA2BPXX8T4QKiJnqhL5AwAEsc6dQ
	tyQlEl7ZzredotQT6344os+8SoaigbZU1N4UqMwoN/6yT5mYWPfObmY2mcRtNlb90NM/NQHvor28F
	L4pCplDHU7iUdBgqqf3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy2jb-00000002vjk-2Ze6;
	Mon, 15 Sep 2025 06:30:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy2ja-00000002vjY-0OTW
	for linux-riscv@lists.infradead.org;
	Mon, 15 Sep 2025 06:30:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 36DDF6014D;
	Mon, 15 Sep 2025 06:30:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8364C4CEF1;
	Mon, 15 Sep 2025 06:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757917840;
	bh=ht03jlqLtN1+50q+yrJO7Nhcw4NQZ6+dmocueZw8+Dk=;
	h=Date:From:To:cc:Subject:From;
	b=U1RucKmjoxN/cmf2Af3pxmFk9IofrFb2rIjADoVgLk00gNk1Q07F+9Nh8Id1S6wf9
	 svThMM4ei2Livt7Qhj73xxKR8fYgJ8XMazE+upzo9N/9RQM3NjwxQtTFb0zDnGq104
	 DbN6GwNxhSqKjk8uCGH/Ma2ax1CrrW0Ps50On/eHnFBRXHrsVBF3H3XoEpb1jtEihy
	 4ivqTWs4uH8UOJwf4EmoGU4C4W9RAD08hAOXoXRvTKkMKFopPFpvB9I55iiXugYoNQ
	 bHDNaTwpK+hCTQByXhpt3lS2W3Xa0Z0Nb4ZFYRPvg0MRPFDokzjIJXxMtYYtylnPeR
	 mePC5Uif8UpiA==
Date: Mon, 15 Sep 2025 00:30:37 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
cc: paul.walmsley@sifive.com
Subject: [PATCH] MAINTAINERS: Update Paul Walmsley's E-mail address
Message-ID: <4a3d959d-56ea-36d8-029d-141e7820279d@kernel.org>
MIME-Version: 1.0
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


My experiment with using corporate Gmail for Linux kernel list
interaction has come to an end.  For my MAINTAINERS entries that
use that E-mail address, let's switch those to use the k.org E-mail
forwarding.

Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
Signed-off-by: Paul Walmsley <pjw@kernel.org>
---

Unless someone else prefers to take this, I'll plan to send this through 
the RISC-V pull requests.

 MAINTAINERS | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6dcfbd11efef..ca31f34ca79b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1772,7 +1772,7 @@ F:	drivers/staging/iio/*/ad*
 X:	drivers/iio/*/adjd*
 
 ANALOGBITS PLL LIBRARIES
-M:	Paul Walmsley <paul.walmsley@sifive.com>
+M:	Paul Walmsley <pjw@kernel.org>
 M:	Samuel Holland <samuel.holland@sifive.com>
 S:	Supported
 F:	drivers/clk/analogbits/*
@@ -19292,7 +19292,7 @@ S:	Maintained
 F:	drivers/pci/controller/dwc/*layerscape*
 
 PCI DRIVER FOR FU740
-M:	Paul Walmsley <paul.walmsley@sifive.com>
+M:	Paul Walmsley <pjw@kernel.org>
 M:	Greentime Hu <greentime.hu@sifive.com>
 M:	Samuel Holland <samuel.holland@sifive.com>
 L:	linux-pci@vger.kernel.org
@@ -21652,7 +21652,7 @@ F:	Documentation/devicetree/bindings/timer/andestech,plmt0.yaml
 F:	arch/riscv/boot/dts/andes/
 
 RISC-V ARCHITECTURE
-M:	Paul Walmsley <paul.walmsley@sifive.com>
+M:	Paul Walmsley <pjw@kernel.org>
 M:	Palmer Dabbelt <palmer@dabbelt.com>
 M:	Albert Ou <aou@eecs.berkeley.edu>
 R:	Alexandre Ghiti <alex@ghiti.fr>
@@ -23103,7 +23103,7 @@ S:	Maintained
 F:	drivers/watchdog/simatic-ipc-wdt.c
 
 SIFIVE DRIVERS
-M:	Paul Walmsley <paul.walmsley@sifive.com>
+M:	Paul Walmsley <pjw@kernel.org>
 M:	Samuel Holland <samuel.holland@sifive.com>
 L:	linux-riscv@lists.infradead.org
 S:	Supported
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
