Return-Path: <SRS0=7nvN=DM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADC2EC47095
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Oct 2020 19:46:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EF8E2100A
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Oct 2020 19:46:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="17O5/uhU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="mFzAI9+/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3EF8E2100A
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:MIME-Version:Message-Id:Date:Subject:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=I9tFLwqxbLwhg/nUZrm7I/MixIJblweVppNNbfK04MM=; b=17O5/uhUW3rt4U3CW1wWmd8cDu
	1ZNTh+SedF19imVo4L3KAt6KD8LbL85+AoZcpkpL9JxJdTOerIhl3+H2BZI7KajxwFFKtePAiqq7J
	jywu8UL052tTYTG5MCmbARhysZvzHVvtY7fWlhmS1NMZ2NDf36e+5pdBukaVoxleRjG+cPRCv/TtX
	VZGh59JZfOS5Xyd7W6SzNII+V2T4sLXuOpnzFfDgQG7bfiRCHM7wxoOM4xHANG+3qIK1819eT2fev
	dZG+vHM5W4KJu5cM15JU196g5Q0gJ8fLH9iv0/veim9ghCjLz6fEcz8Sd5WA91Hel6t0uvAtNVN0K
	0WpQMHkA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPWQm-00013w-Uz; Mon, 05 Oct 2020 19:45:56 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPWQk-00012r-Gz
 for linux-riscv@lists.infradead.org; Mon, 05 Oct 2020 19:45:55 +0000
Received: by mail-pl1-x644.google.com with SMTP id y20so37936pll.12
 for <linux-riscv@lists.infradead.org>; Mon, 05 Oct 2020 12:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=1IiFIB5LTGOIAcQh5ikqmkuQhCBDj6hbusfzgWKgBqU=;
 b=mFzAI9+/tES/8gVFjdz8M3mrXozNX1YNAcS+ioI8MrB9oxSsstH9hpyuu00eZIDo0F
 bWbv5ewMw68WczYYe8qJrYBXkNAG6P1KfWI3Wj05FcWfYq7U1cQi80/wMfefnIiKn6GW
 Vi++zKc09yRBweXfJU4/Oo4HayXxAihq3j9KrtaBui+IJEpVati7V8RBPRS2XbuuR7te
 nL+/8k2xZFJzrWoddunW8Rphh2xngm8JnRQXYtJNrrvh47T+MXYOUovUbDROxUw0bQWQ
 tl32k6K+Gjju+vPoZ6qR8guYmW96BbL6Sz0Mz70mvTo2xToujyC1OnUUy9yRW/zqfjrJ
 usVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=1IiFIB5LTGOIAcQh5ikqmkuQhCBDj6hbusfzgWKgBqU=;
 b=dB0PO2yBZAChQD/lGaNZuB4cYSnFuRowFeW75qqVSiWMjE2xanKKdK35EbQTbUXje/
 cyJezc2MZogLZqlc3HEZoYyZxTz6Xa3IUL9ZLsZjw4ZZ/wNB+AveyHom17zfX0ttmndf
 nenotO3AoLPQGeVKAX7UmUYY4AxGNpiAgV0T56tUG5n9LBFCk7/5cDpSC1zgY/yrt06n
 iwMNXGtX4sG2rmgh3qOrwmzXlAtUl/m39qlAbBikK95ZYRZRhIGBvFV6qdmHtSqrhQ+S
 DiRIU1uOT2JnXT2E5M1ggBL8SI0LN65yg75GtTXIxuQXFu8khLBzqRxxTo3NJk4PDGS9
 qJfA==
X-Gm-Message-State: AOAM533Pl3kQQ8qTIIFJ8Ius36RcOp0Ss8HJEf/YMhcIz2+F7ZwcXRR7
 8fsnYEPtEizMGibL0YwIaszxh1rtFUAvJQ==
X-Google-Smtp-Source: ABdhPJwMFS8OHbS8fhEtBjvMrnCOPJqhIrvwCnkbhMhiwc6r8fdjwoUpsN7c4JeResLQMTtAuykFtw==
X-Received: by 2002:a17:902:d710:b029:d3:7e54:96d8 with SMTP id
 w16-20020a170902d710b02900d37e5496d8mr88575ply.65.1601927151902; 
 Mon, 05 Oct 2020 12:45:51 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id k206sm865893pfd.126.2020.10.05.12.45.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2020 12:45:51 -0700 (PDT)
Subject: [PATCH] Revert "riscv: Fixup static_obj() fail"
Date: Mon,  5 Oct 2020 12:39:28 -0700
Message-Id: <20201005193928.3675137-1-palmerdabbelt@google.com>
X-Mailer: git-send-email 2.28.0.806.g8561365e88-goog
MIME-Version: 1.0
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201005_154554_619125_FB0782CC 
X-CRM114-Status: GOOD (  16.05  )
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
Cc: Palmer Dabbelt <palmerdabbelt@google.com>, kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

6184358da000 ("riscv: Fixup static_obj() fail") attempted to elide a lockdep
failure by rearranging our kernel memory map to place all initdata within
[_stext, _end], thus triggering lockdep to treat these as static objects.
These objects are released and eventually reallocated, causing
check_kernel_text_object() to trigger a BUG().

This reverts commit 6184358da0004c8fd940afda6c0a0fa4027dc911.

Fixes: 6184358da000 ("riscv: Fixup static_obj() fail")
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>

---

It's pretty late in the process so while I'd prefer to fix both bugs (ie, fix
lockdep without breaking hardened usercopy) I don't think there's time to do so
for 5.9 (or even 5.10).  I'll try to find some time to look in to a more
focused fix to the lockdep issue, but finding some time to actually think about
our memory map has been on my TODO list for a while now.
---
 arch/riscv/kernel/vmlinux.lds.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
index f3586e31ed1e..e6f8016b366a 100644
--- a/arch/riscv/kernel/vmlinux.lds.S
+++ b/arch/riscv/kernel/vmlinux.lds.S
@@ -22,7 +22,6 @@ SECTIONS
 	/* Beginning of code and text segment */
 	. = LOAD_OFFSET;
 	_start = .;
-	_stext = .;
 	HEAD_TEXT_SECTION
 	. = ALIGN(PAGE_SIZE);
 
@@ -55,6 +54,7 @@ SECTIONS
 	. = ALIGN(SECTION_ALIGN);
 	.text : {
 		_text = .;
+		_stext = .;
 		TEXT_TEXT
 		SCHED_TEXT
 		CPUIDLE_TEXT
-- 
2.28.0.806.g8561365e88-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
