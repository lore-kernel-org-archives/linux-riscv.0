Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 721D2C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Oct 2022 13:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fv86akOgTNSwzwCA/vCpf14nHEKNf7/q2fASLi9xNbo=; b=Q2bd87i9baUtxf
	VX4ft1BjXfNkdrqdI1413iexcHxfW/1/pSy6D4fTOwPG5HAQt89yVC+BB8XIojLP0qMVZtBp40HQ1
	fDDrk6w1xT4ePkI+7Px2Ye4N65mTbPJIBvTdPy9KX7tg/O9LCiYhKMSi2NkpXlVLMLGVBlSZc2dRa
	HZ/eiy8NgRLTU/oB9/jCH/u5RhFOV3KMxjFf3RBaoFgOusOqqu+mzaqP41xoouRUw25COWNz9+iYy
	uUV6vHdyLjzYmwg+4QRWmexHC5rgy98q608jZBdzWoHGYXKlT/o9F4KAn1yb4p/39Tdj8gySz6pQz
	xWmTXR7+Qvg2ze/AhflQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og4Sw-00ED7W-8H; Wed, 05 Oct 2022 13:29:38 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og4St-00ED6t-Gp
	for linux-riscv@lists.infradead.org; Wed, 05 Oct 2022 13:29:36 +0000
Received: by mail-ej1-x634.google.com with SMTP id z23so18714018ejw.12
        for <linux-riscv@lists.infradead.org>; Wed, 05 Oct 2022 06:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=Vkqd9Ksr4OqUeBX8jNV28kQKS8jvBE0ekzw5ZlkzR68=;
        b=DQo4k3uprutYfjO6SCfNQUlNnvBvpP4HzuvEvfqcssY5BpemWEAKwXnueRxnTvaQ9+
         g0AlZ/O6lk7LAol0QPqPZCjT6rWm07vjRP5xthbN+VA8o3RC1k5M8QXL3lTegsSjA0un
         OVDwqybHODKM5lmLOsqXQ7H/k8fNutxMXlArKn1SI1yXfsdEVRvThNahPh6dZVxXxl5t
         FnuzfXkUKYlKaDLRYKsAYyFkgtC19Xa5P/Cp4epcvjAGZ9sugbWRm1RM9O+PRTWZZTc4
         JAM3CqtYYMSe6tpvfnHvGdN+BWla6cP1dvrLNAL2A49l7qNPZSCN7o1+PHXCPEz1cYL6
         KaHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=Vkqd9Ksr4OqUeBX8jNV28kQKS8jvBE0ekzw5ZlkzR68=;
        b=QvbhagEeYqWOMNaz5m7nhBJ/IgKFppRY/xFWIKzLzjtfMFPbtCo8V8mOOPIENlCtmD
         yUV9SN08Y554Xb2o6Uh8y8he6HOhd/TT4+eYGZTDlM4lw829DZMW1A07fTaT3T6/Bzs1
         f978i9I5Jqq8dT1m7HhPtzb7PuMbmagrUXxI/nC5pcrV4H+o5dUGY3ztSEWH/TGchTOz
         bt7h/mDHab+bqdPoxO8OeSgJRek0SAi4vzUa5CucuZDzIirZl4e618ZqcxUf8DCg1nbt
         CtcIt0m4Lb4K4KKbl/ymIlzP/Wv95mNKoODGYrAdJsgoMGgdXH2qcc93ZBD7g0yy7xJc
         Cc+A==
X-Gm-Message-State: ACrzQf1KoVZP/JG4qFe/8OmuAraYfIx8BR4g824CD15+f7yFlUdFQ6aQ
	eR3KwfPqW5iBLnYP7HV4wVx0Rw==
X-Google-Smtp-Source: AMsMyM4KtNPLOIRHw/B3ULbvqf6iHwPIAy2cPbhHBvVhT4lyFTcijU01FBPcCPdgw3iqSAAH8kk9Dw==
X-Received: by 2002:a17:907:2c78:b0:78c:f533:41c8 with SMTP id ib24-20020a1709072c7800b0078cf53341c8mr9327563ejc.69.1664976572833;
        Wed, 05 Oct 2022 06:29:32 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id 24-20020a170906311800b00783c545544fsm6612459ejx.215.2022.10.05.06.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 06:29:32 -0700 (PDT)
Date: Wed, 5 Oct 2022 15:29:30 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: panqinglin2020@iscas.ac.cn
Cc: palmer@dabbelt.com, linux-riscv@lists.infradead.org, jeff@riscv.org,
	xuyinan@ict.ac.cn, conor@kernel.org
Subject: Re: [PATCH v6 0/4] riscv, mm: detect svnapot cpu support at runtime
Message-ID: <20221005132930.cxvkwoazmztknz3z@kamzik>
References: <20221005112926.3043280-1-panqinglin2020@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221005112926.3043280-1-panqinglin2020@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_062935_578285_38B29885 
X-CRM114-Status: GOOD (  18.74  )
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

Hi Qinglin,

Please give more time between postings. v5 is barely 48 hours old and I
haven't even looked at half its patches yet.

Thanks,
drew


On Wed, Oct 05, 2022 at 07:29:22PM +0800, panqinglin2020@iscas.ac.cn wrote:
> From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
> 
> Svnapot is a RISC-V extension for marking contiguous 4K pages as a non-4K
> page. This patch set is for using Svnapot in Linux Kernel's boot process
> and hugetlb fs.
> 
> This patchset adds a Kconfig item for using Svnapot in
> "Platform type"->"SVNAPOT extension support". Its default value is off,
> and people can set it on if they allow kernel to detect Svnapot hardware
> support and leverage it.
> 
> Tested on:
>   - qemu rv64 with "Svnapot support" off and svnapot=true.
>   - qemu rv64 with "Svnapot support" on and svnapot=true.
>   - qemu rv64 with "Svnapot support" off and svnapot=false.
>   - qemu rv64 with "Svnapot support" on and svnapot=false.
> 
> 
> Changes in v2:
>   - detect Svnapot hardware support at boot time.
> Changes in v3:
>   - do linear mapping again if has_svnapot
> Changes in v4:
>   - fix some errors/warns reported by checkpatch.pl, thanks @Conor
> Changes in v5:
>   - modify code according to @Conor and @Heiko
> Changes in v6:
>   - use static key insead of alternative errata
> 
> 
> Qinglin Pan (4):
>   riscv: mm: modify pte format for Svnapot
>   riscv: mm: support Svnapot in physical page linear-mapping
>   riscv: mm: support Svnapot in hugetlb page
>   riscv: mm: support Svnapot in huge vmap
> 
>  arch/riscv/Kconfig                  |  17 +-
>  arch/riscv/include/asm/hugetlb.h    |  37 +++-
>  arch/riscv/include/asm/hwcap.h      |   4 +
>  arch/riscv/include/asm/page.h       |   2 +-
>  arch/riscv/include/asm/pgtable-64.h |  13 ++
>  arch/riscv/include/asm/pgtable.h    |  69 +++++++-
>  arch/riscv/include/asm/vmalloc.h    |  28 ++++
>  arch/riscv/kernel/cpu.c             |   1 +
>  arch/riscv/kernel/cpufeature.c      |   1 +
>  arch/riscv/mm/hugetlbpage.c         | 250 +++++++++++++++++++++++++++-
>  arch/riscv/mm/init.c                |  30 +++-
>  11 files changed, 440 insertions(+), 12 deletions(-)
> 
> -- 
> 2.35.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
