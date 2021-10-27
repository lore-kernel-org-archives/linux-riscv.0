Return-Path: <SRS0=RxHG=PP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11D10C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 23:09:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9C5E60FC0
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 23:09:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A9C5E60FC0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=9fciACQngYubbkPC5BQyPwOCWDM05EZTCJmz606ATRs=; b=fKpTj7uB55AOMa5JhtE7E82w9c
	DID8ksLTyb8a0V+G2iSq/DpT7RV2igLgKY5ZRJC/5a5RwKMhnTPb1O5yWL1Z4Su05lEKDsv39LiYI
	GgYK/DKAi/ziqbZEhIIIwpcnnRpRTe6D0M7cOXkD7Pw40S8pudnsipQmyDar3YlNSV9eBbhlV06/F
	YxETSPUT3Yea4mPFzhpe6d2bK5ttbSIPxfAcNfVNIBmITEj/2QIs+u8kNo52M/yEeXL6VAAUew+ll
	sMlBkRXh33x9Nr2aXqoB1BP0kKx4hXi5usype6HchoymFm4MiZA1mOpZtm1sCV/E04ftJOlDdoryR
	kbsOGaEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfs2j-006TAF-Ow; Wed, 27 Oct 2021 23:09:13 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfs2f-006T8W-7p
 for linux-riscv@lists.infradead.org; Wed, 27 Oct 2021 23:09:10 +0000
Received: by mail-pl1-x632.google.com with SMTP id z11so3078215plg.8
 for <linux-riscv@lists.infradead.org>; Wed, 27 Oct 2021 16:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=XJfFTW9EjYJeHoclf1SeEwj25PLenE7ts5EFTr8vzec=;
 b=vYjyS+8EH3CfIBezSrdmSEFFSJc1bpK8IsDLNwp4SIdgzIr0qhB73jSdQ+tZtt+gKe
 gLRCAnofL8DMkcE7vLBKcZfntvEYsCybXJMFIekVgyaoqoB4d2yoy2/fxl6NKOgXIYmd
 GMEiLNFKg0iVmrnBvlpV4pv/PV+nqVeQwlB1PLBrwM8b8vjtjZjGvc3MJRrAfuUoDBNo
 ViaF9lo0gQuECLSnf0dUVzQmZPRvjI+cvfCWgH2cYeMbb2VhrXJlj9sEs5Y4vYC263de
 h2wbGwEHNdbZkGS/4AP/MxQ7HKYBbqiVTjD7lo6//33sqHBHnP35ISg1TmvMKaMznq9A
 cKAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=XJfFTW9EjYJeHoclf1SeEwj25PLenE7ts5EFTr8vzec=;
 b=K3q7IU2VFW7f98ZDUe6A/XvTTtNsrgChe/xkERaXMavZfMTK5boCwB/NbYJaqZ8Pni
 KFn7uCfs3nmKy823BvQ/KGER0oPT+6IwHPk++g/gCaFJJuy3hOBNyl25Zpcmr9POquDJ
 71WKNxQ2ekY5KuDNF8/1LIYIfcfZOYTKhptgz4D/OlK66qHFqYTfcOH6sW2SVSORRL+d
 /WNLOE5ccHQZorjNIjtimR/eMHeFDtN1iRuLwEGZ48+HZfdxj7Mrhi8QoWSLOhxNJpAw
 6fUtlAilvhKPnLIxoytgyAVBmLkQC7bysvg2bX6nG5p+gKojm9YQaXLSPzaPtHfo1Lsi
 bv8Q==
X-Gm-Message-State: AOAM533kG84Hp57f6uB7mUuGm8duA34FGrJixXFBbPmG8rQJEyBbwyf7
 OdFTh9i1CtPyF72CVAv4SMy/yQ==
