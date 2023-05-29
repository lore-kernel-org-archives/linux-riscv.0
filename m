Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B8FCC77B7E
	for <linux-riscv@archiver.kernel.org>; Mon, 29 May 2023 18:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=51vAg5hoJjEEzRpncYuuygJyONEtSSgEHDFm28VPPUg=; b=hxXMPJVT7F2cLS
	p0johUkdRIi0to3iwPD0QH1duR8UGBMzNUeiMfvjPb0HZFTnxESjclVpRlc2Kp897aX8OsEaxEpDU
	2OugayDmoP7nbmnwtchmJAqYiJ9CCaSQmiIYFBscml9em5f6EM8z9E7AshZLGwkjHB3e2m2y+ePaI
	Sh9FiwwNZBKZbzQ0kPxCMZ7KoYyNI1iZT85fyM7Vx7LKXaxBdnP0+q7HRSogBtYqlopasJSHqGXum
	FTwZDkQLIAhN5BzJaddAlM941egkrSDGLuktY0J+CFXf7rbM8fcKdYmHMQyZWH4i8i/DMEPStj78G
	Lc85anBJbf80bJyy47Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3hyc-00BRwo-0L;
	Mon, 29 May 2023 18:52:18 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3hyY-00BRuw-0S
	for linux-riscv@lists.infradead.org;
	Mon, 29 May 2023 18:52:16 +0000
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id CFB821BF203;
	Mon, 29 May 2023 18:52:00 +0000 (UTC)
Message-ID: <b71dc2f5-fdc0-2a8d-e1f9-696cd9a1529e@ghiti.fr>
Date: Mon, 29 May 2023 20:51:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH -fixes] riscv: Fix relocatable kernels with early
 alternatives using -fno-pie
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andreas Schwab <schwab@linux-m68k.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230526154630.289374-1-alexghiti@rivosinc.com>
 <20230526-clergyman-wriggly-accc659a3fad@spud>
 <20230526-rockfish-moody-f6d3e71f9d24@spud>
 <f6522c82-01bd-8a03-579d-a5b294784480@ghiti.fr>
 <20230527-hyperlink-doctrine-ef22cfcb508a@spud>
 <CAHVXubgx3uBEjMLHXTxr0192ZHbSb=qK4NggZyWQTDfgrJt2-g@mail.gmail.com>
 <20230528-darkness-grandly-6cb9e014391d@spud>
 <cf0d2d2a-c407-7b3d-a5ab-ea5c19e7b890@ghiti.fr>
 <20230528-uneatable-earpiece-3f8673548863@spud>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20230528-uneatable-earpiece-3f8673548863@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_115214_444830_80B9758C 
X-CRM114-Status: GOOD (  23.46  )
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


On 28/05/2023 15:56, Conor Dooley wrote:
> On Sun, May 28, 2023 at 03:42:59PM +0200, Alexandre Ghiti wrote:
>> Hmmm, it still works for me with both clang and gcc-9.
> gcc-9 is a bit of a relic, do you have more recent compilers lying
> around? If not, I can try some older compilers at some point.
>
>> You don't have to do that now but is there a way I could get your compiled
>> image? With the sha1 used to build it? Sorry, I don't see what happens, I
>> need to get my hands dirty in some debug!
> What do you mean by "sha1"? It falls with v6.4-rc1 which is a stable
> hash, if that's what you're looking for.
>
> Otherwise,
> https://github.com/ConchuOD/riscv-env/releases/download/v2022.03/vmlinux.bin
> (ignore the release crap haha, too lazy to find a proper hosting
> mechanism)


Ok, I don't get much info without the symbols, can you also provide the 
vmlinux please? But at least your image does not boot, not during the 
early boot though because the mmu is enabled.

I tried with gcc-12 and it still works fine on my end, so frustrating!


> | git show
> | commit 3bd124485ed55d8ee6c1ff3532c8f617b24aa6ef (HEAD)
> | Author: Alexandre Ghiti <alexghiti@rivosinc.com>
> | Date:   Fri May 26 17:46:30 2023 +0200
> |
> |     riscv: Fix relocatable kernels with early alternatives using -fno-pie
> |
> |     Early alternatives are called with the mmu disabled, and then should not
> |     access any global symbols through the GOT since it requires relocations,
> |     relocations that we do before but *virtually*. So only use medany code
> |     model for this early code.
> |
> |     Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> |     Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> |
> | diff --git a/arch/riscv/errata/Makefile b/arch/riscv/errata/Makefile
> | index a1055965fbee..7b2637c8c332 100644
> | --- a/arch/riscv/errata/Makefile
> | +++ b/arch/riscv/errata/Makefile
> | @@ -1,2 +1,6 @@
> | +ifdef CONFIG_RELOCATABLE
> | +KBUILD_CFLAGS += -fno-pie
> | +endif
> | +
> |  obj-$(CONFIG_ERRATA_SIFIVE) += sifive/
> |  obj-$(CONFIG_ERRATA_THEAD) += thead/
> | diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> | index fbdccc21418a..153864e4f399 100644
> | --- a/arch/riscv/kernel/Makefile
> | +++ b/arch/riscv/kernel/Makefile
> | @@ -23,6 +23,10 @@ ifdef CONFIG_FTRACE
> |  CFLAGS_REMOVE_alternative.o = $(CC_FLAGS_FTRACE)
> |  CFLAGS_REMOVE_cpufeature.o = $(CC_FLAGS_FTRACE)
> |  endif
> | +ifdef CONFIG_RELOCATABLE
> | +CFLAGS_alternative.o += -fno-pie
> | +CFLAGS_cpufeature.o += -fno-pie
> | +endif
> |  ifdef CONFIG_KASAN
> |  KASAN_SANITIZE_alternative.o := n
> |  KASAN_SANITIZE_cpufeature.o := n
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
