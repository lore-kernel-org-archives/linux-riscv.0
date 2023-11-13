Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 641E1C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Nov 2023 04:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k3C8VM+yC0CB1XSY/yzYhFSA0iPO2i/K6Sp0VqttpAo=; b=3ZwOkiWBNB0M8f
	hjCRUMo0Ga4d/StGUHb/F29tydo1Qpv93MnGDsLav7qAK6bLpRTmkNjMWGtV0/iLzhJSYtw/r1HdZ
	C004GoFuWQ3cGQekD+6UFUDnIimYFHYJHgORCpnoICZwjcMxXCSsUZbFhOiM5PhinQb5g0zLD+Soo
	/RsXvWzCPHllI4ObXO9vgEwms+ZGulh/ogJ5VLC4arnwYoN7PO5Ln3iqzU+h3BUvuxvNe8aY/MjI6
	E3ZLL6SO/eEj8UFePFFWrADD5ig8qurXRF77OCht3fM5PNjxos3paq28fT0rWu7Zs66vQRrzLgSS3
	Kl10Yl63u+d4VHWDikLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2ONT-00DD6T-04;
	Mon, 13 Nov 2023 04:16:47 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2ONQ-00DD5U-2v
	for linux-riscv@lists.infradead.org;
	Mon, 13 Nov 2023 04:16:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699849004;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7aB5COy4QAe+eFccHV1YqyKzO84zBoVzPy0R2GMj01o=;
	b=HI8DAp1B325lEycVATJ4dVKLA+L4XaISjgsZfdAzFhU6xkkwIHIZrmYJFhPNVa31pS1e6q
	Q2bjRps3PmJYGYhSpIy8QMq4VnLsPd3OiOC46pjOXoDRB9Fj3QuwsDk61TG6wEnTyjsZjI
	M2ACMDztbTZSQh6eHIvtrX82fAnLd9Q=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-8mAouWVeNKmomW6_cBqQIg-1; Sun, 12 Nov 2023 23:16:40 -0500
X-MC-Unique: 8mAouWVeNKmomW6_cBqQIg-1
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-5b7f3f47547so3500827a12.3
        for <linux-riscv@lists.infradead.org>; Sun, 12 Nov 2023 20:16:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699848999; x=1700453799;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7aB5COy4QAe+eFccHV1YqyKzO84zBoVzPy0R2GMj01o=;
        b=U8zhPsbXGB6ze/gQffxLlue5YRAHKz4USwlTiI0t3a4f7QyXW1vv8zCmqVjjE2xrr9
         9ofn98JfTKaGXOOyDXU2FzYpTm6yaCmlGHwVVkXvAqqCAPIcYUBfqGBdm45FU7Ckpc33
         8blIePGAMMwiIagHHgbt2dK5jkQimEWdy1yDZPHUcDGjnRh3t6YEFIAitKddGTRHWBKn
         SI9rFRKAdzIjsijWaw+UUSqh2PQUjhyPskgifrXYi3fKjmPxMUNp7MeWLFuR4mJpOXhf
         MToNH463xusBnRGI5T0n1I1CYeFsRLO0rObBkpVpcPgFiN6clBH2vhR6icM3cJRkJtNT
         XTKQ==
X-Gm-Message-State: AOJu0Yxx+/0rsd+g2VrpTeIL4+nGk+tcEIoBCpr3b9P76ksdqN1SDDp9
	8gcqBgNolWVmw+emXj0RGvINy7jSeBN/TXD2cWFS9N0JK9YQ0SaIglLfVE/TezIwC6mw8E/+I9d
	lwbG+FfJCnvaT8+OreQKjmnnpQIIj
X-Received: by 2002:a17:90b:4b90:b0:27f:fc2f:4831 with SMTP id lr16-20020a17090b4b9000b0027ffc2f4831mr3808805pjb.13.1699848999515;
        Sun, 12 Nov 2023 20:16:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IExSJF7Sr4fxZ4SaXBfj45m19uu6J8O0+tvnJdz59Xz+72h6hZwy5AtBFfiTF4Ru6jPNTRc+w==
X-Received: by 2002:a17:90b:4b90:b0:27f:fc2f:4831 with SMTP id lr16-20020a17090b4b9000b0027ffc2f4831mr3808799pjb.13.1699848999237;
        Sun, 12 Nov 2023 20:16:39 -0800 (PST)
Received: from ?IPV6:2001:8003:e5b0:9f00:b890:3e54:96bb:2a15? ([2001:8003:e5b0:9f00:b890:3e54:96bb:2a15])
        by smtp.gmail.com with ESMTPSA id mg5-20020a17090b370500b00282ec3582f1sm2976159pjb.34.2023.11.12.20.16.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Nov 2023 20:16:38 -0800 (PST)
Message-ID: <fa717944-2f92-48f6-ad70-1c58ffe61b86@redhat.com>
Date: Mon, 13 Nov 2023 14:16:29 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 16/22] x86/topology: use weak version of
 arch_unregister_cpu()
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 linux-pm@vger.kernel.org, loongarch@lists.linux.dev,
 linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev, x86@kernel.org,
 linux-csky@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org
Cc: Salil Mehta <salil.mehta@huawei.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, jianyong.wu@arm.com,
 justin.he@arm.com, James Morse <james.morse@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>
References: <ZUoRY33AAHMc5ThW@shell.armlinux.org.uk>
 <E1r0JM0-00CTy7-NL@rmk-PC.armlinux.org.uk>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <E1r0JM0-00CTy7-NL@rmk-PC.armlinux.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231112_201645_015195_D5A9A57B 
X-CRM114-Status: GOOD (  12.70  )
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

On 11/7/23 20:30, Russell King (Oracle) wrote:
> Since the x86 version of arch_unregister_cpu() is the same as the weak
> version, drop the x86 specific version.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
> Changes since RFC v3:
>   * Adapt to removal of EXPORT_SYMBOL()s
> ---
>   arch/x86/kernel/topology.c | 5 -----
>   1 file changed, 5 deletions(-)
> 

PATCH[16/22] can be folded to PATCH[15/22] since arch_unregister_cpu() was just
added in PATCH[15/22]. Anyway, the changes make sense to me.

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/arch/x86/kernel/topology.c b/arch/x86/kernel/topology.c
> index c2ed3145a93b..211863cb5b81 100644
> --- a/arch/x86/kernel/topology.c
> +++ b/arch/x86/kernel/topology.c
> @@ -43,9 +43,4 @@ int arch_register_cpu(int cpu)
>   	c->hotpluggable = cpu > 0;
>   	return register_cpu(c, cpu);
>   }
> -
> -void arch_unregister_cpu(int num)
> -{
> -	unregister_cpu(&per_cpu(cpu_devices, num));
> -}
>   #endif /* CONFIG_HOTPLUG_CPU */


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
