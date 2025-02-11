Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B52DCC0219E
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Feb 2025 07:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OD072wocHZbTQtAnU0+6xJFlrMwWLIw6PpZWlqdzfE0=; b=ups/5qMcqAN+w8
	4E5Rpq6oDkNZG2fJ9zXeZu2uVsSc9Focg6Q4wMG8qh0p2sy5Oqnj5NOmjJIcNRBLRBs35J65v9SSj
	IgTZEsHt2cqx/G28Oj0e1QIJ9zp7tIgyQbzTFhwjHkN2SfgLgrt2Jr8QytNQHQE0B5k9G6vliY9G4
	ZIeZkO2zEKVIgAS/GUXO3BYz0YUwl0nMbxAB8728oHb+HXmTZKtD2YI0kqzNOELA9LE2g+YWOrjio
	FwTKJJoVPUkpR1Ig4Z1g51XbtDCwKEH1lJbIMjbptZlXLsg6DwdfKXrimguXflaUwGZyzrsHhptuF
	Y1BABjsd8jR7OcU9wTRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thl7T-00000002tpI-0mxK;
	Tue, 11 Feb 2025 07:55:47 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thl7R-00000002too-0Pz3
	for linux-riscv@lists.infradead.org;
	Tue, 11 Feb 2025 07:55:46 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1D69D441EB;
	Tue, 11 Feb 2025 07:55:38 +0000 (UTC)
Message-ID: <6ae4838b-f7b5-419d-8659-7b8779a74adb@ghiti.fr>
Date: Tue, 11 Feb 2025 08:55:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] riscv: Use of_property_present() to test for
 non-boolean properties
Content-Language: en-US
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 linux-riscv@lists.infradead.org
Cc: Steffen Persvold <spersvold@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org,
 Jeremy Linton <jeremy.linton@arm.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Yunhui Cui <cuiyunhui@bytedance.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 =?UTF-8?Q?Miquel_Sabat=C3=A9_Sol=C3=A0?= <mikisabate@gmail.com>,
 Rob Herring <robh@kernel.org>
References: <20250205143903.413959-1-emil.renner.berthing@canonical.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250205143903.413959-1-emil.renner.berthing@canonical.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegtdeggecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnhephffhuddtveegleeggeefledtudfhudelvdetudfhgeffffeigffgkeethfejudejnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepvddttddumeekiedumeeffeekvdemvghfledtmedugedvugemleekkedumeegfeejieemleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeeffeekvdemvghfledtmedugedvugemleekkedumeegfeejieemleekpdhhvghloheplgfkrfggieemvddttddumeekiedumeeffeekvdemvghfledtmedugedvugemleekkedumeegfeejieemleekngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeduvddprhgtphhtthhopegvmhhilhdrrhgvnhhnvghrrdgsvghrthhhihhnghestggrnhhonhhitggrlhdrtghomhdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgru
 ggvrggurdhorhhgpdhrtghpthhtohepshhpvghrshhvohhlugesghhmrghilhdrtghomhdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehjvghrvghmhidrlhhinhhtohhnsegrrhhmrdgtohhmpdhrtghpthhtoheptghonhhorhdrughoohhlvgihsehmihgtrhhotghhihhprdgtohhmpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhm
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_235545_278877_047D986A 
X-CRM114-Status: GOOD (  14.43  )
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

Hi Emil,

On 05/02/2025 15:39, Emil Renner Berthing wrote:
> The use of of_property_read_bool() for non-boolean properties is
> deprecated and since
>
> commit c141ecc3cecd ("of: Warn when of_property_read_bool() is used on non-boolean properties")
>
> a warning is displayed when used incorrectly. Fix it by switching to
> of_property_present() as recommended in the same commit.
>
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> ---
>   arch/riscv/kernel/cacheinfo.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/arch/riscv/kernel/cacheinfo.c b/arch/riscv/kernel/cacheinfo.c
> index 2d40736fc37c..26b085dbdd07 100644
> --- a/arch/riscv/kernel/cacheinfo.c
> +++ b/arch/riscv/kernel/cacheinfo.c
> @@ -108,11 +108,11 @@ int populate_cache_leaves(unsigned int cpu)
>   	if (!np)
>   		return -ENOENT;
>   
> -	if (of_property_read_bool(np, "cache-size"))
> +	if (of_property_present(np, "cache-size"))
>   		ci_leaf_init(this_leaf++, CACHE_TYPE_UNIFIED, level);
> -	if (of_property_read_bool(np, "i-cache-size"))
> +	if (of_property_present(np, "i-cache-size"))
>   		ci_leaf_init(this_leaf++, CACHE_TYPE_INST, level);
> -	if (of_property_read_bool(np, "d-cache-size"))
> +	if (of_property_present(np, "d-cache-size"))
>   		ci_leaf_init(this_leaf++, CACHE_TYPE_DATA, level);
>   
>   	prev = np;
> @@ -125,11 +125,11 @@ int populate_cache_leaves(unsigned int cpu)
>   			break;
>   		if (level <= levels)
>   			break;
> -		if (of_property_read_bool(np, "cache-size"))
> +		if (of_property_present(np, "cache-size"))
>   			ci_leaf_init(this_leaf++, CACHE_TYPE_UNIFIED, level);
> -		if (of_property_read_bool(np, "i-cache-size"))
> +		if (of_property_present(np, "i-cache-size"))
>   			ci_leaf_init(this_leaf++, CACHE_TYPE_INST, level);
> -		if (of_property_read_bool(np, "d-cache-size"))
> +		if (of_property_present(np, "d-cache-size"))
>   			ci_leaf_init(this_leaf++, CACHE_TYPE_DATA, level);
>   		levels = level;
>   	}


The same patch has been on the ML since last november:

https://lore.kernel.org/linux-riscv/20241104190314.270095-1-robh@kernel.org/

And was already re-sent once end of december...

Thanks anyway,

Alex



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
