Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63FECEB64D9
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Jul 2023 03:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JE0vtcEI4jqPN6M795XbhLRBz7AxhZOJym3jtxn4lxI=; b=35mhAfwUWGHcYI
	fRg4HkP0LSiesIyP7GQKSTbqcM9bIyHala9W0rYqkdxKYF42UxmFLrjfyNK2o6OURjcvzDTdbmbjB
	2Qlx+n5vCXQg1vJcbVZ4i9MCoHSQgQPrjP5ZsEt+/SxOms4ZjP0Co3PjGtmu+CfVnww+xvA7fUKGB
	urLZHtc/oohHSrFilF6yKhxR7qYAXJL5Y1WVdbhFBoIOox6XlJy2E5+DYGv/SfGOq6tiIMgsV9Ac5
	PrOPKuTWHf8k8TdSum0bf/F5JJ7FJgPrzWG+SbdEMouNKIxMl+y6KBOhcgh7dFZ3erWOXZD3wrjmV
	mxrBVSgPkmfXdExEj/KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHyDn-006Oob-2O;
	Sat, 08 Jul 2023 03:02:55 +0000
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qHyDl-006Oo9-1m;
	Sat, 08 Jul 2023 03:02:53 +0000
Message-ID: <d1b35a5b-a061-a6c0-5898-aaaad3dd4986@infradead.org>
Date: Fri, 7 Jul 2023 20:02:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 4/4] RISC-V: mm: Document mmap changes
Content-Language: en-US
To: Charlie Jenkins <charlie@rivosinc.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: conor@kernel.org, paul.walmsley@sifive.com, palmer@rivosinc.com,
 aou@eecs.berkeley.edu, anup@brainfault.org, konstantin@linuxfoundation.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mm@kvack.org, mick@ics.forth.gr, jrtc27@jrtc27.com
References: <20230708011156.2697409-1-charlie@rivosinc.com>
 <20230708011156.2697409-5-charlie@rivosinc.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230708011156.2697409-5-charlie@rivosinc.com>
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

Hi--

On 7/7/23 18:11, Charlie Jenkins wrote:
> The behavior of mmap is modified with this patch series, so explain the
> changes to the mmap hint address behavior.
> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
>  Documentation/riscv/vm-layout.rst | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/Documentation/riscv/vm-layout.rst b/Documentation/riscv/vm-layout.rst
> index 5462c84f4723..8141addbf888 100644
> --- a/Documentation/riscv/vm-layout.rst
> +++ b/Documentation/riscv/vm-layout.rst
> @@ -133,3 +133,25 @@ RISC-V Linux Kernel SV57
>     ffffffff00000000 |  -4     GB | ffffffff7fffffff |    2 GB | modules, BPF
>     ffffffff80000000 |  -2     GB | ffffffffffffffff |    2 GB | kernel
>    __________________|____________|__________________|_________|____________________________________________________________
> +
> +
> +Userspace VAs
> +--------------------
> +To maintain compatibility with software that relies on the VA space with a
> +maximum of 48 bits the kernel will, by default, return virtual addresses to
> +userspace from a 48-bit range (sv48). This default behavior is achieved by
> +passing 0 into the hint address parameter of mmap. On CPUs with an address space
> +smaller than sv48, the CPU maximum supported address space will be the default.
> +
> +Software can "opt-in" to receiving VAs from other VA space by providing

                                          from another VA space
or
                                          from other VA spaces
I prefer the first one.

> +a hint address to mmap. A call to mmap is guaranteed to return an address
> +that will not override the unset left-aligned bits in the hint address,
> +unless there is no space left in the address space. If there is no space
> +available in the requested address space, an address in the next smallest
> +available address space will be returned.
> +
> +For example, in order to obtain 48-bit VA space, a hint address greater than
> +:code:`1 << 38` must be provided. Note that this is 38 due to sv39 userspace
> +ending at :code:`1 << 38` and the addresses beyond this are reserved for the
> +kernel. Similarly, to obtain 57-bit VA space addresses, a hint address greater
> +than or equal to :code:`1 << 47` must be provided.

-- 
~Randy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
