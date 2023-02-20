Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 881ABC6379F
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Feb 2023 20:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V79dAnCQLyK3clnFTdkC020fperYHUxgN/pwRyAarW8=; b=IsPU+dteVyDptz
	9cCtIPUdh7DG330KzGrgzmBmeTCKYe/QGxpCzxw7wjVIeFtzHvubNjjgot+G+idG7qvyoVYhiis3Q
	Klq736H+CEFnVWkb4YpTecvygDCjBpezPsn24Kj2AXUBC4iFDLrtz3sAQdWu77DFsy1Qufs29vr94
	5aMdd57b5eT3Z+5lRntwXoBy0jmnl5x/62YquvnWyJ7Z5/az78pzubYrijXmlvstcdRsenozbsVbB
	l/5lxeAWw1z+m0CZFh0Qp46WMon/xkLCAPajX+pJreut+WHOwqOseF1tuQ3p1YB+oQ9VpFtMZiwew
	hXKeGhO9pa70vEElOrWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUCTK-005TRD-So; Mon, 20 Feb 2023 20:09:14 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUCTI-005TQR-1q
	for linux-riscv@lists.infradead.org; Mon, 20 Feb 2023 20:09:13 +0000
Received: by mail-ed1-x532.google.com with SMTP id h16so9132445edz.10
        for <linux-riscv@lists.infradead.org>; Mon, 20 Feb 2023 12:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/xGe4mebBQ0nWK8rCTkmQKbrlei4F3Kt8g8YlyA/ybk=;
        b=lasXdPytIvbjQiTIEAuPcfQDtdZsoQYBqVi2/m0sliI7QTUmra2OGkLun2CHaGGoDU
         pBoBIMsQGyMaCkx71n5AzQO/9QcNoM7fkL4cjUGD2Z73rSYx4uDSGnz6jgbBvqeX5Ud7
         rHksQlUnUhbK8GxQlIZzdgyuHfj+ZPOSmvzRJBrtrC2ZRqXM5ETKJlOvR1dEvC+g4/3r
         5q8odgj74SNeLlMyYbvPGZ3YythtJH5cGeZTubqJJM3omOCk3ouzyt6GV/kuMpi6Vnu7
         rN0o+R+hFOmYPvX0X4ix2IIyfg3dsALU+0wgN1RcLGFAE4nYAf+0SYVaYpi3Z1rFVYz/
         ZFUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/xGe4mebBQ0nWK8rCTkmQKbrlei4F3Kt8g8YlyA/ybk=;
        b=hmfUrEyfu2/JS/yMSqYR5LiJFUKrMQnFi5m6CjRswA7FRdfn9f2mesBnwpHiaFqjJx
         CmPOhsERZjAfzXJPalVVQP8yRc5XGj8hcfhaEASF4hChIj3YJ7kpKTeQnXXtyldijPkG
         qx7BAKA8pU7t7Yt6/+cN2kM5oOJbAS8VBcc6eCHnLc/EHnlpeGkcWSdP7Np6GnZI9YEC
         anZNP2Y7DsiMPuknDhN7MWPoC1fL9zekaVqeqcMHQ7xfQvXLmRNB6Axw1xNp9IxvhOEz
         zSGyTLoKCyvx7HgYxhbFP4K4KkEp+aBsOIll3DoO9kTLiJq8YWpT/cr+/4v8MoYbYINU
         jzwQ==
X-Gm-Message-State: AO0yUKWP5KJ7jURevMvKAFK6Vcd9YOAfGV4YbkGUyWfstn4tWj8uD2Hg
	oo1fJhkdjeoXbqsU+PfVVWYgaQ==
X-Google-Smtp-Source: AK7set+r29107e+CGfLvIFcDLBZy4icJyDxUSNp6aM2m9tGe84VSuCgyhF9xEnrpWfVclnnxniyPBg==
X-Received: by 2002:a17:907:8a02:b0:8b3:1e35:8f1c with SMTP id sc2-20020a1709078a0200b008b31e358f1cmr16184714ejc.39.1676923750575;
        Mon, 20 Feb 2023 12:09:10 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id gf4-20020a170906e20400b008b14060f58asm6224415ejb.50.2023.02.20.12.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 12:09:10 -0800 (PST)
Date: Mon, 20 Feb 2023 21:09:09 +0100
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
Subject: Re: [PATCH V2 19/21] RISC-V: Enable ACPI in defconfig
Message-ID: <20230220200909.gkwmpklocw36632w@orel>
References: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
 <20230216182043.1946553-20-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230216182043.1946553-20-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_120912_115997_AFAB3884 
X-CRM114-Status: GOOD (  14.44  )
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

On Thu, Feb 16, 2023 at 11:50:41PM +0530, Sunil V L wrote:
> Add support to build ACPI subsystem in defconfig.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> ---
>  arch/riscv/configs/defconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index 128dcf4c0814..f89f79294b34 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -218,3 +218,5 @@ CONFIG_RCU_EQS_DEBUG=y
>  # CONFIG_FTRACE is not set
>  # CONFIG_RUNTIME_TESTING_MENU is not set
>  CONFIG_MEMTEST=y
> +CONFIG_ACPI=y
> +# CONFIG_PCI_QUIRKS is not set

I'm guessing the addition of the CONFIG_PCI_QUIRKS line wasn't
intentional?

> -- 
> 2.34.1
>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
