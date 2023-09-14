Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE33EEE0212
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 02:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uLz9DZI1sfR0JmVtd37rsmwl59t829EndfOOIIk8KcI=; b=htPyJGW5wnYSgM
	6GONVICIzl8WrYwkO2DFINt6eE4x3o/5jj0qn+bthLY4o99QhyASw50BI/2PRzbwp0/q+BLSVvs6+
	LSEXusBKO6BU0a3CUQVrwsH2PC5wK7CndQ4hyDuM1zeGDEu7Dz3qk2mDe36dCaDQVrgf5mKMMFX+Y
	2oECMn/VQ9JVGKNJksq/zQiru96DVeH1AGp/nL4H0jhel38HqWTa3MM7QKhTvrH+R9wt/F1XgDQ5P
	ZZk5iP2WmgQPO8ufoqOoLoKrc9Y7Xz1Addyu1oPcuzK16Txd1PyA7hFE9Etz/Nk5Og79vmhkUNnzQ
	nfnDZyx9HrNPd3dhCJxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgbhX-0079AX-38;
	Thu, 14 Sep 2023 02:03:27 +0000
Received: from bg2.exmail.qq.com ([114.132.197.227])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgbhS-00797W-0I
	for linux-riscv@lists.infradead.org;
	Thu, 14 Sep 2023 02:03:26 +0000
X-QQ-mid: bizesmtp69t1694656877tkm2a5m8
Received: from localhost.localdomain ( [221.226.144.218])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 14 Sep 2023 10:01:14 +0800 (CST)
X-QQ-SSF: 01200000000000B0B000000A0000000
X-QQ-FEAT: bGXn9C6ahgSFte9kYhPmrslHZ6ZrQ+TnZx/ZE2jZlE4PHgLAwcln8WNX1+A1c
	C1vyx8Oc6uEVovocZqkT/MoY5qndYu4a3nXAuvHwIkpMYiG9X0AAbsoREF3pkmuVmZrqd8L
	uNTQf8tW/tMk0GWnAXrtgwUQYTJt95HkP+Xa3Gg0h8/htQEIs+TVLjB/lsHmh60DgcS4vVZ
	jdVdz1AVhprtauD5HgZbMWMhSm3yhlXzeX6QutZRtSojm2nZx9CFyRcTrPjERlyXUhTmLxa
	hUSuj4w9Nhsmm6+gsKn/evcMHtsgh7wqkNQKHuCmDBwb9Twfk0VMqUDF10BgCRGj7IvClFT
	oMPLmf1R2iasSXKV8QMAzN6zznWKw==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 930282796024689414
From: Song Shuai <songshuaishuai@tinylab.org>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	lihuafei1@huawei.com,
	conor.dooley@microchip.com,
	liaochang1@huawei.com,
	guoren@kernel.org,
	ajones@ventanamicro.com,
	alexghiti@rivosinc.com,
	evan@rivosinc.com,
	sunilvl@ventanamicro.com,
	xianting.tian@linux.alibaba.com,
	samitolvanen@google.com,
	masahiroy@kernel.org,
	apatel@ventanamicro.com,
	jszhang@kernel.org,
	duwe@suse.de,
	eric.devolder@oracle.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Song Shuai <songshuaishuai@tinylab.org>
Subject: [PATCH 0/2] riscv: kexec_file: Support loading Image binary file
Date: Thu, 14 Sep 2023 10:00:42 +0800
Message-Id: <20230914020044.1397356-1-songshuaishuai@tinylab.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz4a-0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_190322_471862_8A2F520A 
X-CRM114-Status: UNSURE (   9.03  )
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

Hi,

This series makes the kexec_file_load() syscall support to load Image binary file.
At the same time, corresponding support for kexec-tools had been pushed to my repo[1].

Now, we can leverage that kexec-tools and this series to use the
kexec_load() or kexec_file_load() syscall to boot both vmlinux 
and Image file, as seen in these combo tests:

```
1. kexec -l vmlinux [other options] // or boot paniced kernel with -p
2. kexec -l Image
3. kexec -s -l vmlinux
4. kexec -s -l Image
```

Though all of the aforementioned tests had been passed in my RV64 Qemu-virt, 
it should be noted that tests 3 and 4 should be the emphasis for the current series.

[1]: https://github.com/sugarfillet/kexec-tools/commits/rv-Image

Song Shuai (2):
  riscv: kexec_file: Split the loading of kernel and others
  riscv: kexec_file: Support loading Image binary file

 arch/riscv/include/asm/image.h         |   2 +
 arch/riscv/include/asm/kexec.h         |   6 +
 arch/riscv/kernel/Makefile             |   2 +-
 arch/riscv/kernel/elf_kexec.c          | 469 -------------------------
 arch/riscv/kernel/kexec_elf.c          | 147 ++++++++
 arch/riscv/kernel/kexec_image.c        |  97 +++++
 arch/riscv/kernel/machine_kexec_file.c |   8 +
 7 files changed, 261 insertions(+), 470 deletions(-)
 delete mode 100644 arch/riscv/kernel/elf_kexec.c
 create mode 100644 arch/riscv/kernel/kexec_elf.c
 create mode 100644 arch/riscv/kernel/kexec_image.c

-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
