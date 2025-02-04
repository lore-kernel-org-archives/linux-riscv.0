Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBB02C0218F
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Feb 2025 08:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nNz/NknV6vcSHzGseFr/KbUcma201YXQhRWi3Win/tI=; b=zcRc7PTjCUrG69
	HVqfYB5/KtLKGBEsW56gaqEwoQJSDPDm4W/jQnEIzzpoy5qQenZyFDxZT85VXZmFISADCSykbjH1R
	nY2phZ1FjmFxrkbxg3hgnA6HcIqADqIRpaUPN2CurDtNa5L9WplV6FcfFEseKoiqQxjv3rLjk0c9I
	qacSg+6ziH950uGQqZAwq3lrHmTPVk51ozTgfPhyOEj4Rio1Oi9cGT0zZ9NYLntHRTYLWDidGRP+7
	GtckQ48mFWEkdSO3VGvl2RN1K766wdYhPhOoCOU3aOn34b0f/QV1BV8iwdsI+MZWfWCYCGHsSO0Om
	HFxlJjESl68uWgrCpfew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfEOY-0000000HXY4-1HBx;
	Tue, 04 Feb 2025 08:34:58 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfENZ-0000000HXQD-3fut
	for linux-riscv@lists.infradead.org;
	Tue, 04 Feb 2025 08:33:59 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 961DD4436B;
	Tue,  4 Feb 2025 08:33:50 +0000 (UTC)
Message-ID: <90c95046-4cdd-4830-be39-d734df137fd3@ghiti.fr>
Date: Tue, 4 Feb 2025 09:33:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv/atomic: Do proper sign extension also for unsigned
 in arch_cmpxchg
To: Andreas Schwab <schwab@suse.de>, linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
References: <mvmed0k4prh.fsf@suse.de>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <mvmed0k4prh.fsf@suse.de>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddtfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnheptdfhleefjeegheevgeeljeellefgvefhkeeiffekueejteefvdevhfelvdeggeeinecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemledvgegumehfheefrgemsgegvdgrmeefrgelgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemledvgegumehfheefrgemsgegvdgrmeefrgelgedphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemledvgegumehfheefrgemsgegvdgrmeefrgelgegnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehstghhfigrsgesshhushgvrdguvgdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrk
 hgvrhhnvghlrdhorhhg
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_003358_049515_4FA6AD59 
X-CRM114-Status: GOOD (  14.78  )
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

On 30/01/2025 10:25, Andreas Schwab wrote:
> Sign extend also an unsigned compare value to match what lr.w is doing.
> Otherwise try_cmpxchg may spuriously return true when used on a u32 value
> that has the sign bit set, as it happens often in inode_set_ctime_current.
>
> Do this in three conversion steps.  The first conversion to long is needed
> to avoid a -Wpointer-to-int-cast warning when arch_cmpxchg is used with a
> pointer type.  Then convert to int and back to long to always sign extend
> the 32-bit value to 64-bit.
>
> Fixes: 6c58f25e6938 ("riscv/atomic: Fix sign extension for RV64I")
> Signed-off-by: Andreas Schwab <schwab@suse.de>
> ---
>   arch/riscv/include/asm/cmpxchg.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
> index 4cadc56220fe..427c41dde643 100644
> --- a/arch/riscv/include/asm/cmpxchg.h
> +++ b/arch/riscv/include/asm/cmpxchg.h
> @@ -231,7 +231,7 @@
>   		__arch_cmpxchg(".w", ".w" sc_sfx, ".w" cas_sfx,		\
>   			       sc_prepend, sc_append,			\
>   			       cas_prepend, cas_append,			\
> -			       __ret, __ptr, (long), __old, __new);	\
> +			       __ret, __ptr, (long)(int)(long), __old, __new);	\
>   		break;							\
>   	case 8:								\
>   		__arch_cmpxchg(".d", ".d" sc_sfx, ".d" cas_sfx,		\


Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
