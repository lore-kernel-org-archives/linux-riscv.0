Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F323EC433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Nov 2022 22:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=x5rOuOjH/OrJZh+iqKq/hR+wAmGbBUHoJZnI2ZGdbEM=; b=Yjj9GAq6OZUe7U
	LlK7wzAzsHGENiFpYQhbL/NuDJ+uv164OfoVxRk7GFND9XngyGpNpIdI02cB7W7t0KJjCYxaE3DBr
	QGrJ5zPWcJED3G7D6o0bkc8FDk15KwB012gmf6qnBENo0imXGM7MrCu/5aJa5U9Ul8cClWWHl+C73
	wAhw8223jE/tRshdvVVwwARbFZWDzh9nZ2nw05oB0wh6LXqmqIEtQ9yssIrE3An6f7vgBQJ6rwr3Q
	zEWcD5wteUuOr9JH+Wr/Rfqulq1UtWBc0CJ2HnYjus8hqCZQsjUhXorE4Iz38jVDOjIE5MVah7UIz
	t2ILvVhOeBa6hDNw7YUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow9jT-008kis-EI; Fri, 18 Nov 2022 22:21:11 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow9jQ-008khQ-Hu
	for linux-riscv@lists.infradead.org; Fri, 18 Nov 2022 22:21:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D06DFB82564;
	Fri, 18 Nov 2022 22:21:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57381C433C1;
	Fri, 18 Nov 2022 22:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668810066;
	bh=4DoYnw76fqOF8eoz1c60HE/LDDgiMmHOaEFrZSG7zM8=;
	h=From:To:Cc:Subject:Date:From;
	b=toPfbsH/EUCweFHQkkcTAJAYHlBhpjWw6HJuieDCirr45iDNrounR1QQbmJu3XkbT
	 SQTLhLHW+fTgvDx8tt5VSbBO4EI73wCapTukbtkBQRtfJHD0R9sCAOwNEay+zl9PaK
	 hVxQ0i/j9Rpqr3ljz16xoInTo/spcexxVq9gIdN668vjKAtoqefmcmDz/DcBOQQxNe
	 OrId17JArabETsrwELjHo9VaRVM8Mo9sfkiVlTPF7ZOk2F8TsSiXU5RfV3AF2yWWQD
	 u3TdTCADxuAfV0cKjafQcn3aSEJJWLnGr4VMvJ71WwvA9H8P4fqXxWUzPwNbZz84Qp
	 0NeCaeR4vIFaQ==
From: Conor Dooley <conor@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>,
	Jassi Brar <jassisinghbrar@gmail.com>
Cc: Daire McNamara <daire.mcnamara@microchip.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] mpfs: fix handling failed service requests
Date: Fri, 18 Nov 2022 22:20:42 +0000
Message-Id: <20221118222043.1214776-1-conor@kernel.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_142108_791755_A1EBB38D 
X-CRM114-Status: GOOD (  11.34  )
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

Changes since v1:
- Send the patches I meant to send, with an extraneous ; removed.

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
