Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 126BEC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Jul 2022 23:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=JRZpW4mvV0djMEcUKzPWEiGg0siamf3F4SIuLKH+wHY=; b=r7wceX8PameejvAFvgtJBHO3q9
	78UVesSYduuksnIKaV2TGG37/umjk9gDk/IRBqd1Mw9wefoEvuwoh9TmZAonTqfaEZE5JWdw0snOv
	xn2vqEbGVahq+ELlVUgXuYMmzVfTS9VRUlNW680O0m6F2MeONjtdbUY31LyIjH8ur4ti5UGIZHvk9
	diCy989Bv4PVO8VyFEARYJvrcxWNPkjf9ZU1PgJxKsSUcxe7e1GqZElWSEZzDeqDA46f67nYCoETt
	zcq+L5Nano1KVR5b5eQ2PzzBYSuiOWReeYOQE4BLoZNF2Yo//HeDhjHxyOiXJtXiIbvDug2W+8C4W
	rA+wqsSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEfSe-00DGKt-6x; Thu, 21 Jul 2022 23:20:04 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEfSb-00DGGN-ME
	for linux-riscv@lists.infradead.org; Thu, 21 Jul 2022 23:20:03 +0000
Received: by mail-pl1-x632.google.com with SMTP id z3so3206360plb.1
        for <linux-riscv@lists.infradead.org>; Thu, 21 Jul 2022 16:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=phlwrERjyAicsZ1lIgES5DgVgY2nfSR+6Xv6a8GCu6c=;
        b=BoGu67QGmx3qGrbif+nX7M8DXkfp3CvnF797xM5Ap6ssPj/DNZQHZjRsqM12F54Y2c
         0gDNGCKP82mraS7z7zLAtvPYz2Ao0wT6NA+JdYswJycCMxNVk1boDKg9dO0NbXXk1QWl
         Z4GWIftTRj7AYZNmOMKg7kicJjeZYiM9FlsXB15FPjK7srwN1+WPDQbm3teyOPqbLqGp
         T+48pd3miQhH4oq6GHJoMjNTZjJdw4tnDTPlJF0Q81/+KI6cBhO5FNYFsDGn2kbAmUKD
         HqC9hXFMVh7Cl0UQ2m4lfROep0CISh0p6GeCxyDbu50doTeJKErHXP+3HZ8YDVYOaXW8
         aICQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=phlwrERjyAicsZ1lIgES5DgVgY2nfSR+6Xv6a8GCu6c=;
        b=jgvGtIJaBZkVl5bSYgFVU5xoFCPOqUcYEdV5n6YjqsGkK8HU0u2zOhPR5Ormq+yNOx
         8ZAZrhClQ9qcG3aiP6OoSaSl54Ibi8viRhNUdo8+MeW9RGlaqILGNJYkJI+cbZxPtYNs
         Q8d+11ayqH6+V0s3cCy6ogkjECOtjt+DmaFg3tWvCw4DNsxrB9KAY4+roEGfwOgoZYod
         ZGl9mwmPGayk9ETnV/8tfZ/odOe42X663AYYSoYrYTVvHgE+Yy1TBd1ISSc+/7M6mel7
         E+rYW/iB9PNf0SeUMbuFF7JzKIRK/K7U5+HvlllCC+0MJTHsE9Iy3gfVtLxVQRnugVXw
         +I5g==
X-Gm-Message-State: AJIora9QCA+rYu71RRflON9qfMiyTWnvQsxWJ4aZfESlUrAliKH1DUlx
	UpnTPDGblazMRrgQZc+vkILZcOHb7VD5rQ==
X-Google-Smtp-Source: AGRyM1sxU5yQ4AhxcC8/tZN4tjd91dw8Py9nSSi3L5bMO2fDXyioFVd7EITtMKPXAzJ5r6cvIrs12w==
X-Received: by 2002:a17:90a:590e:b0:1f2:2184:6893 with SMTP id k14-20020a17090a590e00b001f221846893mr10979118pji.57.1658445598468;
        Thu, 21 Jul 2022 16:19:58 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id i1-20020a17090a138100b001ef899eb51fsm4134601pja.29.2022.07.21.16.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 16:19:57 -0700 (PDT)
Date: Thu, 21 Jul 2022 16:19:57 -0700 (PDT)
X-Google-Original-Date: Thu, 21 Jul 2022 16:19:46 PDT (-0700)
Subject: Re: [PATCH] riscv: mmap with PROT_WRITE but no PROT_READ is invalid
In-Reply-To: <PH7PR14MB559464DBDD310E755F5B21E8CEDC9@PH7PR14MB5594.namprd14.prod.outlook.com>
CC: linux-riscv@lists.infradead.org, coelacanthus@outlook.com, xc-tan@outlook.com,
  dramforever@live.com, c141028@gmail.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: coelacanthus@outlook.com
Message-ID: <mhng-4904215b-4d85-4886-8eb3-bdd363447cf0@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_162001_812941_314E117C 
X-CRM114-Status: GOOD (  18.38  )
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

On Tue, 31 May 2022 00:56:52 PDT (-0700), coelacanthus@outlook.com wrote:
> As mentioned in Table 4.5 in RISC-V spec Volume 2 Section 4.3, write
> but not read is "Reserved for future use.". For now, they are not valid.
> In the current code, -wx is marked as invalid, but -w- is not marked
> as invalid.
> This patch refines that judgment.
>
> Reported-by: xctan <xc-tan@outlook.com>
> Co-developed-by: dram <dramforever@live.com>
> Signed-off-by: dram <dramforever@live.com>
> Co-developed-by: Ruizhe Pan <c141028@gmail.com>
> Signed-off-by: Ruizhe Pan <c141028@gmail.com>
> Signed-off-by: Celeste Liu <coelacanthus@outlook.com>
> Cc: linux-riscv@lists.infradead.org
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> ---
>  arch/riscv/kernel/sys_riscv.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
> index 12f8a7fce78b..8a7880b9c433 100644
> --- a/arch/riscv/kernel/sys_riscv.c
> +++ b/arch/riscv/kernel/sys_riscv.c
> @@ -18,9 +18,8 @@ static long riscv_sys_mmap(unsigned long addr, unsigned long len,
>  	if (unlikely(offset & (~PAGE_MASK >> page_shift_offset)))
>  		return -EINVAL;
>
> -	if ((prot & PROT_WRITE) && (prot & PROT_EXEC))
> -		if (unlikely(!(prot & PROT_READ)))
> -			return -EINVAL;
> +	if (unlikely((prot & PROT_WRITE) && !(prot & PROT_READ)))
> +		return -EINVAL;
>
>  	return ksys_mmap_pgoff(addr, len, prot, flags, fd,
>  			       offset >> (PAGE_SHIFT - page_shift_offset));

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
