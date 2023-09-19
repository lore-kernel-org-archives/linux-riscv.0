Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A12EBCD37B4
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Sep 2023 03:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zIHaDkfHuC/KGSCIBfpVZEE6WxdP4xdDyxCTkyF2ue8=; b=taU7ZK+tjrlkvG
	k1K+ru4IGMnxktmmr5i5QaQFXXcFE4iZ6iFiUD8ePsVMcD0Dd6PBrlj8T+gKOMtCOi9YwKcRKEr/X
	4gVI+o04rRQAy82YxYYqTdAe2xFdEXr5qb62EPdk9aFP+eVYUK6+PhjH3dc4+Io86Q1yK3SB1YzHY
	tFbryiEucL1/SA9q8yX+/rLyDHg40OjjSKLPUxHGr31Ck26TLOxQORaq8qDPFPh6Z/uRC49fzeVE7
	xJPtl0tubK1KAmoR+Z+FDdIfyVAsVI4ji1+yYsXwjkLMjOzVvvuilVoK+Xa7TOqtFE7QMGkt7+0Qf
	HYtiiW7xia4WJ2JvIteA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiRsm-00GsDj-1K;
	Tue, 19 Sep 2023 03:58:40 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiRse-00Gs6m-1m
	for linux-riscv@lists.infradead.org;
	Tue, 19 Sep 2023 03:58:35 +0000
Received: from mail02.huawei.com (unknown [172.30.67.143])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4RqSZB3LnPz4f3lVT
	for <linux-riscv@lists.infradead.org>; Tue, 19 Sep 2023 11:58:26 +0800 (CST)
Received: from localhost.localdomain (unknown [10.67.175.61])
	by APP4 (Coremail) with SMTP id gCh0CgBn_t1hHAll2JRXAw--.51929S2;
	Tue, 19 Sep 2023 11:58:25 +0800 (CST)
From: Pu Lehui <pulehui@huaweicloud.com>
To: bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
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
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor@kernel.org>,
	Luke Nelson <luke.r.nels@gmail.com>,
	Pu Lehui <pulehui@huawei.com>,
	Pu Lehui <pulehui@huaweicloud.com>
Subject: [PATCH bpf-next v2 0/6] Zbb support and code simplification for RV64 JIT
Date: Tue, 19 Sep 2023 11:58:33 +0800
Message-Id: <20230919035839.3297328-1-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: gCh0CgBn_t1hHAll2JRXAw--.51929S2
X-Coremail-Antispam: 1UD129KBjvdXoWruF13Xr4UZw17Zw13Cw1kAFb_yoWkCFbE9F
	WxXFyxGry5tFy3tasxG3WktFWkC3ykJFyUWFn8tF47uFnxXr1kt3s5KrZFv348Zay8Zr13
	Xw1DAFyIyrnI9jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbI8FF20E14v26ryj6rWUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
	0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_Wryl
	IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxV
	AFwI0_Gr1j6F4UJwCI42IY6xAIw20EY4v20xvaj40_Zr0_Wr1UMIIF0xvEx4A2jsIE14v2
	6r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvj
	fUF0eHDUUUU
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_205832_809717_D5270860 
X-CRM114-Status: UNSURE (   5.31  )
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

Add Zbb support [0] to optimize code size and performance of RV64 JIT.
Meanwhile, adjust the code for unification and simplification. Tests
test_bpf.ko and test_verifier have passed, as well as the relative
testcases of test_progs*.

Link: https://github.com/riscv/riscv-bitmanip/releases/download/1.0.0/bitmanip-1.0.0-38-g865e7a7.pdf [0]

v2:
- Add runtime detection for Zbb instructions. (Conor Dooley)
- Correct formatting issues detected by checkpatch. (Simon Horman)

v1:
https://lore.kernel.org/bpf/20230913153413.1446068-1-pulehui@huaweicloud.com/

Pu Lehui (6):
  riscv, bpf: Unify 32-bit sign-extension to emit_sextw
  riscv, bpf: Unify 32-bit zero-extension to emit_zextw
  riscv, bpf: Simplify sext and zext logics in branch instructions
  riscv, bpf: Add necessary Zbb instructions
  riscv, bpf: Optimize sign-extention mov insns with Zbb support
  riscv, bpf: Optimize bswap insns with Zbb support

 arch/riscv/net/bpf_jit.h        | 124 +++++++++++++++++++
 arch/riscv/net/bpf_jit_comp64.c | 213 +++++++++++---------------------
 2 files changed, 195 insertions(+), 142 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
