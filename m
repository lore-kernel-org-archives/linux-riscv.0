Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00FB5CCF9E8
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Sep 2024 16:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0L2RPMvc8tkxwqCbebQ9fSnyQgq47xoayHQShLWNmG0=; b=JRYgA8t+q0T2sP
	wSPdIMbTDltFHfuBHIssrRzfNYORloPINkSfNHcz9al30IqSbvxeLNSW8AQRXnLQUiMvJdd14xwLw
	z4ALUaAdZTM54u2Q6L9Anybq4B9KbAnjVVJvHu7uH4xdYK/+t/Fn+jDz491feqEVeOlli3MP40P08
	ssZ4K2bwt3+22NZM/jv+894Wmk+vTtCNVPvDugpkJUsbKECf+YduaTqoRQJxAp7zgri1ygT/ZaEsZ
	UFjbxjG9potiOqa+S+sQVIQozfWH7iqegcvBpflCOGUoiWuALpmBsETIq66pB8Q2g4wb0dOaRbAp1
	6rp7IUu9756thP5staOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stUgJ-000000061IK-0izU;
	Wed, 25 Sep 2024 16:15:59 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stUg0-000000061DW-2fsy
	for linux-riscv@lists.infradead.org;
	Wed, 25 Sep 2024 16:15:41 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-5365b71a6bdso32350e87.2
        for <linux-riscv@lists.infradead.org>; Wed, 25 Sep 2024 09:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1727280938; x=1727885738; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R9DRuGCTDrBWGkWJB2Lhke3+USvYCcKh82GTpav4EGE=;
        b=kmlMGlOcv/bL/Byf3D5fUWAYL/eZ8XZy2BkrzMP6tYc85mq3fQ4kZhAzZ14XREP7Sd
         hU4q4ac17YChK9KPw/b624b/Odg1EglsPQMEsrUzixg5eWDhW2eowhfYOMygIHJeadG5
         KAt2zqNTVttZhH97o1uRzfshu18k8sy21G3Khy5tZfRQhDYJJNJTh043HTbA2LXfen4o
         f5eggsek5gwsE5YKo6eyUek/mNtJO02ihbdyGpzAdGMQ3uHXimUfs4rO0lecM2WWAm1C
         0phmYwJM0hWEBtuNYIEt2fHBoUhM6sh4u00v9DtwipF1JxZxSdWjmNLD94pPrBvSZOkq
         KSvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727280938; x=1727885738;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R9DRuGCTDrBWGkWJB2Lhke3+USvYCcKh82GTpav4EGE=;
        b=IIXuZuktFQygN3gnWWENt8npayg+Fn44IietMQ6WSPWj+LMMqpgpBKZUIXkkTTwOoT
         5Yttpvds9tQiVDvJRIJD42JZRGTTS4+8MV3r+zx1RvjQbAaSctnugipxWhN+8C1HrG5w
         ld2BRGMDCgRdBpM9wmCImOcG43ogOY0J1HapeH7aLkcZiMB/qzt5MRBMNvIOedwU8tPi
         KYAKaCqpTsWNjWXkXFMF0xr5zQR/yiNfbyJtLSmeZvDptMe3vy3NrpCY7cTvPqn9n8zt
         Ti+c/VI3cWYeUYIFaFHoiDjaA3WQrgtIJC6coxzrHBRp3wfx9EKAop6p4fZ0Xfd7U1aR
         ijsw==
X-Forwarded-Encrypted: i=1; AJvYcCVZAYZ2s5+Zw8VsHZfkaLTQsaIe9mJeRYCKH5Wy33h+jE+Kdw0C/NwBHWn19l1/VMTWPENF8N2gXz6gzg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1JJkpBqx9DzcPgz6jFjPG1h2qWdkHPFgLz2sYJhBOUIyOIOLe
	rQWeLzCBqaLWZwPvXiddH7dw8I/vL2SuWzmhYiPxSWvNFgJBspn3fu6BViC7SpQ=
X-Google-Smtp-Source: AGHT+IEF6iymB9Yoj9BmfBJ/+k8HdemwHRlRBHcLH4/86ux07B6wbeg9QesHaVHeJbHxjH1GcyhYiw==
X-Received: by 2002:a05:6512:400c:b0:533:d3e:16fe with SMTP id 2adb3069b0e04-5387755cb91mr2304390e87.38.1727280937907;
        Wed, 25 Sep 2024 09:15:37 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9392f34790sm226910766b.31.2024.09.25.09.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 09:15:37 -0700 (PDT)
Date: Wed, 25 Sep 2024 18:15:36 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Nam Cao <namcao@linutronix.de>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Evan Green <evan@rivosinc.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: riscv: Fix typo MIMPLID -> MIMPID
Message-ID: <20240925-d0f744b7c2959b9c3dd14b6b@orel>
References: <20240925142532.31808-1-namcao@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240925142532.31808-1-namcao@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_091540_702119_BAF5B3F2 
X-CRM114-Status: GOOD (  17.28  )
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

On Wed, Sep 25, 2024 at 04:25:32PM GMT, Nam Cao wrote:
> The macro that is really defined is RISCV_HWPROBE_KEY_MIMPID, not
> RISCV_HWPROBE_KEY_MIMPLID (difference is the 'L').
> 
> Also, the riscv privileged specification names the register "mimpid", not
> "mimplid".
> 
> Correct these typos.
> 
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> ---
> ask me how I found out..

Hopefully due to someone using the document as a reference when attempting
to use hwprobe.

> 
>  Documentation/arch/riscv/hwprobe.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
> index 85b709257918..fb0affa61eb9 100644
> --- a/Documentation/arch/riscv/hwprobe.rst
> +++ b/Documentation/arch/riscv/hwprobe.rst
> @@ -51,7 +51,7 @@ The following keys are defined:
>  * :c:macro:`RISCV_HWPROBE_KEY_MARCHID`: Contains the value of ``marchid``, as
>    defined by the RISC-V privileged architecture specification.
>  
> -* :c:macro:`RISCV_HWPROBE_KEY_MIMPLID`: Contains the value of ``mimplid``, as
> +* :c:macro:`RISCV_HWPROBE_KEY_MIMPID`: Contains the value of ``mimpid``, as
>    defined by the RISC-V privileged architecture specification.
>  
>  * :c:macro:`RISCV_HWPROBE_KEY_BASE_BEHAVIOR`: A bitmask containing the base
> -- 
> 2.39.2
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
