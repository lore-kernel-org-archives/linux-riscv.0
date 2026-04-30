Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18CD6FF8875
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 10:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=V3LUAg6w7EUaQdPJ5wSRac/l9zvCKb8v0RRGA15/gww=; b=HkIjOfia9O5QqC
	NmWTKHJrebSoazL1FmxFVtBTWZZHqlyC3HBubEpijsVqenr/+1sCF0pTtmxurhXJYJup6SOMk3ipz
	Z4mn+pw/8BWgdQWhZV2tdPvQ5u8a23i8yp3hODstGRc4yAy/gzQzO01JgPjYeGYxrBq7/3HVs/UeV
	Z56KL8PZTWLeAGljhOs9VGJqNOp/ZV4j//pn2wjJshl6TTeYytjU49NzcY7YeayzmtUUTE4cxN177
	ZL0OLrUiXEZ/m3cYOmVzKODkgynMfWapQreMyGMxL2E4uT/zhM8Cbn5sphlFwGYEgztpjiaxK+9ZP
	NIiwZekqzNrQw364WezQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIOfb-00000005COP-3pFt;
	Thu, 30 Apr 2026 10:30:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIOfb-00000005COJ-0pd6
	for linux-riscv@lists.infradead.org;
	Thu, 30 Apr 2026 10:30:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8291160180;
	Thu, 30 Apr 2026 10:30:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E729FC2BCB3;
	Thu, 30 Apr 2026 10:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777545058;
	bh=DmeSSTIGufqnT9oymE4UEk/rZkHHJ5nwP7hD8//UdrQ=;
	h=From:Subject:Date:To:Cc:From;
	b=aWSfmgyxckA5I2LQl2tRlWPVi9qkuSzqU7XBzwtvqKm1KhejCvSOQpDYAnR8/ghAa
	 jGuIl6wU+kbizMFQFParI6Xx5bf2vMFJGYaT6RzFuBOKG+vesj+cG3uJuxXPFp14VI
	 DEN2Jy2GWttleO8xyEjSKGoSVWYbsf0ijRJJaZA47A7bKMRq4slbPVILfNFn2JPSk2
	 92T4+eI96MRRpyS3Vz1Pd183+3DUjzUFLR9Uw6VPD1cqGBxnFpzr6pGsKycN5DddPw
	 V15CJzYmsaEoIKkw4HW4okayE77MAy8brLA5UvMIeqeSL//kubsSSgDAMzKwzlxe+f
	 hhucfVKamqZTQ==
From: Yixun Lan <dlan@kernel.org>
Subject: [PATCH 0/4] riscv: spacemit: k3: some clock fixes related to PCIe
Date: Thu, 30 Apr 2026 10:30:25 +0000
Message-Id: <20260430-06-pci-clk-fix-v1-0-32fdc77c02ab@kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAEIv82kC/x2MSQqAMAwAvyI5G4gLrfgV8aA1alCqtCBC6d8NH
 mdgJkHkIByhLxIEfiTK5RWqsgC3T35jlEUZaqoNtQ0hGbydoDsPXOVFVtvZmawhCxrdgVX/w2H
 M+QO8afqrYAAAAA==
X-Change-ID: 20260430-06-pci-clk-fix-e60487b07607
To: Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Inochi Amaoto <inochiama@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=898; i=dlan@kernel.org;
 h=from:subject:message-id; bh=DmeSSTIGufqnT9oymE4UEk/rZkHHJ5nwP7hD8//UdrQ=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBp8y9Pbw0UXF6v+Sxj7RgIpbKiDLeZUszFWSa/s
 2RNtRpR/1OJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCafMvTxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+1hYRAAhpFGnBLjpvTIg3GcabvxnDktWdIcTYxFZLlnhrNe2Ro7+57RbD4ea
 Qv1HiMYuaxCfFtdgcvg9AqIkPmcojzHYegSn62QlqCuFXIOV/I+caqbaM3ejVOnpUPMelJnxZBY
 JG8wXf9k2MouF/IGZs5zPeg+Bc1DAHfEYl5FPvQFXTnLF4Zd6v+sOwVDbhU7LfsFcXMqtey0qI+
 9HomizpGDOISaSqh6RS6ttodaeuxNFVEfqddNJ7jU9l8S20IyUT7qocn5/XcDryEjgigStE30Wt
 N/Bjv5itBBMJ7e2tJ37A6pwp3vsbSrjljj2hp1HYQ/VTekKNpD4qewFEDD34md8jk4+YJOmcRPW
 MGcmJJ4hDcP6kmb6JYLFwEdp9bVpiNyzOXMqwDvfeyTUiELbyarxsXxjccv6nGG4yT4oFcbknTs
 NFERPN1sM4HdEOUmNZEz+tWyuruchuP3l65kPTUlycOFdZmN+Kaz4ZxJxXUjkAe+mbT6FyMbuLd
 ar1IQboD+GA39OlkGuy/d49jQMvfcWgFDiGD867I2MH8MXoqO6HYODTuHqHQt/8T/1AFWT/qWIR
 HJqleS4bRxzD7TNyB5I47GjheZmug+zFmwb5GHXX0fF/rnliKzpn4Mja2nB5pkV492Cxs5zycuF
 laMbdX4dbuRuQeCRGcCx0RCToMeX2k=
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

Here are some fixes for previous patch set in order to make PCIe work,
Add PCIe DBI clock which was missing, Fix the parent clock, And correct
the PCIe Clock CTRL register offset.

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
Yixun Lan (4):
      dt-bindings: soc: spacemit: k3: Add PCIe DBI clock IDs
      clk: spacemit: k3: Add PCIe DBI clock
      clk: spacemit: k3: Switch to pll2_d6 as parent for PCIe clock
      clk: spacemit: k3: Fix PCIe clock register offset

 drivers/clk/spacemit/ccu-k3.c                  | 30 +++++++++++++++++---------
 include/dt-bindings/clock/spacemit,k3-clocks.h |  5 +++++
 include/soc/spacemit/k3-syscon.h               |  4 ++--
 3 files changed, 27 insertions(+), 12 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260430-06-pci-clk-fix-e60487b07607

Best regards,
-- 
Yixun Lan <dlan@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
