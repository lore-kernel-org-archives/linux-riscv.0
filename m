Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7868C636CC
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Feb 2023 16:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7JP4TVngw081nJuKoC0ilB72oTYNSphk2pBvwytTjNI=; b=vLD6Vza+tGeyVG
	hLkeh9hO+XTpSUobyZP9m1+GCMagg13IZisse0aRsynvhD9Bc8F1xG1QDsiy2oH0bicqjqHAOBdpl
	bxAUrc0FUwU5Nm+6TbR+sIoCjZiv+DaCignPk4ogMalmWFu2vH0SHF05q8/gBZ8KmKnPmeBhq26nG
	0WsZPKpI+ldyn8fixVyAsQr5wkBw4rvr9IXtM8alR9v/pf05VdWWNQzuK+4sKhQjov9rx3axalBnj
	2a40e+5n2CSNnv38mkyntzaYhD66KhAG5gkvHWsjkUnT8qRSDulioJd5CGmK+tpJlVdlYgWzKX9OJ
	eiou1TX2Mxd/dMhX390Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU9AM-004taG-AF; Mon, 20 Feb 2023 16:37:26 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU9A8-004tY8-QQ
	for linux-riscv@lists.infradead.org; Mon, 20 Feb 2023 16:37:14 +0000
Received: by mail-ed1-x52f.google.com with SMTP id o12so7355601edb.9
        for <linux-riscv@lists.infradead.org>; Mon, 20 Feb 2023 08:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7JAySITZlmEgUkttA/h6vqlRMnlxL91ZjoXWKBJM6nM=;
        b=LKl3QhZg9GAGzzVxe6CvgIpZKXYAQ9dPVtEwmVtX4ukhthYLVCpyyU6DNG1kHTRsPz
         kniAQG8p82fQCtWzCdAUZ+N371kNtEipPHBBE04gt9LQST9I8N9gJ/5q6YrZRcabF8we
         4Dq8Rx+a8ewT75TAMxXzcDZwxFvwn7i3NNfGHVfuahq7DqauUTbw3/vA5TiKOhS6Ibbr
         aiy+jdDk5Jdlv3pNTdBKvjKIK2o5rj5BsTTS1xxwt47GsjVvb8C/Omb/BC6NqiyQWLsd
         LixLGBK2fPBuUkU7kWaFI6ICl0aDykcsrev13d4TWY26Q/ehkn9dZ58RMlww/cnP02dp
         +r1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7JAySITZlmEgUkttA/h6vqlRMnlxL91ZjoXWKBJM6nM=;
        b=2DztIN/IuFbs5wzoGuEPZxWqZyYZ0PWuaggS4UDRpzlUazubk4hlYhQeX8fpUj5iF4
         qlKFrTvsCJs39uQFUHC0vxGaE5OdrTlnv2DBhZ8WoodieXSvkBlE/xbpQO+WdEoPHFGr
         5qaZU1mkne1x1oKuuczQDIpqsZzJJMF3m8bbUoquphR1V029RCYBgqXSCfTDBMSOAw+b
         S3vrdMea0kfBruKwUcoluOyGQtqTasiPePNHbWQUndirHHOgDoFvVWoYnXpyr7iUTA2u
         kn2Or7oi80/XiA5EJtW7aT5r9nwkLmJXv107NGf1/sx/NbN312KAfvzrRN0sKle/X4Cu
         s6Xw==
X-Gm-Message-State: AO0yUKVU+uxbcknyqhsYJUVuD9JpL7WXQvqpp/u3wn2KA46gIKXw42NM
	3WB45j87qfCNOdVkXHU9v3NxdQ==
X-Google-Smtp-Source: AK7set82YiGvX/cWolc8nVufXVUBsto1fiyPC9tIHH8kYkvGmOF/V3SGDTBeP7VxsOXKKXyTQ7gKNA==
X-Received: by 2002:a17:906:308a:b0:8b1:81eb:159e with SMTP id 10-20020a170906308a00b008b181eb159emr11651891ejv.7.1676911027113;
        Mon, 20 Feb 2023 08:37:07 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id kg19-20020a17090776f300b008be0b7242d5sm3450061ejc.90.2023.02.20.08.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 08:37:06 -0800 (PST)
Date: Mon, 20 Feb 2023 17:37:05 +0100
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
Subject: Re: [PATCH V2 09/21] RISC-V: smpboot: Create wrapper smp_setup()
Message-ID: <20230220163705.kodx5r7codd4ri2c@orel>
References: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
 <20230216182043.1946553-10-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230216182043.1946553-10-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_083712_900193_9D9778F2 
X-CRM114-Status: GOOD (  17.78  )
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

On Thu, Feb 16, 2023 at 11:50:31PM +0530, Sunil V L wrote:
> smp_setup() currently assumes DT-based platforms. To enable ACPI,
> first make this a wrapper function and move existing code to
> a separate DT-specific function.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/kernel/smpboot.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
> index 00b53913d4c6..26214ddefaa4 100644
> --- a/arch/riscv/kernel/smpboot.c
> +++ b/arch/riscv/kernel/smpboot.c
> @@ -70,7 +70,7 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
>  	}
>  }
>  
> -void __init setup_smp(void)
> +static void __init of_parse_and_init_cpus(void)
>  {
>  	struct device_node *dn;
>  	unsigned long hart;
> @@ -116,6 +116,11 @@ void __init setup_smp(void)
>  	}
>  }
>  
> +void __init setup_smp(void)
> +{
> +	of_parse_and_init_cpus();
> +}
> +
>  static int start_secondary_cpu(int cpu, struct task_struct *tidle)
>  {
>  	if (cpu_ops[cpu]->cpu_start)
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
