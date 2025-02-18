Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD7FC02198
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Feb 2025 04:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bGck+sR+dUYx7Lb1Vs3Glj136OcI0kJb8Y+ZV3LG49g=; b=UJz8Ut4eJ02riC
	LQPz/+kCdqEusZgfqARc9MaZPuGc0USGvqOkPC25uyI6yjCmzJ9jETxb+BxNyxhCRSQgYM7L1WOdR
	3vMgyKQqqMFGGg+sV0O3AZr6Orn1bd6LiB1WEPPtDoK2x5j+6MJ2dNU/48ZsUemuAhz6E0ZIXLEXm
	tKeOd5lBTYB+sw22MYjsxnTdJ3jAt6H3zgcQkBHDgi4VyiDyT+1WF2ZQZfEez5wH9m6mzCpTi5W5X
	EKDN0QVTiLdxKakE4uaEWr4VL+yGm7QgUdgGRmOOuhDvuCTpER6my5siAXTw2t43ZkBe4j83wcFnW
	IerRsUVHkq/cYf9JZIZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkFdW-00000006n6P-33Yp;
	Tue, 18 Feb 2025 04:55:10 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkFdT-00000006n5Y-0nZb
	for linux-riscv@lists.infradead.org;
	Tue, 18 Feb 2025 04:55:09 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 135F544291;
	Tue, 18 Feb 2025 04:55:01 +0000 (UTC)
Message-ID: <ca8bf710-f77a-42b7-92ed-5d6ef9fe44b5@ghiti.fr>
Date: Tue, 18 Feb 2025 05:55:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: mm/workingset.c:621 workingset_update_node() warn: unsigned '_x'
 is never less than zero.
Content-Language: en-US
To: Andrew Morton <akpm@linux-foundation.org>,
 kernel test robot <lkp@intel.com>
Cc: Shakeel Butt <shakeel.butt@linux.dev>, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 "T.J. Mercier" <tjmercier@google.com>, linux-riscv@lists.infradead.org
References: <202502160323.ZLUfooA0-lkp@intel.com>
 <20250217202127.cf92afe2c0a89d5865e1811b@linux-foundation.org>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250217202127.cf92afe2c0a89d5865e1811b@linux-foundation.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeitdeflecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnhepkeefkeetveejgfelheefvefhvedvfefhieegiedtkefgjeetffejueekgefggfeunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdptddurdhorhhgpdhinhhfrhgruggvrggurdhorhhgnecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemugeifeejmegrhehfieemrgefhedtmeejvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeeffeekvdemvghfledtmeguieefjeemrgehfheimegrfeehtdemjedviedphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemugeifeejmegrhehfieemrgefhedtmeejvdeingdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeelpdhrtghpthhtoheprghkphhmsehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehlkhhpsehinhhtvghlr
 dgtohhmpdhrtghpthhtohepshhhrghkvggvlhdrsghuthhtsehlihhnuhigrdguvghvpdhrtghpthhtohepohgvqdhksghuihhlugdqrghllheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmmheskhhvrggtkhdrohhrghdprhgtphhtthhopehrohhmrghnrdhguhhshhgthhhinheslhhinhhugidruggvvhdprhgtphhtthhopehtjhhmvghrtghivghrsehgohhoghhlvgdrtghomh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_205507_369909_5EAF6760 
X-CRM114-Status: UNSURE (   9.83  )
X-CRM114-Notice: Please train this message.
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

Hi Andrew,

On 18/02/2025 05:21, Andrew Morton wrote:
> On Sun, 16 Feb 2025 03:56:06 +0800 kernel test robot <lkp@intel.com> wrote:
>
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>> head:   7ff71e6d923969d933e1ba7e0db857782d36cd19
>> commit: 4715c6a753dccd15fd3a8928168f57e349205bd4 mm: cleanup WORKINGSET_NODES in workingset
>> date:   9 months ago
>> config: riscv-randconfig-r073-20250213 (https://download.01.org/0day-ci/archive/20250216/202502160323.ZLUfooA0-lkp@intel.com/config)
>> compiler: riscv32-linux-gcc (GCC) 14.2.0
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202502160323.ZLUfooA0-lkp@intel.com/
>>
>> New smatch warnings:
>> mm/workingset.c:621 workingset_update_node() warn: unsigned '_x' is never less than zero.
>> mm/workingset.c:746 shadow_lru_isolate() warn: unsigned '_x' is never less than zero.
>>
>> Old smatch warnings:
>> include/linux/mm.h:1306 virt_to_head_page() warn: unsigned '_x' is never less than zero.
>>
>> vim +/_x +621 mm/workingset.c
>>
>>     617	
>>     618	void workingset_update_node(struct xa_node *node)
>>     619	{
>>     620		struct address_space *mapping;
>>   > 621		struct page *page = virt_to_page(node);
> We're seeing several reports like this.  It looks like the RISC-V
> virt_to_page() (actualy __pa) implementation needs some attention.


Yes, Christoph reported the same warning yesterday, we are discussing it 
since it is probably a false-positive 
https://lore.kernel.org/linux-riscv/Z7PWuSA4jtZnxp5J@rli9-mobl/T/#t.

Thanks,

Alex


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
