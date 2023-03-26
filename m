Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDDE1C6FD1C
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Mar 2023 18:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=t98RQZnEiSwdSrilWwDuwNUnDNMoIpdmlFnHwXRUvsY=; b=x4Hl6vGRxp/M5j
	T0lS9+tlE43o2bNqM5ekp+p/s38Sjz7THjAA0suNcrKKo0zFeGkKIqG4LIwH6E6mXD3Whd1Pn6uHl
	brpxLeQ05rpRBJoO/Vfzdu04g6+LC0H6nyBHUlzy48L6EspTeKW1uIy/ONPp1+CuhzW2Ux+fwGauD
	pXX3UO/fGrRgbxIcz7pJ7g1Mqo0yt9CLOsspgGEGi1/MOsJqcMracKuxRE+Y3q4+Dx8Waoq3oRF8i
	YOyYM1a3WBeuygfbCs86IvsplVyPeQELU7/tt98vwXfN8hOUdiwPXmBT/Jjwh652FBSbJP5QPG3YC
	GL7edHZFDsivhiCrs0JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgV1c-008ziT-1J;
	Sun, 26 Mar 2023 18:23:28 +0000
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgV1Y-008zga-1K
	for linux-riscv@lists.infradead.org;
	Sun, 26 Mar 2023 18:23:27 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 126F15C00D5;
	Sun, 26 Mar 2023 14:23:20 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Sun, 26 Mar 2023 14:23:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alyssa.is; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1679855000; x=1679941400; bh=M9VSG9c5T3
	1aOotkBu3C2E0xwoGSkwmuq4Ti2Ve1tEI=; b=orWuq3xj1DQJl0roms82XWSlII
	t1c1S/Ye9/R+L0SYSrmZs5se42zKmLvIl0BK+jt8RxsvEG5B2vwpvoyq7RHQNwRP
	7nR8Quwq1qpKlDpjZXkSWNSwYv6KAiUKPAo9MYnUWvFl6XvwIG3kvlL5ZTj2T6Xq
	k4Nq0Q+MOjdaQTXJ1n7qz1HSjZvTqGjqE9bfPy1szFq/i1PmJar7VLmqa/XXBBYb
	r2gjHHXCNC3C7VvgHg7yA+1ekXC/gf6Pl+mQMoQSCcWZGqUT42/eOY3bohLxGpLE
	L0LCb6rpLborL+uJd6ydVFYA2252LOMLluikix5FsakrlaCb+RGoAAlMgZqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1679855000; x=1679941400; bh=M9VSG9c5T31aO
	otkBu3C2E0xwoGSkwmuq4Ti2Ve1tEI=; b=E1ySVSOLCRpuJZeZSzSlbiX1sACyt
	MdkKZGKgEXBxMne9wvX8u1ODpNwGPkkvt/Y4qU2DMe/xndPyVVkqC33rVfhhvI4X
	tjUyIyltAyxxhiyHfb4GEW71zYQ2W/mMR8vWlfdGXP8waIoHsEbKCuSNAAVLoNAH
	F3PD9XXrxjUXxeK8aGuUUSvGZdCN1J2KRLNSbRVyws0MuRKkAPw/L/WIqLxD+oN9
	dIpYqZD090Qbgzx6PrFoS9eYldGGsJECst6cmcp5ksJiZAI7i1AfSUS3/w0Z30Uj
	bAruyuOQPVtlUsI2L231A0LbaUEiDe/fgyyiERGtQGFNOQzlbcpVQtNFg==
X-ME-Sender: <xms:l40gZFg7B5UjJR6dNlVCQ6J8nkicnFzZjMX9eTixU38lS74SpxvRYQ>
    <xme:l40gZKBwe0BaP1iGsOkX-IPJYpYvsdNuVoctkMObon87KSqFApnGqj4a_aQSjrZVh
    1cPDO2UVHdDcp8f4Q>
X-ME-Received: <xmr:l40gZFEMn-ZKQDX-4XaQUwzxAlwIqkNTigGmJYYffX6B6zd4JMvWnkUi-RcVbenoxFJh81dD_LXCRbUq4RJfOxvMDvmyCY0Kog>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdehtddguddvhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeetlhihshhs
    rgcutfhoshhsuceohhhisegrlhihshhsrgdrihhsqeenucggtffrrghtthgvrhhnpeehke
    fgtdevtedtkeduudeguefgudejheeugfelgeettdfhffduhfehudfhudeuhfenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehhihesrghlhihssh
    grrdhish
