Return-Path: <SRS0=TFiT=G7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1961BC433DB
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Jan 2021 20:41:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 486F664DCC
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Jan 2021 20:41:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 486F664DCC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lGSkOZlzFrXAowct/U9uX6Dirko1z3u3QFdRhs4lRWA=; b=B/S88TS0mbxN3ldQFeEKanSJf
	nhR+arHL6dXEhHJx4sZf4QZSKWfsDUMtJE5JSgcp5OhSA6j56GZH9WIM+OeFaw9k7Ap5RRUb2cwzY
	fxJzHTibG14c5wdhZ+ToXdhIwxN3FpJ+M3LnfJfamc4mlJLnwsvgHfUwQx3T/9USuaUCR33HUEk1f
	cnbcLlRcrJnKz7bvgAZybaXy8m0gChAayaOvuDaERmmwkSXYrsafObQcpepE/PHVBeBl2c5r7eqPy
	whFYl1/wNtMjyUNIT8VsvHZMnyjhSO39pJJBSiyZ97eQoMUo1FshBbWIy7+t9LxNyqKQkxpwB5+BC
	SxeqJNF+w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5E5z-00053E-55; Thu, 28 Jan 2021 20:40:51 +0000
Received: from [2601:1c0:6280:3f0::7650]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5E5w-000531-Is; Thu, 28 Jan 2021 20:40:48 +0000
Subject: Re: Kconfig-induced build errors: CONFIG_PAGE_OFFSET
To: Atish Patra <atishp@atishpatra.org>
References: <b67f8941-6624-d814-e6d3-2ddfdfbdf7dd@infradead.org>
 <CAOnJCUJc0-x-gmLAKxb9ULjOX1yBjxZvwi4=_0ETH-L7JtKhNw@mail.gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <e90a2745-7ca6-ce78-63c8-5aaf31602eab@infradead.org>
Date: Thu, 28 Jan 2021 12:40:42 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAOnJCUJc0-x-gmLAKxb9ULjOX1yBjxZvwi4=_0ETH-L7JtKhNw@mail.gmail.com>
Content-Language: en-US
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 LKML <linux-kernel@vger.kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 1/28/21 12:07 PM, Atish Patra wrote:
> On Wed, Jan 27, 2021 at 7:18 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>>
>> Hi,
>>
>> I took a riscv-32 .config from kernel test robot (it was for a clang build)
>> and did a "make olddefconfig" (using gcc tools) and got build errors
>> due to this config item from arch/riscv/Kconfig;
>>
>>
>> config PAGE_OFFSET
>>         hex
>>         default 0xC0000000 if 32BIT && MAXPHYSMEM_1GB
>>         default 0x80000000 if 64BIT && !MMU
>>         default 0xffffffff80000000 if 64BIT && MAXPHYSMEM_2GB
>>         default 0xffffffe000000000 if 64BIT && MAXPHYSMEM_128GB
>>
>> PAGE_OFFSET is undefined for the case of 32BIT && MAXPHYSMEM_2GB.
> 
> Because, RV32 doesn't support 2GB physical memory yet.
> 
> The compilation errors can be fixed by not allowing MAXPHYSMEM_2GB for RV32 and
> MAXPHYSMEM_1GB for RV64. How about this ?
> 
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -253,8 +253,10 @@ choice
>         default MAXPHYSMEM_128GB if 64BIT && CMODEL_MEDANY
> 
>         config MAXPHYSMEM_1GB
> +               depends on 32BIT
>                 bool "1GiB"
>         config MAXPHYSMEM_2GB
> +               depends on 64BIT && CMODEL_MEDLOW
>                 bool "2GiB"
>         config MAXPHYSMEM_128GB
>                 depends on 64BIT && CMODEL_MEDANY
Looks good. Thanks.

Acked-by: Randy Dunlap <rdunlap@infradead.org>

-- 
~Randy


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
