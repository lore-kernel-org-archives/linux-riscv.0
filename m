Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B85E4EF99F3
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Feb 2026 02:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oMARvge7cHp6rYsHpYcyxRgl7R7lmH2fOHTzg7dHXuU=; b=bqBsV/xxqo1MMk
	jcve4HVtd5cChRUR+8mwtamOzytdr36oY7jhRoe8Tyz0oPtEhvK0vskbE2dhSKRh+PFXrWhK5d/GG
	sjseO6o6ORfGZqrUZLKXOg9a/zfZXUt2pkA/F9El5b08GIexhqWtgyiyRXv3EuNMEPdIj2ZhFRo9W
	Nnqk0IivRUsWtK+hMPDwnDOvyHP7vYbnzFPqmFh80CK/CVFNEKdZqQ79PE3YP+h5E/0nuxMa7vNPF
	mfmPqgG0DhJ/1At/Bw+KIjgO/DZKPlNEzrHbiuHjuij08G0a7fENnZfXEhCNX1Y5/rn9+x3QHtwsX
	FuPQ1zNBZnn2fP/NzShA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vr5YK-00000004AjO-1Irk;
	Sat, 14 Feb 2026 02:38:36 +0000
Received: from out-179.mta1.migadu.com ([2001:41d0:203:375::b3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vr5YH-00000004AiJ-2L3Y
	for linux-riscv@lists.infradead.org;
	Sat, 14 Feb 2026 02:38:34 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1771036711;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SRA0PW/CLHVVDqNCVWQE4q8KgPW8Hb1oRAscCsU9AWY=;
	b=aWH/rgDNCvqRtisIRzbd/1S2iXyOyQSnDvXQJBqhVHjiOhYybL4735aq2SZjekhcl3tIwY
	upwXPDaRX22no2M5bkvjtGYoEfqKB0p0+vPfAnCTtr28ENFODPTvTp/Zpexs46KClSDEg6
	bkL5H65bOUYZ5vMBUJ3xQ4rFakRxGOU=
From: Kunwu Chan <kunwu.chan@linux.dev>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Conor Dooley <conor@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@rivosinc.com>,
	Zong Li <zong.li@sifive.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Zhouyi Zhou <zhouzhouyi@gmail.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kunwu Chan <kunwu.chan@linux.dev>
Subject: [PATCH RESEND 1/2] riscv: xip_fixup.h: fix comment typo and whitespace issue
Date: Sat, 14 Feb 2026 10:38:03 +0800
Message-Id: <20260214023804.677127-2-kunwu.chan@linux.dev>
In-Reply-To: <20260214023804.677127-1-kunwu.chan@linux.dev>
References: <20260214023804.677127-1-kunwu.chan@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_183833_739265_B266AB5F 
X-CRM114-Status: UNSURE (   8.84  )
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

Fix two minor issues in XIP_FIXUP_OFFSET macro:

- The comment describes the fixup formula as
  "reg += CONFIG_PHYS_RAM_BASE - _start", but the actual assembly
  code subtracts _sdata, not _start. Fix the comment to match.

- Replace spaces with a tab for the "add" instruction to keep
  consistent indentation with surrounding lines.

Reviewed-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
Signed-off-by: Kunwu Chan <kunwu.chan@linux.dev>
---
 arch/riscv/include/asm/xip_fixup.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/xip_fixup.h b/arch/riscv/include/asm/xip_fixup.h
index f3d56299bc22..56db595b0e14 100644
--- a/arch/riscv/include/asm/xip_fixup.h
+++ b/arch/riscv/include/asm/xip_fixup.h
@@ -16,10 +16,10 @@
 	 *
 	 * The start of data in Flash is _sdata and the start of data in RAM is
 	 * CONFIG_PHYS_RAM_BASE. So this fix-up essentially does this:
-	 * reg += CONFIG_PHYS_RAM_BASE - _start
+	 * reg += CONFIG_PHYS_RAM_BASE - _sdata
 	 */
 	li t0, CONFIG_PHYS_RAM_BASE
-        add \reg, \reg, t0
+	add \reg, \reg, t0
 	la t0, _sdata
 	sub \reg, \reg, t0
 .endm
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
