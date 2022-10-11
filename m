Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 520D5C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Oct 2022 16:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dPBb6d1N11ViqkbMU9Vx/ZpE0cuYskq1eE9lzWrsjro=; b=C5fob25Sp9RVFd
	vsr8cFTHvvfE6Fc77YcG8+rAHAhqYTT5XMl/EVQXbhL8/oxv6U+xfruTAY0tIHFv3h4b4czFzBnQH
	rxht1rewRidWg03djNNpsOvDiH+D2OU16uZUhjqW3CQ4L462Bom7UBq+lr9f3bXd6Id8rhDtf/5HV
	tgUixOSXp3fgdTZIC4ZV6JA8AhrffZOtfcjIq6rHim2cd6Yu7Qz9F187UbCrN3Tw4UF/h23JKCKmX
	BQToQ5qGyh2+R9GkC/zLfxG04p9r2X2RRNCtwqXLLFa5D0n3cVu8/QoAY+1toxyNLYM7wydNBEESp
	KMQ0DXrQomE0Djxfl5MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiHzp-005An5-E5; Tue, 11 Oct 2022 16:20:45 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiHo8-0054Hu-Ve
	for linux-riscv@lists.infradead.org; Tue, 11 Oct 2022 16:08:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4AB21B80E05;
	Tue, 11 Oct 2022 16:08:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B9D0C433D6;
	Tue, 11 Oct 2022 16:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665504518;
	bh=D95GJN2ZqfFPbNkLIubvK2kaDhSDq3wBcfTty73n7Bs=;
	h=From:To:Cc:Subject:Date:From;
	b=KYy063HAR7/ZhBZojg8vji9tNiKDvQ7LIF4Zij+c3HBlscx1M3Np7pKFirvHK7GsX
	 E1UFROv4aWSi0f6ZOfzCz0wD0OJjaWKH30ATJf3tH2kmMx2E4eiBZMXePfBK368eCp
	 nf3EG+y0WVABObsF5/AC3x5ZiOxyqsiCjz2WbwT8LgTMixnYUGmYfRTxyhjwiLuO7J
	 0WcwWxw7SSC7BLFPGbZdKzwFhdH/BBTO75RU5ezfV/WGorMwNIxp9f21cTxxG5neuO
	 tqt7Mz9M8ilLDEcsj6QVMWuThtGCSeL+BYfozAXObXff4+vRq+qfR91+auBN9xQSpw
	 jCk5qftL/ZBfw==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: palmer@dabbelt.com,
	Conor Dooley <conor.dooley@microchip.com>
Subject: RISC-V Patchwork
Date: Tue, 11 Oct 2022 17:07:45 +0100
Message-Id: <20221011160744.2167025-1-conor@kernel.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_090841_232660_452CC9EF 
X-CRM114-Status: GOOD (  16.17  )
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

Hey,

As one or two people have already noticed, we've resurrected the
patchwork for the RISC-V list @
https://patchwork.kernel.org/project/linux-riscv/list/

The patchwork bot should let people know when their patches have been
applied. Hopefully it'll help people track what the status of their
patches are a little better and try to prevent stuff falling through
the cracks in Palmer's inbox.

As an FYI, the statuses that are intended to be used are:
- New: No action has been taken yet
- Under Review: The maintainer is waiting for review comments from others
- Changes Requested: Either the maintainer or a reviewer requested
  changes in the patch. The patch author is expected to submit a new
  version
- Superseded: There's a new version of the patch available
- Not Applicable: The patch is not intended for the RISC-V tree
- Accepted: The patch has been applied
- Rejected: The patch has been rejected, with reasons stated in an
  email

I reset patchwork and marked all patches as archived so we would have a
fresh start. If your patch has been archived & not applied by the end of
this merge window, feel free to resend it.

Thanks,
Conor.

@Palmer: hopefully I did the scissors thing correctly..

-- >8 --
From f886e8a9def4bd3f2fa8a0a4d7e92c94fe72ea72 Mon Sep 17 00:00:00 2001
From: Conor Dooley <conor.dooley@microchip.com>
Date: Tue, 11 Oct 2022 16:49:53 +0100
Subject: [PATCH] MAINTAINERS: add RISC-V's patchwork

The RISC-V patchwork instance on kernel.org has had some necromancy
performed on it & will be used going forward. The statuses that are
intended to be used are:
- New: No action has been taken yet
- Under Review: The maintainer is waiting for review comments from others
- Changes Requested: Either the maintainer or a reviewer requested
  changes in the patch. The patch author is expected to submit a new
  version
- Superseded: There's a new version of the patch available
- Not Applicable: The patch is not intended for the RISC-V tree
- Accepted: The patch has been applied
- Rejected: The patch has been rejected, with reasons stated in an
  email

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8a5012ba6ff9..e2882dc703d8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17516,6 +17516,7 @@ M:	Palmer Dabbelt <palmer@dabbelt.com>
 M:	Albert Ou <aou@eecs.berkeley.edu>
 L:	linux-riscv@lists.infradead.org
 S:	Supported
+Q:	https://patchwork.kernel.org/project/linux-riscv/list/
 P:	Documentation/riscv/patch-acceptance.rst
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 F:	arch/riscv/
-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
