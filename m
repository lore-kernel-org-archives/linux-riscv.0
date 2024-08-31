Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA375CD1293
	for <linux-riscv@archiver.kernel.org>; Sat, 31 Aug 2024 04:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OdceXCJ3h8vgLOmW5looJN8aSSkynDl4k2SETFdVmYU=; b=Sq9Sikx6WbfSfx
	EnFnxZXzS1kOxElwIfcpXCobBDem+P7lrs0l7V6B6EzbJniUzyJSE3Nl8tnzcJ8gfqPB7AdYESA+P
	ZPeYFbCZds0NB635cwdjVDP9tNvoZrJRKwvjWTJYrm7AUKKbrxkc5xBqZqdf2D8F4jFxBs1I0OIiV
	Ig9VwxDTYTGIthjGYjrvMuW9FblCEGpywQRgL1Menay8fkHPBZTYZEuD7g+2WSrMZG4Q01qWuCSiA
	Ts9ze6tfQMINVAGfHwFqgcVECgNdN7SLGqF0+q3kbhD+6YU5BmiLAR99zo4EGe3RDbQLz/vaKdd08
	+IsLIs3+94KJrJDPk05w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skFXq-00000008UoT-3tMt;
	Sat, 31 Aug 2024 04:17:02 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skFXm-00000008UmL-3qtd
	for linux-riscv@lists.infradead.org;
	Sat, 31 Aug 2024 04:17:01 +0000
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4WwhY64pKPz4f3jkJ
	for <linux-riscv@lists.infradead.org>; Sat, 31 Aug 2024 12:16:42 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id BF8561A14EE
	for <linux-riscv@lists.infradead.org>; Sat, 31 Aug 2024 12:16:52 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP2 (Coremail) with SMTP id Syh0CgBnT74ymdJmoSHHDA--.65422S2;
	Sat, 31 Aug 2024 12:16:51 +0800 (CST)
From: Pu Lehui <pulehui@huaweicloud.com>
To: bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org,
	Andrii Nakryiko <andrii@kernel.org>
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Puranjay Mohan <puranjay@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Pu Lehui <pulehui@huawei.com>
Subject: [PATCH bpf-next v3 0/4] Fix accessing first syscall argument on RV64
Date: Sat, 31 Aug 2024 04:19:30 +0000
Message-Id: <20240831041934.1629216-1-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: Syh0CgBnT74ymdJmoSHHDA--.65422S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKr1xAr4xGry8Wr4DWr1UGFg_yoWkZrcEkw
	42yr93JrWrCrZxtF4fWr15CrWDK3yUJF18GF4DtrWfCw1xAr97XFsY9r90yas8Wa10gFZx
	Ga9rX34FvrnIvjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbIxYFVCjjxCrM7AC8VAFwI0_Xr0_Wr1l1xkIjI8I6I8E6xAIw20E
	Y4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwV
	A0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x02
	67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
	0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAa
	w2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxV
	Aqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a
	6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6x
	kF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AK
	xVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa
	7IU0s2-5UUUUU==
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_211659_237513_93409DC3 
X-CRM114-Status: UNSURE (   4.31  )
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

On RV64, as Ilya mentioned before [0], the first syscall parameter should be
accessed through orig_a0 (see arch/riscv64/include/asm/syscall.h),
otherwise it will cause selftests like bpf_syscall_macro, vmlinux,
test_lsm, etc. to fail on RV64.

Link: https://lore.kernel.org/bpf/20220209021745.2215452-1-iii@linux.ibm.com [0]

v3:
- Fix test case error.

v2: https://lore.kernel.org/all/20240831023646.1558629-1-pulehui@huaweicloud.com/
- Access first syscall argument with CO-RE direct read. (Andrii)

v1: https://lore.kernel.org/all/20240829133453.882259-1-pulehui@huaweicloud.com/

Pu Lehui (4):
  libbpf: Access first syscall argument with CO-RE direct read on s390
  libbpf: Access first syscall argument with CO-RE direct read on arm64
  selftests/bpf: Enable test_bpf_syscall_macro:syscall_arg1 on s390 and
    arm64
  libbpf: Fix accessing first syscall argument on RV64

 tools/lib/bpf/bpf_tracing.h                     | 17 ++++++++++++-----
 .../bpf/prog_tests/test_bpf_syscall_macro.c     |  4 ----
 .../selftests/bpf/progs/bpf_syscall_macro.c     |  2 --
 3 files changed, 12 insertions(+), 11 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
