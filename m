Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0C8AEF99EA
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Feb 2026 02:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sFAkOjIPl86fVoZB2XWS0K3WD4ie2k8euPndtEO+bbw=; b=tv2tCJ7rmZO4Nt
	54aqHoTnaf5fHATX0sjx57kDwhlmzfTN2rrQjFeX0M1JLrAM/L8WzFsEX4+EC0JlVPVjoSC02GyCw
	eT1WygWOge1YIDcEJzcv34Oqsr1L85miZc64Ef0sBHZxDB80I9asU0zgn3AUdfIZyJ5uFrCMO7bu6
	tZ2OvE5P4jm5G4awBiGY1EgFlwV8X/UcL9QlSwjpgsxkzlJxHQV6Gu2wfIkQ3ITtSx7NwmanuG24c
	Uer+2eTGxxvdNkEFMwOzU852fWF7Y3bMIrrpv1DMDRX7Jj0RUr2g2HbU1NgoWdv2U3OaCRqIU/EEG
	vRdaCvM+zTDQqltqMuZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vr5YH-00000004Ain-43XD;
	Sat, 14 Feb 2026 02:38:33 +0000
Received: from out-188.mta1.migadu.com ([2001:41d0:203:375::bc])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vr5YF-00000004AiI-2qVb
	for linux-riscv@lists.infradead.org;
	Sat, 14 Feb 2026 02:38:33 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1771036708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gf06fOc9NSYWQuPmpzEppb+KChKB/ddt5VFMWOyC7BM=;
	b=gKn0Xlna2CWPJBh0G/TPaTtLUSthA4DEOQPk2YbKij3dpjf7oV/LUUsCId1t6shyMeuhZD
	p0xuys8Kf+JnvAduWfqQgs+7x0ZIoutovHay0NHcDOSkQW7u9Zsdcr9pGlR1nX9ffEJI0B
	J2kgTMYMbd5lbfhwPm8VRNCfGhZ7wdY=
From: Kunwu Chan <kunwu.chan@linux.dev>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Conor Dooley <conor@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@rivosinc.com>,
	Zong Li <zong.li@sifive.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Zhouyi Zhou <zhouzhouyi@gmail.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kunwu Chan <kunwu.chan@linux.dev>
Subject: [PATCH RESEND 0/2] riscv: fix minor typos and style issues in XIP code
Date: Sat, 14 Feb 2026 10:38:02 +0800
Message-Id: <20260214023804.677127-1-kunwu.chan@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_183831_940199_5C600581 
X-CRM114-Status: UNSURE (   4.21  )
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

Fix a few minor issues found in riscv XIP-related code:

- xip_fixup.h: comment typo (_start vs _sdata) and spaces-vs-tab
- head.S: spelling typo and wrong #endif comment

Kunwu Chan (2):
  riscv: xip_fixup.h: fix comment typo and whitespace issue
  riscv: head.S: fix typo and wrong #endif comment

 arch/riscv/include/asm/xip_fixup.h | 4 ++--
 arch/riscv/kernel/head.S           | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
