Return-Path: <SRS0=trTC=B5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AB29C433E4
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Aug 2020 22:24:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F25520758
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Aug 2020 22:24:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BNMbjLqH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="b3SI/jJi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F25520758
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BQNj31fxxSpfXrCeiZGFPQXqpKKvPyy0a5jjqTfnCfA=; b=BNMbjLqHlyTSls9vUECyyyFi1
	tzQGGV+UXJYDDOCnzjcwGMPsmYmHdHWtc07zgfCSp/ZDErNdN5SAVeKctYIHTOKLKIAbol5kMXlWI
	9VzkWVjRjPtpFe33W1Eupspixu5H3k4dG+xStd7oJiBelqLLYH94QFNw753qMJZxsBp+5qmBPxEYR
	J15ko+NedCmiFCPNqkz/3Kc4ECAWdvhlnTTjgYxbSZIrXu60yss4JrEPQZpMiPLo0l1SxNwES3iph
	jpZATu8Z+eYdnMYlyiGVQeToO4HpdxfRHt91P0YJHDmD1wzR2gjjF9znBKW6QZg/TTsue2lhPuNnP
	L7YzbMvDQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8WVa-0001E2-Vu; Wed, 19 Aug 2020 22:24:39 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8WVW-0001B9-Px
 for linux-riscv@lists.infradead.org; Wed, 19 Aug 2020 22:24:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1597875874; x=1629411874;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M/aLmMoaf+R1cfTR4Mi4doOLt0MJCtDnvFjCl4cVqNk=;
 b=b3SI/jJiVRtDb29BbrmKcZ9jYEyIu9yS7haUKbLYvZ/jthxkMkhle/gq
 +sHbjWZgWstSi44UhWeVTjkE3spafLgwRf3Yl3jBd5o0B3EGwpFu7IYvM
 k3vQ/0QepjziMXDkVZJfySjGGCO7om/FnG7NUOjs4Sqc2fWSXAPPBWF5m
 qKRkucqzXHfnpc8IdLmWIWG8yoMPR+abOnIpCVibiM1X4o1xtyrpKwCvb
 OL1t2cUnEcLkVbHTWuB4Mlkp8voxfp6Il/+ti0mBTcVzoL2hPPsIMmRlE
 uFfVmglfQBFAQcbF9z5nze6BGJsha6xgxet4bkMhmg+YRPQvHc2ANVWhd Q==;
IronPort-SDR: QdmwqyAqnf6blCjAiBhCbhd/SKLO6ew/hPJV5lhtDdEmMTbJQSHK2SzxmcDzmy217aOx/bUxYg
 c+2Sr2pWDLWVcCxzugZc0wGByi5AtR6EQn44q4gwchOnsFBHHkaa5wZ3v/TraIqhBPP3CvzBUK
 u6Vq0I/E3N/8xhzc1fw4EMY1mp0KekFsfrBPsF+fbZ0l5TPKEnLwExKEJttV9LHtiHp1GrhkFZ
 oUEwIEamNvk+UH20i0Hy+KPrfzcEJNAueeRenTBcgN2mX29OT/97Vl5OaqiS+sqM5dH68KpmCH
 CNs=
X-IronPort-AV: E=Sophos;i="5.76,332,1592841600"; d="scan'208";a="145313324"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 20 Aug 2020 06:24:34 +0800
IronPort-SDR: wJCX3IQpk2curDSxRdVMrQcTnrs5p2YOCTyvx/aSz+7ifHMw2ucAZsJ48hhdY9u82CzTUbjzQq
 5wAxkTrqqZ5A==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2020 15:12:17 -0700
IronPort-SDR: 1epdToIyuDzZ4UJ/vsNBMIOLC82OPuo1rQZCyeBGFJvRm1nEU/fO6IxiC9Hl/KtZQq6gpQZ0OH
 X+bF6A7SGjYA==
WDCIronportException: Internal
Received: from 6hj08h2.ad.shared (HELO jedi-01.hgst.com) ([10.86.59.62])
 by uls-op-cesaip01.wdc.com with ESMTP; 19 Aug 2020 15:24:34 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v6 4/9] include: pe.h: Add RISC-V related PE definition
Date: Wed, 19 Aug 2020 15:24:20 -0700
Message-Id: <20200819222425.30721-5-atish.patra@wdc.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200819222425.30721-1-atish.patra@wdc.com>
References: <20200819222425.30721-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200819_182434_972197_09C4DA64 
X-CRM114-Status: GOOD (  11.11  )
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
Cc: linux-efi@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Atish Patra <atish.patra@wdc.com>,
 Arvind Sankar <nivedita@alum.mit.edu>,
 Alistair Francis <alistair.francis@wdc.com>, Zong Li <zong.li@sifive.com>,
 linux-riscv@lists.infradead.org, Ingo Molnar <mingo@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Michal Simek <michal.simek@xilinx.com>,
 Steven Price <steven.price@arm.com>, Waiman Long <longman@redhat.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 Daniel Schaefer <daniel.schaefer@hpe.com>, Kees Cook <keescook@chromium.org>,
 "abner.chang@hpe.com" <abner.chang@hpe.com>,
 Heiko Carstens <hca@linux.ibm.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Damien Le Moal <damien.lemoal@wdc.com>, Anup Patel <anup.patel@wdc.com>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Mike Rapoport <rppt@kernel.org>
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
