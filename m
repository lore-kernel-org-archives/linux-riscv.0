Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80049C433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Nov 2022 22:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xhptYQTow6/2NwSfbNZZ3GR6vqY5TyfNimBXv6KXsmE=; b=hM2tXfIs1sqAYo
	WVrR6mIQYJSCoj3HYUVMXaCytT9MAUQ8T1ZY5T8knRqcZFXXCg7+9KL4578GkCAlk8Px/8hH3nhu7
	yDb9sVMnuV+Vtrv361qeKM4YaCPeLnYc7ua6Gk+SeZFuXw4XBo8JLpvqnLaxOC7c98hAi7nz0Finu
	aQ3eLYc0sPPswurBy8x5+JTReMwf8nu5vwvDvgYDJoqiIkMJhPVHk2LNdQfAdsMtWvHLm++twI2I+
	+Wa8wgpLuMuKgr2q16CUSWIBG8kYwgJ3TcXR0cW4eX7+op3d9s0RVlFlGi6Zd84EmpsUO1MQ/TZUu
	ax39uksWUodYlSdGVbcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow9XA-008iqs-Fp; Fri, 18 Nov 2022 22:08:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow9X7-008ipV-D4
	for linux-riscv@lists.infradead.org; Fri, 18 Nov 2022 22:08:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9EBE7627B3;
	Fri, 18 Nov 2022 22:08:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA198C433C1;
	Fri, 18 Nov 2022 22:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668809302;
	bh=1wQ7JjkjhAaO9Ity46ObMNK9mNLSNyW/QVbeLpROsMw=;
	h=From:To:Cc:Subject:Date:From;
	b=F+N6AsMUrOfRP9wtEAmh3z3seyOLituSlGhUgmw5UCukH7jLh5J1TMFEYIj1Py2/t
	 pgSstGTM3P1MVTrihu2KY70ofIpGUra+kJkfYUjUXD+7Q4kQZVsVehUXgRWRXJsGdx
	 ssGKtwkJ25kRFGlwvjSeSD/yWfsHMswBcowfg4Tu+Qp7mm8wL0+wMmo5fH2+PuMecJ
	 uTW25lRqVUdzr17DQhxkYNzRSEUpwr1NcNzGvhFZDL3rt60UZCClrFbas2DjS4p7Oi
	 PsOEGqmsYTW2EVK72jfs1uJ85nuajlwmcfek+haV24QEhzEOm8jzbzpcJXCMocwqll
	 DFEmGOQT/fQJA==
From: Conor Dooley <conor@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>,
	Jassi Brar <jassisinghbrar@gmail.com>
Cc: Daire McNamara <daire.mcnamara@microchip.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] mpfs: fix handling failed service requests
Date: Fri, 18 Nov 2022 22:07:57 +0000
Message-Id: <20221118220758.1101409-1-conor@kernel.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_140825_620975_FB69BE08 
X-CRM114-Status: GOOD (  10.82  )
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

As things stand, if a service request fails, we never know about it as
the status register is not read. This is quite obviously far from ideal,
as we would be reading garbage from the mailbox if a service was to
fail.

This pair of patches adds handling of the service status to both sides
of the mailbox implementation.

@Jassi, there should be no build, or really functional, dependency here
between patches. In the failing case, the buffer is allocated by the
service driver, so things will "work" just as badly as they did before
if only one of the patches is present. As a result, should be safe to do
the mailbox patch via your tree & the client via the soc tree.

Thanks,
Conor.

Conor Dooley (2):
  soc: microchip: mpfs: handle failed system service requests
  mailbox: mpfs: read the system controller's status

 drivers/mailbox/mailbox-mpfs.c              | 31 +++++++++++++++++++--
 drivers/soc/microchip/mpfs-sys-controller.c |  6 ++++
 2 files changed, 35 insertions(+), 2 deletions(-)

-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
