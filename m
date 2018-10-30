Return-Path: <SRS0=Vdo/=NK=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73EF1C2BC61
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 30 Oct 2018 16:14:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3996420657
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 30 Oct 2018 16:14:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mM9ImOOP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="N1QkNPiK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rLS5aEgW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3996420657
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=/Pb+L8gFj7jRwfo0uBWoydJ3haEXvD77nJ54KzyL1GM=; b=mM9ImOOPx2yP4fOkijoJIzW+kh
	zo1G0Hf8ex+Yz7aPZlEUQVKE7NxbZQOMJSMLLD6n7nEfWAP0d/M/xZimkjQDuQ4+9sBQPrvLfHNqv
	vPxhio/rR2cWMSnQWfXWMCgkmEzwCNcAXnCg+/+hrogLei18GVoO5/D+Y2Ps8WRVs/oB85MWVRQfS
	uEBZcw+BUCy3ox9OChouzgCkxbuzEyBPb3nFHo5shBLC31uJ3e5UZXypUKO4V3eFILBGPXacr9bPE
	Jqv3P+uPdQ25qbb1GvKZ+qIwpoLQVnWigyBE2rxVk9CWvemXLAZV5b85NOY1Knd37FiVISp+lFkS5
	wooGWlQQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gHWfL-0007TN-Gz; Tue, 30 Oct 2018 16:14:51 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gHW0b-0000G0-MZ
 for linux-riscv@bombadil.infradead.org; Tue, 30 Oct 2018 15:32:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=References:In-Reply-To:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NuxinlPFkTFdjaEbQkXHMBa3Mw58yZFqIfMCUEnEDSY=; b=N1QkNPiK6AbOTLSwEOlpAYYMx
 yWSnpEI+qXmNCDnKijOdwdBuar4sPRLLh6yBF/vRrVSBU519cEBY0m56uk5oexxWVZcuypSwfAV9Q
 x9lvOtO8aMql+zyUQPQeutt1JZT012VXJayVqEgpa6MgLobUl4kuk2DyvYGyP/fGiYS0XJ2LBNxar
 xDPNYpGNGs6ENWdM3k132nr+CWr2Knv/c2fwufRNY+WqYKinZQrDTrJuTJMyhoPlJJkzCrXnH5xvu
 nos0v97zyhh3NRJhCH33HB1B62F1LUxdZ/n0eOStGbhuT5rrDxHuKvmbJHEz3sD+M8/6bjXj0bZR6
 102pZokIw==;
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gHQq6-0007yq-4e
 for linux-riscv@lists.infradead.org; Tue, 30 Oct 2018 10:01:36 +0000
Received: by mail-wm1-x342.google.com with SMTP id h2-v6so7258775wmb.0
 for <linux-riscv@lists.infradead.org>; Tue, 30 Oct 2018 03:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=NuxinlPFkTFdjaEbQkXHMBa3Mw58yZFqIfMCUEnEDSY=;
 b=rLS5aEgWL6fDLTgU58G5ZB9HwHHBeowRFymG8eSvRJY2YwW6XNTNxvxs5AFDa0WCOR
 N/n0rcFSbIi6+5sq4HauX8VPp2pKXMiw0a7EwJzQDLIfvEqeu/uOBGRUUL6ch4SPLjlY
 D2RrZFxq7WUBe0bNEAbkHELw/4oJ2WX9f/zZptfFHiHN7i8V/JqqfKm1sXa+d1ULgi2r
 FLvPLcW1ZT/BO9spbf1H5ip0oFx16zug2gajmwx6nbx4atKDZo+msiEypwH9npzD9Cj1
 6+cjm4j5BDxLB6KvnSSS6O9qhy8RrYp2t6DBu4ZjCHXw0f239udR7uSj1AxIbuqBCVjH
 ibCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=NuxinlPFkTFdjaEbQkXHMBa3Mw58yZFqIfMCUEnEDSY=;
 b=LPmt1c2narDe1vN7s+miiznXX/5DNYwVNriNl51/u18FGCXrigf6EZdqnjI1h8PqhG
 EWRXXcqZ+pndf55zTqmDlIh2cT3vpVNm5ESnJSghUnH9bcfVP9LneaAJznIgprd8sj6u
 Q+EIkRshP1OIrkCKgIuinLCUg6n4pQ63pCa5e6dQoViDt3yH4EnIT4i9ksmidD1f6jrx
 zEoIR6FNHDA3e+C1wyyiDvQg/Y4LaZ7EBUtC668F0mESDrPzj4XHNq5jqyGi0aTO9gvl
 D3ptg3+kzouQtO89F+IukAzonf+lPQvWiGCzyBOje7A1Rnwfer5d3Ve945Ww2GeEDpnv
 cHJA==
X-Gm-Message-State: AGRZ1gLEfUvICzYyG0PDgFiwQlj32fZYYe3uyK3qWUc4Sv9SjnBXApyv
 TkoP7Ot0aUIn63m9R45LEh4=
