Return-Path: <SRS0=3V4y=M6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FEE8C4338F
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Aug 2021 19:32:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B390060F44
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Aug 2021 19:32:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B390060F44
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bN3qWIb5vZju31kHRMHovwfMMId7dFP1ozqA24WEadY=; b=tF4YBxySXKg8TpZ/nzC6JzwLbr
	SXlFgfYTRbcHR5IgLkKkz14aw7HmvRK5YlVQ/1UjyY7EVsk0ZoGKkC9uJNtrFkU38D47VAVO3wd7W
	h/eQ1mUwZ4gk7ZqMYdyFLKtRR04DTkD62UB009DpRIn7Xo1lvFJfmmqAO4ZhiFVf4OYzUW1CQBHyJ
	7WzDJq9LNImlquy6V81+h56VNAAfCoMbtosBG905KFFlm3WjT038NZT0yqcak1S6TgMdnaXfyq0p5
	mw/AxadXeM9fc6urkfgyZc6yfASi1Nns0KdyDYNwZ6MosjTjMky/6xJZef7My/hrhDBzH2zXRXqAC
	B6bEBmLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mCS2h-00F73M-H2; Sat, 07 Aug 2021 19:31:35 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mCS2e-00F72o-O7
 for linux-riscv@lists.infradead.org; Sat, 07 Aug 2021 19:31:34 +0000
Received: (Authenticated sender: alex@ghiti.fr)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 2366C200002;
 Sat,  7 Aug 2021 19:31:24 +0000 (UTC)
Subject: Re: [PATCH -fixes 3/3] riscv: Optimize kernel virtual address
 conversion macro
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <mhng-163d949e-5efc-46d4-a5b7-c90e4745a7a3@palmerdabbelt-glaptop>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <39a1fa85-1885-effe-1670-ec9cf34099f5@ghiti.fr>
Date: Sat, 7 Aug 2021 21:31:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <mhng-163d949e-5efc-46d4-a5b7-c90e4745a7a3@palmerdabbelt-glaptop>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210807_123132_968192_94529BB7 
X-CRM114-Status: GOOD (  15.76  )
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Le 7/08/2021 =E0 18:36, Palmer Dabbelt a =E9crit=A0:
> On Wed, 21 Jul 2021 00:59:37 PDT (-0700), alex@ghiti.fr wrote:
>> The current test in kernel_mapping_va_to_pa only applies when
>> CONFIG_XIP_KERNEL is set, so use IS_ENABLED to optimize this macro at
>> compile-time in standard kernels that do not require this test.
>>
>> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
>> ---
>> =A0arch/riscv/include/asm/page.h | 2 +-
>> =A01 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/riscv/include/asm/page.h =

>> b/arch/riscv/include/asm/page.h
>> index b0ca5058e7ae..10dc063868f6 100644
>> --- a/arch/riscv/include/asm/page.h
>> +++ b/arch/riscv/include/asm/page.h
>> @@ -123,7 +123,7 @@ extern phys_addr_t phys_ram_base;
>> =A0#define linear_mapping_va_to_pa(x)=A0=A0=A0 ((unsigned long)(x) - =

>> kernel_map.va_pa_offset)
>> =A0#define kernel_mapping_va_to_pa(y) ({=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 \
>> =A0=A0=A0=A0 unsigned long _y =3D y;=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 \
>> -=A0=A0=A0 (_y < kernel_map.virt_addr + XIP_OFFSET) ?=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 \
>> +=A0=A0=A0 (IS_ENABLED(CONFIG_XIP_KERNEL) && _y < kernel_map.virt_addr + =

>> XIP_OFFSET) ?=A0=A0=A0 \
>> =A0=A0=A0=A0=A0=A0=A0=A0 ((unsigned long)(_y) - kernel_map.va_kernel_xip=
_pa_offset) =

>> :=A0=A0=A0=A0=A0=A0=A0 \
>> =A0=A0=A0=A0=A0=A0=A0=A0 ((unsigned long)(_y) - kernel_map.va_kernel_pa_=
offset - =

>> XIP_OFFSET);=A0=A0=A0 \
>> =A0=A0=A0=A0 })
> =

> IIUC this isn't actually a fix?=A0 The other two are, though, so they're =

> on fixes.

Indeed this is not a fix, this is symmetrical to what I have done in =

patch 1 so that seemed natural to land in the same patchset. Let me know =

if you want me to resend it on its own.

Thanks,

Alex

> =

> Thanks!
> =

> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
