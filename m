Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6FF0C71151
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 15:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/ANrPWB61Zpi7wJx26vIDed6FMNFPD0US7EoHOBAjrc=; b=b+TfRgFvBtGxWY
	/lcrIdZzcuIK0xX8wepYNKz6TTSdqf6d/djKBFKZW1HF3NalBYgBEyui1cHcQB/75dQkp7FJbLhWb
	lC3fd43vu/xKEwiIUEgjpEr0YgmOAd2/uSUJEQgzeZcxq08oyQSMn+IH6WQwjiHV4vrU0E7iZjFSj
	LpJK1+RXIfItODqiaXLfOR64x+nvVg5Qzyzzh3dmrzoyb6lC759ZlhHYXfDoiOOCzxyr030pyQ8YU
	374n4Y+xjCt8qIexfpSaR+ir7HdZwGF88fqMdLTLTRr1ikkm91tVueDEWkFH4Dbs2iY9K5A6HwUgj
	CfBHodpK8RPqPr2UyICA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ6DQ-0000000Gr0F-1Gww;
	Fri, 13 Jun 2025 15:21:12 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ55n-0000000GdEk-33uu
	for linux-riscv@lists.infradead.org;
	Fri, 13 Jun 2025 14:09:17 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C49C043980;
	Fri, 13 Jun 2025 14:09:09 +0000 (UTC)
Message-ID: <d97aed60-fae0-45bc-8e37-2752f1920a4f@ghiti.fr>
Date: Fri, 13 Jun 2025 16:09:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v7 1/3] riscv: Add RISC-V Svrsw60t59b extension
 support
To: Chunyan Zhang <zhang.lyra@gmail.com>, Deepak Gupta <debug@rivosinc.com>
Cc: Chunyan Zhang <zhangchunyan@iscas.ac.cn>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrew Morton <akpm@linux-foundation.org>, Ved Shanbhogue
 <ved@rivosinc.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250409095320.224100-1-zhangchunyan@iscas.ac.cn>
 <20250409095320.224100-2-zhangchunyan@iscas.ac.cn>
 <aEMeKIBDKUTUI3B1@debug.ba.rivosinc.com>
 <CAAfSe-tUNxzHq-GeN6AhX=46mu5iMYV4OZPNRU1pKf_2xAfGVQ@mail.gmail.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <CAAfSe-tUNxzHq-GeN6AhX=46mu5iMYV4OZPNRU1pKf_2xAfGVQ@mail.gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddukeduhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnhepgeduleffheeggeeugeffgfejieeludffgeegudefgfevueeiveejleetleeuteffnecuffhomhgrihhnpehsohhurhgtvgifrghrvgdrohhrghdpihhnfhhrrgguvggrugdrohhrghenucfkphepvdgrtdegmegtvggttdemudduudgvmegsgeegleemkehfudgrmegtfhhfudemrgefkedtmegufeduvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtgeemtggvtgdtmeduudduvgemsgeggeelmeekfhdurgemtghffhdumegrfeektdemugefudgvpdhhvghloheplgfkrfggieemvdgrtdegmegtvggttdemudduudgvmegsgeegleemkehfudgrmegtfhhfudemrgefkedtmegufeduvggnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepiihhrghnghdrlhihrhgrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggvsghughesrhhivhhos
 hhinhgtrdgtohhmpdhrtghpthhtohepiihhrghnghgthhhunhihrghnsehishgtrghsrdgrtgdrtghnpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtoheprghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopegrkhhpmheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepvhgvugesrhhivhhoshhinhgtrdgtohhm
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_070915_909852_2629884F 
X-CRM114-Status: GOOD (  14.62  )
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

Hi Chunyan,

On 6/12/25 08:48, Chunyan Zhang wrote:
> Hi Deepak,
>
> On Sat, 7 Jun 2025 at 00:58, Deepak Gupta <debug@rivosinc.com> wrote:
>> On Wed, Apr 09, 2025 at 05:53:18PM +0800, Chunyan Zhang wrote:
>>> The Svrsw60t59b extension allows to free the PTE reserved bits 60
>>> and 59 for software to use.
>>>
>>> Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
>>> ---
>>> arch/riscv/Kconfig             | 13 +++++++++++++
>>> arch/riscv/include/asm/hwcap.h |  1 +
>>> arch/riscv/kernel/cpufeature.c |  1 +
>>> 3 files changed, 15 insertions(+)
>>>
>>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>>> index bbec87b79309..332fc00243ad 100644
>>> --- a/arch/riscv/Kconfig
>>> +++ b/arch/riscv/Kconfig
>>> @@ -842,6 +842,19 @@ config RISCV_ISA_ZICBOZ
>>>
>>>           If you don't know what to do here, say Y.
>>>
>>> +config RISCV_ISA_SVRSW60T59B
>>> +      bool "Svrsw60t59b extension support for using PTE bits 60 and 59"
>>> +      depends on RISCV_ALTERNATIVE
>> depends on MMU && 64BIT as well.
> Ok, I will address in the next version.
>
> Thanks for the review,
> Chunyan
>
>>> +      default y
>>> +      help
>>> +        Adds support to dynamically detect the presence of the SVRSW60T59B


s/SVRSW60T59B/Svrsw60t59b

You can add:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alexandre Ghiti


>>> +        extension and enable its usage.
>>> +
>>> +        The Svrsw60t59b extension allows to free the PTE reserved bits 60
>>> +        and 59 for software to use.
>>> +
>>> +        If you don't know what to do here, say Y.
>>> +
>>> config TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI
>>>        def_bool y
>>>        # https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=aed44286efa8ae8717a77d94b51ac3614e2ca6dc
>>> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
>>> index e3cbf203cdde..985f6dfc80ed 100644
>>> --- a/arch/riscv/include/asm/hwcap.h
>>> +++ b/arch/riscv/include/asm/hwcap.h
>>> @@ -105,6 +105,7 @@
>>> #define RISCV_ISA_EXT_ZVFBFWMA                96
>>> #define RISCV_ISA_EXT_ZAAMO           97
>>> #define RISCV_ISA_EXT_ZALRSC          98
>>> +#define RISCV_ISA_EXT_SVRSW60T59B     99
>>>
>>> #define RISCV_ISA_EXT_XLINUXENVCFG    127
>>>
>>> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
>>> index 2054f6c4b0ae..0f0f3027d400 100644
>>> --- a/arch/riscv/kernel/cpufeature.c
>>> +++ b/arch/riscv/kernel/cpufeature.c
>>> @@ -523,6 +523,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
>>>        __RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
>>>        __RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
>>>        __RISCV_ISA_EXT_DATA(svvptc, RISCV_ISA_EXT_SVVPTC),
>>> +      __RISCV_ISA_EXT_DATA(svrsw60t59b, RISCV_ISA_EXT_SVRSW60T59B),
>>> };
>>>
>>> const size_t riscv_isa_ext_count = ARRAY_SIZE(riscv_isa_ext);
>>> --
>>> 2.34.1
>>>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
