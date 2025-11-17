Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62807CCD19A
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Nov 2025 03:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:References:
	In-Reply-To:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a+rlu2LhUbkzOx+ndASSpUa0zpHM1IABkf2aWBb4/gg=; b=WmDV+Iavw2JIUM
	lsy5zwYukqN/Qd6Po1Rx+fPevUWwVj+Yc04aRc5SybYYMvJOM8LS9CNAiQaj2XJj/Xx2RVVhB4xWo
	rVsnkOxaF72qLS3dHtXUy/E67tjdDR4VF31XhvQTXyCrbPbGVqDDjJXWgldUi/BsHlMU8qqtkgS1d
	Dd6SRFxATy6s6IgTTh771FdNqjMCtu5oxx7W3KwJT1f0k4gYB9YLp20MiWckLvBlALS8rE/bXSKc0
	U6tjSSkwAX3pgFO0dfkgVZmrovpaMqiSlGWuPVxqJmkalzuPs9Oh9xLm12R6sc0MoMvkaFEndBFJc
	DX73aezZGy8PdSBvPQuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKpXi-0000000FLVX-2Ruw;
	Mon, 17 Nov 2025 03:04:38 +0000
Received: from smtp20.cstnet.cn ([159.226.251.20] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKpXe-0000000FLUm-189G
	for linux-riscv@lists.infradead.org;
	Mon, 17 Nov 2025 03:04:36 +0000
Received: from xujiakai2025$iscas.ac.cn ( [210.73.43.101] ) by
 ajax-webmail-APP-10 (Coremail) ; Mon, 17 Nov 2025 11:03:52 +0800
 (GMT+08:00)
X-Originating-IP: [210.73.43.101]
Date: Mon, 17 Nov 2025 11:03:52 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: "Jiakai Xu" <xujiakai2025@iscas.ac.cn>
To: "Paul Walmsley" <pjw@kernel.org>
Cc: "Nathan Chancellor" <nathan@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, 
	"Alexandre Ghiti" <alex@ghiti.fr>, namcao@linutronix.de
Subject: Re: Re: [PATCH] riscv: fix KUnit test_kprobes crash when building
 with Clang
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.1-cmXT5 build
 20240627(e6c6db66) Copyright (c) 2002-2025 www.mailtech.cn cnic.cn
In-Reply-To: <621798fc-68bc-504c-755f-0a2f1f83d1c2@kernel.org>
References: <738dd4e2.ff73.19a7cd7b4d5.Coremail.xujiakai2025@iscas.ac.cn>
 <621798fc-68bc-504c-755f-0a2f1f83d1c2@kernel.org>
MIME-Version: 1.0
Message-ID: <108ac2f0.17c6b.19a8fc4d1ca.Coremail.xujiakai2025@iscas.ac.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: tACowABXQOiYkBppMXkCAA--.27770W
X-CM-SenderInfo: 50xmxthndljiysv6x2xfdvhtffof0/1tbiCREJCWkag782sgABsS
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWDJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_190434_670728_439962A1 
X-CRM114-Status: GOOD (  10.06  )
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

Hello Paul,

Thank you very much for reviewing my patch; your feedback was very helpful.


&gt; Thanks for the patch.  Have you reported this difference in behavior to 
&gt; the Clang/LLVM folks so they can render an opinion on it?  We can consider 
&gt; this as a short term workaround if it's indeed a toolchain issue, but I'd 
&gt; like to hear from the LLVM folks.

I have reported this issue to the LLVM community:
https://github.com/llvm/llvm-project/issues/168308
We now need to wait for feedback from the LLVM community.

&gt; 
&gt; Also: could you please include the narrative from your page 
&gt; 
&gt;     https://github.com/j1akai/temp/blob/main/20251113/readme.md 
&gt; 
&gt; in the patch description, just in case that URL eventually becomes 
&gt; unavailable?

Below, I include the narrative from my readme for reference:

---
Kernel:
https://git.kernel.org/pub/scm/linux/kernel/git/snapshot/linux-riscv-for-linus-6.18-rc6.tar.gz

Configuration: 
https://github.com/j1akai/temp/blob/main/20251113/config.log

LLVM:
https://github.com/llvm/llvm-project/releases/download/llvmorg-21.1.5/LLVM-21.1.5-Linux-X64.tar.xz

When booting the kernel in QEMU, the error was traced to:
`arch/riscv/kernel/tests/kprobes`. Log:
https://github.com/j1akai/temp/blob/main/20251113/report0.log

Specifically, in the file `arch/riscv/kernel/tests/kprobes/test-kprobes.c`,
the following line fails:

```c
kp = kcalloc(num_kprobe, sizeof(*kp), GFP_KERNEL);
```

I added debugging output:

```c
while (test_kprobes_addresses[num_kprobe]) {
    pr_info("addr[%d] = %px\n", num_kprobe,
            test_kprobes_addresses[num_kprobe]);
    num_kprobe++;
}
pr_info("num_kprobe=%u\n", num_kprobe);
```

This revealed that the length of the `test_kprobes_addresses` array is
abnormally large. See:
https://github.com/j1akai/temp/blob/main/20251113/vm.log

According to the file `arch/riscv/kernel/tests/kprobes/test-kprobes-asm.S`,
only 25 entries should be inserted into `test_kprobes_addresses`. Therefore,
the array should not be this long.

When compiling the kernel with GCC, the kernel boots correctly. This indicates
that the issue is specific to Clang: Clang misaligns the arrays or generates
symbols incorrectly, causing `test_kprobes_addresses` to appear much larger than
it actually is, even containing invalid addresses. Consequently, the loop

```c
while(test_kprobes_addresses[num_kprobe])
```

overestimates `num_kprobe`, and `kcalloc` tries to allocate an excessively
large memory block.

The solution is to explicitly apply `.align 3` (8-byte alignment) to both
`test_kprobes_addresses` and `test_kprobes_functions`, place them in `.rodata`,
and declare the symbols as global using `.globl` to ensure consistent behavior
between Clang and GCC.

---

I would like to ask whether it is appropriate to 
include all this detail directly in the patch description and email, 
or if it would be better to submit it as a PATCH v1.

Thank you again for your guidance.

- Jiaki Xu
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
