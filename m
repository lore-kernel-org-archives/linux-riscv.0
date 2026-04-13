Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38869F34C4B
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Apr 2026 12:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1FEUBGIkbHlK2IVMDAXbRz0LqN5Hkjy7REEJFNve8NM=; b=i2gPMK5CQuv+aVK35HAD+wrEl3
	5Q15cfjd4gTj8HggB9WfJWidoqVqgwNS98LODJ5V3XBFlyxFg1grZXJ74qfAVZvAZ/oU7AIJ2mWit
	Hep8W6gmwL0tsTr4jAk5TLv9ulO0Lo6FtXc42AqBN+jB1qQrs+hIrHiyWtzJjcdgZPxgIAI5ZfJIl
	eOGi3+4T2MwJuxgSLMB4Qy47+gILgl+Hr9N+PUYUo2lBNGhSlhMG4TEbn+jUIK5IEvk9GazW9apRB
	lqvXIBhgAGnpzNToWvO7XgXrW6V0v6YdbSVLQZmht6s4LpPa4CdySHAUhyFvuTrb7d7w6UVoPST/i
	Vkon8RdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCGP4-0000000FdoW-20rn;
	Mon, 13 Apr 2026 12:28:34 +0000
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCGOz-0000000Fdn6-2Fil
	for linux-riscv@lists.infradead.org;
	Mon, 13 Apr 2026 12:28:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1776083301; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=wYII3Ksz2fg1G45RMgbv8mkA1HCfi+jV7DWNQ4c4WQM=;
	b=Vv6ZXiO+U0sGUH+o50XT1yOc5SrVGheiSefoAkmCjr20yfOWKbDrubZrqV9z0xOW2/yeXMGz7VDhJThQboM7lhAoxLpKxVRun5J4GdJ6bQTCt6hJLGqRSqH8A8l687nsNn2Vurez4p1tXKcLG0lEg6ZYvYZCrBfNurHHVdr19EI=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0X0wlKvf_1776083296;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0X0wlKvf_1776083296 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 13 Apr 2026 20:28:20 +0800
From: cp0613@linux.alibaba.com
To: ruanjinjie@huawei.com
Cc: akpm@linux-foundation.org,
	alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org
Subject: Re: [PATCH] arch/riscv: Add bitrev.h file to support rev8 and brev8
Date: Mon, 13 Apr 2026 20:28:08 +0800
Message-ID: <20260413122817.122787-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <150bfb90-ec49-7209-b841-2e48ca12b370@huawei.com>
References: <150bfb90-ec49-7209-b841-2e48ca12b370@huawei.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_052830_157175_17DBD5F5 
X-CRM114-Status: GOOD (  20.84  )
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
Content-Type: multipart/mixed; boundary="===============2688071700121980344=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2688071700121980344==
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

On Sat, 11 Apr 2026 10:48:17 +0800, ruanjinjie@huawei.com wrote:

> >> +#include <linux/types.h>
> >> +#include <asm/cpufeature-macros.h>
> >> +#include <asm/hwcap.h>
> >> +
> >> +extern u8 const byte_rev_table[256];
> >> +static __always_inline __attribute_const__ u32 __arch_bitrev32(u32 x)
> >> +{
> >> + if (IS_ENABLED(CONFIG_RISCV_ISA_ZBKB) &&
> >> +     riscv_has_extension_likely(RISCV_ISA_EXT_ZBKB)) {
> >> +  unsigned long result = x;
> >> +
> >> +  asm volatile(
> >> +   ".option push\n"
> >> +   ".option arch,+zbkb\n"
> >> +   "rev8 %0, %0\n"
> >> +   "brev8 %0, %0\n"
> >> +   ".option pop"
> >> +   : "+r" (result)
> >> +  );
> >> +
> >> +  if (__riscv_xlen == 64)
> >> +   return (u32)(result >> 32);
> >> +
> >> +  return (u32)result;
> >> + }
> >> +
> >> + return (u32)byte_rev_table[x & 0xff] << 24 |
> >> +        (u32)byte_rev_table[(x >> 8) & 0xff] << 16 |
> >> +        (u32)byte_rev_table[(x >> 16) & 0xff] << 8 |
> >> +        (u32)byte_rev_table[x >> 24];
> >> +}
> > 
> > Hi Jinjie,
> > 
> > Thanks for your patch. I have two suggestions.
> > 1. When ZBKB is not supported, is it simpler to directly use the generic
> > implementation __bitrev32 in <linux/bitrev.h>.
> 
> Actually, you can't simply use the default implementation from
> linux/bitrev.h. It includes asm/bitrev.h (the architecture-specific
> implementation), which would lead to compilation issues. Furthermore,
> when ZBKB is not supported, current implementation is identical to the
> default one.

Understood. So, have you considered renaming the function to `generic_xxx`,
like `generic___ffs` in bitops?

> > 2. Could you please provide a benchmark test case to illustrate the
> > performance comparison with and without this extension (refer to
> > test_bitops.c) and also provide the results by bloat-o-meter.
> 
> I don't have access to RISC-V hardware at the moment, so I've only
> performed basic functional testing on QEMU, which completed without
> issues，could you please help run some benchmarks to verify the performance?

I don't currently have the hardware that supports the corresponding extension,
but I can test it using an FPGA environment when I have the opportunity (it
will take some time).

> Thanks,
> Jinjie
> 
> > 
> > Thanks,
> > Pei

Thanks,
Pei


--===============2688071700121980344==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2688071700121980344==--
