Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F2C5C54ED0
	for <linux-riscv@archiver.kernel.org>; Fri, 23 May 2025 04:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8dSW+c27TQEyXp8VQEzj+K2q8P17RLd6hXHy0Fikt9E=; b=Y+FDttE1LaWz1j
	UxdlJXK38s1qW5G95ouKJaAcFAX41VAC3W0Rj/ibOTcCic9/QnSGgzYIvBIXa5svfz6nw1RzvWI+S
	CJb8dXNPb0mEL8+OtrTnb6QeVS0gVtAECSQW+yjEwEJloRywWdCCx+pPSzJEKVRVyHi6k/VlYxoAU
	yNq1UChZIPGnuJtreOwwFUMOEEBcAqrO40fdUq8dQg03KgpvKPhZ+zrsDTqeTEhq2qPKc7pb0TmW0
	fKk9CVOD3iC/dAv8xHqVfMQCHEnZD9A3zxrMMsd/9dcQ+OsQA7qsn1xda4yk6hqMgUmSfGRU+uOa9
	sJ49XMkwr6vTkJ3ftYqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIKMu-00000002wII-499d;
	Fri, 23 May 2025 04:50:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIKC6-00000002tza-0Xkw;
	Fri, 23 May 2025 04:39:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 73D2E62A6C;
	Fri, 23 May 2025 04:39:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 375BCC4CEF0;
	Fri, 23 May 2025 04:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747975181;
	bh=hftQ+JwDBzI0zRNacsurrBG64kHnxlfHAL+GJc3UtlU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Mlt9V43N3s40KNvwRkfJKjgVKijKqbPLij46HqqlNkvIfoSL+rYnTRagbRTto7C/K
	 8lYy8Vqp7TbL+nevN/UIpBTjs/XiptxQbwFMSHjovX29YatR87eZXGa5wo9w35cPhn
	 Cefoo+t9qOreQxCbxZcAa0YkQCMkvZrw4A3VgoPMNxG6T2SYs36c/iq02U+MSB9q36
	 kfcyPIztlB4cObaFoHSd51+ZGbz3F5mBh3nlmSv+d05RczPwBGHTDnXqMJ/Wsu/fFY
	 IDaZlSE5ORjlyuqIi2cwHtzMweQh4kn/Xp2k5lvlHUjzyqNROrExrC8pBmVtDqBVFs
	 RqH/LrMJYFszg==
From: Kees Cook <kees@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-hardening@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>,
	Marco Elver <elver@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	kasan-dev@googlegroups.com,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	sparclinux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v2 13/14] configs/hardening: Enable CONFIG_KSTACK_ERASE
Date: Thu, 22 May 2025 21:39:23 -0700
Message-Id: <20250523043935.2009972-13-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250523043251.it.550-kees@kernel.org>
References: <20250523043251.it.550-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1038; i=kees@kernel.org; h=from:subject; bh=hftQ+JwDBzI0zRNacsurrBG64kHnxlfHAL+GJc3UtlU=; b=owGbwMvMwCVmps19z/KJym7G02pJDBn6v38HyWWXKGX9Fha1ip2xar75gzP/j6q95Jmz43H6d fc3TrsmdZSyMIhxMciKKbIE2bnHuXi8bQ93n6sIM4eVCWQIAxenAEyE/SHDX6HNeeWcaw/7rJ2y 6+fW8y+a07ddtX01ccPv5zYrb7rddeNj+MNv+XBylp3fp4kvJqYU+moZvBBbtaU3/mb8VCcD2V+ hfJwA
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
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

Since we can wipe the stack with both Clang and GCC plugins, enable this
for the "hardening.config" for wider testing.

Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: <linux-hardening@vger.kernel.org>
---
 kernel/configs/hardening.config | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/configs/hardening.config b/kernel/configs/hardening.config
index dd7c32fb5ac1..d24c2772d04d 100644
--- a/kernel/configs/hardening.config
+++ b/kernel/configs/hardening.config
@@ -63,6 +63,9 @@ CONFIG_INIT_ON_ALLOC_DEFAULT_ON=y
 # Initialize all stack variables to zero on function entry.
 CONFIG_INIT_STACK_ALL_ZERO=y
 
+# Wipe kernel stack after syscall completion to reduce stale data lifetime.
+CONFIG_KSTACK_ERASE=y
+
 # Wipe RAM at reboot via EFI. For more details, see:
 # https://trustedcomputinggroup.org/resource/pc-client-work-group-platform-reset-attack-mitigation-specification/
 # https://bugzilla.redhat.com/show_bug.cgi?id=1532058
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
