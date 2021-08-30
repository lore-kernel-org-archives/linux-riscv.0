Return-Path: <SRS0=zS8+=NV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5149CC432BE
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Aug 2021 12:00:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 252DD61178
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Aug 2021 12:00:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 252DD61178
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BkaMOUJmGvdLgQhTJloCxJsJSYXvE/XIelpGzeNsD8s=; b=dUs0CfAiwOMFqv
	EMSERWGyGe5TyLiPebKcFQ56Ia6h260IPlzxmyaEODFWl6R8oZEb00sL1KY57ifBpejO6M6GhGjid
	AtSPy7p7ihQhR5Vo+LMH6dxqqw/jWxtwYDAogMTzU8b9fYsCfyO54dBKEwKrp2EQIGQ/bu7uWqUfV
	3ElIeegfDdwlFMaxoIX0ItDEiST/uhocoI8smNd5I+z5lGIw+VCEGEcSkJfUJ7WOcZOISna/1SXtH
	Vze86YvTvrlFpH3nJg71IZk05dg2zOcXj0nR8KsUy+zOjiFoehrIs7TpwmEhscrj5ptSEO/yLivW5
	2q3qzXb2Z9tTaWmMIpUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKfxL-00H9Uf-T6; Mon, 30 Aug 2021 12:00:03 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKfx9-00H9R7-KF
 for linux-riscv@lists.infradead.org; Mon, 30 Aug 2021 11:59:52 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6F1AB61157;
 Mon, 30 Aug 2021 11:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630324791;
 bh=/l7/K6eU+TdG16+drP7tph68gqsxwrWiwUWxucC+EKE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qt+lkm5vfy8vbp1QaCOfmFAKrVFXZcUy+Z8E0LhH8XXSfAs44IIV6dgNerTYtcpyo
 fElg6yjV6TokKxFTYxqpWpADoW4FvMpc3nJ1JuBIUb5bnrAFts8GScN1VGyR3eO6UY
 GTTneRIye04Gj8T1DdcS0teJCaVxH4RqAQOgwkTnuN+DVKrDq1xgxZPbriiFduOin0
 wPs7vdj8jNDIfdkgGstekWLMG5ifRDkFykQ4dDQ3Eb4FIpBr7FfhDYDyhJzYuXLwjI
 swTIOMdeeqXywb9wr2ICcaLlHpbOkX4az2ep7Tc0S0ATkPEyfI789Vjr9VQdAb18HI
 64KJdWl/eoTXw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Bin Meng <bin.meng@windriver.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Sasha Levin <sashal@kernel.org>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 5.13 06/14] riscv: dts: microchip: Add ethernet0 to
 the aliases node
Date: Mon, 30 Aug 2021 07:59:34 -0400
Message-Id: <20210830115942.1017300-6-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210830115942.1017300-1-sashal@kernel.org>
References: <20210830115942.1017300-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210830_045951_737733_5AABD923 
X-CRM114-Status: UNSURE (   9.61  )
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

From: Bin Meng <bin.meng@windriver.com>

[ Upstream commit 417166ddec020c4e969aea064e23822591ad54df ]

U-Boot expects this alias to be in place in order to fix up the mac
address of the ethernet node.

Note on the Icicle Kit board, currently only emac1 is enabled so it
becomes the 'ethernet0'.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
index ec79944065c9..baea7d204639 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
@@ -14,6 +14,10 @@ / {
 	model = "Microchip PolarFire-SoC Icicle Kit";
 	compatible = "microchip,mpfs-icicle-kit";
 
+	aliases {
+		ethernet0 = &emac1;
+	};
+
 	chosen {
 		stdout-path = &serial0;
 	};
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
