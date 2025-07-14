Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ACE3C83F17
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Jul 2025 08:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aiQYWfOz7TbmPblbzujLEGDDYrjG4obdOoDFWZRzogU=; b=Ycc7RahtBzfDn6IOnkUlpp9AmM
	pqm9PNCsMgmnQOd5/5NWQXQQpo5ctsUvkQPJBi6vdYTSHfFwWBMSM67zJcD5NxUB8HYhYEANqGpl8
	w4Va/7IVOrVBmU9xFVcURPnvU3ZhbmGeFBTjy7DbG4UoCJ6hgW63A50i/oPBzQrr+4PNm+OgMZeLD
	Ev7eHXfT+KsNHFcymDeryLF9x3zxNwrvYV7reWkSpUOi0w1yatW64m69EEOXJhTkQ0mnS68vuck6W
	HWBNp/1RbAzAir8nXuzkm/vNJdA25JAhd9A8IOsC1nUGoOrfGpASgEJQNqjgAXEmywLaLUi3GdqSn
	N7nAEgzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubERv-00000001coC-3iDY;
	Mon, 14 Jul 2025 08:22:11 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubEHA-00000001a6r-1lWm
	for linux-riscv@lists.infradead.org;
	Mon, 14 Jul 2025 08:11:05 +0000
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 615FA3F595
	for <linux-riscv@lists.infradead.org>; Mon, 14 Jul 2025 08:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1752480659;
	bh=nqw+Zq4IYXJ5LysW9CQUZGqMpjh9E9bB5LqggaTSXJc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=dN4DmX0DLUqKv1ro/VkcSZ9jYhJ4VpK4hCWo8mLw6Yq8lstvkdGZWF9rB/FkGpDuU
	 FJdfSeqKPPn8QpEgthzmHd41uHYNzPxUIU8uQMTYY60XglXSwhWVc2lPh6vnfByPIV
	 15oA/0Fhq1M6ikg/3OxqGcS+Ad1UBqnbJEWYRaHZMYgbH1y5SDfxnYr+2Ene5K01WT
	 bH6InG3dqPrvkN+k6MeDA5kfZaHtX23f0iM3d4EjYzfCzkFWoH7Y3QNcle5G6iu3//
	 rkxCBIig0HlKpyEmI/ovydri/zyYQLxzm9ZYDOKdSp1QUoZc32HMmFrwL7KPssGgAx
	 zThu4L+n/ySoA==
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ae371f9e3f5so476720166b.1
        for <linux-riscv@lists.infradead.org>; Mon, 14 Jul 2025 01:10:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752480659; x=1753085459;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nqw+Zq4IYXJ5LysW9CQUZGqMpjh9E9bB5LqggaTSXJc=;
        b=IJx12/9n7+ZYo57Rslr8OizlYW72epec+g3AUzy7tvltHcF3aPqiMn9NrCZ2dqDvMS
         YdrXt8uj028H1uT7lFu2xWcoITeNiAc5S/laXcCJixfjOAQAvPIWchtLMunKPxIfuNcK
         /8ADp3MW3/UP7xYoJZdW5uNMXOJQdaTnEKb7mf/LBkYUbUhOFnvs9C6+gv/3XqiuwSN5
         zNKKAcxCsMrQF+CBKVBfwmvaIwX7iqX662nMrR1sh9/dw9/ntNfNOeCyAy/59Mq2p94v
         UoXUuDtJHEQRqNxCwksteuNgG6ExN7iPwkyM5avACQnOuSw2cHyfP40fU3cf+2yjFy5k
         thTw==
X-Forwarded-Encrypted: i=1; AJvYcCVelDuDzffrDsvg0puqTTwYe8Bcz4gLzF9Kr71y+JilA8Uu8rlA6s0D8PA/E0bln5D/5OFMIMmwGUv1yw==@lists.infradead.org
X-Gm-Message-State: AOJu0YztcCgAiPahBBqGdhvv08+pXjzZBpLcUqu0/VzTizvoJ58OgTsi
	3BY0Sg9std8kOq8nHZ4qrE/0vf1mqq4W6245pu6TONvhBfeUXwPvs8LsPupGERmAAp24ZdNVxBH
	Ey3zlMad/8qV/JcqirK254dXd8dRIkdXb24w9GSKgMrxuOOLaR0SirP/0viINzPzi/AyPVQR/Xd
	cZVKN1iO7NCA==
