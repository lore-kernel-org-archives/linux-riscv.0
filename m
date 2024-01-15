Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D8F7C47DA2
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 13:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=16QZo4rzo3RQj6hHh2Cu6WkPTX44ao4LB3gMwEsF5mQ=; b=Qlc2OS1Ouk5oZC
	+d/9trvemGsyWTiCOsbE8F1V+kI6hY/1h2dwJUO11oG1NkxVFV9WV1M/vij1C9D0/As/wWy2gj3Cq
	iEr6OswVwKS7DtWe8N5DNVNV7d4QN7WB0nHgh6Uwn8J/6ly7DLWisBCNHiqXudht+sYDik060G0Ml
	OWPy4HvWFLGXofenmgym4Seaq3Gsula7zzUi6iJ4PoBV+cRdPgVRJcdxIwr9Mom9IjSWD5SdXVPki
	obDEjYSFkxSkbb/iWHuQKXg36bdzNldzTuryXXKMqGCpATH9oU5F22xytcjToVvN68e5k5mH9sufM
	/umFmu5a10oyKmom89pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPMlJ-0091In-2V;
	Mon, 15 Jan 2024 13:12:21 +0000
Received: from [45.249.212.56] (helo=dggsgout12.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPMlC-0091Dn-2U
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jan 2024 13:12:18 +0000
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4TDCGX0X6Sz4f3knk
	for <linux-riscv@lists.infradead.org>; Mon, 15 Jan 2024 21:12:04 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id BBFEC1A0CB2
	for <linux-riscv@lists.infradead.org>; Mon, 15 Jan 2024 21:12:07 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP4 (Coremail) with SMTP id gCh0CgBnu20iL6VlSeWtAw--.15591S2;
	Mon, 15 Jan 2024 21:12:03 +0800 (CST)
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
Subject: [PATCH RESEND bpf-next v3 0/6] Zbb support and code simplification for RV64 JIT
Date: Mon, 15 Jan 2024 13:12:29 +0000
Message-Id: <20240115131235.2914289-1-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: gCh0CgBnu20iL6VlSeWtAw--.15591S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Ww4xJFy3CFyfZry8GF4DArb_yoW8Jw4Dpa
	93Ary3Gr1rtr1fXwsayw17Gr1rKF4Fqr13Jry2qw18AF42vFyFkFyFgw4Fyas8GFZ3WryU
	Zr9rtF13G3WjvaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvY14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
	0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_Wryl
	IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxV
	AFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE14v2
	6r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0J
	Ul-eOUUUUU=
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_051215_124014_7CB08240 
X-CRM114-Status: UNSURE (   4.55  )
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

v3 resend:
- resend for mail be treated as spam.

v3:
- Change to early-exit code style and make code more explicit.

v2: https://lore.kernel.org/bpf/20230919035839.3297328-1-pulehui@huaweicloud.com
- Add runtime detection for Zbb instructions.
- Correct formatting issues detected by checkpatch.

v1: https://lore.kernel.org/bpf/20230913153413.1446068-1-pulehui@huaweicloud.com

Pu Lehui (6):
  riscv, bpf: Unify 32-bit sign-extension to emit_sextw
  riscv, bpf: Unify 32-bit zero-extension to emit_zextw
  riscv, bpf: Simplify sext and zext logics in branch instructions
  riscv, bpf: Add necessary Zbb instructions
  riscv, bpf: Optimize sign-extention mov insns with Zbb support
  riscv, bpf: Optimize bswap insns with Zbb support

 arch/riscv/net/bpf_jit.h        | 134 ++++++++++++++++++++
 arch/riscv/net/bpf_jit_comp64.c | 210 +++++++++++---------------------
 2 files changed, 205 insertions(+), 139 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
