Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62DB6C02183
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jan 2025 21:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n5le+zi8APLcuUg9wA1z3PYSPQMkFX35lGBhGg/0W0g=; b=eoc3OMpdSUuTxL
	2UIqI2+ehy/3bgOSUxgtl8/lGX8E943KrFgHbME0/lQE5/jtyej00MGi6HkhiYcxUDne3I3u4re0X
	ttRdENhO0mJ48QVFilRLsOPfb9Z+ywQ4kJPBekzEtJ0aVTSl2V7XwLHA6I7Vevb6lGGLfcIjYUBMK
	YbgckdfY5HIU8jQDfxD2nn3MJAgcyeng42+3/O2mxaiClUm4UW3SNA05qxJDWbEjtlvH0i0XlsmnW
	rE1zJTKXdF2azx/xaUsg0WGAhpDE7clRVpAu5tFBvGVF+FaQ2HphGbdmEZLLVJFpCtV/6QHtQlm/l
	eJRTGCQf9dE69ksSoPhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYX7E-0000000G6kM-0bKP;
	Thu, 16 Jan 2025 21:09:24 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYX7C-0000000G6jy-078h
	for linux-riscv@lists.infradead.org;
	Thu, 16 Jan 2025 21:09:23 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2166651f752so32296175ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 16 Jan 2025 13:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737061761; x=1737666561; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xLy6fiGQSiUhs1Gv7gi/9ehtHmgmcyfRdTPntzghr9M=;
        b=hIZUEASBRMHmUdW02l9GURcNF63w41twHjwtN96dFkp+wcOL2iH/lMFjDiu7rspxQ+
         Fk9DD0Gq/WSruy00eqLccBXOE2TQOZTRdwwMMyYdbi3lCoj4cPVIelHSwNbmXkZ8CrLm
         du6Z/IDfbMaBo5lMIUczbR3Ev0g943tmE2L3Sg9PffFNsfCHgPwUlj/aRDpR6GYqs2mS
         yW9gSFTaiQS3zcCBvWMPcS4Q99453uiqaEAx8nv4BtJWYJelsGqumKRYIhgkCK8ncsvn
         Z8B1ud5w4q9V5OmEqFbgStj+sbTJRkj8jIqgVMjGdZYMkYZHH8J4FWMj/dCYv4meCws7
         /KAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737061761; x=1737666561;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xLy6fiGQSiUhs1Gv7gi/9ehtHmgmcyfRdTPntzghr9M=;
        b=j8IhsagMrmAwzHbo0jQ6ehWPDWOoK4WzJ8syvvw2CuXWjpSy0Cpflh85x8ckY1z4DZ
         WtdLXflvUazmjwckKCDBUSaHcb3DYB63QP41eV8jqFMzfX0i3E0eEBpTZgsIw7ThAm32
         Yb0IfPvvREWGburVG9I3OYyzJu3onEynBcvLB/VDdmrd7nhhrB9hH1dMLCl5IJTSsptl
         cyRYLkB88e3wWVvIXWMcL6V1JevbR9z0Aei/ACtOt32BlOpdr72G+nYcxGqT6D7o268q
         dT7Lvih1ZYJsAXCkRqQqA1zEzzFBy8bfoDmJxB46z7HRk2slernevzci6NSbgmPdqDPT
         cTZA==
X-Forwarded-Encrypted: i=1; AJvYcCVudsEET6S6317AkBv3VlyNVsGQMbcYEcx0mSf/T7xyp40JPzLzWJQKMHtrXV3KQiQhMThr7jqEX1ifFw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyQtlXYJOoU1P9lxPf3enC17hkpxoNzhb6+EAf9aI+87uvslDdV
	hqxg+rHO7n9mTxB4XZE62XGwsfRc68636laSah3Rgq4HORY78fEkG6hxiTHpdof7Y02NQbDIaQl
	vpb8=
