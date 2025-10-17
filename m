Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA153CCD199
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 05:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tdQ6K5qXhEUmqv3OH1EF4PTMDFkB6PyNVHpXDbUQ0Do=; b=nhRBB6LQCE5jjQ
	Kb3UYdypBvBovzxPUdaSlhUVdaWFu0GRCxPFn590T/2ghylba6uNk6jYXjvZ0glG78MgHkcNyqppJ
	x0geVO/PONxsE04x5tUYGmKMQ2+MSRJI9weWR8WbOEja1o1mzQwsRGbrG57QcVruL1i2lq64wWseM
	Nl9MbX2NpAv15IrYdqE++LojS4goWa9JQ/ze1fBf/U2L+x3YE18c0qXU4PgBISpgOgBu0KPRVeAj6
	oETbMsP1/j2RYpoxl8/Ce8Rvc/QKiB+I2/CCWFOraKp21wBokPk+Zn3DHqxPEwsN66mi1GYjk97lY
	2NV0jJBHrEwBVvDWiSbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9dPs-00000006fOi-2Xfp;
	Fri, 17 Oct 2025 05:54:16 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9dPp-00000006fIr-1mk7
	for linux-riscv@lists.infradead.org;
	Fri, 17 Oct 2025 05:54:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1760680397;
	bh=XsTLhqCdKDoQzfpCqi+OYz0Cka5ZsvI3BAFjhZzu0Ys=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=OvMH3xFKGWJZPiukGVPBFGevGjxpMBLeHnPeiTtLA6vH6BSQ2WFxvAT3GmSjQnBjZ
	 /GUGuFaO46pKxYautnqoDP5186VpSiBFu8d2fGqZRw7NBQqbrA5Y0T0et5FoS8rqFL
	 T7F85WDR69a0LiSUBzU73aBF2kaTKAomemnbaYys=
X-QQ-mid: zesmtpgz7t1760680395t7c42356c
X-QQ-Originating-IP: i/pMjErODknrB2ZwyCDEP9eFiO76Pcsvza8xazFbIfg=
Received: from = ( [14.123.253.52])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 17 Oct 2025 13:53:12 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6053374135582174828
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Fri, 17 Oct 2025 13:52:25 +0800
Subject: [PATCH v3 1/2] dt-bindings: riscv: spacemit: add MusePi Pro board
MIME-Version: 1.0
Message-Id: <20251017-k1-musepi-pro-dts-v3-1-40b05491699f@linux.spacemit.com>
References: <20251017-k1-musepi-pro-dts-v3-0-40b05491699f@linux.spacemit.com>
In-Reply-To: <20251017-k1-musepi-pro-dts-v3-0-40b05491699f@linux.spacemit.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yangyu Chen <cyy@cyyself.name>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760680388; l=2753;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=ggfldOZp6UqSPiWVLfdG2BN5nof3l2DKdbnArSTVoxw=;
 b=U91dtEZUz4Wvsoh2IA6c9a85w7dKye38+YtHxSDPuOKC8QvVm9TXO2U0mCS71DhTLBIt1isSJ
 jsL0vTMT/zvBq5td0hDVIFsVQkfiuJrU6oJx6kR/3mDJzpZxd6+wgxY
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NSCZCmIek7U1Bc3VkrgR4EhOwCyxErPV94II61O7tZB4XWpfdp0Ec6R4
	I2vrs4rppgp7SWEhG+GQwAJRx6+QzLGcoC86gXCAR2MB+7XhfrgBxZnk5+QyIXjkrgElFFE
	kRatMkTPTMCN0OppfLZYO4IOXmVi8Z8UKFQnR63CUmBTqt2lfbKSYPKF+G7g9tQX7118qMj
	3jwzJBIFnnbYRIWzcap3JWFpjacUVVambUYPujI1PJfor2EksYlU1RO1cTCQrcPEFA+V7xl
	I4tWqk4pBpXN4mlRRRweXHS4nwHBwhIn9FP3CSHSiiSE//5wGIxxvZ5r6stcPbkAzSkGdTJ
	QuAlRVfckhSZsVIYWpPPY7Gar4pDFQhJrpSqiKY7jeJkTuGyuKLEuHlzXxTWYVpwTN/iClB
	TPhYbElC1vqRLkfRvYkbZuPirXlmX8bmBxyidr3KdGZp+WW5kuMDYqMNCLgT8izTyIyaTR3
	+ShvnSmM/IwhLbGKx/25puTa/xJxcQhjwGCyQECCe9cAjrbpE3d9lOt8ZCWfNuOu+eehjkd
	DONqp1996XV2G/uVvUiGA1Qs+Zoyq1wxGJg87mUdDMBRA0pXR6i69HiolFGGVB4dv0gGZWW
	vdOViPhVQfeeHCsD6ZPguDN5wxzFzdcKElUWVwWwQ7hU0FRNhrw+geNHVwYZ5OiNCczYBZi
	WGiz5g+pWYh0qXgARuEZ6TuKR9Nq19PSJSyV+MrIv5enUycTqgfvmnsBLTT3HunXji5cDWh
	eRkgR+UbxfzKgih8s2uUt4HtG7KrhFm6oJU9WujmbUwZ1cLEYWTKHZnY8nQzA6K8jFUPoeE
	zcyDNtRkrKwNsvl8/lpq/D8xwBdyD1xhhtbH/1gLjhXbZpi52vQ0fgX9YVxXRB6LO5Y8csS
	+QDJ0w0nSx5NrewBO4t0bkL/w3FRDhpL4Gtlp+j2RHEZAK9PsS7pClFPhKj4QWlZy/TWssg
	S6nMWP/IJdaScQ0GAoUmpaf0D9vrEhgVkc68UABO+A0al5g6lYXD/KHjZJHQFpx0yuOvgYM
	qMNEGKndANSH/7jCFo06fSoJhkptFD0tiICHJ5CNV6c0SOCFo9sN15Z18G4LQ8UixdhIOcW
	NU7ixOYreT5aI3fow6V4zlNVsEXIpLt572Kyvo1FFxV57OMgwAY+Fifo0i6QYMk3OgtKD5u
	eI4ZapgPOhN6zoe3zBGYbgkueYkXvTF4IC7w
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_225414_031863_3C27C959 
X-CRM114-Status: UNSURE (   8.64  )
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

