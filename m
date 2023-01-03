Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6523C3DA7D
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jan 2023 09:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=axZNA2lgivuRxqouJhDpVNKLYl3Nvx/H1pbZmNyq2U8=; b=Vo2i8uvUgZBofZ
	oJB9NfCrEQBua+AywwMvFdcOTVJ5hcBwdRD/y55FQq8kjjzOqbUB0wiJB7Hl6ZAB3NoMsvnx59AWJ
	rfFN17bpVkmrWDkUqnsY4maZRVrejIirFjdZtHjTudexjbJpBS0G02RzU3Lfto4/B43aDKnH1vCQK
	X6tkipua5xVr6aCQFE9QthVNQfhvABSxwStwQDwxG6JYqYWwE5D/wqBe1uQLJIjLqeJJ4aC0aVOC9
	OhH92xxldy7zMV63bvUhldNOiP3rCc4jvKyE8iT6mG6Sf/pKIemtjI2oGZhINjPNC/EIvN+HKD8BJ
	MB4PdMMOQTJiTXavHe9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCdJU-000PWu-TG; Tue, 03 Jan 2023 09:10:28 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCdFu-000Osj-J6
	for linux-riscv@lists.infradead.org; Tue, 03 Jan 2023 09:06:49 +0000
Received: from mail02.huawei.com (unknown [172.30.67.153])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4NmRgC1nfsz4f3v6l
	for <linux-riscv@lists.infradead.org>; Tue,  3 Jan 2023 17:06:31 +0800 (CST)
Received: from localhost.localdomain (unknown [10.67.175.61])
	by APP4 (Coremail) with SMTP id gCh0CgAn3bAV8LNj9H0UBA--.54080S2;
	Tue, 03 Jan 2023 17:06:30 +0800 (CST)
From: Pu Lehui <pulehui@huaweicloud.com>
To: bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Luke Nelson <luke.r.nels@gmail.com>,
	Xi Wang <xi.wang@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yhs@fb.com>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Pu Lehui <pulehui@huawei.com>,
	Pu Lehui <pulehui@huaweicloud.com>
Subject: [RFC PATCH bpf-next v2 0/4] Support bpf trampoline for RV64
Date: Tue,  3 Jan 2023 17:07:52 +0800
Message-Id: <20230103090756.1993820-1-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: gCh0CgAn3bAV8LNj9H0UBA--.54080S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tw17GrWfJw4xAF4fArWDurg_yoW8GFyDpa
	yFkry3CFyDXF9rJwnIqa1UZa1Fvw4kX3W5Gw13J3yrCanxXry7Ar1Yga15t3s5CFyfZw1U
	twn0qF4jkas8Aa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
	6r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0J
	UQvtAUUUUU=
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_010647_017595_F1D954A4 
X-CRM114-Status: UNSURE (   8.15  )
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

BPF trampoline is the critical infrastructure of the bpf
subsystem, acting as a mediator between kernel functions
and BPF programs. Numerous important features, such as
using ebpf program for zero overhead kernel introspection,
rely on this key component. We can't wait to support bpf
trampoline on RV64. The implementation of bpf trampoline
was closely to x86 and arm64 for future development.

As most of riscv cpu support unaligned memory accesses,
we temporarily use patch [1] to facilitate testing. The
test results are as follow, and test_verifier with no
new failure ceses.

- fexit_test:OK
- fentry_test:OK
- fentry_fexit:OK
- fexit_stress:OK
- fexit_bpf2bpf:OK
- xdp_bpf2bpf:OK
- dummy_st_ops:OK
- modify_return:OK
- trampoline_count:OK
- get_func_ip_test:OK
- get_func_args_test:OK

[1] https://lore.kernel.org/linux-riscv/20210916130855.4054926-2-chenhuang5@huawei.com/

v2:
- rebase for bpf-next tree.

Pu Lehui (4):
  bpf: Rollback to text_poke when arch not supported ftrace direct call
  riscv, bpf: Factor out emit_call for kernel and bpf context
  riscv, bpf: Add bpf_arch_text_poke support for RV64
  riscv, bpf: Add bpf trampoline support for RV64

 arch/riscv/net/bpf_jit.h        |   5 +
 arch/riscv/net/bpf_jit_comp64.c | 483 ++++++++++++++++++++++++++++++--
 kernel/bpf/trampoline.c         |   8 +-
 3 files changed, 471 insertions(+), 25 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
