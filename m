Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B74C77B73
	for <linux-riscv@archiver.kernel.org>; Fri, 26 May 2023 16:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N7PCzRDRmVDOZib5+Us6+jQYWtGp3YnN5ez64q8nG7Y=; b=kWRbE51T3Z/2PM
	PjgrJ93JO+OdQ4AtDzqPBWp9nsTsxmxFtksLO06I+JhUcuGkfzxV8QKh2yvpPKZPPyOLusT+LkZWY
	lyuo9bg0EEqtl1cR6WlLgHOD2yNXs5hPTFiVEGHyXy+a2Ng/Hh9cm1n9Lh70h/qDacW1r3NyShm6Q
	pw2rENt7T7/iNml92tdZlc5UsVRg332OUodhHu6GtUgsZpuqEiBkS1O2AQQCPNmJVr3FFCr1skdKd
	s9pjDXhS/JBjz8Z6eWI3zXTtYGUEuP1wSEy3h5yWtjW2F5mu5fN4nuYUidVuqV3ZuJyl2Jd9QLtqS
	SY4eVsHyp2iLzoknONLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2aSP-0038uZ-33;
	Fri, 26 May 2023 16:38:25 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2aSN-0038st-13
	for linux-riscv@lists.infradead.org;
	Fri, 26 May 2023 16:38:25 +0000
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id 01FAF40009;
	Fri, 26 May 2023 16:38:14 +0000 (UTC)
Message-ID: <dc4adf31-e92e-e073-a1ed-2da0015c9de8@ghiti.fr>
Date: Fri, 26 May 2023 18:38:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH -fixes] riscv: Fix relocatable kernels with early
 alternatives using -fno-pie
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andreas Schwab <schwab@linux-m68k.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230526154630.289374-1-alexghiti@rivosinc.com>
 <20230526-clergyman-wriggly-accc659a3fad@spud>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20230526-clergyman-wriggly-accc659a3fad@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_093823_492679_6ABBE278 
X-CRM114-Status: GOOD (  17.38  )
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


On 26/05/2023 18:24, Conor Dooley wrote:
> On Fri, May 26, 2023 at 05:46:30PM +0200, Alexandre Ghiti wrote:
>> Early alternatives are called with the mmu disabled, and then should not
>> access any global symbols through the GOT since it requires relocations,
>> relocations that we do before but *virtually*. So only use medany code
>> model for this early code.
>>
>> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
>> ---
>>
>> Note that I'm not very happy with this fix, I think we need to put more
>> effort into "harmonizing" this very early code (ie before the mmu is
>> enabled) as it is spread between different locations and compiled
>> differently.
> Totally & I'll happily spend the time trying to review that work.
>
>> I'll work on that later, but for now, this fix does what is
>> needed to work (from my testing at least). Any Tested-by on the Unmatched
>> and T-head boards is welcome!
> On 6.4-rc1 & v6.4-rc1 + this patch, with CONFIG_RELOCATABLE added to my
> config, my Nezha fails to boot. There is no output whatsoever from the
> kernel. Turning off CONFIG_RELOCATABLE boots again.


Damn, that's going to ruin my long week-end...Thanks though, I'll try to 
figure out what's going on, too bad I don't have any thead boards!

Thanks again,

Alex


> I didn't test on my unmatched.
>
> Thanks,
> Conor.
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
