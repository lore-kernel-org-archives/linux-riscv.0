Return-Path: <SRS0=pYMt=EL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 989DBC388F9
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2020 05:25:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06D0B2083B
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2020 05:25:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nbWILjNo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="qqg5R6kl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="BNs0sMEi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06D0B2083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=K4aClDeRkTGSHM6Q3W9Eo4LL84FjDanPKTlxKTMYT2Y=; b=nbWILjNoWNPmYlMa9mL40a1em
	VnXY9UaS8U28/E7CBrv8A5nnFK+KQSpnod+TCoRLP21SakFQIyblYpnL336okX4hGFSY8kbAJIofP
	CW3GU8SBfGJWTUmcRH1q13TJeYaNVY2bvMQ2BIl2te7dJ6IBLVlwR6MuVtADZD4CoAmr4GPKLxBUE
	Iq4lAqtuka3VjbkmNX4MG5ASWR3bN+uCwYtW+8wtdTFYadpcE3LIE26K7D/kGqXr5cP3Qa6ORyoF8
	fsPJ5yGevpFATXcV9KyD/Cp3kOdkXpJLK/XDS7QkVhnI9H9S0lo44iObV1820p5z6q08ZMPky0PG1
	74tc4MNLA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaXlx-0005Ru-Si; Thu, 05 Nov 2020 05:25:21 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaW3i-000145-KY
 for linux-riscv@merlin.infradead.org; Thu, 05 Nov 2020 03:35:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=0nFScoZU92dxvsfl3wUOsCq8NGADFYumvubYOEBlcGo=; b=qqg5R6klZhJepLWFZ9pXMkZh58
 CJ06Hb+mPekr1LeOS1tbNXf9oUpe5i8B0Lh9KerPrbyY6qd5fsq2BOVIJFLXByKVHV72tXON0OGfe
 aQwJXeu+tYNjZxtxd/9HsSW8oRmHGoE0BqkBk8DzzYf/TTY4tgVQ3lYROTr0Q27sRRhTx8WixYQKX
 2OOa+9WEpALhK0DQc4pPLy0lab4LcctLlk9CBlVJzdCad6/spJVa/Owzh8hKTa/LcDvcmzrItU/iC
 8RUJG8nrE/y57xib3lsIwNT4fTpPJoq67wqjrXOKByw3HmXTb1jx3xrShKhOi/gFu0Td/ifFHucKC
 hws8kuWQ==;
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaSmq-00012o-ML
 for linux-riscv@lists.infradead.org; Thu, 05 Nov 2020 00:05:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1604535654; x=1636071654;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BXRrXHASEZw+q5AEH6JXn4IG5K15cGG21TkLjxF25TY=;
 b=BNs0sMEit11bU+2HX2UUlK3DDtoolan5MlkSfttniIHgNTSrnUolnkLP
 woLXnLMv8AZPCpJNN71onaW3gLOWNFn44hENak2XtlVNDw0mq3RH8kVX/
 PAcw1lRG6EmziSfSrVNgPSbrHrwk6wMkxiUqRXieVRmMXWKRvEgjhIECH
 nK9aQdfSS4Gnru0E5g32uEQX3AdqJk7j700VAvROn18qA9Y9lNdHnY9kU
 u4pEyFi0N2sAlfg3yXawg2CiSilg4w1rHKFSrw+NdHIFkHD7xVOJcI4g6
 QBO23uK+T1thocxFAOTYUQFvPot5SvjXUFN4zfxbA8ca07K0eTvMuGFde w==;
IronPort-SDR: 9cNGqmwGUOI3ZUYPk5XNTpNaCcCnkG6ovGrXqxJfuDuNrb5iFzmfYQIcndVaMuMKy50dXy3jZc
 ntKX3BqShcK9lGxbD4dzGMfMwusajHcbVVqfkeo/w3kuBXJlBj2qrzs+B2MUbMmU5KlkUz7CMH
 C/61ZY94amIHSk35NrpUpHwP1Y5OnYSDyQFGWARZINaIX0s73vyZC3iBqciiCLuYPlytxiwqfk
 42daVrMlQi80XF5d0b+xq9DBG3NibmHLcmGiJq2E4BXez+CIEn8Z+Q0k9/KxVwyR817Hs7Dd1C
 ppk=
