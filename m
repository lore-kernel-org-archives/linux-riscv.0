Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE649CD37AC
	for <linux-riscv@archiver.kernel.org>; Fri, 15 May 2026 01:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vkxUFzaqoyvu0eH5VU9VbqG/1zdfN9wgNRQeR88ow+U=; b=NBc9pY/68Rf0x5
	76394xaHG383xAEeR+otwxB6eTnVhUxEKUFOr+m2ADmLCussrXfsz1ZmcjnPVLJ5P1gy0jJ5Ww5kz
	SndZwrTTMGzSZnHy8zVwQovr77pG8V/Xs5DLbuKNa1J+ZUXwNI1Ygupu2/3XYH5Qritp22CLAgzeN
	nDITP3f9ENuTRVHKqXig0fZYnhH8nLWZ8j3S/fvGVydvvCBqAQaCv8GxGPGC0CMKT5qRio5WiH1wJ
	6GOisR+icMXUiq75yVE2F1pf0Pyi9iu49tcYGokaeWAtRQYccQRTiIioAxH8WZDXh97KhAGZRRSwT
	NeUzzbe8+2MkyKkv8n6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNhBz-00000006zkw-0UN3;
	Fri, 15 May 2026 01:18:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNhBu-00000006zgz-1nGP
	for linux-riscv@lists.infradead.org;
	Fri, 15 May 2026 01:18:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ED7A944705;
	Fri, 15 May 2026 01:18:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BFD4FC2BCC9;
	Fri, 15 May 2026 01:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778807892;
	bh=wWzUQXRnbB0RB/9TAJFVHDrh9+wM/VoEhvOqImuQdSU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Uvz6LxSBRs0Xft2rXVCD6uVrvfCNLCzx5vIeGQuNrciFk0Ge87j/7ZpjBSFA71Ux8
	 4nF/VQMkD/nGrYNRm/WwoziPMN1eHQsSe1wZDiVeFopY42FssdPZfZIhD1wf+ohpXZ
	 UPYiTZbUeIUS11wI6qbnKD3wOgdjL8J7GABEDU8eLYVdyizCi42CWBTfw7aq53c1Zc
	 cgf3p/6CCnJyVZ+r/LC4Ewwo2tQ5TfJmCXGkL3Zbog2ewuFp9hJ9W9LvsM5+IKB/Lf
	 lsLt1fK/i0nEAJBdVAgRu3hYcHUyxe59KF9E0cbLtJc/qGQTjv/J2TCZdEnol/X1lM
	 hOrjWx4rsxQxw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3811CD4F25;
	Fri, 15 May 2026 01:18:12 +0000 (UTC)
From: Jia Wang via B4 Relay <devnull+wangjia.ultrarisc.com@kernel.org>
Date: Fri, 15 May 2026 09:17:58 +0800
Subject: [PATCH 2/9] dt-bindings: riscv: cpus: Add UltraRISC CP100
 compatible
MIME-Version: 1.0
Message-Id: <20260515-ultrarisc-pinctrl-v1-2-bf559589ea8a@ultrarisc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778807890; l=757;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=XZFNeOKWu/CkLjPDC+5weDpv+XeEMBj7yaDkjZ2TskU=;
 b=f4NijLLDER036QaslKhiTpq3CTiQi8EvmPdcda9IBEWa7XodQ/34i0jF6cN01hhGnaYRoq914
 jbulhmTlriFA0pZS9SDJ/22YUVe9cGvjG5hLQ97ZKrIjM98NQ/Nyhdf
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-Endpoint-Received: by B4 Relay for wangjia@ultrarisc.com/20260515 with
 auth_id=779
X-Original-From: Jia Wang <wangjia@ultrarisc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_181814_494261_E918F892 
X-CRM114-Status: UNSURE (   7.05  )
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

Update Documentation for supporting UltraRISC CP100 based CPU.

CP100 is used in UltraRISC DP1000 SoC.

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 5feeb2203050..9f5226717701 100644
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
