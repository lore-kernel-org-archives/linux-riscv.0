Return-Path: <SRS0=CEwi=NM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81777C6786F
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  1 Nov 2018 23:04:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CCF220657
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  1 Nov 2018 23:04:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hY543VMK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="Rfg76p+X"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CCF220657
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=znLpAmcI+HeXSPY26TxHQQs8gYRYErdAQlqXkIKalOw=; b=hY5
	43VMK5QwDLVETSvz7ma3EyNB9BcGNulNZkp57mMTM/usyeHC5MYnICwCdmTDd+ZWZ9M0rEf1VlG+7
	Rsl9iMhHPczGSH8IDanEnqhxAi50sdoQ6unp8rPAZqZUvThread8hkAgradNBOwNGLtP1Yl8OnUln
	Jd9/moZiDmEbaxpJinG1CPC8PYlX60J0GfzpTP7hfS4el8oIdWy+U1ZheTAeDishqQDKWgqKxG+ox
	b+R5RZDDbxn3V9exhMdEPo68vtO+jraHsC9tLaNMTyWP5p1FF+glnX/IO7yWff/YnOexA1Z/bkDGU
	vH8/Htm5U/WeZphgT85z4Y6hKrgaMNA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gIM17-0001b4-S5; Thu, 01 Nov 2018 23:04:45 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gIM13-0001YS-2o
 for linux-riscv@lists.infradead.org; Thu, 01 Nov 2018 23:04:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1541113482; x=1572649482;
 h=from:to:cc:subject:date:message-id;
 bh=u58J7OBrDe40sG+JE5QsBGfXlwVdiMnwpU4kzKzSGGo=;
 b=Rfg76p+Xkru9N6/Evh8ATju+ZYIMKd4T+l+yQYgPqgoXTd69ujP7BXPa
 Ira/1E+INEprxB3V+t+ghOdiQcusP9uGF7c6PcP0fOsqZ72Q2PnPjE9qn
 HalyN1Wz34qaMDTelfsdZFcv3O1gsHwV0a+CQmgkrFeYkpCBRW5AkaX8v
 a2e6faApbqiBT1zeacTEPBWtoT61l5ip2xaxr/fM7yXdRQcyFK8IEqh5t
 PsrDDLNN/AajN2fgdkWcEdjrprCM2/1GDrq1Qq6bNiUL+gXm+aVjRZfC/
 AjttGpVvLVt0svi/5RO9GtHrV2LRmFVp+YL6qy5iI/KAFKXDeox9yJqiX g==;
X-IronPort-AV: E=Sophos;i="5.54,454,1534780800"; d="scan'208";a="93332260"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 02 Nov 2018 07:04:29 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP; 01 Nov 2018 15:48:13 -0700
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 01 Nov 2018 16:04:29 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-riscv@lists.infradead.org
Subject: [RFC 0/2] Add RISC-V cpu topology
Date: Thu,  1 Nov 2018 16:04:26 -0700
Message-Id: <1541113468-22097-1-git-send-email-atish.patra@wdc.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181101_160441_161815_8BBF8700 
X-CRM114-Status: GOOD (  10.43  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Damien.LeMoal@wdc.com,
 alankao@andestech.com, zong@andestech.com, anup@brainfault.org,
 palmer@sifive.com, linux-kernel@vger.kernel.org, hch@infradead.org,
 robh+dt@kernel.org, tglx@linutronix.de
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181101230426.AP0wY6nEnK4chIw4nbXybObN9jmNXad1Ijx-wysnKxU@z>

This patch series adds the cpu topology for RISC-V. It contains
both the DT binding and actual source code. It has been tested on
QEMU & Unleashed board. 

The idea is based on cpu-map in ARM with changes related to how
we define SMT systems. The reason for adopting a similar approach
to ARM as I feel it provides a very clear way of defining the
topology compared to parsing cache nodes to figure out which cpus
share the same package or core.  I am open to any other idea to
implement cpu-topology as well.

Atish Patra (2):
  dt-bindings: topology: Add RISC-V cpu topology.
  RISC-V: Introduce cpu topology.

 .../devicetree/bindings/riscv/topology.txt         | 154 ++++++++++++++++
 arch/riscv/include/asm/topology.h                  |  28 +++
 arch/riscv/kernel/Makefile                         |   1 +
 arch/riscv/kernel/smpboot.c                        |   5 +-
 arch/riscv/kernel/topology.c                       | 194 +++++++++++++++++++++
 5 files changed, 381 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/riscv/topology.txt
 create mode 100644 arch/riscv/include/asm/topology.h
 create mode 100644 arch/riscv/kernel/topology.c

-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
