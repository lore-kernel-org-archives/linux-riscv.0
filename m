Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EA50C83F1F
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Jul 2025 09:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ABwh69zxpH2SWkGsVQU0F979/yhOMm41gHa467cvLBg=; b=QazLFdctuqLBDb
	2SjD+gT23sLZUoGFgBfn/brodo9IV3DG7G52AbPwhJrmE6ZZ0Iriy+rUVSR+aUEJUi+Ghex9YzNbf
	Gx5vRiG8zP5IQHzJNDSPA62tb/xtQv0Ewv5JSXPF/ORz5deyfg69WTO36SgkSEozfxzrGkEDD0Ize
	QFlGVsY0E7uPtr1W0mH9bV5h5rHlDZIEu6/Y8WRls3qrpCO2ZTL6JQu//0YYPVPucmfGYsnXnHPPK
	3JSRBvwwY8M/5fwkjyCFelBg98fXqRfSUmrCMRImzKQyvec6LeDSJKbEAt/zfXHXyH+F48KN3L7dY
	gGVoZqezRnBh3FyWrUZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZnD2-0000000BHSl-1iQi;
	Thu, 10 Jul 2025 09:04:52 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZlyI-0000000B3nJ-2dVQ
	for linux-riscv@lists.infradead.org;
	Thu, 10 Jul 2025 07:45:36 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 41E0C44362;
	Thu, 10 Jul 2025 07:45:26 +0000 (UTC)
Message-ID: <6d7dad19-bf05-4109-93ac-7d688b390e1c@ghiti.fr>
Date: Thu, 10 Jul 2025 09:45:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Fix a segmentation fault also add raid6test for
 RISC-V support
To: Chunyan Zhang <zhang.lyra@gmail.com>
Cc: Chunyan Zhang <zhangchunyan@iscas.ac.cn>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Charlie Jenkins <charlie@rivosinc.com>, Song Liu <song@kernel.org>,
 Yu Kuai <yukuai3@huawei.com>, linux-riscv@lists.infradead.org,
 linux-raid@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250610101234.1100660-1-zhangchunyan@iscas.ac.cn>
 <8a1b1610-02b1-46a8-9a10-c19c1580c017@ghiti.fr>
 <CAAfSe-s1g8h+HpYz8FmW4n7h+hhi5W0_N-jpfAD5Ldai8NjwHw@mail.gmail.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <CAAfSe-s1g8h+HpYz8FmW4n7h+hhi5W0_N-jpfAD5Ldai8NjwHw@mail.gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefleekjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnhephffhuddtveegleeggeefledtudfhudelvdetudfhgeffffeigffgkeethfejudejnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepvddttddumeekiedumeeffeekvdemvghfledtmegsfehfudemjegtiegrmegsheduleemrghfsgdtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeeffeekvdemvghfledtmegsfehfudemjegtiegrmegsheduleemrghfsgdtpdhhvghloheplgfkrfggieemvddttddumeekiedumeeffeekvdemvghfledtmegsfehfudemjegtiegrmegsheduleemrghfsgdtngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeduuddprhgtphhtthhopeiihhgrnhhgrdhlhihrrgesghhmrghilhdrtghomhdprhgtphhtthhopeiihhgrnhhgtghhuhhnhigrnhesihhstggrshdrrggtrdgtnhdprhgtphhtthhop
 ehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtoheptghhrghrlhhivgesrhhivhhoshhinhgtrdgtohhmpdhrtghpthhtohepshhonhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopeihuhhkuhgrihefsehhuhgrfigvihdrtghomh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_004534_813887_7A78C3F7 
X-CRM114-Status: GOOD (  17.55  )
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

On 7/10/25 03:44, Chunyan Zhang wrote:
> Hi Alex,
>
> On Wed, 9 Jul 2025 at 23:18, Alexandre Ghiti <alex@ghiti.fr> wrote:
>> Hi Chunyan,
>>
>> Patch 2 was merged via fixes, do you plan on resending a new version for
>> 6.17 that takes into account Palmer's remarks?
> Yes, I'm preparing the patches these days, just haven't figured out
> how to set NSIZE properly for user space.


Just use hwprobe() to make sure V is supported and then csr_read(VLENB) 
to retrieve this value, no?


>
> I probably should split the patchset, send out one today.
>
> Thanks,
> Chunyan
>
>> Thanks,
>>
>> Alex
>>
>> On 6/10/25 12:12, Chunyan Zhang wrote:
>>> The first two patches are fixes.
>>> The last two are for userspace raid6test support on RISC-V.
>>>
>>> The issue fixed in patch 2/4 was probably the same which was spotted by
>>> Charlie [1], I couldn't reproduce it at that time.
>>>
>>> When running raid6test in userspace on RISC-V, I saw a segmentation fault,
>>> I used gdb command to print pointer p, it was an unaccessible address.
>>>
>>> With patch 2/4, the issue didn't appear anymore.
>>>
>>> [1] https://lore.kernel.org/lkml/Z5gJ35pXI2W41QDk@ghost/
>>>
>>> Chunyan Zhang (4):
>>>     raid6: riscv: clean up unused header file inclusion
>>>     raid6: riscv: Fix NULL pointer dereference issue
>>>     raid6: riscv: Allow code to be compiled in userspace
>>>     raid6: test: add support for RISC-V
>>>
>>>    lib/raid6/recov_rvv.c   |  9 +-----
>>>    lib/raid6/rvv.c         | 62 +++++++++++++++++++++--------------------
>>>    lib/raid6/rvv.h         | 15 ++++++++++
>>>    lib/raid6/test/Makefile |  8 ++++++
>>>    4 files changed, 56 insertions(+), 38 deletions(-)
>>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
