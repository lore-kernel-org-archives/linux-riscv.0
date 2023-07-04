Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D433EB64D9
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jul 2023 16:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dF+qz6lx+VerPXR2m47nj8xwMHawnWV51ekYOQgjkHU=; b=eRP1HXcQhlZ16T
	b7HAU96B6NgD4KHD7A8iXFY7cCfhuRMscAKP/4qgjVowXlaxNv96QGycp5t/cMhAT//xob3yuP1qk
	cMbxi+RY99EaRaUcPjlAS/qHhYLC623e0BGDNlK20FnlGiFzBW8sju6eGeLqMMpJXaO3F0xVVhSqd
	jyKIaN1K87L8EYofHWThozvLiltSYjOFJM0VsKjSr/1jl2uPQPAaJu0pVEEdbxVRsCUP5lefLHPbu
	YyA03tzKbe83PhfIH+yJz0iI6WLSXtpIkBgh1Za+Aa0THBqJXfo2+CphSN5yfFratgfmsmDb6f6gc
	d74lCbS24/Tzz53CWmQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGj3u-00DqNw-1d;
	Tue, 04 Jul 2023 16:39:34 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGj3r-00DqLi-1U
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jul 2023 16:39:33 +0000
Received: from i53875a33.versanet.de ([83.135.90.51] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1qGj3k-0005wg-9h; Tue, 04 Jul 2023 18:39:24 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: [PATCH 1/2] mailmap: Update manpage link
Date: Tue,  4 Jul 2023 18:39:18 +0200
Message-Id: <20230704163919.1136784-2-heiko@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230704163919.1136784-1-heiko@sntech.de>
References: <20230704163919.1136784-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_093931_497683_B2F3B4C5 
X-CRM114-Status: GOOD (  10.60  )
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

From: Heiko Stuebner <heiko.stuebner@vrull.eu>

On recent systems the git-shortlog manpage only tells people to
    See gitmailmap(5)

So instead of sending people on a scavenger hunt, put that info into the
header directly. Though keep the old reference around for older systems.

Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
---
 .mailmap | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/.mailmap b/.mailmap
index 4a9d87472ba8..5788fe4371c1 100644
--- a/.mailmap
+++ b/.mailmap
@@ -5,7 +5,8 @@
 # same person appearing not to be so or badly displayed. Also allows for
 # old email addresses to map to new email addresses.
 #
-# For format details, see "MAPPING AUTHORS" in "man git-shortlog".
+# For format details, see "man gitmailmap" or "MAPPING AUTHORS" in
+# "man git-shortlog" on older systems.
 #
 # Please keep this list dictionary sorted.
 #
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