X-Gm-Gg: ASbGncsr7b8h/i1uwovgvCu15BAynWPrJpCeC21K24IMFrauKwqnuYoXZj9Bus1az1/
	CAxCRXddpiasZbdW9zHvbgztuYB+8TEQiMv2ag2ODDTZYrTKBXx85NiFa+JfOOM3QVu/alOHX0y
	jJue9EaMHIqy2TEtcMB+vSaj78670FO5aVkiOHVAU/Bn7FXSWEQ3wYce/GKQbJJHxaeF4+B8NKE
	UT3pP8o/ANNhHcQQk1H+esmQWpguyb4+13ngrmaH7zBs4Y=
X-Google-Smtp-Source: AGHT+IHn8r6fyORqvt70F1/RiXRVvEfOUziTFNpWxfLgt7XnjW5G2Mmw6jp8xmfIuHpGfdjO4Hfobg==
X-Received: by 2002:aa7:88d1:0:b0:729:35b:542e with SMTP id d2e1a72fcca58-72dafb90892mr371241b3a.16.1737061761171;
        Thu, 16 Jan 2025 13:09:21 -0800 (PST)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dab9c8e37sm429311b3a.119.2025.01.16.13.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 13:09:20 -0800 (PST)
Date: Thu, 16 Jan 2025 13:09:18 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: anup@brainfault.org, tglx@linutronix.de, paul.walmsley@sifive.com,
	palmer@dabbelt.com, lihangjing@bytedance.com,
	xieyongji@bytedance.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] irqchip: riscv: Order normal writes and IPI writes
Message-ID: <Z4l1fklnUPyTSLO4@ghost>
References: <20250116120710.51673-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250116120710.51673-1-luxu.kernel@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_130922_066827_4B715C9C 
X-CRM114-Status: GOOD (  15.69  )
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

On Thu, Jan 16, 2025 at 08:07:10PM +0800, Xu Lu wrote:
> Replace writel_relaxed() with writel() when issuing IPI to ensure all
> previous write operations made by current CPU are visible to other CPUs.

Did you experience an ordering issue from this?

- Charlie

> 
> Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
> ---
>  drivers/irqchip/irq-riscv-imsic-early.c      | 2 +-
>  drivers/irqchip/irq-thead-c900-aclint-sswi.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-riscv-imsic-early.c b/drivers/irqchip/irq-riscv-imsic-early.c
> index c5c2e6929a2f..275df5005705 100644
> --- a/drivers/irqchip/irq-riscv-imsic-early.c
> +++ b/drivers/irqchip/irq-riscv-imsic-early.c
> @@ -27,7 +27,7 @@ static void imsic_ipi_send(unsigned int cpu)
>  {
>  	struct imsic_local_config *local = per_cpu_ptr(imsic->global.local, cpu);
>  
> -	writel_relaxed(IMSIC_IPI_ID, local->msi_va);
> +	writel(IMSIC_IPI_ID, local->msi_va);
>  }
>  
>  static void imsic_ipi_starting_cpu(void)
> diff --git a/drivers/irqchip/irq-thead-c900-aclint-sswi.c b/drivers/irqchip/irq-thead-c900-aclint-sswi.c
> index b0e366ade427..8ff6e7a1363b 100644
> --- a/drivers/irqchip/irq-thead-c900-aclint-sswi.c
> +++ b/drivers/irqchip/irq-thead-c900-aclint-sswi.c
> @@ -31,7 +31,7 @@ static DEFINE_PER_CPU(void __iomem *, sswi_cpu_regs);
>  
>  static void thead_aclint_sswi_ipi_send(unsigned int cpu)
>  {
> -	writel_relaxed(0x1, per_cpu(sswi_cpu_regs, cpu));
> +	writel(0x1, per_cpu(sswi_cpu_regs, cpu));
>  }
>  
>  static void thead_aclint_sswi_ipi_clear(void)
> -- 
> 2.20.1
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
