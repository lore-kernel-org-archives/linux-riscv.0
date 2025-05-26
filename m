Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC6E9C54FB3
	for <linux-riscv@archiver.kernel.org>; Mon, 26 May 2025 20:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7BE07k7Ou8sgvqiW8Ai6GQzxwoL0S3bhTlP6Hn+MLzQ=; b=vMcJLE4Ixwn12n
	fh/nVmRIn8+Q7luaSKIpL7igpxaLK8b30XbVXzbXHAItmx/UQSNGH1oQT59GCwxhLdcWhjzz4Ee5O
	BGD4ngpuEdZDuacdIMxW0yro947JhSsfCvCUPwlPX+XgisjoPPde+r3iZ9oQE5VABRC3olqO/SGjR
	l5FZiOFYP4cTrTnomCSdg5IJkE5zIuW8c6Rn1rk3ZWpt4mdeROtCS48QreJ3JRxJbWjss3m2odvtB
	yVVg0BlFhEZcuTZCODKJ2u50TiVzf2ZDm1oVmz25Z1fZG8Q3w27xe1bJRk5KLofNy+hUa8JD3EDED
	WxSCTpv6kEM/c7tORFpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJebq-00000009UUR-1GDK;
	Mon, 26 May 2025 20:39:46 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJebm-00000009UTy-0gB4
	for linux-riscv@lists.infradead.org;
	Mon, 26 May 2025 20:39:44 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 00E29444DA;
	Mon, 26 May 2025 20:39:35 +0000 (UTC)
Message-ID: <2c07d65e-0641-42a0-9eb4-9e42d9325ff2@ghiti.fr>
Date: Mon, 26 May 2025 22:39:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: uaccess: Only restore the CSR_STATUS SUM bit
To: Cyril Bur <cyrilbur@tenstorrent.com>, samuel.holland@sifive.com,
 ben.dooks@codethink.co.uk, palmer@dabbelt.com, linux-kernel@vger.kernel.org
Cc: jszhang@kernel.org, paul.walmsley@sifive.com, charlie@rivosinc.com,
 jrtc27@jrtc27.com, aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
 Andy Chiu <andybnac@gmail.com>, Deepak Gupta <debug@rivosinc.com>
References: <20250522160954.429333-1-cyrilbur@tenstorrent.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250522160954.429333-1-cyrilbur@tenstorrent.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddukeehtdculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnhepteekfeetveffgfehgfeiieefvedukeejtdevhffgudfffeevieeigffhudeuueetnecuffhomhgrihhnpegvnhhtrhihrdhssgdpkhgvrhhnvghlrdhorhhgnecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemsgdtieemleeikehfmeekrgegieemledvtggrnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeeffeekvdemvghfledtmegstdeimeelieekfhemkegrgeeimeelvdgtrgdphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemsgdtieemleeikehfmeekrgegieemledvtggrngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopedufedprhgtphhtthhopegthihrihhlsghurhesthgvnhhsthhorhhrvghnthdrtghomhdprhgtphhtthhopehsrghmuhgvlhdrhhhol
 hhlrghnugesshhifhhivhgvrdgtohhmpdhrtghpthhtohepsggvnhdrughoohhkshestghouggvthhhihhnkhdrtghordhukhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehjshiihhgrnhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopegthhgrrhhlihgvsehrihhvohhsihhntgdrtghomh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_133942_337397_A81555B1 
X-CRM114-Status: GOOD (  16.00  )
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

+cc linux-riscv, Andy, Deepak

On 5/22/25 18:09, Cyril Bur wrote:
> During switch to csrs will OR the value of the register into the
> corresponding csr. In this case we're only interested in restoring the
> SUM bit not the entire register.
>
> Fixes: 788aa64c0 ("riscv: save the SR_SUM status over switches")
> Signed-off-by: Cyril Bur <cyrilbur@tenstorrent.com>
> ---
> I've put the Fixes tag in but I assume this will get squashed into the
> patch. Either way I hope this works to fix the immediate issue.
>
>   arch/riscv/kernel/entry.S | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index 00bd0de9faa2..6ed3bd80903d 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -399,14 +399,18 @@ SYM_FUNC_START(__switch_to)
>   	REG_S s11, TASK_THREAD_S11_RA(a3)
>   
>   	/* save the user space access flag */
> -	li    s0, SR_SUM
> -	csrr  s1, CSR_STATUS
> -	REG_S s1, TASK_THREAD_STATUS_RA(a3)
> +	csrr  s0, CSR_STATUS
> +	REG_S s0, TASK_THREAD_STATUS_RA(a3)
>   
>   	/* Save the kernel shadow call stack pointer */
>   	scs_save_current
> -	/* Restore context from next->thread */
> +	/*
> +	 * Restore context from next->thread. csrs will OR the bits from s0 and
> +	 * only want to restore the SR_SUM bit
> +	 */
>   	REG_L s0,  TASK_THREAD_STATUS_RA(a4)
> +	li    s1,  SR_SUM
> +	and   s0,  s0, s1
>   	csrs  CSR_STATUS, s0
>   	REG_L ra,  TASK_THREAD_RA_RA(a4)
>   	REG_L sp,  TASK_THREAD_SP_RA(a4)

To conclude the discussion we had here 
https://lore.kernel.org/linux-riscv/aDCtATl2N21fBsyT@debug.ba.rivosinc.com/#t, 
in addition to Cyril's patch above, to me we only have to rename the 
status field into sum and we're good to go. @Andy, @Deepak @Samuel Do 
you agree?

As this is an important fix (along with 2 other fixes, one for thead 
vector and vdso static values), I'd like to send another PR soon for 
inclusion in 6.16-rc1, I did not want to delay the second PR any longer.

Thanks for your feedbacks,

Alex



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
