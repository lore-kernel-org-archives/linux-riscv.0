Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F817C43327
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 08:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HUMitoTNS3FJ8Mf5Dz+QYeVPfZFsOQvGCgP1rW8j7uI=; b=P6Xb+L1dlMNn3x
	p1rHBok5j9gYaJIFTu9/ZIvzJ2TgZ92QCrYgVBugo/c6wkGOMkGU5QL3uIjhxpXIPV4puMObW269s
	ZnXdlL7XR5vHyVG+MYcAb9liAuB357dJ7CtXM81eH5cpZiTSEUN2gfDXA2jTVHySqdZjcrLryRy+f
	9mHZdiGU/d4Bm3aQ/Vv5+tO3P6PSr6XAQs+GdeY7znuSuEHVUbjf1TiqHfn7PtWSR+/32Csze3jRV
	XF/V+Bf46F5rHHsriqfjt7iz5WKMGPDEWV8QVMUV2HlndM/f2TnesnnpbJHbF2fRHk1ci0FhiqSVf
	h0pvhUKHoFmeIDT+VvXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUE7-0000000GJdV-01YE;
	Tue, 30 Jun 2026 08:53:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUE5-0000000GJdK-2KnU
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jun 2026 08:53:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C93D44184D;
	Tue, 30 Jun 2026 08:53:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4C921F000E9;
	Tue, 30 Jun 2026 08:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782809632;
	bh=SEnLCfN3BLX37SaNDMuUiKxagO5YKWeLAoW/iqtR+Uk=;
	h=From:Subject:Date:To:Cc;
	b=oMCkZrk8hqHv822HEe2iSUISS9XiHn3hCxwPZao6u7xbQu2d5dNahVGMf+NePYBFL
	 GI2uHa45B/EbjvbHGsPk1gW0zSf9qFv7F7XtBjV5dX3IflR6tQomNBsxIj3mqwuM9x
	 7jLCBAxCpr9Av6UDRD+GPwCh7Os3j7K/cNoaG9sLPNBWVC9PEzgpVcNZQX8aRkvnlF
	 qU6PV+TY7D/gbUn3n2tNjoB8Y0BDSl153VZQ48GwxdUCvSkjzYvJiGpnFjZE9tue9m
	 nJyw/fh1RjCnRlot36Um/9jLEoNifGplddzq1JVp6juF2jCO0pdEpqzhJCKcJZcrcH
	 uO+97WBtrMEWg==
From: Yixun Lan <dlan@kernel.org>
Subject: [PATCH 0/2] clk: spacemit: k3: set few clocks as critical
Date: Tue, 30 Jun 2026 08:53:18 +0000
Message-Id: <20260630-06-clk-hdma-critial-v1-0-443c0ac88c5f@kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAP6DQ2oC/yXMTQqDMBBA4avIrB1IxI7Uq4iLJE51rH8kKoJ49
 8a6/BbvnRDYCwcokxM87xJkniJ0moDrzNQyShMNmcpIkdaoCN3wxa4ZDTovq5gBc/siY22h6K0
 hlovnjxz/a1U/Dpvt2a33Cq7rBwY67Kx3AAAA
X-Change-ID: 20260611-06-clk-hdma-critial-4b56abb70691
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: Han Gao <gaohan@iscas.ac.cn>, Vivian Wang <wangruikang@iscas.ac.cn>, 
 Drew Fustini <fustini@kernel.org>, linux-clk@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1144; i=dlan@kernel.org;
 h=from:subject:message-id; bh=MjGhlwrMf6rAwEoM7MJMPKBf8giVSOjCTKFxZcjlQdM=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBqQ4QU/vBYJyw7nICHXT5s9zQy1d1Dzas9AB3of
 T773n8og/OJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCakOEFBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+0vzA//T4XJpV//HntlX6hJWVAblVdjtMJFOVqqzwks/5PgbQJA78FW72d5k
 bq8ucYoxLyZRTNWWc8/0efZ/Hs3a1ffhiuVb+f0txLCWwJHyYHShoB9TzrPGYbEyV4YlzkdlDf6
 +XmuRiAy9EXk82ykmVrPZI1dRvxkTmdg3UgCNIYd1sM8LsM3GJHz2dzdlOUNMCYQOHLsbw1kq7n
 Uh+Dw/6emzjG6020kiW9FGnIymz3zbl5/TC3bwFhO0G5Nfn950RB9h6GLnJl+UZzbMx55/Ywxt3
 /KATNFEL0IjN8JASQ8c34LihbaZuGtiAafEjm67f7MmfMbFu3YaLvX5L0VGvt+z41fzw1TS8fMa
 4S2GdtM4FXJCILUfB/iYnaRey+g2s0EblHv0pRdVhb5bYN0X2suxyUf/KZYlEUj66bRDwgbxLBD
 xQrdYBEw/SA/TBmgY4HUgDAjLBStFKNDc0QqJ9f6LZB5PyuwQgYdpHmPeG3IpX99WXUejJvrfoW
 TbhPqIcEmfepGmMbSRjZxGhC8SfxJ0LKZ6QeR1QNPPkmHoI0P4cyAhUk5sDw2ljIf2S8ALx7oD7
 NluL01OFU+aMh8SceabLeYqHdwYWmx3uhtWUSSA5IGnEihl6DUkmkm1sW2Ojiz9tx6SOa360DCr
 YC0Oa2KRgsC52OGZhxOvhrEGmXQNzU=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
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

Some clocks in K3 SoC need to set the critical flag so it will never
get these clocks closed.
  The HDMA clock provides the clock source for internal TCM access path
of X100 RISC-V core, and from the real test case, shut down this clock
will cause whole Linux system hang in a quite minimal environment with
only ethernet, UFS modules enabled.
  The RCPU clock is needed for RCPUs which are two RT24 RISC-V cores and
it's responisble for running ESOS instance. ESOS should be always kept
running behind Linux, so set it as critical flag to prevent it from being
shut off.

  This issue was reported-by Han Gao off line, and I didn't discover this
due to 'clk_ignore_unused' kernel flag was enabled.

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
Yixun Lan (2):
      clk: spacemit: k3: set hdma clock as critical
      clk: spacemit: k3: set rcpu clock as critical

 drivers/clk/spacemit/ccu-k3.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260611-06-clk-hdma-critial-4b56abb70691

Best regards,
--  
Yixun Lan <dlan@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
