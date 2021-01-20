Return-Path: <SRS0=Zzcc=GX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 834F2C433E0
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jan 2021 01:30:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D36F20449
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jan 2021 01:30:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D36F20449
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jKH5cU8XIjCuqYPV8BWL6RoaaqtHZkZkKOTqwd7mEzo=; b=rQ2qET108jKRb4V1DlFvEw4SL
	UORwulvN+FmB8vGaqpaRfPbiZSqFn4wZpzSTNdK09F3nHVmx5q0/6Z/c24ywees5tidxqSO4ox+Ag
	0Qud5SjY7osFLTXv2hWdGJuuvQCNazLyTIk3IvZPlA99xXdY4yl09aBSpkSUzWeaapFwqhypQq31f
	2gew3USIpJmJuZ7fqKT3o002OYqG1YKUdkRszjR3Th+7gqrivAdavluLQFo+FG2egy3WTkTRgbfat
	WSR3GF9satv6g+rlTjAubmZIRbGbQTL5R8xpYTv7yR3iDk8rz9wCGR+GQL/sUjCETm+v5GfLVZg0R
	DJTpv/HuQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l22Jh-0004i9-EN; Wed, 20 Jan 2021 01:29:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l22Hl-0003Vj-Lk
 for linux-riscv@lists.infradead.org; Wed, 20 Jan 2021 01:27:54 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6EB902343B;
 Wed, 20 Jan 2021 01:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611106068;
 bh=fh3hSnC/5iIHOmyQW3B6HvCww7SFVWDNsbfQNMfehvw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PoFq0WUnCvgT8v6y08vYB6rc7rLqMDMQ8d6AsGwOdUC6LI0eoJrPsJpBKY6omTc0W
 2tgWLFvPfwhvRdg777AWrp7EDO/HfR/Y6sezke94W4g6lURerGAIMd4CVaGouAR1Md
 nI7YheT6dUJjNVNjpcr5HG1NmSLq29dBT59hHD5cFjBrm+IEZyxSD5xlWX/rZO833G
 G5BnxfbWa48LYv3cRvVx0G9wvG/UvYc/cbWw0rblR5LsQdzpS6Vq9MjrcOMOdb+4bF
 aUkM8XiDu9A8uPX0aXbEVfZjISIBQMc8EQRf+/B4PI8U6liovi5WsRbO1+Jp5+cDhV
 wNND5DsacRcKQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 05/15] riscv: Fix kernel time_init()
Date: Tue, 19 Jan 2021 20:27:30 -0500
Message-Id: <20210120012740.770354-5-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210120012740.770354-1-sashal@kernel.org>
References: <20210120012740.770354-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210119_202750_988157_721D2260 
X-CRM114-Status: GOOD (  10.85  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Stephen Boyd <sboyd@kernel.org>, Sasha Levin <sashal@kernel.org>,
 Damien Le Moal <damien.lemoal@wdc.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Damien Le Moal <damien.lemoal@wdc.com>

[ Upstream commit 11f4c2e940e2f317c9d8fb5a79702f2a4a02ff98 ]

If of_clk_init() is not called in time_init(), clock providers defined
in the system device tree are not initialized, resulting in failures for
other devices to initialize due to missing clocks.
Similarly to other architectures and to the default kernel time_init()
implementation, call of_clk_init() before executing timer_probe() in
time_init().

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
Acked-by: Stephen Boyd <sboyd@kernel.org>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/riscv/kernel/time.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/kernel/time.c b/arch/riscv/kernel/time.c
index 1911c8f6b8a69..15f4ab40e2221 100644
--- a/arch/riscv/kernel/time.c
+++ b/arch/riscv/kernel/time.c
@@ -12,6 +12,7 @@
  *   GNU General Public License for more details.
  */
 
+#include <linux/of_clk.h>
 #include <linux/clocksource.h>
 #include <linux/delay.h>
 #include <asm/sbi.h>
@@ -29,5 +30,7 @@ void __init time_init(void)
 	riscv_timebase = prop;
 
 	lpj_fine = riscv_timebase / HZ;
+
+	of_clk_init(NULL);
 	timer_probe();
 }
-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
