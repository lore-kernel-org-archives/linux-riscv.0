Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D21BC3ABAA
	for <linux-riscv@archiver.kernel.org>; Mon,  5 May 2025 19:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fbJ7Hvfw45gvXUzHS0hjUwxxMCZZ622mOqwGOORh02s=; b=Q7eEA/TOnUE+XD
	maQx+HX2v60TOPKSrVLJdlmu0ZP5n6bp3LTaRhanMBPOUvu6JmnTy6r00AatWZsLYAfztx4EGPLTS
	eRsmQ8ffiZAJtar3XPf5GA8uUsa3mQawNCDTbyPXCftvwmeq2R4MtaZw5fkkVbLyMZyCGyVLcy7Cv
	AEo3qNcSN6mr+/1wqSBlEps7S79kmNLIOgzYE9baW1bojOpz+6QCvcXZ953lqPQNGGjO8PXKSM3UL
	LrsAjpT2bJahLdPXleC0FFyz/Nw3wnih7e35rNVHrWUNNXOoFnG/jXgldpnYpYRV88XOsvICNPyEa
	XdVIt0yjPmQqtYEtygAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC1Tt-00000008PfK-3xb0;
	Mon, 05 May 2025 19:28:01 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC1To-00000008PeS-2yxo
	for linux-riscv@lists.infradead.org;
	Mon, 05 May 2025 19:27:58 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 93A9C43A0F;
	Mon,  5 May 2025 19:27:52 +0000 (UTC)
Message-ID: <d7232e99-e899-4e50-b60f-2527be709d2c@ghiti.fr>
Date: Mon, 5 May 2025 21:27:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: Fix kernel crash due to PR_SET_TAGGED_ADDR_CTRL
Content-Language: en-US
To: Nam Cao <namcao@linutronix.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Samuel Holland <samuel.holland@sifive.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20250504101920.3393053-1-namcao@linutronix.de>
 <c59f2632-d96f-43c6-869d-5e5f743f2dbd@ghiti.fr>
 <20250505160722.s_w3u1pd@linutronix.de>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250505160722.s_w3u1pd@linutronix.de>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeduleegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpedtffduvdfhveefieefudffjeffffegudevfeffvdehhefhtddviefgledtgeehfeenucffohhmrghinhepmhgrnhhgohhpihdrohhrghdpihhnfhhrrgguvggrugdrohhrghenucfkphepvddttddumeekiedumeeffeekvdemvghfledtmedutgduvgemrgdutggsmehftdeisgemiegutdgtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeeffeekvdemvghfledtmedutgduvgemrgdutggsmehftdeisgemiegutdgtpdhhvghloheplgfkrfggieemvddttddumeekiedumeeffeekvdemvghfledtmedutgduvgemrgdutggsmehftdeisgemiegutdgtngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeekpdhrtghpthhtohepnhgrmhgtrghosehlihhnuhhtrhhonhhigidruggvpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhif
 hhivhgvrdgtohhmpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtoheprghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopehsrghmuhgvlhdrhhholhhlrghnugesshhifhhivhgvrdgtohhmpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehsthgrsghlvgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_122756_914624_0C877B52 
X-CRM114-Status: GOOD (  16.46  )
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

On 05/05/2025 18:07, Nam Cao wrote:
> Hi Alex,
>
> On Mon, May 05, 2025 at 06:02:26PM +0200, Alexandre Ghiti wrote:
>> On 04/05/2025 12:19, Nam Cao wrote:
>>> When userspace does PR_SET_TAGGED_ADDR_CTRL, but Supm extension is not
>>> available, the kernel crashes:
>>>
>>> Oops - illegal instruction [#1]
>>>       [snip]
>>> epc : set_tagged_addr_ctrl+0x112/0x15a
>>>    ra : set_tagged_addr_ctrl+0x74/0x15a
>>> epc : ffffffff80011ace ra : ffffffff80011a30 sp : ffffffc60039be10
>>>       [snip]
>>> status: 0000000200000120 badaddr: 0000000010a79073 cause: 0000000000000002
>>>       set_tagged_addr_ctrl+0x112/0x15a
>>>       __riscv_sys_prctl+0x352/0x73c
>>>       do_trap_ecall_u+0x17c/0x20c
>>>       andle_exception+0x150/0x15c
>>
>> It seems like the csr write is triggering this illegal instruction, can you
>> confirm it is?
> Yes, it is the "csr_write(CSR_ENVCFG, envcfg);" in envcfg_update_bits().
>
>> If so, I can't find in the specification that an implementation should do
>> that when writing envcfg and I can't reproduce it on qemu. Where did you
>> see this oops?
> I can't find it in the spec either. I think it is up to the implementation.


The reserved fields of senvcfg are WPRI and contrary to WLRL, it does 
not explicitly "permit" to raise an illegal instruction so I'd say it is 
not up to the implementation, I'll ask around.

Thanks,

Alex


>
> I got this crash on the MangoPI board:
> https://mangopi.org/mqpro
>
> Best regards,
> Nam
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
