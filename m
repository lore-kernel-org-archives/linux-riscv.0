Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A38DC3ABBF
	for <linux-riscv@archiver.kernel.org>; Wed,  7 May 2025 18:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gWNlUZ01fVJHHr6u2/twAfBEZvAaAxJgaY3L9wMMMZM=; b=yniYLW6DU3coRN
	qDVX1koUHB9kbTHYMDs0MqOzDoLkBMI9W3I5N/JGrHjulBEJTGHgGT/EZitMK0HQEp1eUHB1l1ME8
	z6qSu4UYmZWLhH59nGUkhVZz+s7+ohkUHaIRBPFwRH1x+a9Q072z2oiwcf+XunHtzDcBNfbO67EDL
	W9JDpTZtlMqQe4NpqOniUxRBm0Hjsh2LXG21+EDJ9BK7RcPOHbIW6votDZ/yIV3S8gwjE1EPcAPJf
	txVCFr+Vn+Gi3xtLaDh/YTxLWqr4VretrflnPm1QxawRAzpoi1TX99uLPpuZTjhkppU5kCqYSL2rs
	L8HZUVkLwV0k+32cOVqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCj9J-0000000GQZY-2MsV;
	Wed, 07 May 2025 18:05:41 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCj8y-0000000GQUy-2tiI
	for linux-riscv@lists.infradead.org;
	Wed, 07 May 2025 18:05:21 +0000
Date: Wed, 7 May 2025 20:05:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746641117;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FXst0CMcOK/c0+0GH4at5bz4vSFgCore/pjeWNIxyRI=;
	b=senatFYT8Kfharf76k+o7V0D1E9zjXtBBm5+i91m5AiS3ym/bHHbAvjUDW4VRGIohccV5F
	mjK4VqQA0OSROOwoi7iqPQR1sMeP6oiIZKSKM+XgzS2mbGf8l/aEhPv7LHn6DfaNqfKG9R
	3i1YCkPzBSgK01lobdkzVSyfP19kSXgjzEgb/bHtRE7Lt7cOIrS1PPcJO4L8S0j9jsLkvH
	nBEvnTSIvaLKBPFD3izMk9fms7zsA8nYPbD+DgbiZTdCSn8HjLZ92YjgY6BJPhSHPUpbrI
	31SXywH7RZmiNZbXK/EYckN3on46Iwe2G1NRdRteqst6gyWOPvLOVasovMS+Cw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746641117;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FXst0CMcOK/c0+0GH4at5bz4vSFgCore/pjeWNIxyRI=;
	b=bG6FX6gLGAiTxwnYsttDX9EsapsqZQRwFXgGgwyQsATxJ046bJ4YTztS7j6/z1mAxwZ/1a
	N7StPaN5nG+Bk6Cw==
From: Nam Cao <namcao@linutronix.de>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] riscv: Fix kernel crash due to PR_SET_TAGGED_ADDR_CTRL
Message-ID: <20250507180509.pbQ6A8b3@linutronix.de>
References: <20250504101920.3393053-1-namcao@linutronix.de>
 <c59f2632-d96f-43c6-869d-5e5f743f2dbd@ghiti.fr>
 <20250505160722.s_w3u1pd@linutronix.de>
 <d7232e99-e899-4e50-b60f-2527be709d2c@ghiti.fr>
 <570ce61a-00ca-446f-ae89-7ab7c340828f@ghiti.fr>
 <49897822-76c4-45c5-87ff-085c3f6fb318@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <49897822-76c4-45c5-87ff-085c3f6fb318@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_110520_866691_A24D7C58 
X-CRM114-Status: GOOD (  17.35  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, May 06, 2025 at 05:29:57PM -0500, Samuel Holland wrote:
> That said, I wonder if set_tagged_addr_ctrl(task, 0) should succeed when Supm is
> not implemented, matching get_tagged_addr_ctrl(). Without Supm, we know that
> have_user_pmlen_7 and have_user_pmlen_16 will both be false, so pmlen == 0 is
> the only case where we would call envcfg_update_bits(). And we know it would be
> a no-op. So an alternative fix would be to return 0 below the pmlen checks:
> 
> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
> index 7c244de77180..536da9aa690e 100644
> --- a/arch/riscv/kernel/process.c
> +++ b/arch/riscv/kernel/process.c
> @@ -309,6 +309,9 @@ long set_tagged_addr_ctrl(struct task_struct *task, unsigned
> long arg)
>  	if (!(arg & PR_TAGGED_ADDR_ENABLE))
>  		pmlen = PMLEN_0;
> 
> +	if (!riscv_has_extension_unlikely(RISCV_ISA_EXT_SUPM))
> +		return 0;
> +
>  	if (mmap_write_lock_killable(mm))
>  		return -EINTR;
> 
> 
> But I don't know if this better matches what userspace would expect.

I'm not sure about this either. The man page says:

|If the  arguments  are  invalid,  the mode specified in arg2 is
|unrecognized, or if this feature is unsupported by the kernel or disabled
|via /proc/sys/abi/tagged_addr_disabled, the call fails with the error
|EINVAL.
|
|In particular, if prctl(PR_SET_TAGGED_ADDR_CTRL, 0, 0, 0, 0) fails with
|EINVAL, then all addresses passed to the kernel must be untagged.

So according to the man page, returning -EINVAL is the right thing.

But arm64 returns 0 in this case.

I would say let's follow the man page, and leave it as is.

Best regards,
Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
