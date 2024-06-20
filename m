Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F66EC27C79
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jun 2024 16:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rbbS78F9tobPa8kW5M0UDvxxN2GJ/gQ1+KGLqQTap+g=; b=rudUPrIiqFUOnZ
	ZJPsuFAtnVI0CfSE6nDdDSSk7p+D7/k76OjxIapBkK/eOkJZ0dv6ztq1foKwDXjXLZtkzAZzcD+we
	3Z6x8yoXKAovbngkE6I0H+j8d+bHFY7CHO0qCtsUoVGOXDTjHZBTF4nrf2M0i2TeDgmGpYA8JN3fN
	GmZYNJ+EDWOE8uD6mEEOHTJBfVENep0sPUvU67zyEdpMAnZbooCxL+s91NpTsO2UKwTZf1dh021Y3
	AJo7XGGOrnSgQw3tOu80SpWu3bVokQefU3rWCqwGtUqG6IM8RwgUXDJTNXjcihzlx8MycUIcOz8wq
	+aaiW34/e/Eyo4KMq1Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKKop-00000005uKR-0Yjt;
	Thu, 20 Jun 2024 16:39:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKKon-00000005uJb-15oG
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jun 2024 16:39:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AFFEE621EF;
	Thu, 20 Jun 2024 16:39:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98988C4AF07;
	Thu, 20 Jun 2024 16:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718901564;
	bh=+nkXL3P/5DPH/xfvYqRAS9Wj743LfFVRx9tm+MReJXY=;
	h=From:To:Cc:Subject:Date:From;
	b=uK5gOOuqE8Nei77RwTiqIzX71xq/tU0kO3iRAvDigjOEMu6r3YyzYdHBgbAwxn1wy
	 +RGvoiG6xNdVFVeLk+vv35+1WUuBz2hY7hzxfSK24Yq4j7vTLkVDSZsQdU6y6xOJn9
	 TG8MFXVTheqsIxAUvBXDes0cZeOOco7F83VBSueRhpPmPprc4zfeq0W1H4jZfswWL+
	 yquWgzTcMm6xS2ZSwRaN8lQ6DUuFph91xn819CKDgMKxBXp6uIxGDvcSpoePzKLQaI
	 bkyDaoyay6jTWHB7gNPByiy3+8oQBOJg8lbrqlzTirFO/KEo84ZDHNMfEnOqsMghAV
	 5DrBju4ZOJm9Q==
From: Jisheng Zhang <jszhang@kernel.org>
To: Drew Fustini <dfustini@tenstorrent.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: thead: update Maintainer
Date: Fri, 21 Jun 2024 00:25:22 +0800
Message-ID: <20240620162522.386-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_093925_361334_D180E2E9 
X-CRM114-Status: UNSURE (   8.97  )
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

Due to personal reasons, I can't maintain T-Head SoCs any more. At the
same time, I would nominate Drew Fustini as Maintainer. Drew contributed
the sdhci support of TH1520 in the past, and is working on the clk
parts. I believe he will look after T-Head SoCs.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index aacccb376c28..b5f5506815d6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19315,7 +19315,7 @@ F:	drivers/perf/riscv_pmu_legacy.c
 F:	drivers/perf/riscv_pmu_sbi.c
 
 RISC-V THEAD SoC SUPPORT
-M:	Jisheng Zhang <jszhang@kernel.org>
+M:	Drew Fustini <drew@pdp7.com>
 M:	Guo Ren <guoren@kernel.org>
 M:	Fu Wei <wefu@redhat.com>
 L:	linux-riscv@lists.infradead.org
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
