Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA064C369A1
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Apr 2025 07:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zub/B3+//LouKgDI4pWuu/xjgIEGQ+e+q5pHtQ1ykzI=; b=VzH1nujQhMU+2p
	TUjkHAt1Sop6GmYz1fBd/L2HFzfHh6VRmK21k2QmGDzOAkijcq7zbvX4PognJrp06+q4nVYmpBYT3
	ndivdxkwze2Nvz38hL1YsnwYOrKdHGWKNyChjmh/C6Pk4RynHN32Dqak2x4/suAqGc1KpGDieCUOy
	fWKAIudBXt2uv/PayEMxwFa4JBWrXWJPxGN0WoAhALxDCZCJr9cbu8GLDSlmJOI4iM/ylZJh7ZrUe
	wvgHbfu7Kt7H+FyWmYRBu3xr3OJTwUMkFKUjtPtWZLXemFaioUsK5chRflhe7HVyhNayowHUGsX2N
	YFHH5QsvYQUn5TRCJpJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3VYV-0000000FbYQ-0jJK;
	Sat, 12 Apr 2025 07:45:35 +0000
Received: from bayard.4d2.org ([155.254.16.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3VYT-0000000FbWs-0zhi
	for linux-riscv@lists.infradead.org;
	Sat, 12 Apr 2025 07:45:34 +0000
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id 88B8A12FB432;
	Sat, 12 Apr 2025 00:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1744443932; bh=aq36glBXKWJ4CyEzsiQJFbDCCtINN6dMSzr4bZ7fo84=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jStz93cd09nE8F8fuJSKE6RIyBQg3hrCisO4exQjxE6PRzGvYRWc3idYEo3SsY3a1
	 hE+3Tkv60KVxqL2KdnT9bj2CT3xjbveBukXcwPMsSQy69Bf831vbLdzJCVaIK5sOax
	 GUqJ4Hw3SQEopfT/7YOkQj3IfXNNIh3VjTzHIlmFtQAfU7q7JpZTxjnUZPClJ7ZIDR
	 8lJf4f1D7KBVwWNQfKveeyhSFkuV7q5ah5X1YT9FV4EVZpQ/PqsHb/byjpjyhAEh7m
	 Q9tCQBT5qllzEzN53h8O72bJsWVBIz74jfJIWoYPs566SiYR2TyKFpm6LeaUGT4Ggu
	 zAcsjvI1K6VcQ==
X-Virus-Scanned: amavisd-new at 4d2.org
Authentication-Results: bayard.4d2.org (amavisd-new); dkim=pass (2048-bit key)
 header.d=4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WVUxCBhjmhLL; Sat, 12 Apr 2025 00:45:31 -0700 (PDT)
Received: from localhost.localdomain (unknown [183.217.81.239])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id 276E912FB41C;
	Sat, 12 Apr 2025 00:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1744443931; bh=aq36glBXKWJ4CyEzsiQJFbDCCtINN6dMSzr4bZ7fo84=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iE5k6MIHr12bpehFyid4SkLPW+y6Rp5xYeHkjPUeuyLr8zv9Aw6sPzftUKj6EUnci
	 Iq8fvuMFPUTtsYiEabpXUGwVUOI/B2WFWvEzV3+0SMhB6lKWV2B/BdBtUoRcqiEbsZ
	 oHqINh1DXJCNehbV/oNf0R0TDWZ6TpWbrc8P0f8D1WrMT/oNtWj5/Mb504yCf2nmFb
	 A3cxiWxR885auDTIMUoCBUrJE6KqMmB2cjF/QL5cN+2YpbAehFBjJhffQU49+vTj+w
	 Oj5r91CyNH9xBXKxaAua1zCteTFdQdk+59gCh8oW3oRHICN5VuiqKdoZHoGHfnkSKg
	 lO0DTJxznTpiQ==
From: Haylen Chu <heylenay@4d2.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev,
	Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicornxdotw@foxmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	Haylen Chu <heylenay@4d2.org>
Subject: [PATCH v7 6/6] riscv: defconfig: spacemit: enable clock controller driver for SpacemiT K1
Date: Sat, 12 Apr 2025 07:44:24 +0000
Message-ID: <20250412074423.38517-8-heylenay@4d2.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250412074423.38517-2-heylenay@4d2.org>
References: <20250412074423.38517-2-heylenay@4d2.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250412_004533_295553_F978046D 
X-CRM114-Status: UNSURE (   7.83  )
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

Clock controller unit, or CCU, generates various clocks frequency for
peripherals integrated in SpacemiT K1 SoC and is essential for normal
operation. Let's enable it as built-in driver in defconfig.

Signed-off-by: Haylen Chu <heylenay@4d2.org>
---
 arch/riscv/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 3c8e16d71e17..4888529df1d8 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -250,6 +250,8 @@ CONFIG_CLK_SOPHGO_CV1800=y
 CONFIG_CLK_SOPHGO_SG2042_PLL=y
 CONFIG_CLK_SOPHGO_SG2042_CLKGEN=y
 CONFIG_CLK_SOPHGO_SG2042_RPGATE=y
+CONFIG_SPACEMIT_CCU=y
+CONFIG_SPACEMIT_K1_CCU=y
 CONFIG_SUN8I_DE2_CCU=m
 CONFIG_SUN50I_IOMMU=y
 CONFIG_RPMSG_CHAR=y
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
