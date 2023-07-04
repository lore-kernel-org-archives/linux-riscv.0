Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B479EB64DA
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jul 2023 16:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RC1YLPttUDQZA7tU9QKc3YoOq9ULxzMQuKat8Dsa2AA=; b=hnnJf3JT/f+xcu
	u/o3GCvgyvx+U8eli547onUr+Ed4qU70jBQQlD84cKLJwaxFADhc575FYC8/ZizKe0vmq7Fte7C2u
	wjI1+wCDARmG4zk1YI2lsWQ9h2DLjo51GS1Pr20kAEb71kuKoe6Al9CS6zEeFopPw2cv9XpdzBjAG
	G3pBS8Tz2cTp00Wv+I3cVC9jj5LN3ehLECumu4QMA7VqtKpt7N882HH1QwNrF3FWRqAtWH6jGL2Ol
	/fGLtehNdT47yPntxlr/AYUnhjUHdCKIDgrfIZO0bcac4vnzIRKFLz7Lz3JBhtK2k/KCqAaXCpbIb
	UAd9unCqz4LkoDXduDJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGj3t-00DqNf-33;
	Tue, 04 Jul 2023 16:39:33 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGj3r-00DqLh-1U
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jul 2023 16:39:32 +0000
Received: from i53875a33.versanet.de ([83.135.90.51] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1qGj3k-0005wg-08; Tue, 04 Jul 2023 18:39:24 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: [PATCH 0/2] Update .mailmap for my work address and fix manpage
Date: Tue,  4 Jul 2023 18:39:17 +0200
Message-Id: <20230704163919.1136784-1-heiko@sntech.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_093931_494573_B3978F3F 
X-CRM114-Status: UNSURE (   8.31  )
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

From: Heiko Stuebner <heiko.stuebner@vrull.eu>

While updating mailmap for the going-away address, I also found that
on current systems the manpage linked from the header comment changed.

And in fact it looks like the git mailmap feature got its own manpage.


Heiko Stuebner (2):
  mailmap: Update manpage link
  mailmap: add entries for Heiko Stuebner

 .mailmap | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
