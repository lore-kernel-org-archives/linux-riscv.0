Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1E3BE7E36B
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Apr 2026 10:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l7Gy5FVIOlbWHa5PD4GbIGrgxFYV5rcTihAn7d2iRZc=; b=oXtOvxhaL59zmL
	8ldg8VQLCilNN4sq5YywnlYmq+4/IQpIeoecPy0S45/QfHUxJ2eztDd7ileQKb9i8MBfED88WjeKA
	LGO7QNziV77yy4pajz3GLpKZbFXobocTfrA43SRdNpJUhcxeVhnuRWoImjsm+V/RYcF5fUJej8F/C
	qGc4lVrnGHwAlMgjpYPhrpEyhzwkDFrLNOPe6SzRWhaRZKatIihyeZKf8lvJPGqTvk6QCOSSC56vH
	rb4267j1Pz3s6mYElt1bu0JQR6Xg9DHFxKR2sxcmL87dBekDj4UMklTxARWCbRbbCzuBbWkmrbSYk
	9ihZVfttM4jAM5ZpH5+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8bqh-00000001tdN-2lxH;
	Fri, 03 Apr 2026 10:33:59 +0000
Received: from forward102b.mail.yandex.net ([178.154.239.149])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8bqc-00000001taL-3tVZ
	for linux-riscv@lists.infradead.org;
	Fri, 03 Apr 2026 10:33:56 +0000
Received: from mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:489d:0:640:baa6:0])
	by forward102b.mail.yandex.net (Yandex) with ESMTPS id C34FEC0002;
	Fri, 03 Apr 2026 13:33:48 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id eXaKrQ9QICg0-pxY4oLxk;
	Fri, 03 Apr 2026 13:33:48 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1775212428; bh=gA72Ls5eRaGrKkWfOZiySyHNm4v/PKnrrPEn/q+BU34=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=w2yVvLnBVRZAVzDWwMFno7BhNQF/uHqujLnYNeshVC3E3A8W8BqbuwIu/R9Dv0b3I
	 kgtGfHdbqViBmZSzrQlk+xg1x9HTfEujODxyoYdPg2JkGlMaaOwVMoMVeqNMA88P/a
	 synedG1crCZDhNA6BVcjLpXyxcxqyV0EeY/fJriA=
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
Subject: [PATCH v9 5/6] lib/cmdline: adjust a few comments to fix kernel-doc -Wreturn warnings
Date: Fri,  3 Apr 2026 13:33:37 +0300
Message-ID: <20260403103338.1122415-6-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260403103338.1122415-1-dmantipov@yandex.ru>
References: <20260403103338.1122415-1-dmantipov@yandex.ru>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_033355_141024_DAF4E03E 
X-CRM114-Status: GOOD (  12.91  )
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

Fix 'get_option()', 'memparse()' and 'parse_option_str()' comments
to match the commonly used style as suggested by kernel-doc -Wreturn.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
v2 and upwards: bump version to match the series
---
 lib/cmdline.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/lib/cmdline.c b/lib/cmdline.c
index f6e4b113ca9f..16cce6621cec 100644
--- a/lib/cmdline.c
+++ b/lib/cmdline.c
@@ -43,7 +43,7 @@ static int get_range(char **str, int *pint, int n)
  *	When @pint is NULL the function can be used as a validator of
  *	the current option in the string.
  *
- *	Return values:
+ *	Return:
  *	0 - no int in string
  *	1 - int found, no subsequent comma
  *	2 - int found including a subsequent comma
@@ -145,6 +145,9 @@ EXPORT_SYMBOL(get_options);
  *
  *	Parses a string into a number.  The number stored at @ptr is
  *	potentially suffixed with K, M, G, T, P, E.
+ *
+ *	Return: The value as recognized by simple_strtoull() multiplied
+ *	by the value as specified by suffix, if any.
  */
 
 unsigned long long memparse(const char *ptr, char **retptr)
@@ -205,7 +208,7 @@ EXPORT_SYMBOL(memparse);
  *	This function parses a string containing a comma-separated list of
  *	strings like a=b,c.
  *
- *	Return true if there's such option in the string, or return false.
+ *	Return: True if there's such option in the string or false otherwise.
  */
 bool parse_option_str(const char *str, const char *option)
 {
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
