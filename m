Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0508EC02193
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Feb 2025 08:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4NfGhUijVhfleOp4dEO/BJAnIBGsQCdRAPvml+eL5PY=; b=zmsRC0MPbLJ/Mo
	OKJVy7aDXc0wxgA0RiH9NLPfchiHqPEV8CmPM0dMorTvvZaUvAgOkpt5TD9ajQzmrPxb9l0IjsRDe
	kuKQpZb8+5IJHN+LIyjRV4vlE0kyLYfodSjhW3ANhahcM3ORCaK4QivLDxnXDoTkNYbHhtn8k7RxY
	SlNR2scr1nf0mFXoM+OLT8dYRi8Er7iHaCmbkYYSWHa/yb59oEDHOk1hCJILHzxDWWNeBuEwEFnKJ
	/qivZGYmko/7a6Spo2M0wyoIg4MjjVP+ZvRrakhC5ZPckw0d+4vH/ZG0zph8R2H710MdWwqNKqnYD
	NFmErQWjLKpYAxJpCMPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfEXd-0000000HYOS-0pZY;
	Tue, 04 Feb 2025 08:44:21 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfEXa-0000000HYO5-2uDi
	for linux-riscv@lists.infradead.org;
	Tue, 04 Feb 2025 08:44:20 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A5FD6442E0;
	Tue,  4 Feb 2025 08:44:14 +0000 (UTC)
Message-ID: <916147db-94a5-46df-8a22-1d301059154c@ghiti.fr>
Date: Tue, 4 Feb 2025 09:44:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv/futex: sign extend compare value in atomic cmpxchg
Content-Language: en-US
To: Andreas Schwab <schwab@suse.de>, linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
References: <mvmfrkv2vhz.fsf@suse.de>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <mvmfrkv2vhz.fsf@suse.de>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddthecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnheptdfhleefjeegheevgeeljeellefgvefhkeeiffekueejteefvdevhfelvdeggeeinecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemledvgegumehfheefrgemsgegvdgrmeefrgelgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemledvgegumehfheefrgemsgegvdgrmeefrgelgedphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemledvgegumehfheefrgemsgegvdgrmeefrgelgegnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehstghhfigrsgesshhushgvrdguvgdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrk
 hgvrhhnvghlrdhorhhg
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_004418_885272_59D98535 
X-CRM114-Status: GOOD (  11.92  )
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

Hi Andreas,

On 03/02/2025 11:06, Andreas Schwab wrote:
> Make sure the compare value in the lr/sc loop is sign extended to match
> what lr.w does.  Fortunately, due to the compiler keeping the register
> contents sign extended anyway the lack of the explicit extension didn't
> result in wrong code so far, but this cannot be relied upon.
>
> Fixes: b90edb33010b ("RISC-V: Add futex support.")
> Signed-off-by: Andreas Schwab <schwab@suse.de>
> ---
>   arch/riscv/include/asm/futex.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/include/asm/futex.h b/arch/riscv/include/asm/futex.h
> index fc8130f995c1..6907c456ac8c 100644
> --- a/arch/riscv/include/asm/futex.h
> +++ b/arch/riscv/include/asm/futex.h
> @@ -93,7 +93,7 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
>   		_ASM_EXTABLE_UACCESS_ERR(1b, 3b, %[r])	\
>   		_ASM_EXTABLE_UACCESS_ERR(2b, 3b, %[r])	\
>   	: [r] "+r" (ret), [v] "=&r" (val), [u] "+m" (*uaddr), [t] "=&r" (tmp)
> -	: [ov] "Jr" (oldval), [nv] "Jr" (newval)
> +	: [ov] "Jr" ((long)(int)oldval), [nv] "Jr" (newval)
>   	: "memory");
>   	__disable_user_access();
>   


Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
