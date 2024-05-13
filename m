Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3759C25B78
	for <linux-riscv@archiver.kernel.org>; Mon, 13 May 2024 17:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aeJtfscmvmqMWdy4iBrErry1Pf8w9QOhu0VAmDNba6s=; b=LOxF2Fmplltz97/QDycWNQmJ7F
	jsIbNTHqGWpmnNNpVspuxvfFuzeCDCsIxfEGAnUmzZfgkLI2A8hi8+C1pever65NR1k/pcIxmXW9H
	uDC8O/gGNJG2ysEQ9YupEp8sSe8GDXKQT03evaHrrKE2TDc+THbr4UUvvHoQbKlznnrNr6H4MXeGm
	kIDD80NKevMsJjAS6tswwSZfKICe4W8UHmRzg/4MeVDpuVYjSwqBh8ud0dI2kxN0HAzeALPonJ5KY
	8oL6X95nefLwG0RoO+GJwkrxhi5Umkdg56jCCyJDrsOu9gIe3UnjKSpnOweEqLH8xBE2I4C/R6WSS
	SPFEaPxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6Zly-0000000DmYW-0xbE;
	Mon, 13 May 2024 17:47:38 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6Zlu-0000000DmXH-3cyf
	for linux-riscv@lists.infradead.org;
	Mon, 13 May 2024 17:47:36 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-5d3907ff128so3982473a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 13 May 2024 10:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715622453; x=1716227253; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6LaUfYbhjgFs2AjjPA78Kswq4d56jrbrUI3xg3pcRhk=;
        b=YO7jUXqud5PpLdinvygTV0rY9qyUEfaTybHx1HPN+HJgZoNdzQt20ZBipHIYY3iTIH
         EqNsEXggQ20vWuvtB9zpB5Qzztdxqrfa8TxEVugB4TowgALophgZleP9KmX0RjgEm9I1
         hd5ArGLv/e2RMi8K8h3EsNLCFoKqHAcxf5LqTtIJYzMv0OxR3g+svewlU9KjnDpk6OMM
         fjy7Agc9b6L1rJO9yQq3kQSqt5162WSeTtWRJdtHC6UZtcY1PxMxAPA8N9TcuZ1Xr5Cv
         hQQCC/ATHoaBkKd4+47TF9Av6bDKyur1mlpu4Dr5JeGjkasVqgVSELcDFAJ55kxfEVIL
         aD4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715622453; x=1716227253;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6LaUfYbhjgFs2AjjPA78Kswq4d56jrbrUI3xg3pcRhk=;
        b=Kmge5qXpqN0fIhA4gP9hUogkjMa8kxYNFZIpO7wuO6+yhBW0+Ek0R38tLAnEF5udm2
         CrnKHu3ByvRRTjpdT3cqGpaRn7Soy5OCcVIE71mlWIuLpSLTCEI3DXnmj9yCFm/H3sOR
         5AOwYZxYApR338u0LW0r/f+apL/3H0MDpubq5XmQ+IaYgwrhA2SqqwErxCT6dRuGSR5v
         g16muJik7sXTEwTPs7s0RjiUZXtEx2I+QqKqEJiq/DZg6emR7GbhDm12Qan5E4cdYucc
         8wlReAC7TmeKIHUKa6rRpgEMHRTbVCdhm5w7cRtnDV8Ws3RC8YdFQhJMsnNZc42LVWQ6
         gYxg==
X-Forwarded-Encrypted: i=1; AJvYcCVHj/JtB/X66bl6SKtdZvYgc5883P+xhKPRekzYGmENVTar/M1hY5PfpLEZeLyKZVFr9OVmTkBBZQsufyr/sh7x8bWuP497ZRSrNggf183b
X-Gm-Message-State: AOJu0Yz2vtkrBYTylRwmco6IDRMzVRZ2wucRdP/4LdJGRLUikV9qStMB
	KnVr5t5QhYVeinpyRV+B7Y2YesKVcaRk3TjGgZUHgKJZvvcfDHuENiavfjFWDA0=
X-Google-Smtp-Source: AGHT+IGjx0AoLZdsnPMmBtuPR7WiUWSxaNpuC/v1kUd2jvw2APP6WDzK0//bbc0udBP7gghTi2HA6A==
X-Received: by 2002:a17:90b:106:b0:2b6:c4d7:fc31 with SMTP id 98e67ed59e1d1-2b6cd1e4ba4mr11564581a91.40.1715622451120;
        Mon, 13 May 2024 10:47:31 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2b628ea6c10sm10010384a91.53.2024.05.13.10.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 10:47:30 -0700 (PDT)
