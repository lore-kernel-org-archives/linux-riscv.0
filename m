Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E90E5C54E67
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 14:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SpdibJVlYqJtoD+/2n9puOThzehusL46H8sLjfneQA0=; b=hAt5VvQgqyFMLH
	Mmlsx8cUCw+jQEt35gj2lORiRIckRFGqlQfQp28YwhWn9Tg1WmMfN0xnAdM7l20Bkct6efOgIPwVc
	hGzuOht3rqFz3bAnDZBJ2do6NoWcQ4tsFiVc1pI6IqAs6qiJK8VUon+4VWcSZ1aa85Fu1F4h2iwN1
	sXMxgndD0bcpeXICJ2uthi5hvsZfZzNxYD818x0IpUOP1n1WQM0rWy6FO9dRoSMnU9kd4WamAmOgW
	zkzKehPxTrnOlOMBhYu7aOdpymUqVf0PsAaqYcNdgTlul80YzWmXVcA9vHx2/5HwlUBuV3/IlpRCa
	KcgF2USuemQurL8ci0hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpUOd-00000009W2E-2nAR;
	Wed, 27 Mar 2024 14:36:55 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpUOY-00000009Vyk-3g24
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 14:36:54 +0000
Received: by mail-io1-xd35.google.com with SMTP id ca18e2360f4ac-7c8ad87b2acso182987039f.3
        for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 07:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711550208; x=1712155008; darn=lists.infradead.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tEYkR/Nfi8jTSq/VguaKTC9/VkGJ3raSs5Lkj4EEZLI=;
        b=OFTHgkG9Vykryq8ftLv14+ntULGZeXmVT/0X+ioVmu9JpyYD1oUw86JEGI4/F0v/3G
         XPd0MIcwc+EhJ3ESUdBFpf3eAW2oywFhB8nh7wec+OTupROPRHLHoevxK2LXTQNFE19J
         mQxiEse2Iiq4sOUI4+J/heAQb0LvplrZ/kgkDcxbkfP73JUwkrSBcVnF4q35g6TPU2f4
         pidbgMd6/608TAQNa8Oq9JsDiVW03auCxiMcUvDKM+aGzZSqDTxGLPHflcZS57bPQ/kK
         iizcIRApdihppQoApxEFbNKWKDbfjVj6Fkc8xKbXyq2877r8G1lLCk2ocOMK0Rmvcvqt
         H40Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711550208; x=1712155008;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tEYkR/Nfi8jTSq/VguaKTC9/VkGJ3raSs5Lkj4EEZLI=;
        b=oyediDhqrE2U7TkZgxtsiuGy4Phn0BPp893w+UE/FQA8pg2YhauGNs2hXrtlEk9Ipd
         QGiW4fCQRBV+RxH/J/1vqIjrmhdGutu3VUsXWmLsADLxmXiZOAPQQY1fuaP2L7Qx1skd
         PU6bh+th+nGGpneD1dmNrryxvl8GFk1ltGMq6nJUnGcJPUnv9XYG1onSCxMwhisXqNO1
         whSzKV3hxhN6s0CfJE/eAlqtPelTG99/sqse04KJKmz8A7enkom1Di2E9s0KXMLBJ8GV
         kUWySRSZV8HWgbCEV0PKDnaxGr+6tFpDokX66yyCsbUqWPuUUsViV5NwcoQG3dheIEnP
         HC5w==
X-Forwarded-Encrypted: i=1; AJvYcCUxCBwehM/M32KfDsqZdaoQFZN0Au1asdBGHTG2Uz8cx/kE99epGIhr7OdNiSdFhIw0A3O+Jv1wOF7p3iHLsz2NVg0FVu4Q0mr0qRqLqGKT
X-Gm-Message-State: AOJu0YwrmJwaY23XPNZP+WwpNaTfBd2Q8yGZ72Jayq7YjYFmc0Nwireh
	NILCJH9tKkR+afzCB1zzg6O12Mvxn3c45TCGKiCmNUw5M6WkZZgTZTHJGERio6U=
X-Google-Smtp-Source: AGHT+IFeRODL8yMZ5WcnGLYjMBIAWH+NYfb77qScWDQqH0p/ehxbo5d+yAOPmfmccrv8puX74fVzFA==
X-Received: by 2002:a05:6602:3355:b0:7d0:2b19:ddc5 with SMTP id c21-20020a056602335500b007d02b19ddc5mr277874ioz.6.1711550208285;
        Wed, 27 Mar 2024 07:36:48 -0700 (PDT)
Received: from localhost (c-98-32-39-159.hsd1.nm.comcast.net. [98.32.39.159])
        by smtp.gmail.com with ESMTPSA id eh10-20020a056638298a00b00476d7a99f34sm3232629jab.99.2024.03.27.07.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 07:36:47 -0700 (PDT)
Date: Wed, 27 Mar 2024 07:36:45 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
To: Song Shuai <songshuaishuai@tinylab.org>
cc: palmer@dabbelt.com, aou@eecs.berkeley.edu, guoren@kernel.org, 
    xianting.tian@linux.alibaba.com, takahiro.akashi@linaro.org, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -fixes] riscv: kexec: Avoid deadlock in kexec crash
 path
In-Reply-To: <20231208111015.173237-1-songshuaishuai@tinylab.org>
Message-ID: <0e34cd12-66d8-4432-780a-f08d03a2c95e@sifive.com>
References: <20231208111015.173237-1-songshuaishuai@tinylab.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_073652_562646_346C54B2 
X-CRM114-Status: GOOD (  16.70  )
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

Hi Song Shuai, 

On Fri, 8 Dec 2023, Song Shuai wrote:

> If the kexec crash code is called in the interrupt context, the
> machine_kexec_mask_interrupts() function will trigger a deadlock while
> trying to acquire the irqdesc spinlock and then deacitive irqchip.
> 
> To avoid the deadlock, this patch directly EOI the irq regardless of
> the active status of irqchip.

Taking a quick look at the other architectures, looks like no one else is 
doing this.  Is this addressing a RISC-V-only problem?

> diff --git a/arch/riscv/kernel/machine_kexec.c b/arch/riscv/kernel/machine_kexec.c
> index f6c7135b00d7..d7ddf4d2b243 100644
> --- a/arch/riscv/kernel/machine_kexec.c
> +++ b/arch/riscv/kernel/machine_kexec.c
> @@ -149,20 +149,12 @@ static void machine_kexec_mask_interrupts(void)
>  
>  	for_each_irq_desc(i, desc) {
>  		struct irq_chip *chip;
> -		int ret;
>  
>  		chip = irq_desc_get_chip(desc);
>  		if (!chip)
>  			continue;
>  
> -		/*
> -		 * First try to remove the active state. If this
> -		 * fails, try to EOI the interrupt.
> -		 */
> -		ret = irq_set_irqchip_state(i, IRQCHIP_STATE_ACTIVE, false);
> -
> -		if (ret && irqd_irq_inprogress(&desc->irq_data) &&
> -		    chip->irq_eoi)
> +		if (chip->irq_eoi && irqd_irq_inprogress(&desc->irq_data))
>  			chip->irq_eoi(&desc->irq_data);


- Paul


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
