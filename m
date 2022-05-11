Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC24C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 11 May 2022 18:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Jio7QD+7Kz6ynX8YCXeb9kp8qUUcDJOCEcIOSgKyQLQ=; b=N3C+fJ5yiYZofv
	tIHSRYPxxPbnU1IJzqYHldPB7bck9Pw+gVOSeQIPazUkedROB+hM7WovucGgjp5vY9/cmd6bNqwj2
	g+3f+5y524DfR0UTxpyIRj6vY8JbMCtJGR6PECW03dMcXEWS+fOhHdkaMmVMtIFm8+PAyiycvXNjy
	ak5vWttATCl1JIa/4jJMyzhkklKtJu9sHuk7uqX2ddaThxC/a7Oyfn/6NGiUV6kemdrs89dpL608+
	bg9vsTePA275QIbvq2aufghbYGarEmhRBiagjtpg7lSY6OcEMMUjJCkdID47ZvDFW4iiPV429LwQV
	BSFL+kd1ExlHR8n4D7zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1norMt-008EF8-NH; Wed, 11 May 2022 18:47:27 +0000
Received: from conuserg-11.nifty.com ([210.131.2.78])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1norMp-008EDi-MZ
 for linux-riscv@lists.infradead.org; Wed, 11 May 2022 18:47:25 +0000
Received: from grover.jp (133-32-177-133.west.xps.vectant.ne.jp
 [133.32.177.133]) (authenticated)
 by conuserg-11.nifty.com with ESMTP id 24BIkGMn020990;
 Thu, 12 May 2022 03:46:17 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 24BIkGMn020990
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1652294777;
 bh=jJh/rcQpxowKUX3OBDTsgiLvIWifNhLTl01lAPYb4N4=;
 h=From:To:Cc:Subject:Date:From;
 b=dWK61NOYKgPPbd9JoMMr0o1RXkfZ7+nOR1vsR2j9AWWrnH7WiKkVKdUC5lKtB8NBU
 mEwFTO8+wV3nvqKxm6L1KDuVm1CpMPW8KShM+LYJwjA2M9yQmqAiCzf/yrrM1THUMh
 TMTvQqH4X91Oblt2XOh5D3Cuh3Ba8B0TA5oAP0z4EvmxG2bsXL9WtXAPGl4R3H0WTl
 4ZkEjqWQ236CcX72NbZ9TdypzEMZkfdEDyjUZk/CRKJK+gzRs1/ufxu1NunqaZ4HeE
 LKSwXA3wj/5dVnjb9qXAStAlKGTGSbLnEAQ4U4XtRZtD8sjhP+YgmysACPaAdO1qU9
 NURasB6JayaAA==
X-Nifty-SrcIP: [133.32.177.133]
From: Masahiro Yamada <masahiroy@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] riscv: move errata/ and kvm/ builds to arch/riscv/Kbuild
Date: Thu, 12 May 2022 03:44:08 +0900
Message-Id: <20220511184408.2751850-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_114724_232420_6391BE88 
X-CRM114-Status: UNSURE (   7.35  )
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

Commit 909548d6c578 ("riscv: add arch/riscv/Kbuild") intended that
subdirectories in arch/riscv/ would be added in arch/riscv/Kbuild.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/riscv/Kbuild   | 2 ++
 arch/riscv/Makefile | 3 ---
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/Kbuild b/arch/riscv/Kbuild
index fb3397223d52..525ef2482253 100644
--- a/arch/riscv/Kbuild
+++ b/arch/riscv/Kbuild
@@ -2,6 +2,8 @@
 
 obj-y += kernel/ mm/ net/
 obj-$(CONFIG_BUILTIN_DTB) += boot/dts/
+obj-$(CONFIG_RISCV_ERRATA_ALTERNATIVE) += errata/
+obj-$(CONFIG_KVM) += kvm/
 
 # for cleaning
 subdir- += boot
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 7d81102cffd4..fd9fda67c038 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -103,9 +103,6 @@ endif
 
 head-y := arch/riscv/kernel/head.o
 
-core-$(CONFIG_RISCV_ERRATA_ALTERNATIVE) += arch/riscv/errata/
-core-$(CONFIG_KVM) += arch/riscv/kvm/
-
 libs-y += arch/riscv/lib/
 libs-$(CONFIG_EFI_STUB) += $(objtree)/drivers/firmware/efi/libstub/lib.a
 
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