Date: Mon, 13 May 2024 10:47:25 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: paul.walmsley@sifive.com, rick.p.edgecombe@intel.com,
	broonie@kernel.org, Szabolcs.Nagy@arm.com, kito.cheng@sifive.com,
	keescook@chromium.org, ajones@ventanamicro.com,
	conor.dooley@microchip.com, cleger@rivosinc.com,
	atishp@atishpatra.org, alex@ghiti.fr, bjorn@rivosinc.com,
	alexghiti@rivosinc.com, samuel.holland@sifive.com, conor@kernel.org,
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-mm@kvack.org, linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org, corbet@lwn.net, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, oleg@redhat.com,
	akpm@linux-foundation.org, arnd@arndb.de, ebiederm@xmission.com,
	Liam.Howlett@oracle.com, vbabka@suse.cz, lstoakes@gmail.com,
	shuah@kernel.org, brauner@kernel.org, andy.chiu@sifive.com,
	jerry.shih@sifive.com, hankuan.chen@sifive.com,
	greentime.hu@sifive.com, evan@rivosinc.com, xiao.w.wang@intel.com,
	apatel@ventanamicro.com, mchitale@ventanamicro.com,
	dbarboza@ventanamicro.com, sameo@rivosinc.com,
	shikemeng@huaweicloud.com, willy@infradead.org,
	vincent.chen@sifive.com, guoren@kernel.org, samitolvanen@google.com,
	songshuaishuai@tinylab.org, gerg@kernel.org, heiko@sntech.de,
	bhe@redhat.com, jeeheng.sia@starfivetech.com, cyy@cyyself.name,
	maskray@google.com, ancientmodern4@gmail.com,
	mathis.salmen@matsal.de, cuiyunhui@bytedance.com,
	bgray@linux.ibm.com, mpe@ellerman.id.au, baruch@tkos.co.il,
	alx@kernel.org, david@redhat.com, catalin.marinas@arm.com,
	revest@chromium.org, josh@joshtriplett.org, shr@devkernel.io,
	deller@gmx.de, omosnace@redhat.com, ojeda@kernel.org,
	jhubbard@nvidia.com
Subject: Re: [PATCH v3 10/29] riscv/mm : ensure PROT_WRITE leads to VM_READ |
 VM_WRITE
Message-ID: <ZkJSLTk1iWFGJZCQ@debug.ba.rivosinc.com>
References: <20240403234054.2020347-1-debug@rivosinc.com>
 <20240403234054.2020347-11-debug@rivosinc.com>
 <Zj6LfpQhOjTLEx2O@ghost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Zj6LfpQhOjTLEx2O@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_104734_939763_0B676DC7 
X-CRM114-Status: GOOD (  28.07  )
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

