Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA423C83F34
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Jul 2025 23:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8dSW+c27TQEyXp8VQEzj+K2q8P17RLd6hXHy0Fikt9E=; b=nvVDe4qpdsWdGo
	mE1xTjvcf9ZsObU1Culp72PCVA3iiHjeIJ61EaluFFNTp2EXTbpiEbwIBwSJqzFuydoxAGw4r1GqU
	co2ZmJwm1mut2H9lDoFQyzIgfFdz+LJXb/7T0LthhTQ04OIuBXZ/WSywRJt8pqOOgmthBLSIwcT35
	f8fnusoP4pDi9t8rvGJEDIbAF/uB85bCHMdMLx6pIUQuuS4+mHZilB7tgf8ae1qeUD+cum1LSIupB
	zzBnZWTOw1HN8KKHokmQVxPkaI+/0sEQGcFUfhQdB+7dkX3wGOAfx6XojCdydy9cwkMqVwz86iU1f
	RnuOm7QYG5j3LwFgEWiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucYPP-0000000BNB3-0mtp;
	Thu, 17 Jul 2025 23:53:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucXyd-0000000BGtq-0P8F;
	Thu, 17 Jul 2025 23:25:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6842845B14;
	Thu, 17 Jul 2025 23:25:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B589AC4DDE4;
	Thu, 17 Jul 2025 23:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752794720;
	bh=hftQ+JwDBzI0zRNacsurrBG64kHnxlfHAL+GJc3UtlU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FsqjdsQS75ijp4EewZkFNnZ7oGWM+bQuK2TZnkPG1i4tUtkePSQGvhT3cJzizICIP
	 n7VsETLWXSDSuNlB4j5w4GFk77PgUesXjhwz6yMoT31mNWaWjswPyAxrArx7XoTrzv
	 qwRQ4j9gCoTu0mZgFXm9mV43Qt0uBu3ieYyCdmQG53nX22891/8O+gwogWE5UBED26
	 ScLxadVl8C+/OHTvTZH1MoVS2hlIEz8r+PE+d+h/fgLqGQh1uU2RoHTiTONCiUEx+a
	 5pAsMwG5Sv8s6jqrUJ/cIcIw1BL4yue1cJRn64/wKIgKX5LH0prSsOZ29wNitGYIID
	 IN144gC7uUisA==
From: Kees Cook <kees@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-hardening@vger.kernel.org,
	Ingo Molnar <mingo@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
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
Subject: [PATCH v3 12/13] configs/hardening: Enable CONFIG_KSTACK_ERASE
Date: Thu, 17 Jul 2025 16:25:17 -0700
Message-Id: <20250717232519.2984886-12-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250717231756.make.423-kees@kernel.org>
References: <20250717231756.make.423-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1038; i=kees@kernel.org; h=from:subject; bh=hftQ+JwDBzI0zRNacsurrBG64kHnxlfHAL+GJc3UtlU=; b=owGbwMvMwCVmps19z/KJym7G02pJDBmVbbFBctklSlm/hUWtYmesmm/+4Mz/o2oveebseJx+3 f2N065JHaUsDGJcDLJiiixBdu5xLh5v28Pd5yrCzGFlAhnCwMUpABPZrM/wT/+s9b/zj2UjKz2d 0opOWQdaqM192v1qrb5mpnFiz/LKFYwMM5YFnp723f9/aP7hJMnrxuH6yRfrcxYbWx+zavrULTm NDwA=
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_162523_194722_2E206300 
X-CRM114-Status: UNSURE (   7.63  )
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
