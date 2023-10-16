Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31389CDB482
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Oct 2023 09:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PRdKbnSEN1KZ4gzZJyhyIKoFbQtHygnrdJyK4EpkJ1I=; b=VDTWv+hqmmNNtc
	bAUDCPKwWlpePucDZkwi9CJTd6uSUtJsjchAmvtJsoETv7hNGsSmkH4S97d9hA3CQwMmKUEJb4onX
	5wU06R2fyV+W3BY6TV3P03fAicrgbxXuGIrw5glrpQjaPg0rz2gB3jocFr17hIXyKWBKv0Y5sINOV
	GaUtWDFFj+nDLmnNOVn2KWxHsiGDvVSryv/H/kQo8dbd2/qNSAUjyalsGcV5EfLqZF7DBfq6/JYDi
	VtgEPwbtoh7+0+Tum88/qQeESRw48bAJc2XKY/1d7YA8QvSwALwdSJYCYj+PHJUA/+Df5z6BtzmVX
	VjhRSZ4hH9lYBrmUB0Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsJno-008yaK-2v;
	Mon, 16 Oct 2023 09:22:20 +0000
Received: from bg4.exmail.qq.com ([43.155.67.158])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsJnl-008yYt-0I
	for linux-riscv@lists.infradead.org;
	Mon, 16 Oct 2023 09:22:19 +0000
X-QQ-mid: bizesmtp85t1697448051t2qrh9s3
Received: from localhost.localdomain ( [58.240.82.166])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 16 Oct 2023 17:20:49 +0800 (CST)
X-QQ-SSF: 01200000000000B0B000000A0000000
X-QQ-FEAT: +ynUkgUhZJlVc3kFfT+1lBpfK0izFpSoNY1pnrylEBByyYspKiXE/AgA3x7Ls
	yC72wOYrvN3mhA1pzeSi1pVqISzz9CMx4sfMzginYyIsvBnTXdKa6MkD3cmbjEMDP2YAOIP
	PzCE9tIe8ANyTd1+A7kgPRnByublFgi3aqk67Y/pSRz+9/P8jMD0EMKp5MPizV48oZNU+z+
	LWk1S3MIb/cpK9Mrmmbivt2C3Jno/PafxUxwOgoQ68hroRPBjGYoibZUXtz0TZcFJteCmZn
	WXuy1lLz40FSY5NT06iLkuxfd9c5NG5Sy2CzMQdyupSqRSZ8xoRcHiB9l38MOsVtx6/ORxd
	XFWPENX7QYjichTMVx1xTFsEOri2ZKKarEtlYA29kuG+AZ2+6ZTMBcV8btzkA==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2059464602555490170
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
	eric.devolder@oracle.com,
	emil.renner.berthing@canonical.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Song Shuai <songshuaishuai@tinylab.org>
Subject: [PATCH V2 0/2] riscv: kexec_file: Support loading Image binary file
Date: Mon, 16 Oct 2023 17:20:04 +0800
Message-Id: <20231016092006.3347632-1-songshuaishuai@tinylab.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz4a-0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_022217_455421_1D4D951F 
X-CRM114-Status: UNSURE (   9.68  )
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

Changes since V1:
https://lore.kernel.org/linux-riscv/20230914020044.1397356-1-songshuaishuai@tinylab.org/

- Patch1: fix the build error due to the missing functions in machine_kexec_file.c
- Patch2: use FIELD_GET() to get the flags's endianness as Emil proposed
- Cover: update the kexec-tools link as this one[2] which is based on horms/kexec-tools main branch

This series makes the kexec_file_load() syscall support to load Image binary file.
At the same time, corresponding support for kexec-tools had been pushed to my repo[2].

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

~~[1]: https://github.com/sugarfillet/kexec-tools/commits/rv-Image~~
[2]: https://github.com/sugarfillet/kexec-tools/commits/main_rv

Song Shuai (2):
  riscv: kexec_file: Split the loading of kernel and others
  riscv: kexec_file: Support loading Image binary file

 arch/riscv/include/asm/kexec.h         |   6 +
 arch/riscv/kernel/Makefile             |   2 +-
 arch/riscv/kernel/elf_kexec.c          | 469 -------------------------
 arch/riscv/kernel/kexec_elf.c          | 147 ++++++++
 arch/riscv/kernel/kexec_image.c        |  98 ++++++
 arch/riscv/kernel/machine_kexec_file.c | 344 ++++++++++++++++++
 6 files changed, 596 insertions(+), 470 deletions(-)
 delete mode 100644 arch/riscv/kernel/elf_kexec.c
 create mode 100644 arch/riscv/kernel/kexec_elf.c
 create mode 100644 arch/riscv/kernel/kexec_image.c

-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
