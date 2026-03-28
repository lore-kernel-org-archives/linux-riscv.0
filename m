Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA16110F3DCB
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Mar 2026 03:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GEb2wlsDikAJzFbDyKsXsa6hCJXig3nohjqczACE6eo=; b=tm6wmB3oBTnCWl
	zamFS8Gzx7WjfancSivdeBeUmVfOQQiFQljBGJ9bQyrtxNalDCypOxBf++DZo/GR/YiVE3Q+d1aMh
	G6xOlCKdqfuEP6mu+3h4tKcZ+831HxY5DGfXKZ6+s3DK5siltYhNDTPt4oJiQc7+Z0U03odVR5e7Y
	9RYCWZmaJt/LTK+NTTVVNOgK0YnBryJoXryea7RvbpRSbgN8JFsYW7BnDY5+XBB95ve1OfAt0C2t0
	sYPzBCm1jbzfq+BhH4snKvMzHooLwHQFEoZGontoe3GkFXe3dF0i4xvIUasUPUbuZ3xBbY+C8eGZ9
	d6nFgYEgAScdyWOarF7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6Kf0-00000008V0Y-3CGf;
	Sat, 28 Mar 2026 03:48:30 +0000
Received: from out-188.mta0.migadu.com ([2001:41d0:1004:224b::bc])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6Kew-00000008UzS-3hof
	for linux-riscv@lists.infradead.org;
	Sat, 28 Mar 2026 03:48:28 +0000
Message-ID: <235a2392-612e-47e1-8107-49d475ab4e92@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774669700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vrJhHhFJ5FK3ig2aVneYq1I5tqitnpCUDimyFvpsvV4=;
	b=BNNaJrMCBJNcKgIXlhtHew1y5+Q9YMCbDUgxyk1z53FPAqpeC54lMEKy5AD3bAQAKhVUQT
	0Bkn+DFQdmNficsuxQQml5w13KuvouH8O2XY1PNMyvgs1cZx5VZsp2P+MOQz36Mf3t7eMg
	OddMsJMkbkwkDl2TSSGG4+2vykDybjA=
Date: Fri, 27 Mar 2026 20:48:15 -0700
MIME-Version: 1.0
Subject: Re: [PATCH] RISC-V: restore U-mode counter access (scounteren)
To: Manfred Schlaegl <manfred.schlaegl@gmx.at>,
 Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Atish Patra <atishp@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260326111713.2282289-1-manfred.schlaegl@gmx.at>
 <fyf2z2tdzm7cu52kybmwvigvxpwigdceasveenjnoes6g6ilwi@otq2sp3m3qam>
 <502b6589-6430-458d-af58-6404b06816a9@gmx.at>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <502b6589-6430-458d-af58-6404b06816a9@gmx.at>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_204827_069640_0D9627EC 
X-CRM114-Status: GOOD (  21.22  )
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

On 3/27/26 7:21 AM, Manfred Schlaegl wrote:
> 
> 
> On 3/26/26 23:27, Andrew Jones wrote:
>> On Thu, Mar 26, 2026 at 12:17:13PM +0100, Manfred SCHLAEGL wrote:
>>> In commit 5bc409786752 ("RISC-V: KVM: Remove scounteren initialization")
>>> the initialization of scounteren was moved from the hypervisor (KVM) to
>>> the supervisor -- a well-argued change. However, the same change also
>>> restricted access to performance counters without comment: previously,
>>> scounteren was set to 0x7 (0b111), allowing U-mode (userspace) access
>>> to instret (IR), cycle (CY), and time (TM). After the change,
>>> scounteren is set to 0x2 (0b010), which allows access only to time (TM)
>>> and prohibits access to instret (IR) and cycle (CY). This breaks user-
>>> space programs that directly use these performance counters.
>>>
>>> This change restores the prior behavior: scounteren is set to 0x7,
>>> which re-enables U-mode (userspace) access to instret (IR), cycle (CY),
>>> and time (TM).
>>>

This is not an accepted behavior from the user space due to security 
concerns and misleading data. This has been discussed many times in the 
past and agreed upon behavior. Other architecture also doesn't allow 
direct access to CY or IR directly. RISC-V is no different.

TLDR; If you need it for debugging purpose, you should opt in for legacy 
usage sysctl parameter. If your user space library is affected, it 
should be fixed.

here are some references:


Here was the previous discussion around this[1].
Most of the legacy user applications using rdcycle should use rdtime
instead as they just want to record the time
elapsed. Allowing rdcycle/rdinstret to be read from user space can
lead to very deterministic attacks[2].

Any user application that really requires to read rdcycle directly can
use this new perf interface to do that without any latency.

[1] 
https://groups.google.com/a/groups.riscv.org/g/sw-dev/c/REWcwYnzsKE?pli=1
[2] 
https://www.youtube.com/watch?v=3-c4C_L2PRQ&ab_channel=IEEESymposiumonSecurityandPrivacy
[3] 
https://lore.kernel.org/lkml/Y7wLa7I2hlz3rKw%2F@hirez.programming.kicks-ass.net/T/
[4] 
https://lore.kernel.org/linux-riscv/20260131112440.2915-1-cp0613@linux.alibaba.com/



>>> Fixes: 5bc409786752 ("RISC-V: KVM: Remove scounteren initialization")
>>> Signed-off-by: Manfred SCHLAEGL <manfred.schlaegl@gmx.at>
>>> ---
>>>   arch/riscv/kernel/head.S | 8 ++++----
>>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
>>> index 9c99c5ad6fe8..5ad5e12a8299 100644
>>> --- a/arch/riscv/kernel/head.S
>>> +++ b/arch/riscv/kernel/head.S
>>> @@ -133,8 +133,8 @@ secondary_start_sbi:
>>>   	csrw CSR_IP, zero
>>>   
>>>   #ifndef CONFIG_RISCV_M_MODE
>>> -	/* Enable time CSR */
>>> -	li t0, 0x2
>>> +	/* Enable CY, TM, and IR counters in U mode */
>>> +	li t0, 0x7
>>>   	csrw CSR_SCOUNTEREN, t0
>>>   #endif
>>>   
>>> @@ -247,8 +247,8 @@ SYM_CODE_START(_start_kernel)
>>>   	 */
>>>   	csrr a0, CSR_MHARTID
>>>   #else
>>> -	/* Enable time CSR */
>>> -	li t0, 0x2
>>> +	/* Enable CY, TM, and IR counters in U mode */
>>> +	li t0, 0x7
>>>   	csrw CSR_SCOUNTEREN, t0
>>>   #endif /* CONFIG_RISCV_M_MODE */
>>>   
>>> -- 
>>> 2.47.3
>>>
>>
>> 5bc409786752 should have explained that change by referencing the
>> same links as commit cc4c07c89aad ("drivers: perf: Implement perf
>> event mmap support in the SBI backend") does.
> 
> Ahhh, I see :-)
> Thanks for the clarification!
> 
>>
>> Thanks,
>> drew
> 
> Best regards,
> Manfred
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
