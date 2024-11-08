Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C083AD64060
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Nov 2024 16:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:References:
	In-Reply-To:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=efw6NSvLrPkaA7VJNwB5ISohwEd+DN0wx1OSTLcU6e8=; b=DtoTzn/mluLntz
	JHGuQqb3P14gkPFQbqc2Hiez2atb1p0xc83mQyl+LiFCmU0RaNqQZxJpnylP59otHDaVQ7luX67Gg
	Tgj/TqMZBo7rvKmiPTpGQqaaVgnjFFSe4hNrIMATrDNj6d4Yq3WeGSo+JphHGk+8zWOzjhFFxolwM
	CS9QQOUKu07Tqu0mUQb5jD2nhGyosSf9gKP9lYt7D9i+vUR89UHssSlro/7Eb9AV4MIhMIrqsvuTf
	QR+FhOHhM1m4EzmHY6d/K4gW5xmg93taf8kGfMiF/eXVLK5Hh4HCT4rCezEF0TRXxV50PRirvmzl3
	Dr+XkPJFYkMCNYpDCTRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Rtt-0000000BDLY-3oA5;
	Fri, 08 Nov 2024 16:31:57 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Qvj-0000000B1jP-1fqH;
	Fri, 08 Nov 2024 15:29:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=iQMcJa4BmFPVqKmXobn4cIhRx4UhLAzJDxklpcxlLI8=; b=H
	aUjtcWHDFt1bKqSXkqJGs1dRc5kfURcXD/snEVL02VfzHVmJDJvgfdNFSH25sFJS
	e/QmXTeDXcuNeFVAyRIvkZptmIV0qg/a2iU0Q4ogCM+qEHNRN03W89MpCkKtr4sE
	EYlKvW6V2O6HdedRW0CAf+PWbdmw0x1Jl4G7mFEXQs=
Received: from 00107082$163.com ( [111.35.191.191] ) by
 ajax-webmail-wmsvr-40-148 (Coremail) ; Fri, 8 Nov 2024 23:28:00 +0800 (CST)
X-Originating-IP: [111.35.191.191]
Date: Fri, 8 Nov 2024 23:28:00 +0800 (CST)
From: "David Wang" <00107082@163.com>
To: "Thomas Gleixner" <tglx@linutronix.de>
Cc: richard.henderson@linaro.org, linux@armlinux.org.uk, catalin.marinas@arm.com, 
	will@kernel.org, guoren@kernel.org, chenhuacai@kernel.org, 
	kernel@xen0n.name, James.Bottomley@HansenPartnership.com, 
	deller@gmx.de, mpe@ellerman.id.au, paul.walmsley@sifive.com, 
	ysato@users.sourceforge.jp, dalias@libc.org, 
	glaubitz@physik.fu-berlin.de, davem@davemloft.net, 
	andreas@gaisler.com, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, chris@zankel.net, 
	jcmvbkbc@gmail.com, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org
Subject: Re: [PATCH] kernel/irq/proc: performance: replace seq_printf with
 seq_put_decimal_ull_width
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <87r07lol9y.ffs@tglx>
References: <20241103080552.4787-1-00107082@163.com> <87r07lol9y.ffs@tglx>
X-NTES-SC: AL_Qu2YA/yctk4j5iSfbOkZnEYQheY4XMKyuPkg1YJXOp80uSbP/wc5cnBJEkHY4sOvLTmSvxeqUTR3+8t1RrNYQqbBTxgILkv4stMHL//JBWTB
MIME-Version: 1.0
Message-ID: <3319cd6e.b980.1930c63b1e5.Coremail.00107082@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: lCgvCgD3fwoBLi5nnLAiAA--.7283W
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/1tbiqQKRqmcuF0eQdwACss
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_072948_362857_147A8DB8 
X-CRM114-Status: UNSURE (   6.63  )
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

At 2024-11-08 22:25:13, "Thomas Gleixner" <tglx@linutronix.de> wrote:
>David!
>
>On Sun, Nov 03 2024 at 16:05, David Wang wrote:
>
>$Subject: [PATCH] kernel/irq/proc: performance: ...
>
>That's not a valid subsystem prefix.

copy that~

>
>> seq_printf is costy, when stress reading /proc/interrupts, profiling indicates
>> seq_printf takes about ~47% of show_interrupts samples:
>
>Also please follow the documentation for denoting functions in change
>logs:
>
>https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#function-references-in-changelogs
>

copy that~

>>  arch/alpha/kernel/irq.c     |   8 +--
>>  arch/arm/kernel/smp.c       |   4 +-
>>  arch/arm64/kernel/smp.c     |   3 +-
>>  arch/csky/kernel/smp.c      |   4 +-
>>  arch/loongarch/kernel/smp.c |   2 +-
>>  arch/parisc/kernel/irq.c    |  34 ++++++------
>>  arch/powerpc/kernel/irq.c   |  44 ++++++++--------
>>  arch/riscv/kernel/smp.c     |   3 +-
>>  arch/sh/kernel/irq.c        |   4 +-
>>  arch/sparc/kernel/irq_32.c  |  12 ++---
>>  arch/sparc/kernel/irq_64.c  |   4 +-
>>  arch/x86/kernel/irq.c       | 100 ++++++++++++++++++------------------
>>  arch/xtensa/kernel/irq.c    |   2 +-
>>  arch/xtensa/kernel/smp.c    |   4 +-
>>  kernel/irq/proc.c           |   6 ++-
>
>There is no dependency on these changes. So please split them up into
>seperate patches for core and the individual architectures.an

Thanks for all the review, I will make a patchset for this.
>
>Thanks,
>
>        tglx


David
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
