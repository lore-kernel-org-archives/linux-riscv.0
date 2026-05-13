Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A78CD4851
	for <linux-riscv@archiver.kernel.org>; Wed, 13 May 2026 13:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a6OJcx+kdNnQAOOZg7uaHh/OOf+kTr4Q2HB0bNuzyR4=; b=myV5++Rvr0JUx6
	1unbIkL/2FAzdXkRYJts8aWuylMgANyDhhXOc4kD+qvlvPVa7NcKoyJdFBaWikO5A80N5t98rVj/l
	KP8FKkIIi/M1ybEiH4OqW9lsgn1OtUr/3U7SAA3OiNTmt1WcFqm13zhI4/31VpnCS2MICtAlsDyjE
	JwEI7A+YVpMWDOletC/+LXm4jv9y13KkIxct+u8iNDVgP5JHvYDFYp6RGlT07Blf2YqER8Nm+adf0
	7+fcO2ySytXOhQK51TNR9UCbGBy5pGU9nN+cfzmA3eqNM9jIKCdXRF3slcfGbd6Lu7pHP04cbKTPN
	qO/dqmLbpnkDR5Nyjxxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNA0O-00000002osh-0Z4B;
	Wed, 13 May 2026 13:52:08 +0000
Received: from forward100b.mail.yandex.net ([2a02:6b8:c02:900:1:45:d181:d100])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNA0K-00000002opj-3Lzl
	for linux-riscv@lists.infradead.org;
	Wed, 13 May 2026 13:52:07 +0000
Received: from mail-nwsmtp-smtp-production-main-98.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-98.sas.yp-c.yandex.net [IPv6:2a02:6b8:c23:1ba8:0:640:1638:0])
	by forward100b.mail.yandex.net (Yandex) with ESMTPS id 97AEF8071F;
	Wed, 13 May 2026 16:51:58 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-98.sas.yp-c.yandex.net (smtp) with ESMTPSA id ppLkjiGSViE0-UaUZKwYN;
	Wed, 13 May 2026 16:51:57 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1778680317; bh=9g1rCpxz2tcUvBZ4ViA0PV+aISe/bmNJIWEfyzUAKpg=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=HNl92y4iCIk5uTq/gyjOXzlFTx272GRBvGuYPFuAXz2CXrTz5sefbtg6cmTC+tI7r
	 qqiMBkLAaYVozpm36QBABjFDQThHAghqNAvkh/mRjIKBnoqGAUXiH5WQ22yIZJMK9F
	 Nr9YqhyUHNnntTi2YSFYI1vvqnL8sHM3F+xTruLE=
Authentication-Results: mail-nwsmtp-smtp-production-main-98.sas.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-efi@vger.kernel.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH v10 3/8] lib: add more string to 64-bit integer conversion overflow tests
Date: Wed, 13 May 2026 16:44:02 +0300
Message-ID: <20260513134407.884033-4-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260513134407.884033-1-dmantipov@yandex.ru>
References: <20260513134407.884033-1-dmantipov@yandex.ru>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_065205_154884_EFA9CDA7 
X-CRM114-Status: UNSURE (   8.44  )
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
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
