Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5534CC3DA6E
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Dec 2023 04:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=e2sd9muOX3HtBeH+jDmJkdNdfEFp+dsgFArJ4LZD//A=; b=TJYEluYIXmG3e7
	HWqO8e6zffU3lAOU+AAhAuEZ4HV12fjwoKh1/MkOLWspBm3oWqiT82Z257iCdEewLXq/Bw86zV+Us
	wTd/5EaMf48PUN6BzG3bq+S6FbXhZxYdfmxUvazCxErjKA4Rra3LEK1ktCVsl9faffuHfiauyQL6x
	Vh6pVGEFyUHqzh8mpx75C5JNjJuVeiUrTvGt0uWGAEXhcaS/CpKNzwNse9wr68xGrJBV+RqXypPuK
	cgriRZJphVcfJ+Mk499Cv6y+tyoqbsjLYl5XI4lEANzSHB1loD5f3r8XR9on3f80CzokL6SHum7D1
	nj/5/CArpYSguvGGyHrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rHczW-00ADAy-3B;
	Mon, 25 Dec 2023 04:55:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rHczT-00AD94-2A
	for linux-riscv@lists.infradead.org;
	Mon, 25 Dec 2023 04:55:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3F28660C26;
	Mon, 25 Dec 2023 04:54:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74E6BC433C7;
	Mon, 25 Dec 2023 04:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703480091;
	bh=UArUSyBZsPKxLkpUFilgpFD8aka1iX7bL7/0EeJ4W9s=;
	h=From:To:Cc:Subject:Date:From;
	b=Qrat2D9mqhj5ram8CGulN/a4AthJQBzq+uzfRUGEqVXSIEIdizPmerD1Gb9BqkX5j
	 yOScpSvVveHperCPxKtZsxuFilvN/6urpCPsJfjdZTndKgpLv72pa3/9tTaDrfvutM
	 Nzu5gTXzT+kiqck1CCNcUEqWq3AV+HIyWsp+2zID73GSrcNmCUeAH0iDwet5KQiJs+
	 +77xdqrGRHyrPTZZt8KuNkIjRBj/ahjruXT35opTqY58rphamGKD+utB3Bm/EJlNUr
	 OfW4KpJjZWz8zfl4rLRmu+uanCkWxztq3OKLNvol0FDa+ASb4dvwpiMThiFiPWizz6
	 SPmxwG+W4/eNA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Eric Biggers <ebiggers@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Qingfang DENG <dqfext@gmail.com>
Subject: [PATCH v4 0/2] riscv: enable EFFICIENT_UNALIGNED_ACCESS and DCACHE_WORD_ACCESS
Date: Mon, 25 Dec 2023 12:42:05 +0800
Message-Id: <20231225044207.3821-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231224_205459_779767_ED8913C4 
X-CRM114-Status: UNSURE (   9.59  )
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

Since v3:
  - adopt Eric's suggestions, such as better Kconfig help msg and so on.

Since v2:
  - Don't set "-mstrict-align" CFLAGS if HAVE_EFFICIENT_UNALIGNED_ACCESS
  - collect Reviewed-by tag

Since v1:
  - fix typo in commit msg
  - fix build error if NOMMU


Jisheng Zhang (2):
  riscv: introduce RISCV_EFFICIENT_UNALIGNED_ACCESS
  riscv: select DCACHE_WORD_ACCESS for efficient unaligned access HW

 arch/riscv/Kconfig                      | 14 +++++++++++
 arch/riscv/Makefile                     |  2 ++
 arch/riscv/include/asm/asm-extable.h    | 15 ++++++++++++
 arch/riscv/include/asm/word-at-a-time.h | 27 +++++++++++++++++++++
 arch/riscv/mm/extable.c                 | 31 +++++++++++++++++++++++++
 5 files changed, 89 insertions(+)

-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
