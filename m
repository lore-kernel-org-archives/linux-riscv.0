Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 385A8C5DF81
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Aug 2026 06:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vzk3F4l1LStrRDPJJU+smVzWiXHgVIF9w5FWT9rUO2c=; b=M1Ifs8YBUg86yc
	LT1rqK09QDNMHAtymSVvfZz2i66Cyn22FcVA+c7Zf2Qf3wfEU7mVJHRjXA3LL/TaTnF+LvWeDc9Ki
	KGhT6rfKbhUfvL1vg8lh9rCfUru9cSF8BuK0JuH4p1qXrbTT4ly5lpau+ZMYfpyTQNgNblQ8LZBsa
	hzo9Xtwe9BlUCOp5hwinHfEAZqe+E23SpeQIVYkFF/zW8TVcEUa0vCEgmpfN3K4IdbNIFYZcq76lw
	9eWlYd6ByrRB9ikDM2fP0fcYXuj2CWVd5AwwdUM9chD1+zqPKE9+8xaPHWUSesr6V5dfR/4txOqbl
	5DgrozLXOCgkTfMnha4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyNxk-0000000Fxgk-3Liq;
	Mon, 24 Aug 2026 06:15:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyNxg-0000000FxeV-1nuB
	for linux-riscv@lists.infradead.org;
	Mon, 24 Aug 2026 06:15:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 36A1F44FCF;
	Mon, 24 Aug 2026 06:15:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E3C1CC4DDE5;
	Mon, 24 Aug 2026 06:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787552111;
	bh=CA2OaRx3uR5mae8p3mSwvWAfzEXykGeM7OaNdNFvjd4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=h3G7eFwvnb88wCXJMM7ttmKtWe70jNxYy8oOfDf7mw61ucSGdrIorxheFJQ2oKHuO
	 +HuCTyJp6hniNMsz0dhiTBYMSgntozipYSTCWgCTTumcayReCRSeXAD6xZno87LRw/
	 L5VO8h2Vm79qq/t0faw5QjTgYyg3moktJlT7pF3kIPxNOldGQ+uR1wCaLjhtZeUk+T
	 uwRLZTgOC0JcB7gMb0u0FopchEYuGOzIRWJTF0joD+8tMp9kFSIhGqIG31ofpbv1N7
	 FIHcMTU9ZuDIMsuWgbJAGkFGLbcJA3Qp09j+DJ7YeuevHR8WVYMqoOPU3qJhzbKPoT
	 2NTkiWpN/sfvg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB70DC5DF94;
	Mon, 24 Aug 2026 06:15:10 +0000 (UTC)
From: Jia Wang via B4 Relay <devnull+wangjia.ultrarisc.com@kernel.org>
Date: Mon, 24 Aug 2026 13:54:18 +0800
Subject: [PATCH 05/12] dt-bindings: timer: Add UltraRISC DP1000 CLINT
MIME-Version: 1.0
Message-Id: <20260824-ultrarisc-dts-v1-5-61ab7aebe9e5@ultrarisc.com>
References: <20260824-ultrarisc-dts-v1-0-61ab7aebe9e5@ultrarisc.com>
In-Reply-To: <20260824-ultrarisc-dts-v1-0-61ab7aebe9e5@ultrarisc.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, Mark Brown <broonie@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-i2c@vger.kernel.org, netdev@vger.kernel.org, 
 dmaengine@vger.kernel.org, Jia Wang <wangjia@ultrarisc.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787552108; l=911;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=L6jb4KXmGtvLsiicue+aqeQTQKu1hh49A3gJ3oqy6b4=;
 b=3VBgJyPcA6mmVBNWMcGIJ+1YMjutXZgCOfb4mFq+iDAvnYVGogpkSCmug1mhP9Sy9rifmwVGF
 wxCcGnbx7b+AMYHNcZfsWQjadMtbfgTg8AsrfwRJhtsVznGo49CzLMX
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-Endpoint-Received: by B4 Relay for wangjia@ultrarisc.com/20260515 with
 auth_id=779
X-Original-From: Jia Wang <wangjia@ultrarisc.com>
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
Reply-To: wangjia@ultrarisc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Jia Wang <wangjia@ultrarisc.com>

Add compatible string for UltraRISC DP1000 CLINT.

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
---
 Documentation/devicetree/bindings/timer/sifive,clint.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index 3673836e14de..878f267d089b 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -40,6 +40,7 @@ properties:
               - starfive,jh8100-clint   # StarFive JH8100
               - starfive,jhb100-clint   # StarFive JHB100
               - tenstorrent,blackhole-clint # Tenstorrent Blackhole
+              - ultrarisc,dp1000-clint  # UltraRISC DP1000
           - const: sifive,clint0        # SiFive CLINT v0 IP block
       - items:
           - {}

-- 
2.34.1



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
