Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B5F5CD1280
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2024 13:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Z5d9NtoGzjHFeRd9PVxl/FXcFHjXtD0YWegWjuHtTwg=; b=zfnt0pE055U3eO
	x9/zcE98Mrzq2DJrlOujV+6pNlybEOunhpFpQNzcraVBuIESz8cyD6A0bmnJokiFdrUwOkcrtobKC
	z7pNTy/iu14+QaixwJGAPHYZqsSAhUyRDOQxHeUyIEzPRiMvouGTtx3fpmDk8SCMzqLMcvyZ37HGz
	SaqsrlNiE2pj9hmhTOT9sIyHURqt1dVbr0nW+MMnQigM3WK+9l0R85uPFSaFJVfPNOlYJ+pXDdTZQ
	oklSl7oFCY0S4f2tJ5VOU/u69fF2RH4P1CKHFD+6zrsDUy33J0xMBuWDTWVgTj0Wimqh9ztDnTTOr
	l+LHdBNo5ZZbEzHfu6yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rppSo-0000000E2Sz-2lJN;
	Thu, 28 Mar 2024 13:06:38 +0000
Received: from [45.249.212.51] (helo=dggsgout11.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rppSk-0000000E2Rl-20y0
	for linux-riscv@lists.infradead.org;
	Thu, 28 Mar 2024 13:06:36 +0000
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4V53Gw4RfMz4f3mHF
	for <linux-riscv@lists.infradead.org>; Thu, 28 Mar 2024 20:47:52 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id C68451A0172
	for <linux-riscv@lists.infradead.org>; Thu, 28 Mar 2024 20:48:00 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP2 (Coremail) with SMTP id Syh0CgAnlQj+ZgVmTvYNIg--.31354S2;
	Thu, 28 Mar 2024 20:47:59 +0800 (CST)
From: Pu Lehui <pulehui@huaweicloud.com>
To: bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yhs@fb.com>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Mykola Lysenko <mykolal@fb.com>,
	Manu Bretelle <chantr4@gmail.com>,
	Pu Lehui <pulehui@huawei.com>,
	Pu Lehui <pulehui@huaweicloud.com>
Subject: [PATCH bpf-next 0/5] Support local vmtest for riscv64
Date: Thu, 28 Mar 2024 12:49:11 +0000
Message-Id: <20240328124916.293173-1-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: Syh0CgAnlQj+ZgVmTvYNIg--.31354S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kr47tr13tr43CryxGFyDZFb_yoW8AFWkpa
	y8Gw1Ykry0gF13tr17CrWUWFWfXFs5Zr43Gw18Xry5ZFyDtrWkJrn2kF4SqwnxurZ8Xrs0
	ya4SgF15uw18ZwUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvY14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4
	xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5
	MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I
	0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v2
	6r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0J
	UQvtAUUUUU=
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_060634_923748_7F3AD4FA 
X-CRM114-Status: UNSURE (   6.32  )
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

Patch 1 is to enable cross platform testing for local vmtest. The
remaining patch adds local vmtest support for riscv64. It relies on
commit [0] [1] for better regression.

We can now perform cross platform testing for riscv64 bpf using the
following command:

PLATFORM=riscv64 CROSS_COMPILE=riscv64-linux-gnu- \
    tools/testing/selftests/bpf/vmtest.sh -- \
        ./test_progs -d \
            \"$(cat tools/testing/selftests/bpf/DENYLIST.riscv64 \
                | cut -d'#' -f1 \
                | sed -e 's/^[[:space:]]*//' \
                      -e 's/[[:space:]]*$//' \
                | tr -s '\n' ','\
            )\"

The test platform is x86_64 architecture, and the versions of relevant
components are as follows:
    QEMU: 8.2.0
    CLANG: 17.0.6 (align to BPF CI)
    OpenSBI: 1.3.1 (default by QEMU)
    ROOTFS: ubuntu jammy (generated by [2])

Link: https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git/commit/?id=ea6873118493 [0]
Link: https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git/commit/?id=443574b033876c85 [1]
Link: https://github.com/libbpf/ci/blob/main/rootfs/mkrootfs_debian.sh [2]

Pu Lehui (5):
  selftests/bpf: Enable cross platform testing for local vmtest
  riscv, bpf: Relax restrictions on Zbb instructions
  selftests/bpf: Add config.riscv64
  selftests/bpf: Add DENYLIST.riscv64
  selftests/bpf: Add riscv64 configurations to local vmtest

 arch/riscv/net/bpf_jit.h                     |  2 +-
 tools/testing/selftests/bpf/DENYLIST.riscv64 |  5 ++
 tools/testing/selftests/bpf/config.riscv64   | 85 ++++++++++++++++++++
 tools/testing/selftests/bpf/vmtest.sh        | 48 ++++++++---
 4 files changed, 127 insertions(+), 13 deletions(-)
 create mode 100644 tools/testing/selftests/bpf/DENYLIST.riscv64
 create mode 100644 tools/testing/selftests/bpf/config.riscv64

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
