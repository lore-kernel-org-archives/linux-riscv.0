Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D145ECCF2C4
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Oct 2026 15:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3cFyFDAUlSS9rW2y9LXIn8IZbG0oxXRkBTSvT1pZ25k=; b=p947Xt9uY4nFd8
	CfsHgvFrbNX3+AHLKP2hEXm6/lxqZrXCBZThcYK7uhBN47ZEcx6Qs2DStEhXjfNI7qVPP6Vzjhznb
	BvPLyyz7ySyx+UCVvVOcB89xt9TKKx4/DdMLyFw5Fb3lR6zkksNBYwHqzUIHmmf1fBocyD/5afQPO
	HQtZ7R1cG2C6qS6aonbiRt688jTFU0VLDGKVYP3vGvJArMUO8VBvWpyfVI6LA4H3TK/zG812jxc/6
	+uMORhKrohgiZWH4E9NXFTO10s8vEWfez2cumdwnaVO3OT9Ol7GzWh28bJ0+SvYESylzsns7MBQrn
	ZKJFRv15jdfR+P2OoPog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI69d-00000004sFT-4AyD;
	Sat, 17 Oct 2026 15:17:01 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI69b-00000004sF6-06ev
	for linux-riscv@lists.infradead.org;
	Sat, 17 Oct 2026 15:17:00 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a1d293b293so4502015e9.2
        for <linux-riscv@lists.infradead.org>; Sat, 17 Oct 2026 08:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792250216; x=1792855016; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6ljn3PVnqnuWEit2AfdB+vWFxoLLcPbdfDG1xBL+P2g=;
        b=JIx+GHSO/Jwxx9kWJUJwQwK94dbtCnIZrKHOgPe2F9Y9ZnDGxBwr7FrbfnrKR0tzWe
         LDBRWxdZSx0m7cykqwCBFLqtx2RehFRIaSp9ipLCMV/yjTXehABkoTlgImblK5h6SbTb
         vo+6kpRHXknM/IqVFrj2RNVA3SrV0ViSn6MhKYMgdrvwET18gEzhVKQfFfnI7CaOAhqY
         XMQP+UVzXoAJqyAbpUUf9F7vIK6p60V372FkYbHgHdiSnhy3rv352HmyLOow9WYA1PtE
         ZLyXAnAWo/0DYh7sHAIXjpItKmVXOcVdB3+P+YtY1UMyiUsQJC4rIwfL/+tWDEP8gHBI
         9nFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792250216; x=1792855016;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6ljn3PVnqnuWEit2AfdB+vWFxoLLcPbdfDG1xBL+P2g=;
        b=KqaMhbJJ87eGDrCYpPVjFm+Dcp3JhITtmndHR9sW9Wa6/K4e/Jzs4CzlaDgDgg4cNq
         Q1B9esv3tmj/SW8Yo4C3sJG8JK06ZyiOWglqYSU7gXsOIaT/64ZdxD9qWzQ5tLZ3jLdq
         yU+QMil6nhA/6xjlCkBFEUuNOVVPi5ncYlr6Ti7fXnFBU6jDZQu4m61Dmm86SbIb9WL2
         MGIO7jKx09D8R4YHJ8NkcS2+pQBbpel46SI8hh4Ha7pBcac9mHQKZNcRw5zXEqOrv9YZ
         eNgdRXZvrlL6w5RKwdEdpjX5zgo+yAZYo8U7Xff9VpXvozfWlg9nTUwXf1xxib31pkVA
         +siA==
X-Forwarded-Encrypted: i=1; AKwUvByu27BXUB5UlAK8pAgc4A5FKuzmIsfPRyAktio2+Myf5dnVba+xpz2ET5mRO+x0v53+aCut+UY0kG4Y/Q==@lists.infradead.org
X-Gm-Message-State: AFq9FYLcEfvMd2fQq7m18B3RfqUzqJmI3v30OBnnWSSbnZOv/vnbUZ3B
	HdF9CozL4lyLABjW6ohHSDqBdULCGq34TVX0B16iHsORdT7WrCM4u6H9
