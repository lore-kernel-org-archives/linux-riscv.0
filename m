Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 214A3C55165
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jul 2026 13:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mJeWqFxQer10wtSN5VWzdMFoqUO8Q/iwidBp5miPeh4=; b=Ykx9twE6EiQ3FQ
	OCcJVS3ENJH5d80ONWE5vITmZmJtic7VF2ydG01IZKTyTcz0jp0MQAivU9yXzG2EnLixGqDJPnoOu
	MpnOzzg2XIX1YKCMeE4ZwvquT21rnbUMan29TAgh5McHFgDEuYfQEPKSx1RVWxFl5sO9nUBB5yeve
	78l67N+j3JtwPLVZetTyjR9XJQprDuuIkICy0TlFuG/GIBAiBKNT2T2qhOGmaE7+HcoR1VHBJjaVy
	nqssoYshVt8Dtm5nDIodDBg6woUOtCLzpto3+1/xULa5FWExIOAA4lkaZR4U3hcQtZxMoNQZ3IoZQ
	uka0UT+Q9gwY47IaMFBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpQfs-0000000AZhW-2JXE;
	Thu, 30 Jul 2026 13:19:48 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpQfo-0000000AZgB-1YR0
	for linux-riscv@lists.infradead.org;
	Thu, 30 Jul 2026 13:19:47 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785417579;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yqB62auyr8bIlOLaUWD1NYzJOLhkKUNGQwvWT61Dm3U=;
	b=hvQstgFGtRtNyXBMyC76oIUoiMB+ifHbTpj63umhtoi2ORpoAMn3UOC8KcQ22Kg5husDuI
	YQUd6Vf9W/+6Vt5wF1VW82nBZqMyD6HIJrQR3G9Yn8J/gQ6FRIrT2G6KjA55V5D627H3Ke
	cwf8erjPOPynUIZNh2ZgA2adCbR+ieN7/sEyNJj00O1rIuoowvzKrrwt3SUEoekRjwghKR
	mdKslSuy6alPV77WqwCwC3Dw2w/gsKLtUjY9u4ifEHE3ge2CFL84SW5S7WqcoNioZe1DAg
	nhi1ewLdz/GACOwnDbPta5TbxA6lPwfUvr1nKYZZFMcPn5nrhuaOxLQ2yoDACQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785417579;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yqB62auyr8bIlOLaUWD1NYzJOLhkKUNGQwvWT61Dm3U=;
	b=lT/cyWstY7X82l/W+SriY3S2773EcIg1d0rfiUlxZ7JwOrjDbLmaDL67FECyOHDB5mPDYl
	kbVekgGcW2UdhfBA==
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Jesse Taube <jtaubepe@redhat.com>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] riscv: unaligned: Fix check_vector_unaligned_access() stub name
Date: Thu, 30 Jul 2026 15:19:31 +0200
Message-ID: <20260730131931.2066821-1-namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_061944_586006_6B75956C 
X-CRM114-Status: UNSURE (   8.08  )
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

When CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS=n, the no-op stub for
check_vector_unaligned_access() has the wrong name and causes compile
failure.

Correct the name.

Fixes: f54d193db5da ("riscv: unaligned: stop using kthread for check_vector_unaligned_access()")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202607301618.yrE3EKfS-lkp@intel.com/
Signed-off-by: Nam Cao <namcao@linutronix.de>
---
This patch can also be squashed to f54d193db5da.
---
 arch/riscv/kernel/unaligned_access_speed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
index 5212aa99771e..6e35bca568de 100644
--- a/arch/riscv/kernel/unaligned_access_speed.c
+++ b/arch/riscv/kernel/unaligned_access_speed.c
@@ -288,7 +288,7 @@ static void check_vector_unaligned_access(struct work_struct *work __always_unus
 }
 
 #else /* CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS */
-static void check_unaligned_access_speed(struct work_struct *work __always_unused)
+static void check_vector_unaligned_access(struct work_struct *work __always_unused)
 {
 }
 #endif
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
