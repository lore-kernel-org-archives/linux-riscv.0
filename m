Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1981C3DA6E
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Dec 2023 16:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+2wA/ug/Y3NXM7ZtAJLSnAY7pBPmMPvTw0xJoY+J9bw=; b=gJSCyd/4H+XmKX
	mC+XcbuivrlrGFqCdouEHZfI8aVgEYQeoli3Sk23JhJSAvQx/t3mJaCRpYFd+ErVME6gQhQFsAgRM
	C6kBAvcIQuwMr3aJfReZXVuaOWGyZcIFULG44wC5THCScaMXdzZ1rcZK4KF4NxF5HOmcpWA0sQySq
	sqpa5A/XmJtmD5uv3gEdKfkfdtuxEz4ea0nu75h3xEzHUDNJC0OO/lsYxCgKv8uXOzq4g/FT0kBZq
	+RHBUmcOe1qDUw7fFAG3bILKrP2gmeAqSQe1chbG/AWY/KcVKnD+SbyaW5bpTkWwhv7985xk2Kvmz
	fVY8iZOPYIUd/ORlvzDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rH4Uz-0088QK-0o;
	Sat, 23 Dec 2023 16:05:13 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rH4Uw-0088PP-20
	for linux-riscv@lists.infradead.org;
	Sat, 23 Dec 2023 16:05:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id CC959B80954;
	Sat, 23 Dec 2023 16:05:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CE8DC433C9;
	Sat, 23 Dec 2023 16:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703347508;
	bh=4LFjPK+C/VGLc/HLRVhKkrd4EuuVYg8aZKuIRF5TOtM=;
	h=From:To:Cc:Subject:Date:From;
	b=tJlsg+v5w4DwnBsx049VU0UjqJNlzPtxxdQXzz3VEuYVVd/byZG7K3vuGaBTDXXtp
	 DoboTQzwQ3zXscka6lPYJ6mgIvpRXG1BebTc+vHUVtMt3TPPnjkDKp0JqjKIegpSi3
	 ENZM14ZC2Eb37cdWNU1CK48tkhUI7YyUpifSRumuT8F9pTzp65BNaGG2/9+fFy0sOX
	 N6IjN5oKtb3DsmJsG+HGX+Y9toX7kH/zITb6hia/2y4fkNQSq9s2M6frPvbdXPcRcB
	 wjZMpPFE+wpKDVr5lWTQjKYMOKv7aZrbQS9xEXkjURK7bTe/ebOzxYGZFCx1rdGAbk
	 LpcGbm4KTL10w==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Qingfang DENG <dqfext@gmail.com>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v3 0/2] riscv: enable EFFICIENT_UNALIGNED_ACCESS and DCACHE_WORD_ACCESS
Date: Sat, 23 Dec 2023 23:52:24 +0800
Message-Id: <20231223155226.4050-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231223_080510_812157_67CBC767 
X-CRM114-Status: UNSURE (   9.62  )
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

Since v2:
  - Don't set "-mstrict-align" CFLAGS if HAVE_EFFICIENT_UNALIGNED_ACCESS
  - collect Reviewed-by tag

Since v1:
  - fix typo in commit msg
  - fix build error if NOMMU

Jisheng Zhang (2):
  riscv: introduce RISCV_EFFICIENT_UNALIGNED_ACCESS
  riscv: select DCACHE_WORD_ACCESS for efficient unaligned access HW

 arch/riscv/Kconfig                      | 13 +++++++++++
 arch/riscv/Makefile                     |  2 ++
 arch/riscv/include/asm/asm-extable.h    | 15 ++++++++++++
 arch/riscv/include/asm/word-at-a-time.h | 27 +++++++++++++++++++++
 arch/riscv/mm/extable.c                 | 31 +++++++++++++++++++++++++
 5 files changed, 88 insertions(+)

-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
