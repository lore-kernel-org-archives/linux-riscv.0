Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9828CCDB47E
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 13:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nTw4J2alqGBcpCe/7mSX8QF1roQ8/DvD/9kkWcLudWo=; b=BTRomvH+TSFLB4
	Xm50dz1HOdcsfRz+zWW6mKOxw+zwSU3yZm+clPNlv6yS2NE2SzmXC/4ecC2ZYpqfJs7/hIARpu0a2
	i0PT8t0sy08SKDis9/PajtX9s1RdNf71uS73bN3QfZbg5epBi3c68N3Ja46fkUDySM7YhHC+1VsZb
	qxbYe4MbUWDlnWBFJ9uCQqtslJaLFeOalKHUfenYxwohV0Qk2symHRfdu+I1pk6RUMdj9VBhi2Djd
	ZktMnLR3yJ6komWDOnCH/GB2yMzZptRd2rS7UcEIR2+12KtPlR+VRvCwaIDM0qB7YSC4ROicmO+a9
	r+2wdu4mJvt9TrgsXXTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt6Ey-00EjZ2-16;
	Wed, 18 Oct 2023 13:05:36 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt6Ew-00EjYN-0L
	for linux-riscv@lists.infradead.org;
	Wed, 18 Oct 2023 13:05:35 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4083f613272so3639895e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 18 Oct 2023 06:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697634331; x=1698239131; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GBX62DseBvfVHXeEbOvo2juJ8HpiHCck4wGzzm+Z4mE=;
        b=LCQ9zun2TDgUq95oe60d7ZIS0uUUXHWY6gYTUVlm+jzZWoumezvRZciTqbVAZzr/oK
         236dspk9O0V01J/mBfFbsv7i8lerV0lQLqxfg9DcK70EEPpQ4aCCSMzUe0XiM4wf8exB
         MAk8qn63G+Q4+hdoUuUGaDmMfUCJh5afPZsS+rqGBRjnn51vbAsQlRJdP5BvHLMkZwqE
         N4eKVgbyWD3ScvqHiHN962RcYS8SmVRxyL8L28sDKIhU4wHKHfENc6/OiaGkyreyqu6m
         AVQXOd1E/jJB34J2tyXeHc7r0vNDLxlty4KLZsCmqz7vif8urEpVRAM4kTrzt8hCtK0N
         7GXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697634331; x=1698239131;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GBX62DseBvfVHXeEbOvo2juJ8HpiHCck4wGzzm+Z4mE=;
        b=bIVvPvxjHFo5SXykaTqfnCBQaz5OPZpXvgvEFfQ8KaoLlqmFw6UUQcPgq+9q7HlM4Q
         GerM5/dhbitAGIvZzfQGolnFjxwZ36VMOwwpkWyU/di9BXordFiYIyENz0iYbJxfJHVg
         V2vku3jgIFjq9P1DANq+PKwN/RaeSffHWmxDOedIwkU3GG3fWCoOZOIRNkfwiHkslON3
         QJ1Q266+YWH4jmSekYYT0PKm/DJ6lFgHTHBIoTIsba+hagpJLNpsMqvQcQsd/P5urKCJ
         ad3jhntBXb5CRv1b7hQFJIuPb/tadBc28NtVyT2jvdTqOfzM2Glj/osoZLOJsLS7BQVP
         nepw==
X-Gm-Message-State: AOJu0Yxjv0jPmMkchZvCrdKiruY2XaEROayuTm3202guNlH0JbqF2VPz
	zvZ5UjZr5fKSB2GeyTWEMLm6XEwBdCnKSnwnTU8=
X-Google-Smtp-Source: AGHT+IF8gZ4+4pSrBgYaHk7XtB6rAHNxDkDq0yccZv1U0hcVx5il84WsHJ3BL8WIR1OEPUv2qiE9jg==
X-Received: by 2002:a05:600c:294c:b0:405:499a:7fc1 with SMTP id n12-20020a05600c294c00b00405499a7fc1mr3869445wmd.40.1697634331212;
        Wed, 18 Oct 2023 06:05:31 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id v18-20020a05600c15d200b004063d8b43e7sm1621073wmf.48.2023.10.18.06.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 06:05:30 -0700 (PDT)
Date: Wed, 18 Oct 2023 15:05:29 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-acpi@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v4 -next 2/4] RISC-V: ACPI: Update the return value of
 acpi_get_rhct()
Message-ID: <20231018-ea3dd893b735ce7ddb953ff5@orel>
References: <20231018124007.1306159-1-sunilvl@ventanamicro.com>
 <20231018124007.1306159-3-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231018124007.1306159-3-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_060534_144938_329848B7 
X-CRM114-Status: GOOD (  17.98  )
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

On Wed, Oct 18, 2023 at 06:10:05PM +0530, Sunil V L wrote:
> acpi_get_rhct() currently returns pointer to acpi_table_header
> structure. But since this is specific to RHCT, return pointer to
> acpi_table_rhct structure itself.
> 
> Suggested-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  drivers/acpi/riscv/rhct.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/acpi/riscv/rhct.c b/drivers/acpi/riscv/rhct.c
> index b280b3e9c7d9..489b0e93b1e5 100644
> --- a/drivers/acpi/riscv/rhct.c
> +++ b/drivers/acpi/riscv/rhct.c
> @@ -9,7 +9,7 @@
>  
>  #include <linux/acpi.h>
>  
> -static struct acpi_table_header *acpi_get_rhct(void)
> +static struct acpi_table_rhct *acpi_get_rhct(void)
>  {
>  	static struct acpi_table_header *rhct;
>  	acpi_status status;
> @@ -26,7 +26,7 @@ static struct acpi_table_header *acpi_get_rhct(void)
>  		}
>  	}
>  
> -	return rhct;
> +	return (struct acpi_table_rhct *)rhct;
>  }
>  
>  /*
> @@ -48,7 +48,7 @@ int acpi_get_riscv_isa(struct acpi_table_header *table, unsigned int cpu, const
>  	BUG_ON(acpi_disabled);
>  
>  	if (!table) {
> -		rhct = (struct acpi_table_rhct *)acpi_get_rhct();
> +		rhct = acpi_get_rhct();
>  		if (!rhct)
>  			return -ENOENT;
>  	} else {
> -- 
> 2.39.2
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
