Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C859606A88C
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 17:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EqoF74Pz;
	dkim=temperror header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=MoEyIP header.b=XFWC0z+9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=4se4lqdhuTem0hqLGXklI/SML0i9XO874rbiD0v4Tz0=; b=EqoF74Pzo4fpIOLIUii4LMJUzO
	5gT9XcjQeld244KGthzhQU1rvUfd2P5T0cyQi1cKR+ccMKBHz6/6ev+RiL+7O3nPB1wnaC129XS4V
	uHNy6rC3sVfs4jJBI7EJu2fuKakulaXEgQw2NQQupM23FPtfmdXaw/5XyadRobSu7ttjPnFC5Nt4m
	vNquwCVwEEVESPPwn8jSIUi4nKsHIjXBRKPbxAfgViXBsGv2O5S9NryRl0VDfZrxDNjAdR8mWc81Q
	LPYRjqIrNB0kEzfUnaVu5Bg2KB7vERCA4JRRCf+4B2hb6mWA7ssdxSrdWXqTOia8r9m5O1VgoJXxP
	aShRtQ4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRBi8-00000007GKA-27fy;
	Wed, 11 Nov 2026 17:02:12 +0000
Received: from esa1.hc555-34.eu.iphmx.com ([23.90.104.144])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRBi5-00000007GIz-0kWS
	for linux-riscv@lists.infradead.org;
	Wed, 11 Nov 2026 17:02:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1794416529; x=1825952529;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=IxwxnDIA+/sk0ZQAuVTz9Rbo8EW+wUc/VXSIbwOtVmg=;
  b=XFWC0z+9cu4KqCNnzagK7ylArBIjtBqmHJyr/AD6oDCIXvIQyfbiymL9
   /hN6EihflPduXN+R0d/9edEexaSKhK2UAczCgQAJJEULoVZclXLq58KZw
   6yjnN9vBpvLRjC3HlV/y2ZKmwfTwVLdKd/JNC69JKeQwgPCxAWmBTwT7Z
   K80VoPIErIYdr/Ga/ET+JnTZYg+k5yvufFQ5drr/HODQERl6ZLdqE9Yxu
   3kgloYgE4zzNUq+IJ56S3Xcr38+JQaWL/J1n2+3i2iVd7pMfJvVht7mfg
   TOsAZwiL2oOA5gNxjxDgRtuZjzy9pEBQ4Zsc2g8igvScCh/DqQizIlBgx
   g==;
X-CSE-ConnectionGUID: qMH20kXAQVS/Zpd620hA6g==
X-CSE-MsgGUID: zpLljavxRXuyLP0DllPeig==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces02_data.me-corp.lan) ([146.255.191.134])
  by esa1.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 19:02:04 +0200
X-CSE-ConnectionGUID: 6qT7i9r2SxWwP4clXhYOwg==
X-CSE-MsgGUID: Ss41W1xXRjCBviLuEz8/JA==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.3])
  by ces02_data.me-corp.lan with SMTP; 11 Nov 2026 19:10:10 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Wed, 11 Nov 2026 19:02:03 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: [PATCH v2 0/2] riscv: probes: reject probes inside an LR/SC
 sequence
Date: Wed, 11 Nov 2026 19:01:06 +0200
Message-Id: <20261111-probes-in-lrsc-v2-0-b2525b7e1e8e@mobileye.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFKf9GoC/3WNwQ6CMBBEf4X07BqL2Ign/8NwoNutrAFKukgkh
 H+34Nm5vWTmzaKEIpOoW7aoSBMLhz5BfsgUNnX/JGCXWOWn3OgUGGKwJMA9tFEQCkRHBq0vzka
 l0RDJ82cXPqofy9u+CMfNsjUaljHEeX+c9Nb7K580aCh8WTpH9cWb670Lllua6YihU9W6rl9e0
 DwzwQAAAA==
X-Change-ID: 20261111-probes-in-lrsc-4ccde6cbf436
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
 Peter Zijlstra <peterz@infradead.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_090209_731274_DC99B79B 
X-CRM114-Status: GOOD (  12.54  )
X-Spam-Score: -4.0 (----)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Patch 1 fixes page fault reported by sashiko-bot@kernel.org that
existed before this patch series

Patch 2 rejects probes inside the LR/SC sequence. This commit was
submitted as patch 1 of the series [1].
Detaching it from that series with slightly edited commit message,
because it is not depending on other stuff.

[1] https://patch.msgid.link/20261110-lrsc-only-v6-0-bafc3cc0fcae@mobileye.com

---
Changes in v2:
- Allow kprobe on the LR itself unless it is part of the LR/SC loop.
- Fix error (reported by sashiko-bot@kernel.org) where
  arch_prepare_kprobe() returns -EILSEQ for LR/SC probes.
  Make codes returned by arch_check_kprobe to indicate -EINVAL
  if probe falls within the LR/SC loop, consistent with the case when
  INSN_REJECTED returned by riscv_probe_decode_insn
- add patch fixing out-of-bounds read in riscv_probe_decode_insn()
  reported by sashiko-bot@kernel.org (as patch 1)
- Link to v1: https://patch.msgid.link/20261111-probes-in-lrsc-v1-1-4f99ddea5f68@mobileye.com

To: Paul Walmsley <pjw@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
To: Albert Ou <aou@eecs.berkeley.edu>
To: Alexandre Ghiti <alex@ghiti.fr>
To: Masami Hiramatsu <mhiramat@kernel.org>
To: Oleg Nesterov <oleg@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-trace-kernel@vger.kernel.org
Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>

---
Vladimir Kondratiev (2):
      riscv: kprobes: fix out-of-bounds read in riscv_probe_decode_insn
      riscv: probes: reject probes inside an LR/SC sequence

 arch/riscv/include/asm/insn.h          | 28 +++++++++++
 arch/riscv/kernel/probes/decode-insn.c | 91 ++++++++++++++++++++++++++++++++++
 arch/riscv/kernel/probes/decode-insn.h |  7 +++
 arch/riscv/kernel/probes/kprobes.c     | 29 +++++++----
 arch/riscv/kernel/probes/uprobes.c     | 31 ++++++++++++
 5 files changed, 177 insertions(+), 9 deletions(-)
---
base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
change-id: 20261111-probes-in-lrsc-4ccde6cbf436

Best regards,
--  
Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
