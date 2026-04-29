Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E88E0FF8867
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Apr 2026 07:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lf9yBMgYTvnJgcO5fGB/C+ebf22ZOsG2s5nSRxtmgcs=; b=dDLT+F2Eal8unH
	M1k/qcHD8Q0l51BKwMl5OdLg3g4UU81wYLDS2TBbyKy219S+KSjM3VNmxVJMwkzrI512ayUVvJVEg
	iLWUJaq3BOR7UX4JewJQXg/LXG0pS/IMl7yoTIzgep8LbKpambRgA/HFVqtEHEdOVqwE6aaH4uLbx
	fdNAJM/ag8cueJ5yD591FSNWjncrVrZQjUPGjldzsrFNyJOfYtnm2aO51N11w4htPmurVjoVQGlLp
	tYNXGj94HUeO52vzHxVjXdjAX65tY9hC1gfQXIXzbT9QtDRLlYWHpzkU72yAhHH3uxpSuksVypXaZ
	rVGgKgxT5kf2//ICyvag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHzfv-00000003Bno-3YFS;
	Wed, 29 Apr 2026 07:49:39 +0000
Received: from smtpbgeu2.qq.com ([18.194.254.142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHzfn-00000003BlI-2uUy
	for linux-riscv@lists.infradead.org;
	Wed, 29 Apr 2026 07:49:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1777448946;
	bh=i5Jd6q2ASwBOX37+hgiBc/0XfTbXNhw+dHB7po+Ag/M=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=q9n/FFIKo6IqGDEh36Jaqp82CegygeVCEIngvx3VxwfOvv2h6JMk004Pu5B2ZRd5T
	 o5DNDPcvk8WDnaSa2TV3oF4JcJKUlrs6IPYk/NKbY1gbSH67lPS1fbFFSru1l2q1h5
	 SvrBTmVhL+0L0vcGT0sxRT3lurUD20Cj6GnsFYuI=
X-QQ-mid: esmtpgz16t1777448939t3b8dbfe6
X-QQ-Originating-IP: jMIil5oH0Xt1rs2bXU/3HVr3dTF360HXTq1uWmc4p5o=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 29 Apr 2026 15:48:57 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17083034700479194089
EX-QQ-RecipientCnt: 8
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH v6 0/2] i2c: spacemit: improve clock handling and cleanups
Date: Wed, 29 Apr 2026 15:48:55 +0800
Message-Id: <20260429-k1-i2c-ilcr-v6-0-1c7a5a5a8b24@linux.spacemit.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23MSw6CMBSF4a2Yjr2krZSCI/dhHEB7kRt5pcUGQ
 9i7hYkxYfif5HwL8+gIPbueFuYwkKehj5GdT8w0Zf9EIBubSS6V4ELDSwBJA9QaB6aQuVUcU65
 rFh+jw5rmXbs/Yjfkp8F9djyk23rshBQEINq04Bc0tipuLfXvOfFjabCjKTFDxzYwqB8iZfaPK
 OBQqZzrSlvLMTtE1nX9AuDi+Uv0AAAA
X-Change-ID: 20251017-k1-i2c-ilcr-c928d50e407f
To: Andi Shyti <andi.shyti@kernel.org>, Alex Elder <elder@riscstar.com>, 
 Yixun Lan <dlan@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777448937; l=1169;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=hDCWhYWY81WE1DOC2pdOZCxy/P/R4TtpNWVhDuds9fY=;
 b=flWdhu1/sWNRwPBAsLvj7zNWqxB+JMGIKbSHYsYI6mE9NZIkiVlpNk2wQiarc2hHWN52nh2un
 oJ+7UCskgf/DKdRyzcR0xQvE6V3FlYw5I+6K4QDGuNsMRq3PdtSmFu2
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NFN0Qhrj1+QEl6Lvv2KLtnXlYEIEJ0SFpTOn3qOOgsLIG4Rs9bN3sgNc
	XLnTVvGK9RcVEbWZcjJtT7vaBMKN/fz1KomdlF2Prlb3+KFx0n3HzMdr9smWrBbmn+GJ4fY
	AZRUwzRHtAZDrUTWvb/P8bbAetRSsSMh8h32hwGVU9Muowo2L8lr1awsyAPyyR58FrIQQ4Y
	oBXANDCPyyMrD/yh95eyHcyzFJpPCIc/dAssB8fJE4F4gcO3RUAwMzOXAmavKx/T9RfIpym
	NHpBxxMEu8SD7PK+gLVPaYvN/1mJ15tWgQfy1jMOqhrIqpC8FRE0SkqZfC3lVbdemVNynGa
	wP5Wnj78ojd7rgl5EGhXonGsrLnVFYSduG0uiimFZ51nDkcFn8pIuPprI+B5eIY71Gptx9y
	4h0PPkgr3pa5O78XncuJ9p1sevR7d7eS0w0JnSkUHsog4i+Ry+oAxLEQFo+nPIg2NvFQGyJ
	lFgkINfS2MnL2thV4YXBY6ywwEjssbRkvHK2OEk3WbEGvDPcWfFoDtD8TmUKZee0Ragbblx
	VskDTlQ9FDf4hxiTg/VtnMX74dntsZkzEmU96/zPaxRBWA3sP05f7QYaYH1UW4/UqXadDFv
	SsnI+tY5lBrIRwB6iTHBEuJpaPietexBySbAj2+Smh8R1U9QPsYmzg8diyC9x7H7LUwEBEa
	kkc8adejWGV+sK+xoOsXU/Bumd+CChtwmz/CODBnWW6Q5PWfL+2JpsFNXsO17Tuj3LPmQwh
	qwFCv6aCHPq0HsoFyMMywbRj7/tQxDgfnX9l5VgTIVpfrBHwG81CJwEuh1mhwkW+Jf/+9Qw
	sOtkEi9T9DYgsLa9rvmpay3wMKhhNJ+DiAmTx2cnd8WFumuUO22yoRVj3CSmh0tsBylB85s
	jNotpBcRgd3Bp+0kDGUISCBeV2SAOld1Ser3jPUE/9IqwbKopA5kfG7VPLDXuWKESMHE4PB
	wITA7fug9sIv29KU6yQEDmAMOz8vIM4UCL7hXQKBoj+42OpNsRmNcOXds9UdwGVzav6JDg0
	ZaEGbj8vjSzBTqco6JfoFV7sSTCFb0IImp6MKu5Uai5TQ11ZHpZoNqqV9ziRkqzzoCikBiu
	2C0MpLuWImsrykO+JeOMg4F+Y1CfNcZBVDZ7Zb3BmmJ
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_004932_555930_398EEBB9 
X-CRM114-Status: UNSURE (   6.88  )
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

This patch series contains a set of small improvements and cleanups for
the SpacemiT I2C controller driver.

The main change in this series is to improve SCL frequency accuracy by
configuring the ILCR register based on the requested clock rate, rather
than relying on the hardware reset defaults.

The ILCR is exposed as a managed clock via the Common Clock Framework,
allowing the driver to program appropriate divider values for standard
and fast modes.

In addition, the series removes a spurious warning when the optional
clock-frequency DT property is absent.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Troy Mitchell (2):
      i2c: spacemit: configure ILCR/IWCR for accurate SCL frequency
      i2c: spacemit: drop warning when clock-frequency property is absent

 drivers/i2c/busses/Kconfig  |   2 +-
 drivers/i2c/busses/i2c-k1.c | 164 +++++++++++++++++++++++++++++++++++++++++---
 2 files changed, 154 insertions(+), 12 deletions(-)
---
base-commit: 9b45dba17a6b3cede80706d287d8d2fb9087bfa9
change-id: 20251017-k1-i2c-ilcr-c928d50e407f

Best regards,
--  
Troy Mitchell <troy.mitchell@linux.spacemit.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
