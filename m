Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F35FECAAD3
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Sep 2022 14:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TJMUaqTYPXwaX/mjQzO27KrDqapmMtKS/hyygUb86KE=; b=38qeFjkY6It/L9
	fWHFAneLsOd29uA2EuvPpbXlncUrShBS4KyYdY9ocrMa7mkgvjFfBtgOC4y+dRZcAVAUvAL2Bm6e0
	SWZXVSiBfznYkCxVyedzzHFoibzxXsdUtEx5dbV44SP3PELfFhpUwoZmcUcQ5ns95XPOMeY+/uH5E
	Q+PvmVxCfCVwTcWP0OQLuckIfD20B1TJ3LaXNUdt+TxS5J53r8grAOzoov5epTlCFoauPUfHoEwm/
	F2lgIPv8wE+eCwLCPTzSDqrMT2AOb3xtZr/72jwbviXyeSm7AqRlntV1WfE7ewn+kCAYxJH17/mvl
	CcoqM+4okpUtTvrEOhsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVCrr-004FWN-Rg; Mon, 05 Sep 2022 14:14:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVA0A-000vM7-Tq
	for linux-riscv@bombadil.infradead.org; Mon, 05 Sep 2022 11:10:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=ZbjKiq1QeBYEfpe4PHZOPInD6Qk/s8GiqXGv2fRJuVQ=; b=FoC434Ychtdr9dLzC5sxPIjzX0
	ab+I5MQ4TxTxP2cb5hcpazDenyP8rCY3CHLSOa9Ip8rr5lo0+jR5cZyz+dC5eMd09z/r0J6UDzyJg
	rkVkWadu2UeMKpf9w8LBV7bzO37Q3Nk/r3ate+Z/6FT0SLtu2q3AXuwVkTWB1HWIMoXsLnlS817Qq
	O2uiZYDbRGKUPQLDXeVOr9wD/pa+RBgdjokG9F1tXyprzDurMKSWTJCGqJWQ+NTq6tQRPdL3gn1mt
	0g3eIYkMETAiLxQ2G1W2YzAG1bGtaQzRNYb3Jepk/GlOXzVJI80/FBfV8nxeTxocUDaLmgPehF1ET
	F7rqZUDw==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVA04-009YuC-3v
	for linux-riscv@lists.infradead.org; Mon, 05 Sep 2022 11:10:46 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oV9zw-0005hc-FZ; Mon, 05 Sep 2022 13:10:36 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: guoren@kernel.org,
	apatel@ventanamicro.com,
	atishp@rivosinc.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v2 0/5] Some style cleanups for recent extension additions
Date: Mon,  5 Sep 2022 13:10:22 +0200
Message-Id: <20220905111027.2463297-1-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_121044_317563_B799007C 
X-CRM114-Status: UNSURE (   8.58  )
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

As noted by some people, some parts of the recently added extensions
(svpbmt, zicbom) + t-head errata could use some styling upgrades.

So this series provides these.

changes in v2:
- add patch also converting cpufeature probe to BIT()
- update commit message in patch1 (Conor)

Heiko Stuebner (5):
  riscv: cleanup svpbmt cpufeature probing
  riscv: drop some idefs from CMO initialization
  riscv: use BIT() macros in t-head errata init
  riscv: use BIT() marco for cpufeature probing
  riscv: check for kernel config option in t-head memory types errata

 arch/riscv/errata/thead/errata.c    | 14 ++++++-----
 arch/riscv/include/asm/cacheflush.h |  2 ++
 arch/riscv/kernel/cpufeature.c      | 39 ++++++++++++-----------------
 3 files changed, 26 insertions(+), 29 deletions(-)

-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
