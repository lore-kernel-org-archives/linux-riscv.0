Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BCB8C4167B
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Nov 2023 17:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=/K90yVKuNOGK1zr5UCCiTSQlshYmHT9bbCgZ6NLkln4=; b=LJ7iMQeDFKeuHN4vU+B4xfeH/G
	y2nydAme031I6nVvprdpQ9joVQMzMlIEXwqZnJYzIrvBCO/LXXyo8iWfZVeJKONdAe9WnlqWXB1ER
	WO4BaD00ilRcC21FMqBZH5xfrD7FVvIyF9VJG2zjFQmpywfR26/zsxAUmptYzpzyLhAfQ2KeFp2wA
	vopqg0hvEJb6O+RtDCDE1FMkmTe2c/JXOMxgp5jYe/jgEnEB80ydIo+aadQ+qSfJPpCsigZ4AsqPW
	8iSg2u4zah07hHTLrmbYwmiRdYMVe8Yh4Zj/zKWvqAkrvr55L8HYUWEKh7w6YlITxwWClVCPOvhOY
	1yx3xeSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0QBV-0027Wp-35;
	Tue, 07 Nov 2023 17:48:17 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0QBR-0027Sf-1E
	for linux-riscv@lists.infradead.org;
	Tue, 07 Nov 2023 17:48:14 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1cc9784dbc1so36209955ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 07 Nov 2023 09:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1699379290; x=1699984090; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TY15kIau+eDARAHjRIt1BbGYq8C7hJS6gitrNXYnQoM=;
        b=uRucss35jp7N1vU/LMSxbX5Xcviet0iG/5kZDW1frFuBm52C242Pm8iG/o3Jr0POGo
         v0bik5sfnNxP8EulJ/H/Jo/zD/3Hfsjf2zrOo/ccTH2qmbUWvQphhjvWiQXv9RaCp3tw
         0lBNXnY0O1cB5o03IVyQsfTLuvupeGfOAkRgjzbIVkDn5uDqFw0QUgbP8wh1KLmYWiou
         Fh9Ak4acDfgc9JdVWfa7VWumaZDRqvXfWEQ7m6wrLOmFA2fXjnWXz5LfxjuuoZ4Tc7fU
         OdD6nHZvBym9zbLGBIayF9jfzOKivZSNAEYV+9OXlOQXw1wuhArL1sdLT1rjtBW1jvmk
         1Ugw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699379290; x=1699984090;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TY15kIau+eDARAHjRIt1BbGYq8C7hJS6gitrNXYnQoM=;
        b=cf9PYTLeTRXA5AO7DHvtobBcOazqua1bwrERbBI5/1PmoNTvlkmYhYfOHsf64MwGgX
         goS7rpNT7LZHwWh5cKsd+zJ7iQSRayL3uvSFiq8a5496zFxW7UF5ioYibARxhJvOIncH
         Qkt8ZX/1fyDiOvKc4//81wy0Whk9QETyWTvo7+WKrYPkOcLHHcjucp0tiAnn5y94+Igd
         8s/oz27fZj2tQBM3VxF+KM9yIRS8bIt7ZUm96uVm/ToCi/0hUSHG325nd5FbCFwtj7pn
         qoVJHUKGfsMiF5I4gC+CQQkNxMz8yf003W8ENTByAfLN6B9ikIGI/zfSGritWT1YYZwe
         FhcQ==
X-Gm-Message-State: AOJu0Yxw49IVz3fJfUgiNwEcBWQm1LBYAtEJlypR7FTV1jS7YxLO7lE/
	9MhnO0oYO/F1F+mf3myzVUJrJw==
X-Google-Smtp-Source: AGHT+IE1uUN1bCnM0e+Ov1l1naTtElUtLA3DgMMTfPPCXEEwKaTGd4dv0hVEl36p8Py1780zIW4h7w==
X-Received: by 2002:a17:902:ccca:b0:1bd:c7e2:462 with SMTP id z10-20020a170902ccca00b001bdc7e20462mr31928892ple.11.1699379290316;
        Tue, 07 Nov 2023 09:48:10 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id l12-20020a170903244c00b001b9be3b94d3sm102654pls.140.2023.11.07.09.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 09:48:09 -0800 (PST)
Date: Tue, 07 Nov 2023 09:48:09 -0800 (PST)
X-Google-Original-Date: Tue, 07 Nov 2023 09:48:06 PST (-0800)
Subject: Re: [PATCH RFC 22/22] riscv: convert to use arch_cpu_is_hotpluggable()
In-Reply-To: <E1r0JMV-00CTyh-It@rmk-PC.armlinux.org.uk>
CC: linux-pm@vger.kernel.org, loongarch@lists.linux.dev, linux-acpi@vger.kernel.org,
  linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
  linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev, x86@kernel.org, linux-csky@vger.kernel.org,
  linux-doc@vger.kernel.org, linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
  salil.mehta@huawei.com, jean-philippe@linaro.org, jianyong.wu@arm.com, justin.he@arm.com,
  james.morse@arm.com, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu
From: Palmer Dabbelt <palmer@dabbelt.com>
To: rmk+kernel@armlinux.org.uk
Message-ID: <mhng-b535d186-b241-4fe8-a6b5-b06aff516d1c@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_094813_418874_E1A1F85E 
X-CRM114-Status: GOOD (  16.21  )
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

On Tue, 07 Nov 2023 02:31:11 PST (-0800), rmk+kernel@armlinux.org.uk wrote:
> Convert riscv to use the arch_cpu_is_hotpluggable() helper rather than
> arch_register_cpu().
>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  arch/riscv/kernel/setup.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index f8875ae1b0aa..168f0db63d53 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -294,12 +294,9 @@ void __init setup_arch(char **cmdline_p)
>  	riscv_set_dma_cache_alignment();
>  }
>
> -int arch_register_cpu(int cpu)
> +bool arch_cpu_is_hotpluggable(int cpu)
>  {
> -	struct cpu *c = &per_cpu(cpu_devices, cpu);
> -
> -	c->hotpluggable = cpu_has_hotplug(cpu);
> -	return register_cpu(c, cpu);
> +	return cpu_has_hotplug(cpu);
>  }
>
>  void free_initmem(void)

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
