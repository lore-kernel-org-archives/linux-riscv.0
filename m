Return-Path: <SRS0=wErq=N7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3250CC41536
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 20 Nov 2018 16:44:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 086FB206BA
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 20 Nov 2018 16:44:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GzuBFwKG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="JXNdEF99";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ha98a2m8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 086FB206BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=1K0l9zPmeS5kAoetIn4b7kgBml4RUPar7rhZlz+fOCU=; b=Gzu
	BFwKGf2gXiJn9ueWa4hc+cmC5nwbf3dotOTondGWgMi5EpwYEwez4zJJ6regEWYy/ktNxXOoRTV+V
	zJz6/ezt6nfTkAGsEmgZ+Fpi2X4teZjoZY0ezRe3bIy/HytHpn8+BLNHcou3twfGMrEqJ1sDzaCTR
	h9Ce21ViQRyFKVEri/tuIF4nVtBTHuOHUb8FBb5KxiBzDmt0QmG31zvJ+6uZKZBcY5RmVO+JUSc8P
	KKy8LyCYWIvaO2/QmidvgzVxAK5vov/bpSmAoKyPKFwGzEju/X+tbf/Qjxsfk5eFgcGR5FDx12Tbl
	swJg2KXw2TS1LiTOxTGDuqJY/uf9q1Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gP98q-0002HZ-Ln; Tue, 20 Nov 2018 16:44:48 +0000
Received: from casper.infradead.org ([85.118.1.10])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gP8ks-0001ws-Mg
 for linux-riscv@bombadil.infradead.org; Tue, 20 Nov 2018 16:20:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eGYN2BPY37v13Rg3NjxK4qsF50VEz3v0EMRZPiym5n4=; b=JXNdEF99G/v9v4s0pE/c5yOky
 SxyqBAUQ18mxAH56ha2sOfceXnYQVsbzY4iN44KwT4SkidZJGCo5nnZ2sQhb3NbIAI/qIqD+Iwxiz
 XoEiMYIskTQPHQBQ1KguOfo22CQg1RXA4vdrh5uGgt5t+RWGyjJ8nevMtMGR7jFizmqo3pYzH33xU
 tr+egVNPZmYqDgiemvoYlReaEnxqvI234pqONLOF5aCFqEELKqQARTIDEV9ohed77ItmTB6pLiuw3
 FQZAs4vckr/DTd6bSosjH6T7np6piLZ4ZmNwUNNjES44yvCiXovkpfT6NfcS3fAGdZArEfsMxZvyG
 FKd/MQ5vg==;
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gP6lE-00086c-Gb
 for linux-riscv@lists.infradead.org; Tue, 20 Nov 2018 14:12:17 +0000
Received: by mail-pg1-x542.google.com with SMTP id w7so944635pgp.13
 for <linux-riscv@lists.infradead.org>; Tue, 20 Nov 2018 06:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=eGYN2BPY37v13Rg3NjxK4qsF50VEz3v0EMRZPiym5n4=;
 b=Ha98a2m8K7ohlwqvlA0xstek3AeiT8WP/n67Q2310y9rO82DskaTb1WdtTCWH+Pjok
 Qwt4GLk0SNC5cJ7ACDRMFGr2QVH4N8DQ4eHSR7NeLJDTbpjTVPjwpgYgKrNf+PD3K0cw
 3Jhkt0IS6CHw/5sohyb3kpq+MuzIzxvxrbvFuav3gbbv9RzW2j/iyxEUYvx14BkFeLoU
 wKJTJl8FlJq8wH3RPuFSgNntCMB1cKKUtk88zrDmeSo/wF208BG5TuSsKMuWpITv6O6a
 MT6TDedpgy2N+vCYMhwihjGhx1japJ/QrmLVEltclxpV4V4C9zdmMR6DUUPDrKPDklEf
 CHBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=eGYN2BPY37v13Rg3NjxK4qsF50VEz3v0EMRZPiym5n4=;
 b=oKvSkifhArD/sIBMIlKhShBnVZhDQnkM9gjlmixUPZpJ1Urv53DuIrsflHuS+Mh0hQ
 TjSgq7duNPdKQouFdxcAhmiI1ndqFp+sgkEhVMbQE5q9DCWog2dBiKSc19ljMf0gFcgv
 NJBV0pfoyPHkFUcsobfKlAE4zgMGQXUBA0IWLHe0n5ff89jN8j8jyyZjhsQW2/oS68pt
 QCViAYLCLejTv1Y/R8CbHxY7U/EB24R7YyvDUGOsr05wyhnqDuKjhmWyKIfWd2s6kouR
 I50oC4YUzl1ldc624F1BTEAyh0fuKfHdzlAWxeFfvyPFIqGhHhApcK65YkgX1Sy41ON8
 Msuw==
X-Gm-Message-State: AA+aEWa4mxh6/uzw6eIi4YrZ8zRhjLyH1TkiZD20rJSqF9c9mMCDR5Hx
 XOjsUOozc7mNQu932yUAk7I=
X-Google-Smtp-Source: AJdET5cq8YKRyvS88OQlia88CfWqOuA4TqTxjGqO4Ci0MtRm5IDj2hH4vXyoL4UBF4aZ5X7KMFZqzg==
X-Received: by 2002:a63:7306:: with SMTP id o6mr1981923pgc.343.1542723065170; 
 Tue, 20 Nov 2018 06:11:05 -0800 (PST)
Received: from localhost (68.168.130.77.16clouds.com. [68.168.130.77])
 by smtp.gmail.com with ESMTPSA id n7sm9913809pff.36.2018.11.20.06.11.04
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 20 Nov 2018 06:11:04 -0800 (PST)
From: Yangtao Li <tiny.windzz@gmail.com>
To: palmer@sifive.com, aou@eecs.berkeley.edu, dmitriy@oss-tech.org,
 atish.patra@wdc.com, tglx@linutronix.de
Subject: [PATCH] RISC-V: add of_node_put()
Date: Tue, 20 Nov 2018 09:11:02 -0500
Message-Id: <20181120141102.20534-1-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181120_141216_579779_E6EAD0CE 
X-CRM114-Status: UNSURE (   9.06  )
X-CRM114-Notice: Please train this message.
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
Cc: Yangtao Li <tiny.windzz@gmail.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181120141102.WoXyVibJt4dGZFDzNSBXZk1MazKiP6usqRfswVqA7NQ@z>

use of_node_put() to release the refcount.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 arch/riscv/kernel/time.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kernel/time.c b/arch/riscv/kernel/time.c
index 1911c8f6b8a6..40470e669a35 100644
--- a/arch/riscv/kernel/time.c
+++ b/arch/riscv/kernel/time.c
@@ -26,6 +26,7 @@ void __init time_init(void)
 	cpu = of_find_node_by_path("/cpus");
 	if (!cpu || of_property_read_u32(cpu, "timebase-frequency", &prop))
 		panic(KERN_WARNING "RISC-V system with no 'timebase-frequency' in DTS\n");
+	of_node_put(cpu);
 	riscv_timebase = prop;
 
 	lpj_fine = riscv_timebase / HZ;
-- 
2.17.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
