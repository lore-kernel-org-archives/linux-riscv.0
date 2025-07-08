Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE7A9C83F0F
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Jul 2025 09:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gpqbbdExG5tNvmP5Kp5Krto5JJs/4SvHwhf3xLSu39I=; b=QZabHwGILsBT7u
	zeZi0qjDKqhBzgBCEXAideM/PRj87dKtnH5vlhWdBBzqLzduaNwCF2iKjERrSP61uKkPJe/YySp5H
	xOWG7MNqR/6ltYjTpdTQz6POd7anSEjzHN14k7yUd1grW0Y5HNsy1BXDslSYi3eIH/wO7l1NqrPhV
	8q7OkAuZ6ha4wUuBHwgNySkdmH7tqCu0bi/hcs7mxO+Jg88svfdXNCPPVh3LkWld0Ee4o9FKdsEGH
	C1ImHoNGfMAySiHNwOANrHy+Xpji8LMlWchnK+bphevIlKel7HMMEAZtelt9e9dundFrdCN9Pcssh
	ZM9XnOdbh/JM3psaOc2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ4xJ-00000004xEQ-2JgP;
	Tue, 08 Jul 2025 09:49:41 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ4IR-00000004r2J-3YbY
	for linux-riscv@lists.infradead.org;
	Tue, 08 Jul 2025 09:07:29 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B0430432D6;
	Tue,  8 Jul 2025 09:07:17 +0000 (UTC)
Message-ID: <44501b6d-12de-49dc-8d81-443500031d4a@ghiti.fr>
Date: Tue, 8 Jul 2025 11:07:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: mmap(): use unsigned offset type in riscv_sys_mmap
To: liu.xuemei1@zte.com.cn, paul.walmsley@sifive.com
Cc: palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250707193411886Kc-TWknP0PER2_sEg-byb@zte.com.cn>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250707193411886Kc-TWknP0PER2_sEg-byb@zte.com.cn>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefgedvkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpedthfelfeejgeehveegleejleelgfevhfekieffkeeujeetfedvvefhledvgeegieenucfkphepudekhedrvddufedrudehgedrudegfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedukeehrddvudefrdduheegrddugeefpdhhvghloheplgdutddrudegrddtrdduudgnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepiedprhgtphhtthhopehlihhurdiguhgvmhgvihduseiithgvrdgtohhmrdgtnhdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrn
 hgvlhdrohhrgh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_020728_032266_E723DF3D 
X-CRM114-Status: GOOD (  13.77  )
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

Hi Jessica,

On 7/7/25 13:34, liu.xuemei1@zte.com.cn wrote:
> From: Jessica Liu <liu.xuemei1@zte.com.cn>
>
> The variable type of offset should be consistent with the relevant
> interfaces of mmap which described in commit 295f10061af0 ("syscalls:
> mmap(): use unsigned offset type consistently). Otherwise, a user input
> with the top bit set would result in a negative page offset rather than a
> large one.
>
> Signed-off-by: Jessica Liu <liu.xuemei1@zte.com.cn>
> ---
>   arch/riscv/kernel/sys_riscv.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
> index d77afe05578f..795b2e815ac9 100644
> --- a/arch/riscv/kernel/sys_riscv.c
> +++ b/arch/riscv/kernel/sys_riscv.c
> @@ -10,7 +10,7 @@
>
>   static long riscv_sys_mmap(unsigned long addr, unsigned long len,
>   			   unsigned long prot, unsigned long flags,
> -			   unsigned long fd, off_t offset,
> +			   unsigned long fd, unsigned long offset,
>   			   unsigned long page_shift_offset)
>   {
>   	if (unlikely(offset & (~PAGE_MASK >> page_shift_offset)))


Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
