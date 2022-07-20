Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9F34C43334
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jul 2022 12:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bMFMsGHBPGwD693HGsR3En11tQriCLv99Pu+o8T1ztw=; b=k/X0u3go8zSh6z
	qwRqu4a+b1mMIxMKQxXUIPsFTIjVXQwSkK/uwCPVA14zaevqhR8lg2ew306mtS9CMOj+NJFgi33KF
	tkUcwKJF8dhTKFn5/vnAxPowRyqXLjCoUW9i0Ib6iy2w3LhSDp59GgwwRJVin9bZvzx3rvOhJvZmg
	VcT0U/1RsCNi5ZddAd5LU77y5WBxKQwI05k+fHyd7XgELhI+7wScxD5fcoS+WOzbzauuLa4yK5dKh
	IQZR/nFesGdAeLZQt9yH65khD6mICprF0TUtcidkDrnWkIuXTz74Ti4gSsxDAh9S0JFTCuC+2ESnh
	JlRyHlJXHQllG7Xxq/5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oE9FX-005bcp-82; Wed, 20 Jul 2022 12:56:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oE9FG-005b9F-6F; Wed, 20 Jul 2022 12:56:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1BA311576;
	Wed, 20 Jul 2022 05:56:01 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E830F3F70D;
	Wed, 20 Jul 2022 05:55:58 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: Sudeep Holla <sudeep.holla@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Pierre Gondois <pierre.gondois@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	Guenter Roeck <linux@roeck-us.net>,
	linux-acpi@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Ionela Voinescu <ionela.voinescu@arm.com>
Subject: [PATCH v3 0/3] arch_topology/cacheinfo: Fixes for v5.20
Date: Wed, 20 Jul 2022 13:55:37 +0100
Message-Id: <20220720-arch_topo_fixes-v3-0-43d696288e84@arm.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_055606_333150_54145519 
X-CRM114-Status: UNSURE (   8.15  )
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

These are fixes for the cacheinfo/arch_topology updates containing [0]
queued currently in the -next via [3].

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>

---
Changes in v3 from v2[2]:
	- Dropped mapping and unmapping of PPTT at runtime using
	  acpi_{get,put}_table() to avoid "BUG: sleeping function
	  called from invalid context"
	- Added tested-by from Geert

Changes in v2[2] from v1[1]:
        - Changed the cacheinfo per-cpu allocation to be atomic
	  to fix possible "BUG: sleeping function called from invalid context"
        - Added all the received tags

[0] https://lore.kernel.org/all/20220704101605.1318280-1-sudeep.holla@arm.com
[1] https://lore.kernel.org/all/20220713133344.1201247-1-sudeep.holla@arm.com
[2] https://lore.kernel.org/all/20220715102609.2160689-1-sudeep.holla@arm.com
[3] https://lore.kernel.org/all/20220706124644.2276077-1-sudeep.holla@arm.com

---
Sudeep Holla (3):
      cacheinfo: Use atomic allocation for percpu cache attributes
      ACPI: PPTT: Leave the table mapped for the runtime usage
      arch_topology: Fix cache attributes detection in the CPU hotplug path

 drivers/acpi/pptt.c          | 102 ++++++++++++++++++++-----------------------
 drivers/base/arch_topology.c |  16 +++----
 drivers/base/cacheinfo.c     |   2 +-
 3 files changed, 54 insertions(+), 66 deletions(-)
---
base-commit: 7128af87c7f1c30cd6cebe0b012cc25872c689e2
change-id: 20220720-arch_topo_fixes-d91d43827aeb

Best regards,
-- 
Regards,
Sudeep


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
