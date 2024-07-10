Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45AA8C3DA42
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Jul 2024 21:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cq7fq3pxSiz9mKK0J1f89UebXprS31/SS19GNrf8gQY=; b=jYoDea61yWKZZh
	In6Z6VJjxqBeO5bNmvekCHUkp4ZKHYXM6BnoKq7cWTFiq/sv6hd3ZHZdS02XTT+qRubncet/GNm+N
	+o8BjmCKlMjFNanbDT6fHgkgSEctU3FBXOUqWaGGefyOnIbBBtecEPMtaq597tjM9wA8U+gKgOVRL
	l1s+fJBsNdqG1D7xKCUtS4bYQm2RmfElbjSyU2QnO8l2sEaS0qZZ0xGKiEjJrbyfNOVP3CgsXg3X2
	1zjE+sNP66Qw+bH8ikOdgaysOKjYODCbq4GDtami4zCZryl93QDnx94tmLGj65+LnZEeUfIbGbnKe
	DQIh7U51OCLUa70GskBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sReyv-0000000Bntd-1g4k;
	Wed, 10 Jul 2024 21:36:09 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sReyt-0000000Bnt3-17dM
	for linux-riscv@lists.infradead.org;
	Wed, 10 Jul 2024 21:36:08 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1fb1ff21748so1286915ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 10 Jul 2024 14:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720647366; x=1721252166; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=neoSmIQD9fiLUW0JU5eiOnLcyT1Su7MFLG8PD6ZE0Sg=;
        b=CxotTy3dgxflTn0IjTEfbWFD3OFftOBt4tb4F1La2Ca0zSZa+4Evt3vrlY5J4O9yw1
         15S5PdL4ArjdoFKNQ+xp/8EWR3lyKv4uuh41SFTKyeocpQ5gcvAFM0TUf3M/2msorvDp
         1XIepSs0QrddAVt07FH+pYqGIxJ5ebiry/cbz8mFe8hVGcjWvNKQImcmNoF3MNlwZ7tm
         DwAqxXfylaY9uOJDHZn3tM9CZwRFtmcy1r30vu6Ajdxv+Z1c6fJmTjebItdFkf+vqLEz
         acOSC7lumRhQXzCFHCPxd3Znz76ljI1jTffoxLk2yuMe5QLWbONBEmcw2Q2KdMWIAkrP
         Cw0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720647366; x=1721252166;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=neoSmIQD9fiLUW0JU5eiOnLcyT1Su7MFLG8PD6ZE0Sg=;
        b=uBkzOzngzMsbKksWkcqQOTg3utbyGKcVPbj+fV2qH+2zF+Ur0Uuj8zvqjPEr1HjoZg
         tnw5Qs5TZ/ToUXXR1ajxAmrFGqeTcUGJ4RMqitrIoI8z39/8yEb6eqSbWngRTUk2BgUg
         9hIasClDEJiKHdQlvMwnvika4citbSNwPov7kjTPyiGNLrjwYAe5VtS5+gTboIE+Qcom
         0hWGHQMIpUzCwzQgYzxDmsyOhtxw2j2k3WSiRPhXk1RemeSn5w9MX6NljDgV6udJKWnf
         P9wgjyyHxa/9/Ua/Flj4AQLzBPer1FUmgTG7Un40A39k9ZfXYIoOOXqLigxKLTRA5VVU
         1j/w==
X-Forwarded-Encrypted: i=1; AJvYcCWaXPuJWTvgpcwPVn9uh5aDi/ycmV2sp8wKB5rE/3rhevrIiBQVxz/7oD9gjohUAr1DC9V+zYdR1nk33Hx74Vs4Dsum72NSeOx0DkHI0iRS
X-Gm-Message-State: AOJu0YwkwdllnLG9VRCtvpj6fcpFXky65X0VBuiSGWB47fNDLGmWNpTv
	c2JwOEKmZfNYDDnbTN3+bbAKXYMb3NaPKlp1Z/slFmXWhjs4TMzF
X-Google-Smtp-Source: AGHT+IE6MKZr+hsRKsCdU1IHNJ855fgshln8OWlyyfh4JG7Ez2Z5JXXJsHZr5fmgGpaCN6UcLT558w==
X-Received: by 2002:a17:902:cec4:b0:1fb:58e3:7197 with SMTP id d9443c01a7336-1fbb6ee1dd5mr59821215ad.66.1720647366316;
        Wed, 10 Jul 2024 14:36:06 -0700 (PDT)
Received: from localhost ([216.228.127.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fbb6a0fb67sm38228865ad.4.2024.07.10.14.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 14:36:05 -0700 (PDT)
Date: Wed, 10 Jul 2024 14:36:04 -0700
From: Yury Norov <yury.norov@gmail.com>
To: Thorsten Blum <thorsten.blum@toblux.com>
Cc: linux@rasmusvillemoes.dk, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Remove unnecessary int cast in variable_fls()
Message-ID: <Zo7-xDMFXVpIqyuR@yury-ThinkPad>
References: <20240710202416.710880-3-thorsten.blum@toblux.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240710202416.710880-3-thorsten.blum@toblux.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_143607_325240_F70D57D7 
X-CRM114-Status: GOOD (  14.36  )
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

On Wed, Jul 10, 2024 at 10:24:18PM +0200, Thorsten Blum wrote:
> __builtin_clz() returns an int and casting the whole expression to int
> is unnecessary. Remove it.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>

Added in bitmap-for-next for testing.

Thanks,
Yury

> ---
>  arch/riscv/include/asm/bitops.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/bitops.h b/arch/riscv/include/asm/bitops.h
> index 880606b0469a..71af9ecfcfcb 100644
> --- a/arch/riscv/include/asm/bitops.h
> +++ b/arch/riscv/include/asm/bitops.h
> @@ -170,7 +170,7 @@ static __always_inline int variable_fls(unsigned int x)
>  ({								\
>  	typeof(x) x_ = (x);					\
>  	__builtin_constant_p(x_) ?				\
> -	 (int)((x_ != 0) ? (32 - __builtin_clz(x_)) : 0)	\
> +	 ((x_ != 0) ? (32 - __builtin_clz(x_)) : 0)		\
>  	 :							\
>  	 variable_fls(x_);					\
>  })
> -- 
> 2.45.2

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
