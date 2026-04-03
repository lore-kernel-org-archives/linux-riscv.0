Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27564E7E36C
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Apr 2026 10:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CA1blhYsMG2A3b0z8ypjAqD8YsiDzUNmYLWAGwte0DA=; b=g4+TjIlhg7j74+
	LrbdiOuQvD/qfE1r+CxcV59GPI/rQcijI2c27eg7XrdUD+hXYJQGKTi/g/8xq/kaYiteYmINF1Zyq
	Le5+nEy3DOeleiIVuKfXCWugYT/PbX2ckhSD+PhpckrSvn0/O+iGHyIKeiUAx27uz1Tt7dHIbzAVR
	ylEAtFygpnQS6wE+NhHP3358t2pXHx6e+T3k9shkSijLc0c6d5V3EPHXu/Jyc9KeueTh0a7g9GBKM
	RByvtuyoluT0YDZMLhLJ1vdZim+41J14fLK16LoFeT/R3HIoU84nq67tZs98LeUCLR4ChsDfmcJum
	gnJRyZ0xtOyAcI5Zkijw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8bqh-00000001tcI-0CdJ;
	Fri, 03 Apr 2026 10:33:59 +0000
Received: from forward103b.mail.yandex.net ([178.154.239.150])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8bqZ-00000001tZS-35Vj
	for linux-riscv@lists.infradead.org;
	Fri, 03 Apr 2026 10:33:56 +0000
Received: from mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:489d:0:640:baa6:0])
	by forward103b.mail.yandex.net (Yandex) with ESMTPS id A3CFEC009C;
	Fri, 03 Apr 2026 13:33:45 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id eXaKrQ9QICg0-xEmDvXXS;
	Fri, 03 Apr 2026 13:33:45 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1775212425; bh=peXAvbHHMNdi+4DDTZjijkzFy7TF4SEQhEppGxAPuVY=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=pmIjvSZ5fDwqiioCyGst5BMtp78q/CNGIOMkJzW2jtE5KNtu1f24IEmq8Y4xgWEMp
	 TR3BhHNDRFGOuJIvlX306k0WYpGsiNPbsd6YTvMqFwVn7khxTVG2KmTnkrbTlsHvJD
	 PHd8lscoDa9+6PGVnBQdYYCwFSebZxlUP19fsFsE=
Authentication-Results: mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	David Laight <david.laight.linux@gmail.com>,
	Kees Cook <kees@kernel.org>,
	"Darrick J . Wong" <djwong@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-riscv@lists.infradead.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH v9 2/6] lib: fix memparse() to handle overflow
Date: Fri,  3 Apr 2026 13:33:34 +0300
Message-ID: <20260403103338.1122415-3-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260403103338.1122415-1-dmantipov@yandex.ru>
References: <20260403103338.1122415-1-dmantipov@yandex.ru>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_033352_055642_50C3197C 
X-CRM114-Status: GOOD (  12.38  )
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

Since '_parse_integer_limit()' (and so 'simple_strtoull()') is now
capable to handle overflow, adjust 'memparse()' to handle overflow
(denoted by ULLONG_MAX) returned from 'simple_strtoull()'. Also
use 'check_shl_overflow()' to catch an overflow possibly caused
by processing size suffix and denote it with ULLONG_MAX as well.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
v9: bump version to match the series
v8: do not use temporary in check_shl_overflow()
v7: do not double-adjust endptr and drop
    redundant check against ULLONG_MAX
v6: handle valid-suffix-only string like "k"
    as unrecognized, minor style adjustments
v5: initial version to join the series
---
 lib/cmdline.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/lib/cmdline.c b/lib/cmdline.c
index 90ed997d9570..f6e4b113ca9f 100644
--- a/lib/cmdline.c
+++ b/lib/cmdline.c
@@ -150,39 +150,46 @@ EXPORT_SYMBOL(get_options);
 unsigned long long memparse(const char *ptr, char **retptr)
 {
 	char *endptr;	/* local pointer to end of parsed string */
-
 	unsigned long long ret = simple_strtoull(ptr, &endptr, 0);
+	unsigned int shl = 0;
 
+	/* Consume valid suffix even in case of overflow. */
 	switch (*endptr) {
 	case 'E':
 	case 'e':
-		ret <<= 10;
+		shl += 10;
 		fallthrough;
 	case 'P':
 	case 'p':
-		ret <<= 10;
+		shl += 10;
 		fallthrough;
 	case 'T':
 	case 't':
-		ret <<= 10;
+		shl += 10;
 		fallthrough;
 	case 'G':
 	case 'g':
-		ret <<= 10;
+		shl += 10;
 		fallthrough;
 	case 'M':
 	case 'm':
-		ret <<= 10;
+		shl += 10;
 		fallthrough;
 	case 'K':
 	case 'k':
-		ret <<= 10;
-		endptr++;
+		shl += 10;
 		fallthrough;
 	default:
 		break;
 	}
 
+	if (shl && likely(ptr != endptr)) {
+		/* Have valid suffix with preceding number. */
+		if (unlikely(check_shl_overflow(ret, shl, &ret)))
+			ret = ULLONG_MAX;
+		endptr++;
+	}
+
 	if (retptr)
 		*retptr = endptr;
 
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
