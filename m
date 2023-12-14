Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEAB7C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Dec 2023 11:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZrWAjrUgU3BuTu+BzPLhIeYNMJY3uUPKrxj8ZUz14Kg=; b=aehNqKNpJXe/lU
	3ODfh1Qud9kJYxx5qhGlBbP7FcA8M6hMZhFDPiTuR7njx+VuJp2KbXIiR1m9kEVwk4uPADnRcX2bN
	S8YaeJWNDicX0wQkPlItGdM71Zhp1lSFhCqktVpqIoJOtXkKjAZT5moGLWoXgSR5tQJQsYi8+RCo4
	6ekU9Fua0smed+ROabS8yN1Lf/uaaoUVQuIVGHoVunsDhIxuJc4hRNGfxISYkWhyoMT1RTlRdsnyU
	kqrHQngRJXdK+nu9gp53uvI5z96mW/psSpACxV0lrPuAWAgAQ+mOYEt980Obdlg0B/QFmspyNeEIM
	rex3OMGFTSDdmfUEzAHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDjT3-00HZTQ-3B;
	Thu, 14 Dec 2023 11:01:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDjT0-00HZSi-33
	for linux-riscv@lists.infradead.org;
	Thu, 14 Dec 2023 11:01:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 19DCE62191;
	Thu, 14 Dec 2023 11:01:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC7ECC433C7;
	Thu, 14 Dec 2023 11:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702551681;
	bh=yWvb1FzC/LQ0zIM53RNXJVNdCzBlRFmPP4IvR0lED6w=;
	h=From:To:Cc:Subject:Date:From;
	b=aymJVjGZ0c6Wz8Q/9vkMjqb9E9hqLcaMz4j481/++0UIev0aRRPySnWl/1j04B+mj
	 Dq++vUTOx5NgqQ+ffd5uv3NhDYtpxjAvu6pb3tih8nN9YnnPI9gcXX1tlvq+HXorqc
	 cjS9CP43GzjwxnU2uVBRMPBSz6CYXi5GHV0izKwBoOQeKW4GLgarZ7ORyX/1IHvehK
	 OmvBzKO418z3dIrLO9+ExYGyAowAuJ5+Lhqbgfm/EGvvaiTqL/id3M0H9jhOuKWedO
	 7uWkY4B6rNwzNXXLiHtAmNfEeb52ZEDKALw6dVebwJ/v1FNpyjf1Hjkh0oWkB9dkAe
	 AbIdtAqLOkVGA==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] clk: microchip: mpfs-ccc: replace include of asm-generic/errno-base.h
Date: Thu, 14 Dec 2023 10:59:57 +0000
Message-Id: <20231214-dipper-earshot-72eef3059961@spud>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1199; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=uthDO4MEgzFI/RKi4V+giwgtXg1nFE5ZOPfmIqVEYHc=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDKlVD7Rr5ubMtU/Uc2Zf+bVZ/Njua47TKsLWcJsL2ueLb H96YsfpjlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAExEn5+R4XGtr+2aPxKuz3Jv nAl9wvZTm0nkoOCkpKv/PDrz1Z9WMjH8j/8bee3i9YX/8k/Ni9Pp5GQJKmSsNj4kwPbEIKGopOI oEwA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_030123_049265_CCFBF7BD 
X-CRM114-Status: UNSURE (   9.21  )
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

As evidenced by the fact that only 2 other drivers include this header,
it is not a normal thing to do. Including the regular version of this
header is far more conventional for drivers.

CC: Al Viro <viro@zeniv.linux.org.uk>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
--
CC: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Michael Turquette <mturquette@baylibre.com>
CC: Stephen Boyd <sboyd@kernel.org>
CC: linux-riscv@lists.infradead.org
CC: linux-clk@vger.kernel.org
CC: linux-kernel@vger.kernel.org
---
 drivers/clk/microchip/clk-mpfs-ccc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/microchip/clk-mpfs-ccc.c b/drivers/clk/microchip/clk-mpfs-ccc.c
index bce61c45e967..3a3ea2d142f8 100644
--- a/drivers/clk/microchip/clk-mpfs-ccc.c
+++ b/drivers/clk/microchip/clk-mpfs-ccc.c
@@ -4,8 +4,8 @@
  *
  * Copyright (C) 2022 Microchip Technology Inc. and its subsidiaries
  */
-#include "asm-generic/errno-base.h"
 #include <linux/clk-provider.h>
+#include <linux/errno.h>
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
