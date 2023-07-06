Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A3F9EB64DC
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jul 2023 17:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=uQqkAiCB6YFRJYjtTf9kqSuzRfvOtQEgaQuSHeGp84g=; b=np8d4Go++HqIOSCZiw/bNN41aG
	vrbwF8SkXOeGphGkgHWgvJQILmeRXlLcSQMNy/Run6bLOJmyubNWtlXmAJFXepKDYhiei0L7o33xW
	MAu7p5W8wKFSrr9EvTfZ/cP4dz7jrCj5TrsM4jTxLoK6G9jpue4RdhfTKkUABm+vHuyRNqhuJ/XLK
	WnV8vxNXKVlX1u6OLRzpJHF5kIMczBo8BlOa4gNIwZhFD0K/BSoUHWMF40wYSrdXhFTf+10ssWU+o
	bgXqXwvbbaGJk7PvmjiSrdKTP3pEGb+pV7DbGsf8KQBz+gBKSIn8TmsIzzhO27RMG8DM75j1rYlxV
	tH2hd/tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHSQZ-002FAB-2d;
	Thu, 06 Jul 2023 17:05:59 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHSQX-002F9e-00
	for linux-riscv@lists.infradead.org;
	Thu, 06 Jul 2023 17:05:58 +0000
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-3a04cb10465so833958b6e.3
        for <linux-riscv@lists.infradead.org>; Thu, 06 Jul 2023 10:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1688663155; x=1691255155;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DbYorBSGNgBnNiqoshTpZfEFQccGjhuwwnRL/44SoP0=;
        b=i4T0nNOBYy25Tum7t/4GwKsh3/lK7Uikcmkb4kOyw4gG9SEUDys1g5J3pJUji2g/jJ
         LPaszbqCG0hhdxw9/hcWYxo+RYH1ml6lnNIyZhbERDGwRvHc2ctOj7XJ44sxi7yENjUw
         ISHeOYxF9bfqqQgSJQFLfwKIWcXdzga6nV9hUibEpf/kvOAbkrIbqaSJYSVMFCC5fXPg
         NqTooUkkAax89B8soY2d4ySMk4P3KloKJZNOjV7UtnbJUPzBK/u/RQMv8olff4elOxxD
         8bPApwuR0J8ZY0C0moK+z9bNXqPu0MEPf38pn/4p0aoolZvo2R1Y15goKKKXtRMx59w7
         uAOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688663155; x=1691255155;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DbYorBSGNgBnNiqoshTpZfEFQccGjhuwwnRL/44SoP0=;
        b=DXhhc1BaU5IfYa2Xa05vMPNpiNrZpvkY/5qXQ/ZvOWnpiXt7xP8816E4H0IAEbIcAx
         fDVg76ucfd7cPLsxP1U6w2/GDfnZKdac6QP0akLgea9I6OwUJhdIBN70Nx20UXnyIcd0
         ECRUclOK9qS4+pqyrtKy3BFICR8O2UnYgODr3I0sHTjfQwJs3/ipbSKbA8clmC5Pzngi
         5BPR18oti44Uhl8t//Q4uiPPXSipV7RTM9RYKb814LlvhZykLXTzySkeWxpX1eNo9Exs
         OEwmFbubGnUGCLg1DSAekM5Xk3QXGQ8HxjcgT/5ST434YgknFbt//sIlgEltFfTv9dfG
         lSyg==
X-Gm-Message-State: ABy/qLaKaDIzjm5CEot0jNfxaLvNNUMbwJ0zSkKA3UZ/wOKbBs30g+vq
	REhl9QpTxoimmiSWgZ6j43M5CA==
X-Google-Smtp-Source: APBJJlHVjAgGUeOK5ZObTBmnmtOv0vpCjPIptZy244A4rKJYcvX5zFmOq+/846tjHtfgDBgeTsJodw==
X-Received: by 2002:a05:6808:2784:b0:3a2:1b3b:494b with SMTP id es4-20020a056808278400b003a21b3b494bmr2067218oib.45.1688663154961;
        Thu, 06 Jul 2023 10:05:54 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id 3-20020a17090a030300b0026390b2d136sm46808pje.18.2023.07.06.10.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 10:05:54 -0700 (PDT)
Date: Thu, 06 Jul 2023 10:05:54 -0700 (PDT)
X-Google-Original-Date: Thu, 06 Jul 2023 10:05:06 PDT (-0700)
Subject: Re: [PATCH] riscv: Start of DRAM should at least be aligned on PMD size for the direct mapping
In-Reply-To: <20230704121837.248976-1-alexghiti@rivosinc.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  suagrfillet@gmail.com, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  alexghiti@rivosinc.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alexghiti@rivosinc.com
Message-ID: <mhng-c5a71036-061e-4704-bcdf-2b23cab36908@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_100557_254288_DA4E698A 
X-CRM114-Status: GOOD (  21.91  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 04 Jul 2023 05:18:37 PDT (-0700), alexghiti@rivosinc.com wrote:
> So that we do not end up mapping the whole linear mapping using 4K
> pages, which is slow at boot time, and also very likely at runtime.
>
> So make sure we align the start of DRAM on a PMD boundary.
>
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/mm/init.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 4fa420faa780..4a43ec275c6d 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -214,8 +214,13 @@ static void __init setup_bootmem(void)
>  	memblock_reserve(vmlinux_start, vmlinux_end - vmlinux_start);
>
>  	phys_ram_end = memblock_end_of_DRAM();
> +
> +	/*
> +	 * Make sure we align the start of the memory on a PMD boundary so that
> +	 * at worst, we map the linear mapping with PMD mappings.
> +	 */
>  	if (!IS_ENABLED(CONFIG_XIP_KERNEL))
> -		phys_ram_base = memblock_start_of_DRAM();
> +		phys_ram_base = memblock_start_of_DRAM() & PMD_MASK;

This rounds down, which IIUC will result in mappings outside what 
memblock detected as the start af DRAM.  I'd expect that to cause bad 
behavior somewhere.

Shouldn't we be rounding up?

>
>  	/*
>  	 * In 64-bit, any use of __va/__pa before this point is wrong as we

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
