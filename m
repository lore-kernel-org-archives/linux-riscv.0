Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7675FCD5BD5
	for <linux-riscv@archiver.kernel.org>; Thu, 28 May 2026 21:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EPvZYhRWL4aHAJJH4WCggDcSH7ae1nj8qJ55QF1Yol4=; b=c5HTMqWEsqDWpD
	wRZnizCBVSL+UGDqh0A1UYywBQRrj91JNMA/XVcmrgd0vhy/3chnVZTLgIDWHQqsv+Xj0HPWYQS00
	wG5YLXH5XZMlZRSqKFAYnk5/bw1Ou3XRQ/h1AC48vc5APVQc5xeaRkiH2y1UlhB0W0WtaC3K+hJaL
	EVX5EsKniMPzoWUb8cS6XqiUqRjal2vNOahpuv04oOzl1zxnhQvP3Th/aw1nMem3rAgirRamgrufg
	Kn7LdujUupzNPhKTgdh0YtDmX92VHWp6BWF+nhXWL6WCl6uQqHKnPLwNI6AIr6RIMq8Ks7PUn9DY4
	JkGKDkBHrkCBCT+cGsLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSi26-00000006OBL-0lvp;
	Thu, 28 May 2026 21:12:50 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSi20-00000006O9P-2Ogs
	for linux-riscv@lists.infradead.org;
	Thu, 28 May 2026 21:12:45 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1780002760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DAiPlFC0KE16G4pPhGKAXNcBhYFRFUpkc+jmIQ76G1U=;
	b=ZUw+tPledk24a8olyYwdqu6xyZ2coiCqh+38Zpf4HMbAqIhoYHEzPFfqV0LNQ8EhL3tDCP
	dh4DLPMWOjrHiHcNHSfv8DIIxCaW7G36+IAMJKU8CiMZwaxIgseRRsYczjxkjxT7HHCLc9
	8yeDZaqI+h57LpLA+OKpgphHPZ0SEcLtgtj3gnhivc8Af94tqNq+g39onLZxuS1rPNEWI9
	aWhjZxKYe7x0zTObi4d6+ie+e5TIbqKq+io4i1KNuekpBvGKi5dbg622MV3M8+/knkhkwh
	LfvmsHARINTZQKrDd6MICmIZQriNpM9h+b6BZWUwy5+glf0gUqcyaRHohRnz9Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1780002760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DAiPlFC0KE16G4pPhGKAXNcBhYFRFUpkc+jmIQ76G1U=;
	b=fzr34QDbvAwUZMHVFTSEs4Qhv4PmUtVwMGyGy0AoGf7R6PIValKIVnUDFV2SIwI1/5VPcb
	3WS2SB1+eE++C4BQ==
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH 2/2] riscv: traps_misaligned: Avoid redundant unaligned access speed probe
Date: Thu, 28 May 2026 23:12:31 +0200
Message-ID: <aa5755142537d462a9e3d2074d82ad4eef6774ba.1780002199.git.namcao@linutronix.de>
In-Reply-To: <cover.1780002199.git.namcao@linutronix.de>
References: <cover.1780002199.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_141244_749339_FAF5F81F 
X-CRM114-Status: UNSURE (   8.74  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

When a CPU is taken offline and then is brought back online, unaligned
access speed probe always runs even though the unaligned access speed is
already known, wasting CPU cycles.

This is because when a CPU becomes online, the following happen:

  1. check_unaligned_access_emulated() is called, which clears
     misaligned_access_speed if there is no emulation.

  2. check_unaligned_access() is called because misaligned_access_speed is
     cleared, wasting CPU cycles determining something already previous
     known.

Avoid the redundant access speed probe by stop clearing
misaligned_access_speed in (1). If access speed is already known, just
reuse it.

On my Visionfive 2, this reduces CPU bring-up time from 26ms to 0.8ms.

Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 arch/riscv/kernel/traps_misaligned.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index 81b7682e6c6d..6e8ae6c66322 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -522,10 +522,10 @@ static bool unaligned_ctl __read_mostly;
 static void check_unaligned_access_emulated(void *arg __always_unused)
 {
 	int cpu = smp_processor_id();
-	long *mas_ptr = per_cpu_ptr(&misaligned_access_speed, cpu);
 	unsigned long tmp_var, tmp_val;
 
-	*mas_ptr = RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN;
+	if (per_cpu(misaligned_access_speed, cpu) != RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN)
+		return;
 
 	__asm__ __volatile__ (
 		"       "REG_L" %[tmp], 1(%[ptr])\n"
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
