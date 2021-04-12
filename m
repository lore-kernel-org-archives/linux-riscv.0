Return-Path: <SRS0=xUWo=JJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 711DEC433ED
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Apr 2021 16:17:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C13006121F
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Apr 2021 16:17:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C13006121F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ygUe+kdWYnEwpbqG35ryk/TByisaKxJRctmfb6AB+Lc=; b=ivdep6ocz52LR6+Wt7+1NOzd1s
	qeynnqEPbH43SHSfWj92s9pBgP7obTN6K+klQTrs++c59bKgv09Kimzze+cMR3o3OBq1xspW6gQAO
	z7+eRPfzU7oKS2YTCgnwuYU+GdkZAdLQKj+ev9xU5CEFKAAwsT8lNvQArE2TTgV6pk6cv9pm3QWuC
	EuS4/w1+SMBlmrEc3hEAgkbV5vEUOrHL3D2koNd364djgopqnTqgLhWyc2LRf/3TuynznyP9XPo2d
	g6dzUh70V5lU38Y4HWK8zqcrDMdP2YHvXwvB6nueexyC1BGlfT+uVxWXBhOE0sgd29apYyYu3/fug
	xqZoK+9w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVzFA-007Drc-0S; Mon, 12 Apr 2021 16:16:56 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVzF3-007Dqg-Vv
 for linux-riscv@desiato.infradead.org; Mon, 12 Apr 2021 16:16:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=YpOlDgDwAR8y20H8Gm8o0X6WO1zAuOxCsykTgd3UXC8=; b=0peEa2IDoEkrvEY4dOQTRRYjeN
 MIx6PDGpz+ap4YQxJHFNsJDhCl62gT7LNw8569IWX2iWi06HAO0Y441miT0J/uHNmyuAaOlvM65+U
 LV7ils3WI//dFclXYqOpGE4xw4KG0xmXP93wA3+rWZLxT6W6oKvRSVD03Gukhn83s/e5sYUhkxjik
 56BjpfmVOFuEPB2Ft3YIG2E9nrwKqqjJgJ6ZTyqlXaW+5nMac9quHMRAQcIMUtoTYwnCNcOb0qJmC
 MRoY6BEJ+RjjzUKZL6+HOrpI/WFGOjc2S9i4lQsnTn0ip1bXc5HFuTgNx9V0pJXN35HpSzQrncEvj
 oA1jxUJw==;
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lVzEw-006Nh2-GY
 for linux-riscv@lists.infradead.org; Mon, 12 Apr 2021 16:16:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=YpOlDgDwAR8y20H8Gm8o0X6WO1zAuOxCsykTgd3UXC8=; b=EJwWzfZtxxM/S
 nndp28soJ2TQPlXIHP0kXpjfguAbc+Y6oy4Aw1YilXI9rTJq9ItWkN7kOGF235yq
 xozQ98EhkHDQH0FkJW5SHg2WkXqmA4YtRdjngO4UrueLsxxZWTnc+8v3zweMRjhG
 J0apWXo/zhvDofz2e5hZ2O8QLcpnVE=
Received: from xhacker (unknown [101.86.20.15])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygC3WplUcnRgiTfLAA--.61003S2; 
 Tue, 13 Apr 2021 00:16:20 +0800 (CST)
Date: Tue, 13 Apr 2021 00:11:10 +0800
From: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Andrey Ryabinin
 <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, Andrey
 Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, "
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=" <bjorn@kernel.org>, Alexei Starovoitov
 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, Martin KaFai Lau <kafai@fb.com>, Song Liu
 <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, John Fastabend
 <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Luke Nelson
 <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, Anup Patel
 <anup@brainfault.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 00/10] riscv: improve self-protection
Message-ID: <20210413001110.7209bae6@xhacker>
MIME-Version: 1.0
X-CM-TRANSID: LkAmygC3WplUcnRgiTfLAA--.61003S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KFyxKrykur15Xw4rZrW5Jrb_yoW8urWkpr
 45Cr15urW5Ar93C3Wayrn7ur1rJws5K3yagw43Aw18Aw4avFyjywnYgw4vqryDXFW0g3ZY
 kF13u34Fkr18Z37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkCb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4
 vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40E
 FcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr
 0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY
 04v7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
 0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y
 0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
 W8JVWxJwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8
 JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUg0D7DU
 UUU
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_091643_259660_74E40CB0 
X-CRM114-Status: GOOD (  10.74  )
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

From: Jisheng Zhang <jszhang@kernel.org>

patch1 removes the non-necessary setup_zero_page()
patch2 is a trivial improvement patch to move some functions to .init
section

Then following patches improve self-protection by:

Marking some variables __ro_after_init
Constifing some variables
Enabling ARCH_HAS_STRICT_MODULE_RWX

Hi Anup,

I kept the __init modification to trap_init(), I will cook a trivial
series to provide a __weak but NULL trap_init() implementation in
init/main.c then remove all NULL implementation from all arch.

Thanks

Since v2:
  - collect Reviewed-by tag
  - add one patch to remove unnecessary setup_zero_page()

Since v1:
  - no need to move bpf_jit_alloc_exec() and bpf_jit_free_exec() to core
    because RV32 uses the default module_alloc() for jit code which also
    meets W^X after patch8
  - fix a build error caused by local debug code clean up


Jisheng Zhang (10):
  riscv: mm: Remove setup_zero_page()
  riscv: add __init section marker to some functions
  riscv: Mark some global variables __ro_after_init
  riscv: Constify sys_call_table
  riscv: Constify sbi_ipi_ops
  riscv: kprobes: Implement alloc_insn_page()
  riscv: bpf: Write protect JIT code
  riscv: bpf: Avoid breaking W^X on RV64
  riscv: module: Create module allocations without exec permissions
  riscv: Set ARCH_HAS_STRICT_MODULE_RWX if MMU

 arch/riscv/Kconfig                 |  1 +
 arch/riscv/include/asm/smp.h       |  4 ++--
 arch/riscv/include/asm/syscall.h   |  2 +-
 arch/riscv/kernel/cpufeature.c     |  2 +-
 arch/riscv/kernel/module.c         | 10 ++++++++--
 arch/riscv/kernel/probes/kprobes.c |  8 ++++++++
 arch/riscv/kernel/sbi.c            | 10 +++++-----
 arch/riscv/kernel/smp.c            |  6 +++---
 arch/riscv/kernel/syscall_table.c  |  2 +-
 arch/riscv/kernel/time.c           |  2 +-
 arch/riscv/kernel/traps.c          |  2 +-
 arch/riscv/kernel/vdso.c           |  4 ++--
 arch/riscv/mm/init.c               | 16 +++++-----------
 arch/riscv/mm/kasan_init.c         |  6 +++---
 arch/riscv/mm/ptdump.c             |  2 +-
 arch/riscv/net/bpf_jit_comp64.c    |  2 +-
 arch/riscv/net/bpf_jit_core.c      |  1 +
 17 files changed, 45 insertions(+), 35 deletions(-)

-- 
2.31.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
