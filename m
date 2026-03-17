Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CC64F3380B
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Mar 2026 07:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oNeuW6tz028BpJOk6xY3g4gNFOyjRlHvg+m1jwj8Nsc=; b=hce9zCZ/xRdY/3
	zgpQVC4Z9+2n46VR8QOYrbuxtn6MXZwwSg+hH7/8GM2RzyevjFpghmplQdKKDP1M3NdxDehfYaX/A
	tu5Dc+HWnzUHotASgB/ZD/VL4SB/ToIo6MgeG+AIyHEkcueTXPqudYf4r3IDDMiNQppCIQKbVQ4Mq
	YdJNSZzNr7yFX9N9zVx+L5z/1ZVuH/sh2zGikzjLhjiVALxP1TdhZoWlq55iuOL0tqioo+V8v3pks
	jUQXASf0PEUuSNl9nMpSZokIB/Wxt9lDLqK3yfJ6DOyYE5Sln8A7RsBuAhNAwyBexfx+X8z3uo8Jp
	C9/RsYMW+lFFNA9wQOig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2PIa-00000005fWQ-2zyI;
	Tue, 17 Mar 2026 07:57:08 +0000
Received: from smtpbgjp3.qq.com ([54.92.39.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2PIX-00000005fV0-1q0c
	for linux-riscv@lists.infradead.org;
	Tue, 17 Mar 2026 07:57:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1773734166;
	bh=2x3H1s4Sa0yhs6+gMgWwNOfaEbRWoZBFTbfGwSBZafY=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=dYbF7Q6nb2cc/qoUejdBXiUr+41s4aTx1d4OvdkboUsVEEI4jpsqTOOWd20XtZfI4
	 SrlrZDSTxgc1Hbbzw90cHcBHe/jAk1KtqcAJ1KIDbAQHM9LiCNCZ2Ep+3kn+RfJ7Yn
	 Ugvr4H87aaVuxnntqJnvPheTFWZoz1ubzwd7g+rk=
X-QQ-mid: esmtpgz14t1773734164td4b9ac16
X-QQ-Originating-IP: M88vjTllWXtDO6TtolrovEckKrAGjRt6n+l2s8Qou0g=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 17 Mar 2026 15:56:01 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16495269182346670904
EX-QQ-RecipientCnt: 13
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Tue, 17 Mar 2026 15:55:58 +0800
Subject: [PATCH] riscv: dts: spacemit: Add PDMA controller node for K3 SoC
MIME-Version: 1.0
Message-Id: <20260317-k3-pdma-v1-1-f39d3e97b53a@linux.spacemit.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDY0Nz3Wxj3YKU3ERd82RDc2MTE2NDE2MzJaDqgqLUtMwKsEnRsbW1AGc
 2xwxZAAAA
X-Change-ID: 20260317-k3-pdma-7c1734431436
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773734161; l=1958;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=88z24i4Mu4dMX0+3MiP08K4JRaNoaZcAVvLBU8NrdgM=;
 b=Y+IAEWOo3h4hOK1f8C70fhGXYsB4h9Xx8sqUos0crU5miTr+1bZ1OxlGMdybE07C1Vd2OpstJ
 4wWif//EQX8A6wH/vL1rtXbCBp3niqfCWVk+0H2ZX2YGj5rR23c8EwR
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Oe4bhvFplmDXywCtraLnPVnfRIOs167xFFlvtE7uIQdyZugF9l+/08bQ
	NV4k/uT5ta8i4YXTKskAZN2qkptO59mnJJh6nsOiQteun6B3OMxI46nVxlBEV+okMXt3ka7
	w2EoXoc11XZ0uS+X9Yd0SkKEtRki0yXM4c4q7y3L5+pyKHW1fXy356035Lh325MW1uMgXq+
	imMYw8f6r+OsguluXjNu8RJf8B6Y3lPcwd4ak434dKM+Gl/FIFEkJHmmtVLkCWDzdwMsYRY
	OJiJn+9TtcMBqeVOU+aaprkd3rvMHQ0ESvYK+tMMHOIxOEHPvMZGVH/6ohsn1oJ6Q3Qsj72
	szJMtfiBstItxmHx9X9RR+WComGAnQAN1PkbLc/7oAjNLamy2GmFp7tNYDCH99D50GaK2MZ
	OVahCdYbxc7ek1BfH2UunLcwMugWLsOkTcgrjY5VF1hTfwgyLX0PBmAZJhXL/XKZ+Rzr1+3
	+gQnT2jv71EQKoQ6vK0BKUxWdEtj6ulV+s1y0tlqxos7PVlJvrFX9sBi1Vjcikotr6R6Ppr
	NG3XvCOzTEXuZIzxKIi0kQMAMtM5jlojOJsdKfmoxdU1mvOEsLKcFjOfb1kx+weaViARrGt
	z6696u7qzoJYIaglEYECb9Bh5gW/5viUBzGK19NLynxU/woW6kIeZM1EiH/2X2VNM6kq00v
	/MGq1EMTSjDY3xMxbqGa10OKAb36dNOoVxfhntaYwjqrwGwY89H/cXzuSQpvk2Ec2X0wROU
	cGIWpyLtLqZYIiFg2YVRiJHZ4VG3mQ+nbyGfprvhmzqW6lP6OumP9XilMsousHFyGI3sbkr
	PpTjSAVPr43/XNfAHcXnoB43ZOvTCL62sM33IZI0NRnApOm1ZqfAR3gBn5YH01J3I8ehvvn
	MiCVz2ptj6nwKBfguJuEFvPX8NCtJzOm9IjlnC6oGugSzGfkZIwNjkmM9R/bhtZBWzu3v/5
	dSgHNvvhT5N8JiAcHJa+aNzVbxvzbD62FlRSL0Nc4tF36CTginaaUdByZR1M8NqU7c1XrOs
	R1EfkiLLgEerSObo1++SzEsc/elp1E/MeN1yTrBPJ7jpVBU7PGiaRWU1rojm8u8F9ENoiKc
	ST6daC9H0KUXHfDV4IViwKmNcYO0PLvcWQUO5vHYHvf22mT348CCica89Rr3EKa8fO9O4UC
	zJgx7wSSwgzupQ/eDPk8QVZ73A==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_005705_753137_27969DC1 
X-CRM114-Status: UNSURE (   8.51  )
X-CRM114-Notice: Please train this message.
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

Add the Peripheral DMA (PDMA) controller node for the SpacemiT K3 SoC.
The PDMA controller provides general-purpose DMA capabilities for various
peripheral devices across the system to offload CPU data transfers.

Unlike the previous K1 SoC, where some DMA masters had memory addressing
limitations (e.g. restricted to the 0-4GB space) requiring a dedicated dma-bus
with dma-ranges to restrict memory allocations, the K3 DMA masters have
full memory addressing capabilities. Therefore, the PDMA node is now
instantiated directly under the main soc bus.

This configuration defines the essential hardware properties:
- Register base address and size
- High-level triggered interrupt
- Associated APMU clock and reset controls
- 16 hardware DMA channels

The node is disabled by default and should be enabled by specific
board device trees as needed.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 arch/riscv/boot/dts/spacemit/k3.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index a3a8ceddabec..f90d34a81be0 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -438,6 +438,17 @@ soc: soc {
 		dma-noncoherent;
 		ranges;
 
+		pdma: dma-controller@d4000000 {
+			compatible = "spacemit,k1-pdma";
+			reg = <0x0 0xd4000000 0x0 0x4000>;
+			clocks = <&syscon_apmu CLK_APMU_DMA>;
+			resets = <&syscon_apmu RESET_APMU_DMA>;
+			interrupts = <72 IRQ_TYPE_LEVEL_HIGH>;
+			dma-channels = <16>;
+			#dma-cells = <1>;
+			status = "disabled";
+		};
+
 		syscon_apbc: system-controller@d4015000 {
 			compatible = "spacemit,k3-syscon-apbc";
 			reg = <0x0 0xd4015000 0x0 0x1000>;

---
base-commit: 95c541ddfb0815a0ea8477af778bb13bb075079a
change-id: 20260317-k3-pdma-7c1734431436

Best regards,
-- 
Troy Mitchell <troy.mitchell@linux.spacemit.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
