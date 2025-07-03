Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA3A6C83F03
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Jul 2025 20:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L702/caHQQn+tDT4PCeQ1yTkoiJS0ySYznpn3RSm9Vw=; b=YAqtfUOXTHKbfX
	yrhkSPHvpho+gS+xu+SdqoXMjlPCza+EhWziLmmcMxpbh3nWNmsdeOo11+dsHrYBFenhkrHtyoD+m
	y/cE8Qz+SQ/KQJbOGs6tGFdZRto4MBk7lGjH2SeqtPykRoaHwzfqSUZ+jvKPBgZZ87faqR4I4MY8p
	2Lydk1dy+ibVW3+v7YUQOonEfeFtsAs+DZgqFG9Fx4fxx1Hno9fROen9nZNMDu/DwqPubaGHuXVEy
	2cmmS+s4yGMXtGX+KcpcMSSnrSoxXnvSkvMZeaA9X6avcUkTAla7A6e4CvgABYubq03Z0UjCN+q54
	Cy2BMseqk8I609iWu73w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXR1r-0000000CWlo-2zFY;
	Thu, 03 Jul 2025 20:59:35 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXMSV-0000000BwHy-1zhn
	for linux-riscv@lists.infradead.org;
	Thu, 03 Jul 2025 16:06:49 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 03A5041C7D;
	Thu,  3 Jul 2025 16:06:41 +0000 (UTC)
Message-ID: <5ac2c90c-5907-40ce-a31e-05cb6d88fa52@ghiti.fr>
Date: Thu, 3 Jul 2025 18:06:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: ftrace: Fix the logic issue in DYNAMIC_FTRACE
 selection
To: Steven Rostedt <rostedt@goodmis.org>
Cc: ChenMiao <chenmiao.ku@gmail.com>,
 Linux RISCV <linux-riscv@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250703084502.394406-1-chenmiao.ku@gmail.com>
 <f7e12c6d-892e-4ca3-9ef0-fbb524d04a48@ghiti.fr>
 <20250703114018.6fab0b8a@batman.local.home>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250703114018.6fab0b8a@batman.local.home>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvtdejudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnhepheeihfdutdduudekteekheehtdffudfhveeffedtfeevfffgueffjeejjeefkeeunecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepvddttddumeekiedumeeffeekvdemvghfledtmedvugegleemhegsudelmegrsgguieemkehfiegsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeeffeekvdemvghfledtmedvugegleemhegsudelmegrsgguieemkehfiegspdhhvghloheplgfkrfggieemvddttddumeekiedumeeffeekvdemvghfledtmedvugegleemhegsudelmegrsgguieemkehfiegsngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeekpdhrtghpthhtoheprhhoshhtvgguthesghhoohgumhhishdrohhrghdprhgtphhtthhopegthhgvnhhmihgrohdrkhhusehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhug
 idqrhhishgtvhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_090647_665549_2175E941 
X-CRM114-Status: GOOD (  12.85  )
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

Hi Steve,

On 7/3/25 17:40, Steven Rostedt wrote:
> On Thu, 3 Jul 2025 15:00:02 +0200
> Alexandre Ghiti <alex@ghiti.fr> wrote:
>
>
>> We could support static ftrace, but I don't think we should, so I agree
>> with this patch. In fact I had just prepared a patch for this here
>> https://github.com/linux-riscv/linux/pull/556/commits/0481092a5bec3818658981c11f629e06e66382b3
>> which is a bit more complete since I have removed some dead code.
>>
>> Let's see what other people think about supporting static ftrace, I have
>> added Steven in cc if he has an opinion.
> Yes, please only support the dynamic ftrace. The static is there only
> to help archs to get ftrace up and running. Once dynamic is supported,
> static should not be used.
>
> Hmm, maybe I should just remove the prompt for DYNAMIC_FTRACE.
>
> That is, once it is supported by an architecture, it should be the only
> thing used.
>
> -- Steve


Thanks for your input.

@ChenMiao: can you come up with a v2 that, in addition, deletes the dead 
code and with a commit log that explains what Steven said? If not 
possible for you, let me know and I'll do it.

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
