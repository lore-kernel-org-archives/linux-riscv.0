Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3275C4167B
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Dec 2023 02:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uf6EaawmzPJUHLIWDbBjb0LJeUWTbYxAqTPSTQL+cyY=; b=Cu/2s0evCMXTYi
	p1Lw0EA6wqKbhV5mRKX0h32WBdLFyoJ9UuWYoyl2UJLwS46WTcMcT47QwlSsD2EEd8cCzr6VKzBuo
	6KphHEHIm9d0RQehQ1YAMBuA4yUpgbC8W5f0y4Hc4g8HkyG14Bl//v/QIROAp6zNAmmcZzxIDAQ5u
	yIHOBeyXQkawEjVDKozemuIiZatO2wXmIrb9hcx8JTqeTReiFAfwno/FRwIQBNHdF4NvQc65ohqV0
	DiO2jiBdThlBsW28czhSeXRCy0FPYvk7bH3PMGUSUBL7z1LO5+4ni4Wx/LysVt0jNFMimZjcBsmx/
	OdOW0kw3gsWan42ptUGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r9FOC-00F15L-1E;
	Sat, 02 Dec 2023 02:05:52 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r9FO9-00F14a-0l
	for linux-riscv@lists.infradead.org;
	Sat, 02 Dec 2023 02:05:51 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-3b8b00e44ceso341408b6e.2
        for <linux-riscv@lists.infradead.org>; Fri, 01 Dec 2023 18:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1701482748; x=1702087548; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KhM6dZTtzEH9kwZKinZ6bpRpn7uZMcu4elz4xKOAEUg=;
        b=wj0Jjq0FbXT4rQ53WhaidgsU40GA+G6X5lO5RQIJepX/f1u4GgxONNnvQSqwwDEUxi
         OAbs4NmRB/Auuonz1UTuQUxCZrDqrKnxcBR1LP+TIKNn9poKwFH25IRGKNZOim049HGW
         mriVPx4FUnm7527g0QW6eErXAW63J2n2C7YzRraC/4ZodsvBAyxWPXDl7HmTpwMyFD0e
         c1o7NjZOVGk3idERsRFK/vt9bWMXUOK9+p+cpU5JBKO+tnrf05fbtyG84ohwhxU/WWU2
         0GzQL5ZOknV3OdS0raV5F/bwMucb+ZcSDaYGPlIIN1tNTrQEwdZnYo8srmlRCrxpl2Az
         X4pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701482748; x=1702087548;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KhM6dZTtzEH9kwZKinZ6bpRpn7uZMcu4elz4xKOAEUg=;
        b=fcfNHuwjnZtqa0Z/l+5AVdM997Y/6fhyXXfJIqvmDH/aASafAwA2b+oXyo4C1elSTh
         7UTeW15TcVjLAy4vZNK2z/wzo9hKl+U26vATdBJQKuFha2XY7gElPn3f6va92gwdwFZ2
         jlnpieb6tJnLlvsAz8vG+f0ZfANpGgDuwIJbN7HLWVIcG8oZpae0P/hKnfS5Jajfe2b6
         LG1Jy9VFAYsKe17FqaXs2ESRLzPImUoOtWrB70adT8EHP7fFGlL1kcZITKgHvQ+btQMM
         WXT88nj7A8iqRSDokSJRDPdF/Mf236Wx6dsjHIGlifjDPoCW6gqjCTMc0O3vdUeeFCsY
         lLFg==
X-Gm-Message-State: AOJu0YzfFB/MmFfyVrqIE5c253qByX+VtjBWDhPsApphSSEmKTVM5A1O
	zd7UppSSzhwdCbBgaospbe+9oA==
