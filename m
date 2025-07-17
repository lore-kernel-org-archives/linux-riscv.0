Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A302CC83F22
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Jul 2025 08:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SmMIpzfay8CadXyT2s0RSf0cuUHey0ozXncr+fmgSqM=; b=DdpII30GxnngSg
	GbZWV4kK1RADhCCgbh1M9FZEg2Sy4WXrp2XA0WxLu00kcTt9Z+pEOfpNqxeHAX+8188Q/10gIQQft
	/WUNmqOqtQHRvjBGWScuw+nYiiXCP2XvNRfWbN1fbGKaXMVnzHtwkeqXXmjgQ5C7ApgiXgt/v6p9r
	uS+h6WGNqcFpLXxw6XKLd7Tzv+sSPnwmKA5Wh1rGogb6XEwUbjA8TRJyj1drvyUfCDjX4sAe0OAIY
	hnEaEo2K1RpqJSG/BFN6Z0gMwnaTBW1rX4bVx4rZd9TTbVMKrEOpEk7TYf6MjclZQ6V7+cX4BtiaA
	xmZ4GeGkMdAKBoajsiQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucKHu-00000009bn8-29NB;
	Thu, 17 Jul 2025 08:48:22 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucJC6-00000009Tcy-0yyE
	for linux-riscv@lists.infradead.org;
	Thu, 17 Jul 2025 07:38:19 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 622C844362;
	Thu, 17 Jul 2025 07:38:13 +0000 (UTC)
Message-ID: <970a2116-58d2-466f-8a3e-f1b9e99ccf9b@ghiti.fr>
Date: Thu, 17 Jul 2025 09:38:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next] riscv: Enable ARCH_HAVE_NMI_SAFE_CMPXCHG
To: Pu Lehui <pulehui@huaweicloud.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Pu Lehui <pulehui@huawei.com>
References: <20250711090443.1688404-1-pulehui@huaweicloud.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250711090443.1688404-1-pulehui@huaweicloud.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeitddtudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnheptdfhleefjeegheevgeeljeellefgvefhkeeiffekueejteefvdevhfelvdeggeeinecukfhppedukeehrddvudefrdduheegrdduhedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepudekhedrvddufedrudehgedrudehuddphhgvlhhopegluddtrddugedrtddrudefngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepphhulhgvhhhuiheshhhurgifvghitghlohhuugdrtghomhdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtohepphhulhgvhhhuiheshhhurgifvghirdgtohhm
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_003818_414855_D30467DF 
X-CRM114-Status: GOOD (  11.79  )
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

Hi Pu,

On 7/11/25 11:04, Pu Lehui wrote:
> From: Pu Lehui <pulehui@huawei.com>
>
> The implement of cmpxchg() in riscv is based on atomic primitives and
> has NMI-safe features, so it can be used safely in the in_nmi context.
> ftrace's ringbuffer relies on NMI-safe cmpxchg() in the NMI context.
> Currently, in_nmi() is true when riscv kprobe is in trap-based mode, so
> this config needs to be selected, otherwise kprobetrace will not be
> available.
>
> Signed-off-by: Pu Lehui <pulehui@huawei.com>
> ---
>   arch/riscv/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 36061f4732b7..0e2dfa98338a 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -23,6 +23,7 @@ config RISCV
>   	select ARCH_ENABLE_MEMORY_HOTREMOVE if MEMORY_HOTPLUG
>   	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
>   	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
> +	select ARCH_HAVE_NMI_SAFE_CMPXCHG
>   	select ARCH_HAS_BINFMT_FLAT
>   	select ARCH_HAS_CRC32 if RISCV_ISA_ZBC
>   	select ARCH_HAS_CRC64 if 64BIT && RISCV_ISA_ZBC


Given the definition of ARCH_HAVE_NMI_SAFE_CMPXCHG in commit 
df013ffb8119 ("Add Kconfig option ARCH_HAVE_NMI_SAFE_CMPXCHG"), we can 
indeed enable this config, so:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

And I followed your instructions in your answer, it works as you 
presented so:

Tested-by: Alexandre Ghiti <alexghiti@rivosinc.com>

I'll send this as part of my 6.17 PR.

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
