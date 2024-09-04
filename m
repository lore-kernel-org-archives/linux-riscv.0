Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E639CD4847
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Sep 2024 18:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CvPDxcaricKLyC2R3eaz0+10YCYLn7oSlw6h4gSs22A=; b=bpxWST/D8ObIip
	ZDy5hsFdpI4gVzw00r49R6NxKVNelT0ljSGbGQf1zo8lNUR3ObbqpjgZhyXfEgwFDdv5re9rnj2Hr
	ffWJ8HegAPuzYe90oIaDR/81C0g4g5XHF7Ya/ifbXbH1yhKIeGl8+Y+Y8UeKuWUwJk0a8T6W0t593
	JRMRqi0kz2FdWKkyBKLn7NmApfdPoM6Ce9K6aD3c3y7RPBz+Ur4aacAcdP7NEDbFqoTMPDHUqa6xL
	Yg/2tl+lZ5EfECvc1qceGBR+I9Jr4toQsXqwWul4TaTNSXuiz3gEKbdJUYe64Fe4ipBsnFbGULmxd
	m24rJMGXhNtAOZ9iC/5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sluvY-00000005eTs-2gX2;
	Wed, 04 Sep 2024 18:40:24 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sluvK-00000005eS1-0hEI
	for linux-riscv@lists.infradead.org;
	Wed, 04 Sep 2024 18:40:21 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-202508cb8ebso44173185ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 04 Sep 2024 11:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1725475209; x=1726080009; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ulan+WQ8htez912X8/aFLX+cqcQJ9EL9ZEY5LMGJObk=;
        b=FtookeVjAuaX6UGNkSHv4tIGsXwSev7Fr8AwejuzEfeMY9SjyARSbUrgcHgEPbTaKM
         +pPY36lHKZpbAPo8KXzemTXzicmIoyzy5qXCMai+OJBKu09Qclqs7o9amFpa2VceYUuv
         yLnf+EKTPC6IXDIp0d5ZxCmiiQllha7W2iV1ZAAp5lq1+C/MWw0CVPgyTQcMqkEgRqz8
         oFH07iqoHyJ4BOXXVJrWdKtsZ/sb5XE2fZRqHojM1NkvFv2Puiqez83xbanHXajnXaQu
         2CaIafVmEQC2D16/GHesRLTJmBg3GKYzBRkn5giv5k4lqLP58OdYQH5Dn31BHh47h1XM
         EXyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725475209; x=1726080009;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ulan+WQ8htez912X8/aFLX+cqcQJ9EL9ZEY5LMGJObk=;
        b=M0KBF4BXn7+OEa/b3sq8WUkb4+ab/3DicFQzt8LMouCOYNv92nI9fS9MlkvpcSiyqE
         8ypzPOR9rrKLz/K8gODV0TVhnQZ9gmtlFzISChxGOHf50BqZ0kwpe/tG9XHkvWkiwrgs
         b2HgJ7/RWt0IBAz18JhxVvgk3mRGlw7fuPyJAjuA0lAyfkOSH65W5PUENa8+W2N4vxct
         xfAbjPUSKWZlUxfsRImOgO4j7Herg1oIUZSthwjpmhkmPNE1buSRNtY2r+vlcdvW7fra
         JQo2p5Q/T0VEhQnQjo+6W9EhbVLek7dHQCOzrwnSDQlykX/MEz4dJZmSxrIqZQpItmnL
         9c7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVg7m6TyRAhElkS0o/iyJjLSgL/s2KyGi5Jyj2/vFf9Zg7KRonMNiEdQuUmgVf8ICzsC6B7IS/E/Af4dg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyDn7jPE9+bOkNrVelERVVs7DqEkF3v5riIUaqlskMn9oxuHGUk
	Pv0t7eINwu+zfUkVZfFxmhuIWTQsfczaLAtn6dYrDdksPuscvuXWgWmRIxfHinw=
X-Google-Smtp-Source: AGHT+IFDe/R9M0jJq+8WIddRhH6k/BxnkhV5XKULEXOwTc5WdiEZowUDMaOHrCO5M0pFZFI3pf6f4w==
X-Received: by 2002:a17:902:dacf:b0:206:b1fa:ccbb with SMTP id d9443c01a7336-206b1fae460mr39129175ad.9.1725475209052;
        Wed, 04 Sep 2024 11:40:09 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206ae913cf1sm16615485ad.28.2024.09.04.11.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 11:40:08 -0700 (PDT)
Date: Wed, 4 Sep 2024 11:40:05 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	mcgrof@kernel.org, dan.carpenter@linaro.org, rppt@kernel.org,
	alexghiti@rivosinc.com, kernel@esmil.dk,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH -next] riscv: Use LIST_HEAD() to simplify code
Message-ID: <ZtiphR6dUIDf/EFp@ghost>
References: <20240904013344.2026738-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240904013344.2026738-1-ruanjinjie@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_114010_528960_A6EC53EB 
X-CRM114-Status: GOOD (  14.23  )
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

On Wed, Sep 04, 2024 at 09:33:44AM +0800, Jinjie Ruan wrote:
> list_head can be initialized automatically with LIST_HEAD()
> instead of calling INIT_LIST_HEAD().
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/riscv/kernel/module.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
> index 906f9a3a5d65..1cd461f3d872 100644
> --- a/arch/riscv/kernel/module.c
> +++ b/arch/riscv/kernel/module.c
> @@ -787,8 +787,8 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
>  	int res;
>  	unsigned int num_relocations = sechdrs[relsec].sh_size / sizeof(*rel);
>  	struct hlist_head *relocation_hashtable;
> -	struct list_head used_buckets_list;
>  	unsigned int hashtable_bits;
> +	LIST_HEAD(used_buckets_list);
>  
>  	hashtable_bits = initialize_relocation_hashtable(num_relocations,
>  							 &relocation_hashtable);
> @@ -796,8 +796,6 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
>  	if (!relocation_hashtable)
>  		return -ENOMEM;
>  
> -	INIT_LIST_HEAD(&used_buckets_list);
> -
>  	pr_debug("Applying relocate section %u to %u\n", relsec,
>  	       sechdrs[relsec].sh_info);
>  
> -- 
> 2.34.1
> 

Looks great!

Tested-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
