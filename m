Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12D8EC54EBC
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jan 2023 12:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=A6ORwA6tZ7fjz3UexeKf5IWeNF8Z7rnUKp2Tem9cstE=; b=0/YjHjLLrqeZq/
	3uOkvGFjD/4bFYNNJS2fbcWQ5nvb/bsnbL8FXAcewlM3BjY0G8r1gyMtcacJpGROnpN+QqUbABiw/
	m34WAiX/pmIH+IEZX/Ru1FUHGMpnbtybH8Jb/JRQl1HfuOEioTVdAGAdMvik56+XxXQUAV8ba6/tX
	xrSzZ2OBM2ft6AJlE5dKSkNzLwE/DQsibpOnWxgX9IdAI5C3R7ZkszmRTrZWPtvZhjiPJXzoo2rY8
	F4+YgJzEteMA9e7JvHck7ZJU2iQ+gbvXCFO7FlaTyic+75O9Qi4TCtVnbP/bXi7zg/4gE2x14Ko/K
	PaD1olgAuoR65ONlNAmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDmEd-008D7f-Gr; Fri, 06 Jan 2023 12:54:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDmEb-008D5m-2v
	for linux-riscv@lists.infradead.org; Fri, 06 Jan 2023 12:54:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7372661E14;
	Fri,  6 Jan 2023 12:54:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1A03C433D2;
	Fri,  6 Jan 2023 12:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673009648;
	bh=9OL97J5DVmt58eLqxYqqXCT8n4gaa6vk02PhksdcpEA=;
	h=From:To:Cc:Subject:Date:From;
	b=GM/1p7uMTa148lqHQAWn13SyQp7sDTNfj9tX6LlyTwWYDzU28HPXoFKj3rRWBQaOr
	 MMCz13d8ZTG/h9er6YMZrl97BIbUUDjT9fsmvpVUxn9/3Wpj3aZmSwsMe/AkO6pw54
	 APuc6r5aWyZurYNRK9G4oLYUc6t7jg7jOCkUQ3oJx5+bnKVgYqE7UoEVuZX6xLbppJ
	 owh+ScTwf8WZEfKGn4Q0N9bOXI2CiPg8Dy9Rx1XA9s5AUsfM17VzkehXsp1rJqMquE
	 kqsi0gbs+lqGsXoWTRkzqfyCfnBYxXX5bwt+FaPDyT5yCEXjeLR1glITG5RyAJMbQl
	 ah2NolqofSHFA==
From: Conor Dooley <conor@kernel.org>
To: palmer@dabbelt.com
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH] MAINTAINERS: add an IRC entry for RISC-V
Date: Fri,  6 Jan 2023 12:53:45 +0000
Message-Id: <20230106125344.1685266-1-conor@kernel.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1031; i=conor.dooley@microchip.com; h=from:subject; bh=4WlKep8boTYyEpf+roAAXt+p8qji/ZjShpRJgFgsKXE=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDMk7JK9VnRN/F9ryI8ClNffV9yk7sixOPY78n/b4nLWKrnOw wrbIjlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAExkahTDP9V1mn7PN1eIbziqydOZXH LtWO+jePVMm0OfOCL/M2q84WH4Xxg/8UXmzJZw/tj/0+OiBNJ4M6Pl66xmBKk5Hiwy+3KZDQA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230106_045409_218604_8742FFC4 
X-CRM114-Status: GOOD (  10.71  )
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

I remember being told "Just ping me on IRC" about patches, but googling
at the time was not helpful. #riscv on libera is not linux specific,
but a bunch of contributors etc do hang out there.
Add a link to the maintainers entry to help others find it in the future!

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
Since it's not a linux specific channel, my feelings won't be hurt by a
NAK. At the very least, this patch may make some people aware that were
not previously.
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7f86d02cb427..ea4a40a7cc2b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17949,6 +17949,7 @@ M:	Albert Ou <aou@eecs.berkeley.edu>
 L:	linux-riscv@lists.infradead.org
 S:	Supported
 Q:	https://patchwork.kernel.org/project/linux-riscv/list/
+C:	irc://irc.libera.chat/riscv
 P:	Documentation/riscv/patch-acceptance.rst
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 F:	arch/riscv/
-- 
2.39.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
