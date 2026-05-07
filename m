Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF7FFCD3442
	for <linux-riscv@archiver.kernel.org>; Thu,  7 May 2026 10:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=54l+kxDKvN/eXtm4xG86lZv6Ly8fK+rFlPmm0QFxVA8=; b=wwa8CtOe5QLNRB
	Vk829ALwa1g71EJG7rp/4oM75dMyFKX7bzZFdDBIWXWEuELqrGvG9HTf4kdnCtXpTEFPGZgGpr1Cw
	0cOvM3w/c0Nh5f9gIg/KSndBwMohMzSGnv2mxt8vOwH+XIHaQLK+SZf1lC+1toR7JEMAZA6OcgBGI
	7l1LN7TW6henvUOYBsFk7DoL1+I/PbhfTnK6D9ZwuRxk4H/0DViCKrO2qXLY0L8BYBfnOVZRn86Im
	xFPb8jgdXU5BM8cfunY6XYdJNdpk248OywgOfXiL5cowQOu3/qmq/gcZFltJ0Di2pZD0rcJZXh3DN
	facWOOhsPhp1IN+XL0Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKw6K-00000003VET-3AQP;
	Thu, 07 May 2026 10:37:04 +0000
Received: from bg5.exmail.qq.com ([43.154.209.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKw6H-00000003VCQ-2vZq
	for linux-riscv@lists.infradead.org;
	Thu, 07 May 2026 10:37:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1778150208;
	bh=q9cTs1Fc6HOosuoCIVUk0fjsfQdYZlWk0msB6oMaeBI=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=e7qjP51oHFqRhM0QkFGh+yVFuQXuHYS/MZTI7rNgDX7WzyXFfBXvP1FVjaOJGfS0b
	 8ZuHQGOub1EuFeNeSKPFcM95juzlpm//abi2r9IVvkFwVv552HhBgIG07S1yS6r8cv
	 /K4pFKcnr2LRqFQizTAQ3INypZ2Wdjlq1xOv26Vs=
X-QQ-mid: esmtpgz11t1778150206t5ab20be1
X-QQ-Originating-IP: psN/mL0pLniw6V4U8YI/jaEoUJmf9vKAuNcqWpa3BiI=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 07 May 2026 18:36:43 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11507075083800382789
EX-QQ-RecipientCnt: 20
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 07 May 2026 18:36:23 +0800
Subject: [PATCH v5 4/4] riscv: dts: spacemit: Add PDMA controller node for
 K3 SoC
MIME-Version: 1.0
Message-Id: <20260507-k3-pdma-v5-4-6b9743038026@linux.spacemit.com>
References: <20260507-k3-pdma-v5-0-6b9743038026@linux.spacemit.com>
In-Reply-To: <20260507-k3-pdma-v5-0-6b9743038026@linux.spacemit.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Guodong Xu <guodong@riscstar.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778150183; l=1492;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=UcgnyaWra/zqeOQob/WjOC8W7jbkn7uDsfsNgx6yk+o=;
 b=XOc0zZRuiXiBiZoN2eVYgNvG3zHP41yewOpJ76kQpJJtDH8H28Wf+lkzyIPnXBRVNdV2Q9uMT
 epKrIm+hSloDkYlvvqetMTtp6dk8M/N/b+DYHGRXVv0cxMCmuaovu3m
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MIebQsVGgJ8BS+4hYmiMYCQMGhxTjaYjN9XeuWqmA9lLr8hvfycLy2zG
	zSYsrg6Yu2lejAIOD0BGXcsBDZ1zKwmNVqw1KodWzUEudn6J2tZhylzFy3JZrnP+8w2haTm
	Nan/P7xKVSI6OnSWQUthlsinQzYzWKlINUGqFkBFvQYD1Bm/7+OFWJffblUuOdk61ZcJcA0
	T1JzApaicm/DM0Wf+pol+BxCr8iQOj1aCBuQmDXHJnrS7VNU4vHx9C/Nwr/7QyFOydAxMQB
	q644KaG37WsqWK39aSzhsEj9BwUQlp77V8kPJebGfAAWY4OW1mwjCeCYOo1f5R1tfRz0IgV
	cPrtqMCchLMzAHSDrfzKYgpns8/aZAdRlCaA68NiE98s3Pz0ZO7YF0myzJ2tqNCHF0Rg66Z
	s+cb7vKNkm2Xqe/ZmSHj5IiINyK8QzO4UeW0u/7CLFcK6opUPSlClMFaWtb+X4KrL7zQZaN
	qtoVXAPGeCHF48ikq/PPT/vWA6VJ/1dXPM+9WSfRaMRWEKuw8gyfWhv1hErhkRcao1UUUcr
	UcaR7I+ZpTX9fluZ8pKarkDpq4mVwB51Ajj9cWfeyRk6X8N/4PQjN08T1LJXkAHXW3NwGbl
	9fXwn6a4/94xPWAFQzsgvv9MmuQXGxRgO9AsJPdILltZ+qU3v9yYWyQ7tBa15t+Bu1vzBua
	bIC7+4YwIWG2kzXLsJSH6j2tY+V4pu8O2Pcay8kL7rXMyGO3U6IqUiudWmjbPcSX03DXlMu
	JTj//pKuJOVU/uG9TVlMBEsxxEsygjgX+zQ/DD2Uxz1K/seCunmjh0JJ3+GwpcjAJErz5dn
	vXNN6LuFWvnhsf4420U8SFoVQpbAGdqNR0ihPaZ67cZymGNNYgPy/KEry+GChjCKy+xLQsg
	HASrImQX7iUH1J0gDS4dR9O9FcCVPLC5dimHC0aQbHuWSj8qh1ogB1OwDl/LKVSPI9zyJ6K
	GwyzZof/AYs1Jq6y3RhiLMZx2qbS6k5tyYeJPXJ9h10CMEIXbaCwxyCHJzkyc3uts3+XDMo
	izcvPDZuRzgDUbcMUA215mKoIE5ONFBdWKaatz6F+bQJCacYIX/QAdNq1CmBXSXIfam/lKl
	ND3Pm7Wu4/FCsoDP9JpaFPxGTIMzW+ZRppe4MMB82VS2Kb1p/hz0okKmAwn7RPkpnt5KhD9
	kBiF7bSygrlazL3roVKXLSOrKjfp1yCff76d
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_033702_044597_15434515 
X-CRM114-Status: UNSURE (   7.93  )
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

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 arch/riscv/boot/dts/spacemit/k3.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index a3a8ceddabec..cd321975fc18 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -438,6 +438,17 @@ soc: soc {
 		dma-noncoherent;
 		ranges;
 
+		pdma: dma-controller@d4000000 {
+			compatible = "spacemit,k3-pdma";
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

-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
