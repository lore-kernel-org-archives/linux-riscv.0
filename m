Return-Path: <SRS0=Sfcq=ZS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEC3EC432C0
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 26 Nov 2019 03:20:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2FEF2071A
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 26 Nov 2019 03:20:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z4rcpXRY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="QU2wq1sf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2FEF2071A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bxwPNMdESvvB2hQmk3iuq0qcipqWsT+7eK5m+JABPE8=; b=Z4rcpXRYeCYPxy
	c0/mE1ZZHV1lqUnqFVAi9tk9u0U2VhFLkxSh7zI0n+c+I/rCrPSfnHIW2/X4unTZrHqbRVEUYLA97
	D+U902vWRdWHBQ/ccpnf4tQcHzpSoU1gahYzgb1wN2EyDVChMExL9vKpXypQMDM2wesKMRVL4IZj0
	js1XqgXEX2clLDejrEeIRWxrC3B7cs9tCfRk+J8nxfU/mBu7C+i2jKpE9HMhtE7ppJc+CEDS55yJz
	9Qlf3Jxcd4/7rU4OKmUVPKGM14pTA5eXoC0fT3ddPRBCE/odSAuV8pBlvIxMQa/2DV9IZXUMdSMJe
	S/vOYgcpmAtFRmYwTWRQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZRPA-0007z8-7S; Tue, 26 Nov 2019 03:20:44 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZRP6-0007xi-Uc
 for linux-riscv@lists.infradead.org; Tue, 26 Nov 2019 03:20:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1574738440; x=1606274440;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eDrvdWoX56lIvIiL0slSmxVvIPiwPhCbEp2UPD0kflw=;
 b=QU2wq1sfJgCKq1zLoz0ZIp+qoB/iMTiLm9icjdVlUi5RtJ/NKztl/Dme
 HM+FScnwz/JDFe0Wplw8VAgJvUL2BX+a5wLJZrn3pxC5kK/qUzyEmc9Ao
 FuJRKwaQjM86UAd2yfEEqTUizPlcs8CcxD2jOQxFxWRq+pPOBOa6Y6sXo
 GkdmWvKHET2gBxLhwWLcqwUtXC4mFc/GCxxtYhXgQW7GZhMEox2xt5B53
 SD2fAoGq+tnL/7LiUr93YJL0b4Ky1WJFMbxCC3mq5zlT/+lomfqC2vDgC
 CyxitOzE+bn2lgQUkqK/zlI8iqdIVLXmb5wwSjmu4ySwk4EwnxA31GVox w==;
IronPort-SDR: 2G5WmWbw2vpuSmA8a6b8v7Ko+Z2uruLw8O78pv4ZzURjYGtLsZUrBOCNA++u4l5wnxw6OfWK4T
 tRgT4g2iDlquveWpfvwJIZMpqXws7gc6u5iDVNEJKgUOybewHGTEkbgZ7Zs8gl1CwiOSMrPvEz
 DCRrg3SWcPW9rX9DDfdr4KZ54H2B/6mtaQe0CRhMNngDXcaqR25UXJcYR/dW3ff/haBiDrdYfJ
 FHiLWAIDcJ5s1Ig714/0oRdyDRpoJHzWiRw1zdOnSj1PYiULhthZoKb4GwetUNrNWXhtzBKItU
 SjE=
X-IronPort-AV: E=Sophos;i="5.69,244,1571673600"; d="scan'208";a="123990266"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 26 Nov 2019 11:20:37 +0800
IronPort-SDR: YxcM6ngbd0o75YsghsVgSbz+hLFwKteV+KHfE7Y2f9UOU6ea8t88K1wJ1pGQYkn840Z0gOz3UJ
 +r7Em7Ls6hfCtO9Gluk4kEVhTMlikJn8yrt6WXeF/qjV4huI4L0jCuF1s7cUDrzIxQahwAi6HT
 K4eW8nkzJi3wHxFsLllphauf66WT0O0HW1wWn74LC9bkO4NqLQpVzV828irAKjZeqHgfhh11F/
 aVBIU8vJNo8NAvR+lqYeKcgXzjEZRB8A0sYOt17hzn57uARynUH0UbRH2mo/qirJHkGjs+8uIQ
 qsOwISKDi9IxbOSY10MrIXUd
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2019 19:15:16 -0800
IronPort-SDR: ksi4hFv4hatdCMU7Za+gnR+Vhiop5cIzfaAdcrQvuWF0SxfjSgcdUvSmVlU+bqykEtNjZ4D7Dw
 rroMOu8Ndu8NqV7JFNZRUluRG5HQj1tWGrEinUZgkHc5+1cO7gUq5CTE6nP4tYVA9AvvomPcPQ
 AMAuP2oE0HKLfYdDGN+3Kqt7YUUC8dn+mcO/FZymCkxLw4BIaJmgrvNKND6ej5SKBco5ksHXLc
 zZuFEn17SIq0WPoYu9g/QCkDUaE6jt+76NzRB0a9oBgmnHcIHdYKHAokdEVjI0y9YyeisXSlta
 G18=
WDCIronportException: Internal
Received: from usa003951.ad.shared (HELO yoda.hgst.com) ([10.86.50.226])
 by uls-op-cesaip02.wdc.com with ESMTP; 25 Nov 2019 19:20:37 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/4] Add support for SBI v0.2 
Date: Mon, 25 Nov 2019 19:20:29 -0800
Message-Id: <20191126032033.14825-1-atish.patra@wdc.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191125_192041_026069_F526CC37 
X-CRM114-Status: GOOD (  10.02  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 Mao Han <han_mao@c-sky.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The Supervisor Binary Interface(SBI) specification[1] now defines a
base extension that provides extendability to add future extensions
while maintaining backward compatibility with previous versions.
The new version is defined as 0.2 and older version is marked as 0.1.

This series adds support v0.2 and a unified calling convention
implementation between 0.1 and 0.2. It also adds minimal SBI functions
from 0.2 as well to keep the series lean. 

[1] https://github.com/riscv/riscv-sbi-doc/blob/master/riscv-sbi.adoc

The base support for SBI v0.2 is already available in OpenSBI v0.5.
This series needs following additional patches in OpenSBI. 

http://lists.infradead.org/pipermail/opensbi/2019-November/000704.html

Tested on both BBL, OpenSBI with/without the above patch series. 

Changes from v3->v4.
1. Rebased on top of for-next.
2. Fixed issuses with checkpatch --strict.
3. Unfied all IPI/fence related functions.
4. Added Hfence related SBI calls.
5. Moved to function pointer based boot time switch between v01 and v02 calls.
Changes from v2->v3.
1. Moved v0.1 extensions to a new config.
2. Added support for relacement extensions of v0.1 extensions.

Changes from v1->v2
1. Removed the legacy calling convention.
2. Moved all SBI related calls to sbi.c.
3. Moved all SBI related macros to uapi.

Atish Patra (4):
RISC-V: Mark existing SBI as 0.1 SBI.
RISC-V: Add basic support for SBI v0.2
RISC-V: Introduce a new config for SBI v0.1
RISC-V: Implement new SBI v0.2 extensions

arch/riscv/Kconfig           |   6 +
arch/riscv/include/asm/sbi.h | 177 +++++++-----
arch/riscv/kernel/Makefile   |   1 +
arch/riscv/kernel/sbi.c      | 545 ++++++++++++++++++++++++++++++++++-
arch/riscv/kernel/setup.c    |   2 +
5 files changed, 658 insertions(+), 73 deletions(-)

--
2.23.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
