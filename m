Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2CE6C05027
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Feb 2023 19:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XVK9pm5ajGCp35XmR4EL3nGweMHfmLyO3Y/BR3CnKvQ=; b=GZo7r8DEeoBrs9
	MULlVvpq+wFFX59eYGPSp/UwRk8lvbXLgdDMxP7yHMOTVZhAB4XUDD279K8pwcRXAFyrJg2HXKk31
	XnYQgIpIzH3b2L0suTjiXABewuMsOhp4fCs32sb4lGd909dGReCDeEHOJ00TgISYpalNvW/Cqyt5b
	Yvq6grqDnZhoA8ew6u0yvR+SycDvyZB0YfQr9jk0haOcq4AMDupJnu3htlDQyMmF9WTqIfAZ/QGNO
	QRFpPoBVtqxiavXLxlkZWXOR98MMRy1ZW6BbfUrC++bV6R3TdwXY2VhCMHbmIiV3qQonwsj8telr6
	gK1835LOripgtUukBV+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQYcp-0071mz-Pr; Fri, 10 Feb 2023 18:59:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQYcm-0071lo-Sh
	for linux-riscv@lists.infradead.org; Fri, 10 Feb 2023 18:59:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7C1EC61E00;
	Fri, 10 Feb 2023 18:59:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0E94C433D2;
	Fri, 10 Feb 2023 18:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676055595;
	bh=9BszgULLhrjZUrMT7h1Hy6Og2pfG9wGMuc+rzuzf73g=;
	h=From:To:Cc:Subject:Date:From;
	b=Vfrps96qq1/ciidcs7XVvISvINRisZfNp8qsDP4lRS0wAxwzTdEsNzg2PpjcuZPNa
	 MjUybeUTptBFrxeC5WbiQnpOPEQSshNIyrS/AAykhqXNA2adovyymjkp8iovYpgAcI
	 V+5w4E45SmMEHhlAPfNIW8c9bmQk7djtaHhmbpezDDLDuJw2uneJBWiAgkTsgVaE74
	 wTPHkRtn2PsP8Bsh9ab/hZ7vLGLRp8YT3LbcYM71SNQF9rWobKECBfvpOkmoXBcwwy
	 ox1H4NsgUgU+8EkGd9d18AUfMyM1xfmDKKIwtV3qR+8bkytmZ3A0DIP7xkf3kjK/XF
	 7I5WIZaxVejOQ==
From: Conor Dooley <conor@kernel.org>
To: palmer@dabbelt.com
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org,
	guoren@kernel.org
Subject: [PATCH v1] RISC-V: add a spin_shadow_stack declaration
Date: Fri, 10 Feb 2023 18:59:45 +0000
Message-Id: <20230210185945.915806-1-conor@kernel.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1096; i=conor.dooley@microchip.com; h=from:subject; bh=gkX7HOlAwOcgC/4SIJxgSQcYTAUGNEsKMRdeRXPzJWo=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDMnPpsi6tbgUS9y1On3Y/8eZ4o2vd5rPtFy4/NP3/8eEst9m R7ku6ihlYRDjYJAVU2RJvN3XIrX+j8sO5563MHNYmUCGMHBxCsBEfnAwMtw2jH5QoHPgzvb/u44uuv Du5oI5X+YZPRC00P/KaXrGYrESw/+AZyfD1ijXrv5g0eRomvHI8uByq2drwqrzGO4pb5Eqq2cBAA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_105956_994975_278CF926 
X-CRM114-Status: UNSURE (   9.29  )
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

From: Conor Dooley <conor.dooley@microchip.com>

The patchwork automation reported a sparse complaint that
spin_shadow_stack was not declared and should be static:
../arch/riscv/kernel/traps.c:335:15: warning: symbol 'spin_shadow_stack' was not declared. Should it be static?

However, this is used in entry.S and therefore shouldn't be static.
The same applies to the shadow_stack that this pseudo spinlock is
trying to protect, so do like its charge and add a declaration to
thread_info.h

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
Applies on top of Guo Ren's generic entry series.
---
 arch/riscv/include/asm/thread_info.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
index 7de4fb96f0b5..e0d202134b44 100644
--- a/arch/riscv/include/asm/thread_info.h
+++ b/arch/riscv/include/asm/thread_info.h
@@ -43,6 +43,7 @@
 #ifndef __ASSEMBLY__
 
 extern long shadow_stack[SHADOW_OVERFLOW_STACK_SIZE / sizeof(long)];
+extern unsigned long spin_shadow_stack;
 
 #include <asm/processor.h>
 #include <asm/csr.h>
-- 
2.39.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
