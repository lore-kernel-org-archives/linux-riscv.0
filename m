Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32E35C18E7C
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Feb 2025 15:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SouN6DJqsrU25T9mR7D02aa2hbhyoxYAZHKJqMkXpmQ=; b=jBdvJDAxGWclZK
	SvutKDZipRnGp8NN+cvMlHpjc8Wsr5AXrbnUEsnerpGDcl/NcCUspDn/KUuGnhkK3Q0jSCGtIRBWK
	PcmdNjM9JvbINy+A9V1t8WOVq2FvSHVMWuzlRNwWf7TyZKaUfcWTIRRik5wnzsrfMPsCAcRnhG+6J
	qWe9hjwVwBM6WI5cX+YLHUnkMGq+O1SoUqoRu1Bc5+soOavrzKFdV//WKr/I4mvvG/R+YmZ71rU4+
	K9ZF159jbLSEUj0xqkFbDwv7n8YXjOQG+hu96q+0Jqw1NHG09RvjcxtechvaFFeBzuKO6YW+AItBy
	KtuuiTnM0JfYGAeNyfVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnJFp-00000004HLS-0bCW;
	Wed, 26 Feb 2025 15:23:21 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnJ9X-00000004EaG-3r0B
	for linux-riscv@lists.infradead.org;
	Wed, 26 Feb 2025 15:16:53 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4798F2047A;
	Wed, 26 Feb 2025 15:16:47 +0000 (UTC)
Message-ID: <ed90f97a-35b4-4514-94d1-a699d673163c@ghiti.fr>
Date: Wed, 26 Feb 2025 16:16:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: remove redundant CMDLINE_FORCE check
Content-Language: en-US
To: Zixian Zeng <sycamoremoon376@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250114-rebund-v1-1-5632b2d54d6c@gmail.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250114-rebund-v1-1-5632b2d54d6c@gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekgeelvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnheptdfhleefjeegheevgeeljeellefgvefhkeeiffekueejteefvdevhfelvdeggeeinecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemrgektddumeegfhegfeemgeekudeimeeisggtfhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemrgektddumeegfhegfeemgeekudeimeeisggtfhdphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemrgektddumeegfhegfeemgeekudeimeeisggtfhgnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepiedprhgtphhtthhopehshigtrghmohhrvghmohhonhefjeeisehgmhgrihhlrdgtohhmpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtr
 dgtohhmpdhrtghpthhtoheprghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_071652_106782_54A6FAA1 
X-CRM114-Status: GOOD (  11.64  )
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

Hi Zixian,

On 13/01/2025 17:30, Zixian Zeng wrote:
> Drop redundant CMDLINE_FORCE check as it's already done in
> function early_init_dt_scan_chosen().
>
> Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
> ---
> ---
>   arch/riscv/kernel/setup.c | 5 -----
>   1 file changed, 5 deletions(-)
>
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index 45010e71df86ce40f99fabf03103a49ad1041f3d..a08a8409aab01d504d3ad975fbf9c66c02992713 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -237,11 +237,6 @@ static void __init parse_dtb(void)
>   	} else {
>   		pr_err("No DTB passed to the kernel\n");
>   	}
> -
> -#ifdef CONFIG_CMDLINE_FORCE
> -	strscpy(boot_command_line, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
> -	pr_info("Forcing kernel command line to: %s\n", boot_command_line);
> -#endif
>   }
>   
>   #if defined(CONFIG_RISCV_COMBO_SPINLOCKS)
>
> ---
> base-commit: fa47906ff358a5865b7be2356a5a1d1e58dd17d8
> change-id: 20250113-rebund-25d469c1c4d5
>
> Best regards,


We lose the pr_info() but to me that's not a problem, so:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
