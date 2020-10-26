Return-Path: <SRS0=maVz=EB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4108FC2D0A3
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Oct 2020 23:03:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED50320780
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Oct 2020 23:03:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X0mvMGeV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="URJjjHRL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED50320780
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=K4aClDeRkTGSHM6Q3W9Eo4LL84FjDanPKTlxKTMYT2Y=; b=X0mvMGeVLhaZowgqwRF0Oy00W
	Ro3DTyI28iAxiYsgQk7tOKFm6yRviAAo61fD4CxEw0kAPfJGvb2M95clzrlSGqoJejHLAMO33adTG
	WzEJi2IwBvyKp0jyWLDkXQVeXiXA3fXO2Fdf40zfHtdT7iaNSu7soNx9r0g9RwD0XtCEe0iWXYDCy
	VYekhBN4Fw2wC4eplt45X+fkkuE3+0tF41fE6RupWyY7GQUxknVYOAdyLwNWiBCZAHnTUQfmeiFwO
	uJGDjjkmP20pBxhl9RJJaYWtr+NA0KJF8Lz94t4taxRSf6lJ+VMb32ZlXsCufd4x+h9vJjOLs35ef
	rTVgylhTg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXBWZ-0004Jf-BW; Mon, 26 Oct 2020 23:03:35 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXBWT-0004G3-Pa
 for linux-riscv@lists.infradead.org; Mon, 26 Oct 2020 23:03:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1603753409; x=1635289409;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BXRrXHASEZw+q5AEH6JXn4IG5K15cGG21TkLjxF25TY=;
 b=URJjjHRLy8KmQfGlwj/WBLzTx4gHsfdUY8YsCSHPkMnU6I/nuYRNK6Ga
 bFb3AWymzww5MFphpcpliqhWOgO7o5ggmA/PU54Lw0bMOPZCA+rynjwXo
 3S+KsjpSiGmSEq4q8fjZfKa2ErdI+J5zImh2i5Z1BSB+TnBH9I45lN6AP
 EaBFxk2EkIUlP/6LoKRzLmneYZf5HJVBOKW7pRcr48ZJbX1nj95w972SA
 FMJjzWioIkGlR3K+L4I9r0w+HJgzqTJHIS+DZnLF3LQWEoRJaPGrzgi1+
 80pshfjh4GMd0a9tcSQj/wSS17P3kJQ49XhDYEw61qpuk61DCWKl4XwXz A==;
IronPort-SDR: QJtG6KvnHciweTON41ovUFASCfAMlNSE35baDpF5gZo80LXmQZYFWDxGQuqCn75wzVDRu9qTha
 OVLwC/ghV4iZnQszcl4+JLFqr+xcefARIea4vQbe+lD+SBXej8h1etv6Sn/BGlDI4z218G7Ies
 gd0hxcq0cfi9vgrb1zOrwHQ3BNrmw1FOuOApx6fEUAqtSs9ucezKvJJyeyy4ZszU3ckY0J9G4I
 rZTBTHkd6wGgYuvcq+3IiRVQtXPfxkXXzpIkQfnrpQpkW9rJ6S8VzSZ3Su4XpXi4pT/fHmnS9y
 bsg=
X-IronPort-AV: E=Sophos;i="5.77,421,1596470400"; d="scan'208";a="152152912"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 27 Oct 2020 07:03:25 +0800
IronPort-SDR: oz9iIUPO41YXmSe5lIg1FWt9CkcMbjZjMOQWhQN3Eu+YCvga4haAmUvFUzr/dCRkEcGOibXBfo
 eM/I7m5DAnRSaeBbbs1FXY8Pmgw/I4NoLQ7/N5vBqPpbV6i20QzmfCUhUoleEfOnhjpM7M5NKq
 GcrT+a43FwhHMDO3722Gh76G8hGmXJ/TQpNUrJLD6d6F2rao3fIRtOs4X6DwAsP3T4TKHwjDaT
 8s8oMKCFFJGKKBsgvzcRbxR8SYhbYY+IoKN5H3LmowqOqe/EqvmOOs8j862dIJx/SQsGrd5KNW
 OJ+6YOzCjCoSwS47k5WebISH
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2020 15:48:36 -0700
IronPort-SDR: nc5o0tmxjzldhTvYndCLRMxDkR7DVB0Qk9xsu3nOE77OHiF++vF7uzB8dkN6FOL63EaQPgW6vg
 32Ps9rMRe6NjHIcHRp5jbx3Fek2i+PHg9bgM/sHhvhKm4Md89MmIf3oyZeyDszhniw1Vs1X25M
 OlI0GIJkCqeeclxiq3vzCN9bZC15BwvNL5vcbuD1e7UMTO2rDsIYlNsUJfTOQ3loffL7C1jBXK
 u9QjFn66K/qD/FBZsbsXUkxk7teb0SZUKmIJ96W9LgSUVq77xPrfBzq/ABINxmwTYilVzPaYOF
 RYQ=
WDCIronportException: Internal
Received: from 8223p12.ad.shared (HELO jedi-01.hgst.com) ([10.86.60.110])
 by uls-op-cesaip02.wdc.com with ESMTP; 26 Oct 2020 16:03:25 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/6] RISC-V: Align the .init.text section
Date: Mon, 26 Oct 2020 16:02:52 -0700
Message-Id: <20201026230254.911912-5-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201026230254.911912-1-atish.patra@wdc.com>
References: <20201026230254.911912-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_190330_004554_38C54A71 
X-CRM114-Status: GOOD (  14.66  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Zong Li <zong.li@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 Andrew Morton <akpm@linux-foundation.org>, Borislav Petkov <bp@suse.de>,
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
