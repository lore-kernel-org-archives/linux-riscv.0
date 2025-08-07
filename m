Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0910C87FCA
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Aug 2025 11:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TNpDAXtscc5jn8Q4+FBTetQztDu5H3rEgQfnwVA0hy4=; b=E1bkhMgybi2flr
	8pJ9qblpsdOxZfhjAV7FvuSl3MKuopyjsCCoa5ggLStX9outwRc+Tw01uQsTnoDDxlHKnGxUE0Ib1
	4TpvcGRKcqI+zMkeiDV2/n49Qm2gD4Rz0CHtQFOtbzV0ZKZ4nNlnVdLvl6Pfo3AD3o6nTIbehOQ9X
	fUF+UId0G2s4FlAKRT6MU1nIHxo8fq8YtcAhfWJAhJys5xKEx90VoCSpSRzm+7NEG1333Hc8tl9U9
	nkTlimo19TV5oEkZ/DKRXyjnZFMCQrxXF2sVo20Vl55zgn2Ag2n82T4sYmAddbT6qeqNdQlx09Hld
	EgjAExz1L8IZ5TNKlArg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujz8m-00000000Qsb-1UQx;
	Thu, 07 Aug 2025 11:50:36 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujz6k-00000000QUx-0Sed
	for linux-riscv@lists.infradead.org;
	Thu, 07 Aug 2025 11:48:31 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 27D4D4318D;
	Thu,  7 Aug 2025 11:48:25 +0000 (UTC)
Message-ID: <d5e49344-e0c2-4095-bd1f-d2d23a8e6534@ghiti.fr>
Date: Thu, 7 Aug 2025 13:48:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [tip:irq/urgent] BUILD REGRESSION
 9f7488f24c7571d349d938061e0ede7a39b65d6b
To: Thomas Gleixner <tglx@linutronix.de>, kernel test robot <lkp@intel.com>,
 x86-ml <x86@kernel.org>, Marco Bonelli <marco@mebeim.net>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <202508071514.CFNi6mo5-lkp@intel.com> <87h5yjcxqh.ffs@tglx>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <87h5yjcxqh.ffs@tglx>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduvddtkeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpeejkeeugfdthefhveelffdvgeetgeelteeijeekheehfeevtdduvdfgteevgfehffenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhinhhfrhgruggvrggurdhorhhgnecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemlehftghfmeeksghfleemleeludgumeekrggrfhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemlehftghfmeeksghfleemleeludgumeekrggrfhdphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemlehftghfmeeksghfleemleeludgumeekrggrfhgnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepiedprhgtphhtthhopehtghhlgieslhhinhhuthhrohhnihigrdguvgdprhgtphhtthhopehlkhhpsehinhhtvghlrdgtohhmpdhrtghpthhto
 hepgiekieeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrrhgtohesmhgvsggvihhmrdhnvghtpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_044830_300741_DB1F44BE 
X-CRM114-Status: GOOD (  12.74  )
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

On 8/7/25 11:00, Thomas Gleixner wrote:
> On Thu, Aug 07 2025 at 15:10, kernel test robot wrote:
>> tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/urgent
>> branch HEAD: 9f7488f24c7571d349d938061e0ede7a39b65d6b  irqchip/mvebu-gicp: Use resource_size() for ioremap()
>>
>> Error/Warning (recently discovered and may have been fixed):
>>
>>      https://lore.kernel.org/oe-kbuild-all/202508070607.QKVa8DiU-lkp@intel.com
>>
>>      ERROR: modpost: __ex_table+0x1584 references non-executable section '.rodata.__func__.103779'
>>
>> Error/Warning ids grouped by kconfigs:
>>
>> recent_errors
>> `-- riscv-randconfig-002-20250807
>>      `-- ERROR:__ex_table-references-non-executable-section-.rodata.__func__.
> This has nothing to do with the above commit. That's just a new one
> of the same type as the ones which existed before:
>
> WARNING: modpost: vmlinux: section mismatch in reference: xp_fill_cb+0x46 (section: .text.xp_fill_cb) -> .L62 (section: .init.text)
> ...
> WARNING: modpost: vmlinux: section mismatch in reference: 0x19e4 (section: __ex_table) -> .LASF400 (section: .debug_str)
>
> There are gazillions of them and that's a purely riscv specific related
> problem.


Yes that's a riscv issue that was already reported by Marco [1] who also 
found the underlying issue [2]. The problem is that we emit too many 
relocations which overflow the number of possible relocations in 32-bit. 
After discussion with some riscv gcc folks, it appears to be caused by 
relaxations which, according to the ABI, require the emission of local 
symbol. We don't have a workaround for now and we'll discuss this issue 
with the ABI authors.

[1] 
https://lore.kernel.org/linux-riscv/960240908.630790.1748641210849@privateemail.com/
[2] 
https://lore.kernel.org/all/1714337938.319508.1750244108368@privateemail.com/

Sorry for the noise,

Alex


>
> Thanks,
>
>          tglx
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
