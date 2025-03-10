Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68FD4C282DE
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Mar 2025 13:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yl/FdDRvIjjbJi20QCDvKf3xF3QoHOuGuDqR5PZKEHY=; b=ATiZP3o8kXR6L/
	XoeBpP1S9UjGTLQanISGxCg5LuEzucY2/MigIscrYFxRQ/2PBpnLqDu3/lfCxEnIGOGkRFY/YPXZu
	BzXYWz7iWPJ++aIiBiocxkdHoO76fH1AgjqUewMXdTtBtXnZPK/3FR+sdhVCcCb/9vGh026kqWVGg
	FbKUf71/E636xgB0nNcfyyRVsPzgbs8LrApXbXfHnrh25Jtb1+5Is2tfkxZAOjguuoYmsUV/WZTzh
	lCN+eCBO+QfDoRha6oCkSYmndMWNn2w8WY+DpghVnzAgd6Q5WLg4bWb71SaIFsGh+wSH2WImRm6Kn
	RX8aVSKVDNiXTJBrLDTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trdKo-00000002oiC-1Hhn;
	Mon, 10 Mar 2025 13:38:22 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trcKn-00000002dsy-2CeX
	for linux-riscv@lists.infradead.org;
	Mon, 10 Mar 2025 12:34:19 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8EF2D4432D;
	Mon, 10 Mar 2025 12:34:10 +0000 (UTC)
Message-ID: <ce034f2b-2f6e-403a-81f1-680af4c72929@ghiti.fr>
Date: Mon, 10 Mar 2025 13:34:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] RISC-V CRC optimizations
Content-Language: en-US
To: Ignacio Encinas Rubio <ignacio@iencinas.com>,
 Eric Biggers <ebiggers@kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-riscv@lists.infradead.org,
 Zhihang Shao <zhihang.shao.iscas@gmail.com>, Ard Biesheuvel
 <ardb@kernel.org>, Xiao Wang <xiao.w.wang@intel.com>,
 Charlie Jenkins <charlie@rivosinc.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>, skhan@linuxfoundation.org
References: <20250216225530.306980-1-ebiggers@kernel.org>
 <20250224180614.GA11336@google.com>
 <87ikorl0r5.fsf@all.your.base.are.belong.to.us>
 <20250302220426.GC2079@quark.localdomain>
 <a081958f-0ae8-4b8b-b49f-81378f3c05a7@iencinas.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <a081958f-0ae8-4b8b-b49f-81378f3c05a7@iencinas.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduudelfeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpeetieeitefghfeuvddvjeeiudehheeiffffgeeviedtleehgeffgfdtveekteehudenucffohhmrghinhepihhnfhhrrgguvggrugdrohhrghenucfkphepvddttddumeekiedumeeffeekvdemvghfledtmegsfhgsgeemsggsfhhfmedvgeeisgemfegtheefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeeffeekvdemvghfledtmegsfhgsgeemsggsfhhfmedvgeeisgemfegtheefpdhhvghloheplgfkrfggieemvddttddumeekiedumeeffeekvdemvghfledtmegsfhgsgeemsggsfhhfmedvgeeisgemfegtheefngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopedugedprhgtphhtthhopehighhnrggtihhosehivghntghinhgrshdrtghomhdprhgtphhtthhopegvsghighhgvghrsheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheps
 ghjohhrnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlqdhmvghnthgvvghssehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqtghrhihpthhosehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_053417_701383_45438335 
X-CRM114-Status: GOOD (  22.55  )
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

Hi Ignacio,

On 08/03/2025 13:58, Ignacio Encinas Rubio wrote:
> Hello!
>
> On 2/3/25 23:04, Eric Biggers wrote:
>> So, quite positive results.  Though, the fact the msb-first CRCs are (still) so
>> much slower than lsb-first ones indicates that be64_to_cpu() is super slow on
>> RISC-V.  That seems to be caused by the rev8 instruction from Zbb not being
>> used.  I wonder if there are any plans to make the endianness swap macros use
>> rev8, or if I'm going to have to roll my own endianness swap in the CRC code.
>> (I assume it would be fine for the CRC code to depend on both Zbb and Zbc.)
> I saw this message the other day and started working on a patch, but I
> would like to double-check I'm on the right track:
>
> - be64_to_cpu ends up being __swab64 (include/uapi/linux/swab.h)
>
> If Zbb was part of the base ISA, turning CONFIG_ARCH_USE_BUILTIN_BSWAP
> would take care of the problem, but it is not the case.
>
> Therefore, we have to define __arch_swab<X> like some "arches"(?) do in
> arch/<ARCH>/include/uapi/asm/swab.h
>
> For those functions to be correct in generic kernels, we would need to
> use ALTERNATIVE() macros like in arch/riscv/include/asm/bitops.h.
> Would this be ok? I'm not sure if the ALTERNATIVEs overhead can be a
> problem here.


Yes, using alternatives here is the right way to go. And the only 
overhead when Zbb is available would be a nop (take a look at lib/csum.c).

Thanks for working on this, looking forward to your patch,

Alex


> Thanks in advance :)
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
