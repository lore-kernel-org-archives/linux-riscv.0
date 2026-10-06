Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCA93CA6001
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Oct 2026 00:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MCFlXzUKBaK7C15Rb7f+Efuq9HfXxSPMnHnMxsZMkxU=; b=s4c9afZ1aIpYnV
	fojz99YFIfPlLz78zBSS4wcX9GJAn9D+ccumGNxGbA2wc0VX7jchq7I7cmU7q/yjBd8I7//Eeyvun
	lHi5WW/Mrp0I9gXQF8kzAMegv+3yvTVZPwZ2GVYMxgNpywwGZk8Wgu9twO5vLbu/31FVJavA8YDpd
	A4z7aWQT3Xmfnik73hPwTg+jQrLvs1R1cAOJPZhm47V/rMNDeqM1A1GBhZSl1AtHjIBVSRwxMdzmh
	iWAstVGr7XI5kwdFFbPmXKLzXJld8lrAQbTvPGUQizTPEsd6oHH+ETSV6tqSeuEv44rBuhHPR4d9+
	560rJMnLBgTleTJeUzWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDtA4-0000000HOae-1ChZ;
	Tue, 06 Oct 2026 00:36:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDtA2-0000000HOa7-2tiE
	for linux-riscv@lists.infradead.org;
	Tue, 06 Oct 2026 00:36:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2A4D7601FB;
	Tue,  6 Oct 2026 00:36:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C8812C4AF60;
	Tue,  6 Oct 2026 00:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791246960;
	bh=sovAdjmYwAdtERjn39xMbEnLkhTGEG+s/wYQiGGWIL4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=q33qdWegiow0Rch234hRz64CQfQok78pbR6ZYQr482dOISw9uFB2h2tSmaOiZ+qSa
	 gBsvntFJcMSqZjk4bAHXbuanRz0W1vLzBMW6tJzpUw/pGl9f//vr/IOB1bLL2dMK92
	 pU72Z9MYiVyROJh8JUrUdhHxyapk9bhMVCpfQ92NitYtL6dG3OVDPVajEz5VOA89j7
	 A1yRdyXmzmVvXqHhQ3oPo4ggSKMqByjf0xtJ/ZlOLIETO5KtVDFa5whwIbopl2cZQx
	 0jCbIdXXyZ9YJ8tNcjtNcTBHFWdzBxszwj4a4RO5MQv0GCXGm7FKlKD//g6e82R3ls
	 oMVbZWamXtYVw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6444CA5FF0;
	Tue,  6 Oct 2026 00:36:00 +0000 (UTC)
From: Gleb Pesin via B4 Relay <devnull+dormancygrace.gmail.com@kernel.org>
Date: Tue, 06 Oct 2026 03:35:54 +0300
Subject: [PATCH 1/3] riscv: vector: Check the xtheadvector status field in
 riscv_v_is_on()
MIME-Version: 1.0
Message-Id: <20261006-riscv-xtheadvector-vs-v1-1-b00e5abc9f7a@gmail.com>
References: <20261006-riscv-xtheadvector-vs-v1-0-b00e5abc9f7a@gmail.com>
In-Reply-To: <20261006-riscv-xtheadvector-vs-v1-0-b00e5abc9f7a@gmail.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Andy Chiu <tchiu@tenstorrent.com>, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>, stable@vger.kernel.org, 
 Gleb Pesin <dormancygrace@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791246959; l=1590;
 i=dormancygrace@gmail.com; s=20261006; h=from:subject:message-id;
 bh=WbIFXRUyFkHtN9RwI0mQ1+iF69lCdC2VEx0eUHFoGCs=;
 b=yk3lp8q7evGbvckSl50Aw/aQCB+qoIGwkGRubmwV8cu24M8wRDDTPR6PMBtV/kgRrOrxTWTlZ
 wq/OYhlnzB/CkuJfbWiF4GDTJnpSObYye5a7UL4gDbNaclA3nn4y9Wf
X-Developer-Key: i=dormancygrace@gmail.com; a=ed25519;
 pk=Ha8pk6XE0bhPh/mNtu1MKWgYqiX+CxZdhLyDR1rgD/M=
X-Endpoint-Received: by B4 Relay for dormancygrace@gmail.com/20261006 with
 auth_id=1121
X-Original-From: Gleb Pesin <dormancygrace@gmail.com>
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
Reply-To: dormancygrace@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Gleb Pesin <dormancygrace@gmail.com>

riscv_v_is_on() tests only the standard sstatus.VS field. Since commit
d863910eabaf ("riscv: vector: Support xtheadvector save/restore"),
riscv_v_enable() and riscv_v_disable() set and clear SR_VS_THEAD instead
on cores with xtheadvector, so riscv_v_is_on() returns false there even
while the vector unit is enabled.

__switch_to_vector() relies on riscv_v_is_on() to recognise a task that
is switched out inside a preemptible kernel-mode vector section. On
xtheadvector cores that check never succeeds: the outgoing task neither
disables the vector unit nor sets RISCV_PREEMPT_V_IN_SCHEDULE, and
riscv_v_enable() is skipped when the task is switched back in.

Test the status field that the running core actually uses.

Fixes: d863910eabaf ("riscv: vector: Support xtheadvector save/restore")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Gleb Pesin <dormancygrace@gmail.com>
---
 arch/riscv/include/asm/vector.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index fffe72a77..910313dd0 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -128,7 +128,9 @@ static __always_inline void riscv_v_disable(void)
 
 static __always_inline bool riscv_v_is_on(void)
 {
-	return !!(csr_read(CSR_SSTATUS) & SR_VS);
+	unsigned long mask = has_xtheadvector() ? SR_VS_THEAD : SR_VS;
+
+	return !!(csr_read(CSR_SSTATUS) & mask);
 }
 
 static __always_inline void __vstate_csr_save(struct __riscv_v_ext_state *dest)

-- 
2.53.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
