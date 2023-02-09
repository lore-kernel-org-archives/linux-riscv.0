Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2386C636D4
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Feb 2023 08:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yBf2Jjn9R5l7si/oVm7Z4/dWD3MX1Gy4NDNjjhmDP3E=; b=s1HvTjdZqaVMNv
	76AYZbQcf4IbH0fwpWxSgF1QzcD2iYuXjhv6HI6Cv9yv0OFwsjTsnAoKOd8Xmd42Vb9xYvmlxPiqj
	3+ilP96fdqJlh/2Jc5Vr3sz2t/Vc/kcfYxn2/PY4g5Vl5Lhv4uq351IA6CKS1CrLzvkaAirx21uV7
	i3Qpo82H4nal/yY2KHq8nIo50IYoBqYSTUPMmdYRbu+U6ofwRT5+MOeIyEy/kjPU5NBQ03BMHAvnm
	4yx8Wcbud69OzC5YM5zBWr1dXMeCXHAAlNJ6qdgI+0MjlG+k7lEtVcNaf09uQQzE+XfzR6gDce458
	btya/Du+sgJCD+jT7iWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ2D8-000XiX-Mt; Thu, 09 Feb 2023 08:23:18 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ2D6-000Xhb-Mw
	for linux-riscv@lists.infradead.org; Thu, 09 Feb 2023 08:23:17 +0000
Received: by mail-ed1-x52f.google.com with SMTP id d40so201754eda.8
        for <linux-riscv@lists.infradead.org>; Thu, 09 Feb 2023 00:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DERA6rZJqjWeH7DEhVRmhhsPITPHyc6ZUiK7R87w4Ak=;
        b=bkeUeyi9xhUKUg70LQRIUCRAa1C0nf3xTOOpkxOAF8kea2cBXsC80xYMPQcar5o3m3
         VcO2hSCWdniCKDwuP7vIVF0tYFDz5h829LcB0rU3OyPayiVGqUvQbEf/f2u6nkyc7mUc
         q5DohMh9xaCiNRSE9MSkUPyAuwVgTuml0ywWQAMKwA8OgpCqiOxUVuIrrdvR2HRNnlgx
         LCvYF4qZbDDPH2JreZLMaVuLvqGKp1wtNGxmIfLLPcE+792Ht764ihnU39UM8Ag4+Tf/
         DyLhOxouk5+P5F2gNhAsH+8ntf5UzGlC8Igd0zTYyTaguI9K7Pm7nfJPgWBcQ1WEmoMe
         KH0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DERA6rZJqjWeH7DEhVRmhhsPITPHyc6ZUiK7R87w4Ak=;
        b=19ONl+7m0l4Uy7BHSPNAttZu0kkf/J3LkE8eHN5qNt3PpNd31ImWWpZWHpwF3jo7DW
         bdAJnEkopVIZ5BKTTTKs9HrQ8M9gREL+4rCJAML2oNZnE2V5Uvd7qbhR4PeRTFlA0UT3
         x2/1hDuOwV7V8/KpV2Kio+z6J154RsEC1u43lDEk+rvdLwEdzGYukHz8e7fg7Rz9oYJO
         CLMEzRk2pOajSB3rBuOqBhJIYol49HLNmNXKFt1PnMuDMKoao4zEdklt1DKNYZF3aaDA
         +egeLtyqWOeApyshUyL0+upnc5kq4fdc2OCzPQ9N/uu7x4JphRIyggIWbeVjQoM/YGVx
         wdjg==
X-Gm-Message-State: AO0yUKUxhYmDW/e5fQ45B01DmIac8/HiJCMMguO4yL+JCwM500eI8XAt
	YTIkjXjt8b8AlEcmqRBWWBSHJ6D0QE+LtpCU
X-Google-Smtp-Source: AK7set8jXgg1VDK2HzYMhcGyAX1CdYIy1E+euV0DjBqRFwDwWuFHD9A6MrwVc/mf/TDmCy8k5Z88Ng==
X-Received: by 2002:a50:8d5b:0:b0:46b:19ab:68d8 with SMTP id t27-20020a508d5b000000b0046b19ab68d8mr10810492edt.40.1675930992606;
        Thu, 09 Feb 2023 00:23:12 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id l6-20020a50d6c6000000b004ab0e9e396bsm407314edj.87.2023.02.09.00.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 00:23:11 -0800 (PST)
Date: Thu, 9 Feb 2023 09:23:10 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: palmer@rivosinc.com, conor@kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, christoph.muellner@vrull.eu,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH 1/2] RISC-V: fix ordering of Zbb extension
Message-ID: <20230209082310.q7lkpnic5t5arq5a@orel>
References: <20230208225328.1636017-1-heiko@sntech.de>
 <20230208225328.1636017-2-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230208225328.1636017-2-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_002316_773093_E54229D3 
X-CRM114-Status: GOOD (  16.56  )
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

On Wed, Feb 08, 2023 at 11:53:27PM +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> 
> As Andrew reported,
>     Zb* comes after Zi* according 27.11 "Subset Naming Convention"
> so fix the ordering accordingly.
> 
> Reported-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> ---
>  arch/riscv/kernel/cpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index 420228e219f7..8400f0cc9704 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -185,9 +185,9 @@ arch_initcall(riscv_cpuinfo_init);
>   * New entries to this struct should follow the ordering rules described above.
>   */
>  static struct riscv_isa_ext_data isa_ext_arr[] = {
> -	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
>  	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
>  	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
> +	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
>  	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
>  	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
>  	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
> -- 
> 2.39.0
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
