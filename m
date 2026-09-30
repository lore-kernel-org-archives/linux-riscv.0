Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0A9BCA5FB1
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 06:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=N8APxOufzKUmM27Py7pnhl4175QAqfeAYQBRL+Wqx5g=; b=j9cOL/97Sqn3gx
	Wcm8uVMFWs69hl4/rvB7ubK4Qp9vlVprllBnvT+7sIl2Vvslb4G9iL9d2NDVOyPCv9cE165Zr4efw
	DkUAxc07VguXuQ/AYdZOjmpRavlan3HyHAF5QKwsilNAWjgj0AsyV6k14GFuvrhOECJkcuHBh/aH9
	lOIHdbwDMWuEBwBV8NYu4onYY5zpjPN2O8Up/97ENedMFJlS7+kvHqZfN1b9oIn/ocasC52t+iauz
	hp6bEt4vyC6aq/5gjcjP9sCdfYcW9ztAITFhD+eOqHfe0q+aHts3P1Y43tEyMdU6DnJcgJUTzSoVu
	W4yaWl5rD8HWBPW/VuWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBo1F-00000005Ax6-3pxw;
	Wed, 30 Sep 2026 06:42:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBo1E-00000005Avi-0lG4
	for linux-riscv@bombadil.infradead.org;
	Wed, 30 Sep 2026 06:42:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=QMlbnUe0uJ8kguAeVUChkyJK9yEVTbqR1ptw6AU4YHU=; b=epHpoTQZW1ul8pi/y4LJi4CYXg
	dkabeBsA+MMz9Pjjd2JcguovR/dlTke8lpD757eK2VncTPi6q3giOFvwQxfi09fMHBPI5FEBk/lKJ
	Q11y6u7/QLMzyGi5gldzHE0ziJo3N8APXLY1HjsVuMNSLbffoXcJa2XaR9cI5zWhZV4dNTimyOTB1
	MI8H+QFSVOhcH3Ga+REl49bIUTFfGZD90rTofQlywJqh5BI/ItYqtK0mByJJ7MJtERM5VwKs5eCIo
	I4/NMIHCopExOKuRNwrQ+PT6e8ncTj1YAsSGDU67T+V/HlZaFfFbNJ+xn2IUyVWvWKnPsFp3PUCir
	59YnlJNg==;
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBo18-00000003QVr-07HZ
	for linux-riscv@lists.infradead.org;
	Wed, 30 Sep 2026 06:42:18 +0000
Received: from mail.maildlp.com (unknown [172.19.163.177])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4hvlnT1kVkzYQttD
	for <linux-riscv@lists.infradead.org>; Wed, 30 Sep 2026 14:41:33 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id B83FE40A3F
	for <linux-riscv@lists.infradead.org>; Wed, 30 Sep 2026 14:42:01 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP4 (Coremail) with UTF8SMTPA id gCh0CgD3xSg2r7xqwDvcCA--.7693S2;
	Wed, 30 Sep 2026 14:42:00 +0800 (CST)
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
	Pu Lehui <pulehui@huawei.com>,
	Pu Lehui <pulehui@huaweicloud.com>
Subject: [PATCH bpf-next v2 0/4] riscv, bpf: Prepare for upcoming daily CI
Date: Wed, 30 Sep 2026 06:46:03 +0000
Message-Id: <20260930064607.1908864-1-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: gCh0CgD3xSg2r7xqwDvcCA--.7693S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZw4ruw4kKFy8XFWUZFy8Grg_yoW5Jw47pF
	WrGr15ur95Wr1aq39Fk3yUZFW8Kr4kCr13Cw1kGw15Ar90gFW0qrn29rWYqFZxCFyDW3ya
	ya4agrnY9w18ZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Y14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
	0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
	zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
	4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
	CwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCT
	nIWIevJa73UjIFyTuYvjTRNJ5oDUUUU
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_074215_209665_BE99CCEB 
X-CRM114-Status: UNSURE (   9.64  )
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
previous patches [1-3] and some are in progress [4], the remaining ones
are handled in this series.

To catch regressions promptly and close this long-standing riscv bpf CI
gap, the riscv-bpf-daily project [5] is introduced here. With the
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
[4] https://lore.kernel.org/bpf/20260722140015.1982158-1-varunrmallya@gmail.com
[5] https://github.com/pulehui/riscv-bpf-daily

v2:
- Change test value in setget_sockopt to avoid quantization error.
- Drop path modify in d_path testcase as will mount /dev/shm in rootfs.

v1: https://lore.kernel.org/bpf/20260929083924.1851840-1-pulehui@huaweicloud.com

Kumar Kartikeya Dwivedi (1):
  bpf, riscv: Fix stack-passed arguments for indirect trampolines

Pu Lehui (3):
  selftests/bpf: Avoid jiffies quantization error in setget_sockopt
  selftests/bpf: Update qemu config for riscv64 in vmtest.sh
  selftests/bpf: Update DENYLIST.riscv64

 arch/riscv/net/bpf_jit_comp64.c                    | 14 ++++++++++----
 tools/testing/selftests/bpf/DENYLIST.riscv64       |  1 +
 tools/testing/selftests/bpf/progs/setget_sockopt.c |  4 ++--
 tools/testing/selftests/bpf/vmtest.sh              |  4 ++--
 4 files changed, 15 insertions(+), 8 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
