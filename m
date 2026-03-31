Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EC5DFF60EC
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Mar 2026 08:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5ivafbVldCl1EGJoXDmFJf/vYGNLWo0P6ZjbIiQuGuA=; b=N2Z38lQdZRHiq2
	5Xv3dljoiswUNg2c0nPbNIvRcBa3jRagxL1TP4w8SsKzeLjZw+oRUjdDpQfgW/XJR2jqh3hB5em8E
	ZReoVOutdQPV1v4Vnz1LQxPBUYOhTYakDIMAkwxtu53eGYce5KNsTJ0J3aAB3Eits6EJa18gSRf+b
	x8vcyq+kTnLcCLGnt3eboFh6Dx787MEysI7IaQFL/TrBXqEKPPWie9f60AFiCwJVF2JuH74Roxys5
	ueoEe0qjhi1w1RzRCVh0U/NmFVl25n6eWgwe/EEZklzrF2GCbg8ZjM1CnLv6A6aivQPIeW2LoW2Xf
	KBPy9qoDG0qikFPOJSvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7USB-0000000CarO-0Vov;
	Tue, 31 Mar 2026 08:28:03 +0000
Received: from smtpbguseast3.qq.com ([54.243.244.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7US8-0000000CanL-3U46
	for linux-riscv@lists.infradead.org;
	Tue, 31 Mar 2026 08:28:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1774945651;
	bh=AfkHhDGLpLQTzVSA1vGgmpyjp0IbMp4aeirdAoHtZNQ=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=xISPJjvjLIISW4iDIrdj5u+IRJJm/XTnX7ZG4vd93uuH8DkHFO71fLEVNkS+zYGfk
	 wLKUu2bGNVqINki4bfd9m4cWySUdTiOAtNzGolrh1QgaQd4BrFGB+G1vLo36bvD2HK
	 Gw2DaSpOsdTz+y+gHdUVto5BBMuU9vnDlkRPcvbo=
X-QQ-mid: zesmtpsz8t1774945649t3f9fb1fc
X-QQ-Originating-IP: pSoIYL+Ok+X2z86E2GPV9+HUKi5ghFbaPNIDQuTAFvM=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 31 Mar 2026 16:27:25 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10790581914033576037
EX-QQ-RecipientCnt: 20
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Tue, 31 Mar 2026 16:27:06 +0800
Subject: [PATCH v3 3/5] dmaengine: mmp_pdma: add Spacemit K3 support
MIME-Version: 1.0
Message-Id: <20260331-k3-pdma-v3-3-a4e60dd8b4b3@linux.spacemit.com>
References: <20260331-k3-pdma-v3-0-a4e60dd8b4b3@linux.spacemit.com>
In-Reply-To: <20260331-k3-pdma-v3-0-a4e60dd8b4b3@linux.spacemit.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Guodong Xu <guodong@riscstar.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774945629; l=1936;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=naSKBQlGCncc4Sjkd1TAFqDT0cym6ceyGaNaHvhlkkc=;
 b=JzGVaBB9r087s/TJzpcykTwUhsUXS625HWzNd/4ybcfN3ErXRVU9yKPkhbgiyil8P6xuBcEyD
 eVJV4BQITBlCzPy4HYXt29gmevZnEQgyo9UbEE4MPy6Ad8BxcDmePhV
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: M/gYBZzTb9iML1mczemgHAV4c/FA4lQRCwpRf3EriTxc/nN/foLPyfek
	pv6QjtWdKn+sS1V9lZ12k1G78L40lijqvLBsf43f0w/zwmTsFfJULhdUegHnnF9SN89lyrb
	IusU0mnX+BQgesw2Lq+lLw3UEAmGtHt7rnbQddm1djj2xWLSQaa2PfwWctu8W5mMpszdCOK
	pwPqkKuZ7AFov6U3lfBOkebfYKp8BspnGGUO4aWL7s3vuH8/7nhd4VgY+SX8yB8bapa9txo
	4s4dOOdVVXMgMClrG31gRU8Fpx065ahhuS+9Wich/BX7Ifnq0Em/60xuoE/Ewb4AXlNo8Z/
	fDpFd7hp4XTIgGS8EPIV+N07pP74jDf+2chwqM94v18ttGBfyEZ015x/L6+w5bK9tFwbQcW
	OK8Id6QaW09Sch6iyrAAIxKjkn8iyZSw7nXVBC+aAjp0KVK8OX8d+blHmp6A30LfWCVxs4q
	LXHkqsN9H9nGBrOMCegM+IFibwPh5jNDOgnMCiEzkU4Euh8z3x95DVwppzDaEVF6YSApVvi
	MUPUuk1PnYtN0xHJo1FVJNtNt8hTbkYrh2SMrTNxsxI3MT9TlnJzpc9Ik/SaG1rhpOWGD4X
	c/1h7LMQVSMuzTKPjnE1vS3rH+tpQBai8XA5sMlkmr3HKtcd3RPP7YM8Op1tCGwuRMBfWDI
	5Ziv7Jg/NOt54owx4I2mWld8KQyyOjViCz15YL/MuWF1xIrw4Z0BKdVShjBm7ZdiEdxX9V4
	cNVAPd3SWU/ukl7tyUNLR813QHq9TBUSPcvRNG//PCdJ4AmJ8cmOfmTyWC+tNQhbKHZ7XqH
	aArOlg8y9C3BevlTjKGdc+IQgUaGHK3TOQlZEoeCVOuMwbiJEJ0skPztwCIqazlt7faj2o/
	r8THwBzIGtFjWvVwwxuZ9DDD7upGJN/4fFSri/190cWUBd/+rWRt0iOOYJCfAFo+WEesVzh
	N32U0BAK5WWQKmODQ5Xc2Pei8e+Gr0VsggGSO548KNjzD2HhAzEftdZmkhO6QkR8S7T6JzQ
	wGHZIRgtiUS7rWTuHJDiEtLhOEvCtXtx9oZv/UxuIxOefgqDAl5tnCFjeygZBtsrgIKfHVP
	engg9OVPewgjEnd2sq2gBHufNGgqu6pRThvWd7KXGK0Nzn4PY8RghaLg684GzCTfWvpGgcv
	ePFK
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_012801_361173_9958DFF5 
X-CRM114-Status: GOOD (  10.07  )
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

From: Guodong Xu <guodong@riscstar.com>

SpacemiT K3 reuses most of the PDMA IP design found on K1, with one difference
being the extended DRCMR base address. This patch adds "spacemit,k3-pdma"
compatible string and it defines a new mmp_pdma_ops for k3 pdma.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 drivers/dma/mmp_pdma.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/dma/mmp_pdma.c b/drivers/dma/mmp_pdma.c
index 6112369006ee..386e85cd4882 100644
--- a/drivers/dma/mmp_pdma.c
+++ b/drivers/dma/mmp_pdma.c
@@ -52,6 +52,7 @@
 #define DCSR_EORINTR	BIT(9)	/* The end of Receive */
 
 #define DRCMR_BASE		0x0100
+#define DRCMR_EXT_BASE_K3	0x1000
 #define DRCMR_EXT_BASE_DEFAULT	0x1100
 #define DRCMR_REQ_LIMIT		64
 #define DRCMR_MAPVLD	BIT(7)	/* Map Valid (read / write) */
@@ -1207,6 +1208,20 @@ static const struct mmp_pdma_ops spacemit_k1_pdma_ops = {
 	.drcmr_ext_base = DRCMR_EXT_BASE_DEFAULT,
 };
 
+static const struct mmp_pdma_ops spacemit_k3_pdma_ops = {
+	.write_next_addr = write_next_addr_64,
+	.read_src_addr = read_src_addr_64,
+	.read_dst_addr = read_dst_addr_64,
+	.set_desc_next_addr = set_desc_next_addr_64,
+	.set_desc_src_addr = set_desc_src_addr_64,
+	.set_desc_dst_addr = set_desc_dst_addr_64,
+	.get_desc_src_addr = get_desc_src_addr_64,
+	.get_desc_dst_addr = get_desc_dst_addr_64,
+	.run_bits = (DCSR_RUN | DCSR_LPAEEN | DCSR_EORIRQEN | DCSR_EORSTOPEN),
+	.dma_width = 64,
+	.drcmr_ext_base = DRCMR_EXT_BASE_K3,
+};
+
 static const struct of_device_id mmp_pdma_dt_ids[] = {
 	{
 		.compatible = "marvell,pdma-1.0",
@@ -1214,6 +1229,9 @@ static const struct of_device_id mmp_pdma_dt_ids[] = {
 	}, {
 		.compatible = "spacemit,k1-pdma",
 		.data = &spacemit_k1_pdma_ops
+	}, {
+		.compatible = "spacemit,k3-pdma",
+		.data = &spacemit_k3_pdma_ops
 	}, {
 		/* sentinel */
 	}

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