X-ME-Proxy: <xmx:l40gZKRwWPSWbSlLt5dhyr0CaylzZI70BVU9ivslFitOmZetZCBn9g>
    <xmx:l40gZCwST8pEHX7K-SiTUacztM63AhI1OyKh63MIJ_2HhIooaQOCLg>
    <xmx:l40gZA7hdJdcEQ57udqoCya1Uah6Jh2omM-ZIsFpJHjlYcFNPJMHsA>
    <xmx:mI0gZE5TXdcl9GwN5Fi-Mbv9pqrbLjaTlBbnjaB8EeX1wjfsgvaYQQ>
Feedback-ID: i12284293:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 26 Mar 2023 14:23:19 -0400 (EDT)
Received: by x220.qyliss.net (Postfix, from userid 1000)
	id 494C81FD7; Sun, 26 Mar 2023 18:23:17 +0000 (UTC)
From: Alyssa Ross <hi@alyssa.is>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nick Cao <nickcao@nichi.co>,
	linux-kbuild@vger.kernel.org,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	Tom Rix <trix@redhat.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alyssa Ross <hi@alyssa.is>,
	stable@vger.kernel.org
Subject: [PATCH v2] purgatory: fix disabling debug info
Date: Sun, 26 Mar 2023 18:21:21 +0000
Message-Id: <20230326182120.194541-1-hi@alyssa.is>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230326_112325_734121_9B403341 
X-CRM114-Status: UNSURE (   7.86  )
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

Since 32ef9e5054ec, -Wa,-gdwarf-2 is no longer used in KBUILD_AFLAGS.
Instead, it includes -g, the appropriate -gdwarf-* flag, and also the
-Wa versions of both of those if building with Clang and GNU as.  As a
result, debug info was being generated for the purgatory objects, even
though the intention was that it not be.

Fixes: 32ef9e5054ec ("Makefile.debug: re-enable debug info for .S files")
Signed-off-by: Alyssa Ross <hi@alyssa.is>
Cc: stable@vger.kernel.org
---

Difference from v2: replace each AFLAGS_REMOVE_* assignment with a
single aflags-remove-y line, and use foreach to add the -Wa versions,
as suggested by Masahiro Yamada.

 arch/riscv/purgatory/Makefile | 7 +------
 arch/x86/purgatory/Makefile   | 3 +--
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/purgatory/Makefile b/arch/riscv/purgatory/Makefile
index d16bf715a586..5730797a6b40 100644
--- a/arch/riscv/purgatory/Makefile
+++ b/arch/riscv/purgatory/Makefile
@@ -84,12 +84,7 @@ CFLAGS_string.o			+= $(PURGATORY_CFLAGS)
 CFLAGS_REMOVE_ctype.o		+= $(PURGATORY_CFLAGS_REMOVE)
 CFLAGS_ctype.o			+= $(PURGATORY_CFLAGS)
 
-AFLAGS_REMOVE_entry.o		+= -Wa,-gdwarf-2
-AFLAGS_REMOVE_memcpy.o		+= -Wa,-gdwarf-2
-AFLAGS_REMOVE_memset.o		+= -Wa,-gdwarf-2
-AFLAGS_REMOVE_strcmp.o		+= -Wa,-gdwarf-2
-AFLAGS_REMOVE_strlen.o		+= -Wa,-gdwarf-2
-AFLAGS_REMOVE_strncmp.o		+= -Wa,-gdwarf-2
+asflags-remove-y		+= $(foreach x, -g -gdwarf-4 -gdwarf-5, $(x) -Wa,$(x))
 
 $(obj)/purgatory.ro: $(PURGATORY_OBJS) FORCE
 		$(call if_changed,ld)
diff --git a/arch/x86/purgatory/Makefile b/arch/x86/purgatory/Makefile
index 17f09dc26381..82fec66d46d2 100644
--- a/arch/x86/purgatory/Makefile
+++ b/arch/x86/purgatory/Makefile
@@ -69,8 +69,7 @@ CFLAGS_sha256.o			+= $(PURGATORY_CFLAGS)
 CFLAGS_REMOVE_string.o		+= $(PURGATORY_CFLAGS_REMOVE)
 CFLAGS_string.o			+= $(PURGATORY_CFLAGS)
 
-AFLAGS_REMOVE_setup-x86_$(BITS).o	+= -Wa,-gdwarf-2
-AFLAGS_REMOVE_entry64.o			+= -Wa,-gdwarf-2
+asflags-remove-y		+= $(foreach x, -g -gdwarf-4 -gdwarf-5, $(x) -Wa,$(x))
 
 $(obj)/purgatory.ro: $(PURGATORY_OBJS) FORCE
 		$(call if_changed,ld)

base-commit: da8e7da11e4ba758caf4c149cc8d8cd555aefe5f
-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
