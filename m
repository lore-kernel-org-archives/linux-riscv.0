Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECB9DC04A68
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Jul 2022 10:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ULOX1PP8FnlQZWjs+z51aqA9rWy9Hl3iTUwkI1LF0L4=; b=a+WaZDsg0WYifM
	B2SGX3+QgEvokh8oaiIhDejBuqz6KpFvqGluWUsP2zENEjKsxKdPCen+AYiqqwrU8zI8sFJhpA9PI
	sVFAmGBC7QiwS4tgPViHASVTQBnrAMI8cYIzqMuGDFriJEcjuslRYpumPlQremCVGtYmFeag62suf
	Ep5xbUFbEtPcYsFpeG7B002FRfUbedkhVPiXSa/+RA8qbf9+SbwSf8YBSqnvks3rwS6wNu7aGkSZF
	RypCb6HVvCqU3Kqclh9NIWVK0f3cM/cL9e5MZX9/2sfIstISiexhW35LboDVO/eHrxSkCp1T0PH05
	+UZd45PHD1Ta1yT5K1QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGe1k-00CEE7-9v; Wed, 27 Jul 2022 10:12:28 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGe1g-00CE7k-NR
	for linux-riscv@lists.infradead.org; Wed, 27 Jul 2022 10:12:27 +0000
Received: from cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net ([86.15.83.122] helo=[192.168.0.17])
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1oGe1X-0065Nk-78; Wed, 27 Jul 2022 11:12:15 +0100
Message-ID: <20a94c3c-85ed-2227-458e-60c780fd4ad7@codethink.co.uk>
Date: Wed, 27 Jul 2022 11:12:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2] RISC-V: Add mvendorid, marchid, and mimpid to
 /proc/cpuinfo output
Content-Language: en-GB
To: Anup Patel <anup@brainfault.org>
Cc: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org,
 Nikita Shubin <n.shubin@yadro.com>
References: <20220727043829.151794-1-apatel@ventanamicro.com>
 <724f176b-02f1-b171-726f-16158c650896@codethink.co.uk>
 <CAAhSdy1tnTDv0AVyo=5FD=aE070ds6qYGGhdup+8jUqr3M66qA@mail.gmail.com>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <CAAhSdy1tnTDv0AVyo=5FD=aE070ds6qYGGhdup+8jUqr3M66qA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_031224_801369_6EF2CC2A 
X-CRM114-Status: GOOD (  17.32  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 27/07/2022 11:06, Anup Patel wrote:
> On Wed, Jul 27, 2022 at 2:25 PM Ben Dooks <ben.dooks@codethink.co.uk> wrote:
>>
>> On 27/07/2022 05:38, Anup Patel wrote:
>>> Identifying the underlying RISC-V implementation can be important
>>> for some of the user space applications. For example, the perf tool
>>> uses arch specific CPU implementation id (i.e. CPUID) to select a
>>> JSON file describing custom perf events on a CPU.
>>>
>>> Currently, there is no way to identify RISC-V implementation so we
>>> add mvendorid, marchid, and mimpid to /proc/cpuinfo output.
>>>
>>> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
>>> Reviewed-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
>>> Tested-by: Nikita Shubin <n.shubin@yadro.com>
>>> ---
>>> Changes since v1:
>>>    - Use IS_ENABLED() to check CONFIG defines
>>>    - Added RB and TB tags in commit description
>>> ---
>>>    arch/riscv/kernel/cpu.c | 51 +++++++++++++++++++++++++++++++++++++++++
>>>    1 file changed, 51 insertions(+)
>>>
>>> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
>>> index fba9e9f46a8c..04bcc91c91ea 100644
>>> --- a/arch/riscv/kernel/cpu.c
>>> +++ b/arch/riscv/kernel/cpu.c
>>> @@ -3,10 +3,13 @@
>>>     * Copyright (C) 2012 Regents of the University of California
>>>     */
>>>
>>> +#include <linux/cpu.h>
>>>    #include <linux/init.h>
>>>    #include <linux/seq_file.h>
>>>    #include <linux/of.h>
>>> +#include <asm/csr.h>
>>>    #include <asm/hwcap.h>
>>> +#include <asm/sbi.h>
>>>    #include <asm/smp.h>
>>>    #include <asm/pgtable.h>
>>>
>>> @@ -64,6 +67,50 @@ int riscv_of_parent_hartid(struct device_node *node)
>>>    }
>>>
>>>    #ifdef CONFIG_PROC_FS
>>> +
>>> +struct riscv_cpuinfo {
>>> +     unsigned long mvendorid;
>>> +     unsigned long marchid;
>>> +     unsigned long mimpid;
>>> +};
>>> +static DEFINE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
>>> +
>>> +static int riscv_cpuinfo_starting(unsigned int cpu)
>>> +{
>>> +     struct riscv_cpuinfo *ci = this_cpu_ptr(&riscv_cpuinfo);
>>> +
>>> +#if IS_ENABLED(CONFIG_RISCV_SBI)
>>> +     ci->mvendorid = sbi_spec_is_0_1() ? 0 : sbi_get_mvendorid();
>>> +     ci->marchid = sbi_spec_is_0_1() ? 0 : sbi_get_marchid();
>>> +     ci->mimpid = sbi_spec_is_0_1() ? 0 : sbi_get_mimpid();
>>
>> how about:
>>
>>          if (IS_ENABLED(CONFIG_RISCV_SBI)) {
>>                  ...
>>          } ... {
>>
>> or maybe even:
>>
>>
>>          if (IS_ENABLED(CONFIG_RISCV_SBI)) {
>>                  if (sbi_spec_is_0_1()) {
>>                          ...
>>                  }
>>          } ... {
>>
>> would mean better compile coverage (at the slight exepnese of
>> having "false" sbi_spec_is_0_1() implemenation
> 
> Most of the sbi_xyz() functions are not available for NoMMU
> kernel so using "if (IS_ENABLED())" results in compile error.

How about defining "false" versions for no-mmu case and try
and avoid these #if mountains?

>>
>>> +#elif IS_ENABLED(CONFIG_RISCV_M_MODE)
>>> +     ci->mvendorid = csr_read(CSR_MVENDORID);
>>> +     ci->marchid = csr_read(CSR_MARCHID);
>>> +     ci->mimpid = csr_read(CSR_MIMPID);
>>> +#else
>>> +     ci->mvendorid = 0;
>>> +     ci->marchid = 0;
>>> +     ci->mimpid = 0;
>>> +#endif
>>
>> Would it be easier to zero out all the fields first and then fill them
>> in if supported?
> 
> Clearing out fields before "#if" ladder results in dead assignments.

Not sure which is worse here, the #if ladder or some possibly dead
assignments.

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
