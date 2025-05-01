Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E89C369DC
	for <linux-riscv@archiver.kernel.org>; Thu,  1 May 2025 09:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4SdfBvrixSg8lC5P4VI8Jqj/ikbRwXLDKDYvrckate8=; b=nvZtVPbgiPx9fW
	9Hc/CEebvQrJS1F6csgRnRuxTHMqv1P1bqInxVTBsA3gednq0AIRmf6GCFzkfzcCwPwARYaguTVcG
	b81IB2M4EpCHtaxRab+eVIeNDnVmB/4OAyyluL3dUPwhjCB/hsCviCNjnnVPb29v9c2KY84PwiGlV
	kyXfdBUhApMl7EBoH0tprWwJ2Y7hhkuaoaw1UCknmOxd3pLzX+aCaSFpn2TbUxrGoG70vxSNtz5ll
	HFqkc/GWM36qfjVcX6tb8ZnMbyUBP1OvhhZCUYIwDVI60UWxPVUWq6Gl6kE76FV9l1jfmrZf4Q9sl
	m4GgvJJGoO8V9o1Tou0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAPxp-0000000F61h-0qQL;
	Thu, 01 May 2025 09:12:17 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAPxl-0000000F60w-3bhh
	for linux-riscv@lists.infradead.org;
	Thu, 01 May 2025 09:12:15 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id CFC85439EA;
	Thu,  1 May 2025 09:12:03 +0000 (UTC)
Message-ID: <6826b6a1-8eb6-403e-b118-c1ebd5fdc2d3@ghiti.fr>
Date: Thu, 1 May 2025 11:12:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: next-20250422: arch/riscv/kernel/vdso/vdso.so.dbg: dynamic
 relocations are not supported
To: Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>
Cc: naresh.kamboju@linaro.org, anders.roxell@linaro.org,
 aou@eecs.berkeley.edu, arnd@arndb.de, dan.carpenter@linaro.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 lkft-triage@lists.linaro.org, llvm@lists.linux.dev, masahiroy@kernel.org,
 namcao@linutronix.de, palmer@dabbelt.com, regressions@lists.linux.dev
References: <CA+G9fYtN2ie+YtK3H9mrQ5QqrSCFGGjVbtJcfiYX0oHMVWMn9w@mail.gmail.com>
 <20250430154845.795993-1-ojeda@kernel.org> <20250501004434.GA3762678@ax162>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250501004434.GA3762678@ax162>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieeludelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpeejkeeugfdthefhveelffdvgeetgeelteeijeekheehfeevtdduvdfgteevgfehffenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhinhhfrhgruggvrggurdhorhhgnecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemfedvgegumegrtdegjeemfeejjedumedufegvfhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemfedvgegumegrtdegjeemfeejjedumedufegvfhdphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemfedvgegumegrtdegjeemfeejjedumedufegvfhgnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepudehpdhrtghpthhtohepnhgrthhhrghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtp
 hhtthhopehnrghrvghshhdrkhgrmhgsohhjuheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprghnuggvrhhsrdhrohigvghllheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopegrrhhnugesrghrnhgusgdruggvpdhrtghpthhtohepuggrnhdrtggrrhhpvghnthgvrheslhhinhgrrhhordhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_021214_032002_A66C3DCC 
X-CRM114-Status: GOOD (  10.66  )
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

On 01/05/2025 02:44, Nathan Chancellor wrote:
> On Wed, Apr 30, 2025 at 05:48:45PM +0200, Miguel Ojeda wrote:
>> On Wed, 23 Apr 2025 20:15:45 +0530 Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>>> build errors with clang
>>> ld.lld: error: version script assignment of 'LINUX_4.15' to symbol
>>> '__vdso_getrandom' failed: symbol not defined
>>> llvm-nm: error: arch/riscv/kernel/compat_vdso/compat_vdso.so.dbg: No
>>> such file or directory
>> I have also been seeing this too in my Rust-enabled builds for a few
>> days at least.
> I forgot to follow up here and say that I sent a patch for this, it just
> needs to be applied by the RISC-V folks.
>
> https://lore.kernel.org/20250423-riscv-fix-compat_vdso-lld-v2-1-b7bbbc244501@kernel.org/


Yes, we will, I just want to review the assembly part of the original 
patchset before!

Thanks for the heads-up,

Alex


>
> Cheers,
> Nathan
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