X-Google-Smtp-Source: ABdhPJxUJYglQ4uyqyrvUHQJ2HBzLbAnkI4OfP0sJtC8YPLND6BbQ0gKrpcxmED13rpzsyQoceaG3g==
X-Received: by 2002:a17:903:246:b0:13f:2ff9:8b93 with SMTP id
 j6-20020a170903024600b0013f2ff98b93mr652035plh.54.1635376148047; 
 Wed, 27 Oct 2021 16:09:08 -0700 (PDT)
Received: from localhost ([2620:0:1000:5e10:60fc:a50:6d27:9fd3])
 by smtp.gmail.com with ESMTPSA id bg15sm739067pjb.15.2021.10.27.16.09.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 16:09:07 -0700 (PDT)
Date: Wed, 27 Oct 2021 16:09:07 -0700 (PDT)
X-Google-Original-Date: Wed, 27 Oct 2021 16:09:01 PDT (-0700)
Subject: Re: [PATCH v2 18/45] riscv: Use do_kernel_power_off()
In-Reply-To: <20211027211715.12671-19-digetx@gmail.com>
CC: thierry.reding@gmail.com, jonathanh@nvidia.com, lee.jones@linaro.org,
 rafael@kernel.org, broonie@kernel.org, akpm@linux-foundation.org,
 linux@roeck-us.net, linux@armlinux.org.uk, daniel.lezcano@linaro.org,
 andriy.shevchenko@linux.intel.com, 
 ulf.hansson@linaro.org, catalin.marinas@arm.com, will@kernel.org,
 guoren@kernel.org, 
 geert@linux-m68k.org, gerg@linux-m68k.org, funaho@jurai.org,
 tsbogend@alpha.franken.de, 
 nickhu@andestech.com, green.hu@gmail.com, deanbo422@gmail.com,
 James.Bottomley@HansenPartnership.com, 
 deller@gmx.de, mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 ysato@users.sourceforge.jp, dalias@libc.org, 
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 x86@kernel.org, 
 hpa@zytor.com, boris.ostrovsky@oracle.com, jgross@suse.com,
 sstabellini@kernel.org, 
 lenb@kernel.org, ssantosh@kernel.org, krzysztof.kozlowski@canonical.com,
 linus.walleij@linaro.org, wens@csie.org, j.neuschaefer@gmx.net,
 tony@atomide.com, lgirdwood@gmail.com, 
 p.zabel@pengutronix.de, vz@mleia.com, avifishman70@gmail.com,
 tmaimon77@gmail.com, 
 tali.perry1@gmail.com, venture@google.com, yuenn@google.com,
 benjaminfair@google.com, pavel@ucw.cz, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, 
 linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, 
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, 
 linux-sh@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-acpi@vger.kernel.org, 
 linux-omap@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: digetx@gmail.com
Message-ID: <mhng-fd8f451c-4860-4b0c-a155-6f65891cd276@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_160909_328567_2DA8E43F 
X-CRM114-Status: GOOD (  16.81  )
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

On Wed, 27 Oct 2021 14:16:48 PDT (-0700), digetx@gmail.com wrote:
> Kernel now supports chained power-off handlers. Use do_kernel_power_off()
> that invokes chained power-off handlers. It also invokes legacy
> pm_power_off() for now, which will be removed once all drivers will
> be converted to the new power-off API.
>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  arch/riscv/kernel/reset.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/arch/riscv/kernel/reset.c b/arch/riscv/kernel/reset.c
> index 9c842c41684a..912288572226 100644
> --- a/arch/riscv/kernel/reset.c
> +++ b/arch/riscv/kernel/reset.c
> @@ -23,16 +23,12 @@ void machine_restart(char *cmd)
>
>  void machine_halt(void)
>  {
> -	if (pm_power_off != NULL)
> -		pm_power_off();
> -	else
> -		default_power_off();
> +	do_kernel_power_off();
> +	default_power_off();
>  }
>
>  void machine_power_off(void)
>  {
> -	if (pm_power_off != NULL)
> -		pm_power_off();
> -	else
> -		default_power_off();
> +	do_kernel_power_off();
> +	default_power_off();
>  }

Acked-by: Palmer Dabbelt <palmer@dabbelt.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
