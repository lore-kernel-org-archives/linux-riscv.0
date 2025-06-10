Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A47BC677C4
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 22:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MYM+Twy71yZ5i4H9vDWeZWcCZOSYPVQHSRM+bGvIZpU=; b=BTrIANtsZqUpRu
	Z0ZsO1eSEZf/DekUUuFJcMOwAtdOtEs0EDGUvmGTzvprUsofPaUuGswPfIbPuw4Hx+ycRiems0blp
	TDpeP/5l9LFFejCLHKLJDsmqyiSFdFwk7tbnWb0goJ48YAdt+cEcFv4WXJ/ApbfZjz6rcpOr96Gxe
	JFjaex8njnAojSnA1uQ55/SxXyX0S0MovoJNdpYLwQ3k5EEkNGVG5VeyfKlobabxtw7005+cG8s7s
	+b3diPdd6FNdof71huhLQk2W1iF9hFy3laxjUy+3o6fxYA5udHFIvESD7s+kjUXB+Gp4GzRe9F6PB
	5MY6AXGEExtbcKPBgrkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP7mW-00000008H0c-25Cm;
	Tue, 10 Jun 2025 22:49:24 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP4ZE-00000007ukJ-1vg3
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 19:23:30 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 50479441D4;
	Tue, 10 Jun 2025 19:23:19 +0000 (UTC)
Message-ID: <d052f010-410a-4405-9ae6-f679649851ea@ghiti.fr>
Date: Tue, 10 Jun 2025 21:23:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Fix a segmentation fault also add raid6test for
 RISC-V support
To: Chunyan Zhang <zhangchunyan@iscas.ac.cn>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Charlie Jenkins <charlie@rivosinc.com>, Song Liu <song@kernel.org>,
 Yu Kuai <yukuai3@huawei.com>
Cc: linux-riscv@lists.infradead.org, linux-raid@vger.kernel.org,
 linux-kernel@vger.kernel.org, Chunyan Zhang <zhang.lyra@gmail.com>
References: <20250610101234.1100660-1-zhangchunyan@iscas.ac.cn>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250610101234.1100660-1-zhangchunyan@iscas.ac.cn>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdduudduhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnhephffhuddtveegleeggeefledtudfhudelvdetudfhgeffffeigffgkeethfejudejnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepvddttddumeekiedumeeffeekvdemvghfledtmegtgeduugemfedukeeimedvugdvvdemugehvdgtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeeffeekvdemvghfledtmegtgeduugemfedukeeimedvugdvvdemugehvdgtpdhhvghloheplgfkrfggieemvddttddumeekiedumeeffeekvdemvghfledtmegtgeduugemfedukeeimedvugdvvdemugehvdgtngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeduuddprhgtphhtthhopeiihhgrnhhgtghhuhhnhigrnhesihhstggrshdrrggtrdgtnhdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtp
 hhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtoheptghhrghrlhhivgesrhhivhhoshhinhgtrdgtohhmpdhrtghpthhtohepshhonhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopeihuhhkuhgrihefsehhuhgrfigvihdrtghomhdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_122328_652943_A69D5B9D 
X-CRM114-Status: GOOD (  14.65  )
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

On 6/10/25 12:12, Chunyan Zhang wrote:
> The first two patches are fixes.
> The last two are for userspace raid6test support on RISC-V.
>
> The issue fixed in patch 2/4 was probably the same which was spotted by
> Charlie [1], I couldn't reproduce it at that time.
>
> When running raid6test in userspace on RISC-V, I saw a segmentation fault,
> I used gdb command to print pointer p, it was an unaccessible address.


Can you give me your config, kernel and toolchain versions? I can't 
reproduce the segfault on my machine.

Thanks for the fixes and the test, I'll take a look this week.

Alex


>
> With patch 2/4, the issue didn't appear anymore.
>
> [1] https://lore.kernel.org/lkml/Z5gJ35pXI2W41QDk@ghost/
>
> Chunyan Zhang (4):
>    raid6: riscv: clean up unused header file inclusion
>    raid6: riscv: Fix NULL pointer dereference issue
>    raid6: riscv: Allow code to be compiled in userspace
>    raid6: test: add support for RISC-V
>
>   lib/raid6/recov_rvv.c   |  9 +-----
>   lib/raid6/rvv.c         | 62 +++++++++++++++++++++--------------------
>   lib/raid6/rvv.h         | 15 ++++++++++
>   lib/raid6/test/Makefile |  8 ++++++
>   4 files changed, 56 insertions(+), 38 deletions(-)
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
