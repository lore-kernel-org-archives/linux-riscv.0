Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEF2AC67871
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Jan 2023 15:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PTashnVMW0nYfIlADkpOZRhd4C0zat1Z4Bd8N7Z102U=; b=zfgoj03Fi8JWmh
	G2D6nnJ531psJPnOdDUCc6pD2n6NVnuSS43RZ38uNJ36TdPn244qlyDrA80tsyFgtjIyBGr5nSHfi
	uoN7noszYxuJIW+rKyFuzXXVF+KRVD2NwVSA+pIkldvd3BSmJ7MDgN3MMuEXf/xujkncIqNh9vZkM
	mAbGCF0h8JoUMiNLgMLs6fOZeKjeck+sMyNQXKY2tRmqcAY4Q59GyJFG50E/uTzN7JMMa772LEl54
	N2ZV+f7QNClq26IobMxp7OFl8qRLCrKElBfkobeWPYigurpostlx0iZl3Vt+x/hETalDa3seSgWAW
	rjUTQMIIbGyEzhU97Axw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHRsO-00BAxt-Tk; Mon, 16 Jan 2023 15:58:24 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHRsM-00BAwp-2M
	for linux-riscv@lists.infradead.org; Mon, 16 Jan 2023 15:58:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B4DB5B81052;
	Mon, 16 Jan 2023 15:58:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EDAFC43392;
	Mon, 16 Jan 2023 15:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673884699;
	bh=J6NfBaiAHaZuC3c1U8Q2mwYoiCAI9Bs41guM1DxDgPc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E/Fm4fJ6R+gnYkAgA5KkTUQZgSbM1FBy03JJaSNEJBrs8Qx4ICgclPgIZHwfd+rh6
	 h+xQ7hvzGvW335ZpsYf4g1sna3tshbQjaZq/d1sOs2UDz3PVBZRg7FU1VKcYc3GQ3J
	 3kos1+0cwj20dPkbeq2MiXQKO7Po2z5QBRHwIaaotWQlqosYU+1Rv2/G0AeSnLJ/0u
	 U9Y9+4GqvWpyHJUoVEILZZ8eNwOLDRoaks6RH2Elao7PqmnZbNUssHsQA0bwBmD7W6
	 5SlPYhbJW4CjU5UI60tc8b3fnzIviWYRByLwdYyZbrSP9HGnjLrmWX9pTkdap8TnVB
	 3LSNAHsW+ycxA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>
Cc: linux-riscv@lists.infradead.org
Subject: [PATCH 1/4] riscv: lds: define RUNTIME_DISCARD_EXIT
Date: Mon, 16 Jan 2023 23:47:57 +0800
Message-Id: <20230116154800.2396-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230116154800.2396-1-jszhang@kernel.org>
References: <20230116154800.2396-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_075822_276526_C9B82015 
X-CRM114-Status: GOOD (  10.49  )
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

riscv discards .exit.* sections at run-time but doesn't define
RUNTIME_DISCARD_EXIT. However, the .exit.* sections are still allocated
and kept even if the generic DISCARDS would discard the sections due
to missing RUNTIME_DISCARD_EXIT, because the DISCARD sits at the end of
the linker script. Add the missing RUNTIME_DISCARD_EXIT define so that
it still works if we move DISCARD up or even at the beginning of the
linker script.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
---
 arch/riscv/kernel/vmlinux.lds.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
index 4e6c88aa4d87..07c19f2a288c 100644
--- a/arch/riscv/kernel/vmlinux.lds.S
+++ b/arch/riscv/kernel/vmlinux.lds.S
@@ -5,6 +5,7 @@
  */
 
 #define RO_EXCEPTION_TABLE_ALIGN	4
+#define RUNTIME_DISCARD_EXIT
 
 #ifdef CONFIG_XIP_KERNEL
 #include "vmlinux-xip.lds.S"
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
