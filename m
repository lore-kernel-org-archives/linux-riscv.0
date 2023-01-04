Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1CFEC3DA7A
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Jan 2023 20:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eMahgzndKROqKi/4RxYlSfCyLLMwF9I0IJTlPRWdO3c=; b=asLIyxqff1gRsq
	WLKkuL8aic7CAh43FcASBQFLuiyzfAx8sVQMNCPjUt66xBh6RAmGkCzbh1JAOWDon1nqDwK38aNxK
	x3Y/tQKgrjfABqm2dgvbXiYI2DjW9NehkCGaoUrQ6j5JP8vONfHArXbQed5z8IbPLSiHxJI/uXdS3
	gnL4Ps2PS/virbH8jx60mhg2ZN55SanxiXLOE+fCsSY4Nlpm8nI/w6FyokzsGUEsL4NvXu1Yf71Dp
	d23OIxuBOkYjTcbb46hW//O3mGKNU5k4eTLqsvNIh8bAy42VGUvbD1Y6Cz6SrEoOCyiTRJHaDgjnN
	gVYUVffJPStkSItxWzKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDX52-00Egjh-Ga; Thu, 05 Jan 2023 20:43:16 +0000
Received: from sender4-op-o16.zoho.com ([136.143.188.16])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCyPm-007Rnp-9P
	for linux-riscv@lists.infradead.org; Wed, 04 Jan 2023 07:42:23 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1672818125; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=HXc8zMdXPL2xtMMl2U5qfAUFMdYvw1YEQXD31y0BjkGUQwASH973PQSKnDZiJMC6e9FxQdAD9qk5YxTu+kkCmXFeReuPeehWCCYizU2GdWeG6vIq1lEcxex88N8ZZwi6R8kDcAg7ZWqAfIFs4BNAQfofJd8RJ+p7PuZDCRPcxzQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1672818125; h=Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=qoS0tyly1yJb2GAirmLp2GN+lujvcb2q1T/8oIlY0co=; 
	b=SIRo6hVvxJ/VtV4Aseo3vsaXfVOXWm1J0e7cPbQJlj2ll4SKZvSrusduPS9tuf8sqk2ym47bAI+1m6VwKSqqvF3sfav3ks+izKsiTDWPz/Qa20F1l8k8mwaC/hS54CyNRfeiCLMSO/jvmJUc4YVMRtpCgSjjPWKD/ooe3YeH16M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1672818125;
	s=zmail; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=qoS0tyly1yJb2GAirmLp2GN+lujvcb2q1T/8oIlY0co=;
	b=ATVUKU4LIoaKQPvyGFpcVJz4vmkqJIue5pYcDZirZ2N152bO541L6E+qJ2m31YKn
	GrNcE0utaAMvK1pwUdzWaZ+NB7TYXH+852C52U4OEA4Va6jmALK7daMXBgUlKhGYMMW
	i4GVjpOxBcOdlFxS+qQMf2ATPwVdsTiJstddgWeU=
Received: from edelgard.fodlan.icenowy.me (120.85.96.143 [120.85.96.143]) by mx.zohomail.com
	with SMTPS id 1672818124639912.4377659682284; Tue, 3 Jan 2023 23:42:04 -0800 (PST)
From: Icenowy Zheng <uwu@icenowy.me>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Stuebner <heiko@sntech.de>,
	Guo Ren <guoren@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [RFC PATCH 0/3] Support using physical addresses for RISC-V CMO
Date: Wed,  4 Jan 2023 15:41:43 +0800
Message-Id: <20230104074146.578485-1-uwu@icenowy.me>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_234222_473015_26E5899B 
X-CRM114-Status: UNSURE (   8.93  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Thu, 05 Jan 2023 12:28:40 -0800
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

Despite the official Zicbom extension only supports virtual addresses,
some vendor-specific extensions, e.g. Xtheadcmo, supports using directly
the physical address.

This patchset tries to provide a CMO alternative macro variant that is
feed with both VA and PA (and the used one can be picked at runtime),
implement it with PA on T-Head cores, and utilize this variant for some
situations that PA is easily accessible.

Tested with an LiteX SoC with OpenC906, with LiteSDCard as root device.

This patchset is based on the fix of dcache.cva encoding, which is at [1].
Without that patch applied, this patchset won't apply cleanly.

[1] https://patchwork.kernel.org/project/linux-riscv/patch/20230103062610.69704-1-uwu@icenowy.me/

Icenowy Zheng (3):
  riscv: errata: cmo: add CMO macro variant with both VA and PA
  riscv: use VA+PA variant of CMO macros for DMA synchorization
  riscv: use VA+PA variant of CMO macros for DMA page preparation

 arch/riscv/include/asm/errata_list.h | 30 ++++++++++++++++++++++++++++
 arch/riscv/mm/dma-noncoherent.c      | 11 +++++-----
 2 files changed, 36 insertions(+), 5 deletions(-)

-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
