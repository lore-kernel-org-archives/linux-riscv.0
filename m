Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 780BDCD4850
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Sep 2024 14:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0L90jXZLGsqkSBXteey4yVLTtKMxRIFGySTZvzbdu0I=; b=jbRTXqYci8FrUT
	YRaDp3r8c+9f7bOnzGZ8/afTtQSYdzCs5EtvIrzcoiqsyb9JnGHeWAnuJZxdWfh40K65vQxh4f1Ii
	nT0C0mbPOzzsS49ghuPzL60I0gBzE2ZVVUhTYTSjTrZ5dMgtQimucRTGHSTstOlvfpWchXBhwF6LR
	xcF3DSCEgW6aia7Xn17rdt9iuB2P4jnGUCmTk+Gu+9V0cttU4ouNIvr3hNlrMUw7/3+ItdiFeow2w
	6ld/2jK+WOQHmJnadjW9Nx03+3l8LyDEXXEwmIHx8pcbgdtkTVxBSAfN15hJXVmAyClz/cfmG6oRC
	fJe9DNfb3wv4fxHb8QfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slqpA-00000004je2-2qAT;
	Wed, 04 Sep 2024 14:17:32 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slqp0-00000004jUo-0ztX
	for linux-riscv@lists.infradead.org;
	Wed, 04 Sep 2024 14:17:26 +0000
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4WzPgn363Sz4f3jcm
	for <linux-riscv@lists.infradead.org>; Wed,  4 Sep 2024 22:16:53 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id 716541A1338
	for <linux-riscv@lists.infradead.org>; Wed,  4 Sep 2024 22:17:08 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP3 (Coremail) with SMTP id _Ch0CgBnvIjfa9hmXCB4AQ--.21574S2;
	Wed, 04 Sep 2024 22:17:04 +0800 (CST)
From: Pu Lehui <pulehui@huaweicloud.com>
To: bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org
Cc: Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Mykola Lysenko <mykolal@fb.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Puranjay Mohan <puranjay@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Pu Lehui <pulehui@huawei.com>
Subject: [PATCH bpf-next v2 00/10] Local vmtest enhancement and RV64 enabled
Date: Wed,  4 Sep 2024 14:19:41 +0000
Message-Id: <20240904141951.1139090-1-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: _Ch0CgBnvIjfa9hmXCB4AQ--.21574S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGryfJFWUtw1ftr4xZFW5Wrg_yoW5AF4fpa
	y8Gw1Ykr1SqF13tFnrCrWUWF1ftF4kZrW3Cw1xJw15A3WDtFyktrs29F4rXwnxWF95Xr4r
	A3s2kFy3u3W8Z37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUv2b4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0E
	n4kS14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I
	0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8
	ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcV
	CY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAF
	wI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa
	7IU0s2-5UUUUU==
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_071722_935172_94B528B6 
X-CRM114-Status: UNSURE (   8.86  )
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

Patch 1-3 fix some problem about bpf selftests. Patch 4 add local rootfs
image support for vmtest. Patch 5 enable cross-platform testing for
vmtest. Patch 6-10 enable vmtest on RV64.

We can now perform cross platform testing for riscv64 bpf using the
following command:

PLATFORM=riscv64 CROSS_COMPILE=riscv64-linux-gnu- \
  tools/testing/selftests/bpf/vmtest.sh \
  -l <path of local rootfs image> -- \
  ./test_progs -d \
      \"$(cat tools/testing/selftests/bpf/DENYLIST.riscv64 \
          | cut -d'#' -f1 \
          | sed -e 's/^[[:space:]]*//' \
                -e 's/[[:space:]]*$//' \
          | tr -s '\n' ',' \
      )\"

For better regression, we rely on commit [0] [1]. And since the work of riscv
ftrace to remove stop_machine atomic replacement is in progress, we also
need to revert commit [2] [3].

The test platform is x86_64 architecture, and the versions of relevant
components are as follows:
    QEMU: 8.2.0
    CLANG: 17.0.6 (align to BPF CI)
    ROOTFS: ubuntu noble (generated by [4])

Link: https://lore.kernel.org/all/20240831071520.1630360-1-pulehui@huaweicloud.com/ [0]
Link: https://lore.kernel.org/all/20240831041934.1629216-1-pulehui@huaweicloud.com/ [1]
Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=3308172276db [2]
Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=7caa9765465f [3]
Link: https://github.com/libbpf/ci/blob/main/rootfs/mkrootfs_debian.sh [4]

v2:
- Drop patch about relaxing Zbb insns restrictions.
- Add local rootfs image support
- Add description about running vmtest on RV64 
- Fix some problem about bpf selftests

v1: https://lore.kernel.org/all/20240328124916.293173-1-pulehui@huaweicloud.com/

Pu Lehui (10):
  selftests/bpf: Adapt OUTPUT appending logic to lower versions of Make
  selftests/bpf: Rename fallback in bpf_dctcp to avoid naming conflict
  selftests/bpf: Disable feature-llvm for vmtest
  selftests/bpf: Limit URLS parsing logic to actual scope in vmtest
  selftests/bpf: Support local rootfs image for vmtest
  selftests/bpf: Enable cross platform testing for vmtest
  selftests/bpf: Add config.riscv64
  selftests/bpf: Add DENYLIST.riscv64
  selftests/bpf: Add riscv64 configurations to local vmtest
  selftests/bpf: Add description for running vmtest on RV64

 tools/testing/selftests/bpf/DENYLIST.riscv64  |   3 +
 tools/testing/selftests/bpf/Makefile          |   8 ++
 tools/testing/selftests/bpf/README.rst        |  32 ++++-
 tools/testing/selftests/bpf/config.riscv64    |  84 ++++++++++++++
 .../selftests/bpf/prog_tests/bpf_tcp_ca.c     |   2 +-
 tools/testing/selftests/bpf/progs/bpf_dctcp.c |   8 +-
 tools/testing/selftests/bpf/vmtest.sh         | 109 ++++++++++++------
 7 files changed, 205 insertions(+), 41 deletions(-)
 create mode 100644 tools/testing/selftests/bpf/DENYLIST.riscv64
 create mode 100644 tools/testing/selftests/bpf/config.riscv64

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
