Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D1A4C3ABBF
	for <linux-riscv@archiver.kernel.org>; Wed,  7 May 2025 18:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OQMbA280VsH0cJjnZUuz8EEXub6s12A8B08E4ZGz8lc=; b=aCV6r6dEUXKVCf
	KHWd00FjSA10zfwsinWC8qe9vyx158MDMVBM5F0SVa8IJmvFhuzpZsZLN7wgSXoDnKn+/SVpHoVLQ
	FNT13k434NjrFcT9ayRGnwhjjfMW3T0W91AW/TNd4buuHbtqsisjYGd+Q/uv0uq4NMVC0gR5mTfyk
	WSi9A3wq86nO8bHeC0drWi6STAKJAFKxyHZpCKwX7cMLXlzpd4v4t2Fb8SjlgU1OdC2YjTEeRUa4C
	hKmX8qX8eI0wsjhuFoGAZdPbw32nmYiZGIfkuR//0p+RWVhWaiXRkw9K1+fHWDlK3TkdlbQxAkpkT
	AiULLJLioJZ2zjFTh/bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCjBq-0000000GR6L-1bQz;
	Wed, 07 May 2025 18:08:18 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCjBn-0000000GR5C-2q4c
	for linux-riscv@lists.infradead.org;
	Wed, 07 May 2025 18:08:16 +0000
Date: Wed, 7 May 2025 20:08:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746641293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=046JvbO+j9BtoKAJSoDIsiIXK6l6NTZ81ksrHjX94XY=;
	b=C3lCFW7FfOmH4YVfXqFdPHKNWW6aZZK88v6VrdCN6kzQH4hPFfMQRPyb6kSNCHyhyc6vcJ
	QDxDoQ7iLfQteen3DmbfzDzcGE/+IZGWtHYCG3x2KQrYo2dw36C1H+8CckAbCsuVt3QqM6
	PAcz7vh6wein51dhvQ0m9sZ5zFeL603wuiHptz0pHW4kwH3u90UYg2/DwsKYSSyfZd0esn
	lNAnzNGOpYaZ+L4FclJagrVAjf8IbU5ewRIGdHEDjqeQDZvuUyt9S/tY4kqjg3ToXqiKBD
	eGTo7ImIrLN49UoRujKnyy34FezQm2ntnF6Ulj3Ifvl1lrMaoCup3hUHM5ogZg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746641293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=046JvbO+j9BtoKAJSoDIsiIXK6l6NTZ81ksrHjX94XY=;
	b=O1Js2jKziji+AksK0dDKujzUoUIR96jF4j/DOEJurZSdWCb2FRM2DGp0NYNGhD+HfXUsSv
	ZRjWjQKo4PsggYBg==
From: Nam Cao <namcao@linutronix.de>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>,
	Bill O'Donnell <bodonnel@redhat.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Joel Granados <joel.granados@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Yunhui Cui <cuiyunhui@bytedance.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Disallow PR_GET_TAGGED_ADDR_CTRL without Supm
Message-ID: <20250507180811.3CKhxtu0@linutronix.de>
References: <20250507145230.2272871-1-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250507145230.2272871-1-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_110815_856911_26F6FF3D 
X-CRM114-Status: GOOD (  17.91  )
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

On Wed, May 07, 2025 at 07:52:18AM -0700, Samuel Holland wrote:
> When the prctl() interface for pointer masking was added, it did not
> check that the pointer masking ISA extension was supported, only the
> individual submodes. Userspace could still attempt to disable pointer
> masking and query the pointer masking state. commit 81de1afb2dd1
> ("riscv: Fix kernel crash due to PR_SET_TAGGED_ADDR_CTRL") disallowed
> the former, as the senvcfg write could crash on older systems.
> PR_GET_TAGGED_ADDR_CTRL state does not crash, because it reads only
> kernel-internal state and not senvcfg, but it should still be disallowed
> for consistency.
> 
> Fixes: 09d6775f503b ("riscv: Add support for userspace pointer masking")
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
> 
>  arch/riscv/kernel/process.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
> index 7c244de77180..f7a1a887ae68 100644
> --- a/arch/riscv/kernel/process.c
> +++ b/arch/riscv/kernel/process.c
> @@ -330,6 +330,9 @@ long get_tagged_addr_ctrl(struct task_struct *task)
>  	struct thread_info *ti = task_thread_info(task);
>  	long ret = 0;
>  
> +	if (!riscv_has_extension_unlikely(RISCV_ISA_EXT_SUPM))
> +		return -EINVAL;
> +
>  	if (is_compat_thread(ti))
>  		return -EINVAL;

I think this matches what the man page says:

"If the arguments are invalid or this feature is disabled or unsupported by
the kernel, the call fails with EINVAL"

Reviewed-by: Nam Cao <namcao@linutronix.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
