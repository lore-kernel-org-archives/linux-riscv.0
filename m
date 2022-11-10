Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 461B7C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Nov 2022 16:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aORFb8V01D4JKLVd1p8zaCqfFdR1do+mLdAFI5Z1xuQ=; b=XysD+RxcKcHFFQ
	iLN3lXGHIri03VSsfHMqDAUvvkWX6jvIdM3nscbO5F9iz1CwiLkc2/JZefyB2bnlsz/vJaE7ewGYX
	BA1YgyCJOSX4gnqzMvB5sW82SXdXwL+KZxMHenya77I48PYXA4MN3HpfLdy/2a+s008FQP3874tGp
	8iJSduCrdRjSEGHA7yY3l2KuLGyZV/exJLmOp4F8dcrFxcm1lhoKqqVaI+ZX5TfS00KdBpEfM3hso
	/URv8sdCcn8Ttuz0ZIRV4eYNHwLI7U5IC4fWAesMhpIhrhWmsND70qWCj0ZxAFDLxuIrND3cO5i2O
	r3yoHoTfbkQCxaG62bFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otAkz-007KUo-N3; Thu, 10 Nov 2022 16:50:25 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otAko-007KIx-F4
	for linux-riscv@lists.infradead.org; Thu, 10 Nov 2022 16:50:17 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1otAkj-0001xU-Le; Thu, 10 Nov 2022 17:50:09 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: christoph.muellner@vrull.eu,
	prabhakar.csengg@gmail.com,
	conor@kernel.org,
	philipp.tomsich@vrull.eu,
	ajones@ventanamicro.com,
	heiko@sntech.de,
	emil.renner.berthing@canonical.com,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: [PATCH 0/7] Zbb string optimizations and call support in alternatives
Date: Thu, 10 Nov 2022 17:49:17 +0100
Message-Id: <20221110164924.529386-1-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_085014_548367_508FD152 
X-CRM114-Status: GOOD (  16.31  )
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

The Zbb extension can be used to make string functions run a lot
faster.

To allow There are essentially two problems to solve:
- making it possible for str* functions to replace what they do
  in a performant way

  This is done by inlining the core functions and then
  using alternatives to call the actual variant.

  This of course will need a more intelligent selection mechanism
  down the road when more variants may exist using different
  available extensions.

- actually allowing calls in alternatives
  Function calls use auipc + jalr to reach those 32bit relative
  addresses but when they're compiled the offset will be wrong
  as alternatives live in a different section. So when the patch
  gets applied the address will point to the wrong location.

  So similar to arm64 the target addresses need to be updated.

  This is probably also helpful for other things needing more
  complex code in alternatives.


In my half-scientific test-case of running the functions in question
on a 95 character string in a loop of 10000 iterations, the Zbb
variants shave off around 2/3 of the original runtime.


changes since rfc:
- make Zbb code actually work
- drop some unneeded patches
- a lot of cleanups


Heiko Stuebner (7):
  efi/riscv: libstub: mark when compiling libstub
  RISC-V: add auipc elements to parse_asm header
  RISC-V: add U-type imm parsing to parse_asm header
  RISC-V: add rd reg parsing to parse_asm header
  RISC-V: fix auipc-jalr addresses in patched alternatives
  RISC-V: add infrastructure to allow different str* implementations
  RISC-V: add zbb support to string functions

 arch/riscv/Kconfig                    |  23 ++++++
 arch/riscv/include/asm/errata_list.h  |   3 +-
 arch/riscv/include/asm/hwcap.h        |   1 +
 arch/riscv/include/asm/parse_asm.h    |  21 +++++
 arch/riscv/include/asm/string.h       |  83 ++++++++++++++++++++
 arch/riscv/kernel/cpu.c               |   1 +
 arch/riscv/kernel/cpufeature.c        |  97 ++++++++++++++++++++++-
 arch/riscv/kernel/image-vars.h        |   6 +-
 arch/riscv/lib/Makefile               |   6 ++
 arch/riscv/lib/strcmp.S               |  39 ++++++++++
 arch/riscv/lib/strcmp_zbb.S           |  91 ++++++++++++++++++++++
 arch/riscv/lib/strlen.S               |  29 +++++++
 arch/riscv/lib/strlen_zbb.S           |  98 ++++++++++++++++++++++++
 arch/riscv/lib/strncmp.S              |  41 ++++++++++
 arch/riscv/lib/strncmp_zbb.S          | 106 ++++++++++++++++++++++++++
 drivers/firmware/efi/libstub/Makefile |   2 +-
 16 files changed, 640 insertions(+), 7 deletions(-)
 create mode 100644 arch/riscv/lib/strcmp.S
 create mode 100644 arch/riscv/lib/strcmp_zbb.S
 create mode 100644 arch/riscv/lib/strlen.S
 create mode 100644 arch/riscv/lib/strlen_zbb.S
 create mode 100644 arch/riscv/lib/strncmp.S
 create mode 100644 arch/riscv/lib/strncmp_zbb.S

-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
