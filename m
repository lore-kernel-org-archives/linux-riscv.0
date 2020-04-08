Return-Path: <SRS0=IoIa=5Y=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FBC1C2BA1A
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  8 Apr 2020 16:58:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1355220787
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  8 Apr 2020 16:58:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AP7sH+OB";
	dkim=pass (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="1x0cUsLP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1355220787
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:From:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/mofz8FjwFxWbzOgw5tTHBwe33Bm8nY/vb2rVIqiwFs=; b=AP7sH+OBYT215tNV9GRytVf2H
	USH5N0OiOYG3OqnrXU0oFag7UPTVAVXDE//aoyMJCwrdGIyRFntA/f9aC5q6cd9nI8XyP7nOMVkLJ
	lJ4NiIk6AwWOHPuVJ02ktmMhTn+EGCOtOdXKuG7huunAijk287r/mz08EremB5Kcmnu4n6Yu59Gsa
	RrDeQxD6kGHhJDVJ4GTMTMBBLH9ZmeOSqiUKwAobxhkiuErWcnolnuuPxptThLjjtvdQVGO2bDkWr
	T0TIAYdzbfsoUDE8CCV2RILPPmfmozW04mC77sqWNp5ydap5L/t8F1/8mZwO39Txamkl6EnimVJp1
	M4ZMES/yg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jME2T-0003tt-4s; Wed, 08 Apr 2020 16:58:57 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jME2P-0003om-MH
 for linux-riscv@lists.infradead.org; Wed, 08 Apr 2020 16:58:55 +0000
Received: by mail-pf1-x442.google.com with SMTP id k15so2674488pfh.6
 for <linux-riscv@lists.infradead.org>; Wed, 08 Apr 2020 09:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=/mofz8FjwFxWbzOgw5tTHBwe33Bm8nY/vb2rVIqiwFs=;
 b=1x0cUsLPTIt1BfHy7xhedGKagzrrcLA2h88HutNelHxEM+IlJJfi8Co+VzADUxO6/E
 JFXw5hkbDbsAvjUf6Kkx5JhhQLpnccXvysrfgSL5ImfSLtgwwQ1G+eyOYSbo1rWsf2ci
 I8TwsFjlVABCz5SRn4+pvPgxR65U9uQ1iNZtsYzBHF3gU7gjj91BKAdf3ipARVcq61Z6
 0xWmZ5ROSD7KC3/l1VQK+QK8ILtoJs0SKaPUEURIWyX4kcfm1B9S8MfjHlnBXHcVWluy
 Z8LK8WBHey3p5g5hLAmi6NzxoAgwU4wLajjwrLnQ8Ii0WU0hRMatfuvWhn1Mk4c1yxm/
 g9Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=/mofz8FjwFxWbzOgw5tTHBwe33Bm8nY/vb2rVIqiwFs=;
 b=cnOWECOapAvwFM1M7vkZQdz5cmRpD7z7GRCYL1s6UWqOcdO2e88Ugex68TWP5glIsM
 9MzbrZyrwkVEjdR9GQkS5Q5JldrNWr4Q2brZStZKaLEgdYZnRyUbjA0DxslezFB3J0NO
 ZlOUDk+YvC+fRPNIzwNAWTmWvcgkFeccCpe+14Tr7Fbevyv0H60b8iz82qU07W/4IpD0
 2r/5Ch9+41/4n90IT/41rac1EYKYpBZGDL5DASXIj3Kv+YgkJicitf6cBeXWULqLf8yk
 xkO+QRBqdjILwYTZ29MVuLapIr8SHayY31kdFKO5/Wz2nEScw2/I7ZobXOXC6EO8g/4X
 If8w==
X-Gm-Message-State: AGi0PuYoddIT1U/KwQNjSpE+rW3VTEpu2Mq7Oh4zEs/dvydK230kVFdv
 2rg4MSXVwYy2oU/jbWmZU57DCQ==
X-Google-Smtp-Source: APiQypLnauC8w+MVe+D19F4ziPpqCL7apqbY2oP/2WI1/9pLg4OSc/wmSEluSerATeSvPQdRn/xJTA==
X-Received: by 2002:a62:1b51:: with SMTP id b78mr8369209pfb.23.1586365132924; 
 Wed, 08 Apr 2020 09:58:52 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id z66sm16766215pfz.30.2020.04.08.09.58.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Apr 2020 09:58:52 -0700 (PDT)
Subject: [PATCH 3/3] RISC-V: Skip setting up PMPs on traps
Date: Wed,  8 Apr 2020 09:57:41 -0700
Message-Id: <20200408165802.167546-4-palmer@dabbelt.com>
X-Mailer: git-send-email 2.26.0.292.g33ef6b2f38-goog
In-Reply-To: <20200408165802.167546-1-palmer@dabbelt.com>
References: <20200408165802.167546-1-palmer@dabbelt.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Palmer Dabbelt <palmer@dabbelt.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200408_095853_729555_4170E523 
X-CRM114-Status: GOOD (  12.76  )
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

From: Palmer Dabbelt <palmerdabbelt@google.com>

The RISC-V ISA manual says that PMPs are WARL, but it appears the K210
doesn't implement them and instead traps on the unsupported accesses.
This patch handles those traps by just skipping the PMP
initialization entirely, under the theory that machines that trap on PMP
accesses must allow memory accesses as otherwise they're pretty useless.

Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 arch/riscv/kernel/head.S | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 98a406474e7d..7ed1b22950fd 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -161,11 +161,20 @@ ENTRY(_start_kernel)
 	/* Reset all registers except ra, a0, a1 */
 	call reset_regs
 
-	/* Setup a PMP to permit access to all of memory. */
+	/*
+	 * Setup a PMP to permit access to all of memory.  Some machines may
+	 * not implement PMPs, so we set up a quick trap handler to just skip
+	 * touching the PMPs on any trap.
+	 */
+	la a0, pmp_done
+	csrw CSR_TVEC, a0
+
 	li a0, -1
 	csrw CSR_PMPADDR0, a0
 	li a0, (PMP_A_NAPOT | PMP_R | PMP_W | PMP_X)
 	csrw CSR_PMPCFG0, a0
+.align 2
+pmp_done:
 
 	/*
 	 * The hartid in a0 is expected later on, and we have no firmware
-- 
2.26.0.292.g33ef6b2f38-goog


