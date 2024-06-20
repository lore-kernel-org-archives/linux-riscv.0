Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA66C27C79
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jun 2024 17:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F84va0WjcZfGVE3SAAMCkFKvOx+YqqsYgG3Gmj1lC5s=; b=TAuuitFbTHBv1v
	WP0CuoAaq6uFqiSHmuDr/OOo/r++thTs/n1FqTXP6SKSf1FDVZEugVwr+ynnbkP7it/VxBBSR6N3p
	BxwWwVpqM+APOXbJ92Ln4Kd+MncJ+3LLmZjDPqPaf/b176NIgk2rJgPi5PFEDTAmRe2OCNI8OfvtT
	cAU07x6t7feZsNeVSwcXUNpLbeBjfOOct+nZ2QpiQe5/ZiNRt+DpfUKDifpxd6YDnlM8wAVKzYTuE
	UENSRPJlK2OUqUREa+7yYw5yf0S9diAmXah8XRsQvYZBi5Zm8rx3iFGj/HQeOaxZH8RuTqIxlqEwE
	i65A8aIXW89pu8fYPOgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKLDz-00000005zSs-1lsg;
	Thu, 20 Jun 2024 17:05:27 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKLDw-00000005zSD-2NX8
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jun 2024 17:05:25 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1f9b52ef481so10456685ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 20 Jun 2024 10:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1718903124; x=1719507924; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4E89UTgs/5r5atSnFCInRbSVBNWxc0zHVVFCoSblkK4=;
        b=WPDUfKQYekSpToHS9fbaF/9JBkrL+RX7WQsCM61qldk2dlpRzeE0l+y/SSt9CqlGdD
         HiFXfr7aF3fJRSOTKvdLKp5mltMmgGsuT3nh9NUshOuITQ7dqZHiVTaLVoOhosN6uBKY
         A3VoK4Y9jWyoQ2YzH2Ito64i+XQz/JtChsaiQvIjnakzJLlNWBsYzRrKJejkfTtQMNAe
         CBdsOQN9Q8vp9w+goRUr9kB99nuUGbH2rS5ldzj9q5+n4Z8MmHLq3DUPeTJOh5olI8/T
         Acyh+TfYtPJdEbyd2Fx3Cz8u9ZQhkOEGf9AHN6blOGpuYZsxpa1L0uyD1Ftja7kEjV1h
         arfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718903124; x=1719507924;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4E89UTgs/5r5atSnFCInRbSVBNWxc0zHVVFCoSblkK4=;
        b=k5hTgArLRdpPCzWOvZBeXodWuy4eln8leLtnlvabbm0g05QrC3V544q37uGDWY7DlU
         oN5rTzlL7rYGC9CzR03fDLMENYotaqwnsS/52rauufAAJEaKr92L3DrNYfQA+VgXtCdb
         MvEu/QQF8WIcaJIWDepjtFdanFSLxOQvaCHxHU1mdZDWLM+QKMhLEpA5oFSR6dIrGgka
         lFG8yn3VNH1Fl6CKu+3+volWgfkRpWwDrC+6Y8hcOfj9DHrILlm6hLvp9KZntknyCF6a
         7isybLhQJv8pvzbljzuI9/3j+hIF8It+zL9QyAekIhzT3u4svDDiNrMUwYUYIP+XOIcd
         oZLw==
X-Forwarded-Encrypted: i=1; AJvYcCUKuDNsQ7Excs502mInV3ptydgZfg7voQirW2Qmyidfimtv0XCxaWoqTbXD/SOvmg2lzKZ1acpkz/EcWSfYoSv4zDH6H3Y61D0egWDMLGV2
X-Gm-Message-State: AOJu0YxIseLBtvHWX0jF5yS/n1uG3hpRkofk3ZXkd8MyctWzY1+yj5fJ
	4507IgH8iwTC/R5t7gB4KAfMoEWHOHM/+IgJ6bOIvVz6hqm2oE57cYgL0w4K2+4=
X-Google-Smtp-Source: AGHT+IHnO0PhojcD/q5JTTxQb+zxwVYaNBwpbOMTUxU2qhG2GuUiEPiNiJ0WLvWdxuAzdO/MlAP2Kg==
X-Received: by 2002:a17:902:d4c7:b0:1f7:17c2:118b with SMTP id d9443c01a7336-1f9aa3e9e49mr59538365ad.27.1718903123621;
        Thu, 20 Jun 2024 10:05:23 -0700 (PDT)
Received: from x1 ([2601:1c2:1802:170:4a35:79ce:6499:e43c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9acc04adcsm39635605ad.204.2024.06.20.10.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 10:05:23 -0700 (PDT)
Date: Thu, 20 Jun 2024 10:05:20 -0700
From: Drew Fustini <drew@pdp7.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Drew Fustini <dfustini@tenstorrent.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: thead: update Maintainer
Message-ID: <ZnRhUOSB+/hMSs2x@x1>
References: <20240620162522.386-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240620162522.386-1-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_100524_629693_8B186466 
X-CRM114-Status: GOOD (  14.94  )
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

On Fri, Jun 21, 2024 at 12:25:22AM +0800, Jisheng Zhang wrote:
> Due to personal reasons, I can't maintain T-Head SoCs any more. At the
> same time, I would nominate Drew Fustini as Maintainer. Drew contributed
> the sdhci support of TH1520 in the past, and is working on the clk
> parts. I believe he will look after T-Head SoCs.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index aacccb376c28..b5f5506815d6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19315,7 +19315,7 @@ F:	drivers/perf/riscv_pmu_legacy.c
>  F:	drivers/perf/riscv_pmu_sbi.c
>  
>  RISC-V THEAD SoC SUPPORT
> -M:	Jisheng Zhang <jszhang@kernel.org>
> +M:	Drew Fustini <drew@pdp7.com>
>  M:	Guo Ren <guoren@kernel.org>
>  M:	Fu Wei <wefu@redhat.com>
>  L:	linux-riscv@lists.infradead.org
> -- 
> 2.43.0
> 

Acked-by: Drew Fustini <drew@pdp7.com>

Jisheng - thanks for your efforts thus far and I'm happy to take over.

Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
