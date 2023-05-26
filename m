Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA04C77B73
	for <linux-riscv@archiver.kernel.org>; Fri, 26 May 2023 13:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K4IA3Yx+/f3pQRyoi6U82+SO80+qG9NRvYm+DgxPnS0=; b=usHb3WoEdgarG/
	lJ2Dc7bZmYW1seMgC9ksLcYSa7q47GFBrzwIQeZTQ8gqvYT0qtmjjwd/ljWOnb9rDDwRScNqk6mIj
	0zV5M+yOJUqPfqEHCtyQSq/GxVvhUXrFVHeqXo2NEPYm09Lwol5Glv6RPEFj0fC/CFiDNRBrvW4+b
	OsJJLkOh6qVCLrd8xM6uHFA4YDYPRVBzbOp2oyO+Lh5nBYHz4G//OQbbhkr2cqyGCLi5Ov4F6fk5S
	Rs0Muo3tKA3sqNvR+KNwf62BaeHVDSxaWqrSU8cv/muvvZ/gmMIRxJ2+3hVhZh8VrCjOlhV/0bzBy
	PoOKm9jLFAa8mj3IXgkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2XeZ-002fJc-19;
	Fri, 26 May 2023 13:38:47 +0000
Received: from bg4.exmail.qq.com ([43.155.65.254])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2XeV-002fI4-0Y
	for linux-riscv@lists.infradead.org;
	Fri, 26 May 2023 13:38:45 +0000
X-QQ-mid: bizesmtp66t1685108306txlguqb4
Received: from linux-lab-host.localdomain ( [119.123.130.80])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 26 May 2023 21:38:25 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: D6RqbDSxuq6HnLLie3EOSagOrtQovMoO/c1ZDojJdhdkswrEDfVNTEkUj0kwK
	lL0kA4K1R0ac0uzzRVCeWqKdDuUszTc4QMmQRhfY8GatL4fQhlXKCss68nOUn67913VG7mF
	6g0HwKkHxQbjKdBP54BZX7IWEOVmxqArgAquJLmDkN1gUtxJqb7Mce1XtwBLxjaz223a1/8
	lS2USjspSMnYcZQnJIa0lk4R5fYl+toH0r3XL3iA4dTRmsd3GrqAa59N6NJVYnO6jDGNJBJ
	49it71G2yoeckv05RPq+XKAm7C8YmMGi60Q4daIC6bDhHCF+7SBMDMh5n5YtbJc/yQkih32
	/kS05+mflHkytfSp5XZIYkQSCbpz6BzQTLpwWlBxrf/qCseFCT7OU/GrpJgCQiAHbfVrYaT
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10011161400852395735
From: Zhangjin Wu <falcon@tinylab.org>
To: conor.dooley@microchip.com
Cc: falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	thomas@t-8ch.de,
	w@1wt.eu
Subject: Re: [PATCH 06/13] selftests/nolibc: allow specify a bios for qemu
Date: Fri, 26 May 2023 21:38:25 +0800
Message-Id: <20230526133825.198100-1-falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230526-clover-litter-1f41398cd820@wendy>
References: <20230526-clover-litter-1f41398cd820@wendy>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_063843_508067_17E7B15D 
X-CRM114-Status: GOOD (  19.69  )
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

Hi, Conor.

> 
> On Fri, May 26, 2023 at 06:25:18PM +0800, Zhangjin Wu wrote:
> 
> > > On 2023-05-25 01:52:29+0800, Zhangjin Wu wrote:
> > > > riscv qemu has a builtin bios (opensbi), but it may not match the latest
> > > > kernel and some old versions may hang during boot, let's allow user pass
> > > > a newer version to qemu via the -bios option.
> > >
> > > Nitpick:
> > >
> > > This seems very specific and hopefully only necessary temporarily.
> > >
> >
> > RISC-V is such a new ISA and the Spec (especially the SBI) changes very
> > frequently ;-)
> 
> Huh. Could you please expand on which versions of QEMU will hang while
> booting an upstream or stable kernel? Which kernels would be good to
> know too.
> 

As the cover letter listed (in the Environment section), the softwares we
used are:

    // higher qemu version is better, latest version is v8.0.0+
    $ qemu-system-riscv64  --version
    QEMU emulator version 4.2.1 (Debian 1:4.2-3ubuntu6.18)
    Copyright (c) 2003-2019 Fabrice Bellard and the QEMU Project developers

    // opensbi version, higher is better, must match kernel version and qemu version
    // rv64: used version is 1.2, latest is 1.2
    $ head -2 /labs/linux-lab/src/linux-stable/tools/testing/selftests/nolibc/run.out | tail -1
    OpenSBI v1.2-116-g7919530
    // rv32: used version is v0.9, latest is 1.2
    $ head -2 /labs/linux-lab/src/linux-stable/tools/testing/selftests/nolibc/run.out | tail -1
    OpenSBI v0.9-152-g754d511

The kernel version is the one this patchset based on (Willy's nolibc
repo), it is v6.4-rc1.

qemu v4.2.1 is the one systematically installed (/usr/bin) from the
qemu-system-misc package and used to test this patchset in my Ubuntu
20.04 based test docker image.

Just installed a v7.0.0 qemu from ppa:canonical-server/server-backports,
there is no default opensbi, and re-checked, there is one prebuilt
opensbi for rv64, but still no prebuilt opensbi for rv32.

    $ sudo add-apt-repository ppa:canonical-server/server-backports
    $ sudo apt install qemu-system-misc

    $ sudo apt install opensbi
    $ dpkg -S opensbi | grep -E "fw_*bin|elf"
    qemu-system-data: /usr/share/qemu/opensbi-riscv64-generic-fw_dynamic.elf
    opensbi: /usr/lib/riscv64-linux-gnu/opensbi/generic/fw_dynamic.elf
    opensbi: /usr/lib/riscv64-linux-gnu/opensbi/generic/fw_jump.elf

    $ qemu-system-riscv32 -display none -no-reboot -kernel build/riscv32/virt/linux/v6.4-rc1/arch/riscv/boot/Image -serial stdio -M virt -append "console=ttyS0 panic=-1"
    qemu-system-riscv32: Unable to load the RISC-V firmware "opensbi-riscv32-generic-fw_dynamic.bin"

I used the one built myself, If not want to build such opensbi manually,
we can download one (1.2 currently) from qemu source code:

    https://gitlab.com/qemu-project/qemu/-/blob/master/pc-bios/opensbi-riscv32-generic-fw_dynamic.bin

Then, we can use it like this:

    $ qemu-system-riscv32 -display none -no-reboot -kernel build/riscv32/virt/linux/v6.4-rc1/arch/riscv/boot/Image -serial stdio -M virt -append "console=ttyS0 panic=-1" -bios /path/to/opensbi-riscv32-generic-fw_dynamic.bin

Will append this extra info in the commit message of the coming new
revision of this patch, thanks a lot.

The hang issue I mentioned may be using one of my older prebuilt version of
opensbi, I can not find which one it exactly is, so, please ignore that info,
will update that description too.

Btw, something not about this patch: qemu v8.0.0 seems not boot non-mmu
v6.3, both sides have issues, not dig into it carefully, so, not report
it yet.

Thanks,
Zhangjin

> Thanks,
> Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
