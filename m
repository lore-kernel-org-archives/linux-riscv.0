Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FC56C433F5
	for <linux-riscv@archiver.kernel.org>; Sun,  9 Oct 2022 12:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5YVN8R6aoAVW2dNDeUlqJqWRrXGLPlurNzztrY5EoxU=; b=Pp1enJDmNsYWB7
	68ac4+RQGaDQs3EDdyLezRc/iFwla8EWB/xGhXl0Fc5/mBRC5wYqiBlCsM1beQj57pAD3OjGH0dix
	2/ILO46E6SiqJXlLFY9oFXKPlEb36uFNnDMl7chSAInVIFLZjTfcw/wrw6uXQFjD+dkGO66cIOiiH
	mc7OVsQGLC/1420Fql1EG77OV3GlqfMIOs2lccVGnzd/agOTF8TvwCBAKz++8LpkCR5yrIrlfCzPv
	2C8n2QpooUq0aYV42pHuc7TQfwnSkNjstv/1TwzDPiIYsdPyd+RGzbO3Ljm181VwmRD/QOdcgffKL
	QhJyGsXGSsi4C2ZW6Tkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohVCw-00FWwn-Ft; Sun, 09 Oct 2022 12:15:02 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohVCu-00FWvM-1C
	for linux-riscv@lists.infradead.org; Sun, 09 Oct 2022 12:15:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 43633B80C69;
	Sun,  9 Oct 2022 12:14:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94930C433C1;
	Sun,  9 Oct 2022 12:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665317696;
	bh=WciH6tNrDqXfLYWE0rrHdkoSqbQhPHlMKemmVdnXz9A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=biOwjMEvHuSIE8NarhntzD8o+TDadoik5XJpctzSEsicXDUIcdMF8Gyv693Mq+IVI
	 z0AeKokLzZa0ug1Re1I7QehaU+dV4i27Twdu6i2oTzhFBvHy8Rd/m60PD06HnrYeDS
	 anopKXF1bU6SvoeJa425Q3azSAiXTz0HRn2EzKdH3+OfseSOYY6L7GPR3dwm4clRhg
	 UvjGVsDIpFiR/2riMRDuRpt7fBI8ZPuWRe9QHounnv7Yb7II56JK0e9ykxPepdXpEp
	 Ykdyx7ne7aUA+er5Fd8X3FjLK/VKWKO5K+rm0TkucM/HUzCbg5YCbkk9mREv/SG0lV
	 7NK+IgROko+bQ==
Date: Sun, 9 Oct 2022 13:14:52 +0100
From: Conor Dooley <conor@kernel.org>
To: Cleo John <waterdev@galaxycrow.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Fixed styling in riscv ucontext header
Message-ID: <Y0K7PDzwuOPweYSm@spud>
References: <20221009120340.GA41243@watet-ms7b87>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221009120340.GA41243@watet-ms7b87>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221009_051500_242587_FF4C9BCB 
X-CRM114-Status: GOOD (  27.37  )
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

Hey Cleo,

On Sun, Oct 09, 2022 at 02:03:40PM +0200, Cleo John wrote:
> Fixed styling in riscv ucontext header

This should probably be "riscv: fix styling..."

> This patch changes the two comments in ucontext.h by getting them up to the cody style proposed by torwalds. 

s/This patch changes/Change

Looks like some typos here too & your lines need to be wrapped at 72
characters for commit messages. git usually enforces that automatically
when you do a `git commit`.

> In my opinion this also improves the readability so I think this is a useful change to do.
> Please also tell me if you have a different opinion.

FYI commentary on the patch should go below the ---.

> 
> Signed-off-by: Cleo John <waterdev@galaxycrow.de>
> ---
>  arch/riscv/include/uapi/asm/ucontext.h | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/include/uapi/asm/ucontext.h b/arch/riscv/include/uapi/asm/ucontext.h
> index 44eb993950e5..0cd6f8616985 100644
> --- a/arch/riscv/include/uapi/asm/ucontext.h
> +++ b/arch/riscv/include/uapi/asm/ucontext.h
> @@ -18,7 +18,8 @@ struct ucontext {
>  	/* There's some padding here to allow sigset_t to be expanded in the

Why fix the closing comment but leave the opening ones incorrect?

Thanks,
Conor.

>  	 * future.  Though this is unlikely, other architectures put uc_sigmask
>  	 * at the end of this structure and explicitly state it can be
> -	 * expanded, so we didn't want to box ourselves in here. */
> +	 * expanded, so we didn't want to box ourselves in here.
> +	 */
>  	__u8		  __unused[1024 / 8 - sizeof(sigset_t)];
>  	/* We can't put uc_sigmask at the end of this structure because we need
>  	 * to be able to expand sigcontext in the future.  For example, the
> @@ -27,7 +28,8 @@ struct ucontext {
>  	 * ucontext, so we're putting this at the end in order to allow for
>  	 * infinite extensibility.  Since we know this will be extended and we
>  	 * assume sigset_t won't be extended an extreme amount, we're
> -	 * prioritizing this. */
> +	 * prioritizing this.
> +	 */
>  	struct sigcontext uc_mcontext;
>  };
>  
> -- 
> 2.25.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
