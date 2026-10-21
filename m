Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB8560A4ACD
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 19:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Gv12jazW;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KXDP70QL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MY6LeRdC0ZvSlZ7wWUkJrKGTpT74rEzr3QRTozLkllk=; b=Gv12jazWFeACO5
	CwL2hyqI0PT0GGOIQO75ivLwvjelfwF2tjZ09E39FvC+4gCj1fIj8ftXjJOKiK4dagVnFpl0fG/z7
	N5zOpvqCKdlUEoU4KFOddhNw1DAfzLmV3ECmGkft/r26n7CA4ZFq94tIOmLmvvk/lsu/IQQrYGdGn
	MCK/62MRLiiuGFKHt1qhpESWySeJUlNE4+Aw72OTXBqc3ocwRCknZOKOfHLgMD5PC3yS/V0VegOca
	rLLwRkJStoS2J849FBURlgdFgP5XqQCKQzXjb0hT9COaDblgL5E2vJA8GHdNB8n2sRBru753FTod9
	K+k1Xu3oip3CShLCGu2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJcNV-0000000Cmgp-3WD1;
	Wed, 21 Oct 2026 19:53:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJcNR-0000000Cmbw-1xjA
	for linux-riscv@lists.infradead.org;
	Wed, 21 Oct 2026 19:53:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2F01241A00;
	Wed, 21 Oct 2026 19:53:33 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792612413;
	b=mH0zlaght/GTiw18+aNKzYOvmZvUYi8z6xMim57Fgaw+yHiyvd2BaU1tqLVfkVJHj/5C
	 rq028ua4wjdlhuEm+a5D/AtDNoZFB8/O4GIwdfTZELfSI/MtIZSzTYURl19Ug/q4XeNVt
	 vWCFat6lN96cS/QW1Nw/7xGEgeTCRZ50WF1jZoaCDPHzas1IsYu4swXgbeomlGluRPUrf
	 Tj8aMbMQ3wgThiMKpoKtcIL9EMiGR+3Xyfx9pTTlkhh3ub1XqMIj4UlHPkVcf7wyV14ZU
	 CxwYlsUBIyo74KrLFTNLHtKFJOoK3rTZcxNQbxFm1x5vgjMrRzUs/g0zY1Qe0b642SQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792612413;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=0vkUTGj7ykL7XElJOAN2G/XIumpVE8CGAihKJjHC6lc=;
	b=bJGrlUgH63XUe2LCRsnrBcPqBPNZjuwBG1JOVKWdkF2CywgIWPeF0XTHCKrLok7X7E+m
	 7g5GQBoRXqgtjUmv048w2WegVNAS14RmYllq3tqTN0WUnIjP1pav6RjNJv8+qsNXc5l7E
	 acfv4qilgIE/ixBXfYjRGS5PMCM/ikC5zG11jrS7q7huSvLLEr9l+lnqzVLe4q2pvoVWl
	 XXorp6DA9D2CMKq7ked+mEMQ5H9PsMnMe4klZe2htaEiYvLKQrF725RcBdlXAOFXDAn/t
	 1mklmZFis0mZDzgLa5qbMZI/ZAjbGPFhdRRPQ3NE7Ct8sYR3d60e9ZPTZeeNRFuMKzg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6CC471F01577;
	Wed, 21 Oct 2026 19:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792612413;
	bh=0vkUTGj7ykL7XElJOAN2G/XIumpVE8CGAihKJjHC6lc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=KXDP70QLm/eT7Uj/zet7JSLsgYZ9WzeYhpqYVkhd/sKiZWoWq23/RdpnqdTk4vr1h
	 l5e+n5K5U3h5nCaN/Wu4f6X8b5ioHjrEMIWrxbffYCa3xvNXm0Wz5iNq4TKwzMqMof
	 vd8SAsHkm/xkRVm0MVxH7G+y2WloD7OOQOPSpz5fhbUwGT6Ma7DnEyrnb309YNdFgi
	 oWV3eCFo9cF5y4VfvS/qJokJ/Gz3H0LoO1riAX1vFL40ZM4pq4VbBE/lK+07HQeeWx
	 bqn3XMmUtUScdXbLTUzEIMa+yMpyurbLOZddFuGQzZ90qBg6gOb+lw00yZz8aGD77g
	 87RdBUXvaDnkg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 7BBD943470;
	Wed, 21 Oct 2026 19:53:26 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Thu, 22 Oct 2026 03:53:38 +0800
Subject: [PATCH 18/18] MAINTAINERS: add Zhihe A210
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261022-a210-init-v1-18-5e438f972d24@iscas.ac.cn>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792612403; l=1169;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=V6Z8Ev0gcQ0r2yYs+mWTjEjLznl2g2dwdtHJ63ANCKs=;
 b=Di15BnB3X6xsFswYVjWNhBkyYaNeNMuez9huqeW+b4XDKwnUSTspd8HoIu5BpCglT0b/YU6U4
 ZSBAXy9IWawBK0XdUTZlacSXjqQQPeKd/61Hz25Zh6gEFreOUZghqV3
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

From: Han Gao <gaohan@iscas.ac.cn>

Add Zhiguo Zhu and Han Gao as A210 maintainers.

Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 MAINTAINERS | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 782389bd5cd3..97cf956fd632 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -30115,6 +30115,22 @@ L:	linux-kernel@vger.kernel.org
 S:	Maintained
 F:	arch/x86/kernel/cpu/zhaoxin.c
 
+ZHIHE A210 SOC SUPPORT
+M:	Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>
+M:	Han Gao <gaohan@iscas.ac.cn>
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/clock/zhihe,a210-*.yaml
+F:	Documentation/devicetree/bindings/pinctrl/zhihe,a210-pinctrl.yaml
+F:	Documentation/devicetree/bindings/reset/zhihe,a210-reset.yaml
+F:	Documentation/devicetree/bindings/riscv/zhihe.yaml
+F:	arch/riscv/boot/dts/zhihe/
+F:	drivers/clk/zhihe/
+F:	drivers/pinctrl/pinctrl-a210.c
+F:	drivers/reset/reset-a210.c
+F:	include/dt-bindings/clock/zhihe,a210-*.h
+F:	include/dt-bindings/reset/zhihe,a210-resets.h
+
 ZONED BLOCK DEVICE (BLOCK LAYER)
 M:	Damien Le Moal <dlemoal@kernel.org>
 L:	linux-block@vger.kernel.org

-- 
2.55.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
