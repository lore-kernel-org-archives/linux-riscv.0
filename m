Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37650CC6B19
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Oct 2026 16:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mFYHyg6DPaXhpdOn5v4dn34VS6j82TA+TpTm86kyegU=; b=wY83M95lHcxjB6
	pV0YwZd9kWxGGJuJCWXJhB1BpIowCe3FTrNOwzgqqxZUNKQcZOW9ie9FTNSuwHCrMOx1/wiw6Y8Wi
	eiKM9b5ZHcC9hpLH51/rKv47cw9+/hGXh/o80iNf+cXon8cjJoyTuByWJYB4WEA4mrmsY7401L8A/
	oMM4v23fJ87lup0ll/mPldeLpXMGyd0r8j2a+yb2JjV7k48q5TH+P89MKB6paXIW4o9wI7fbkYFc/
	2VnFT3FA2M9z4NuiCCIY34pZK0v2SHXUQM1Z9D/VEtDp3qSJoj9D9dUBTOdr2PBUwl1U0DPJtMxP5
	JU7u5RiJv/TfaK7PcRnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGfqP-0000000DcDm-0pMt;
	Tue, 13 Oct 2026 16:59:17 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGfqM-0000000DcCr-3PMn
	for linux-riscv@lists.infradead.org;
	Tue, 13 Oct 2026 16:59:15 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-8acda240937so23901517b3.3
        for <linux-riscv@lists.infradead.org>; Tue, 13 Oct 2026 09:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1791910754; x=1792515554; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mjPFoJ0mDKhZbg4j/RMY3/uLWUv+CViZqO8+0A6BckY=;
        b=d4a2cy8QXZCOpJK929kQfFErB/FQct5zrNHMQVaVfJjGTxU8Ft7ymqFdaY/vQ/rDai
         NxR0PT/ZIpz2g15Bg85pLbgjkCo9o4iW/UETge1xaTpHKagCwn7pLFJGAMg/B7uox8lE
         dz7RTxZyV2mBGUdpWpKEWhWIwkUcmZl/eTEGUUvOJKv5x2QLdjde3z9DiFvK5DnvGT+2
         FqGAtTnVVA8idDV+ZIMxICKxX0QSxmCekhhwNqXeqBDxXmm9zL8IlfO5+33ZfZsDPlQA
         D+CUnF52kyYR7SkG7wY5QHQfKYfoU2x1ziFGASy0gQTNYGdL1ef1AfQpIKlEZT8k7AUM
         8GSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791910754; x=1792515554;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mjPFoJ0mDKhZbg4j/RMY3/uLWUv+CViZqO8+0A6BckY=;
        b=yNJFXEzkHEjhapEXiD1ho7vZzZKo4zLKMal95pdgNhUqw6Wd4dzek1tpmtPd6yD9mv
         p13WRd2gQXsPO9sQwAoAiDfQYz5sQdumwbmPNyg5QT4LuPwmwkRm6f2tAL8O8gHn4lv8
         +fNMYRJ61oAELoH5YH2j4xaRJ2hhdGF5efxmPitPeNF6Wp7/kFtkRyvNjqk0oJVqI8rR
         TbrIkxaYEuCVbCXejxPWxhOGP1cC9SPj3UBgQ7p9dsFVLQrn0wOsFOlDM9k+gm4ezlmF
         bswiLK/ZTrTYWHOIGBdfliO9DBbAXpjM3BRoQWjZmeql3LniDK7sUVS5pA5ljQDRZJmm
         v3sg==
X-Forwarded-Encrypted: i=1; AKwUvBzINViPndZueae3INp/JvHeqZii0PM/Z4l01R9ESl9FQzYnN5MTxM4BZFIxGxoOWEK7Kja3DTpaarmZFg==@lists.infradead.org
X-Gm-Message-State: AFq9FYLigW57kBSa5vIC4qrAysX1rws9vEYrpEort2cHZXZ2th/fWjqt
	n1SXWOPLdCDiSzQnYionv4KePS671hcq0goVQenLp6mXQ5OSp4auZeZQo0nQ1QsXkIY=
