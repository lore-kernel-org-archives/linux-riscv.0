Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C852C4167B
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Dec 2023 12:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8zMVl2aGTarcWYUEs6twMfZjHQFD7gOJf6fhy9rj8Nc=; b=wHz2eidJnDrpH8
	D4qP0mYZ7yIEFzgQ2zXHzuEG8HzLODTaodcGBF4YG95D0r89869dN1gWC74QXM2OdyUmk2CFCGfVb
	UQ7+Bf7Y5fXoxTu2wM6KSRlJMYowlGcI5T05C269A6a/lxLkccps2cSkbE1yIM3B/+bXkTYzFCNbg
	07hKpOv1+mBrCofk+rU/DjBtZIltrWDVqdMN5YAbBLZl4pTyNGmKgwfD0m9mJDE0+aOeHo7lQaIbO
	wsrdAPqFxxMyjffnDFTrnTlA5HeDD3KHAkqpFZD9ccOUFqMQVztsjHb30/YLKExQOnkAoD1/puPf4
	05iCPnUqECrdK8Vn22Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rArCq-00AIBe-2X;
	Wed, 06 Dec 2023 12:40:48 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rArCn-00AIAJ-25
	for linux-riscv@lists.infradead.org;
	Wed, 06 Dec 2023 12:40:47 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-50c0f6b1015so1532264e87.3
        for <linux-riscv@lists.infradead.org>; Wed, 06 Dec 2023 04:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1701866442; x=1702471242; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/StKJa7BNnsQaiPoV6+5GiP/mT7fmh3GSrlkmoUWGY0=;
        b=H4YHpasIvj1FfVJuQ0x0WyBFrGRxHEcxPyMQcUbTnXmWlDZe+FmC74Q4eTe81O9kaq
         FLZtvL6IHwnotjUJp3AG7ij8HDKOshC3V+jOFnEuvH6aNA8j9u78xEiTpqCjZLTtLsIH
         9tJDFkCDnfZXyiiqQOBKMmL4k1+QnFRck7o25FYPhPkGXhxZmYlBDU6Z3o/5r69C4nrR
         exFNskdEA2OeQ783rTIxYFEvYD5jW1MuE35V107fp3cj7DtXyIlduzOQCjC39+HiQdON
         YSC4cEm0paLT+SihPl29e3hICML6XhF4/hmPqh8DpMnVq/WqBMl6lSL/EQQ7FizujmjF
         sEXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701866442; x=1702471242;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/StKJa7BNnsQaiPoV6+5GiP/mT7fmh3GSrlkmoUWGY0=;
        b=m6iYwudYKAehNGpF1M8sxAPNtnCPrVOOPDjorid37+UmsXj3wpkAhXir1fCLSgYaak
         PSUDcg4dc/m3n4cPz0JPhJrLrB9ljWHMkPLTORMRN5V3wh7FshrgJSA66/F0RB0p2NPw
         OYcPcD8EkAZ9KpWNvWuOuLNLC/FSnJ1xqa3MfSNO8Jzk2UuVTibDPSY0oblmH/W0vSGP
         fcC+ZqP6d4Jr/5khX81INj2sio+0tXKqlRuK3iNVDjgcDl2iKdA45Jgl7kWm2lVEkS7D
         7ZmPgLq7bmAJaGqbENRF3Sc+8BKzaWRmZVpuB1EbbXHuG2sfOcDRUeD1ojKDCKEjbaFl
         AOsg==
X-Gm-Message-State: AOJu0YxNNARJzlBzG287RKT905QE2V6WiG1GJeI9LhvrijNBGZ01J4lv
	3jfESNy0DPqO7oM7c7fRBgcrkAfWsmDHI895TUs=
X-Google-Smtp-Source: AGHT+IEmKgTMHnOronw9egocQ4qWc3i5Sy3MnH0E0aywt3KsFvLafy6f7SMYJCZ4W2uDTMHuoTCWiw==
X-Received: by 2002:a05:6512:3241:b0:50b:f113:2cf8 with SMTP id c1-20020a056512324100b0050bf1132cf8mr533517lfr.118.1701866441653;
        Wed, 06 Dec 2023 04:40:41 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id f15-20020a1709062c4f00b00a1cc1be1146sm2107518ejh.217.2023.12.06.04.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 04:40:41 -0800 (PST)
Date: Wed, 6 Dec 2023 13:40:40 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, leyfoon.tan@starfivetech.com, 
	jeeheng.sia@starfivetech.com, conor.dooley@microchip.com, apatel@ventanamicro.com, 
	samuel.holland@sifive.com, songshuaishuai@tinylab.org
Subject: Re: [PATCH v3 1/1] riscv: sbi: Introduce system suspend support
Message-ID: <20231206-8496ba5da6be560acdf19c11@orel>
References: <20231206110807.35882-3-ajones@ventanamicro.com>
 <20231206110807.35882-4-ajones@ventanamicro.com>
 <20231206-prone-detention-8d06fe96f34c@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231206-prone-detention-8d06fe96f34c@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_044045_692088_4F8BC0A4 
X-CRM114-Status: GOOD (  22.25  )
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

On Wed, Dec 06, 2023 at 12:23:16PM +0000, Conor Dooley wrote:
> On Wed, Dec 06, 2023 at 12:08:09PM +0100, Andrew Jones wrote:
> > When the SUSP SBI extension is present it implies that the standard
> > "suspend to RAM" type is available. Wire it up to the generic
> > platform suspend support, also applying the already present support
> > for non-retentive CPU suspend. When the kernel is built with
> > CONFIG_SUSPEND, one can do 'echo mem > /sys/power/state' to suspend.
> > Resumption will occur when a platform-specific wake-up event arrives.
> > 
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > Tested-by: Samuel Holland <samuel.holland@sifive.com>
> 
> > +#ifdef CONFIG_RISCV_SBI
> > +static int sbi_system_suspend(unsigned long sleep_type,
> > +			      unsigned long resume_addr,
> > +			      unsigned long opaque)
> > +{
> > +	struct sbiret ret;
> > +
> > +	ret = sbi_ecall(SBI_EXT_SUSP, SBI_EXT_SUSP_SYSTEM_SUSPEND,
> > +			sleep_type, resume_addr, opaque, 0, 0, 0);
> > +	if (ret.error)
> > +		return sbi_err_map_linux_errno(ret.error);
> > +
> > +	return ret.value;
> > +}
> > +
> > +static int sbi_system_suspend_enter(suspend_state_t state)
> > +{
> > +	return cpu_suspend(SBI_SUSP_SLEEP_TYPE_SUSPEND_TO_RAM, sbi_system_suspend);
> > +}
> > +
> > +static const struct platform_suspend_ops sbi_system_suspend_ops = {
> > +	.valid = suspend_valid_only_mem,
> > +	.enter = sbi_system_suspend_enter,
> > +};
> > +
> > +static int __init sbi_system_suspend_init(void)
> > +{
> > +	if (sbi_spec_version >= sbi_mk_version(2, 0) &&
> > +	    sbi_probe_extension(SBI_EXT_SUSP) > 0) {
> > +		pr_info("SBI SUSP extension detected\n");
> 
> Is there any value in probing and printing this stuff out if
> the kernel is not actually built with support for suspend?

My thinking is that the info message is like those in sbi_init(), which
just state what it sees, whether the kernel wants to use it or not (and
maybe somebody will read the message and choose to recompile with SUSPEND
to enable it...)

> I can see either that or moving the IS_ENABLED() check so that
> it controls whether we even probe for SUSP being valid so
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