Document the compatible string for the MusePi Pro [1]. It is a 1.8-inch
single board computer based on the SpacemiT K1/M1 RISC-V SoC [2].

Here's a refined list of its core features for consideration:
  - SoC: SpacemiT M1/K1, 8-core 64-bit RISC-V with 2.0 TOPS AI power.
         This suggests potential for light AI/ML workloads on-device.
  - Memory: LPDDR4X @ 2400MT/s, available in 8GB & 16GB options.
            Sufficient for various workloads.
  - Storage: Onboard eMMC 5.1 (64GB/128GB options). M.2 M-Key for NVMe
             SSD (2230 size), and a microSD slot (UHS-II) for expansion.
             Good variety for boot and data.
  - Display: HDMI 1.4 (1080P@60Hz) and 2-lane MIPI DSI FPC (1080P@60Hz).
             Standard display options.
  - Connectivity: Onboard Wi-Fi 6 & Bluetooth 5.2. A single Gigabit
                  Ethernet port (RJ45). Given the stated markets,
                  this should cover basic networking.
  - USB: 4x USB 3.0 Type-A (host) and 1x USB 2.0 Type-C (device/OTG).
         Decent host capabilities.
  - Expansion: Full-size miniPCIe slot for assorted modules
               (4G/5G, wireless etc.). A second M.2 M-Key (2230) for more
               general PCIe devices (SSD, PCIe-to-SATA, comm boards).
  - GPIO: Standard 40-pin GPIO interface, as expected for an SBC.
  - MIPI: Includes 1x 4-lane MIPI CSI FPC and 2x MIPI DSI FPC interfaces
          for cameras and displays.
  - Clock: Onboard RTC with battery support.

Link: https://developer.spacemit.com/documentation?token=YJtdwnvvViPVcmkoPDpcvwfVnrh&type=pdf [1]
Link: https://www.spacemit.com/en/key-stone-k1 [2]

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Changelog in v3:
- nothing
- Link to v2: https://lore.kernel.org/all/20251010-k1-musepi-pro-dts-v2-1-6e1b491f6f3e@linux.spacemit.com/

Changelog in v2:
- modify commit message
- Link to v1: https://lore.kernel.org/all/20250928-k1-musepi-pro-dts-v1-1-5efcca0ce3ae@linux.spacemit.com/
---
 Documentation/devicetree/bindings/riscv/spacemit.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/spacemit.yaml b/Documentation/devicetree/bindings/riscv/spacemit.yaml
index c56b62a6299ac24d3cdef7edcdfc407dc62a1846..52fe39296031f21d1c28c4f1ea5ca9fe28caf45a 100644
--- a/Documentation/devicetree/bindings/riscv/spacemit.yaml
+++ b/Documentation/devicetree/bindings/riscv/spacemit.yaml
@@ -22,6 +22,7 @@ properties:
           - enum:
               - bananapi,bpi-f3
               - milkv,jupiter
+              - spacemit,musepi-pro
               - xunlong,orangepi-rv2
           - const: spacemit,k1
 

-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
