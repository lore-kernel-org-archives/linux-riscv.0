Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA1E9C43334
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jun 2022 22:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2crHcKkEjQn0bn+s6Bv7FdD0TREskk4LyJ+DShWmAaU=; b=e2pizGKorXEHaf
	Pg5ajJm6DIlKpUl7kG6p14Yb5WxCfAuByCCXeimf7vGdOSGqU2wPSvNpgOlCDikWQSBD6Z6S2jHJ+
	9zsG8GMVown0BWsxVyAsR3jDkDHEuIAxvlSeIRt/3dfh7Pt69W3MCdhPGgfmYGD1zekRyZ7TZ1TDv
	gjtssaTFrV5M0JFZvYdPMjckSEtsWxDEOwfPtVlChbaAE3pJsV1qSb/zprQPriTZvcgH92IbRLc+3
	Fsv/wXq0S8lnqidJfFdQG7NcuIILUCCLTk7vioYTAw2u3rMpjup7X5IiZO5TgexiLkVoxlE9pRzXw
	BTLBwtrPbzBcI3UTpGjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5ENn-008Dgn-LS; Sat, 25 Jun 2022 22:36:03 +0000
Received: from conuserg-12.nifty.com ([210.131.2.79])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5ENk-008Dex-Lw
	for linux-riscv@lists.infradead.org; Sat, 25 Jun 2022 22:36:02 +0000
Received: from grover.sesame (133-32-177-133.west.xps.vectant.ne.jp [133.32.177.133]) (authenticated)
	by conuserg-12.nifty.com with ESMTP id 25PMYreK012075;
	Sun, 26 Jun 2022 07:34:54 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 25PMYreK012075
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1656196494;
	bh=WgQFNPYHMxqyTX5c5nAwQv5As8G9LUvywSuGoACkOUs=;
	h=From:To:Cc:Subject:Date:From;
	b=QcTUgYjurPsf2efpKisRgROBAzCFU7cFnKDW9nul/gyD8TJnU/ZnS4uK07qUYXjAE
	 oLx1B3FWuxMZGfL+yMcRBgk9+ZGrKvtxwjUfyfyZg0qOOFvvo1Mm2EB1FPOgNcv+lC
	 h8tbZC6t+1vi8gdYR0jTiNa11N4whzZtEiNWlBa+VdeuO+VHYl/yX0lINBPvltOxHN
	 0dzDSk855TXFXeknCBrCNtuEiZG7Sryw5qkZUBm78SB+F2phNpiS+aFSp7UweLm8h/
	 BH0O0cUGOESLL+e/tAG/8rU6NyO9TrmT0ZI7PHUUBp7KLDoXU5wT1l/1CeHIUEN+qd
	 5cuBi6Oq1MqNg==
X-Nifty-SrcIP: [133.32.177.133]
From: Masahiro Yamada <masahiroy@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        linux-riscv@lists.infradead.org
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] riscv/purgatory: hard-code obj-y in Makefile
Date: Sun, 26 Jun 2022 07:34:36 +0900
Message-Id: <20220625223438.835408-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220625_153600_967686_54DD7C6F 
X-CRM114-Status: UNSURE (   7.71  )
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

The purgatory/ directory is entirely guarded in arch/riscv/Kbuild.
CONFIG_ARCH_HAS_KEXEC_PURGATORY is bool type.

$(CONFIG_ARCH_HAS_KEXEC_PURGATORY) is always 'y' when Kbuild visits
this Makefile for building.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/riscv/purgatory/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/purgatory/Makefile b/arch/riscv/purgatory/Makefile
index d4df200f7edf..c2d14e2f345d 100644
--- a/arch/riscv/purgatory/Makefile
+++ b/arch/riscv/purgatory/Makefile
@@ -92,4 +92,4 @@ quiet_cmd_bin2c = BIN2C   $@
 $(obj)/kexec-purgatory.c: $(obj)/purgatory.ro $(obj)/purgatory.chk FORCE
 	$(call if_changed,bin2c)
 
-obj-$(CONFIG_ARCH_HAS_KEXEC_PURGATORY)	+= kexec-purgatory.o
+obj-y += kexec-purgatory.o
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
