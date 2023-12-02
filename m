Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 914D0C4167B
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Dec 2023 11:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VIDjSyZNKYJLNUPZGHoNAhJ1NA7W4AoCnk1Z4pDtF1U=; b=4oCxYVbNt/Ug0c
	Bxr29wKPCC4X4ZIO+dt/ResotgHOY4nvJTyvqymD7Y0VPrkiaDvYQqvtfZlqLnXQnDfgzCLiMZ2Qn
	6fYO3+hb8VVffTDzspNXPdWuXhIfQxSpD/fMgB0aYZX+aOoK3joaavR008+ebGCIf/YT59yZnpW7h
	3nsJ7AATsiJbp/jU3wYIsFlucDBkgp3eVpLO6YKX0dMU2Gmm5qZ1yGICcZQm0TlU+SqLxIUGXo5SK
	3L2IwtJkwNUf8aMT0b0Gy9gqG0C8zcEfnByXso2Y8G1mL9Xhub81vc6EeEtSSH8shLtH/pyz5qaN3
	Pu+xC94SYiLqZ60D+pIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r9OCz-00FbJQ-2V;
	Sat, 02 Dec 2023 11:30:53 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r9OCw-00FbGU-2K
	for linux-riscv@lists.infradead.org;
	Sat, 02 Dec 2023 11:30:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id BD5B4B80B62;
	Sat,  2 Dec 2023 11:30:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E982DC433C7;
	Sat,  2 Dec 2023 11:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701516648;
	bh=kc94KxJklyWoPHmt6+H5e2NnVhPjnhF/egXD3sMeH9s=;
	h=From:To:Cc:Subject:Date:From;
	b=PDZS5xOu5TYmg25XuIj8ahMbd8+EX/4hhB19ehvPVfSP5RtWf5YHBTaNtbbbkkbOB
	 C5AAhIvLt98znugz2CXFtv203fZXZUV4vl7x1TRLuJtMhP7Z292d/Ge5h/Aa5WDkBr
	 9mLVUhgakh6j5Bb3vHHKzaCiRRo8OUz6+Aezen51F1owVbshgfVTEkMkvHhTCie+aR
	 eei+3mUsX7IvSzOKj982p8RUmPXPT2TYhfF4R4dEu0mVox/0v/DtAK0cVk76ACiOVp
	 DZvFLBkuCYU4pHRglerDUHyvDpLCQO5CfWhe+HxgZ4S9vnddkkWHHAzZDFFn93VzDY
	 t6egOxopVAgug==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] riscv: enable EFFICIENT_UNALIGNED_ACCESS and DCACHE_WORD_ACCESS
Date: Sat,  2 Dec 2023 19:18:20 +0800
Message-Id: <20231202111822.3569-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231202_033050_936498_1F04053B 
X-CRM114-Status: UNSURE (   8.46  )
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
supports efficient unaligned access, for performance reason we want
to enable HAVE_EFFICIENT_UNALIGNED_ACCESS on these platforms. To
avoid performance regressions on other non efficient unaligned access
platforms, HAVE_EFFICIENT_UNALIGNED_ACCESS can't be globaly selected.

To solve this problem, runtime code patching based on the detected
speed is a good solution. But that's not easy, it involves lots of
work to modify vairous subsystems such as net, mm, lib and so on.
This can be done step by step.

patch1 introduces RISCV_EFFICIENT_UNALIGNED_ACCESS which depends on
NONPORTABLE, if users know during config time that the kernel will be
only run on those efficient unaligned access hw platforms, they can
enable it. Obviously, generic unified kernel Image should enable it.

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


Jisheng Zhang (2):
  riscv: introduce RISCV_EFFICIENT_UNALIGNED_ACCESS
  riscv: select DCACHE_WORD_ACCESS for efficient unaligned access HW

 arch/riscv/Kconfig                      | 13 +++++++++++
 arch/riscv/include/asm/asm-extable.h    | 15 ++++++++++++
 arch/riscv/include/asm/word-at-a-time.h | 23 ++++++++++++++++++
 arch/riscv/mm/extable.c                 | 31 +++++++++++++++++++++++++
 4 files changed, 82 insertions(+)

-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
