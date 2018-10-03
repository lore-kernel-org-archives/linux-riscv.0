Return-Path: <SRS0=xmLI=MP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 850EAC64EBC
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  3 Oct 2018 03:12:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5137E20878
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  3 Oct 2018 03:12:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TRod50Q0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zt6qTJEp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5137E20878
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=lQQ5Th+sEPD3c9RijYzv1HbQEn3B/VFXs94dVt3gGs0=; b=TRo
	d50Q0/l4hlrKcvtkU0I7VODazq//Hdr+PfZ4uD2ib3MJ3FqGHVHgL6v+lbVuiBVnWA5Hznmgc0bAw
	uBdaEhBNHDjBrwRXn1xLBn9/LuJwbWXIAsEHNsm8fi0gv5pXwC66HX4QHBvdlF4b91fXtbQyTYaHc
	Xq+7kX3SzRoTsyUEgN1tp14sGHwlUc3SxnHT8wCqaLk/iFVaMgbKBX49SX3UxzsTJXNv21YqcnEov
	7XVTjNpr5vNBxCbpNnmA4Yw16ztZCSOE32nsKEQbHM9E0stB3s2GEGcvu3uYI3pEWw/MSXSRfaNOt
	YTdXz7+YfMjPpjvbEdcMXu3mRGwpaKw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g7Xao-00059g-8Y; Wed, 03 Oct 2018 03:12:54 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7Xak-00056p-Kw
 for linux-riscv@lists.infradead.org; Wed, 03 Oct 2018 03:12:52 +0000
Received: by mail-pg1-x543.google.com with SMTP id f18-v6so880579pgv.3
 for <linux-riscv@lists.infradead.org>; Tue, 02 Oct 2018 20:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=nEVDmBbxfh6xO+hh75zn5eGRCfiidmomaGOCEIOQa7M=;
 b=Zt6qTJEpuMAYmyFCdxXwjBcK9NxMRUvIOlf0L3MHC8ATWd2oAbcumac2zSELI52CUq
 UKco2vxnJ0ZbHk/ADZYcULmVI/qbwRMyyVrxkhNopj5dx4Cbcv0vwSTAH5JBrE166WCb
 +FkNagsprBEgFse62L1Bc6PEfAVy5JwOvCOoQOSegvu0JIclFR7Q3uELVfKw/k2whFne
 ptHQxUvwysZh0diU1ISEu8iaDCXeXrPLB1xmAnnRnX1r2HJrET4Mcm4MmPfTX1ZT9iXB
 U825neixL8nPlOetoxFY6d5s7KDEaLuzpFQSCyntIpsqGymq7S+2S22EHjiLk9I88zFt
 9oyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=nEVDmBbxfh6xO+hh75zn5eGRCfiidmomaGOCEIOQa7M=;
 b=GdMTINBECwq67xBeuSz2XhXUo1ExV3A3ChTvJQXolZszgVJ7H69wyTLdGcctcGfdYo
 J5CNZHkGPdoD0+1CjKkutjaCnf9S0/+fRfg8hdK4uL+eIUIT5lBX55IEBNM7zKEeHt+I
 kFPgWE0sBZdkox5GlsFSeweaLizLoS9jX8E6cNeeA9HK5RGgS5TTIJxnlHbdYfEqv+eu
 tikHeTWlyAui3/ocamdneuqCX2qTB5s7YdiF5sL7rApXhrrXVy3fwM3oYyd6DOkRZFKm
 Vv3fAudHaz2iDXUSTT1YFbh385xOuG0lMdgdFS4qER8tDeeqPQB2ljayODjR8UrgC1xM
 PS8A==
X-Gm-Message-State: ABuFfohTv/y9zNJBCFt+SHVRtaajMeFrmYGZ6cWXlkbpXFub3mB0g0eY
 EE0yr0bbdMNXSEnq0ugbSns=
X-Google-Smtp-Source: ACcGV6104aFcCl70X28KtsuX3W+/X9gvYyPw3zHVyXUhzd0xiKTxH8USlIK1f/F+lQvVA8msDWe6fw==
X-Received: by 2002:a63:4c4e:: with SMTP id
 m14-v6mr16990363pgl.173.1538536359605; 
 Tue, 02 Oct 2018 20:12:39 -0700 (PDT)
Received: from app09.andestech.com (59-120-53-16.HINET-IP.hinet.net.
 [59.120.53.16])
 by smtp.gmail.com with ESMTPSA id v23-v6sm21777747pfm.80.2018.10.02.20.12.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 02 Oct 2018 20:12:38 -0700 (PDT)
From: Zong Li <zongbox@gmail.com>
To: palmer@sifive.com,
	aou@eecs.berkeley.edu
Subject: [PATCH v4 0/5] Fix some bugs on RV32 build fail and issue
Date: Wed,  3 Oct 2018 11:09:57 +0800
Message-Id: <cover.1538535527.git.zongbox@gmail.com>
X-Mailer: git-send-email 2.18.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181002_201250_723530_6B8B6047 
X-CRM114-Status: GOOD (  10.36  )
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
Cc: hch@infradead.org, zong@andestech.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Zong Li <zongbox@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181003030957.Wx63xwJ_DGS-PdNpwEw62YRW5rnI4POOdoj1mrZvcnE@z>

This patches contain the modificaion as follows:
1. Fix up the building fail on RV32.
2. Add umoddi3 and udivmoddi4 functions for RV32.
3. Fix ioremap problem on RV32.

Thanks all for review these code and modify the copyright description.

Changes in v4:
 - Retain the complete copyright description.
 - Modify commit message.
 - Rebase upstream code.

Changes in v3:
 - Change the copyright notices to GPLv2 from  gcc 4.2.1.

Changes in v2:
 - Retain the copyright notices from libgcc in umoddi3.c and udivmoddi4.c.

Vincent Chen (1):
  RISC-V: Avoid corrupting the upper 32-bit of phys_addr_t in ioremap

Zong Li (4):
  RISC-V: Build tishift only on 64-bit
  RISC-V: Add preprocessor directive for swiotlb
  lib: Add umoddi3 and udivmoddi4 of GCC library routines
  RISC-V: Select GENERIC_LIB_UMODDI3 on RV32

 arch/riscv/Kconfig        |   1 +
 arch/riscv/kernel/setup.c |   3 +
 arch/riscv/lib/Makefile   |   3 +-
 arch/riscv/mm/ioremap.c   |   2 +-
 lib/Kconfig               |   3 +
 lib/Makefile              |   1 +
 lib/udivmoddi4.c          | 326 ++++++++++++++++++++++++++++++++++++++++++++++
 lib/umoddi3.c             |  48 +++++++
 8 files changed, 385 insertions(+), 2 deletions(-)
 create mode 100644 lib/udivmoddi4.c
 create mode 100644 lib/umoddi3.c

-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
