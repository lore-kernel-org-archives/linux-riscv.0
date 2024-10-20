Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED21D3C92A
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Oct 2024 14:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8R+ZgTp9lhkEQrUU1alOYdzyiWy3cGDhoB+e28MrQCI=; b=nGxKDOn+3aLXQI
	TUoYuaXt3Jx2YDbdjZM1gAEMcXwu4oPzS/Ad/iKJ8WDEKB58wcLKvY+0/5jcbPZqQg39H5nBVISVR
	G7Nj2lYqT5cjLrGW1s0LswNYW5xjSxSAHo8/SiPTCdvb/E6Y6KhyT1Zg1FgTDGquxcCgW9jztYLb+
	94vNnU9Rd+D1bCRmkLT56HQGRg2wvZ6iad2unNZGQ73ycwEfQwZCeZU7QLfGPk538+NZaDLWbRMi3
	zILQhVlCftFKbud9JykkzT5RmHPW449O+iZHp/vLFPUFhiUb8X39dvH6oN05YhaCpYZhtiHL52Pkw
	Qx61WPZX8umqXDLDOF7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2Wwb-00000004zcj-162s;
	Sun, 20 Oct 2024 14:30:09 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2WwX-00000004zbY-1mrl
	for linux-riscv@lists.infradead.org;
	Sun, 20 Oct 2024 14:30:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Content-Type:From:Reply-To:Subject:Content-ID:
	Content-Description:In-Reply-To:References:X-Debbugs-Cc;
	bh=c8OwalKN/einu7unYL2zrwmG3433Cw/yB0G2xU4t9rQ=; b=dAyw6bpQ+Wz1leHkH9cvdO39Nm
	fngPmqnv1U4CWTTIkFui4x2R+PFoROQhuVLhj659h1deKyEfSjcIv/2Wc5Y3GJeXKXWKE/X2WuSRY
	vmkvBvC6Ef9hWP3IEdXH5iMpogNeruNwuvX5DmqQEnLg1G50gKANYOaEpBXnE+SUQEeVgGIbSVdu2
	Q9bD3ubEO+YER73zUeya0qIq9jBCSRQXYu5PxcXIWkiEuP5aIBW99Vr1ywMWI5hTxtufH+gaj1taP
	0NIa9BE+GvYhy/y12MMtbXQ9eskley/iKQUldCt36i6cqR+DpF40tgarIFCQ49hFe5dz9IOCNz40D
	xYGicPbA==;
Received: from ohm.aurel32.net ([2001:bc8:30d7:111::2] helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <aurelien@aurel32.net>)
	id 1t2WwJ-00BfVt-0V;
	Sun, 20 Oct 2024 16:29:51 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: William Qiu <william.qiu@starfivetech.com>,
	linux-riscv@lists.infradead.org (open list:RISC-V MISC SOC SUPPORT),
	Jaehoon Chung <jh80.chung@samsung.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	linux-mmc@vger.kernel.org (open list:SYNOPSYS DESIGNWARE MMC/SD/SDIO DRIVER),
	linux-kernel@vger.kernel.org (open list)
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	Ron Economos <re@w6rz.net>,
	Jing Luo <jing@jing.rocks>,
	stable@vger.kernel.org
Subject: [PATCH] mmc: dw_mmc: take SWIOTLB memory size limitation into account
Date: Sun, 20 Oct 2024 16:29:31 +0200
Message-ID: <20241020142931.138277-1-aurelien@aurel32.net>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241020_073005_935471_503022D3 
X-CRM114-Status: GOOD (  10.31  )
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

The Synopsys DesignWare mmc controller on the JH7110 SoC
(dw_mmc-starfive.c driver) is using a 32-bit IDMAC address bus width,
and thus requires the use of SWIOTLB.

The commit 8396c793ffdf ("mmc: dw_mmc: Fix IDMAC operation with pages
bigger than 4K") increased the max_seq_size, even for 4K pages, causing
"swiotlb buffer is full" to happen because swiotlb can only handle a
memory size up to 256kB only.

Fix the issue, by making sure the dw_mmc driver doesn't use segments
bigger than what SWIOTLB can handle.

Reported-by: Ron Economos <re@w6rz.net>
Reported-by: Jing Luo <jing@jing.rocks>
Fixes: 8396c793ffdf ("mmc: dw_mmc: Fix IDMAC operation with pages bigger than 4K")
Cc: stable@vger.kernel.org
Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 drivers/mmc/host/dw_mmc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/dw_mmc.c b/drivers/mmc/host/dw_mmc.c
index 41e451235f637..dc0d6201f7b73 100644
--- a/drivers/mmc/host/dw_mmc.c
+++ b/drivers/mmc/host/dw_mmc.c
@@ -2958,7 +2958,8 @@ static int dw_mci_init_slot(struct dw_mci *host)
 		mmc->max_segs = host->ring_size;
 		mmc->max_blk_size = 65535;
 		mmc->max_req_size = DW_MCI_DESC_DATA_LENGTH * host->ring_size;
-		mmc->max_seg_size = mmc->max_req_size;
+		mmc->max_seg_size =
+		    min_t(size_t, mmc->max_req_size, dma_max_mapping_size(host->dev));
 		mmc->max_blk_count = mmc->max_req_size / 512;
 	} else if (host->use_dma == TRANS_MODE_EDMAC) {
 		mmc->max_segs = 64;
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