X-Google-Smtp-Source: AGHT+IGwC+ZaeTCimRuF3WSaijpjciEHQ8dmPsLndBi7RJKxim2vmFJys2DUmMarH2MQ5hCCEaXJPw==
X-Received: by 2002:a05:6808:1204:b0:3b8:b063:5d79 with SMTP id a4-20020a056808120400b003b8b0635d79mr628856oil.96.1701482748112;
        Fri, 01 Dec 2023 18:05:48 -0800 (PST)
Received: from ghost ([2601:647:5700:6860:13ed:9bcc:7657:d11f])
        by smtp.gmail.com with ESMTPSA id t21-20020a05680800d500b003b85dd815bbsm745665oic.53.2023.12.01.18.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 18:05:47 -0800 (PST)
Date: Fri, 1 Dec 2023 18:05:45 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu,
	palmer@dabbelt.com, paul.walmsley@sifive.com
Subject: Re: [PATCH] riscv: fixup endian issues in module code
Message-ID: <ZWqQ+TSz5qoHbgVS@ghost>
References: <20231122104547.256286-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231122104547.256286-1-ben.dooks@codethink.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231201_180549_272008_6B2FAF91 
X-CRM114-Status: GOOD (  20.83  )
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

On Wed, Nov 22, 2023 at 10:45:47AM +0000, Ben Dooks wrote:
> There is a couple of places in the module.c file where it
> is using u16 where it meant __le16. Change this and fix
> the following sparse warnings:
> 
> arch/riscv/kernel/module.c:68:25: warning: cast to restricted __le16
> arch/riscv/kernel/module.c:68:55: warning: cast to restricted __le16
> arch/riscv/kernel/module.c:73:19: warning: incorrect type in assignment (different base types)
> arch/riscv/kernel/module.c:73:19:    expected unsigned short [usertype]
> arch/riscv/kernel/module.c:73:19:    got restricted __le16 [usertype]
> arch/riscv/kernel/module.c:74:19: warning: incorrect type in assignment (different base types)
> arch/riscv/kernel/module.c:74:19:    expected unsigned short [usertype]
> arch/riscv/kernel/module.c:74:19:    got restricted __le16 [usertype]
> arch/riscv/kernel/module.c:81:20: warning: cast to restricted __le16
> arch/riscv/kernel/module.c:86:17: warning: incorrect type in assignment (different base types)
> arch/riscv/kernel/module.c:86:17:    expected unsigned short [usertype]
> arch/riscv/kernel/module.c:86:17:    got restricted __le16 [usertype]
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
>  arch/riscv/kernel/module.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
> index b5109a3889c9..82f9266ae434 100644
> --- a/arch/riscv/kernel/module.c
> +++ b/arch/riscv/kernel/module.c
> @@ -64,7 +64,7 @@ static bool riscv_insn_valid_32bit_offset(ptrdiff_t val)
>  
>  static int riscv_insn_rmw(void *location, u32 keep, u32 set)
>  {
> -	u16 *parcel = location;
> +	__le16 *parcel = location;
>  	u32 insn = (u32)le16_to_cpu(parcel[0]) | (u32)le16_to_cpu(parcel[1]) << 16;
>  
>  	insn &= keep;
> @@ -77,7 +77,7 @@ static int riscv_insn_rmw(void *location, u32 keep, u32 set)
>  
>  static int riscv_insn_rvc_rmw(void *location, u16 keep, u16 set)
>  {
> -	u16 *parcel = location;
> +	__le16  *parcel = location;
>  	u16 insn = le16_to_cpu(*parcel);
>  
>  	insn &= keep;
> -- 
> 2.37.2.352.g3c44437643
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

We had the same idea :). I sent out a patch with the same changes a
couple days before this [1]. I did some shuffling of my series and the
patch ended up in [2] which will hopefully end up in an rc soon.

[1] https://lore.kernel.org/lkml/20231117-module_fixup-v1-2-62bb777f6825@rivosinc.com/
[2] https://lore.kernel.org/linux-riscv/20231127-module_linking_freeing-v4-2-a2ca1d7027d0@rivosinc.com/


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
