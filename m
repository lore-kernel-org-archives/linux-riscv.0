Return-Path: <SRS0=Kh2H=QF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1CFCC43219
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Nov 2021 11:35:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5A7E61B7D
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Nov 2021 11:35:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B5A7E61B7D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=n0z+lX+h72wD6nDrMwPJhMlYtKgYNfkphELip8vzYtI=; b=wvrMp32updwI5T
	1HwzGImiARKLX5aFQixe0eUlqQhFtqBou2Cc+DdT88gDvqG55orWIrZ0nw6VNrZs1roURp+w8UVI8
	ldWSQ0uLJ5sC0UA2EClN2UHCldEDQfBalt7EYkwGash+nmqro6iCfJQkI7Zy3ni7z9oftDwuj7QKm
	XiSEYgcyblLVPkFgAyZF+eND2CESw5JBnjul1pk8/TSudK04LO1dwlGO/h4iOfYFhg7tTGDobO5lD
	1g+G0DrcI+ZQfdeJNficEpWG7h7BMoNlEQYAtSf+qL1EQf1JB2q6fBi0/SEkxAkJVYYk9tlzOjfke
	2a8p4RyjoXyIj7yXwBdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnfhF-007bWQ-2Q; Thu, 18 Nov 2021 11:35:17 +0000
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnfhA-007bTu-5d
 for linux-riscv@lists.infradead.org; Thu, 18 Nov 2021 11:35:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=3qPb/kuMpBeJCwng87X0Eo8wE0IVCGJu3uFW57LRXkY=; b=VST2QYzk/z+mP
 J+yEvXpptTQauJq0ZBm11EBktMrJap4D91g2DwhMeQJtT3njE5ui2DEl1ay5CXVx
 wRjsxwmhBc/2MobsWQPbo2R1fEjKxVoj2oSlKS/XBqHFtPoB+yV/2T0k8tzxzqQc
 G/xYHzG9isb2SUjI3rU7FpkKqcSB+8=
Received: from xhacker (unknown [101.86.18.22])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygBnLsxMOpZhi51cAQ--.6032S2; 
 Thu, 18 Nov 2021 19:34:36 +0800 (CST)
Date: Thu, 18 Nov 2021 19:21:30 +0800
From: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, "=?UTF-8?B?Qmo=?=
 =?UTF-8?B?w7ZybiBUw7ZwZWw=?=" <bjorn@kernel.org>, Alexei Starovoitov
 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, Martin KaFai Lau <kafai@fb.com>, Song Liu
 <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, John Fastabend
 <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Masahiro Yamada
 <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Nick
 Desaulniers <ndesaulniers@google.com>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Tong Tiangen
 <tongtiangen@huawei.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, bpf@vger.kernel.org,
 linux-kbuild@vger.kernel.org
Subject: [PATCH v4 0/12] riscv: switch to relative extable and other
 improvements
Message-ID: <20211118192130.48b8f04c@xhacker>
MIME-Version: 1.0
X-CM-TRANSID: LkAmygBnLsxMOpZhi51cAQ--.6032S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KFyftryDWFWkJF13tw1rtFb_yoW8Kw17pF
 sxCF9xCFZ5Gr97uw4akr109F1rGa1rW345tr1xWr18Aw42vF48twn5t397CFyDJayYqF1I
 9F1Skr1Fkw1UAa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkmb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwV
 C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
 0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
 1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7
 MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
 0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0E
 wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JV
 WxJwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI
 42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU2fMaUUUUU
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211118_033512_696671_005CD6DF 
X-CRM114-Status: UNSURE (   9.55  )
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

Similar as other architectures such as arm64, x86 and so on, use
offsets relative to the exception table entry values rather than
absolute addresses for both the exception locationand the fixup.
And recently, arm64 and x86 remove anonymous out-of-line fixups, we
want to acchieve the same result.

patch1 remove unused macro.

patch2 consolidates the __ex_table construction, it's a great code
clean up even w/o the 2nd patch.

patch3 swith to relative extable.

The remaining patches are inspired by arm64 version. They remove
the anonymous out-of-line fixups for risv.

Since v3:
  - collect Reviewed-by tag for patch2 and patch3
  - add patch1 to remove unused macro
  - add patches to remove anonymous out-of-line fixups

Since v2:
  - directly check R_RISCV_SUB32 in __ex_table instead of adding
    addend_riscv_rela()

Since v1:
  - fix build error for NOMMU case, thank lkp@intel.com


Jisheng Zhang (12):
  riscv: remove unused __cmpxchg_user() macro
  riscv: consolidate __ex_table construction
  riscv: switch to relative exception tables
  riscv: bpf: move rv_bpf_fixup_exception signature to extable.h
  riscv: extable: make fixup_exception() return bool
  riscv: extable: use `ex` for `exception_table_entry`
  riscv: lib: uaccess: fold fixups into body
  riscv: extable: consolidate definitions
  riscv: extable: add `type` and `data` fields
  riscv: add gpr-num.h
  riscv: extable: add a dedicated uaccess handler
  riscv: vmlinux.lds.S|vmlinux-xip.lds.S: remove `.fixup` section

 arch/riscv/include/asm/Kbuild        |   1 -
 arch/riscv/include/asm/asm-extable.h |  65 +++++++++++
 arch/riscv/include/asm/extable.h     |  48 ++++++++
 arch/riscv/include/asm/futex.h       |  30 ++---
 arch/riscv/include/asm/gpr-num.h     |  77 +++++++++++++
 arch/riscv/include/asm/uaccess.h     | 162 ++++-----------------------
 arch/riscv/kernel/vmlinux-xip.lds.S  |   1 -
 arch/riscv/kernel/vmlinux.lds.S      |   3 +-
 arch/riscv/lib/uaccess.S             |  28 +++--
 arch/riscv/mm/extable.c              |  66 ++++++++---
 arch/riscv/net/bpf_jit_comp64.c      |   9 +-
 scripts/mod/modpost.c                |  15 +++
 scripts/sorttable.c                  |   4 +-
 13 files changed, 308 insertions(+), 201 deletions(-)
 create mode 100644 arch/riscv/include/asm/asm-extable.h
 create mode 100644 arch/riscv/include/asm/extable.h
 create mode 100644 arch/riscv/include/asm/gpr-num.h

-- 
2.33.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
