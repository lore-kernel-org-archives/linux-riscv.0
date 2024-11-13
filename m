Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A81D2D41C2F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Nov 2024 10:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=COHOSZqSz3edt3ude9DvbydLW27RKCrwT/2UozfNd8U=; b=UbK1qsSh5egNyV
	WIdJl/W6BZG84RiuWla1RveQLQuRKPb4oCJPIxA+EnWygaMOPBvaMj/UYwrLIBRnJFN0H7DT4W43Y
	qxnblu9Ve4JM5UaBisvoBPPiIy0FdznsOIlCwKho3ErBS1Cz88ZO4xIZBq+C9hbbgNuC7U3CM3G8F
	O/pF4szouJEA6iKFtWEzV542WSqjArNxgOgs7Ek5q58hrHHhux4AERjqOq6wfRPn0nefcLUmBGjBJ
	+cuYqZseqFywH4JPKc6ZhS+Dcnn3MDy8pMUT4OSZT6QBMr6Zr2SeKVqHfq/IZGB1B/TpoHAnWVqoY
	BNESoNUz/sdiXfDhT11w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBAbS-00000006RS7-1I7t;
	Wed, 13 Nov 2024 10:28:02 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBAMp-00000006Ogm-0PZ5
	for linux-riscv@lists.infradead.org;
	Wed, 13 Nov 2024 10:12:56 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-53da3545908so100930e87.1
        for <linux-riscv@lists.infradead.org>; Wed, 13 Nov 2024 02:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1731492773; x=1732097573; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9Yk33hxQ8pXLz/rgooBZgy2xgA/bFgiodLJzSUupZzc=;
        b=nGL1xdj2VylzHqDForoLEZgHyaWSFeOpo3X+GBl9wyC7G41yyGSTeuS/iJH3gapUlg
         PeqjUVe7KlW/XSn0c+yUwNiwEujO+YDzrRSCM4xAfrmaXhTpWqMvSeYTve1LhMf/pPL8
         LGdz/khviWlw0hG458z3ZeVuuOEs/H/h7MhHam5gHa0vhc9c4C4w5I/k/RiYstq7vyD5
         rdZHvETRBX6A98cjbApFny7cy0qw09VO10ITu9ndbKZO0qjvtCLSJdc0QZtpyEw7lS1X
         9+Mwk1FX5YYS+JNNJcI2krfwtt9Ktb0KQ7+OsjrZ89DIgyDKAeiwPQVongM/ugF2KcQ2
         Oi8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731492773; x=1732097573;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Yk33hxQ8pXLz/rgooBZgy2xgA/bFgiodLJzSUupZzc=;
        b=wwQqIUi3BmMsJfjmX87+ZKI/oibvgR40FI2++JvpKlzBqB5T/DkiVjoguYgNkPZ2XS
         sl33MAIsiHBdwav8XtJk465VDdaKcNzyZ1KvQpp0+fh/xeRUVPwIxwUi0H6LgqqQXGWe
         c8eRLye+vFEnjJdKhvtX0X2ipZ3UlCQ5oxHN6ag8GDA3Sjij22CgCzaP6BXrOoHrEi8G
         CNzJzG/YlJNvehhqxz6nvNb9gFi3YoZbCQTI6n7TlgnfraYU1to5rUrsqmzvTpYQotbo
         9ddTm5FS9u2l9K05cu1+AXEn8NmIc1eJY621UrOn6Xpowcd5OFFhbWZkfmaanJPGtVfC
         rv6w==
X-Gm-Message-State: AOJu0YxMVIXewzbhTYt28B/40NfCu+Uv8opsJaI5AbVjVHO4O0EwhL1T
	AdtexFiO6uS3GWhtKRu6cq7JX39kb/cxbYo28FU6Q6xIEymmjSwaZcAVl+1asFRTnw/TGfb/gHP
	vCyU=
X-Google-Smtp-Source: AGHT+IG9exkIP5QMhjPUONuni8MjnzqLWYBvEl2g1ACHJSMUZumkZ7wkVGO1F4n2zYUS1sdGd2vL4A==
X-Received: by 2002:a05:6512:3d89:b0:539:d870:9a51 with SMTP id 2adb3069b0e04-53d86302f33mr9424096e87.48.1731492772870;
        Wed, 13 Nov 2024 02:12:52 -0800 (PST)
Received: from localhost (cst2-173-13.cust.vodafone.cz. [31.30.173.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432d55108f0sm18942605e9.36.2024.11.13.02.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 02:12:52 -0800 (PST)
Date: Wed, 13 Nov 2024 11:12:51 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, alex@ghiti.fr
Subject: Re: [PATCH 1/3] riscv: ptrace: add regs_set_register()
Message-ID: <20241113-58aebadd1b4916382031abaa@orel>
References: <20241113091703.3133017-1-ben.dooks@codethink.co.uk>
 <20241113091703.3133017-2-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241113091703.3133017-2-ben.dooks@codethink.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_021255_173827_A9DF29F7 
X-CRM114-Status: GOOD (  21.23  )
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

On Wed, Nov 13, 2024 at 09:17:01AM +0000, Ben Dooks wrote:
> Since we have regs_get_register() and we could use the set counterpart
> for things like fixing up traps, add regs_set_register() to set a pt_regs
> value from offset.
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
>  arch/riscv/include/asm/ptrace.h | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/ptrace.h b/arch/riscv/include/asm/ptrace.h
> index b5b0adcc85c1..66fc1795141d 100644
> --- a/arch/riscv/include/asm/ptrace.h
> +++ b/arch/riscv/include/asm/ptrace.h
> @@ -143,6 +143,26 @@ static inline unsigned long regs_get_register(struct pt_regs *regs,
>  	return *(unsigned long *)((unsigned long)regs + offset);
>  }
>  
> +/**
> + * regs_set_register() - set register value from its offset

s/from/at/

> + * @regs:	pt_regs from which register value is gotten

s/gotten/set/

> + * @offset:	offset of the register.
> + * @to:		value to set register to

Can we name this 'value' instead of 'to'?

> + *
> + * regs_set_register sets the value @to to a register whose offset from @regs.
> + * The @offset is the offset of the register in struct pt_regs.
> + * If @offset is bigger than MAX_REG_OFFSET, this will ignore the write.
> + */
> +static inline void regs_set_register(struct pt_regs *regs,
> +				     unsigned int offset,
> +				     unsigned long to)
> +{
> +	if (unlikely(offset > MAX_REG_OFFSET))
> +		return;
> +
> +	*(unsigned long *)((unsigned long)regs + offset) = to;
> +}
> +
>  /**
>   * regs_get_kernel_argument() - get Nth function argument in kernel
>   * @regs:       pt_regs of that context
> -- 
> 2.37.2.352.g3c44437643
>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
