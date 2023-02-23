Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4123C61DA4
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Feb 2023 22:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gQvvlYvN17HOmpYl+XE74SXgxJu2gW/a6zt+41kpimg=; b=wbcxQlgkTkqdlA
	S04zFn4rFOCx4MLFyKQQvDUlQwxnJ6QTg8QYIdEPUfyvPiBU7P6jJna2CSvt2Sv2bhzvQAcEUuqtW
	1YmMVCSBL0gcTg5pGpUUys1CWwZ8Ms0oLJgvRUFlyt/Lq0uqwwQdeKUlgnzP0fr200+yIvQqJHbIz
	/xwjgNacKQgoyb0fLTCzmWynEj0DZXUtI877Ok9gBZZ21mqXKGpE/Rz4fL1yxnSw+KP9Bw4DxQG46
	UNJDOfhHMkVVz38qQgjgQ+tXSpL3m+RRbq+ZGZ+NWIgSgEAjZzj6TkRCcItsk11mIbQ78+keivcF7
	xnoqLihD7kF0cXygU/zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVJit-000S5p-N7; Thu, 23 Feb 2023 22:05:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVJir-000S4o-6M
	for linux-riscv@lists.infradead.org; Thu, 23 Feb 2023 22:05:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 58BD6617A9;
	Thu, 23 Feb 2023 22:05:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5003C433EF;
	Thu, 23 Feb 2023 22:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677189951;
	bh=fYz5rIrd5JU5+RovoJams1gjh8QJtQxDO8e8HQED13k=;
	h=From:To:Cc:Subject:Date:From;
	b=OXLt9k56FMBL7+Tx8DTJWjJgrkrgqlfkF2NBR4wGb6BQwNS9Ou1n3faswnIWMwj9a
	 DtdnqEUKUT//A3gIWah7Xyt8pGUgDCh97cZvPqcM+GLhOcpEV10AYvcS3KBN0XIUCi
	 H3FztziA8S81HC3zpEyRcZZj1KOZyvmhSKV8uX2iDfCiYJ0uWM6D6kGrZhPQQ0F/i2
	 Ah7oBhXHC6EIKAC6z2LQ6KTJFzBSUC9chnM0bXCyLVToSky9LpwQrJvTuMK7gt35FA
	 N5+HjlQdL26X1PP9CFKLww8yewJm9uhlniN0YDepHYXlHQAp0ennwj9d26mCNvxQC1
	 yZC+GnXYKAXhA==
From: Conor Dooley <conor@kernel.org>
To: palmer@dabbelt.com
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	nathan@kernel.org,
	naresh.kamboju@linaro.org,
	linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH v1 0/2] RISC-V: avoid build issues for clang/llvm-17 with binutils 2.35
Date: Thu, 23 Feb 2023 22:05:44 +0000
Message-Id: <20230223220546.52879-1-conor@kernel.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1399; i=conor.dooley@microchip.com; h=from:subject; bh=Tu5ucbEE25sTwVSc9Il+0h6BckMJ3n6JBbt+V1iSKoQ=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDMnfH5uyHbolse9Tyuu5B3+1f5mqnB8QHDF3zde0gPyule+1 OFMMOkpZGMQ4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAjCRHdaMDJcCCkVYg+9ySHOLsMS9lX ngPIHl2cZTV6OCzl0/vCg9i4vhvy9j9JSLZzjO78+rkXTdsVePdW1tqv2R8uaWcjHxwxFvWAA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_140553_292474_278BF65B 
X-CRM114-Status: GOOD (  10.57  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Hey,
Here's an attempted (interim?) fix for issues on v5.10 due to the
presence of zifencei & zicsr in object files. I'm seeing another issue
that only appears with ld from binutils-2.35 & not with ld from
binutils-2.37 on riscv/for-next:
/stuff/toolchains/binutils-2.35/bin/riscv64-linux-gnu-ld: .init.data has both ordered [`__patchable_function_entries' in init/main.o] and unordered [`.meminit.data' in mm/sparse.o] sections
/stuff/toolchains/binutils-2.35/bin/riscv64-linux-gnu-ld: final link failed: bad value
But that's far far further on in the build than we were getting before
these patches.

Even if we end up dealing with the emitted strings a different way [1],
I think the first patch here has some value in moving the check to
Kconfig so that it's far easier to tell if the toolchain does need/use
these extensions from someone's build artifacts.

Cheers,
Conor.

1 - https://lore.kernel.org/linux-riscv/20230223195112.10489-1-palmer@rivosinc.com/

cc: nathan@kernel.org
cc: palmer@dabbelt.com
cc: naresh.kamboju@linaro.org
cc: linux-riscv@lists.infradead.org
cc: llvm@lists.linux.dev

Conor Dooley (2):
  RISC-V: move zicsr/zifencei spec version check to Kconfig
  RISC-V: make TOOLCHAIN_NEEDS_SPEC_20191213 gas only

 arch/riscv/Kconfig  | 9 +++++++++
 arch/riscv/Makefile | 5 +----
 2 files changed, 10 insertions(+), 4 deletions(-)

-- 
2.39.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
