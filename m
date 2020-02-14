Return-Path: <SRS0=3sXM=4C=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97C6CC3B1A1
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 14 Feb 2020 16:36:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59B20217F4
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 14 Feb 2020 16:36:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ax2qVml/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="bnbgTKrW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59B20217F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CuYLLmAu20++r7KQmITNRlEPYBFVeDJLIFM1dOQvtJ0=; b=Ax2qVml/bMar71
	r1m3LnP+Lh82IWObhoUTKiEw4eHNYKRI5gDuqRP7rR40q+fqytGndGvAgAw1ySy4BLJW2tfcyMfp9
	3q1jaQkevMl32ssOTHAsOnDUCFfmy+kX5Ql3nhpNcDZAHwml5hJ1xCgq1VepHtdwbXneCYzTwKg1C
	MLf9qDQNiPu8bVmP4OLtI18Y+jXPYQ44+7D8MWRlWGobEgtxoKMzIT0CnyQ4zk9U2wLPQcC4LOZsh
	KMss1LfN4c48xI8JzxAP4Z56L0UpKJ4YkYAg62fK2BRReafyVwM6qMv8HnuTKw7rwq8kE0xFJN2CQ
	HPdQ6/uzse/U0hOoJuSA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j2dxB-0005vM-Io; Fri, 14 Feb 2020 16:36:33 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2dWd-0000Cv-Bm
 for linux-riscv@lists.infradead.org; Fri, 14 Feb 2020 16:09:08 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2D58D2467E;
 Fri, 14 Feb 2020 16:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581696547;
 bh=AJXW1CMLWcubyoLjPolCPobZXlVMMU/nqykdf1BmEWE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bnbgTKrWcmw6kSWgw0lEeRHPZ8SyRD7DD8+bKN6BTO1d1XpGGodjRAY/o7o5TAoV4
 C1QEHUDmJxAW9rn+KcUNTi+9zmlPqWbZ1FFb+esy2jrn5uPntUZ5RENcRe7QKqPlrD
 vQHggx3TbzX+T6j+t7P5rJhN4cmoOBSIEe1VD1C8=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 340/459] EDAC/sifive: Fix return value check in
 ecc_register()
Date: Fri, 14 Feb 2020 10:59:50 -0500
Message-Id: <20200214160149.11681-340-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214160149.11681-1-sashal@kernel.org>
References: <20200214160149.11681-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200214_080907_458504_EA3AF4BD 
X-CRM114-Status: UNSURE (   9.35  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Sasha Levin <sashal@kernel.org>, linux-riscv@lists.infradead.org,
 Borislav Petkov <bp@suse.de>, Wei Yongjun <weiyongjun1@huawei.com>,
 linux-edac@vger.kernel.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

From: Wei Yongjun <weiyongjun1@huawei.com>

[ Upstream commit 6cd18453b68942913fd3b1913b707646e544c2ac ]

In case of error, the function edac_device_alloc_ctl_info() returns a
NULL pointer, not ERR_PTR(). Replace the IS_ERR() test in the return
value check with a NULL test.

Fixes: 91abaeaaff35 ("EDAC/sifive: Add EDAC platform driver for SiFive SoCs")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
Signed-off-by: Borislav Petkov <bp@suse.de>
Link: https://lkml.kernel.org/r/20200115150303.112627-1-weiyongjun1@huawei.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/edac/sifive_edac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/edac/sifive_edac.c b/drivers/edac/sifive_edac.c
index 413cdb4a591db..bb9ceeaf29bf9 100644
--- a/drivers/edac/sifive_edac.c
+++ b/drivers/edac/sifive_edac.c
@@ -54,8 +54,8 @@ static int ecc_register(struct platform_device *pdev)
 	p->dci = edac_device_alloc_ctl_info(0, "sifive_ecc", 1, "sifive_ecc",
 					    1, 1, NULL, 0,
 					    edac_device_alloc_index());
-	if (IS_ERR(p->dci))
-		return PTR_ERR(p->dci);
+	if (!p->dci)
+		return -ENOMEM;
 
 	p->dci->dev = &pdev->dev;
 	p->dci->mod_name = "Sifive ECC Manager";
-- 
2.20.1


