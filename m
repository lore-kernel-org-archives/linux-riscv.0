Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F1DCA1002
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Sep 2025 08:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3MF7+NIWNJ+T7thWrpSdXaoIKJVZQQvuD0jQJiPEbcM=; b=ldYz2mStJZmDIo
	0Z4iyzlroUeeS/OEg/JJPES1jFLTXiG9fFd0Oj6Mxxr5MN2T7UU5n++Zeh5Ol9WAWtqktou2GSt2n
	euB+vIOOE2fzV+jDkgrxCh62Duv0HJ+6fGVtd8tHA4DovdOqwO3v8jSY4YElyZA4lfVp4xSawgjf6
	AKUNhzySrprq+9zlnK3siUoF8/Ja9cfYs1ZnuHXH4BhaC4d8HMIPPiP8SdO9vvjPAOBt8VxmiCBw9
	mY/xRG7NCn8ZAyaduSqZ930/NtxgXvZa2zLG7F5ShTvR1U/cOBIitoefDVHitkK09OuHmNJJNhlZ4
	r7r6b4UOIC8gW4hpA9Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu5dI-0000000AL7P-3hWI;
	Thu, 04 Sep 2025 08:47:52 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu4ss-0000000A3S7-0znx
	for linux-riscv@lists.infradead.org;
	Thu, 04 Sep 2025 07:59:56 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id DA75643CB6;
	Thu,  4 Sep 2025 07:59:46 +0000 (UTC)
Message-ID: <ca18ee32-db74-4ec7-a6e2-805ac7abdee6@ghiti.fr>
Date: Thu, 4 Sep 2025 09:59:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] riscv: Do not handle break traps from kernel as nmi
To: Peter Zijlstra <peterz@infradead.org>,
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, Palmer Dabbelt <palmer@rivosinc.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20250903-dev-alex-break_nmi_v1-v1-1-4a3d81c29598@rivosinc.com>
 <20250903202803.GQ4067720@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250903202803.GQ4067720@noisy.programming.kicks-ass.net>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdehgeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpeetieeitefghfeuvddvjeeiudehheeiffffgeeviedtleehgeffgfdtveekteehudenucffohhmrghinhepihhnfhhrrgguvggrugdrohhrghenucfkphepvddttddumeekiedumeeffeekvdemvghfledtmeekheeftgemfegrfhegmegvfhegheemsggvudejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeeffeekvdemvghfledtmeekheeftgemfegrfhegmegvfhegheemsggvudejpdhhvghloheplgfkrfggieemvddttddumeekiedumeeffeekvdemvghfledtmeekheeftgemfegrfhegmegvfhegheemsggvudejngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeduvddprhgtphhtthhopehpvghtvghriiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopegrlhgvgihghhhithhisehrihhvohhsihhntgdrtghomhdprhgtphhtthhop
 ehrohhsthgvughtsehgohhoughmihhsrdhorhhgpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtoheprghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopehguhhorhgvnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsghjohhrnhesrhhivhhoshhinhgtrdgtohhm
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_005954_408912_0A3AA5B3 
X-CRM114-Status: GOOD (  11.21  )
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

Hi Peter,

On 9/3/25 22:28, Peter Zijlstra wrote:
> On Wed, Sep 03, 2025 at 07:54:29PM +0000, Alexandre Ghiti wrote:
>> kprobe has been broken on riscv for quite some time. There is an attempt
>> [1] to fix that which actually works. This patch works because it enables
>> ARCH_HAVE_NMI_SAFE_CMPXCHG and that makes the ring buffer allocation
>> succeed when handling a kprobe because we handle *all* kprobes in nmi
>> context. We do so because Peter advised us to treat all kernel traps as
>> nmi [2].
>>
>> But that does not seem right for kprobe handling, so instead, treat
>> break traps from kernel as non-nmi.
> You can put a kprobe inside: local_irq_disable(), no? Inside any random
> spinlock region in fact. How is the probe then not NMI like?


Yes yes, in that case that will be NMI-like, sorry this patch is coarse 
grain. The ideal solution would be to re-enable the interrupts if they 
were enabled at the moment of the trap. In that case, would that make 
sense to you?

Thanks,

Alex


>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
