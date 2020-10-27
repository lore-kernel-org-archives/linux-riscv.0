Return-Path: <SRS0=hxxf=EC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ED9AC55179
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Oct 2020 10:04:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81D9F21D24
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Oct 2020 10:04:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PdTndXN7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="V+9PUBR0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81D9F21D24
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5tgbjGfFoOwakpExcv9Y8F7v9c3Wi/xaenpMRCrprpw=; b=PdTndXN7IQvbgDVEfAPJr0+8j
	d/6epXTQlbvTUBSV7ugAUpM0EmBSo+ce0mN8ag5bxRg5G/ADmzjVOJx/4cK+MA/kmv30y5PLKwNFC
	u1SYFmB3rY/nlqzwG7ezOc/aPlsm9D/fiomC37rLshLGgOv7al4oS5iTPk+BITTpEDGTu++ZbI+1a
	W6T8lgfoy7SH1+HHmtcCY9Ug9MO6VqK6P0n55jxEDZIdcO7ckRCDFsqMvzy4cyu2Y1bVtUJKCP/ow
	GNrHpXQM8WKixaiNjg6eobffO785Pa6Nqo2DGA8hCF7K7PCnPCIvO1nbs/zBaVL16jbtaaZFLT/b5
	KkRac/+XQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXLqJ-0000vG-6k; Tue, 27 Oct 2020 10:04:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXLqH-0000uj-AB
 for linux-riscv@lists.infradead.org; Tue, 27 Oct 2020 10:04:37 +0000
Received: from kernel.org (unknown [87.70.96.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C700F2225C;
 Tue, 27 Oct 2020 10:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603793076;
 bh=9oqzRDZNe+FfdXtk0S3LxKVoMZpBJw1CaS0aw8Ns96E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V+9PUBR0MaYQIgZV2v2UQvZdY/l4W42pbJcmh3UytyQXuaZjA1zIbhbHw21jjfE+n
 KCCI5hK1v9Xh5pqwCBSqwaSxxgsPx4rQio5c8LpyZoGsdkeQQqniq/4z4vq87JpmRL
 Kf4oKAXoAmeAt430Ucr9Hy0qL+Oy5oVI9enLf5Nc=
Date: Tue, 27 Oct 2020 12:04:27 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Atish Patra <atish.patra@wdc.com>
Subject: Re: [PATCH v2 2/6] RISC-V: Initialize SBI early
Message-ID: <20201027100427.GL1154158@kernel.org>
References: <20201026230254.911912-1-atish.patra@wdc.com>
 <20201026230254.911912-3-atish.patra@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201026230254.911912-3-atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201027_060437_463889_7C00EE59 
X-CRM114-Status: GOOD (  16.55  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Zong Li <zong.li@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 Andrew Morton <akpm@linux-foundation.org>, Borislav Petkov <bp@suse.de>,
 Michel Lespinasse <walken@google.com>, Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Oct 26, 2020 at 04:02:50PM -0700, Atish Patra wrote:
> Currently, SBI is initialized towards the end of arch setup. This prevents
> the set memory operations to be invoked earlier as it requires a full tlb
> flush.
> 
> Initialize SBI as early as possible.
> 
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  arch/riscv/kernel/setup.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index c424cc6dd833..7d6a04ae3929 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -89,6 +89,9 @@ void __init setup_arch(char **cmdline_p)
>  		pr_err("No DTB found in kernel mappings\n");
>  #endif
>  
> +#if IS_ENABLED(CONFIG_RISCV_SBI)

Maybe
	if (IS_ENABLED(CONFIG_RISCV_SBI))
		sbi_init()

> +	sbi_init();
> +#endif
>  #ifdef CONFIG_SWIOTLB
>  	swiotlb_init(1);
>  #endif
> @@ -97,10 +100,6 @@ void __init setup_arch(char **cmdline_p)
>  	kasan_init();
>  #endif
>  
> -#if IS_ENABLED(CONFIG_RISCV_SBI)
> -	sbi_init();
> -#endif
> -
>  #ifdef CONFIG_SMP
>  	setup_smp();
>  #endif
> -- 
> 2.25.1
> 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
