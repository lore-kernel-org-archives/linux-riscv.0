Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9069AC87FCF
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Aug 2025 10:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+lGEuCBm1gKvOt7N90AGfhN/tEniuZlNghMd054BsmA=; b=Ds83A3bGzVtti8
	YumL1zFMV0tKz72iuSYPB3Od71UE8VGMnuO06sdoTx9i/RyTW49jmtCWuA1lKGisnq3cQKJxdo9QJ
	HUuYzmXO8mj0jEhKMgMiANdQdeTAmV3EfkJ/IiHUssymFvnN/lusVSDXpZlw81CRjiDFAc0Dn4vc7
	R1f1q0jAeKoNOc3b5hAlWLmPgUmG00kJX3NYjgHIUfBrNGFd43O2EAEQIQCkOn6EWubgzDCR1PeZc
	D7KelcRm6ghCzzHJsHfZdPNajkH5a/qIVp8D/S/+9Cajlt4j6sLBuPbsv3b3ktzyR85tB0wLvMWHv
	3zSdtBMO1i//fwi/xgGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukh5Y-00000004NuM-3Hgt;
	Sat, 09 Aug 2025 10:46:12 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukh5V-00000004NtY-0s1k
	for linux-riscv@lists.infradead.org;
	Sat, 09 Aug 2025 10:46:11 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2C28143A1C;
	Sat,  9 Aug 2025 10:46:00 +0000 (UTC)
Message-ID: <b0fdcb23-4d68-4d0f-a8ac-2b389a0ce856@ghiti.fr>
Date: Sat, 9 Aug 2025 12:45:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: Only allow LTO with CMODEL_MEDANY
To: Nathan Chancellor <nathan@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>
Cc: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 kernel test robot <lkp@intel.com>
References: <20250710-riscv-restrict-lto-to-medany-v1-1-b1dac9871ecf@kernel.org>
 <20250808215303.GA3695089@ax162>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250808215303.GA3695089@ax162>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduvdeigeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpeettedutdekffeigfejfffffefgkefffeetfffgffevffelieeiueffffefhfdtudenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhgihhthhhusgdrtghomhdpihhnfhhrrgguvggrugdrohhrghenucfkphepudekhedrvddufedrudehgedrudegfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedukeehrddvudefrdduheegrddugeefpdhhvghloheplgdutddrudegrddtrddufegnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepkedprhgtphhtthhopehnrghthhgrnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtoheptghonhhorheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhop
 ehllhhvmheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehsthgrsghlvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlkhhpsehinhhtvghlrdgtohhm
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250809_034609_404763_CCC92F71 
X-CRM114-Status: GOOD (  17.52  )
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

Hi Nathan,

On 8/8/25 23:53, Nathan Chancellor wrote:
> Ping? This is still getting hit.


This is the second time your patches do not reach the linux-riscv 
mailing list [1] [2], not even my personal mailbox.

[1] 
https://lore.kernel.org/linux-riscv/?q=riscv%3A+Only+allow+LTO+with+CMODEL_MEDANY 

[2] 
https://lore.kernel.org/linux-riscv/?q=riscv%3A+uaccess%3A+Fix+-Wuninitialized+and+-Wshadow+in+__put_user_nocheck

I don't know what's going on, do you have any idea?

I'll pick this up in my fixes branch.

Thanks,

Alex


>
> On Thu, Jul 10, 2025 at 01:25:26PM -0700, Nathan Chancellor wrote:
>> When building with CONFIG_CMODEL_MEDLOW and CONFIG_LTO_CLANG, there is a
>> series of errors due to some files being unconditionally compiled with
>> '-mcmodel=medany', mismatching with the rest of the kernel built with
>> '-mcmodel=medlow':
>>
>>    ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899908), and 'i32 1' from vmlinux.a(net-traces.o at 1014628)
>>
>> Only allow LTO to be performed when CONFIG_CMODEL_MEDANY is enabled to
>> ensure there will be no code model mismatch errors. An alternative
>> solution would be disabling LTO for the files with a different code
>> model than the main kernel like some specialized areas of the kernel do
>> but doing that for individual files is not as sustainable than
>> forbidding the combination altogether.
>>
>> Cc: stable@vger.kernel.org
>> Fixes: 021d23428bdb ("RISC-V: build: Allow LTO to be selected")
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202506290255.KBVM83vZ-lkp@intel.com/
>> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
>> ---
>>   arch/riscv/Kconfig | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> index 36061f4732b7..4eee737a050f 100644
>> --- a/arch/riscv/Kconfig
>> +++ b/arch/riscv/Kconfig
>> @@ -68,7 +68,7 @@ config RISCV
>>   	select ARCH_SUPPORTS_HUGE_PFNMAP if TRANSPARENT_HUGEPAGE
>>   	select ARCH_SUPPORTS_HUGETLBFS if MMU
>>   	# LLD >= 14: https://github.com/llvm/llvm-project/issues/50505
>> -	select ARCH_SUPPORTS_LTO_CLANG if LLD_VERSION >= 140000
>> +	select ARCH_SUPPORTS_LTO_CLANG if LLD_VERSION >= 140000 && CMODEL_MEDANY
>>   	select ARCH_SUPPORTS_LTO_CLANG_THIN if LLD_VERSION >= 140000
>>   	select ARCH_SUPPORTS_MSEAL_SYSTEM_MAPPINGS if 64BIT && MMU
>>   	select ARCH_SUPPORTS_PAGE_TABLE_CHECK if MMU
>>
>> ---
>> base-commit: fda589c286040d9ba2d72a0eaf0a13945fc48026
>> change-id: 20250710-riscv-restrict-lto-to-medany-f1b7dd5c9bba
>>
>> Best regards,
>> --
>> Nathan Chancellor <nathan@kernel.org>
>>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
