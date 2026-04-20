Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D257CF588C2
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Apr 2026 12:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q91wkSoY0kL+ucjGgzyS0pefXr1wjeBRWQFDBhhxRmQ=; b=Qz+8EkTFuvY1Sc
	ltXE4xZz/NT45KAfFXh0EPgrVtqy8IATSh0t3X4SAmdVfkMQxz8FaZasan+JsVRD9G+FHVzf1lbMR
	kH+Jy/H00EOndVdJ+Dij9+YH6K7o9FbrL7aRbUcuDC+rW3Py9N6fkyGNh/8EWWRvcKXogF74mfVZd
	rfpMJOhL+mG8Xi5dNahhlcdj5OxT9KEAx0CCJ0D3oTrhJsk7vaRWBi4Tl7WphGRQjCssIT9lFa1L0
	3N1BEFOJMcbndBxCMqqP2cfLugnaTCtQ2uAI0v/XBalMijOJTCw3rFFoi/ZuiPkrFd75Z0NZNobRE
	aI6e3VMMoiaJ7G9my7Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEnme-00000006snl-2LBX;
	Mon, 20 Apr 2026 12:31:24 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEnmY-00000006sn4-2FAE
	for linux-riscv@lists.infradead.org;
	Mon, 20 Apr 2026 12:31:23 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=vsRgUrnf7fJOqmTMZfqROi6TIW3yoVHHyUrTYkgkC24=;
	b=MZNpiZDR7AGlh6bttuh/Yox6OWkMj/Mu2gxyyjfllnPCEdIUxfP5SCIEw4nupIA0CD/V6hjBo
	wX7NKlDYkq3GhzVv/paiw3Aba0u7sR/IQi0AAJx7cm87H6RY2yYpOUGSg3FJ7tdaAZEAdrfQ7gg
	UrTbuZR+fCWnFQi9lYOKgXY=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4fzl6K05X7zcZyv;
	Mon, 20 Apr 2026 20:24:25 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 787364056D;
	Mon, 20 Apr 2026 20:31:04 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 20 Apr 2026 20:31:03 +0800
Message-ID: <08481a75-c294-4558-93d5-00a013f07010@huawei.com>
Date: Mon, 20 Apr 2026 20:31:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] arch/riscv: Add bitrev.h file to support rev8 and
 brev8
To: David Laight <david.laight.linux@gmail.com>, Yury Norov
	<ynorov@nvidia.com>
CC: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<alex@ghiti.fr>, <yury.norov@gmail.com>, <linux@rasmusvillemoes.dk>,
	<arnd@arndb.de>, <akpm@linux-foundation.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-arch@vger.kernel.org>, <nathan@kernel.org>
References: <20260417093102.3812978-1-ruanjinjie@huawei.com>
 <aeJbH7vfRpPuOGB0@yury> <20260417194259.0c48d7ef@pumpkin>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260417194259.0c48d7ef@pumpkin>
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_053119_715875_DD3BE358 
X-CRM114-Status: GOOD (  16.80  )
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



On 4/18/2026 2:42 AM, David Laight wrote:
> On Fri, 17 Apr 2026 12:09:03 -0400
> Yury Norov <ynorov@nvidia.com> wrote:
> 
>> On Fri, Apr 17, 2026 at 05:31:00PM +0800, Jinjie Ruan wrote:
>>> Add bitrev.h file to support rev8 and brev8 for riscv.
>>>
>>> Tested functionally on riscv64 QEMU with:
>>> 	"-M virt,acpi=on,zbkb=true,zbb=true"
>>>
>>> Changes in v3:
>>> - Fix the build issue by remving the CONFIG_HAVE_ARCH_BITREVERSE macro
>>>   for byte_rev_table.  
>>
>> No arch needs byte_rev_table, except risc-v under a very certain
>> configuration. Please find a better approach that wouldn't bloat
>> random victims' .data section.
> 
> Eh?
> x86 doesn't have a bit-reverse instruction.
> The only arch that 'select HAVE_ARCH_BITREVERSE' are arm64, arm32 (some cpu),
> loongarch and mips (for CPU_MIPSR6).
> 
> I think you mean that no arch that sets CONFIG_HAVE_ARCH_BITREVERSE needs it
> except riscv.
> 
> Could you globally have:
> 	select NEED_BYTE_REV_TABLE if !HAVE_ARCH_BITREVERSE
> and then riscv could also select it?

Thanks, David. I will follow your suggestion to introduce a
NEED_BYTE_REVERSE_TABLE Kconfig option.

This way, byte_rev_table is only compiled when !HAVE_ARCH_BITREVERSE or
when an architecture (like RISC-V) explicitly selects it as a fallback.
This avoids bloating the .data section for architectures that have full
hardware bit-reverse support and don't need the table."

> (And isn't there a method of including files in the build based on
> kconfig options rather than unconditionally compiling it and getting cpp
> to throw the contents away?)

> 
> 	David
> 
>>
>>> - Update the riscv implementation as David suggested.
>>> - Add Reviwed-by.
>>>
>>> Changes in v2:
>>> - Define generic __bitrev8/16/32 for reuse in riscv.
>>>
>>> Jinjie Ruan (2):
>>>   bitops: Define generic __bitrev8/16/32 for reuse
>>>   arch/riscv: Add bitrev.h file to support rev8 and brev8
>>>
>>>  arch/riscv/Kconfig                    |  1 +
>>>  arch/riscv/include/asm/bitrev.h       | 55 +++++++++++++++++++++++++++
>>>  include/asm-generic/bitops/__bitrev.h | 22 +++++++++++
>>>  include/linux/bitrev.h                | 20 ++--------
>>>  lib/bitrev.c                          |  3 --
>>>  5 files changed, 82 insertions(+), 19 deletions(-)
>>>  create mode 100644 arch/riscv/include/asm/bitrev.h
>>>  create mode 100644 include/asm-generic/bitops/__bitrev.h
>>>
>>> -- 
>>> 2.34.1  
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
