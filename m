Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEDC6CD3427
	for <linux-riscv@archiver.kernel.org>; Thu,  7 May 2026 10:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zWg1NWqLZfvG9rAT498Bso+puNvsjOk9egST/9eqKRs=; b=Y+4uGXdUIkAG6i
	B1B0scxA3kIpiN7w5haQ0+EPvxvo2c4kdH5f3/aigdXog6qfAOsZE9cc6fVaBFXGCLj6+5fEDPw3O
	e/VwSWc+YQLs79bUiycbnrYHYB3SvCisMdRu5kem9Z36ROIq/2qwnWATuVxq0bfLdaXLjL1lCSC7J
	2qFv7xtVWRT5AizUXAn4eJPwUcnLKrqEpEf+V3H8mJsm+fcxBZ6Fi49TNAmmfNBv/U5vSt6NX901M
	w3J5+I2cU6CpDcwkW+tqOWx0wpc9+lgutEKv40t5kYaCi7XTyDJZnRtyhQqCZDPWd5tbunyMW/7if
	/BHK+MFQOPHOcx1LDjtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKw6J-00000003VDu-2e7X;
	Thu, 07 May 2026 10:37:03 +0000
Received: from bg5.exmail.qq.com ([43.154.209.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKw6G-00000003VCB-3maD
	for linux-riscv@lists.infradead.org;
	Thu, 07 May 2026 10:37:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1778150203;
	bh=Gj+W+N7im+aQQ8FFJbTvQJn0dNoasXq83/GNhZL6xwU=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=b/iB98Qxr33fDr1N4cROaWUU80Xk0Fi6Y8/cAB1y+t+deRKcfYVeU3AVZxxjCwfxe
	 o4nKoEjH88H13GQRO8NecrgCfkwSHovt08q02jzJrU/uRxZc3WoY5Y092mIV1zyPzh
	 th3q2bpDX2tZGaZXqZ48DkTiwxPUvgy7hSe3C71Q=
X-QQ-mid: esmtpgz10t1778150201tb51ce93c
X-QQ-Originating-IP: T6++f6lRK+n6ypX3y/ZECT+G0QZ4TApbmsD2W8JptP8=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 07 May 2026 18:36:38 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4507917310872199054
EX-QQ-RecipientCnt: 20
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 07 May 2026 18:36:22 +0800
Subject: [PATCH v5 3/4] dmaengine: mmp_pdma: add Spacemit K3 support
MIME-Version: 1.0
Message-Id: <20260507-k3-pdma-v5-3-6b9743038026@linux.spacemit.com>
References: <20260507-k3-pdma-v5-0-6b9743038026@linux.spacemit.com>
In-Reply-To: <20260507-k3-pdma-v5-0-6b9743038026@linux.spacemit.com>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778150183; l=1936;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=0uBBuEM27xA3rpe8lKTZJ07znj6/zACtY5VL6lS0imo=;
 b=YarURs6eql25oUea+1GkYffFXSwwGIpptcv2PTQdlBIvFqKFVeO0tCYz+0IBNJg4v9KHxiYAg
 NPYiVM8FyKlB6CkJHZaclYjs1H/4/Ja9bA+oD+WTPnCGhDqM+pVqGZg
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MW3wiet0EsO3ZtRRGasWQ0A1hgHuEXzsASyoHuEo8mPrQ+1DfqXpo8t5
	fh3tM4KRdJbXdSxsEdRCRNUhr2jsXPr05QJrCHas4cePkQUWWLYb3POKV+DhAsTXw/WTae4
	6zWb6hD8+Jkj1O3w7EY48yU5cqyoVv4nPGT1YqO0Hk7uEIBojUrVgZAEBaZgUzP3tKxVo8I
	Rc4LMBmjIVprC14Dde3LWItqzWw8P1ZyOsGjjUzRTj+Eas5w13J8TfVcuFmBWwcu/xHx/+B
	gDQhGtE0Bf1fiZ4EBAj1mLvpAuOhfTPtUaCAQE/hNlPHH5V1EBlZacBKzbS7az991S0Dcp/
	yTBrph4gwFCO++iQQcor3dhqryQ/bQowUm5K8q/nnKVVg9YA4etT7Cyb4zzv0Z83rBZCWlB
	PL6Yd7yuX7/SnNMzUX+9wepjQU8+UScLKiBfa72509nDjpfTrSF7P7rNe+mwUoL3MzlyMfq
	eHcHjsRaHODSgH7uu3xJi8LIgdbhWkEnObzOIIbWhRkQUdmO63KhPg4aCxvxRmR1KJkO0oN
	UH7jhNdCiO8ncizgnJlr3R+k3uJVO2TTUGqd07czQfpi0Y5+fgT00yKt6y4IDTZs+WMdbQY
	jwBChB3wXdINsUSDYFg6IcVNjuC26HqBIJtF7V3wksX7iNXVPMUCR4KH0NG8QQ7l9GeycIZ
	zPegJuUmF/Q390xSJkAXAUSqmG3Gf2vQRl1T3NvJH04J+zUEaWMvJuH+r9mewmzPhJ7PT4x
	+2A64LOML8AvahrXpBoEVVqOX1QtDXqCcWTqqyHKYHMLZZJbSP44qKaZQc3xssYd1cx1ho4
	MJN3SFZC3Of7nNWrDDfBhzyoI8inxfuLI5O4xwChTX9lISXber0P0H4sQihioAGBuVqUMO2
	efOVJANAcFJoWEV+ilhiH0cmiiW6aKxG2t2Y+RvNgNgYTVtVa5CdbK7KoSFXwG4HNxPUNer
	d7hczzfEvx+qZXnprk/JhPWVSQxYF/EhBXjCUqNe+JMgpNvL121feuguyPkIDyEEsSbwSNz
	0wwarlz5B62JkS9n8Gu7LMs9PAMIu5dfR/4ApSlKyTI603musngchtz6+yniKm1rFYlJx5Q
	jCPOoEYqvBYmqxIl8jOX/CCZkY1zjlvBCCvOrx212hjh2cjeeunkq4KapCjfHAWD4gv5gRO
	l3EsX8Ro+2OOiaI=
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_033701_249971_0FF490DE 
X-CRM114-Status: UNSURE (   9.81  )
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
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
