Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F6F4C3ABC3
	for <linux-riscv@archiver.kernel.org>; Mon, 12 May 2025 01:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bVNRdnt0y2EhUaPlMVn5z782vJMDoMykNNAu6DL91NE=; b=YtAVdQc0PqArOS
	ekiQ+8dWq9Fv56oxMMkg+lQk/y5nsdLb/WL5Xn9uwRanUmsZSSndYDty6amlbt/wEs2xbawb7ydx3
	k7RB/XhduwWpmPxz7KDnHG0K72ndD+8oW7RhahXxRIV/mn9VbOQVa1KWOeovxWbj0XBvjQpMIwLIJ
	b98fcQ1dV86XMAdFY3OgaAoMyQ/ZGfmQQpHzQSjdDkaJ9eBU3Q3O1XDDHCfQ+UDM9gpmvJTTrR7BV
	aE//oxlED84jPBezSfIA5J67cB18PvqcKzQreDKZ2LBP/pE7/de+9fEJbrsbGVJiRwotyetdvNeyf
	mRNm4gmz7x/jjVnn91jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEILb-00000008A3L-3Zro;
	Mon, 12 May 2025 01:52:51 +0000
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEILZ-00000008A2v-0bRk
	for linux-riscv@lists.infradead.org;
	Mon, 12 May 2025 01:52:50 +0000
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54C1o2fa010354;
	Mon, 12 May 2025 01:52:32 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46hws897r3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 12 May 2025 01:52:32 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Sun, 11 May 2025 18:52:31 -0700
Received: from pek-lpg-core1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Sun, 11 May 2025 18:52:28 -0700
From: <jianqi.ren.cn@windriver.com>
To: <gregkh@linuxfoundation.org>, <stable@vger.kernel.org>
CC: <patches@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
        <jianqi.ren.cn@windriver.com>, <conor.dooley@microchip.com>,
        <daire.mcnamara@microchip.com>, <broonie@kernel.org>,
        <linux-riscv@lists.infradead.org>, <linux-spi@vger.kernel.org>,
        <steve.wilkins@raymarine.com>
Subject: [PATCH 6.1.y] spi: microchip-core: ensure TX and RX FIFOs are empty at start of a transfer
Date: Mon, 12 May 2025 09:52:27 +0800
Message-ID: <20250512015227.3326695-1-jianqi.ren.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: ddfC0n2bFG8K2RowdsXnojdxFQde4pTT
X-Proofpoint-GUID: ddfC0n2bFG8K2RowdsXnojdxFQde4pTT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDAxNyBTYWx0ZWRfX5Nnztdt5l8/D SVV3mfnRqnDJkxOee7tvqYMAZifI3w4leaO0ySydfTLsw81HAHCWsWQn2n+Xt0lFmabhYqfExQ/ 7xcpdRAzF1mPfbr0MMcRjscaEkMjeBncwsy1941g51LtD53hJ8ukSOpUgEDI5vhVR/YzpscxI5J
 fTIwibXqI16yz0veTX9Q3o2T+ts3xs9ua0UBEkUPoGcKde+pl4OVoyRHeiAKJqXkY+oZ8esnBAz ts5iPHjvQURwCHQ63XxGi5kFFDuZWFqi4XCHKgmyJYV3EZimD8S54OwQbfZxbJ4qXTMwEhpC4Fu ccfd4slNjXTBc7f+7ngKNjkb5mOg6PY0V033wdXk6D1eY9/fmMy65BlNvNyRuUT7W3RQ7/L1T4A
 ntWj/lK5Y5ubTG7SxgKs6vFlXJU97T5cseCa5mLZB77h0JOHwAoriQuqyZ4AFCqZ37fakHYA
X-Authority-Analysis: v=2.4 cv=Q+HS452a c=1 sm=1 tr=0 ts=68215460 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=dt9VzEwgFbYA:10 a=bC-a23v3AAAA:8 a=pHVxDm9HAAAA:8 a=XYAwZIGsAAAA:8 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8
 a=7GXu50SQ_wSHYa-s_9wA:9 a=-FEs8UIgK8oA:10 a=FO4_E8m0qiDe52t0p3_H:22 a=nAQHViUA29bFjphmPs1g:22 a=E8ToXWR_bxluHZ7gmE-Z:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-11_10,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 mlxlogscore=731 bulkscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1011 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2505120017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_185249_312178_871C9393 
X-CRM114-Status: UNSURE (   9.37  )
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

From: Steve Wilkins <steve.wilkins@raymarine.com>

[ Upstream commit 9cf71eb0faef4bff01df4264841b8465382d7927 ]

While transmitting with rx_len == 0, the RX FIFO is not going to be
emptied in the interrupt handler. A subsequent transfer could then
read crap from the previous transfer out of the RX FIFO into the
start RX buffer. The core provides a register that will empty the RX and
TX FIFOs, so do that before each transfer.

Fixes: 9ac8d17694b6 ("spi: add support for microchip fpga spi controllers")
Signed-off-by: Steve Wilkins <steve.wilkins@raymarine.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
Link: https://patch.msgid.link/20240715-flammable-provoke-459226d08e70@wendy
Signed-off-by: Mark Brown <broonie@kernel.org>
[Minor conflict resolved due to code context change.]
Signed-off-by: Jianqi Ren <jianqi.ren.cn@windriver.com>
Signed-off-by: He Zhe <zhe.he@windriver.com>
---
Verified the build test
---
 drivers/spi/spi-microchip-core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/spi/spi-microchip-core.c b/drivers/spi/spi-microchip-core.c
index bfad0fe743ad..acc05f5a929e 100644
--- a/drivers/spi/spi-microchip-core.c
+++ b/drivers/spi/spi-microchip-core.c
@@ -91,6 +91,8 @@
 #define REG_CONTROL2		(0x28)
 #define REG_COMMAND		(0x2c)
 #define  COMMAND_CLRFRAMECNT	BIT(4)
+#define  COMMAND_TXFIFORST		BIT(3)
+#define  COMMAND_RXFIFORST		BIT(2)
 #define REG_PKTSIZE		(0x30)
 #define REG_CMD_SIZE		(0x34)
 #define REG_HWSTATUS		(0x38)
@@ -489,6 +491,8 @@ static int mchp_corespi_transfer_one(struct spi_controller *host,
 	mchp_corespi_set_xfer_size(spi, (spi->tx_len > FIFO_DEPTH)
 				   ? FIFO_DEPTH : spi->tx_len);
 
+	mchp_corespi_write(spi, REG_COMMAND, COMMAND_RXFIFORST | COMMAND_TXFIFORST);
+
 	while (spi->tx_len)
 		mchp_corespi_write_fifo(spi);
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
