Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2914CCF9E3
	for <linux-riscv@archiver.kernel.org>; Sun,  2 Nov 2025 23:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4WJmLch8cZGH/SWAD8iEOx4bDn98cu1xTfGUc6o1Z4o=; b=J26lQMi1E/UMNt
	uKPc3QGZ1coaucqoI+yc2EMEZ+e7DjZSohadzoSoV66NG+7Aqnq6tPBu+/EC5MJX793n9of1VQNrj
	JH0HoZ9gw1+if0F/uv0SUwXndbGOKAfzCZ3L1I0t0EDzQs9mAHttG7dtIfK+VhK0peXnx2bo+hG0E
	CRYs17qBLcMMntxLPrOou4aVM/NGUODhkpwHJMwpmgmjNKPeyXvOPOu5+UUr2HWOPg9WIsOzsG0G4
	fr7GoSpDRjYIaiENJbNslvzTn4p3C7rqHTVHXS6r3h9NZnsVtJCMzPTTBeR23ZtdQFVWrx2wmFtEB
	9bymc5ZpMCK/mzZZj8HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFh7R-00000008ulY-2S7F;
	Sun, 02 Nov 2025 23:04:17 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFh7O-00000008ukL-0RdD
	for linux-riscv@lists.infradead.org;
	Sun, 02 Nov 2025 23:04:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=hql68ROiQCHicq3ZGKu3LUefXDb5IsbisbAg9bD5eXA=; b=GVZ31j4joqWfYmv2qfzUWYuTzl
	FvYMq7y+iDON7MAqRHqiwoXxxgVAFnK4foK4USdvf0wSofOva8eY8ghFWij3fRats5SSaSN1xrKzD
	aS0EgXHAfYS6QBeDWDuCBPVQ6Hf83IRygZF79xXP0QX0qtd6dZKIDUE6zFNE1ClJjvzGSpw223kIl
	CWZ1ouRqaZzqrtECsFNwLfpnvK9zZp+4qmXO7u2viZC6EGw8sHZKTPdJVm3kN/kS/2UUfnlSJ0pA/
	6pfnDF294odgdQF6A6nxXP0zmnrZkV29dzReKTdHwpUoM4y/vVX4qbopj/jdr4y+hcnD8psVh0SjO
	LmSn8kdg==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1vFh7A-00000006eMI-0qhm;
	Mon, 03 Nov 2025 00:04:00 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE:Keyword:riscv),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit)
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	linux-pm@vger.kernel.org (open list:SYSTEM RESET/SHUTDOWN DRIVERS),
	linux-riscv@lists.infradead.org (open list:RISC-V SPACEMIT SoC Support),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH v5 2/2] mfd: simple-mfd-i2c: add a reboot cell for the SpacemiT P1 chip
Date: Mon,  3 Nov 2025 00:02:00 +0100
Message-ID: <20251102230352.914421-3-aurelien@aurel32.net>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251102230352.914421-1-aurelien@aurel32.net>
References: <20251102230352.914421-1-aurelien@aurel32.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_150414_567046_4F2DD077 
X-CRM114-Status: UNSURE (   8.73  )
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

Add a "spacemit-p1-reboot" cell for the SpacemiT P1 chip.

Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
v5: no changes

 drivers/mfd/simple-mfd-i2c.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
index 0a607a1e3ca1d..542d378cdcd1f 100644
--- a/drivers/mfd/simple-mfd-i2c.c
+++ b/drivers/mfd/simple-mfd-i2c.c
@@ -99,6 +99,7 @@ static const struct regmap_config spacemit_p1_regmap_config = {
 };
 
 static const struct mfd_cell spacemit_p1_cells[] = {
+	{ .name = "spacemit-p1-reboot", },
 	{ .name = "spacemit-p1-regulator", },
 	{ .name = "spacemit-p1-rtc", },
 };
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
