Return-Path: <SRS0=H4U1=MV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB2E5C4320E
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jul 2021 14:23:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8254F60F4A
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jul 2021 14:23:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8254F60F4A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3A05F66bKTlSsOMvp1thfc/fbAVrerYq14DSvRebzAc=; b=OL9VHh7O6VK7zd
	a3KqiGftztypluFVU/9OBN+w1dkwoNMq3zO7cAtXQHxOmgLNEwkFhmsTKWQuYCzh9gw05eFjBTFWh
	R/x620LMMgEZMc21rKftZ9WQdyC0Q2oUxyRUZZwll2F816qBrtPG4B3kIMi8wecI1meFfXa2Cke6h
	AemCDd6y1f6yQpAhpx53S00Aw6IBrd/DEXsJjKCyiW3jZuDPEk2qFHWgpycanlpOXRd0Z09dQBkrq
	19pekbbUUdYyqUa2L7EXRQvxGAyFczQVQbFNvYnyRpUXXctdbRXf9+pCmb4rR5qcEP+NcskCgPys/
	1pIxq/1yFihNQlW8VWGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m96vy-004Vjd-3Z; Thu, 29 Jul 2021 14:22:50 +0000
Received: from conuserg-11.nifty.com ([210.131.2.78])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m96vf-004VhT-Q1
 for linux-riscv@lists.infradead.org; Thu, 29 Jul 2021 14:22:33 +0000
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp
 [133.32.232.101]) (authenticated)
 by conuserg-11.nifty.com with ESMTP id 16TELnM4012048;
 Thu, 29 Jul 2021 23:21:49 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 16TELnM4012048
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1627568510;
 bh=gIER6M/yetFIr/zY03y/J3RNp299mi6jgg2VO7pHBG8=;
 h=From:To:Cc:Subject:Date:From;
 b=OIPGhlSxzmEIQ/XRyK6pMZbkWX9BN+XwZhARCinWDPyLS90GApKnXNjHdoq6BF/zj
 I+f6oSr0ddA3qlUD/ACerbzjWRKhW0cCWpfJ4NP98cj47TUqEUx0dxxWeY9XAOGtl8
 6KMI7wxFlY0mFJDZw0nyYHsKaLdsmrrKVOJTdTwoM1AVDOtlKx+gOerVrJ6a0XQ5Y9
 PSyntHQnVqeQIFpgClnwVAFg/JcYK2oggCSuxSjg+XSmGtiIm1ATmbkPx5VbyAzIvq
 hVbzJ0mTwVUto4KmfIjxtq/55918dttdzwc6bdeV2kL9G2HOuGSxSMqPp6i9EsIWli
 cWulz2pQqrUsA==
X-Nifty-SrcIP: [133.32.232.101]
From: Masahiro Yamada <masahiroy@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Tobias Klauser <tklauser@distanz.ch>,
 Vitaly Wool <vitaly.wool@konsulko.com>, linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: move the (z)install rules to arch/riscv/Makefile
Date: Thu, 29 Jul 2021 23:21:47 +0900
Message-Id: <20210729142147.445593-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210729_072232_120361_AE9BA33D 
X-CRM114-Status: UNSURE (   7.43  )
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

Currently, the (z)install targets in arch/riscv/Makefile descend into
arch/riscv/boot/Makefile to invoke the shell script, but there is no
good reason to do so.

arch/riscv/Makefile can run the shell script directly.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/riscv/Makefile      | 7 +++++--
 arch/riscv/boot/Makefile | 8 --------
 2 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index bc74afdbf31e..3c437fb09a07 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -126,8 +126,11 @@ $(BOOT_TARGETS): vmlinux
 Image.%: Image
 	$(Q)$(MAKE) $(build)=$(boot) $(boot)/$@
 
-zinstall install:
-	$(Q)$(MAKE) $(build)=$(boot) $@
+install: install-image = Image
+zinstall: install-image = Image.gz
+install zinstall:
+	$(CONFIG_SHELL) $(srctree)/$(boot)/install.sh $(KERNELRELEASE) \
+	$(boot)/$(install-image) System.map "$(INSTALL_PATH)"
 
 archclean:
 	$(Q)$(MAKE) $(clean)=$(boot)
diff --git a/arch/riscv/boot/Makefile b/arch/riscv/boot/Makefile
index 6bf299f70c27..becd0621071c 100644
--- a/arch/riscv/boot/Makefile
+++ b/arch/riscv/boot/Makefile
@@ -58,11 +58,3 @@ $(obj)/Image.lzo: $(obj)/Image FORCE
 
 $(obj)/loader.bin: $(obj)/loader FORCE
 	$(call if_changed,objcopy)
-
-install:
-	$(CONFIG_SHELL) $(srctree)/$(src)/install.sh $(KERNELRELEASE) \
-	$(obj)/Image System.map "$(INSTALL_PATH)"
-
-zinstall:
-	$(CONFIG_SHELL) $(srctree)/$(src)/install.sh $(KERNELRELEASE) \
-	$(obj)/Image.gz System.map "$(INSTALL_PATH)"
-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
