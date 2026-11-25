Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CAD606A32C
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 01:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sS4KxNQk;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=yUNz9xZj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=M3xuN4H0HiGAT7nYwNzgYuHP/pMhLU9tpTbQpNQqv5A=; b=sS4KxNQkG7XCubBtxTxMF3zh8U
	EJDAhsrlvFHGR7QVbKA+53GgoJs4kNu0jOAv2P3+GB86pQ93O8VYVz2KVWE+UUVq1o9AIx3itO5HO
	FsXxMINsncBTYl2nKRISHqvfAg37OKBnNBo6NHd8f/8mfz+6qXoIG1Z7nbXZl10pSntX2YCASaE/d
	tRuZ1UX6Rd4c+iLnzM+zg4B4p0R+a9TaWROIDBn6bJbjPdO3+aoZs4m/OIJC5sEwujVT37vZENjND
	f127TdQYzOeVABzu1Uqn63E3y9fsYrH8d2IyTNs2HRES3KFpI5ugiN4OwcJT5/Iu1fI61PkMDdgbv
	PJUCZpcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW1yU-00000008C4U-3jUB;
	Wed, 25 Nov 2026 01:39:06 +0000
Received: from smtpbgbr2.qq.com ([54.207.22.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW1yS-00000008Bzz-0mXl
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 01:39:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1795570732;
	bh=TtZ7L+0FStK3cBA/dvaUkjGUZLnkhoPuIPbQ7OTOy9M=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=yUNz9xZj7pPkWYG0E/LmZHN/ACd5ZFyCRqHUPpMJP0gOCcdCyxawPWNaq25YvTbp3
	 UdG3GUJynDH2UauYSGbBIm7ShjlMIji6IdtTHE7f1M5Z8xo0pA809NZxJrxOcHZPLV
	 5VcLRFZHT/hPrK4Y4QuWWPAvb+i8MmiuwPoO9g+s=
X-QQ-mid: zesmtpsz5t1795570731t1cfbf41c
X-QQ-Originating-IP: qm6/nQPQx3/pNPSzdBkdp0oaDuY6kR+5dIbu/pTJ9oA=
Received: from = ( [183.48.244.245])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 25 Nov 2026 09:38:47 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8991991900957459394
EX-QQ-RecipientCnt: 16
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Wed, 25 Nov 2026 01:38:23 +0000
Subject: [PATCH v3 4/5] riscv: dts: spacemit: Add the K3 APB timer
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261125-spacemit-soc-timer-v3-4-e6390f3ae4a6@linux.spacemit.com>
References: <20261125-spacemit-soc-timer-v3-0-e6390f3ae4a6@linux.spacemit.com>
In-Reply-To: <20261125-spacemit-soc-timer-v3-0-e6390f3ae4a6@linux.spacemit.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1383;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=Lakketge+7u3TGaLDJYVC3ImXbq0o9pWuFTAwlnXYmc=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDNlsNqLLYn01Encp7nYufRgnJOm22T1A7vHzqR4CVnOey
 24/k/Sro5SFQYyLQVZMkaX7Ac+2Ap8o2wKBQl+YOaxMIEMYuDgFYCJXyxn+8MSosz5ctpZp997s
 Hbeyg3ln/X/KIer8ctLCEO9bCZ1BYQz/LD7+tWHTfWWoOEX8orpHySTB1qzTKe9PSDAH99hcTVz
 OCwA=
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NsKw77UaNFtDDD8E2C/5ISDFDXF7k3GigFhCEvYy0va/ahtyjHSS9b1G
	EdW3YJuKO2wA++hEdm8J8/uE7eJ9CPmAGS+M6r0C7QDn8idcV4axiDW7VA6qyLMGlQRixbJ
	psTGRNOJcueJHMJrHVtTQtBPoKGJqawEKpxF3oGR9WJx1z4lIyOap8MdPGcw4jPhmpOfop4
	SlZgpWiTLWyVAneHS/HGJnfmnjj1j4P8XUrgaDaap6kqKae5ykDW/XDqnLcnCUexEoPtQvN
	786L0Iip1RLJl3G5b9x1LGmVb/QacHQ3GrBlgjhoJb85mpLUwEYNMYiEHzOMRUMLLRsc0Ac
	jtxHKw59YXhd9TVDEf5OWfTXuULxkIhF64Fk5C2vsaSUt0V9gYR/WRU/Kk5lmshfAj8yb/w
	Wol9IGtYbxmOM3UY+aMG03/2t4aFG5/oJnQ6UvhoVB2lS0F6JgAMFQ7vQGv7J5I/EcZmT+f
	SNZ/MkqTrk6Cxp50mKsFG9tLjdJIQeXEpYeb6p/HGbYgQqRZSTdUTQj5oU9gzUEbRwZKgNO
	V/rtl2JKIpnUMvIKwX64xTqCkamc8NW4GO1RkSDqLbavvUhB4JF8AhckVjpkKaz+B9d3XVO
	8DlVVGMY2BdbAfe/2GnCSJloiDgIe5TvSKHk/+pTgxBuJsTtH+veppj2O4FXmB4ua6V/aqs
	EdX1HFenZDOYvrURXDEhT5QGC3M++yBfcAzTOd5f2hFoRtEy4QT77BWL/NVHKuVrMeo3c2w
	3GgpNYveVWsJVfiv7NjQj2hPgtdz8lThQIxuw7D4QWOLPCNBz4OYCQFyctMf/0B/rhF8FXA
	/yBZK+mgkt1U5Klb4jgbz57EJFpPhW6TPtB91b6IU3aCq0nBibWSO76ajbLCtp3hZVbSjVT
	CMmyiuiH+gyaLxt3g1yI6AzbhmiwXo2nPUWO5CR2soOGycxhokOLCk4Ro3CVPMecT/eTMch
	pQ/V2oxhO1axO6mTwv8O2x/ZkDZPQcjiAd3ahVy329/sgBdf7z3mluL+TDW5xyqtyZ8Qgdk
	lCchODi/bQY29oFOzO2dybcwK8m40ZCgrCV7UsuibJV/n2QUqPtjJnXj7IcHO3uCSxFyWUp
	bFTeUkWD0wayTq1wEkX4GsUtegKMEGpxNAINEeP6ZtM
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_173905_039359_5E4E238D 
X-CRM114-Status: UNSURE (   8.55  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Describe the APB timer at 0xd4016000 and its counter 0 interrupt so it can
provide a shared clockevent. Select the oscillator-derived 1 MHz input
and connect the functional clock, bus clock and reset.

The register interface is compatible with K1, so use the K1 fallback
following the K3 compatible.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 arch/riscv/boot/dts/spacemit/k3.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index e89d2cc5ca8c..cee313232c11 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -777,6 +777,18 @@ syscon_apbc: system-controller@d4015000 {
 			#reset-cells = <1>;
 		};
 
+		timer1: timer@d4016000 {
+			compatible = "spacemit,k3-timer", "spacemit,k1-timer";
+			reg = <0x0 0xd4016000 0x0 0x100>;
+			interrupts = <26 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&syscon_apbc CLK_APBC_TIMERS1>,
+				 <&syscon_apbc CLK_APBC_TIMERS1_BUS>;
+			clock-names = "func", "bus";
+			assigned-clocks = <&syscon_apbc CLK_APBC_TIMERS1>;
+			assigned-clock-rates = <1000000>;
+			resets = <&syscon_apbc RESET_APBC_TIMERS1>;
+		};
+
 		uart0: serial@d4017000 {
 			compatible = "spacemit,k3-uart", "intel,xscale-uart";
 			reg = <0x0 0xd4017000 0x0 0x100>;

-- 
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
