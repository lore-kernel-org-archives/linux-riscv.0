Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87A53E7AD40
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Dec 2025 07:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XH0ZlUtAiw27I1AcofbrBCQA47DZv0Y6DGC0/RZ/47E=; b=rE7Oa/iqp801By
	0vcDPp/6QR6pUPb58/El8PHYMSjG3iN8jYEKfYhh+jaJ1cnRlkezmonlnlynhyoz/gQLZsj+dGc4h
	0+gUQJjxUAXX7FcCDKVOVT/k2FnT5PGbUlmclQiNxM0ThpexrRL6uAOiWhnwn+P824FW/g8ybVCdd
	w5TF+QPDygTETRViuRu3yxm5Sk1BLXjQov8IiH1TwgTrDN78EkN5j+CwgPqAHxz4s/H2otREORMyU
	2OgBnrKRQSK93VWQhCK4cNF13zO9K7FQ1uIwD7UvxOF/AeHrY0mQy2i2EAKo+Veu/Rvrs3b419miH
	Lhd6rvvw9UvCebjVuKqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYg6d-00000000C3b-2Hg0;
	Thu, 25 Dec 2025 07:49:55 +0000
Received: from smtpbgbr1.qq.com ([54.207.19.206])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYg6Y-00000000ByM-0nS6
	for linux-riscv@lists.infradead.org;
	Thu, 25 Dec 2025 07:49:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1766648925;
	bh=eEymra0qzBDOvP4K/PwzhLAzm6ZoyhboNV8QqUN0V+A=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=pcVwHU+wNOGQjMcElbECCmQcZcdOYwOW50SauoCZ8C9N8+u+NRrs6mLH3/McPU277
	 pbLG4Hwp0G3bdgFgox2si2GiASZKDkVViqV2j3IJZeakTTckanVit7lOVrAM691fIF
	 Mu9JfoE1BcmG+tezmHIulJKEqSTlFToUs5e2IT1c=
X-QQ-mid: zesmtpsz6t1766648917td0345b37
X-QQ-Originating-IP: WYKXruI1A1CMaQX4ORLBBq/CCXBheEu1KxZcpi7QXFM=
Received: from = ( [120.239.196.19])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 25 Dec 2025 15:48:34 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5726861883151983815
EX-QQ-RecipientCnt: 13
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 25 Dec 2025 15:46:32 +0800
Subject: [PATCH v4 2/3] mfd: simple-mfd-i2c: add default value
MIME-Version: 1.0
Message-Id: <20251225-p1-kconfig-fix-v4-2-44b6728117c1@linux.spacemit.com>
References: <20251225-p1-kconfig-fix-v4-0-44b6728117c1@linux.spacemit.com>
In-Reply-To: <20251225-p1-kconfig-fix-v4-0-44b6728117c1@linux.spacemit.com>
To: Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-i2c@vger.kernel.org, 
 linux-rtc@vger.kernel.org, Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766648906; l=1007;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=xM27GTuey2voa4c/ivGBVxMn1od2yxNMdtHcPdo4Cco=;
 b=mUhg/yb5BZn95GBRopReXfuKzpAZupqgNvD7KcYxDGkydKAzmuR3gi+K+o7OKYUjsPAQ6g54z
 BwtBkPoioIWCBjpWCzP9JkBcAvMKxxtQl4Vfkg0EubnaBOz0HsqfDoa
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NvIr6BtGSx+/VIfv2E63sGeHaAkHEoTUahhz8hkmxZWpqDfVrE/uksQ7
	Ga6NyMctX+S3crf5pOWS+D+MXPJf9cwihNilJ6VfhE2F5sAA9UJeuxE5XzCkPYhCLd36j2G
	bnuB0Yk5hUSThIvaCYU7mfnhShjP8fSTjSXgqCUE2rCzmTxNJS6Oac1nopyoS6Kxl1Uv9kS
	9NsQ7fHZ84XILhGw/LIyOJRbNX7Huvq/7KLK//W0AvAw4CmvghxEx/lEhwsAKdtxc6YOiKO
	WqiGmPYNV1UA312YTAMdNeIWkf+J273kPNu3JjakzYhplNjSFv61SlGrtoY/SuwX0EiuqB/
	slw8fsyw+U7AIE9P6DlWtcrJxy1eY3uo6XLAhpn2Ri7TdO9YLq+vGWW5GlET0OaNQ4/42gL
	Cvk3s9MQqcpvomD9l4KSOPi6FxO7oeyzSuUEoxO6+6Mdu2gtfmFOpZDQtLbECoMN/PN3Rnd
	vs6PjEhM4Rgx+B2nz7tFuUqJNfGwXHNCVUPh3CKFXCLq45xmT7xOJzGt13xopWYbfaXof9i
	GDxBUXAtP4KAZdFPAqjq/2V8/CRk1USacFcnRMnbnt1o7yFoovoCCFUTkLOG35GtspDsyLR
	IHGm/QuhdvbetNBGHIgZoPOXWW/7D3lAxZ9XTHr1HE7gGmECgUJJ9+AVatGyKSMvDvP2yri
	x/LV/xQIeQ9DTErzLUvuM5PseKrceJRdOtLCEEED7d9ZN3XOfR7TjqpBX1RLngMb04y6v+l
	I6SBSTXTgpRLhVXuc9NHd1pW9HvBtpohRKHTMJws8BM2Od5jJb8eiS9JseBttVxxjbdtS42
	8cx0oSwQe5ZlKgaRvmxdwqDDhAoEkOzyvfL2H7OeIZQZrFJ9X7K7bl8RK22LrVy7NCFWseu
	IM0A+QIbJfBXxBGSs5MR26SHxTS88alMRLHz/qf0j0IADqqjsDkjgGMFm5yjqvqNjSeBKoA
	LpGbv3TcmD/WqDUxYI8dxvPH6z44on89VDoio2Zdbhh+MjdHEGlPMKKZ5F05secR+2cL2Yl
	11JxIk2/cgagz6VJdu/e7MOBYgWE7FgbtyVHQ3Wwi+5pfKIZ6TF0vcCftK5DdWSj7azB2aI
	CTcgP94C7L1HRlhi2jMiNdiK8P6rM69vDQ6h2E56ZHJ91XWuBm2/YvtlTiD8Zv4nsh7qSIo
	orxxgf612t4NPXMF2ulbI0ORM5yXKFmKNQBw2bvxOEyPl4c=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_234951_135683_3C9252AB 
X-CRM114-Status: UNSURE (   7.83  )
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

The default value of the P1 sub-device depends on the value
of P1, so P1 should have a default value here.

Acked-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Change log in v4:
- default m if ARCH_SPACEMIT instead of default ARCH_SPACEMIT
- Link to v3: https://lore.kernel.org/all/20251118-p1-kconfig-fix-v3-4-8839c5ac5db3@linux.spacemit.com/
---
 drivers/mfd/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index aace5766b38aa5e46e32a8a7b42eea238159fbcf..c757bc365029dc794c658fc5b10084a0f29ac9b6 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1276,6 +1276,7 @@ config MFD_SPACEMIT_P1
 	depends on ARCH_SPACEMIT || COMPILE_TEST
 	depends on I2C
 	select MFD_SIMPLE_MFD_I2C
+	default m if ARCH_SPACEMIT
 	help
 	  This option supports the I2C-based SpacemiT P1 PMIC, which
 	  contains regulators, a power switch, GPIOs, an RTC, and more.

-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
