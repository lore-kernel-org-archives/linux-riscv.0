Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C748C52D6F
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Aug 2024 09:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TiGQ3WHeo/jhtVQapZW5mLpSNV2md2bLednLCv+M4WI=; b=kboSKJyThy95bc
	sNrwzIzK7PFN0vHxxBq0Kcvxzc7plsQW1uE1oD1dGGl3IfhMQeNDqMvZP3hGdNt17d0lIJv/oA2hT
	F+4uIDIs5BoiQ1NSA8t70lYUOpKa8m0vj7UL94t/252kglVn8n1LKkLs05zeLLywK+gC9uDEp5UQX
	2Q/u1mPzTx17XGvgWmbtdLgRmXnjJpgNocVlCrRPfo1p5YIwFd2/HauY0fllYXBlpOumNZbv5VV8M
	O4+JDd2JEMrBfmOUp4Gis+uHNdjRbdvZCnD33hZm2b3CmBsIQ5I8CD59ty0u4xMEeVpKiL0EHckWS
	K1IS+mOxYBN9BhTvW/cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sisHv-0000000AXUy-0jee;
	Tue, 27 Aug 2024 09:14:55 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sisGR-0000000AXCb-2PXW
	for linux-riscv@lists.infradead.org;
	Tue, 27 Aug 2024 09:13:25 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 35520C000A;
	Tue, 27 Aug 2024 09:13:17 +0000 (UTC)
Message-ID: <14d633c5-804b-4be9-8329-751a2ac08c7a@ghiti.fr>
Date: Tue, 27 Aug 2024 11:13:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -fixes] riscv: Fix RISCV_ALTERNATIVE_EARLY
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240826105737.106879-1-alexghiti@rivosinc.com>
 <20240827-striving-dispute-19b6cf97139b@spud>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240827-striving-dispute-19b6cf97139b@spud>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240827_021323_778981_1BD29E0F 
X-CRM114-Status: GOOD (  13.51  )
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

Hi Conor,

On 27/08/2024 10:38, Conor Dooley wrote:
> On Mon, Aug 26, 2024 at 12:57:37PM +0200, Alexandre Ghiti wrote:
>> RISCV_ALTERNATIVE_EARLY will issue sbi_ecall() very early in the boot
>> process, before the first memory mapping is setup so we can't have any
>> instrumentation happening here.
>>
>> In addition, when the kernel is relocatable, we must also not issue any
>> relocation this early since they would have been patched virtually only.
>>
>> So, instead of disabling instrumentation for the whole kernel/sbi.c file
>> and compiling it with -fno-pie, simply move __sbi_ecall() and
>> __sbi_base_ecall() into their own file where this is fixed.
> IOW, this should fix the issue that we discussed here
> https://lore.kernel.org/linux-riscv/abec162e-f3f2-488c-83d9-be17257a5df8@ghiti.fr/
> also?


Yes, as a side effect it also fixes TRACEPOINTS + [KASAN|RELOCATABLE] as 
I reported in this thread since I moved the tracepoints in a file where 
instrumentation is disabled and compiled with no-pie.


> I'm sorry I didn't get to test that yet, we had some pretty bad IT
> issues in the office the last weeks and I have been avoiding going
> there. I'll try to test this one instead..
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
