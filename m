Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BBE606A334
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 08:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VXejTdHE;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=tpVjOpQi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Message-Id:References:Date:
	Mime-Version:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TEFKnXHgH47GosvizchDzTRU+zcAkDstd5NTqLUvq/U=; b=VXejTdHEwhneDtYykkharHIMbT
	gI5qF0PMRmBhg0bvGZT57BtgcFvZzC09LaPjd+GxJ5upe9BYCZNgQICaahz2tM7FdqG5mILXsSotC
	VIRskOguQXRvbq3j0gSM++s0Vg41IIQhk7L4pZ0TLpsHejXhIerKmELGpBSTYeznamu/HdjbXEcn7
	RLAqBGBIB3jUYLsHvN/nuGaJNuucG35CfotSVPPeuwvSkCq4/2662SU7IP3DsUL36uEcOoji3xW3x
	OhAnO5nxGF4dCdfU7i2tZ5MyyWUNkFxPfs8zdnwjRoLbK3Fxc5Wm2E5IwWSjlX2klyeStDRqmKZ/O
	zaNlqXtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbUd-00000008Fh8-45or;
	Wed, 18 Nov 2026 08:58:15 +0000
Received: from va-2-41.ptr.blmpb.com ([209.127.231.41])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbUa-00000008Fcn-0PVS
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 08:58:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1794992286;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=bS3ANnO5SPstg4zhwje34jFvY6VcGhgNDUOJNHlts9g=;
 b=tpVjOpQiH8bZsESkcUsw8yblVrpxG6Slqj9wNbXBIMW9UBJudgcCeNSxOtAPQSUaIRnmm9
 uso549gnj+Q0XOOkjLKJ70j6T7JheBT+UWjTKwrHFVQq16SBM+RHu61YnlLmbnK2hYFKSP
 TW4nsvdSH3SlrHBn6fSrHgnEhKYkU/7rWJy5VOTL1HiYy7qYgDTT01jp3UUTwl3zVEkfvJ
 NxMMRzRnzpwNSJfpmoVtTvzzB/xjyxMY+a5fnVZuJOIC+hYg8V2jOZDBtzp8CxEvPHyDzW
 +crRNFv6JHm5OFOXAu2cNK3s7mwDi8ERQ5e4lKnnb0xzNc9gSZsOWn/mhvqtIQ==
From: "Wang Yang" <yang.wang@deepcomputing.io>
X-Mailer: git-send-email 2.43.0
X-Lms-Return-Path: <lba+26afd689c+1e8fb4+lists.infradead.org+yang.wang@deepcomputing.io>
To: "Yixun Lan" <dlan@kernel.org>, "Benson Leung" <bleung@chromium.org>
Cc: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Tzung-Bi Shih" <tzungbi@kernel.org>, 
	"Guenter Roeck" <groeck@chromium.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Paul Walmsley" <pjw@kernel.org>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>, <devicetree@vger.kernel.org>, 
	<chrome-platform@lists.linux.dev>, <linux-riscv@lists.infradead.org>, 
	<spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 4/9] platform/chrome: Allow ChromeOS platform support on RISC-V
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Wed, 18 Nov 2026 16:57:37 +0800
Received: from ubuntu.. ([183.23.101.74]) by smtp.feishu.cn with ESMTPS; Wed, 18 Nov 2026 16:58:03 +0800
References: <20261118085742.1817536-1-yang.wang@deepcomputing.io>
Message-Id: <20261118085742.1817536-5-yang.wang@deepcomputing.io>
In-Reply-To: <20261118085742.1817536-1-yang.wang@deepcomputing.io>
X-Original-From: Wang Yang <yang.wang@deepcomputing.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_005812_282852_B2D3C612 
X-CRM114-Status: UNSURE (   7.73  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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

Expose the ChromeOS EC configuration menu on RISC-V so boards using an
EC over a supported transport can select the common protocol and input
drivers. Individual transport dependencies remain in effect.

Prepared with Codex assistance from the existing DC-linux EC support.

Signed-off-by: Wang Yang <yang.wang@deepcomputing.io>
---
 drivers/platform/chrome/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/Kconfig b/drivers/platform/chrome/Kconfig
index ca2e84420..6beda4655 100644
--- a/drivers/platform/chrome/Kconfig
+++ b/drivers/platform/chrome/Kconfig
@@ -5,7 +5,7 @@
 
 menuconfig CHROME_PLATFORMS
 	bool "Platform support for Chrome hardware"
-	depends on X86 || ARM || ARM64 || COMPILE_TEST
+	depends on X86 || ARM || ARM64 || RISCV || COMPILE_TEST
 	depends on !CPU_BIG_ENDIAN || COMPILE_TEST
 	help
 	  Say Y here to get to see options for platform support for
-- 
2.43.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