X-Gm-Gg: AYBFou1aCmrdgJkihRegJ8ZTNd01liBlRPsIj7z3lfiB2Ddg+cHDowvPIWtQUkSKUQ6
	x7j3Ojo+tPu5FN/HBY74wdy/8QrU3PTwnBGxmoVS/fpjve5bVGJiifj8z5i7PP7TIlYxvlynsUi
	4R5CcWGOgBSRNkcGPeciS5+v0/nSpVevkn9ijzm9r7ReAPCB1m+6COhIJVVYRvj51EmyH5JQvEe
	wwRSkK1kvFpGslwWWVprhEpyRa8Xkflaut8t8Lf3f7KaG6B3oQteNkCpv5IHRxp/KGEPIOIAyOH
	EoOf1JPqOSIwoWdVYfwA4FBCJZbD64lRjsBnme9u5/6WOki/opJBiwHm3DZ5S42x1ccUcAy8Kro
	UlhqxATPSOVRnYDkgEsi0Ko7+uO3NPjyLjU2k5vSEalMub167RyLdh000BCD24h2NA+/gCTE6ZL
	pCmBtMAwRzOTzN3RyX5NSir5jjEDTlQCTJ8GO+0k6FJr/DpnTuddqN86q8Nzn46Vx1JsoJLoT8q
	kxcXotrCBaS7/TSW6Ci0EU=
X-Received: by 2002:a05:600c:1394:b0:4a1:d492:1604 with SMTP id 5b1f17b1804b1-4a1d75f2524mr63429965e9.11.1792250216194;
        Sat, 17 Oct 2026 08:16:56 -0700 (PDT)
Received: from LAPTOP-AVI.taile24b5.ts.net ([2a06:c701:4778:c500:c792:3e73:d47c:feff])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd9b35a6sm219841735e9.6.2026.10.17.08.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 08:16:54 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Conor Dooley <conor@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH v3] cache: sifive_ccache: propagate IRQ count errors
Date: Sat, 17 Oct 2026 18:16:51 +0300
Message-ID: <20261017151651.1138811-1-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_081659_083728_7828FAB6 
X-CRM114-Status: GOOD (  12.41  )
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

platform_irq_count() returns -EPROBE_DEFER when the
interrupt provider is not ready, but
sifive_ccache_probe() only checks for a zero count.

-EPROBE_DEFER seems to be the only negative return
code possible here (currently).

A negative count skips the IRQ registration loop and
allows the probe to return success without requesting
a deferred retry.

Return negative IRQ counts so the driver is reprobed
when the interrupt provider becomes available.

Fixes: c90847bcbfb6 ("cache: sifive_ccache: Partially convert to a platform driver")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
Changes in v3:
- align the dev_err_probe() argument as suggested by Jonathan Cameron

v2: https://lore.kernel.org/r/20261015084502.3061706-1-thnkslprpt@gmail.com/

 drivers/cache/sifive_ccache.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/cache/sifive_ccache.c b/drivers/cache/sifive_ccache.c
index 2acb8bdf06d52..f64ab6aab651a 100644
--- a/drivers/cache/sifive_ccache.c
+++ b/drivers/cache/sifive_ccache.c
@@ -262,8 +262,9 @@ static int sifive_ccache_probe(struct platform_device *pdev)
 	quirks = (unsigned long)device_get_match_data(dev);
 
 	intr_num = platform_irq_count(pdev);
-	if (!intr_num)
-		return dev_err_probe(dev, -ENODEV, "No interrupts property\n");
+	if (intr_num <= 0)
+		return dev_err_probe(dev, intr_num ?: -ENODEV,
+				     "No interrupts property\n");
 
 	for (int i = 0; i < intr_num; i++) {
 		if (i == DATA_UNCORR && (quirks & QUIRK_BROKEN_DATA_UNCORR))

base-commit: 0fcb05b72344f40806cbe810de8872f1698bf053
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