X-Gm-Gg: ASbGncs6IsfHbfQ7+Y08Y0JU/0wMo+sZIwcYuui6C3HsZ3tzZI0HeQwvcyUxpfHZgR7
	IW2PFR+k2Vbw1dOTGWsmhAfD3aqV3eKrBIO8dcE6VKZaHIoFLh6VUJ6SrXBE0rOMTDR4jexWCgT
	k9tEAFC72VbAqRK7zhwqDdP8COUAJHc4exjkraxXgIScX2gGAReVAGQkzrVa6MGPKAghFLhT+eT
	JIWxdE+ziMZhS84FsLw1WLOq0NpWmZLB7QJOrhv785UN/dhoC45gMHyUx/NyIfv6F3td1n+q3SO
	YRR8WQb0vrOv82d7iOXAPPvqJ4ovrprNnRlYQ07IzMEktg4SGMTAEsxFixknWjk=
X-Received: by 2002:a17:907:9450:b0:ad8:adf3:7d6d with SMTP id a640c23a62f3a-ae6fb8a57eemr1155260666b.21.1752480658891;
        Mon, 14 Jul 2025 01:10:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVNG4cGhbgl6DZuAszmrlgOEZ5D4CwRcSMPsKcvD43UnpSt6BkYsm9BCpJ8sMqD6XmPCotBg==
X-Received: by 2002:a17:907:9450:b0:ad8:adf3:7d6d with SMTP id a640c23a62f3a-ae6fb8a57eemr1155257866b.21.1752480658379;
        Mon, 14 Jul 2025 01:10:58 -0700 (PDT)
Received: from [10.27.73.177] ([212.144.242.210])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7e90b09sm770592166b.25.2025.07.14.01.10.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 01:10:57 -0700 (PDT)
Message-ID: <422e2a72-972f-41f4-a0b3-d69a6cb0c2e2@canonical.com>
Date: Mon, 14 Jul 2025 10:10:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/3] Remove unused EFI runtime APIs
To: Ard Biesheuvel <ardb+git@google.com>
References: <20250714060843.4029171-5-ardb+git@google.com>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <20250714060843.4029171-5-ardb+git@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_011104_690792_5C819FB2 
X-CRM114-Status: GOOD (  21.72  )
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
Cc: Juergen Gross <jgross@suse.com>, linux-rtc@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Stefano Stabellini <sstabellini@kernel.org>, linux-efi@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, Bibo Mao <maobibo@loongson.cn>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, xen-devel@lists.xenproject.org, Feng Tang <feng.tang@linux.alibaba.com>, Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 7/14/25 08:08, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Using EFI runtime services to program the RTC to wake up the system is
> supported in theory, but rarely works in practice. Fortunately, this
> functionality is rarely [if ever] used to begin with so we can just drop
> it. (Note that the EFI rtc driver is not used by x86, which programs the
> CMOS rtc directly)

The main problem I see with firmware offering access to the RTC via UEFI 
services is that two different drivers, the firmware one and the Linux 
one might be trying to access the same busses or registers which might 
lead to unexpected results.

Recently there was a discussion in the RISC-V technical group for the 
server platform specification where the same issue was discussed 
concerning SetTime().

As a UEFI firmware should not care which operating system is booted, it 
should be up to the OS to disable EFI access to the RTC if it has native 
access.

Could we disable all the EFI services for the RTC in Linux dynamically 
when an RTC driver is successfully probed?

Best regards

Heinrich

> 
> The same applies to GetNextHighMonoCount(), which, if implemented,
> usually relies on SetVariable() under the hood *, which is often not
> supported at runtime by non-x86 platforms. But it has no known users
> either so let's drop support for it as well.
> 
> This means we need to drop the slightly pointless tests for it too.
> 
> * EDK2 based EFI implementations usually have a MTC variable carrying
>    the monotonic counter variable, which is therefore not truly
>    monotonic, given that SetVariable() will happily overwrite it.
> 
> Cc: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> Cc: Feng Tang <feng.tang@linux.alibaba.com>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Juergen Gross <jgross@suse.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Cc: Sunil V L <sunilvl@ventanamicro.com>
> Cc: Bibo Mao <maobibo@loongson.cn>
> Cc: linux-rtc@vger.kernel.org
> Cc: linux-efi@vger.kernel.org
> Cc: xen-devel@lists.xenproject.org
> Cc: x86@kernel.org
> Cc: linux-riscv@lists.infradead.org
> Cc: loongarch@lists.linux.dev
> 
> Ard Biesheuvel (3):
>    efi-rtc: Remove wakeup functionality
>    efi/test: Don't bother pseudo-testing unused EFI services
>    efi: Remove support for pointless, unused EFI services
> 
>   arch/x86/platform/efi/efi_64.c          |  22 ----
>   drivers/firmware/efi/runtime-wrappers.c |  68 ------------
>   drivers/firmware/efi/test/efi_test.c    | 108 +-------------------
>   drivers/rtc/rtc-efi.c                   |  76 +-------------
>   drivers/xen/efi.c                       |  56 ----------
>   include/linux/efi.h                     |   6 --
>   6 files changed, 4 insertions(+), 332 deletions(-)
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
