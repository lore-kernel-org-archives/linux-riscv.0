Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA477C02188
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jan 2025 01:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xzA3SoEJWBnaDgs5oX+HeTqm7rBSiVoqdPImBZkgP6U=; b=M8xxAuaCid2cCk
	i2mKVMYbQV+95I+ZPZlBKfL+xBKKveZjnJw9DCwzfk/kCKChbfH3NNC570wjMsxRicT1Y/PS/8stp
	FIoEQxOueNpvHn1kJ+LgZCP0ZeasiVi2rF4HCQvjvosoJHWvK4r3HvS7PQ7fK5EbfOoMTvYVAlY2t
	BnAjx11WVUgDJ+5HeGKV8LFPKPYJ7cnwDUsAxVwEDqgm5InIkcxhjy0t5c+gySJ4l1V/ouaVmekJf
	zq+aDYJc+KfhGohgCPSHToVEeIyHib6aLXnCuxSxYk+KxgX/C0pE5FTt84UkX2u+wlgQY/eQtmGuT
	DGh35SeiqrdHpdpG0qfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcaD5-00000003uXW-0im5;
	Tue, 28 Jan 2025 01:16:11 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcaD2-00000003uXB-2klt
	for linux-riscv@lists.infradead.org;
	Tue, 28 Jan 2025 01:16:10 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2165448243fso110123445ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jan 2025 17:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738026968; x=1738631768; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZuFgfy5KBJbk0p5SG2vC6ixZAXF7LCPRfXW9Oen4rSE=;
        b=Zm3UKN8yjIuJwbqASXi0wZtw4G8Ba8BWOqOZ3MmK+eKwdarQAf8NazPDsnDNxy7+uB
         pVu/mOBNQw1ZnLuh1j1+/2JM1/AzxaBp8RWQfOds+Xw+KRm4Wko5yvvFl9IkxwT0NXvr
         7cqHHoSbSBDC0Gfzp6eIVeWRa4EwDTBlhQ//Gn842C0eoSbFxiFxlYAMn7oP0VVRz32F
         +6Cunn2Hk+7LefGpB7+25T4DybP/9f25pXXwytvGqOActIt+M2t6bMQjuY0W+YKgSiIL
         JQhdZ8qgRXvUHmDdGDJbbpSRVdBijSFcTXrc956G9ze+YFmcCJdzDzTrObykY3J0Wkdg
         D0PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738026968; x=1738631768;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZuFgfy5KBJbk0p5SG2vC6ixZAXF7LCPRfXW9Oen4rSE=;
        b=RFuN8zughhaSdW+QBudEk6K0wzppPuGHy/Dm6phy7pB/SZ6L5pPKJYXGQ8NkCJAq2Q
         j5XmghTyfenuLhDXVL37NF/0n3t9qtu4huCd1ThN+pbUHjXucSTp93FHddbcWZuy98pI
         zyZsQFc10rvpq1DSGaNXEUT5LHb67MM80X9kqYIYHx9KudRiSxDprowUrh50TQUCaa31
         xVw23eMVx0uK53Yovr30+eOWh5jmIexavzsglCAX55Q2H8W4q7qM6rM2SpRvC3+3lkhI
         PMyeb8GibtD2Dcq5n7kl5+bcMHPh+whKOtFufaa/jvrVLSZUEMsMJQD8gne5JrVi1h8/
         IdgA==
X-Forwarded-Encrypted: i=1; AJvYcCU2KGXSXBvV/LUeJBsENv39m7uk3AUijI/ZdE+6K6yTKnAFa9fdhd/N+BKo02YzWprXtx4Qjju25kbYrw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz00JsTqpioztF8ATGp7pxj+zHtDjAiR1rI4btC//65uw0z0407
	mfl7E76Rs4igqL2rVJxt1CUI3RyCg6PPaKrjbLH4EGPXg1tAr1/dRSaUWFx0v2Ew/AQ3pj73+3r
	rMEY=
X-Gm-Gg: ASbGncvfVZSutUct4zLpIZzn/Md0H7BhP5lp2mfuhPtQTctqNeSxkeLfypbfNrIHGGs
	mCan+7CEDsL+bxvYFA0C7Awzc0951vc4E1f/nB5Vhpo6uAx4lAeEnMASknq2yUIpjpPd+lThKcs
	sK7B9JezpYsbAWEKUWq1f6FyUw+J0TE0/HGsl/ngJaipOZhnaRPveXIMxhTQ5oS7eaWi62eFvDj
	KSF/Zymt56IWNzmNZxWK4GjdDWNO5GH08TjpObHbcvyIK6+9qdqdHKiOe46BRUiq3lazZk=
X-Google-Smtp-Source: AGHT+IGsB5XmqFsAn7RYaP7Fpu107m4TgwH9Ot4TdXXZ1732yrANc5eWKulWYbv/a1sqlHGGQ5ayZQ==
X-Received: by 2002:a17:902:d4cf:b0:216:6ef9:621 with SMTP id d9443c01a7336-21c355b6188mr661600845ad.31.1738026967861;
        Mon, 27 Jan 2025 17:16:07 -0800 (PST)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da413f453sm70956545ad.120.2025.01.27.17.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 17:16:07 -0800 (PST)
Date: Mon, 27 Jan 2025 17:16:05 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: David Wang <00107082@163.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 12/13] riscv/irq: use seq_put_decimal_ull_width() for
 decimal values
Message-ID: <Z5gv1S7tbPJO8boA@ghost>
References: <20241108162503.9914-1-00107082@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241108162503.9914-1-00107082@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_171608_701679_332CFD4D 
X-CRM114-Status: GOOD (  15.50  )
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

On Sat, Nov 09, 2024 at 12:25:03AM +0800, David Wang wrote:
> Performance improvement for reading /proc/interrupts on arch riscv
> 
> Signed-off-by: David Wang <00107082@163.com>

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Tested-by: Charlie Jenkins <charlie@rivosinc.com>

> ---
>  arch/riscv/kernel/smp.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
> index c180a647a30e..f1e9c3db094c 100644
> --- a/arch/riscv/kernel/smp.c
> +++ b/arch/riscv/kernel/smp.c
> @@ -226,7 +226,8 @@ void show_ipi_stats(struct seq_file *p, int prec)
>  		seq_printf(p, "%*s%u:%s", prec - 1, "IPI", i,
>  			   prec >= 4 ? " " : "");
>  		for_each_online_cpu(cpu)
> -			seq_printf(p, "%10u ", irq_desc_kstat_cpu(ipi_desc[i], cpu));
> +			seq_put_decimal_ull_width(p, " ",
> +						  irq_desc_kstat_cpu(ipi_desc[i], cpu), 10);
>  		seq_printf(p, " %s\n", ipi_names[i]);
>  	}
>  }
> -- 
> 2.39.2
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
