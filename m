Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3879FC43334
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jun 2022 12:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nlqFej5l3nuhGxOjNgnwbu/e9+u4GQIKXABQW+GqGXU=; b=Hl3sJ0g7HmRMnW
	pSj17iqqpGrc5LE84yKBIGpctkZmT3pGVARgziyycSgLIEUStcrNIKUH50fiQ4jHnCjZGDArh+xpJ
	bby+Hzf6EQTHRjmp49GpjVoKHuut5WkkUE5Dn3kl057IQhAdjkfuGVYNGIAh0T7pv/hzAEg8uRyvo
	DwJgeQtxByNq6bynGhtJebNoRJLjA9cldIHVn2mLr4hSJLgab3wk3O7iUMca8A8KhYGuwezPTzPZn
	rQhUfNfF0I8hZae7aHLdSmZfdV1bw/98Guwmgu6T6tjfG+NjyAT6VplbRgFXdzLpy93vowsEyWGfG
	4JmeThidseh5GzKRLZ9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyuUu-00D0l1-LG; Wed, 08 Jun 2022 12:09:16 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyuUq-00D0jt-Md
	for linux-riscv@lists.infradead.org; Wed, 08 Jun 2022 12:09:14 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1nyuUh-0006dy-Vz; Wed, 08 Jun 2022 14:09:04 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: palmer@dabbelt.com,
	paul.walmsley@sifive.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	wefu@redhat.com,
	guoren@kernel.org,
	cmuellner@linux.com,
	philipp.tomsich@vrull.eu,
	hch@lst.de,
	Heiko Stuebner <heiko@sntech.de>,
	Ron Economos <re@w6rz.net>
Subject: [PATCH] riscv: don't warn for sifive erratas in modules
Date: Wed,  8 Jun 2022 14:08:49 +0200
Message-Id: <20220608120849.1695191-1-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_050912_774214_6D111180 
X-CRM114-Status: GOOD (  13.43  )
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

The SiFive errata code contains code checking applicable erratas
vs. actually applied erratas to suggest missing erratas to the
user when their Kconfig options are not enabled.

In the main kernel image one can be quite sure that all available
erratas appear at least once, so that check will succeed.
On the other hand modules can very well not use any errata-relevant
code, so the newly added module-alternative support may also patch
the module code, but not touch SiFive-specific erratas at all.

So to restore the original behaviour don't warn when patching
modules. This will keep the warning if necessary for the main kernel
image but prevent spurious warnings for modules.

Of course having such a vendor-specific warning may not be needed at
all, as CONFIG_ERRATA_SIFIVE is selected by CONFIG_SOC_SIFIVE and the
individual erratas are default-y so disabling them requires
deliberate action anyway. But for now just restore the old behaviour.

Fixes: a8e910168bba ("riscv: implement module alternatives")
Reported-by: Ron Economos <re@w6rz.net>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/riscv/errata/sifive/errata.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/errata/sifive/errata.c b/arch/riscv/errata/sifive/errata.c
index 672f02b21ce0..1031038423e7 100644
--- a/arch/riscv/errata/sifive/errata.c
+++ b/arch/riscv/errata/sifive/errata.c
@@ -111,6 +111,7 @@ void __init_or_module sifive_errata_patch_func(struct alt_entry *begin,
 			cpu_apply_errata |= tmp;
 		}
 	}
-	if (cpu_apply_errata != cpu_req_errata)
+	if (stage != RISCV_ALTERNATIVES_MODULE &&
+	    cpu_apply_errata != cpu_req_errata)
 		warn_miss_errata(cpu_req_errata - cpu_apply_errata);
 }
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
