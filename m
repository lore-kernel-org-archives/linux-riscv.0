Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9202CDB474
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 11:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OUXHH4vv96/NCDdYMv9CprlvjWlq4ojt6dunlqAj15A=; b=h3b+K3TBUaH7fd
	4KMY7fL7tqP/CtRFN624fWNSYEB7insNiwLqotg37AbFPWCmxznCcr8wnx66BwVh1osZP6q1+/rQz
	g/U879v4EP2JZK+cLccCD1PJAkqyNQex2UTxMxS+yKLa/q8OcmWRPWPItIwWmKn6OWaTebdRLOlqO
	n5Sn2fHRdV7ZtUYJ4CwykBp0zpLhX0OksThfWLsAGw/hBowWBPwHormYLs5qYN/WlX9gGldIeIz37
	k+kBMQF2rtJxJGXRsQh1gHhVuzhM7fpIzEODZzOS4pSXFqObfp79tz+SFZqz4gwIRqf0X4F+0LGJt
	BP3AZ5my6rbKe+OnuI2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qusiu-007CYR-2h;
	Mon, 23 Oct 2023 11:03:52 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qusir-007CXH-2b
	for linux-riscv@lists.infradead.org;
	Mon, 23 Oct 2023 11:03:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 37F0BCE2079;
	Mon, 23 Oct 2023 11:03:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FC50C433C8;
	Mon, 23 Oct 2023 11:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698059027;
	bh=pklDVZYAxLKOZK+8gcGmc6nJte6jXDPhoa1mHNgJuzE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aEz1JEDvjQaJCvm0F9LQymLd21rjf1S1DqR5Gi9cmP+YNr+w2pL7fjquHFqDs6IB+
	 d6cIIZ47jqQn1L8WagjScNybKckrd+FXFcqqKLFzXoQKgvtNnlv3vFGsXSLXNWWsk4
	 1bze2g38+kbHgBpuKxTulVPCd6rCF+NqMOrHc9myfAulikmaV7aShzYjrS3rYdT/gm
	 gRMygzsnhkITq2leWaFOOORjdlTXknzCn/JSvrc9kpRkHpW68zf0YnqL5NGAFHWnGi
	 lShoLPhiqVdbc6rtTEaWPlIocDVMUjtmb4ga3rhwU9g2gHeUXGkKOZK1oWGjSzmemf
	 BbtYjDfrwkmkg==
From: Arnd Bergmann <arnd@kernel.org>
To: Vivek Goyal <vgoyal@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>,
	linux-crypto@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Eric DeVolder <eric.devolder@oracle.com>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	Hari Bathini <hbathini@linux.ibm.com>,
	Baoquan He <bhe@redhat.com>,
	Costa Shulyupin <costa.shul@redhat.com>
Subject: [PATCH 2/2] kexec: select CRYPTO from KEXEC_FILE instead of depending on it
Date: Mon, 23 Oct 2023 13:01:55 +0200
Message-Id: <20231023110308.1202042-2-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231023110308.1202042-1-arnd@kernel.org>
References: <20231023110308.1202042-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_040350_184362_A9FE5B5B 
X-CRM114-Status: GOOD (  13.83  )
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

From: Arnd Bergmann <arnd@arndb.de>

All other users of crypto code use 'select' instead of 'depends on',
so do the same thing with KEXEC_FILE for consistency.

In practice this makes very little difference as kernels with kexec
support are very likely to also include some other feature that already
selects both crypto and crypto_sha256, but being consistent here helps
for usability as well as to avoid potential circular dependencies.

This reverts the dependency back to what it was originally before commit
74ca317c26a3f ("kexec: create a new config option CONFIG_KEXEC_FILE for
new syscall"), which changed changed it with the comment "This should
be safer as "select" is not recursive", but that appears to have been
done in error, as "select" is indeed recursive, and there are no other
dependencies that prevent CRYPTO_SHA256 from being selected here.

Fixes: 74ca317c26a3f ("kexec: create a new config option CONFIG_KEXEC_FILE for new syscall")
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: linux-crypto@vger.kernel.org
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 kernel/Kconfig.kexec | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/Kconfig.kexec b/kernel/Kconfig.kexec
index bfc636d64ff2b..51f719af10e79 100644
--- a/kernel/Kconfig.kexec
+++ b/kernel/Kconfig.kexec
@@ -36,7 +36,8 @@ config KEXEC
 config KEXEC_FILE
 	bool "Enable kexec file based system call"
 	depends on ARCH_SUPPORTS_KEXEC_FILE
-	depends on CRYPTO_SHA256=y || !ARCH_SUPPORTS_KEXEC_PURGATORY
+	select CRYPTO
+	select CRYPTO_SHA256
 	select KEXEC_CORE
 	help
 	  This is new version of kexec system call. This system call is
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