On Fri, May 10, 2024 at 02:02:54PM -0700, Charlie Jenkins wrote:
>On Wed, Apr 03, 2024 at 04:34:58PM -0700, Deepak Gupta wrote:
>> `arch_calc_vm_prot_bits` is implemented on risc-v to return VM_READ |
>> VM_WRITE if PROT_WRITE is specified. Similarly `riscv_sys_mmap` is
>> updated to convert all incoming PROT_WRITE to (PROT_WRITE | PROT_READ).
>> This is to make sure that any existing apps using PROT_WRITE still work.
>>
>> Earlier `protection_map[VM_WRITE]` used to pick read-write PTE encodings.
>> Now `protection_map[VM_WRITE]` will always pick PAGE_SHADOWSTACK PTE
>> encodings for shadow stack. Above changes ensure that existing apps
>> continue to work because underneath kernel will be picking
>> `protection_map[VM_WRITE|VM_READ]` PTE encodings.
>>
>> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>> ---
>>  arch/riscv/include/asm/mman.h    | 24 ++++++++++++++++++++++++
>>  arch/riscv/include/asm/pgtable.h |  1 +
>>  arch/riscv/kernel/sys_riscv.c    | 11 +++++++++++
>>  arch/riscv/mm/init.c             |  2 +-
>>  mm/mmap.c                        |  1 +
>>  5 files changed, 38 insertions(+), 1 deletion(-)
>>  create mode 100644 arch/riscv/include/asm/mman.h
>>
>> diff --git a/arch/riscv/include/asm/mman.h b/arch/riscv/include/asm/mman.h
>> new file mode 100644
>> index 000000000000..ef9fedf32546
>> --- /dev/null
>> +++ b/arch/riscv/include/asm/mman.h
>> @@ -0,0 +1,24 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +#ifndef __ASM_MMAN_H__
>> +#define __ASM_MMAN_H__
>> +
>> +#include <linux/compiler.h>
>> +#include <linux/types.h>
>> +#include <uapi/asm/mman.h>
>> +
>> +static inline unsigned long arch_calc_vm_prot_bits(unsigned long prot,
>> +	unsigned long pkey __always_unused)
>> +{
>> +	unsigned long ret = 0;
>> +
>> +	/*
>> +	 * If PROT_WRITE was specified, force it to VM_READ | VM_WRITE.
>> +	 * Only VM_WRITE means shadow stack.
>> +	 */
>> +	if (prot & PROT_WRITE)
>> +		ret = (VM_READ | VM_WRITE);
>> +	return ret;
>> +}
>> +#define arch_calc_vm_prot_bits(prot, pkey) arch_calc_vm_prot_bits(prot, pkey)
>> +
>> +#endif /* ! __ASM_MMAN_H__ */
>> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
>> index 6066822e7396..4d5983bc6766 100644
>> --- a/arch/riscv/include/asm/pgtable.h
>> +++ b/arch/riscv/include/asm/pgtable.h
>> @@ -184,6 +184,7 @@ extern struct pt_alloc_ops pt_ops __initdata;
>>  #define PAGE_READ_EXEC		__pgprot(_PAGE_BASE | _PAGE_READ | _PAGE_EXEC)
>>  #define PAGE_WRITE_EXEC		__pgprot(_PAGE_BASE | _PAGE_READ |	\
>>  					 _PAGE_EXEC | _PAGE_WRITE)
>> +#define PAGE_SHADOWSTACK       __pgprot(_PAGE_BASE | _PAGE_WRITE)
>>
>>  #define PAGE_COPY		PAGE_READ
>>  #define PAGE_COPY_EXEC		PAGE_READ_EXEC
>> diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
>> index f1c1416a9f1e..846c36b1b3d5 100644
>> --- a/arch/riscv/kernel/sys_riscv.c
>> +++ b/arch/riscv/kernel/sys_riscv.c
>> @@ -8,6 +8,8 @@
>>  #include <linux/syscalls.h>
>>  #include <asm/cacheflush.h>
>>  #include <asm-generic/mman-common.h>
>> +#include <vdso/vsyscall.h>
>> +#include <asm/mman.h>
>>
>>  static long riscv_sys_mmap(unsigned long addr, unsigned long len,
>>  			   unsigned long prot, unsigned long flags,
>> @@ -17,6 +19,15 @@ static long riscv_sys_mmap(unsigned long addr, unsigned long len,
>>  	if (unlikely(offset & (~PAGE_MASK >> page_shift_offset)))
>>  		return -EINVAL;
>>
>> +	/*
>> +	 * If only PROT_WRITE is specified then extend that to PROT_READ
>> +	 * protection_map[VM_WRITE] is now going to select shadow stack encodings.
>> +	 * So specifying PROT_WRITE actually should select protection_map [VM_WRITE | VM_READ]
>> +	 * If user wants to create shadow stack then they should use `map_shadow_stack` syscall.
>> +	 */
>> +	if (unlikely((prot & PROT_WRITE) && !(prot & PROT_READ)))
>
>The comments says that this should extend to PROT_READ if only
>PROT_WRITE is specified. This condition instead is checking if
>PROT_WRITE is selected but PROT_READ is not. If prot is (VM_EXEC |
>VM_WRITE) then it would be extended to (VM_EXEC | VM_WRITE | VM_READ).
>This will not currently cause any issues because these both map to the
>same value in the protection_map PAGE_COPY_EXEC, however this seems to
>be not the intention of this change.
>
>prot == PROT_WRITE better suits the condition explained in the comment.

If someone specifies this (PROT_EXEC | PROT_WRITE) today, it works because
of the way permissions are setup in `protection_map`. On risc-v there is no
way to have a page which is execute and write only. So expectation is that
if some apps were using `PROT_EXEC | PROT_WRITE` today, they were working
because internally it was translating to read, write and execute on page
permissions level. This patch make sure that, it stays same from page
permissions perspective.

If someone was using PROT_EXEC, it may translate to execute only and this change
doesn't impact that.

Patch simply looks for presence of `PROT_WRITE` and absence of `PROT_READ` in
protection flags and if that condition is satisfied, it assumes that caller assumed
page is going to be read allowed as well.


>
>> +		prot |= PROT_READ;
>> +
>>  	return ksys_mmap_pgoff(addr, len, prot, flags, fd,
>>  			       offset >> (PAGE_SHIFT - page_shift_offset));
>>  }
>> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
>> index fa34cf55037b..98e5ece4052a 100644
>> --- a/arch/riscv/mm/init.c
>> +++ b/arch/riscv/mm/init.c
>> @@ -299,7 +299,7 @@ pgd_t early_pg_dir[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
>>  static const pgprot_t protection_map[16] = {
>>  	[VM_NONE]					= PAGE_NONE,
>>  	[VM_READ]					= PAGE_READ,
>> -	[VM_WRITE]					= PAGE_COPY,
>> +	[VM_WRITE]					= PAGE_SHADOWSTACK,
>>  	[VM_WRITE | VM_READ]				= PAGE_COPY,
>>  	[VM_EXEC]					= PAGE_EXEC,
>>  	[VM_EXEC | VM_READ]				= PAGE_READ_EXEC,
>> diff --git a/mm/mmap.c b/mm/mmap.c
>> index d89770eaab6b..57a974f49b00 100644
>> --- a/mm/mmap.c
>> +++ b/mm/mmap.c
>> @@ -47,6 +47,7 @@
>>  #include <linux/oom.h>
>>  #include <linux/sched/mm.h>
>>  #include <linux/ksm.h>
>> +#include <linux/processor.h>
>
>It doesn't seem like this is necessary for this patch.

Thanks. Yeah it looks like I forgot to remove this over the churn.
Will fix it.

>
>- Charlie
>
>>
>>  #include <linux/uaccess.h>
>>  #include <asm/cacheflush.h>
>> --
>> 2.43.2
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
