Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11A1FCD4F42
	for <linux-riscv@archiver.kernel.org>; Fri, 15 May 2026 01:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=att2rEr+jrVfKv1CAgC5l7RP/CbgyG6hI2qYTTdL1mk=; b=kFGqFKUI0cwxFB
	aqISarvz8jDBwfR5VHeJ9RvNZm4nhAsMiX/jcwMu12s6VLabE7TXhDzfNj535mN8EQD6e34MgO8Zm
	j6BSOZPba2oGsPiKURnvqhOacMN6mOTOjmLfdLOgdheMVy28+p8diQlATUzPCwDwbw/8gy19qpz0Q
	L9RAcqroh4k1yZ+QvpcSWmISfLEy3JiPc0wHBx5MRcilHiFEVwim+fatxWNbJ+dP8or5gvapePxJZ
	IXMBfRDluBlgb1Tt8O5+L67H8ZQmo9KQoT6TPKBUeqAQlBhqU01u2qDy2bUDhw6GwZk0tC6+QRre2
	sXJ50dgDygemDytULwIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNhC3-00000006zp1-3Qn0;
	Fri, 15 May 2026 01:18:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNhBy-00000006zk1-38UH
	for linux-riscv@lists.infradead.org;
	Fri, 15 May 2026 01:18:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8EC444477C;
	Fri, 15 May 2026 01:18:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5F7B7C4AF0C;
	Fri, 15 May 2026 01:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778807893;
	bh=jseFc3n5cwC0kdVmMRsSBaoSA7xjf+l4Q0DXJP129kc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=k4qWHYA7Yk+41PPDXrsZapPg/ye7FGUUMaCrgX9528FyDJBqbfStsfWT/vn9sF8ia
	 VEoVycf/kw/BgjiRdwiSoFe3jl2d16uAONW+BMxhx9Rq8inIjRLancdqFNI465MNqA
	 JIopc6IVKHxl+P1lcz20GeUKPwBQtcdw14ea15eNvFAYLQxoaWJ+aYYBFXFSatkR5t
	 Q87PO5QCObH7WjB9xwmI6JeOqeG50K/5CoJ8LdmlSg5AQA2cZ7XD8UPhQ6zY+QI2iR
	 J9UgyAy0KXtFtgHXbe/Kn+3TCBP7hJr6mdI6p0fc4mWLLb3SsNFrghrqDuEiIWyMBC
	 VwN1cqoezvu7Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 562FFCD37AC;
	Fri, 15 May 2026 01:18:13 +0000 (UTC)
From: Jia Wang via B4 Relay <devnull+wangjia.ultrarisc.com@kernel.org>
Date: Fri, 15 May 2026 09:18:05 +0800
Subject: [PATCH 9/9] riscv: defconfig: enable ARCH_ULTRARISC
MIME-Version: 1.0
Message-Id: <20260515-ultrarisc-pinctrl-v1-9-bf559589ea8a@ultrarisc.com>
References: <20260515-ultrarisc-pinctrl-v1-0-bf559589ea8a@ultrarisc.com>
In-Reply-To: <20260515-ultrarisc-pinctrl-v1-0-bf559589ea8a@ultrarisc.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Jia Wang <wangjia@ultrarisc.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778807890; l=681;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=mQUrNpHmImAQll8Ku4hP3FOcTP1mWHcrN/GQ55X+mwU=;
 b=rW2qhP7IrKxExw+g4gJleU/MrAUEhaKmMhuGcdOG+RtY0KMyatlMSfNTeHSuSxbWMM36rDjGg
 hsqzqaDJQN0BUcaVrGPI7kuRezqEaJ8TXYPwir9hh3/UGPzd5k3Q2ZQ
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-Endpoint-Received: by B4 Relay for wangjia@ultrarisc.com/20260515 with
 auth_id=779
X-Original-From: Jia Wang <wangjia@ultrarisc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_181818_824099_A079C9E5 
X-CRM114-Status: UNSURE (   6.67  )
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
Reply-To: wangjia@ultrarisc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Jia Wang <wangjia@ultrarisc.com>

Enable `ARCH_ULTRARISC` in the default RISC-V defconfig.

Link: https://lore.kernel.org/lkml/20260427-ultrarisc-pcie-v4-1-98935f6cdfb5@ultrarisc.com/

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index c2c37327b987..9fdc4d1831ed 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -32,6 +32,7 @@ CONFIG_SOC_STARFIVE=y
 CONFIG_ARCH_SUNXI=y
 CONFIG_ARCH_TENSTORRENT=y
 CONFIG_ARCH_THEAD=y
+CONFIG_ARCH_ULTRARISC=y
 CONFIG_ARCH_VIRT=y
 CONFIG_ARCH_CANAAN=y
 CONFIG_SMP=y

-- 
2.34.1



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
