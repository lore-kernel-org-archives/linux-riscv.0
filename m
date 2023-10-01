Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94CDCE748E9
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Oct 2023 10:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1XjTbEVptMvt8KN0npQfZgbBdUV4hoIHZw6H871ikbk=; b=QALtUQ3QIoOO1b
	apsOx++oCETEumhD0MVLYSz0Ln1XLFdEJ0ar0od+Y8V4tiSHdyY6gIRemeJmvHOuZhMl8fgtMoM6F
	qJTHaZJI+LTpaRQuCk+63HzkBLcAzSZkUyUpLmiBDgyQ5/Q9IhrCRRzIt2Kw+rbbMlK4bWiEZhBTb
	/t6Wi4Ol1rqzetpP2Mk8yLWR3iuevqDmzUBZrl0DwVcaEwpAgrvvACp/mOjLfCmeupVX1UicqzMbK
	ZlOB1GVzRNvbb+LJJ5lP71EWZXZf6+DcREkVYg2w0jKWI5zIL8qGjHpvIKd7QTWir8KEKd3PDGJVE
	KS3PELjybr6hxsVAm2Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qmtsy-00AxfW-1C;
	Sun, 01 Oct 2023 10:41:16 +0000
Received: from gofer.mess.org ([88.97.38.141])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qmtst-00Axcj-00
	for linux-riscv@lists.infradead.org;
	Sun, 01 Oct 2023 10:41:14 +0000
Received: by gofer.mess.org (Postfix, from userid 501)
	id 69B1C1007F7; Sun,  1 Oct 2023 11:41:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1696156860; bh=gVBdJAWOE0o0vU7SB8ig0DdgGzLeB2wfdDWJdDa300c=;
	h=From:To:Cc:Subject:Date:From;
	b=dIbflrWTwCM62xqK9voZvIacX9XKh96C82d4FMjrRi1SxFGDZfEapWVHiGTzaU7q+
	 kjyKa4AxorZtbbGIgd3Tpmao5pCXJUMd9T/nL405QH90FqVDj8osO33K2jKU0u+E73
	 53FbRWr7nlB1+3QqOcIkEKLP3+43j0mQyK/8/sRyBM4IuAW1RFn5pB9nSFemTYg7fB
	 FB7AwEzU4z0f+54y1FK4U1WuGvrejJSJUC3A0OuiyU8U8XVD2WVP9gs9YqbTpDjW+G
	 VIhod3XbsDWBuPT/yx/OeNghD7iVeHEOda7kuCH/EAWUo/ZKUO+YQZ07yUk12MywDe
	 9muvEKxSp+jDA==
Received: from bigcore.mess.org (unknown [IPv6:2a02:8011:d000:212:ca7f:54ff:fe51:14d6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gofer.mess.org (Postfix) with ESMTPSA id 868E9100072;
	Sun,  1 Oct 2023 11:40:59 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1696156859; bh=gVBdJAWOE0o0vU7SB8ig0DdgGzLeB2wfdDWJdDa300c=;
	h=From:To:Cc:Subject:Date:From;
	b=SgEN2bU/xfuRc7ykCsFNx0bwcxcemlZvlvIgt+i1ODfoOeBAHYoOqETYQtAH14unx
	 +6Kp/BacK8GnYNsrWZzw96JZqB9E9f3aHJT7zT/5FaZovisesC4ox0DrWpyC7lCyzT
	 qWTRfBMYywIrD29e/lulchAJAPcbYkZfxv82PZh1J7MHRu082zcC9BdcQN439kEci/
	 Vv2DUgGh/Xpi6WYR0pL15nxdDe2AuN32lovSLP22bGzG6GLcX4YfWnwCG8TjUlP4ns
	 em5qiYGQFgAmntzrXJqk6ZEQ4RqTS3ecjRsIQD1BUH0nk046b7Ijv1L9ETIuy07Pqu
	 Lq6q6cohvZiqA==
From: Sean Young <sean@mess.org>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Cc: Sean Young <sean@mess.org>,
	linux-riscv@lists.infradead.org
Subject: [PATCH 0/2] Improve pwm-ir-tx precision
Date: Sun,  1 Oct 2023 11:40:28 +0100
Message-ID: <cover.1696156485.git.sean@mess.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231001_034111_201072_656FE774 
X-CRM114-Status: UNSURE (   7.30  )
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

The pwm-ir-tx driver has to turn the pwm signal on and off, and suffers
from delays as this is done in process context. Make this work in atomic
context.

Sean Young (2):
  pwm: make it possible to apply pwm changes in atomic context
  media: pwm-ir-tx: trigger edges from hrtimer interrupt context

 drivers/media/rc/pwm-ir-tx.c     | 79 +++++++++++++++++++++++++-------
 drivers/pwm/core.c               |  2 +-
 drivers/pwm/pwm-fsl-ftm.c        |  1 +
 drivers/pwm/pwm-imx-tpm.c        |  1 +
 drivers/pwm/pwm-iqs620a.c        |  1 +
 drivers/pwm/pwm-lpc18xx-sct.c    |  1 +
 drivers/pwm/pwm-microchip-core.c |  1 +
 drivers/pwm/pwm-omap-dmtimer.c   |  1 +
 drivers/pwm/pwm-pca9685.c        |  1 +
 drivers/pwm/pwm-renesas-tpu.c    |  1 -
 drivers/pwm/pwm-rz-mtu3.c        |  1 +
 drivers/pwm/pwm-sifive.c         |  1 +
 drivers/pwm/pwm-sti.c            |  1 +
 drivers/pwm/pwm-stm32.c          |  1 +
 drivers/pwm/pwm-twl-led.c        |  1 +
 drivers/pwm/pwm-twl.c            |  1 +
 include/linux/pwm.h              | 27 +++++++++--
 17 files changed, 100 insertions(+), 22 deletions(-)

-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
