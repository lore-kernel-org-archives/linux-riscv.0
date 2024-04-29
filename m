Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B468C4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Apr 2024 15:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VDk4j2/2HmOaDWefMd/QCKqkSRmxz2Om2PktT9QHgl4=; b=a7MFxPWlCSQj1g
	Ybnz+xfSf2TPXFwVsaJkVTDxPvhVzcj/yqO2yUtsYNDxPflTlB8MNwWt2q4+FIVAAnH0UZcUaOEvA
	rWMf+j8vbog9NEBh/KIV7OIWP2djHXYRjT8YX8a7nFkAHE36HyzWjQy0smMssse/Y+8zAxWVZcgIV
	Xo9qveD5JrVtA+elQ3jz3yk/qbG5XjL1pXnhqMPsb2Kraqt9dhoq7iQzxAndUaIsLeXJS5QItFRpV
	/qNP3ZDu/JDxsZv4nvkv9RYFmMtPPJ8H+hatKk48lz8CVm3oPF9PDX8Sd+vrsshlHnLJQ4pWvhRXV
	xNvUe8NVshtS2KGjfVMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Sev-00000003Jj2-1V1A;
	Mon, 29 Apr 2024 15:11:13 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Sc6-00000003HXa-33mI
	for linux-riscv@lists.infradead.org;
	Mon, 29 Apr 2024 15:08:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9DA48CE0B6A;
	Mon, 29 Apr 2024 15:08:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26533C113CD;
	Mon, 29 Apr 2024 15:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714403292;
	bh=U0cAz+c9sTGbDIN3OBVNFjWl2jR+Tx695VgOjeNXMmQ=;
	h=From:To:Cc:Subject:Date:From;
	b=Atfc3NfzTJ0OgbfSIei9mdm6zGOQ0nWCB3W3v7O49/nIzWMtgDe6S+rNhQcsULzI+
	 hsNWHp0/7gKUOwqBW55Qg8tTl8Ueu7xCCD2o8FX/AU5N29e0J1uEp6DDjhVRYbJs3Z
	 EdQH94mjgh4c45zOtLcN9UH6zzvGC3s9DTGeusD9P16wyERTHdZ/nfxmhEikYg/e55
	 bPier0zvkjSbn5Y+Ysef1f/1zjuA6D3gtncGaTpz1waZ4VXEm5aqg89qL8UigToxGC
	 IrR/DqsXI0f+b7xc6pCIdEvGTWzDfTA/xccF3Hz+GKWs1jTlQHxjqm9g74Oyz+FSLT
	 NaS2CeOdGvP2g==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH] kbuild: simplify generic vdso installation code
Date: Tue, 30 Apr 2024 00:07:54 +0900
Message-Id: <20240429150754.3178262-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_080818_970461_20C6FD35 
X-CRM114-Status: UNSURE (   6.32  )
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

With commit 4b0bf9a01270 ("riscv: compat_vdso: install compat_vdso.so.dbg
to /lib/modules/*/vdso/") applied, all debug VDSO files are installed in
$(MODLIB)/vdso/.

Simplify the installation rule.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.vdsoinst | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/scripts/Makefile.vdsoinst b/scripts/Makefile.vdsoinst
index c477d17b0aa5..bf72880c50d0 100644
--- a/scripts/Makefile.vdsoinst
+++ b/scripts/Makefile.vdsoinst
@@ -13,16 +13,15 @@ install-dir := $(MODLIB)/vdso
 
 define gen_install_rules
 
-src := $$(firstword $$(subst :,$(space),$(1)))
-dest := $(install-dir)/$$(or $$(word 2,$$(subst :,$(space),$(1))),$$(patsubst %.dbg,%,$$(notdir $(1))))
+dest := $(install-dir)/$$(patsubst %.dbg,%,$$(notdir $(1)))
 
 __default: $$(dest)
-$$(dest): $$(src) FORCE
+$$(dest): $(1) FORCE
 	$$(call cmd,install)
 
 # Some architectures create .build-id symlinks
 ifneq ($(filter arm sparc x86, $(SRCARCH)),)
-link := $(install-dir)/.build-id/$$(shell $(READELF) -n $$(src) | sed -n 's@^.*Build ID: \(..\)\(.*\)@\1/\2@p').debug
+link := $(install-dir)/.build-id/$$(shell $(READELF) -n $(1) | sed -n 's@^.*Build ID: \(..\)\(.*\)@\1/\2@p').debug
 
 __default: $$(link)
 $$(link): $$(dest) FORCE
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
