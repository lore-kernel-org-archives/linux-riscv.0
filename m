Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CABDC369D8
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Apr 2025 13:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yWTxaECOT+2EkDqpovlwA3XcKiD1tWZohWQFoRsT/rw=; b=mAmvZIEa+UneAk
	9U5Ts9DYZT+/dIzmafL/UrnTQUezqz3ZuTd2ahm3r3yyv/Cr1krwvjRcTFO8gkUSN6tLcjCioucW/
	71rGyKqYe0Phd30fUyChua82hWW5P+lYxXXGT6w2xEjI4CCxuIrlpKlBjPJIr+FgKHKRAaNthGMn0
	Nzfkfl4JXROaA75EmqYCpd20ayJOqDnGwGAi1V6WYqy73Prkz5wFhm57jqj5VZUAf8L6lodlZNObq
	l0pJBT45eXEtO4fhqiY2jTaBuIteTOLMWBd2C9I7hJfC1xMzFYMZo9flMsk5Yi/IImQv6x0zYQoBj
	GCgFYQp47Bxiym9c8EMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Da8-00000007HMR-3NcS;
	Tue, 22 Apr 2025 13:22:36 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7DG4-00000007DdM-0wCp
	for linux-riscv@lists.infradead.org;
	Tue, 22 Apr 2025 13:01:53 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A3AA143AED;
	Tue, 22 Apr 2025 13:01:48 +0000 (UTC)
Message-ID: <9d4b7987-40e9-4bed-8869-a514e6c96697@ghiti.fr>
Date: Tue, 22 Apr 2025 15:01:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] RISC-V: Kconfig: Fix help text of CMDLINE_EXTEND
Content-Language: en-US
To: Yeking@Red54.com
Cc: aou@eecs.berkeley.edu, dmaliotaki@gmail.com,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 mick@ics.forth.gr, palmer@dabbelt.com, paul.walmsley@sifive.com
References: <4b2a6bf1-3642-431b-bb74-3aeae79d17d3@ghiti.fr>
 <tencent_0E5DE0122D64CFAD35F51FC3B3433BE94F06@qq.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <tencent_0E5DE0122D64CFAD35F51FC3B3433BE94F06@qq.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeefjeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnhepjeekuefgtdehhfevleffvdegteegleetieejkeehheefvedtuddvgfetvefgheffnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpihhnfhhrrgguvggrugdrohhrghenucfkphepvddttddumeekiedumeeffeekvdemvghfledtmeelfhgsvgemvddtvgefmedvfhgtfeemkeguudelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeeffeekvdemvghfledtmeelfhgsvgemvddtvgefmedvfhgtfeemkeguudelpdhhvghloheplgfkrfggieemvddttddumeekiedumeeffeekvdemvghfledtmeelfhgsvgemvddtvgefmedvfhgtfeemkeguudelngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeekpdhrtghpthhtohepjggvkhhinhhgseftvgguheegrdgtohhmpdhrtghpthhtoheprghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopegumhgrlhhiohhtrghkihesg
 hhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepmhhitghksehitghsrdhfohhrthhhrdhgrhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_060152_413284_3B7AECD5 
X-CRM114-Status: GOOD (  14.75  )
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

Hi,

On 21/04/2025 12:16, Yeking@Red54.com wrote:
> LoongArch (merged):
> https://lore.kernel.org/all/tencent_7FAF68BF7A2EAD9BFE869ECFDB837F980309@qq.com/
>
> RISC-V:
> https://lore.kernel.org/all/tencent_A93C7FB46BFD20054AD2FEF4645913FF550A@qq.com/
>
> PowerPC:
> https://lore.kernel.org/all/tencent_6E57A00F6D56CF8475CF9FD13370FBC1CF06@qq.com/
>
> SH:
> https://lore.kernel.org/all/tencent_40B6A6E7C79AEEEFEC79A07DE00724909A05@qq.com/
>
> ARM (rejected):
> https://lore.kernel.org/all/tencent_3E8155B4A33D48D6637F16CFE5ED293F0E08@qq.com/
>
> ARM64 (rejected):
> https://lore.kernel.org/all/tencent_1873443BEECF45E0336D4C4F8C35C19FEB06@qq.com/
>
> Russell King (Oracle) wrote:
> "
> ARM gained support for CMDLINE_EXTEND in commit 4394c1244249 ("ARM:
> 6893/1: Allow for kernel command line concatenation") dated 4 May
> 2011. In this commit, CONFIG_CMDLINE _prefixes_ the boot loader
> supplied arguments.
>
> In commit 34b82026a507 ("fdt: fix extend of cmd line") dated 13
> April 2016, which _post_ _dates_ the introduction on ARM, and the
> commit even states that it's fixing the lack of appending compared
> to ARM, this adds code to drivers/of to _append_ CONFIG_CMDLINE
> to the FDT arguments which come from the boot loader.
>
> It is DT that implemented this wrongly.
>
> No, we are not going to change arch/arm to conform to something
> that was implemented in a broken way. drivers/of needs fixing
> to actually implement it as it was *originally* intended - and
> there is five years of arch/arm doing this *before* DT started
> to do it.
>
> If drivers/of maintainers also don't want to change, then I'm
> sorry, but you have to then put up with the fact that it got
> wrongly implemented by drivers/of and thus has a different
> behaviour there.
> "


Thanks for the follow-up.

Since riscv always had the behaviour you describe in your patch, I'll 
take your patch.

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
