Return-Path: <SRS0=kAis=I5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 344B4C433B4
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Mar 2021 16:30:26 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 781436100C
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Mar 2021 16:30:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 781436100C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RcaWc7mFyOFtkCrwdxwtOzjD1hWarD4Ipcd87cqssUA=; b=OApa7LrGpMrbT/naCpY45w0MjZ
	djL5kZPJ+yVmqJonh5BZMilmKMBIWSw3G/KBbeyGqBl+oaxrqKne6AeHut8CZHAaaErn3U0ogTdg/
	Uw+f4Z/7kEragrpBdlbgWwNQeARXWnWaEGixb1gJ2D1yTCr97P3wOpHE2YjpsFLHpcSuDK5YndNCZ
	XFFBDf4UQ69c0yeYH3yXHwMUVR1wqhgKKnqG2Fq+Giom/dU3O0VernO9NqrJ/rmd8m+vmRKP9PsLc
	3LQ7Bh8IghISR9zT+6/AKO4iLq2m/vd7HGntfdbNHaBNRW0hOfTKURBHM0uaoGzLHmbvGwWkqdUmC
	A67fRGzQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRdjK-0076Ad-BR; Wed, 31 Mar 2021 16:30:07 +0000
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lRdjG-007683-3m
 for linux-riscv@lists.infradead.org; Wed, 31 Mar 2021 16:30:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=Z3YZthlfu0euTQ+THZUZPW+nmkMWZoVGbwK6weVz8AM=; b=R4LfprXFW3i0K
 GptS5/OFjr6eLUHAE6s8vZbnUgb14w+ptj6+vYza2lLNR3WpJ4o94RcE0PAAQBoP
 7Gh7wmQSXN7Dl1hOzM/dgihYO8DzXZ+QpToMVDDPnx046TTrnBj0EV7Q9C5KGS2v
 o12cva7cBbiVTKM41ifd+wi+FC0kKs=
Received: from xhacker (unknown [101.86.19.180])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygDX30tzo2RgObt6AA--.16468S2; 
 Thu, 01 Apr 2021 00:29:39 +0800 (CST)
Date: Thu, 1 Apr 2021 00:24:42 +0800
From: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt 
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Andrey Ryabinin 
 <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, Andrey 
 Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, " 
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=" <bjorn@kernel.org>, Alexei Starovoitov 
 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko 
 <andrii@kernel.org>, Song Liu  <songliubraving@fb.com>, Yonghong Song
 <yhs@fb.com>, John Fastabend  <john.fastabend@gmail.com>, KP Singh
 <kpsingh@kernel.org>, Luke Nelson  <luke.r.nels@gmail.com>, Xi Wang
 <xi.wang@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, netdev@vger.kernel.org, bpf@vger.kernel.org
Subject: [PATCH v2 0/9] riscv: improve self-protection
Message-ID: <20210401002442.2fe56b88@xhacker>
MIME-Version: 1.0
X-CM-TRANSID: LkAmygDX30tzo2RgObt6AA--.16468S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KFyxKrykur15Xw4rZrW5Jrb_yoW8WFy7pr
 s0kry5ZrWF9r93C3Way34kur1rJwsYg34agr45C34rJw4aqFWUAwnYqwn0qr1DXFy0gFnY
 kF15u34Ykw18Z37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkCb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4
 vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40E
 FcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr
 0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY
 04v7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
 0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y
 0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
 W8JVWxJwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8
 JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU2vPfDU
 UUU
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_173003_233464_9F3F9163 
X-CRM114-Status: UNSURE (   8.67  )
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

From: Jisheng Zhang <jszhang@kernel.org>

patch1 is a trivial improvement patch to move some functions to .init
section

Then following patches improve self-protection by:

Marking some variables __ro_after_init
Constifing some variables
Enabling ARCH_HAS_STRICT_MODULE_RWX


Since v1:
  - no need to move bpf_jit_alloc_exec() and bpf_jit_free_exec() to core
    because RV32 uses the default module_alloc() for jit code which also
    meets W^X after patch8
  - fix a build error caused by local debug code clean up

Jisheng Zhang (9):
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
 arch/riscv/kernel/module.c         | 10 ++++++++--
 arch/riscv/kernel/probes/kprobes.c |  8 ++++++++
 arch/riscv/kernel/sbi.c            | 10 +++++-----
 arch/riscv/kernel/smp.c            |  6 +++---
 arch/riscv/kernel/syscall_table.c  |  2 +-
 arch/riscv/kernel/time.c           |  2 +-
 arch/riscv/kernel/traps.c          |  2 +-
 arch/riscv/kernel/vdso.c           |  4 ++--
 arch/riscv/mm/init.c               | 12 ++++++------
 arch/riscv/mm/kasan_init.c         |  6 +++---
 arch/riscv/mm/ptdump.c             |  2 +-
 arch/riscv/net/bpf_jit_comp64.c    |  2 +-
 arch/riscv/net/bpf_jit_core.c      |  1 +
 16 files changed, 45 insertions(+), 29 deletions(-)

-- 
2.31.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
