Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D07C10DC3
	for <linux-riscv@archiver.kernel.org>; Sun,  3 Dec 2023 14:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yXeFwtYQACfmERZWlbyQ5DWC6iEglam5wnqrRV2hz9E=; b=DZQ4sPMhLW4lYB
	FgeIdfKFKlCdFdB2QeZrGfsY85Wa1qloTfeL6+G9q1WdwRtd3pBHQattja9TX8aFBornucYtpvmr6
	DGsU4fHDHK6sfjty6cdw7VJ6MYHSZ0AASKKir5uvCS60O2v1uG4P9RvTyHtgK/uv54uIsrei+vEoF
	Ijg/AtJ763aykB7GvcYN0ZCCGbVUV0i62+L5Zw50Cia2H+Bh5my2mozMjzbAOpJphzB6fBStz/s2e
	aS1kIMpUYo77KthkkJO+thPo2gJdxGsdSgjGLwOgb8greaGCUFV+PdoLc/fdoAUeuaudD3DheENNO
	r/7HB82ZjDhpK/W0G/9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r9nB7-0006eO-1K;
	Sun, 03 Dec 2023 14:10:37 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r9nB3-0006Yz-2E
	for linux-riscv@lists.infradead.org;
	Sun, 03 Dec 2023 14:10:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id F1314B80B90;
	Sun,  3 Dec 2023 14:10:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F48BC433C9;
	Sun,  3 Dec 2023 14:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701612627;
	bh=QZ+9c3MhqDU0C1Ei9+Fc5gRRLMVSExYSRe6oAlwtRlM=;
	h=From:To:Cc:Subject:Date:From;
	b=sglyprX5e81KPNAgEajlkRuYjgMk4GCbCkUVSK6gfxEzfdj9KE/RvF/zYZqgLpRe/
	 GB3E565v+J9TjzAIgE66mkD9YNMIi7wvJylmWf8SzsYqMpPetVyxDErovpepry7G9f
	 jZvuDMzTz1oIZdrLGIkJa6L3n5a+O47WqNTg5dRbeN5WJSLq8TjFn9Y8uWSCDyfgvh
	 geZSbBmGWVPpYZpjxQ11SXyRwQLIvK7zTDAXfi876Mk+EA6LIOVT8ZKkSXGJspJvU7
	 MDg02EBgqozaU0OZd8mOe24EDDUxykxUrsrYUU0v8A6L/+VIzEjvolKaTRIBo46YKq
	 7P4MW0OkXmXZg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] riscv: enable EFFICIENT_UNALIGNED_ACCESS and DCACHE_WORD_ACCESS
Date: Sun,  3 Dec 2023 21:57:51 +0800
Message-Id: <20231203135753.1575-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231203_061034_024674_63634356 
X-CRM114-Status: UNSURE (   9.78  )
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

Some riscv implementations such as T-HEAD's C906, C908, C910 and C920
support efficient unaligned access, for performance reason we want
to enable HAVE_EFFICIENT_UNALIGNED_ACCESS on these platforms. To
avoid performance regressions on non efficient unaligned access
platforms, HAVE_EFFICIENT_UNALIGNED_ACCESS can't be globally selected.

To solve this problem, runtime code patching based on the detected
speed is a good solution. But that's not easy, it involves lots of
work to modify vairous subsystems such as net, mm, lib and so on.
This can be done step by step.

So let's take an easier solution: add support to efficient unaligned
access and hide the support under NONPORTABLE.

patch1 introduces RISCV_EFFICIENT_UNALIGNED_ACCESS which depends on
NONPORTABLE, if users know during config time that the kernel will be
only run on those efficient unaligned access hw platforms, they can
enable it. Obviously, generic unified kernel Image shouldn't enable it.

patch2 adds support DCACHE_WORD_ACCESS when MMU and
RISCV_EFFICIENT_UNALIGNED_ACCESS.

Below test program and step shows how much performance can be improved:

 $ cat tt.c
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <unistd.h>

 #define ITERATIONS 1000000

 #define PATH "123456781234567812345678123456781"

 int main(void)
 {
         unsigned long i;
         struct stat buf;

         for (i = 0; i < ITERATIONS; i++)
                 stat(PATH, &buf);

         return 0;
 }

 $ gcc -O2 tt.c
 $ touch 123456781234567812345678123456781
 $ time ./a.out

Per my test on T-HEAD C910 platforms, the above test performance is
improved by about 7.5%.

Since v1:
  - fix typo in commit msg
  - fix build error if NOMMU

Jisheng Zhang (2):
  riscv: introduce RISCV_EFFICIENT_UNALIGNED_ACCESS
  riscv: select DCACHE_WORD_ACCESS for efficient unaligned access HW

 arch/riscv/Kconfig                      | 13 +++++++++++
 arch/riscv/include/asm/asm-extable.h    | 15 ++++++++++++
 arch/riscv/include/asm/word-at-a-time.h | 27 +++++++++++++++++++++
 arch/riscv/mm/extable.c                 | 31 +++++++++++++++++++++++++
 4 files changed, 86 insertions(+)

-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
