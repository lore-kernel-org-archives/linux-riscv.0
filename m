Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1A56C5B572
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Aug 2026 16:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=g4muqUgsU00adwUhGNeLESEe2Fi9IRdq4Dfifu9L+0g=; b=Zw+jM1+u37ob/3
	IX+WO23sTBVSPtjQaEMRxdcWrj6aTBe3UHJQZ71fvGGZ9NsNTjEQeat15WM3iWET9hhCbvctf8oyF
	Ddskbt7AOtWteuZs1hmI4GboGmkwxmg/XkH6YQqF1CQYwYCMabSzHwUpKsoWgkJatHot+aSww6+Od
	nCteUXmwiTzeRXAAqkY4UXH0ojahW/G0+zDH70u6AHwEyg1WxzAU1LB6CrGP42oJO+0npgcjGusiw
	wViLH7/B93MNB7shZ+emGY3XnIsVNXMTH1ByjnNItnF5ZK8jR9hs2j0rKxmASHpTFP+rngZQH4L4Q
	g+ufN5Yvw2GqeD9XsqwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwioR-0000000A99e-28sG;
	Wed, 19 Aug 2026 16:06:47 +0000
Received: from forward103b.mail.yandex.net ([178.154.239.150])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwioL-0000000A947-3ouW
	for linux-riscv@lists.infradead.org;
	Wed, 19 Aug 2026 16:06:46 +0000
Received: from mail-nwsmtp-smtp-production-main-70.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-70.sas.yp-c.yandex.net [IPv6:2a02:6b8:c11:69d:0:640:32f2:0])
	by forward103b.mail.yandex.net (postfix) with ESMTPS id 71E6FC0061;
	Wed, 19 Aug 2026 19:06:32 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-70.sas.yp-c.yandex.net (smtp) with ESMTPSA id U6Zpsm0f6Gk0-hkZapgoD;
	Wed, 19 Aug 2026 19:06:31 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1787155591; bh=BY1MDzH4R6UmAqJ8LxjKOmy081SaWDy1zdaFzWSk3Cg=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=rBaArKiA+q9PnfidxQznCl+G7vSAF1R6JMXkGT5q55s1yWX9UqPhitvwR5xYaxiVb
	 nd3TX3mU8ia/8rCbWVOoE7tEepDGK8tsDxtAtrMD2zabv/dKMzs4+NLUldImntT/mT
	 wg70z0AeM4A8bOowYvFVDrnj3JVWcslHm4TJOOAU=
Authentication-Results: mail-nwsmtp-smtp-production-main-70.sas.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: linux-riscv@lists.infradead.org
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	lbert Ou <aou@eecs.berkeley.edu>,
	Deepak Gupta <debug@rivosinc.com>,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH] riscv: use string helper in setup_global_riscv_enable()
Date: Wed, 19 Aug 2026 19:05:46 +0300
Message-ID: <20260819160546.3219942-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_090642_488203_77B14B55 
X-CRM114-Status: UNSURE (   8.19  )
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

Prefer the convenient string choice 'str_disabled_enabled()'
helper over hardcoded strings in 'setup_global_riscv_enable()'.

Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
 arch/riscv/kernel/usercfi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/usercfi.c b/arch/riscv/kernel/usercfi.c
index 5a7113d69bad..91eef6218d85 100644
--- a/arch/riscv/kernel/usercfi.c
+++ b/arch/riscv/kernel/usercfi.c
@@ -525,9 +525,8 @@ static int __init setup_global_riscv_enable(char *str)
 
 	if (riscv_nousercfi)
 		pr_info("RISC-V user CFI disabled via cmdline - shadow stack status : %s, landing pad status : %s\n",
-			(riscv_nousercfi & CMDLINE_DISABLE_RISCV_USERCFI_BCFI) ? "disabled" :
-			"enabled", (riscv_nousercfi & CMDLINE_DISABLE_RISCV_USERCFI_FCFI) ?
-			"disabled" : "enabled");
+			str_disabled_enabled(riscv_nousercfi & CMDLINE_DISABLE_RISCV_USERCFI_BCFI),
+			str_disabled_enabled(riscv_nousercfi & CMDLINE_DISABLE_RISCV_USERCFI_FCFI));
 
 	return 1;
 }
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
