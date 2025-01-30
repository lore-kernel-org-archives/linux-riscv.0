Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F4DEC0218A
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jan 2025 14:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FKiiRGFV9rEDgSVVCNI8SUH4BuwVJKfcMm1mdVHlEQs=; b=XqJrRof/TLRbQO
	UdDPjZW5xqaquGvMGF1AI6CS4aWDhhrp7jqMFJGYkVjo/nKruwUJ+w/pYuQZkfTJSWUmsSwQ82scN
	LsSlrib+iBEEtQ10ovxTo3kPUTOssYlyuoSmq9oFK96O9YwNLU8bkyIEYru4ZB7OhhY4XNfMJbFdQ
	IHH/XHcM4BhR+lpegSBnoPbg79MEnO2qJgu+9Pa+wF5y+RqUBpqIlK+Z6PLDOd3n7UF2Sq1huktNG
	cWw5QUjOmKVTOTJxO+F8MJS17zYRQaGUpkot0i42Cea7mc2NO1oqpmaappExpqCKGyve5doWXNB1O
	JrauwqFYJirMSyX/HElA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdVNn-00000008xbH-1JcO;
	Thu, 30 Jan 2025 14:19:03 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdVNk-00000008xam-0WMe
	for linux-riscv@lists.infradead.org;
	Thu, 30 Jan 2025 14:19:01 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6B91E41DF3;
	Thu, 30 Jan 2025 14:18:55 +0000 (UTC)
Message-ID: <c9cbc2be-d1fd-44ef-aa14-fd25a5ff8490@ghiti.fr>
Date: Thu, 30 Jan 2025 15:18:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv/atomic: Do proper sign extension also for unsigned
 in arch_cmpxchg
Content-Language: en-US
To: Andreas Schwab <schwab@suse.de>, linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
References: <mvmed0k4prh.fsf@suse.de>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <mvmed0k4prh.fsf@suse.de>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeitdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpedvledugfelffetkefgleehtedvuefggfeitdeuteegtdeffeelieelheeikedvudenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtdegmegtvggttdemuddutdejmedvvdduleemiegtuggrmeefudefrgemjeelsgdtmegsuggtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtgeemtggvtgdtmeduuddtjeemvddvudelmeeitggurgemfedufegrmeejlegstdemsggutgdvpdhhvghloheplgfkrfggieemvdgrtdegmegtvggttdemuddutdejmedvvdduleemiegtuggrmeefudefrgemjeelsgdtmegsuggtvdgnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehstghhfigrsgesshhushgvrdguvgdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpt
 hhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_061900_302620_39FD2520 
X-CRM114-Status: GOOD (  15.30  )
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


That's a nice catch indeed. IIUC, we have the same issue here 
https://elixir.bootlin.com/linux/v6.13/source/arch/riscv/include/asm/futex.h#L89 
right?

hanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
