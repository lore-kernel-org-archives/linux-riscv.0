Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3223CC44510
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 05:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Jb8WHLk7ko3w26+XszmhC/qQd7n+SxOVT3nx8AErU4M=; b=b/8RSAoHANsoS/
	euk3Rvt1ILJewX7LSDYYhFWwZYCdyLjlTwitEZP1Uw8ydwXfJv0OqM/Wd9QfGwbzsWtt5IQKiQNrc
	6GATctKk2DhQ9YnM9/ZrnJBWOErVuiKH2i/z/ZETjYvr1cuOIDi7gK/0YblRDm9ECBaiknheF3YCh
	reqLUyOwgmPf8Dhe2aDcGsIcuf48M8vyk+Et07IiAh+3CD1v6RDLcHl2qDi3a0z5EvxWnjnWdPxvO
	FNXMS8/wez5qv+RwMo1KR6eJ8KTcfK1P9bXQxYSR2jXJU9bkb4EjZuOqJXL1P02Ih9v+4LwuRxE7G
	gEh9r4QZzISmx5Kfi+jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkEhZ-0000000GTMd-0lev;
	Thu, 16 Jul 2026 05:32:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkEhX-0000000GTMH-38bL
	for linux-riscv@lists.infradead.org;
	Thu, 16 Jul 2026 05:32:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 131C54067D;
	Thu, 16 Jul 2026 05:32:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DE43EC19425;
	Thu, 16 Jul 2026 05:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784179922;
	bh=jrgmCjWRCYkHgrBgI9ADeNJXL3DFWZsSnbuE9Bzc+tc=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=pJI4c8JUcUzZISAlFXwjjalZS1Z++wqUzp9ZoBA2/zJXNqcD7Ke2jRAAiUyw4Wfpr
	 uA7NHDzmhYoTyfFGy4jX9PZXMH0v8KRp9THJbTxTCOVvvgiTzZH7M+2NOKw9ALkWbA
	 NPzgTyIhA+i3wHa5szpt5msE/SJEaJvPD50AS25GMiQDy6d1ZEtLReR/LItLIh5WdG
	 b4PJdLKbYoUtvLseJLPMeJSn5z3eOiT8bmDa0DHX5sk6kLqDePtNZb8HtzXJe5CwN5
	 x4iEAE8LmT8b+hrzQqvbqRgP4AW6eQQzlraLfnpYvpuwfl10lXeEqJQ6ZdnKxISoKO
	 r6t/tlU2tWnkw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBC66C43458;
	Thu, 16 Jul 2026 05:32:02 +0000 (UTC)
From: Jia Wang via B4 Relay <devnull+wangjia.ultrarisc.com@kernel.org>
Subject: [PATCH 0/2] modpost: fix RISC-V randconfig section mismatch false
 positives
Date: Thu, 16 Jul 2026 13:31:48 +0800
Message-Id: <20260716-modpost-v1-0-8eab36cc7310@ultrarisc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAMRsWGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDc0Mz3dz8lIL84hJdY4MU0xQjixTLFDMTJaDqgqLUtMwKsEnRsRB+cWl
 SVmpyCUi7Um0tAJEOAGtrAAAA
X-Change-ID: 20260716-modpost-30d5d28d9d64
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Jia Wang <wangjia@ultrarisc.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784179921; l=1729;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=jrgmCjWRCYkHgrBgI9ADeNJXL3DFWZsSnbuE9Bzc+tc=;
 b=s6auCp5CqXZZZviC++F8fu8iaXugrrqEm4ism6ga+ZXfB5FqqR8/e0vvIzSRyG8UAuEHdh8XD
 jPi/vzdz9PSDNYUdItfeEu2Gwj+ilU89w2B4Uc/DImVTcQFZkuQNVJt
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-Endpoint-Received: by B4 Relay for wangjia@ultrarisc.com/20260515 with
 auth_id=779
X-Original-From: Jia Wang <wangjia@ultrarisc.com>
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
Reply-To: wangjia@ultrarisc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This series fixes two modpost false-positive section mismatch cases seen
with RISC-V randconfig builds.

The first patch filters compiler-generated GCOV symbols and RISC-V local
branch/PC-relative relocations when they point at init or exit sections.
These references can come from instrumentation or local compiler/linker
details rather than from real kernel section lifetime dependencies.

The second patch handles RISC-V relative exception table entries as
R_RISCV_ADD32/R_RISCV_SUB32 relocation pairs. modpost already skipped the
SUB32 half, but still checked the ADD32 symbol directly. After a
relocatable link, that symbol can name an unrelated local debug symbol and
trigger false .debug* section mismatch diagnostics from these __ex_table
relocation pairs.

The issues are reproducible with both GCC 14 and GCC 15. They were
reproduced or validated with:

  - rv32 randconfig, KCONFIG_SEED=277518,
    CONFIG_GCOV_PROFILE_ALL=y, CONFIG_KCOV_INSTRUMENT_ALL=y,
    CONFIG_DEBUG_INFO_BTF=y

  - rv32 randconfig, KCONFIG_SEED=4721,
    CONFIG_MMU=y, CONFIG_DEBUG_INFO=y

With the fixes applied, the corresponding RISC-V randconfig builds complete
successfully. Other unrelated modpost warnings may still remain.

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
---
Jia Wang (2):
      modpost: ignore generated GCOV and RISC-V local relocs
      modpost: handle RISC-V relative extable relocations

 scripts/mod/modpost.c | 157 +++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 150 insertions(+), 7 deletions(-)
---
base-commit: 58717b2a1365d06c8c64b72aa948541b53fe31eb
change-id: 20260716-modpost-30d5d28d9d64

Best regards,
--  
Jia Wang <wangjia@ultrarisc.com>



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
