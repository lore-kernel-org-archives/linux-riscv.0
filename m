Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4028ACD5BA3
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Sep 2024 09:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Cy+ltjrn3egaLqKD6wKgTZYFvKA3HVRknFgHM847I9k=; b=Mc4sQ2TSy3xZ6L
	5rNPArhhITBEoFWRaXi1MQux8CQPTFabt0D1zZHomHvXLO0hMNGfbwdcK6ENVdfhAiUaXN5dQ4uWX
	i1MtOtIFZK+cNCUKxCUOoEhhQY7EZaPixYiYF+gbJLhP0sSS9jm1hurY8hKjiLNwh1zNYuvR6ZWCu
	WZjbvrEQy6S96Sm2aeX3aPDW9mWviHrjsmkQnvqLTGTH0I9c2cVYir5E1Xqp6uWNJ0385ODe6s3Mt
	NJcXPfMR+p+bCX+MeKatKaB6JDBC5iRSdZIzEC+rjMKLSE2+RerTO5xdwGY7iJS6DM96ZdqwMkXna
	cy6u9UWMSzJP0hZ4mkCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm8aw-00000007ihN-1tVc;
	Thu, 05 Sep 2024 09:16:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm7ah-00000007VDn-0hgx
	for linux-riscv@bombadil.infradead.org;
	Thu, 05 Sep 2024 08:11:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=6HZDdAzD8AigIw67+hl5iMVLTrLpxlFgH1lVjxVQbzk=; b=DiJn/5O8l8F2pvpD53iK4P3IE8
	vQL8zqpB+yJJ5dfosROydYtVt+0h+iiAvGZo+jCUSxlAkw0H8imQsXVm9o5tWZBzePRg5cDjzgKvP
	w0gRngfpGmdbRpWaIo2wJdK4YpVrQ6NZ2Hut4a+a64m0Wk1m9GTVAAYE/TVZHjKF6QHg+3lrpvbgk
	neAyXu2y4jecf/R1DPp6nTKYe0hOIbOnY3lUcJpplR6dly0PVcyKUDnyp4z+ODZjhZGfTbUWnJAmI
	wm7b2Pjj7a2whs/YAyJfINg11X5sNNm/MH8MCgiIF9Ty/GtbluLyMm3jabVL1bCvNQDPbh4/Gszsq
	scgM+WTA==;
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sm7ab-00000000QKq-3Zap
	for linux-riscv@lists.infradead.org;
	Thu, 05 Sep 2024 08:11:41 +0000
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4WzsW90FTvz4f3jMl
	for <linux-riscv@lists.infradead.org>; Thu,  5 Sep 2024 16:11:01 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 197E61A0359
	for <linux-riscv@lists.infradead.org>; Thu,  5 Sep 2024 16:11:16 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP1 (Coremail) with SMTP id cCh0CgD3Ii+gZ9lmMQ7AAQ--.26932S2;
	Thu, 05 Sep 2024 16:11:13 +0800 (CST)
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
Subject: [PATCH bpf-next v3 00/10] Local vmtest enhancement and RV64 enabled
Date: Thu,  5 Sep 2024 08:13:51 +0000
Message-Id: <20240905081401.1894789-1-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: cCh0CgD3Ii+gZ9lmMQ7AAQ--.26932S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGryfJFykKryfKFyruw13XFb_yoW5CF43pa
	y8Gw1Ykr1SqF13tFnrCrWUWF1SqF4kZrW3Cw18Gw15ZF1DtFyktrn2kF4rZwnxWrZ5Xr4r
	A34IkFyfua18Z37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUv2b4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7Cj
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
X-CRM114-CacheID: sfid-20240905_091138_954417_B736D0A0 
X-CRM114-Status: UNSURE (   8.38  )
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

For better regression, we rely on commit [0]. And since the work of riscv
ftrace to remove stop_machine atomic replacement is in progress, we also
need to revert commit [1] [2].

The test platform is x86_64 architecture, and the versions of relevant
components are as follows:
    QEMU: 8.2.0
    CLANG: 17.0.6 (align to BPF CI)
    ROOTFS: ubuntu noble (generated by [3])

Link: https://lore.kernel.org/all/20240831071520.1630360-1-pulehui@huaweicloud.com/ [0]
Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=3308172276db [1]
Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=7caa9765465f [2]
Link: https://github.com/libbpf/ci/blob/main/rootfs/mkrootfs_debian.sh [3]

v3:
- Use llvm static linking when detecting that feature-llvm is enabled
- Add Acked-by by Eduard

v2: https://lore.kernel.org/all/20240904141951.1139090-1-pulehui@huaweicloud.com/
- Drop patch about relaxing Zbb insns restrictions.
- Add local rootfs image support
- Add description about running vmtest on RV64 
- Fix some problem about bpf selftests

v1: https://lore.kernel.org/all/20240328124916.293173-1-pulehui@huaweicloud.com/

Eduard Zingerman (1):
  selftests/bpf: Prefer static linking for LLVM libraries

Pu Lehui (9):
  selftests/bpf: Adapt OUTPUT appending logic to lower versions of Make
  selftests/bpf: Rename fallback in bpf_dctcp to avoid naming conflict
  selftests/bpf: Limit URLS parsing logic to actual scope in vmtest
  selftests/bpf: Support local rootfs image for vmtest
  selftests/bpf: Enable cross platform testing for vmtest
  selftests/bpf: Add config.riscv64
  selftests/bpf: Add DENYLIST.riscv64
  selftests/bpf: Add riscv64 configurations to local vmtest
  selftests/bpf: Add description for running vmtest on RV64

 tools/testing/selftests/bpf/DENYLIST.riscv64  |   3 +
 tools/testing/selftests/bpf/Makefile          |  14 ++-
 tools/testing/selftests/bpf/README.rst        |  32 +++++-
 tools/testing/selftests/bpf/config.riscv64    |  84 ++++++++++++++
 .../selftests/bpf/prog_tests/bpf_tcp_ca.c     |   2 +-
 tools/testing/selftests/bpf/progs/bpf_dctcp.c |   8 +-
 tools/testing/selftests/bpf/vmtest.sh         | 107 ++++++++++++------
 7 files changed, 205 insertions(+), 45 deletions(-)
 create mode 100644 tools/testing/selftests/bpf/DENYLIST.riscv64
 create mode 100644 tools/testing/selftests/bpf/config.riscv64

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
