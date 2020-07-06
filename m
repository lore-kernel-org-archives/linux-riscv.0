Return-Path: <SRS0=gb7b=AR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71286C433E1
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2020 17:26:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 455BA20CC7
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2020 17:26:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rChqmLTB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="IPUKYyYR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 455BA20CC7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BQNj31fxxSpfXrCeiZGFPQXqpKKvPyy0a5jjqTfnCfA=; b=rChqmLTBP3gg290aThJwDXnTe
	JBRqqNyASuDsy74EaiU1iT1249+Ys4Eh+qtr2qG6ASbWqrLal9lSTwTvaFuowa1ccL4yv7wMCpgGH
	V5pQpVjpEyY5CQBgl4w4o3a6E3OeyfDS/fLsy7y8ThPTauqCgLEeSl6uYCWbSCADSSURXtRfuptJt
	4TL4uZrkU7KKhaFbDFBcv18UVKoeQPs/Og1HAZF3yn40BI5cnMvAss4Ww4kGPJeyLAWQPWADkG4X/
	gD1zJelQOx1bbRF48vlqG+IqPgYem9J0c6WZ3y6OkJCB0oTtwqYsjEBRNbdFFYSRKM68461AXtu2H
	lV63TgfGw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsUtD-0002kI-PO; Mon, 06 Jul 2020 17:26:47 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsUt4-0002aE-Cw
 for linux-riscv@lists.infradead.org; Mon, 06 Jul 2020 17:26:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1594056399; x=1625592399;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M/aLmMoaf+R1cfTR4Mi4doOLt0MJCtDnvFjCl4cVqNk=;
 b=IPUKYyYRhce6/d0FQlCHiHFdAI6WHR+awTvmx4u6eSrU/RpEhaoE+lif
 okUERL7GFAMo8l+ivqzQEc+R/lplO9FWmTdrPwMcfSovKJ4PFkG9UA8xG
 72mduaYmZgP/XZJ/H4tHxBpQ/mFmrB+dIpUq0N1ARK0VbU2cELamFmF5B
 MM3CYLZp+c/1pfQLT2wV/2Fk8r7cnNiyUtRiniKM/9rGSO7AkXQh+tNqT
 NBQCuVnC6DKpGR+wUAc7+nQVxhvLiXI19m5d6XSmYud3rruJa0Khd6Rlu
 +F78pvjFDC+LHt/Q1CJFr7Yi7WjrclYbJg5x4FffqH7FDIZmh0ScrAvGX A==;
IronPort-SDR: 0oLsmsGFQ/uSgRQK9a4LZa63p0zfG0irSjxCNFtkOzhyCtaWlFPxqEBmmjeIKu0bpPnYxDrb6H
 6Uf84nmsAeGIQ91zRQkTon7zgAapmOjJEQPKHEWFU1v5X6K0ffLKGYJXdOLlw1AGIlp/4dLwam
 q0R65jaU1Qs6WkoyAFdJjXM690YUmqMi3HTkiN8rDuDZ0UfhkGzF5OabDjcFn301bA8rCI43OX
 kmdhOzeHVPDq2rlISpTd+QE2Q0Sq+kot7wiq3i8U7eNR2eyd5YiKwVrL0tJkgmmaKeKza+SufE
 4v0=
X-IronPort-AV: E=Sophos;i="5.75,320,1589212800"; d="scan'208";a="141930685"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Jul 2020 01:26:33 +0800
IronPort-SDR: bHHrLfLkz2O8uWPRTpRGrlJTq5arT2F32lsSjEcEUofkzqALOzOXG75zfDJgMNRrV+YIWmK/th
 L7anQmg4pbwZaFc2Ptwg5ubMtTyRmFfKY=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2020 10:15:13 -0700
IronPort-SDR: LTnJdtYBmdu2sAHNvGIHgGHeR10ZGmc5DB5Q8zbIQxwIWgvrH9f5qhkYP2rNAS5Y7it7R/EMFq
 b2/mz85O6lyA==
WDCIronportException: Internal
Received: from 6hj08h2.ad.shared (HELO jedi-01.hgst.com) ([10.86.57.161])
 by uls-op-cesaip01.wdc.com with ESMTP; 06 Jul 2020 10:26:32 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 07/11] include: pe.h: Add RISC-V related PE definition
Date: Mon,  6 Jul 2020 10:26:05 -0700
Message-Id: <20200706172609.25965-8-atish.patra@wdc.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200706172609.25965-1-atish.patra@wdc.com>
References: <20200706172609.25965-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200706_132638_629535_155047B8 
X-CRM114-Status: UNSURE (   8.09  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-efi@vger.kernel.org, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Define RISC-V related machine types.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Link: https://lore.kernel.org/r/20200415195422.19866-3-atish.patra@wdc.com
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 include/linux/pe.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/pe.h b/include/linux/pe.h
index 8ad71d763a77..daf09ffffe38 100644
--- a/include/linux/pe.h
+++ b/include/linux/pe.h
@@ -55,6 +55,9 @@
 #define	IMAGE_FILE_MACHINE_POWERPC	0x01f0
 #define	IMAGE_FILE_MACHINE_POWERPCFP	0x01f1
 #define	IMAGE_FILE_MACHINE_R4000	0x0166
+#define	IMAGE_FILE_MACHINE_RISCV32	0x5032
+#define	IMAGE_FILE_MACHINE_RISCV64	0x5064
+#define	IMAGE_FILE_MACHINE_RISCV128	0x5128
 #define	IMAGE_FILE_MACHINE_SH3		0x01a2
 #define	IMAGE_FILE_MACHINE_SH3DSP	0x01a3
 #define	IMAGE_FILE_MACHINE_SH3E		0x01a4
-- 
2.24.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