X-Google-Smtp-Source: AJdET5ch03jlyaZ8QsjzPLguPHICXfvserlErz048N4EwfQi8L+ZjEqnN0qYfgCiyNDePha1y/3uWQ==
X-Received: by 2002:a1c:f60f:: with SMTP id
 w15-v6mr1228836wmc.101.1540893681699; 
 Tue, 30 Oct 2018 03:01:21 -0700 (PDT)
Received: from localhost.localdomain (ip-76.net-89-3-178.rev.numericable.fr.
 [89.3.178.76])
 by smtp.gmail.com with ESMTPSA id f1-v6sm18420825wme.23.2018.10.30.03.01.20
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 30 Oct 2018 03:01:21 -0700 (PDT)
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
To: palmer@sifive.com, aou@eecs.berkeley.edu, green.hu@gmail.com,
 deanbo422@gmail.com, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH 2/2] doc: re-run features-refresh.sh
Date: Tue, 30 Oct 2018 11:01:07 +0100
Message-Id: <20181030100107.4590-3-david.abdurachmanov@gmail.com>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181030100107.4590-1-david.abdurachmanov@gmail.com>
References: <20181030100107.4590-1-david.abdurachmanov@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181030_100134_181402_8F9F0B18 
X-CRM114-Status: GOOD (  12.13  )
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
Cc: David Abdurachmanov <david.abdurachmanov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181030100107.GkQxjU4oqp_L-YUB_2TgIHc95rDbh3b-Ghw6-iPcwDM@z>

Some arch-support.txt are out-of-date.
This also incl. riscv in sg-chain and pte_special tables.

Signed-off-by: David Abdurachmanov <david.abdurachmanov@gmail.com>
---
 Documentation/features/io/sg-chain/arch-support.txt           | 4 ++--
 .../features/locking/queued-spinlocks/arch-support.txt        | 2 +-
 Documentation/features/perf/kprobes-event/arch-support.txt    | 2 +-
 Documentation/features/vm/pte_special/arch-support.txt        | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/features/io/sg-chain/arch-support.txt b/Documentation/features/io/sg-chain/arch-support.txt
index 6554f0372c3f..41ea6f738b38 100644
--- a/Documentation/features/io/sg-chain/arch-support.txt
+++ b/Documentation/features/io/sg-chain/arch-support.txt
@@ -22,12 +22,12 @@
     |    openrisc: | TODO |
     |      parisc: | TODO |
     |     powerpc: |  ok  |
-    |       riscv: | TODO |
+    |       riscv: |  ok  |
     |        s390: |  ok  |
     |          sh: | TODO |
     |       sparc: |  ok  |
     |          um: | TODO |
     |   unicore32: | TODO |
     |         x86: |  ok  |
-    |      xtensa: | TODO |
+    |      xtensa: |  ok  |
     -----------------------
diff --git a/Documentation/features/locking/queued-spinlocks/arch-support.txt b/Documentation/features/locking/queued-spinlocks/arch-support.txt
index 478e9101322c..beb013a72a90 100644
--- a/Documentation/features/locking/queued-spinlocks/arch-support.txt
+++ b/Documentation/features/locking/queued-spinlocks/arch-support.txt
@@ -9,7 +9,7 @@
     |       alpha: | TODO |
     |         arc: | TODO |
     |         arm: | TODO |
-    |       arm64: | TODO |
+    |       arm64: |  ok  |
     |         c6x: | TODO |
     |       h8300: | TODO |
     |     hexagon: | TODO |
diff --git a/Documentation/features/perf/kprobes-event/arch-support.txt b/Documentation/features/perf/kprobes-event/arch-support.txt
index 7331402d1887..bfe41d68b7af 100644
--- a/Documentation/features/perf/kprobes-event/arch-support.txt
+++ b/Documentation/features/perf/kprobes-event/arch-support.txt
@@ -20,7 +20,7 @@
     |       nds32: |  ok  |
     |       nios2: | TODO |
     |    openrisc: | TODO |
-    |      parisc: | TODO |
+    |      parisc: |  ok  |
     |     powerpc: |  ok  |
     |       riscv: | TODO |
     |        s390: |  ok  |
diff --git a/Documentation/features/vm/pte_special/arch-support.txt b/Documentation/features/vm/pte_special/arch-support.txt
index a8378424bc98..5bca00664a4f 100644
--- a/Documentation/features/vm/pte_special/arch-support.txt
+++ b/Documentation/features/vm/pte_special/arch-support.txt
@@ -22,7 +22,7 @@
     |    openrisc: | TODO |
     |      parisc: | TODO |
     |     powerpc: |  ok  |
-    |       riscv: | TODO |
+    |       riscv: |  ok  |
     |        s390: |  ok  |
     |          sh: |  ok  |
     |       sparc: |  ok  |
-- 
2.17.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
