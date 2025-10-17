Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED189CCD184
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 05:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=boLvSa/x6aZVPXC8Xsi92CkPNVqZAcnAAPWyxPh4+gA=; b=HvSYCjFx8v0w39
	GI2wBhkBfUeQKUsoAGm9jI2l25BRsAz7wdnslXFSGCf1+ukTvRvaeiQu+S4elejXEn/6xLuofHD3n
	F4lOaVCzxsDtvPDPZiJT7CN1AFxcpBVwzgOf5MAz881g4G5CiddjHosKIlXlCErd0f0IIPH7yEIqi
	queU42658QUEBcTvawEkDBRMJeZapjzlcOEU978OWyiu85h8dAsZ8aLfh7fha2lJMrBFPDyv52q0m
	wGmjdueqSG+YyRK0/AtIyvZhQTCBjmHQMgK7OWd40r4jVjAW59efICRl4M21MLgAt8J6VmapDtaOG
	wGoeJbn3S+fKeXBVwPuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9dQs-00000006fgF-2tRe;
	Fri, 17 Oct 2025 05:55:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9dQr-00000006ffT-2JnV
	for linux-riscv@lists.infradead.org;
	Fri, 17 Oct 2025 05:55:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E5F5C641EE;
	Fri, 17 Oct 2025 05:55:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93581C4CEE7;
	Fri, 17 Oct 2025 05:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760680516;
	bh=qdkC8n5UYL12HB+OuzzAqHEJ7yUfLSJb17ftt81iTKo=;
	h=From:To:Cc:Subject:Date:From;
	b=mF84fDNvMXf2PJD66eyeTmp2SWDIg/20bptYDljDFObmc3i0VCktf2xk/99c9AqjP
	 sjK39JGsZiS16xX3ux+euJD93P2Ky9ko0UXYyHere8TFeyPndFjgiRnaVub3XnLGhk
	 +LL2gcqXXsf2hWEdNFYNEr0QJVjH7ueD3egKjJ0hFDaC0GHG5ds98ITSi04ToS3lMi
	 8SFFKEKK8r46xsfQrIf0umUM/5F1UFpIDkI3khidWTIJ/DaKkWSpVv1MtsT10rmmrp
	 bARNE9sJhrg9KGOT+8VEO/sFU9PFQ9nGKUjIdmZGrE7QRTEq8pAzZdMwl4iowKGqOC
	 uJUfACpXCxt9A==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1v9dQt-0000000022I-10Ag;
	Fri, 17 Oct 2025 07:55:19 +0200
From: Johan Hovold <johan@kernel.org>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>,
	Michal Wilczynski <m.wilczynski@samsung.com>
Subject: [PATCH] mailbox: th1520: fix clock imbalance on probe failure
Date: Fri, 17 Oct 2025 07:54:14 +0200
Message-ID: <20251017055414.7753-1-johan@kernel.org>
X-Mailer: git-send-email 2.49.1
MIME-Version: 1.0
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

The purpose of the devm_add_action_or_reset() helper is to call the
action function in case adding an action ever fails so drop the clock
disable from the error path to avoid disabling the clocks twice.

Fixes: 5d4d263e1c6b ("mailbox: Introduce support for T-head TH1520 Mailbox driver")
Cc: Michal Wilczynski <m.wilczynski@samsung.com>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/mailbox/mailbox-th1520.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mailbox/mailbox-th1520.c b/drivers/mailbox/mailbox-th1520.c
index a6b2aa9ae952..626957c2e435 100644
--- a/drivers/mailbox/mailbox-th1520.c
+++ b/drivers/mailbox/mailbox-th1520.c
@@ -435,10 +435,8 @@ static int th1520_mbox_probe(struct platform_device *pdev)
 	}
 
 	ret = devm_add_action_or_reset(dev, th1520_disable_clk, priv);
-	if (ret) {
-		clk_bulk_disable_unprepare(ARRAY_SIZE(priv->clocks), priv->clocks);
+	if (ret)
 		return ret;
-	}
 
 	/*
 	 * The address mappings in the device tree align precisely with those
-- 
2.49.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
