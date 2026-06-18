Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7ED8CD98ED
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jun 2026 17:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CD3KbKCwLgwHTT06L0r4RYuH7UoABuog2E2c5J9HGKI=; b=Mx3nKtDW0D+6/H
	C31sPa9Rnqr49wOpOkF6Po9TGFRhPiUimVO9yA+6E2am4X4pYFJMYOH6NhScON39yOK+pAvs6PrSU
	IZSZzXGYY8jijzUb9rKR2iHfNew/42r0c1yUZ7cPxiGpQr97dHVKOEZDC6CZOi4r2wNMZRqUvPZr2
	O+5WmUbinh1gFFhMSpwhOC3Lq0kBhq3eiPN80RTHMtbCoycm4J29fm4Y/rTUETgcrW4XKG7vMVz/6
	hNRpuTJ0F/lEj07YZ2KcGv6TPTYM+ams4nnkllEjHXChK5pUTfcsEMhpYsWMcm2V2ws8nJCLjYdX0
	i+kpYtU/wehj11jxv4jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waGZI-00000001eLi-0i9Q;
	Thu, 18 Jun 2026 17:30:20 +0000
Received: from mail.thinkmo.de ([2a01:4f8:271:3f5c:0:25:1:1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waGZF-00000001eLO-28Ju
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jun 2026 17:30:18 +0000
Received: from localhost (localhost [127.0.0.1])
	by mail.thinkmo.de (Postfix) with ESMTP id 4gh5NH54gwzylW;
	Thu, 18 Jun 2026 16:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=debian.org; h=
	content-disposition:content-type:content-type:mime-version
	:message-id:subject:subject:from:from:date:date:received
	:received; s=mail202007.waldi.user; t=1781799151; bh=0cujWojzlZM
	8C2H4+AecRU7nFvcUdw0EKLb/mls3ZfY=; b=FOYQ+ewo7UxysVzmDejuWoviYD/
	9Adfq1MECIK6Ozqbjsvypk9aaG3gfWKuzqXQuPkYSRD5RgAtpdzeByQVqsti1JNe
	AY67tDKD4iMzhPI60sA8NhnORyI1E4kWuA2PFpNZgAoP3Oc8KvPQDRQZnzn9vqCB
	5Q5Kt0cPhHGcRPH3BkxdqSw8ef7nCgE5qB8QeXYCibug49O27J00MV56TO8f4qG4
	OQXoa36qYeEGbWsc1yf3TPnHxViC8y6eUiLfc8jhrFwr9+cEuHqv4yo/Ebmemf7B
	J3W5E+qjpgFdewk5mCZsf3vYIJTe/cWa+8yrHr/FKrqxwe8IO5ogTD86huw==
X-Virus-Scanned: Debian amavis at 
Received: from mail.thinkmo.de ([127.0.0.1])
 by localhost (mail.thinkmo.de [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pzhBG0ZvwH2P; Thu, 18 Jun 2026 16:12:31 +0000 (UTC)
Received: from steamhammer.waldi.eu.org (unknown [IPv6:2a02:8071:5af1:6518:ad11:fa76:980a:620e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(No client certificate requested)
	by mail.thinkmo.de (Postfix) with ESMTPSA id 4gh5NH3Z4hzyg6;
	Thu, 18 Jun 2026 16:12:31 +0000 (UTC)
Date: Thu, 18 Jun 2026 18:12:30 +0200
From: Bastian Blank <waldi@debian.org>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: Add build salt to the vDSO
Message-ID: <ajQY7n0an0YwQ--j@steamhammer.waldi.eu.org>
Mail-Followup-To: Bastian Blank <waldi@debian.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_103017_722903_56606783 
X-CRM114-Status: UNSURE (   9.55  )
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

The vDSO needs to have a unique build id in a similar manner
to the kernel and modules. Use the build salt macro.

Signed-off-by: Bastian Blank <waldi@debian.org>
---
 arch/riscv/kernel/vdso/note.S | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/kernel/vdso/note.S b/arch/riscv/kernel/vdso/note.S
index 3d92cc956b95..69bfe48be037 100644
--- a/arch/riscv/kernel/vdso/note.S
+++ b/arch/riscv/kernel/vdso/note.S
@@ -4,6 +4,7 @@
  * Here we can supply some information useful to userland.
  */
 
+#include <linux/build-salt.h>
 #include <linux/elfnote.h>
 #include <linux/version.h>
 #include <asm/assembler.h>
@@ -12,4 +13,6 @@ ELFNOTE_START(Linux, 0, "a")
 	.long LINUX_VERSION_CODE
 ELFNOTE_END
 
+BUILD_SALT
+
 emit_riscv_feature_1_and
-- 
2.53.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
