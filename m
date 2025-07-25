Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C699C87FCE
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jul 2025 14:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Zg6oFvwTS+xOjFQzRLw/0OO0y4/nJbDgfa8g+oMqPI=; b=g4iUtWAJzjnqOL
	42kWKKYJehfou+7iewLzpALh9BUDA2nKsVfuZMwcnWChk7w0GP2WkD73sPz1RBbwHCzjLI0Pghvra
	kMj5WSUet+WLg7lraePGeMgXeINO9W/MWzNAF/ZuOAxohidVPsBWZDnzKK8GK6sjWGFJ29waOjs4B
	iMpI1EkXGKODLXokwJU+gu9p/TMzESjclgLoXRytZwbSsE8Fas46wvTzhqHwG6GkykjOEoJucAKul
	ez58jKsBMk090af2DfIPtxTz60wcflLFi2eGmNFCTzNoQ1qIkErQNacLDAtmX6cefWjD2rQyrIxqF
	0z5B3s3MUFE5SqjvAHdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufJ0O-00000009xnj-1ppk;
	Fri, 25 Jul 2025 14:02:36 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufJ0L-00000009xnP-3VWF
	for linux-riscv@lists.infradead.org;
	Fri, 25 Jul 2025 14:02:35 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1FF05441C5;
	Fri, 25 Jul 2025 14:02:28 +0000 (UTC)
Message-ID: <7b127468-9333-4425-bfe4-91ffa5b2e242@ghiti.fr>
Date: Fri, 25 Jul 2025 16:02:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] riscv: mm: Return intended SATP mode for noXlvl
 options
To: Junhui Liu <junhui.liu@pigmoral.tech>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250722-satp-from-fdt-v1-0-5ba22218fa5f@pigmoral.tech>
 <20250722-satp-from-fdt-v1-1-5ba22218fa5f@pigmoral.tech>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250722-satp-from-fdt-v1-1-5ba22218fa5f@pigmoral.tech>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdekfeejvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnheptdfhleefjeegheevgeeljeellefgvefhkeeiffekueejteefvdevhfelvdeggeeinecukfhppeelhedrudeguddruddtvddrudekieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeelhedrudeguddruddtvddrudekiedphhgvlhhopegluddtrddutddrudegiedrvddujegnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepiedprhgtphhtthhopehjuhhnhhhuihdrlhhiuhesphhighhmohhrrghlrdhtvggthhdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhop
 ehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_070234_010193_F9E9B244 
X-CRM114-Status: GOOD (  14.57  )
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

Hi Junhui,

On 7/21/25 18:53, Junhui Liu wrote:
> Change the return value of match_noXlvl() to return the SATP mode that
> will be used, rather than the mode being disabled. This enables unified
> logic for return value judgement with the function that obtains mmu-type
> from the fdt, avoiding extra conversion. This only changes the naming,
> with no functional impact.
>
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>   arch/riscv/kernel/pi/cmdline_early.c | 4 ++--
>   arch/riscv/mm/init.c                 | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/riscv/kernel/pi/cmdline_early.c b/arch/riscv/kernel/pi/cmdline_early.c
> index fbcdc9e4e14322af0cedd31343aeb9403ba2dd14..389d086a071876dde2fd57ee6f6661e65c38b7c4 100644
> --- a/arch/riscv/kernel/pi/cmdline_early.c
> +++ b/arch/riscv/kernel/pi/cmdline_early.c
> @@ -41,9 +41,9 @@ static char *get_early_cmdline(uintptr_t dtb_pa)
>   static u64 match_noXlvl(char *cmdline)
>   {
>   	if (strstr(cmdline, "no4lvl"))
> -		return SATP_MODE_48;
> +		return SATP_MODE_39;
>   	else if (strstr(cmdline, "no5lvl"))
> -		return SATP_MODE_57;
> +		return SATP_MODE_48;
>   
>   	return 0;
>   }
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 8d0374d7ce8ed72320f58e4cea212d0e2bce8fd4..d03e02a92379f2338a4f4df0ab797a7859b83dfc 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -864,9 +864,9 @@ static __init void set_satp_mode(uintptr_t dtb_pa)
>   
>   	kernel_map.page_offset = PAGE_OFFSET_L5;
>   
> -	if (satp_mode_cmdline == SATP_MODE_57) {
> +	if (satp_mode_cmdline == SATP_MODE_48) {
>   		disable_pgtable_l5();
> -	} else if (satp_mode_cmdline == SATP_MODE_48) {
> +	} else if (satp_mode_cmdline == SATP_MODE_39) {
>   		disable_pgtable_l5();
>   		disable_pgtable_l4();
>   		return;
>

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
