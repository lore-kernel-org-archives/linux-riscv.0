Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8A01D5CC89
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Dec 2025 09:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ohZpV8HyF4lhYTYKXOzp+F3x6ydSDNolFyss4DKU6qo=; b=w8j4z0+BK5oo51
	gO9pH0t4jnj3MT/u8om3qwrNvxPPiRqisBDuOw4ESArsL5oIWmYHTXrJurIpmbu7qn3UlyjZzOXqN
	Q3UQzYkcIfH/csrtoYxmMAR4Xj9LbzmUjXKzMYOuCYjVC66B5sUtZR0qsFqrV0F7UlXImNjF6PXNw
	jYRCzENpd81H0Mbvkj1oI8eOuGuMTDgYCxhdy/w5ngWDWuF3wuCpwQLoUphgxiIvAO+U5k92YRnDY
	IcZ787nh49St0+3WRK7DBLPtPxulmBC8M9Az3hmaK1j76Qd2GVRB8PXDXCpruDizyovTG5p/dxEee
	pd/WrrXFXgzbadvWWeyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVRB7-00000004yb5-1dcJ;
	Tue, 16 Dec 2025 09:17:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVRB4-00000004yaM-06g0;
	Tue, 16 Dec 2025 09:17:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B6985FEC;
	Tue, 16 Dec 2025 01:16:57 -0800 (PST)
Received: from [10.57.91.77] (unknown [10.57.91.77])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E956C3F73B;
	Tue, 16 Dec 2025 01:16:59 -0800 (PST)
Message-ID: <9ae8655f-e537-43bb-ae0e-3067d2481d79@arm.com>
Date: Tue, 16 Dec 2025 09:16:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] randomize_kstack: Unify random source across
 arches
Content-Language: en-GB
To: Ard Biesheuvel <ardb@kernel.org>, Kees Cook <kees@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, Arnd Bergmann
 <arnd@arndb.de>, Mark Rutland <mark.rutland@arm.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Jeremy Linton
 <jeremy.linton@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20251215163520.1144179-1-ryan.roberts@arm.com>
 <20251215163520.1144179-4-ryan.roberts@arm.com>
 <202512160024.B688A8D0@keescook>
 <CAMj1kXHaqfEqDpvC-iC1fUn+JpTj=oqfM2sh+sbaC8_PBVHBUQ@mail.gmail.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <CAMj1kXHaqfEqDpvC-iC1fUn+JpTj=oqfM2sh+sbaC8_PBVHBUQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_011706_114245_DA2F2F50 
X-CRM114-Status: GOOD (  13.44  )
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

On 16/12/2025 08:30, Ard Biesheuvel wrote:
> On Tue, 16 Dec 2025 at 09:27, Kees Cook <kees@kernel.org> wrote:
>>
>> On Mon, Dec 15, 2025 at 04:35:17PM +0000, Ryan Roberts wrote:
>>> [...]
>>> @@ -45,9 +46,22 @@ DECLARE_STATIC_KEY_MAYBE(CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT,
>>>  #define KSTACK_OFFSET_MAX(x) ((x) & 0b1111111100)
>>>  #endif
>>>
>>> +DECLARE_PER_CPU(struct rnd_state, kstack_rnd_state);
>>> +
>>> +static __always_inline u32 get_kstack_offset(void)
>>> +{
>>> +     struct rnd_state *state;
>>> +     u32 rnd;
>>> +
>>> +     state = &get_cpu_var(kstack_rnd_state);
>>> +     rnd = prandom_u32_state(state);
>>> +     put_cpu_var(kstack_rnd_state);
>>> +
>>> +     return rnd;
>>> +}
>>> [...]
>>> -static inline void random_kstack_task_init(struct task_struct *tsk)
>>> +static int random_kstack_init(void)
>>>  {
>>> -     tsk->kstack_offset = 0;
>>> +     prandom_seed_full_state(&kstack_rnd_state);
>>> +     return 0;
>>>  }
>>> +
>>> +late_initcall(random_kstack_init);
>>
>> Doesn't this need to be run for every CPU? (And how does hotplug work
>> for such things?) And doesn't it need a get_cpu_var?
>>
> 
> 
>  prandom_seed_full_state() takes a 'struct rnd_state __percpu
> *pcpu_state', and performs the initialization for all possible CPUs.

Yes, indeed, prandom_seed_full_state() is initializing all possible CPUs so it
doesn't matter if it gets migrated. I believe this is correct as is.

void prandom_seed_full_state(struct rnd_state __percpu *pcpu_state)
{
	int i;

	for_each_possible_cpu(i) {
		struct rnd_state *state = per_cpu_ptr(pcpu_state, i);
		u32 seeds[4];

		get_random_bytes(&seeds, sizeof(seeds));
		state->s1 = __seed(seeds[0],   2U);
		state->s2 = __seed(seeds[1],   8U);
		state->s3 = __seed(seeds[2],  16U);
		state->s4 = __seed(seeds[3], 128U);

		prandom_warmup(state);
	}
}


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
