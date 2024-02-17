Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F25DC48BF8
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Feb 2024 14:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=u2ei6EuUUZBF+NqJJm3/ExL7rTf7RP3B7TglnjWG9XM=; b=gSmLCE1VGVW4+1
	Z+EcolojBC7aidLDt/PvCbWveSgriLumyq6rESv6f30d8Jpag0X25s+1NPA8rn6XsXTRvqFQyWF2H
	tWK8PZeoIV7LoHbiC8Qbm9m53vhUkso3gAQO7H73WqSlcyzNHnbLiFvfU+OJOOOS9lYYfv4JtuCTn
	wN+CjIc3NYaJc+Ony/hqYhu2VKF+n5A1fyPU7eUXjy/g1MkQjLsaR54NfGGaSXDq+qzdm1k6x7cY9
	YrdkegDUSChv7D48UcridBpFiwSbfawOeTUKujtpH2HlYFbFQWt5c0ZcroD5mT6nhb4N1Dv2+DQw7
	yHCLE2ylyc9nqCrerBSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbM5q-00000005rev-1VW3;
	Sat, 17 Feb 2024 14:55:06 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbM5n-00000005re8-3gFn
	for linux-riscv@lists.infradead.org;
	Sat, 17 Feb 2024 14:55:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1906CCE0947;
	Sat, 17 Feb 2024 14:55:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B9E2C433F1;
	Sat, 17 Feb 2024 14:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708181700;
	bh=Yi5Gd0jnq8M0zygFXNIozQY9SSvV949fbUeccyzerYY=;
	h=From:To:Cc:Subject:Date:From;
	b=prRb962iIfd64tAiJtAt+ySH250xUoL0By4O1DslWr0WnDu6BW+Ccc9Nvkowq1CXE
	 CJNNW0A2XR9nO3jlYgEqvzHifu6l95YzbFISYmCcdu16NwGKypa8cb6tnUNRl6SYFl
	 +Hhv6nL/8CFDQCh5O+qPJoP8rBn10/99yN5zFPAwrfgDOLkdc8ihkQRYIE2ls+R2W/
	 gkUnRMjjjHlPTBC97DqjO9dAtYLYSocw4YYZ12gTvJL7bh9huLgPJdQSK3RQ1FTEt9
	 cYGfc0UU87TVPJ5tDyGmrq+glKxW5J3Fph4xGy5c0F81wopekm/kIa+x1i3DrRyefs
	 2vcHrEccXIBmg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 0/2] mmc: sdhci-of-dwcmshc: support Sophgo CV1800B and SG2002
Date: Sat, 17 Feb 2024 22:42:00 +0800
Message-ID: <20240217144202.3808-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240217_065504_118146_A3A15770 
X-CRM114-Status: UNSURE (   6.65  )
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

Add support for the mmc controller in the Sophgo CV1800B and SG2002
with corresponding new compatible strings. Implement custom sdhci_ops.
Currently, only sd card and no-1-8-v is implemented and tested, I will
try to find a board with emmc and sd/sdio sdr104 support.


Jisheng Zhang (2):
  dt-bindings: mmc: sdhci-of-dwcmhsc: Add Sophgo CV1800B and SG2002
    support
  mmc: sdhci-of-dwcmshc: Add support for Sophgo CV1800B and SG2002

 .../bindings/mmc/snps,dwcmshc-sdhci.yaml      |  2 +
 drivers/mmc/host/sdhci-of-dwcmshc.c           | 66 +++++++++++++++++++
 2 files changed, 68 insertions(+)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
