Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B73C4167B
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Dec 2022 11:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2j7V4quFMFdX48ynadOXloOha1nGCs6/6R5K2XnOl7M=; b=SmEdqA+dX3qi4I
	sbhPRhWbNtLIbIiZYKAXxOwwTMnMqAmNFNnWRyDTWMWhsKwDJdpN+Crn1vfi28aSOoqq9sNhkE6o4
	GI5kd6/oUdhcxi5Rz33uT/a4YdfGl+2VD7r4GpCon1iXSqCIUui+qGc975Xlb1LkCjSVzfnnpX/YZ
	KqMqmKXKxBVsRDWwnZ6wqIHY//NBr+2EJeXp+BYYkhg9FUIL9lFG80Sb8Z+UYtFVxynwQVekn7LOd
	BW4sMokRnnTPNIKIyy2WsPe2DpKuNK+U1ROOOGpWCYKftE0HTl/023sYtk4ASuPj1ClvB556d0I6W
	KdcAiqvagMADsi4mljwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7xJi-00EDQR-SS; Wed, 21 Dec 2022 11:31:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7xI3-00ECiB-F9
	for linux-riscv@lists.infradead.org; Wed, 21 Dec 2022 11:29:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BA13B616CD;
	Wed, 21 Dec 2022 11:29:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E51FC433F0;
	Wed, 21 Dec 2022 11:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671622178;
	bh=lfNjHpoobfh1U92aaCSBh/XG+o2ERNUSgOcuFcq3XyY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fxjOPEfkuUE35cupA2IwOA+xz6Tq3EgeaPvtkalOBbh43B7utoA8r//Z0NIC0uyVL
	 tyvY4maBg+uH3sxR82PWBBbpwdqqb4qPq9pCJIwMpAQkfsRyLNxvn3KRYAo6gOQzeA
	 xzxzau96vIygNa72vPU+to8oM4dCJhzwqhCWUU556h0L19jhdLpf689g9nAuJv7Xnb
	 h8V2cm+rx3yXy3HF7UFxXMscnQ5UfeS4nfCVUzbo4TSPFUuP0p7UusaXI+1Uuq9Mb2
	 ZD1qtPfSYZjqg/T1QadY21SyvgG4g2GrKq223qlSS6NMQBE2oZKgYszaQJ9GltNCHH
	 L2OaAr2hT9xjw==
From: Conor Dooley <conor@kernel.org>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Thierry Reding <thierry.reding@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: Daire McNamara <daire.mcnamara@microchip.com>,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v13 2/2] MAINTAINERS: add pwm to PolarFire SoC entry
Date: Wed, 21 Dec 2022 11:29:13 +0000
Message-Id: <20221221112912.147210-3-conor@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221221112912.147210-1-conor@kernel.org>
References: <20221221112912.147210-1-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221221_032939_607177_A495ACF2 
X-CRM114-Status: UNSURE (   8.54  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Add the newly introduced pwm driver to the existing PolarFire SoC entry.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7729a30b9609..e459d539fdd1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17979,6 +17979,7 @@ F:	drivers/clk/microchip/clk-mpfs.c
 F:	drivers/i2c/busses/i2c-microchip-corei2c.c
 F:	drivers/mailbox/mailbox-mpfs.c
 F:	drivers/pci/controller/pcie-microchip-host.c
+F:	drivers/pwm/pwm-microchip-core.c
 F:	drivers/reset/reset-mpfs.c
 F:	drivers/rtc/rtc-mpfs.c
 F:	drivers/soc/microchip/mpfs-sys-controller.c
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
