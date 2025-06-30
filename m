Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89A1FC83000
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jun 2025 08:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pmdJaiKSUdZXLQ95WNpsgzNPHhmCcVHnd1MT/vS53vA=; b=PUAGCUcXFzm4B1
	4NaQs82i1K+VrlwxrOoB0FXhubxt4qZ4dCitgcN0K47CquTi4UJcVZLhTAzT25q0Tqgg2bsqZH1c/
	G7kYbGtwalViob4Mz0pkFdwcM5ngwc8UAB8AGQn5ueOHnmRT8GLacjpucfqAuRRvU4YwGSH4hr81I
	VaXya7hrkACOnqQ+A8nwa2QNcVe0tJbpPf0ydobmHfO0JCsodI8BL0DPOCXDo/ApgGfPQ+csCrdbm
	HzjbMhGkWjLJngDJD01+MhmA95XlrvL7wyKIi4caeWZJ2K9Q8ZJaMGQu0jkqVn3UOFPwxm4i35kQs
	8svRZlTW6jmHUoIYq/ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW9Tf-00000001YLb-1FvD;
	Mon, 30 Jun 2025 08:02:59 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW9Tc-00000001YKO-2fp2
	for linux-riscv@lists.infradead.org;
	Mon, 30 Jun 2025 08:02:57 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4537edf2c3cso39829385e9.3
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jun 2025 01:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751270575; x=1751875375; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ska9I3Y1aB1MGchq/+g1Gg5HtDvHRWWCZw8erAwmjVs=;
        b=oC8OnRvtSYVZNAhwzbAqe0DqTpMtxmZvjFXMf8FLsqR6tkeGg5iNS8kWrVZfzkLwKz
         IlVUWlmH6Nt9cAlzdmRZgAMbfhWSajoAhY/j4q0qDhK9wCxAQrFbZDCfILIU2bHZTx1r
         onXiLMvBUsyt3ZLYKfUY724N1T3LJQ+Ermt5l+m0fA03XQ5lW87FHIFs2uyhq/WY4g7K
         AEkVEpXPUYEboxb4tMdfTkX3M9Qh++MYDF/rW9XQK2nk8sYCoHzRqLX5bcvKdE4ycPJs
         AEnIpMgB/HpUUcjOF3f7HUIpNZa/U+1IeyBDW7VsmVdpJbd0Q0HoNPs3IpScj/9vD3Sq
         BrMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751270575; x=1751875375;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ska9I3Y1aB1MGchq/+g1Gg5HtDvHRWWCZw8erAwmjVs=;
        b=UaEM5kIZpWfOxmNMcYUu5Se1B5RIKC4P/G+kgc2MiWOMcpQ7Cw5L8bVQv3cV//oxxW
         FtZgT8pYp9ljrQDcbfbrO/DH331jNraybWqCt1UFxUoHfKnOrPwy618rAtOyZj+mj3QT
         9Cqqhk+cpbgEeZKj3SNjPl4TwSp4yvB4uyDMCrr7amYzX+N9ZD4AxCRNH9y5qBvctNbK
         KnHBB7IbjxfdNqz3mMJ39I6B9z4wTTBC+lAMMMF8HoT2zXQ/FHdbWvS8H7r3hhY/aR1Y
         awQRk8QKOl4n3ImANzjLyYlznF+QGzNvqlDpQMoHxNoBM2GQrY3MsmW6COjVCqqOkfap
         ILGA==
X-Forwarded-Encrypted: i=1; AJvYcCUI/nP8bN1OSYqIE0xSiPseEAaEvEj7tBrO5syJzIFZoAnM4N2ZCRjhSWXrXgEOajGlPbwZWUnOuAsSSg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwVS6H088UTMvw3loabnRpu5KaoQQkYBlt/KHIhKYhxAHNPg41Q
	HeMKa0zbcXYYvHiHstdxAphuCedok/a+XT21WP9S+ELzfK4qr+WIHu+21SW8zQTiABU=