X-IronPort-AV: E=Sophos;i="5.77,451,1596470400"; d="scan'208";a="255394930"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 05 Nov 2020 08:19:29 +0800
IronPort-SDR: Ny64ZoIpW1MFmXUXfVlMA3VH5rFUeYGw3rj5HUdvnKphrDk84DeCy2ul2Gdd3NrF2vHfoklrcN
 /WrXtZ+9uesRp8ZbDJPoIOknJGqEps8Zzmx4RmndRxJ6CQ9FZoZIRqs22jOHkUKA0kp/5jRZoQ
 IjczMK6tkg4pDjJ5Oxr+0Gzv0c4+sirnBElGxZprXLIL7nEMn96FH6zQQWm0ZevHFdvhZs/sy6
 h9sAovn6dbc/ZeKuMKTJH4wTkIU2qqmpN9EXQcxGlj/MsTuvSBIGQ7JRfUs4/KjYuSX+tUyDDT
 w0U895STa24aDSgpUTh8WSGn
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2020 15:51:08 -0800
IronPort-SDR: 2kBqKLfZRTKPik4vjGm4JTPL+wbmUTlo3Ysh8bs3KaEywAiOKWO5WSUs20iEdVAavr3XgDyz7M
 RgzKRGH7w7o9kz/+ZEmiaMZkRYwaiqfhP9o9S6l5PLGIT/AEdjR2voufleZg6H8yLg79hrSgJL
 ua6Y1XLCY5npxZaZg40dYEcXfVF2h5FdrMcDRt+INNUDBX5vhKZE3NgbBwZVTr4zjUbNHRsqY1
 nkJg7g0pu94qjsEfRFL8TYqMjTZV908Y3h4FYXvySXqJWLK16yaqKt4Ei3zaWhkiP2ELoMJ2y1
 IEQ=
WDCIronportException: Internal
Received: from 6hj08h2.ad.shared (HELO jedi-01.hgst.com) ([10.86.60.117])
 by uls-op-cesaip02.wdc.com with ESMTP; 04 Nov 2020 16:05:00 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/5] RISC-V: Align the .init.text section
Date: Wed,  4 Nov 2020 16:04:37 -0800
Message-Id: <20201105000439.1491243-4-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201105000439.1491243-1-atish.patra@wdc.com>
References: <20201105000439.1491243-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_000557_167657_8B0CE9FC 
X-CRM114-Status: GOOD (  11.84  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Zong Li <zong.li@sifive.com>,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Guo Ren <ren_guo@c-sky.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Miguel Ojeda <ojeda@kernel.org>, Greentime Hu <greentime.hu@sifive.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Michel Lespinasse <walken@google.com>, Ard Biesheuvel <ardb@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Jim Wilson <jimw@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

In order to improve kernel text protection, we need separate .init.text/
.init.data/.text in separate sections. However, RISC-V linker relaxation
code is not aware of any alignment between sections. As a result, it may
relax any RISCV_CALL relocations between sections to JAL without realizing
that an inter section alignment may move the address farther. That may
lead to a relocation truncated fit error. However, linker relaxation code
is aware of the individual section alignments.

The detailed discussion on this issue can be found here.
https://github.com/riscv/riscv-gnu-toolchain/issues/738

Keep the .init.text section aligned so that linker relaxation will take
that as a hint while relaxing inter section calls.
Here are the code size changes for each section because of this change.

section         change in size (in bytes)
  .head.text      +4
  .text           +40
  .init.text      +6530
  .exit.text      +84

The only significant increase in size happened for .init.text because
all intra relocations also use 2MB alignment.

Suggested-by: Jim Wilson <jimw@sifive.com>
Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/kernel/vmlinux.lds.S | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
index 3ffbd6cbdb86..cacd7898ba7f 100644
--- a/arch/riscv/kernel/vmlinux.lds.S
+++ b/arch/riscv/kernel/vmlinux.lds.S
@@ -30,7 +30,13 @@ SECTIONS
 	. = ALIGN(PAGE_SIZE);
 
 	__init_begin = .;
-	INIT_TEXT_SECTION(PAGE_SIZE)
+	__init_text_begin = .;
+	.init.text : AT(ADDR(.init.text) - LOAD_OFFSET) ALIGN(SECTION_ALIGN) { \
+		_sinittext = .;						\
+		INIT_TEXT						\
+		_einittext = .;						\
+	}
+
 	. = ALIGN(8);
 	__soc_early_init_table : {
 		__soc_early_init_table_start = .;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
