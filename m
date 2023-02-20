Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A410C6379F
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Feb 2023 20:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DOJCltyGSGkjn9evtMByf3bZM6V4RqjzwFB4FzcylBg=; b=W2rGfPFgC+K03M
	xFCbxLg66S1280eju72EXqrbrZVTna46Urp6fVdIZiEEBRZIBKe+ip8kKmBy9vskqOeeSjIJH4GlY
	MxCEfMIcYc5uyPlt9VxzZyrgvxkWTum21xN/dIiapJp/hbnd1lEbhRKHiFYbuk91TL1hdNvbRXFed
	4MR+G2m3gdn9Y70g+Ss5WS1nt2T0eM3IqdnLebq/WkWf9rdGlcSrABh1mZS0kBiwitZO0LzC88rPj
	CEYDkrXOBL3DtGSfe02jeeufMHERU7/52NzWLOH8xGhNmXwf74kd1Z07tF39N1QXZc3JnN0mu5Bc/
	9iaH2F72nOn0ADiV7niA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUCYd-005ULx-OU; Mon, 20 Feb 2023 20:14:43 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUCYa-005ULK-HB
	for linux-riscv@lists.infradead.org; Mon, 20 Feb 2023 20:14:41 +0000
Received: by mail-ed1-x531.google.com with SMTP id g1so8739595edz.7
        for <linux-riscv@lists.infradead.org>; Mon, 20 Feb 2023 12:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o+Wbr+1FrBDToW7AqV/H1MWMx9xByoJE7YPlqeXSlPA=;
        b=CB1sL9McrUfqxvGvfSbcQ0++7q9NQ187eKVG3qTYAlbaTDv+M81f5Xmvn4VLxF06NC
         FwYoGGSXpkhKPrlm8+yYT+bW8g2ZS+OUO8YumD3s3uO3y0boThFbgTldhsU+teV4uK0w
         6xgI7oSicUWs56egbjqob3gRx3Pt4Qsvc0/C29f40CiowuZdDgQVwY+rJD7C2yJcn+Di
         S4O2guihhLAHtW4ic9FyI5B/S5OfWnwWdBmx55f+Hj3laL+EAxNt4tdZgeQxSNnOSfQr
         yQ4JABzFJAP56di3KZHOxrKD20KAyhoM1f2tRxmV+FbVIPqC9N9MHB61T0Ms1kTEaf58
         uWXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o+Wbr+1FrBDToW7AqV/H1MWMx9xByoJE7YPlqeXSlPA=;
        b=GT+nhJaAKV6IQSkvryJFgXo3CsWVh0MYFd09jmq1/wd4Yqv13/7A2dmGbTbZj330V3
         2NZroiztbX6evX65rJsC/IvRjW0lMoevJ6OGJT/5Z2guRCryOnQ/CwiYpXKU836YY6jF
         8CDxsH6ic9U/Y0+gz5TPbBKOMX8hgtuVDYqnpu6Nt1jzA4Epc0h3JZcaSh0YztW+1qwJ
         N0Did/x/R/FArllcWOdfi5LQ8J034yNgCgK48MgKHwSvFS4MAKqxzHxAogFmhvQ22e2R
         VsmzPA+wa8HOZAS8TlZliiSxlccLx6EFOCOTiVRqra/xPnbe1e/FqQgIpY6z8y5ZPeEP
         nWYw==
X-Gm-Message-State: AO0yUKUV9X2kn+ua3G5YtZ2cPGn8QRD+cs9XQOU4eLj38ZA2KZzThHdP
	/YgpR8H8wEEyf8qkeZ0grilXkg==
X-Google-Smtp-Source: AK7set/K/1LntFX+Snxn8HPHm4SvMNLxHvAHb57jt/6GbqwtK7GjutOMU6EZsfIt79+a0qKcQJIkjA==
X-Received: by 2002:a17:906:2488:b0:8af:7b80:82c5 with SMTP id e8-20020a170906248800b008af7b8082c5mr7604550ejb.75.1676924078933;
        Mon, 20 Feb 2023 12:14:38 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id g16-20020a170906595000b008dd3956c2e3sm291245ejr.183.2023.02.20.12.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 12:14:38 -0800 (PST)
Date: Mon, 20 Feb 2023 21:14:32 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: [PATCH V2 20/21] MAINTAINERS: Add entry for drivers/acpi/riscv
Message-ID: <20230220201432.5lz7rvwqhfxa4fno@orel>
References: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
 <20230216182043.1946553-21-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230216182043.1946553-21-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_121440_587461_E0C12E18 
X-CRM114-Status: GOOD (  15.88  )
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

On Thu, Feb 16, 2023 at 11:50:42PM +0530, Sunil V L wrote:
> ACPI defines few RISC-V specific tables which need
> parsing code added in drivers/acpi/riscv. Add maintainer
> entries for this newly created folder.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> ---
>  MAINTAINERS | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 39ff1a717625..d47212194457 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -450,6 +450,13 @@ S:	Orphan
>  F:	drivers/platform/x86/wmi.c
>  F:	include/uapi/linux/wmi.h
>  
> +ACPI FOR RISC-V (ACPI/riscv)
> +M:	Sunil V L <sunilvl@ventanamicro.com>
> +L:	linux-acpi@vger.kernel.org
> +L:	linux-riscv@lists.infradead.org
> +S:	Maintained
> +F:	drivers/acpi/riscv

This section should go under the "ACPI FOR ARM64 (ACPI/arm64)"
section to be in alphabetical order and also in a more logical
place. Also, shouldn't this section include
arch/riscv/kernel/acpi.c and potentially other arch/riscv/ files?
I see arm64 doesn't, but maybe it should too.

> +
>  ACRN HYPERVISOR SERVICE MODULE
>  M:	Fei Li <fei1.li@intel.com>
>  L:	acrn-dev@lists.projectacrn.org (subscribers-only)
> -- 
> 2.34.1
>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