X-Gm-Gg: ASbGncs7336xVJLONFMXlirZqzY9R6k9lrcksYJEDhslcANHbPj5LLjNgZ2YKRMUpI1
	2AB2jLX3+kZKLf8DOaYwb7kJk1h0a/Vdu35MOBDd1E4DCkR39049ZbZ8Hq4r+XmbbaciCzDQOaA
	CVYJ4ccFG/MKyKg4nV5vqrYZ+guqGakmUnQ+69kh2LZoXuOGco70wpNtS7BfE+WlkZRD2ZRmaqY
	vYfmqPlU7Ynkr52ktZRDAyOeKayfFI9Sgg9NQC1S8pzKuX5A8Ep37AZxpgXYuTh3YQJiZrh5B8V
	niNko5WW+xf+ZMQkZa1Qv2UTXwxxeyMuXEnTyoVJrHVe1QsY31TltklDmfN0
X-Google-Smtp-Source: AGHT+IF9DvJJg0skDidkDsih4Ch3HhJLBIarQJZKBHX8xHPqB+4mHwpjYWK0XFUsByASmkbm+oOmbg==
X-Received: by 2002:a05:6000:dcb:b0:3a5:8977:e10f with SMTP id ffacd0b85a97d-3a917603b5cmr7981361f8f.28.1751270574863;
        Mon, 30 Jun 2025 01:02:54 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::5485])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e5f842sm9499471f8f.86.2025.06.30.01.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 01:02:54 -0700 (PDT)
Date: Mon, 30 Jun 2025 10:02:53 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-acpi@vger.kernel.org, iommu@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Len Brown <lenb@kernel.org>, Tomasz Jeznach <tjeznach@rivosinc.com>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Anup Patel <apatel@ventanamicro.com>, 
	Atish Patra <atishp@rivosinc.com>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: [PATCH v3 2/3] ACPI: scan: Add support for RISC-V in
 acpi_iommu_configure_id()
Message-ID: <20250630-c479c6607cf8c1430f11336f@orel>
References: <20250630034803.1611262-1-sunilvl@ventanamicro.com>
 <20250630034803.1611262-3-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250630034803.1611262-3-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_010256_674514_7FF516FD 
X-CRM114-Status: GOOD (  16.75  )
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

On Mon, Jun 30, 2025 at 09:18:02AM +0530, Sunil V L wrote:
> acpi_iommu_configure_id() currently supports only IORT (ARM) and VIOT.
> Add support for RISC-V as well.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> ---
>  drivers/acpi/scan.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
> index fb1fe9f3b1a3..70f57d58fd61 100644
> --- a/drivers/acpi/scan.c
> +++ b/drivers/acpi/scan.c
> @@ -11,6 +11,7 @@
>  #include <linux/kernel.h>
>  #include <linux/acpi.h>
>  #include <linux/acpi_iort.h>
> +#include <linux/acpi_rimt.h>
>  #include <linux/acpi_viot.h>
>  #include <linux/iommu.h>
>  #include <linux/signal.h>
> @@ -1628,8 +1629,12 @@ static int acpi_iommu_configure_id(struct device *dev, const u32 *id_in)
>  	}
>  
>  	err = iort_iommu_configure_id(dev, id_in);
> -	if (err && err != -EPROBE_DEFER)
> -		err = viot_iommu_configure(dev);
> +	if (err && err != -EPROBE_DEFER) {
> +		err = rimt_iommu_configure_id(dev, id_in);
> +		if (err && err != -EPROBE_DEFER)
> +			err = viot_iommu_configure(dev);
> +	}

This can just be

  err = iort_iommu_configure_id(dev, id_in);
  if (err...
     err = rimt_iommu_configure_id(dev, id_in);
  if (err...
     err = viot_iommu_configure(dev);

Thanks,
drew

> +
>  	mutex_unlock(&iommu_probe_device_lock);
>  
>  	return err;
> -- 
> 2.43.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
