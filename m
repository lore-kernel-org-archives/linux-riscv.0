Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E68EACC6B15
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Oct 2026 10:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S80OpsIgPqh0Js6FeyVGyRFNhu+X0WXAsWgRqNhpafE=; b=23e4NnHmn7ToXP
	CcEfuD1xNSVHkJVcinTeKmoj7UWcxxvVcM9d7ZCSX9haR3jZ0EqHdoHwyaPdSwpNLnOlRqxxnbU24
	dpY3YAHLBT6XR3lf5FGNikoKClyHHDmupq8f61kxHIt46BpifatNhGuiwdg1XpAWumA6G+MJiitLT
	yEiNFV+Mys8Lf9X63M3TAKxC1NaZuRCmAQ2vhZfA2ePHvHyXXrwYj5xKKDPmPFbKp7IjydWf0TlBK
	ePQKnUb7TEwvScQ/8aCmkta0OkaUUq9AcVIkwhRKaHOAmv+PHbNciVC11rta8o0rEJki4Y/6rqErb
	LKJd+bEsd6UBXd0FDAeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZdX-0000000CXpA-13lR;
	Tue, 13 Oct 2026 10:21:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZdS-0000000CXoA-2WDK
	for linux-riscv@lists.infradead.org;
	Tue, 13 Oct 2026 10:21:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0C60060A6F;
	Tue, 13 Oct 2026 10:21:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 92685C2BD05;
	Tue, 13 Oct 2026 10:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791886889;
	bh=UH/9tXjtdEDMWx49kupssMJS31sfLv7FO0+FnXYwDuo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=iu7bin7UJPViS8CgHD8es3z0HMx3FM2EEjWmxDfi3WIVrs78Fz4zehWLLOarCk4of
	 IPfQrOBwcgbpaYl18QM0BR404jBnFWzgtUdzBVKO5yMF06Vwv2ZAtdr/ALoeNlSrba
	 tHMIWpTtUdj29MjmmgL8Pir5ynaXoWbpxj8exjLeAlimiVB0ai0VSuCQEVctKfECR3
	 nN7X5rO4kH+s+Dn5EElJt1XWrSa1riV8gAcgud+DDwF8a7Ll4lAbSfUtVdAUSQBTjQ
	 3WHIDvdoR9j35t+qDeYPidOrUMMWdNpW7ts85LVogQ2hctZ5qFBgq8g8WQ09UrL0tb
	 V6BjqDZ2U6MoA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72A94CC6B03;
	Tue, 13 Oct 2026 10:21:29 +0000 (UTC)
From: Xincheng Ji via B4 Relay <devnull+jixincheng.ultrarisc.com@kernel.org>
Date: Tue, 13 Oct 2026 18:21:26 +0800
Subject: [PATCH v3 2/7] dt-bindings: riscv: cpus: Add UltraRISC CP100
 compatible
MIME-Version: 1.0
Message-Id: <20261013-ultrarisc-dts-v3-2-5ff3ebb2a90d@ultrarisc.com>
References: <20261013-ultrarisc-dts-v3-0-5ff3ebb2a90d@ultrarisc.com>
In-Reply-To: <20261013-ultrarisc-dts-v3-0-5ff3ebb2a90d@ultrarisc.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Jia Wang <wangjia@ultrarisc.com>, 
 Xincheng Ji <jixincheng@ultrarisc.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791886887; l=804;
 i=jixincheng@ultrarisc.com; s=20260922; h=from:subject:message-id;
 bh=4TAyfkBcv/s6Kdb5vlK3fVOCoBkGrwHfHTtS6V/To4w=;
 b=a6oHaHiU9gQN+Ua7rJLLGvP2Tuhz2DaAAZRZxz4A6VOffrl/ttBTaeNNnk6ULYE5mU28IrN9p
 brEJk46Gk3OCHllNuDDhbL57M7gg8I4iBTypCVMk487w7lQXDXr8Hmy
X-Developer-Key: i=jixincheng@ultrarisc.com; a=ed25519;
 pk=n848dcS5D6g0vLad/rjp4Gf/1eedTe1a3pYUrkt2260=
X-Endpoint-Received: by B4 Relay for jixincheng@ultrarisc.com/20260922 with
 auth_id=1046
X-Original-From: Xincheng Ji <jixincheng@ultrarisc.com>
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
Reply-To: jixincheng@ultrarisc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Jia Wang <wangjia@ultrarisc.com>

Document the UltraRISC CP100 CPU compatible.

The CP100 CPU is used in the UltraRISC DP1000 SoC.

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 0da219ae6769..85adf72899c9 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -67,6 +67,7 @@ properties:
               - thead,c908
               - thead,c910
               - thead,c920
+              - ultrarisc,cp100
           - const: riscv
       - items:
           - enum:

-- 
2.34.1



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
