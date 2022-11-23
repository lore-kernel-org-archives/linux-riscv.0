Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4A24C433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Nov 2022 17:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZCUp8aolZa6aI/bgtt802ay9JXvr4V7CYsLFAQBnbeQ=; b=krV9MExhaWS1RB
	Cy/kjhi8IIDb+Pob4WZQcGtur97TdaZ2kHxFYM7GlS3FE+8ug2VFEVSUoQIcI9zOkGEdJ6MFNCqck
	vtDB0dTvRdb4WBoklF3r8bsJKEYEapq5vt6bsx3YrKCIH5gXZ2+8xvppl5VzwHqG3vcsJ77PDhzwk
	iOE4usavQce/hBZMdShomfP1UUXxJn4/V9pww6SirGp4uGm9Lv3IFC/2DPcMiUQbq3lCcKYA14Dmn
	gN7C7WEKwcGpHE/zK7OIWKsYBNb0n/07GJu/4lSW7nCcK77H6mkHIYR92IgNk6e9f2swA+TMpIG+z
	BXJWY3iFZBOXO2cj11Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxtzf-001MBX-2h; Wed, 23 Nov 2022 17:57:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxtzb-001MA8-Mg
	for linux-riscv@lists.infradead.org; Wed, 23 Nov 2022 17:57:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3742761E14;
	Wed, 23 Nov 2022 17:57:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D91BC433D6;
	Wed, 23 Nov 2022 17:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669226222;
	bh=6aDFV5RMFM5DBqnyJB1qLRpyfmh7jSd5EtX3DfmwNSg=;
	h=From:To:Cc:Subject:Date:From;
	b=Ym0VZzwIOsstyS8D5VA1M1eFTiNe6v/3kXa0eSggXOtR6ZzzUtHZ3woFScjuQXA3x
	 7+s/BaSS/yc14eBcbHjSOp4nKydL0JB8PicV/xl4ulzC1hQvDwA8RB3YnTt8YeFFa4
	 MiJRrP3j1bIYheQHGh6AmHrcwa8GxbcOUp967j147j6krPcp7kDfRaUoeZB7zfDQuJ
	 HZroZ/z2lYnBSA2csJBaV1+fRSt7nBcOSxi7n0SOIwBHlaNjOBfyHeYv1eJ9p2LPc4
	 UGzRXyootOIIs+d7kltwh1wmBUo1o/KdmPtga/94RnYjKX1loXkkPIKI9qhE2HiU+C
	 gaC6vDwpk4Obg==
From: Conor Dooley <conor@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>,
	Jassi Brar <jassisinghbrar@gmail.com>
Cc: Daire McNamara <daire.mcnamara@microchip.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] mpfs: fix handling failed service requests
Date: Wed, 23 Nov 2022 17:56:50 +0000
Message-Id: <20221123175652.327859-1-conor@kernel.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_095703_800658_607ACB84 
X-CRM114-Status: GOOD (  10.81  )
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

Changes since v2:
- Stop redefining the already existing #defines for status register.

Changes since v1:
- Send the patches I meant to send, with an extraneous ; removed.

Conor Dooley (2):
  soc: microchip: mpfs: handle failed system service requests
  mailbox: mpfs: read the system controller's status

 drivers/mailbox/mailbox-mpfs.c              | 31 +++++++++++++++++++--
 drivers/soc/microchip/mpfs-sys-controller.c |  6 ++++
 2 files changed, 34 insertions(+), 3 deletions(-)

-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