X-Gm-Gg: AYBFou1z9XzJMIIYuam1Vn3r698DVdo9JNG9m24fzqNcNgzgdQa4kEGyA4/WcBYxdRg
	akNVefKfv53/MzkTRGW2C56YZvrhTo1Of8n/YLuomRBV2Jv8ogv2svCAUFRiKhWi09OJif3/3Fp
	IdBTveGQQqgzmWLAq81TWk1k3CEzGrvkbBvclPDfAr+HIMwUSIpc47Ohoy/ojcPYs5L0F8kcSe6
	7W84yj+XhXupCnkjRdohDlcWgmmx6Fh/GcvkcqihaUr3xBGIbAMx+zkLIosPpZG2rOj+0U6HoqM
	uhMezcPPj89kpxowbo1AQWiBmGZS/88RjcV4wWIK6JrdvD4tVeCNVNfc0QSwMQq1xozo0XEW4s4
	m3jRSP1Vf73Xwu3G23uYzQ8X5je7dvdempqoxI4kRCB+e8z15LcToy+9a9J9FMHjfhD5SmZvWnf
	0t1IH3QkRjjrvEGMlBdGz4RSQozxXDZpuhh6jNh2HPQhRu5gM0CJIWOONchxyfjUg25oFWvM1lX
	Y30u6x7RiPl8eI7KS2G
X-Received: by 2002:a05:690c:5310:b0:8ae:1acc:ad33 with SMTP id 00721157ae682-8b07ee0118fmr31810657b3.58.1791910753585;
        Tue, 13 Oct 2026 09:59:13 -0700 (PDT)
Received: from localhost ([2600:1700:220:5c80:d01e:ebe9:3ad:261f])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b07ee8a075sm49030607b3.5.2026.10.13.09.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 09:59:13 -0700 (PDT)
Date: Tue, 13 Oct 2026 11:59:12 -0500
From: Andy Chiu <tchiu@tenstorrent.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Paul Walmsley <pjw@kernel.org>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Palmer Dabbelt <palmer@dabbelt.com>, linux-kernel@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/3] riscv: Drop CONFIG_RISCV_ISA_V_DEFAULT_ENABLE
Message-ID: <as5jYIDw-VVi_tuT@Tao-Chiu's-Mac>
References: <20261007085126.222688-1-samuel.holland@sifive.com>
 <20261007085126.222688-2-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261007085126.222688-2-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_095914_861554_616214C8 
X-CRM114-Status: GOOD (  22.82  )
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

On Wed, Oct 07, 2026 at 01:51:16AM -0700, Samuel Holland wrote:
> The ability to prevent userspace from executing vector instructions was
> provided as a escape hatch for software that was broken by adding vector
> state to the signal context. This appears to be unused in practice, and
> creates confusion in the extension support returned by hwprobe(), as in
> this one special case an extension reported as present by hwprobe() is
> unusable.
> 
> Since we believe it is safe to always allow vector usage, start removing
> this functionality by dropping the Kconfig option. It is possible to get
> equivalent behavior by setting the sysctl at boot via the kernel command
> line, but that method will also soon be deprecated.
> 
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

Reviewed-by: Andy Chiu <tchiu@tenstorrent.com>

Thanks!

> ---
> 
>  arch/riscv/Kconfig         | 11 -----------
>  arch/riscv/kernel/vector.c |  2 +-
>  2 files changed, 1 insertion(+), 12 deletions(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index d6c2dbf8455ce..e26450f0d38fb 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -650,17 +650,6 @@ config RISCV_ISA_V
>  
>  	  If you don't know what to do here, say Y.
>  
> -config RISCV_ISA_V_DEFAULT_ENABLE
> -	bool "Enable userspace Vector by default"
> -	depends on RISCV_ISA_V
> -	default y
> -	help
> -	  Say Y here if you want to enable Vector in userspace by default.
> -	  Otherwise, userspace has to make explicit prctl() call to enable
> -	  Vector, or enable it via the sysctl interface.
> -
> -	  If you don't know what to do here, say Y.
> -
>  config RISCV_ISA_V_UCOPY_THRESHOLD
>  	int "Threshold size for vectorized user copies"
>  	depends on RISCV_ISA_V
> diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
> index b112166d51e9f..9641343732782 100644
> --- a/arch/riscv/kernel/vector.c
> +++ b/arch/riscv/kernel/vector.c
> @@ -20,7 +20,7 @@
>  #include <asm/ptrace.h>
>  #include <asm/bug.h>
>  
> -static bool riscv_v_implicit_uacc = IS_ENABLED(CONFIG_RISCV_ISA_V_DEFAULT_ENABLE);
> +static bool riscv_v_implicit_uacc = true;
>  static struct kmem_cache *riscv_v_user_cachep;
>  #ifdef CONFIG_RISCV_ISA_V_PREEMPTIVE
>  static struct kmem_cache *riscv_v_kernel_cachep;
> -- 
> 2.52.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
