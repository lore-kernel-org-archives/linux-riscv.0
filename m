Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01DC4C282C5
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Feb 2025 08:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RR3vPsyPgquV/1PndYR39pmrd6bH2hxtfJYvZ/bnJiI=; b=YZrA+CU4XfyTGC
	nXhlqJ+hpCZ/4Q7XT1Bdex+Y27vKEGNRPkfcF+UVYl3qZ3jEEYMyHGc8NnlwuVNaO3ZLQ+FSiP6a9
	Yos/VVn0OwAvpPwLp8+iOZdAw2Wpay0eYwui5xnhFdvuslgbnnbaNv6GkUhAKOxj7aQp+WQw/u3y1
	ukY4HsaMV6dOmJtYsyayqq+vEg19oMoewq7EjR9qwgLt/C1lOVnl7/52/woofV6VQwYWmHdcmOvI2
	NdkENrEJ4cc1Kqbxc+z4YPBm6t2r6WHHs2P9GFyaK7ML18XSTxTsQopMoe5ADwKEiTD/N2l+3654q
	vjse3OpsfbTEEmCbY5Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnvpl-0000000ADFG-46Hl;
	Fri, 28 Feb 2025 08:35:01 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnvpi-0000000ADDI-3g8k
	for linux-riscv@lists.infradead.org;
	Fri, 28 Feb 2025 08:35:00 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id EBBF941C7D;
	Fri, 28 Feb 2025 08:34:50 +0000 (UTC)
Message-ID: <45d7bf9c-58fe-4808-9454-ff1167ead9ab@ghiti.fr>
Date: Fri, 28 Feb 2025 09:34:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Fix the __riscv_copy_vec_words_unaligned implementation
To: Tingbo Liao <tingbo.liao@starfivetech.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250227072721.5889-1-tingbo.liao@starfivetech.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250227072721.5889-1-tingbo.liao@starfivetech.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekleelvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnhepuddtheegjeeviedvtdfgffekiedvgeefieffhfeiieetudelveduteegtdeiuddtnecuffhomhgrihhnpehvvggtqdgtohhphidquhhnrghlihhgnhgvugdrshgsnecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemgegrvggsmeguieefugemvdgskeehmegvtgdtugenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemgegrvggsmeguieefugemvdgskeehmegvtgdtugdphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemgegrvggsmeguieefugemvdgskeehmegvtgdtuggnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepiedprhgtphhtthhopehtihhnghgsohdrlhhirghosehsthgrrhhfihhvvghtvggthhdrtghomhdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihs
 ehsihhfihhvvgdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_003459_050214_7CC31A33 
X-CRM114-Status: GOOD (  13.09  )
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

Hi Tingbo,

On 27/02/2025 08:27, Tingbo Liao wrote:
> Correct the VEC_S macro definition to fix the implementation
> of vector words copy in the case of unalignment in RISC-V.
>
> Signed-off-by: Tingbo Liao <tingbo.liao@starfivetech.com>
> ---
>   arch/riscv/kernel/vec-copy-unaligned.S | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/vec-copy-unaligned.S b/arch/riscv/kernel/vec-copy-unaligned.S
> index d16f19f1b3b6..7ce4de6f6e69 100644
> --- a/arch/riscv/kernel/vec-copy-unaligned.S
> +++ b/arch/riscv/kernel/vec-copy-unaligned.S
> @@ -11,7 +11,7 @@
>   
>   #define WORD_SEW CONCATENATE(e, WORD_EEW)
>   #define VEC_L CONCATENATE(vle, WORD_EEW).v
> -#define VEC_S CONCATENATE(vle, WORD_EEW).v
> +#define VEC_S CONCATENATE(vse, WORD_EEW).v
>   
>   /* void __riscv_copy_vec_words_unaligned(void *, const void *, size_t) */
>   /* Performs a memcpy without aligning buffers, using word loads and stores. */


That's a good catch, thanks.

However, your patch title should be prefixed with "riscv:" :

"[PATCH] riscv: Fix the __riscv_copy_vec_words_unaligned implementation"

And you miss the following Fixes tag:

Fixes: e7c9d66e313b ("RISC-V: Report vector unaligned access speed hwprobe")

And then you can add:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Can you respin a v2 with all those modifications please?

Thanks,

Alex




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
