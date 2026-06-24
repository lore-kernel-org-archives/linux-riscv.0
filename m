Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACB97CDB470
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Jun 2026 06:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CGqC51ccz3mTM7cN3HXfsrghrexVSszFhmtDDCaPFWQ=; b=MKWSGmu4Veas+Y
	Y7YVn4KNTJzh4pCQkmewfbGOQpku7KO6zUYxDQdU7HJT/5YgP7lmOngjmBbgHElnCPHmGwbzhefBX
	fmn10aWY0B+cgUtP3N/jeOwEkzI0uc/PA1NGANkd+185ZdjudlDROUDW8DsIje4JQzH5k/CxCpeB2
	sksEfebxRyDphnryhLndF4JypZ4EHzPlPlxwGEOkoVFf605ZwoaeW3u94BCT0TQ9BcSYpRPALLSBQ
	qoVLL33e3uW18S/Gd1W9SRxpkFDeya98wEkOy5WfhB9amQxr+OK2yasad/TFwNWmPdY7RZm73M1Dv
	Y4A4hsLu2anVgem1RVMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcHWc-00000007G1w-00X2;
	Wed, 24 Jun 2026 06:55:54 +0000
Received: from out-172.mta0.migadu.com ([91.218.175.172])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcHWX-00000007G0X-0LIW
	for linux-riscv@lists.infradead.org;
	Wed, 24 Jun 2026 06:55:50 +0000
Message-ID: <df40cc47-98ec-44b6-afda-76f483b788f9@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782284135;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yWm8hwbOHYEuIVgePKE1QjEJreKex9TPU9yjx6MzZcc=;
	b=YcHVNIIQIPlkM4Otj/PcpwiswIuKazAwMKCk9ChENUfKCwBT6Gh/wiQr0oNjKrv1nipBGG
	ct24V6l0dxWtjw8Rc02pGLqDchRSQLB/o2NKzC0FKFohLycg4yJTIH0RPJbw0uwB5DODaP
	v0GqAVxtEwq+zjEoS/Pic5q81ZOQ9Ic=
Date: Tue, 23 Jun 2026 23:55:28 -0700
MIME-Version: 1.0
Subject: Re: [PATCH v6 04/21] RISC-V: Define indirect CSR access helpers
To: Charlie Jenkins <thecharlesjenkins@gmail.com>
Cc: James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Anup Patel <anup@brainfault.org>, Namhyung Kim <namhyung@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Ian Rogers <irogers@google.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260608-counter_delegation-v6-0-285b72ed65a9@meta.com>
 <20260608-counter_delegation-v6-4-285b72ed65a9@meta.com>
 <ajjZR-R11yPYWuDp@blinky>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <ajjZR-R11yPYWuDp@blinky>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_235549_516830_E29B1CFA 
X-CRM114-Status: GOOD (  14.66  )
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


On 6/21/26 11:42 PM, Charlie Jenkins wrote:
> On Mon, Jun 08, 2026 at 11:01:18PM -0700, Atish Patra wrote:
>> From: Atish Patra <atishp@rivosinc.com>
>>
>> The indriect CSR requires multiple instructions to read/write CSR.
> indirect
>
>> Add a few helper functions for ease of usage.
>>
>> Signed-off-by: Atish Patra <atishp@rivosinc.com>
>> ---
>>   arch/riscv/include/asm/csr_ind.h | 44 ++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 44 insertions(+)
>>
>> diff --git a/arch/riscv/include/asm/csr_ind.h b/arch/riscv/include/asm/csr_ind.h
>> new file mode 100644
>> index 000000000000..6fd7d44dc640
>> --- /dev/null
>> +++ b/arch/riscv/include/asm/csr_ind.h
>> @@ -0,0 +1,44 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (C) 2024 Rivos Inc.
> I don't think it makes sense to introduce this copyright in new commits.
Yeah. I will update these.
> - Charlie
>
>> + */
>> +
>> +#ifndef _ASM_RISCV_CSR_IND_H
>> +#define _ASM_RISCV_CSR_IND_H
>> +
>> +#include <linux/irqflags.h>
>> +
>> +#include <asm/csr.h>
>> +
>> +#define csr_ind_read(iregcsr, iselbase, iseloff) ({		\
>> +	unsigned long __value = 0;				\
>> +	unsigned long __flags;					\
>> +	local_irq_save(__flags);				\
>> +	csr_write(CSR_ISELECT, (iselbase) + (iseloff));		\
>> +	__value = csr_read(iregcsr);				\
>> +	local_irq_restore(__flags);				\
>> +	__value;						\
>> +})
>> +
>> +#define csr_ind_write(iregcsr, iselbase, iseloff, value) ({	\
>> +	unsigned long __flags;					\
>> +	local_irq_save(__flags);				\
>> +	csr_write(CSR_ISELECT, (iselbase) + (iseloff));		\
>> +	csr_write(iregcsr, (value));				\
>> +	local_irq_restore(__flags);				\
>> +})
>> +
>> +#define csr_ind_warl(iregcsr, iselbase, iseloff, warl_val) ({	\
>> +	unsigned long __old_val = 0, __value = 0;		\
>> +	unsigned long __flags;					\
>> +	local_irq_save(__flags);				\
>> +	csr_write(CSR_ISELECT, (iselbase) + (iseloff));		\
>> +	__old_val = csr_read(iregcsr);				\
>> +	csr_write(iregcsr, (warl_val));				\
>> +	__value = csr_read(iregcsr);				\
>> +	csr_write(iregcsr, __old_val);				\
>> +	local_irq_restore(__flags);				\
>> +	__value;						\
>> +})
>> +
>> +#endif
>>
>> -- 
>> 2.53.0-Meta
>>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
