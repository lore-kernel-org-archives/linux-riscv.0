Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90743CD4F5B
	for <linux-riscv@archiver.kernel.org>; Tue, 19 May 2026 19:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UyfSAzLASmISlTKSIsOeVIpALJmykMTan+4dDeSkHd0=; b=iunOd052q2uNhL
	847ur//xoms7F7qm5zZm9+JrwtjH4lSgeVuJUfqmNbzUSNWrtadJPOuYzS5kB1RDekpDQjgRtYFNJ
	xyr6TRsFcTJhW4QjrT5TC8RgrbSccVQuv3xx3aZAC/MllIoUKxOJkIkNxWgO62Pw8TflhoYzblTAu
	X/ZyjGs66VZTMVI28EW5LFvHVf842zLrcIGmgfYjDnJjHVe7jn5MKgpvTqf1zdBzHr06JR4yy47vg
	TY99Toa7g5Txoo8+DWubiIZh0fh0ryAcb5cwWzGuA+muBvbCJdJKqhSiOrpvU7Z3HQTZXyeh03rWn
	qQfrNZz2dOcuRjiWkuUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPPpr-00000002aU8-2y4b;
	Tue, 19 May 2026 19:10:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPPpq-00000002aTu-0FPQ
	for linux-riscv@lists.infradead.org;
	Tue, 19 May 2026 19:10:34 +0000
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D8FC060221;
	Tue, 19 May 2026 19:10:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 336F51F000E9;
	Tue, 19 May 2026 19:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1779217832;
	bh=fgNZdK3NJsaTp5IvqSVDZRft25fsIJfb+L1i4SHqdtA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=ds7OmLDkvieL4R92S3Zhu9KQe+lkz4nqE5rwqXqvFxRW9Rc9cfTflUhCYGVpKwCG0
	 auLpjWdgmZimtBBjpQje2vujXXAI5UfyXliSqdTHZXTKvAGvMvHLLWBOtOfTMX3PI3
	 YLtBoq/8zqaAzKZpG4uqyrBcIN2LgMQStvd4aTtY=
Date: Tue, 19 May 2026 12:10:31 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Dmitry Antipov <dmantipov@yandex.ru>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Charlie Jenkins
 <thecharlesjenkins@gmail.com>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Ard Biesheuvel <ardb@kernel.org>,
 linux-riscv@lists.infradead.org, linux-efi@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 0/8] lib and lib/cmdline enhancements
Message-Id: <20260519121031.95ff192c46f02eb05e847e42@linux-foundation.org>
In-Reply-To: <20260519172259.908980-1-dmantipov@yandex.ru>
References: <20260519172259.908980-1-dmantipov@yandex.ru>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
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

On Tue, 19 May 2026 20:22:51 +0300 Dmitry Antipov <dmantipov@yandex.ru> wrote:

> This series is a merge of the recently posted [1] and [2]. The first
> one is intended to adjust '_parse_integer_limit()' and 'memparse()' to
> not ignore overflows, extend string to 64-bit integer conversion tests,
> add KUnit-based test for 'memparse()' and fix kernel-doc glitches found
> in lib/cmdline.c. The second one was originated from RISCV-specific
> build fixes needed to integrate the former and now aims to provide
> platform-specific double-word shifts and corresponding KUnit test.
> 
> This series was briefly tested on X86, RISCV32, ARM, and MIPS using QEMU,
> and compile-tested for LoongArch32 as well.
> 
> Getting feedback from RISCV core maintainers would be very helpful.
> 
> Special thanks to Andy Shevchenko, Charlie Jenkins, and Andrew Morton.
> 
> [1] https://lore.kernel.org/linux-riscv/20260403103338.1122415-1-dmantipov@yandex.ru
> [2] https://lore.kernel.org/linux-riscv/20260427090105.705529-1-dmantipov@yandex.ru

Thanks.  I updated mm.git's mm-nonmm-unstable branch to this version.

Below is how v11 altered mm.git.  Please note that it's conventional to
changelog the updates in the [0/N].  I see it there in the [6/8] and
[7/8] changelogs:

v11: add prototypes to arch/riscv/include/asm/asm-prototypes.h (Sashiko)
v11: explicitly depends on arm/xtensa/microblaze or 32-bit riscv/sparc (Sashiko)


 arch/riscv/include/asm/asm-prototypes.h |    4 ++++
 lib/Kconfig.debug                       |    2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

--- a/arch/riscv/include/asm/asm-prototypes.h~b
+++ a/arch/riscv/include/asm/asm-prototypes.h
@@ -5,6 +5,10 @@
 #include <linux/ftrace.h>
 #include <asm-generic/asm-prototypes.h>
 
+long long __lshrdi3(long long a, int b);
+long long __ashrdi3(long long a, int b);
+long long __ashldi3(long long a, int b);
+
 long long __lshrti3(long long a, int b);
 long long __ashrti3(long long a, int b);
 long long __ashlti3(long long a, int b);
--- a/lib/Kconfig.debug~b
+++ a/lib/Kconfig.debug
@@ -2974,7 +2974,7 @@ config BITS_TEST
 config SHDI3_KUNIT_TEST
 	tristate "KUnit test for __ashldi3(), __ashrdi3(), and __lshrdi3()"
 	depends on KUNIT
-	depends on (32BIT || ARM)
+	depends on ARM || XTENSA || MICROBLAZE || ((RISCV || SPARC) && !64BIT)
 	help
 	  This builds the unit test for __ashldi3(), __ashrdi3(), and
 	  __lshrdi3() helper functions used to implement 64-bit arithmetic
_


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
