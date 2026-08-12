Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7481C5AD5A
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 09:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TS/BBLyiGiVVwu+eMvCXaSd6TN1ySb7wuyOnSiQBEG8=; b=oUK9PAy/Swvs2e
	40+tcLTNz6jBo+Wnj6va4t4s3Z6yYLS/3hrLCNZROJwjZ7IN7ZbX6FhX2tzp7Y1T0yr9m+w4ft1gy
	/DB0GcG9kxVlTDDJSRfatHcLMO4opRxpDWmlK4z7ilHNH/XBBYyWdN5Zhap4xH8C/wVXMgLZAFDyz
	PSef64wCDW6znMp532vZRXm2DJGmJvFU4JTc0VsYVTLSwW3c4Dy9fxBzLa5kIBv75GtrHI6Gcfovn
	ZJQ4DM1m9hEf9o1nO5Qu2MrgJcxFIkGrVgRRAn78tqBj2ogrh6FYLRoOZw6oo4Bnuq2M4nDhhkIpM
	Me/JQBaksMdJR2yYcYDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu5GC-0000000FkWq-4B5I;
	Wed, 12 Aug 2026 09:28:33 +0000
Received: from smtpbgau2.qq.com ([54.206.34.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu5G8-0000000FkT7-0WiX
	for linux-riscv@lists.infradead.org;
	Wed, 12 Aug 2026 09:28:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1786526894;
	bh=FIACfTE6HY9gRQUYe7MUc5uIAOvWe4xknMRb2EjO4tg=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=jzrNmO6dApx9vM+S6qrtjoidwc5DkTPXfNEpXMxIYx0aS7S5zfDhZrqLCYM6X69P8
	 Xn4Hy/BWcShanwflpC+507OPfayFcEAYAKlLpq5Pn0aF9myJpfLDJFpV7mK++kf71x
	 KxTLXDPalQLKNlbtni3xCRz90S1xADTG+PLwx4kY=
X-QQ-mid: esmtpsz19t1786526887tdddef16c
X-QQ-Originating-IP: 4ywHshY3prd/YrZlsz3cbXCTcv2+vS2r4y3VpvHJUvU=
Received: from LT-PANJUNZHONG.dc.com ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 12 Aug 2026 17:28:05 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16021684546642310656
EX-QQ-RecipientCnt: 20
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
Date: Wed, 12 Aug 2026 17:26:14 +0800
Subject: [PATCH 3/6] usb: chipidea: usb2: add SpacemiT K1 support
MIME-Version: 1.0
Message-Id: <20260812-b4-spacemit-k1-usb2-v1-3-f28cf29e522b@linux.spacemit.com>
References: <20260812-b4-spacemit-k1-usb2-v1-0-f28cf29e522b@linux.spacemit.com>
In-Reply-To: <20260812-b4-spacemit-k1-usb2-v1-0-f28cf29e522b@linux.spacemit.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
 Peter Chen <peter.chen@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Junzhong Pan <panjunzhong@linux.spacemit.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786526874; l=1248;
 i=panjunzhong@linux.spacemit.com; s=20260306; h=from:subject:message-id;
 bh=t9+vAyNBc5hbWcoEznMTg58r47M+gdps0UnYHSvqFwA=;
 b=DNePWlRca9q6sgDuGmHvfUFcfcteN+TwEO1f9979xv37Y7Zihx6Tl1gKBe/qkwpShms/x+ced
 pE/pLVo92GpAYqU/uOr23/rhG9TwBoSQpaMxD9ftlUaof7Vm0qMhUM4
X-Developer-Key: i=panjunzhong@linux.spacemit.com; a=ed25519;
 pk=bY08BOg2T9H93/jG8fEE/tVmdXoQQMp9M2rtzPFoyJg=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: MViTLAucusFcYetUF76ExbeMNcojO7kx79taiXHn0PQ6r09OXUhQNgWK
	qfuMxTmdYi6exka4WTKcwgw6DC9lOc7nPHKEz+0rSn8VX1kkt9+7uGPL2BUrtcm2KaC64qC
	JlPDAZ5PWnBvXg58Ii9R8DW8OT9/RWIWWq0vv5sScNF3SeBMVfbxMmrG/SjRlub/az0XwUL
	ovxcs2OCjvbtoKR9ph4fuVGGq1iT2plfYxTVvi8O6QzL5OW3SCcOk7VO1zVWCPc2OcnXKiK
	9HPtEPYdzj4AEseWYw0ylGsxCIv3n1odT/jSh29Fgrw1rr4eyOldq6URgamXPBoSDibbSod
	I8ek+lzdIFol/VNhAVufyO/c8JyrJYQN3An6jgm4QPFHkTypgPs9rQEpivvaxZXy/HcZklm
	U+Gx5G37IUjCJ/tGioVB9KxnmoiFQNqneMV4n7Igy1KmYYqflq+gLOb9fpmvVUoH+k8gjQH
	UCwXse40ALIbil+t/Lfp/S55MPsiecaAYhQ768bj4etnHfhl3fwLn5QrXc3OE0Hfs3M1nGH
	yFbK7+4wQrrd0iNhdQGKW5wyK+l4N/pcplGNo3aWVB/a6fKgwuS31c1v+69YZQzE6xRFALt
	N+L7nuilU9zN64+dzZb56bNwIrrl/Z54Ysqd6OQpFlD7coq/HGMPOhMF5w8e8m6O0KSTOsO
	Q6CSkpQl4rGU91a61Yj+9mw80p/vW8fQxrUHJgkXN9bIudv/8Xq/JnS2HsK/TO5M6YmxFRu
	5W5gj+PzjWOkudky813fj67zWPRMDDviI2eM7TcJA0NytlGdNHYCkf2jSvljWDgbCujUILT
	Tb6/KeZrUR9gWAZscFAglCfyamre+X058b4IDOA2mTaMJrOJWSUFPJjVIYaMKNvUTjiqC85
	5RTgFcPC6pR1QnFAmqHDHwyjOLADHbLaRpFgG8rG/ZjlRfWqZKNohC4rucVthVB7/7RiVHS
	WYIQIVC0RAu/G7Z5vE9iNRtn5Dxuvqjw8E+vWmMJjB7gI+SQ0L134sVf5nFRz6Ur1f/pJk8
	iOMtbTVjiw3exj7+TDtVn6Lqk8l4jMlmQjT5mqas/r8Cmen7182z2ooQhE7YF1VSjkBV+EU
	Wfrn2W4+p2/czmUusboiwQOFmK+QRU/nIfODx3xC8n+SsRU3laZzieiSIaHo4Butw==
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_022830_007777_2269D21C 
X-CRM114-Status: UNSURE (   9.69  )
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

Add a compatible for SpacemiT K1, and add platform data with correct
flag since the hardware doesn't have internal otg register support.

Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
---
 drivers/usb/chipidea/ci_hdrc_usb2.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/chipidea/ci_hdrc_usb2.c b/drivers/usb/chipidea/ci_hdrc_usb2.c
index 00d575cd2955..70c5ce750519 100644
--- a/drivers/usb/chipidea/ci_hdrc_usb2.c
+++ b/drivers/usb/chipidea/ci_hdrc_usb2.c
@@ -40,10 +40,18 @@ static const struct ci_hdrc_platform_data ci_zevio_pdata = {
 	.flags		= CI_HDRC_REGS_SHARED | CI_HDRC_FORCE_FULLSPEED,
 };
 
+static const struct ci_hdrc_platform_data ci_k1_pdata = {
+	.capoffset	= DEF_CAPOFFSET,
+	.flags		= CI_HDRC_DISABLE_STREAMING |
+			  CI_HDRC_FORCE_VBUS_ACTIVE_ALWAYS |
+			  CI_HDRC_DUAL_ROLE_NOT_OTG,
+};
+
 static const struct of_device_id ci_hdrc_usb2_of_match[] = {
 	{ .compatible = "chipidea,usb2" },
 	{ .compatible = "xlnx,zynq-usb-2.20a", .data = &ci_zynq_pdata },
 	{ .compatible = "lsi,zevio-usb", .data = &ci_zevio_pdata },
+	{ .compatible = "spacemit,k1-usb2", .data = &ci_k1_pdata },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, ci_hdrc_usb2_of_match);

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
