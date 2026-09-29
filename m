Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E2ECCA5FB1
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 08:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pgbKK2sqnBdhApIaDLd7aA2gP479+bCXbGtI4HLgPeY=; b=zsClvgLF07EYwg
	qh4QqapkpEZyBELicZ0jycVMisGw5jqCgMputwDyL8fVEbUcUtaEXKjLtcv4HYakjDI6tx2PIEZ90
	O92OHXPa+7LgSpG0rqL6Sijq0vptq1w1Chp6vY9MVTNqN4oRnMYg2dcKUJVawQqHA/+9k45Hq3nKZ
	XMFZoEfnzBWv22jyqd3aG6PexG7lyC9cv7zBASgMXusXmDFZBkCDyMjSAJhRpFl0Nb6290JV1tsC1
	kfwgrjFGb5KUvHnoHVeCfmwGz6Q8uSw6BL6zKbc9ys79J2CHtOvcdqNVKZzsfGKHL+F9VFC3v7EeL
	Z8XN+12ENszs0i8JSL3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTJE-00000002nFh-1ENa;
	Tue, 29 Sep 2026 08:35:32 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTJA-00000002nCR-2pba
	for linux-riscv@lists.infradead.org;
	Tue, 29 Sep 2026 08:35:30 +0000
Received: from mail.maildlp.com (unknown [172.19.163.170])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4hvBLT4s3kzKHMY6
	for <linux-riscv@lists.infradead.org>; Tue, 29 Sep 2026 16:34:41 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 17F7840571
	for <linux-riscv@lists.infradead.org>; Tue, 29 Sep 2026 16:35:17 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP4 (Coremail) with UTF8SMTPA id gCh0CgBXdShEeLtqhxloCA--.42471S2;
	Tue, 29 Sep 2026 16:35:16 +0800 (CST)
From: Pu Lehui <pulehui@huaweicloud.com>
To: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Puranjay Mohan <puranjay@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Pu Lehui <pulehui@huawei.com>
Subject: [PATCH bpf-next 0/5] riscv, bpf: Prepare for upcoming daily CI
Date: Tue, 29 Sep 2026 08:39:19 +0000
Message-Id: <20260929083924.1851840-1-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: gCh0CgBXdShEeLtqhxloCA--.42471S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kr4kZr4DAF17tFW8JF4xWFg_yoW8tFy5pa
	95Gr1jyr95Xr13tay293yUurW8XF4kCr13Cw1kGwn8AryqgFW0qFn2k3ySqF9xCryDXr4a
	yasIgrnY9w18ZaDanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvIb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7
	CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8C
	rVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4
	IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY1x02
	62kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s
	026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_
	GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20x
	vEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE
	14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf
	9x07j7l19UUUUU=
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_013529_015627_5E1E0B49 
X-CRM114-Status: UNSURE (   7.65  )
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

From: Pu Lehui <pulehui@huawei.com>

For some time, bpf selftests on riscv64 have suffered from several
silent breakages and test failures. These mainly stemmed from changes
such as riscv ftrace atomic patching [0], qemu pmu behavior changes, and
environment mismatches. While some issues have already been addressed in
previous patches [1-3], the remaining ones are handled in this series.

To catch regressions promptly and close this long-standing riscv bpf CI
gap, the riscv-bpf-daily project [4] is introduced here. With the
assistance of LLMs, putting together this automated workflow was fairly
straightforward. The pipeline pulls the latest bpf-next branch daily,
executes both test_progs and test_verifier, and automatically creates
github issues with brief failure descriptions and sends notifications
when failures occur. It has been running smoothly for over a week and
has already proven its value by catching some real jit bugs.

To pave the way for riscv-bpf-daily, this patchset addresses the
remaining fixes, test adaptations, and environment dependencies.

[0] https://lore.kernel.org/all/20250407180838.42877-5-andybnac@gmail.com/
[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2820d227ad4e
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f2aaa6215910
[3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c7e617552938
[4] https://github.com/pulehui/riscv-bpf-daily

Kumar Kartikeya Dwivedi (1):
  bpf, riscv: Fix stack-passed arguments for indirect trampolines

Pu Lehui (4):
  selftests/bpf: Set CONFIG_HZ_100 for riscv64
  selftests/bpf: Use /tmp for temporary file in d_path
  selftests/bpf: Update qemu config for riscv64 in vmtest.sh
  selftests/bpf: Update DENYLIST.riscv64

 arch/riscv/net/bpf_jit_comp64.c                 | 14 ++++++++++----
 tools/testing/selftests/bpf/DENYLIST.riscv64    |  2 ++
 tools/testing/selftests/bpf/config.riscv64      |  1 +
 tools/testing/selftests/bpf/prog_tests/d_path.c |  2 +-
 tools/testing/selftests/bpf/vmtest.sh           |  4 ++--
 5 files changed, 16 insertions(+), 7 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
