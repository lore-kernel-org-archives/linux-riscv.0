Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E364E7E36A
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Apr 2026 10:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gf6PbVfYpVSvJDHjVT2oF876qxIVFo1fHcbd+0GQVso=; b=BPyRlgSGl6ZpOW
	KzT+Ki3ztXHmCW2XbjW+XmgKLh8wPPoPvfQHRwdqIj1JylsdrcTjTdK4zXU4nkhzKI3MQfqgNZJky
	7YpWJEUoMF+BFXv9lM9Pwe1+pgpEYaVyM8Bd9UcQGHl7zduKHgav03Vdg02RgtHXFvJ+pK//NYrPz
	/EF+3T8kBCzyYbIlVfMw3J2SuEDywBzv8+uMf0qvJIFZ7ieNqhFl9Srvv1ykOAj9zrnllE4c6+QzC
	knR1kRSagfuE4AtS1ga/Pliv98Q5Sr/gGVigvHCbCVj0XL9uIRPKxT9YMPLOnAsqi2y49IvOGaFM3
	sjcbEeUimgBWN5h3t7XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8bqe-00000001tbS-0AD7;
	Fri, 03 Apr 2026 10:33:56 +0000
Received: from forward101d.mail.yandex.net ([2a02:6b8:c41:1300:1:45:d181:d101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8bqZ-00000001tZR-373d
	for linux-riscv@lists.infradead.org;
	Fri, 03 Apr 2026 10:33:54 +0000
Received: from mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:489d:0:640:baa6:0])
	by forward101d.mail.yandex.net (Yandex) with ESMTPS id A1575C008D;
	Fri, 03 Apr 2026 13:33:46 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id eXaKrQ9QICg0-2L40gpKR;
	Fri, 03 Apr 2026 13:33:46 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1775212426; bh=xpMpHVbNQyEu3bVeX/qstTUz7i5myZeY5ImYtYMRO48=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=HjNDmKhKkDr6aU86vZ52QwGpTG6teqRp/dGBlfs0hSPgtPWtI5Jl28k1awSRngPYd
	 QinZfKVtHx+e0O6vtC5ESM6TWOZmnF8ojZjGrmQvoGxS/IkyqfXl/WBHzvyX4bV+ur
	 qgxRFrZT3uMw3OKqZbNSRqW2YzcZlriL0eePAr/s=
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
Subject: [PATCH v9 3/6] lib: add more string to 64-bit integer conversion overflow tests
Date: Fri,  3 Apr 2026 13:33:35 +0300
Message-ID: <20260403103338.1122415-4-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260403103338.1122415-1-dmantipov@yandex.ru>
References: <20260403103338.1122415-1-dmantipov@yandex.ru>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_033352_055965_C01719E3 
X-CRM114-Status: UNSURE (   8.82  )
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

Add a few more string to 64-bit integer conversion tests to
check whether 'kstrtoull()', 'kstrtoll()', 'kstrtou64()' and
'kstrtos64()' can handle overflows reported by
'_parse_integer_limit()'.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
v5 and upwards: bump version to match the series
v4: initial version to join the series
---
 lib/test-kstrtox.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/lib/test-kstrtox.c b/lib/test-kstrtox.c
index ee87fef66cb5..811128d0df16 100644
--- a/lib/test-kstrtox.c
+++ b/lib/test-kstrtox.c
@@ -198,6 +198,7 @@ static void __init test_kstrtoull_fail(void)
 		{"10000000000000000000000000000000000000000000000000000000000000000",	2},
 		{"2000000000000000000000",	8},
 		{"18446744073709551616",	10},
+		{"569202370375329612767",	10},
 		{"10000000000000000",	16},
 		/* negative */
 		{"-0", 0},
@@ -275,9 +276,11 @@ static void __init test_kstrtoll_fail(void)
 		{"9223372036854775809",	10},
 		{"18446744073709551614",	10},
 		{"18446744073709551615",	10},
+		{"569202370375329612767",	10},
 		{"-9223372036854775809",	10},
 		{"-18446744073709551614",	10},
 		{"-18446744073709551615",	10},
+		{"-569202370375329612767",	10},
 		/* sign is first character if any */
 		{"-+1", 0},
 		{"-+1", 8},
@@ -334,6 +337,7 @@ static void __init test_kstrtou64_fail(void)
 		{"-1",	10},
 		{"18446744073709551616",	10},
 		{"18446744073709551617",	10},
+		{"569202370375329612767",	10},
 	};
 	TEST_FAIL(kstrtou64, u64, "%llu", test_u64_fail);
 }
@@ -386,6 +390,8 @@ static void __init test_kstrtos64_fail(void)
 		{"18446744073709551615",	10},
 		{"18446744073709551616",	10},
 		{"18446744073709551617",	10},
+		{"569202370375329612767",	10},
+		{"-569202370375329612767",	10},
 	};
 	TEST_FAIL(kstrtos64, s64, "%lld", test_s64_fail);
 }
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
