Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AA2BC4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Dec 2023 03:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sVI8PmjaqkfmIr3uGKPQEMODmYJheD2r/O9pMwM1iJE=; b=t2ipgDZE3LeTyx
	i7y4Dc5rBxbi0vxBYoFzVK8RLjHBUe1UvXpdTv+vp1habj279dHi1NU9m0EAFBi+6sfoECkUdxXSI
	f4mA+DXKkaoo07NAf6xYk+9DFXyohMgpDrXrelrTFVGvXvsvR3wIv5t+MukRF2jyltFaE4zwGorK7
	Fb9ebtLDOS7/TwnJpgF/Zrs7CnWxUfRcthySb0g+pBK9Vcajh3PL6Of+gIFkwk/Jt3BploKg5eyYP
	y3DUPOaRts/ZbXjl1sKCMqQenSe4FYiaf8Sr/heOsZUFHpCEevYBlgeh9aqzSWZEBN5epvIog1BGx
	iMwSUga4CMuZyIL+J4Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8uVY-00CXq4-1v;
	Fri, 01 Dec 2023 03:48:04 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8uVV-00CXo2-1Z
	for linux-riscv@lists.infradead.org;
	Fri, 01 Dec 2023 03:48:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701402480;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lkYkgQb1oSonM5Ah318XDYvX5RNZmhN/5LooxGJ95vQ=;
	b=Fzbs/Fe6TMcomTOA9ohRLsIyL/CyoiXvoSI0dZaQGOh+3m9VZKLwlBajhjDE0q34bDvagy
	uqS5Vj40LfUcobsrHZqIy6bM5BCvfH4Qk5M6AkZq7j6BriUInRpqL2L55yk5igaLkq2tuC
	Bo3VW8FYDMOO1Lfe3A+LZGpgzUtkrio=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-221-D7cgJwCzMv2hIhLyp-AVbw-1; Thu, 30 Nov 2023 22:47:58 -0500
X-MC-Unique: D7cgJwCzMv2hIhLyp-AVbw-1
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-6cdd1ac2b53so2082872b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 30 Nov 2023 19:47:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701402478; x=1702007278;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lkYkgQb1oSonM5Ah318XDYvX5RNZmhN/5LooxGJ95vQ=;
        b=FAgy2kJy3gVkPuN1xXVKNgK2OSWmO91CVKF6DaMKJe9BILUG+x0IuG29eux4bF7fOS
         eOufvqEL45wLyRje/QOLPM3arqyy513Sns1CC7boT72gryTPSkL9LJ/TbH+i6mBDorz5
         IujuyQp6o17d4n4R5207d6Y+GK1TP5PHDGjnytmhEudXI4BSD233ntAuXiSaRPngpLl7
         gayVL+BoUzT6fhlfqreYdgEOND6ZERNvsc8PEpMaBiZJnfqxuMtFdFIdtb6k9TDfjHnV
         +yDjbI7VKrizRtdV4A0ybOsNUMyKpepSTsnaMGuiIea1YwTM6OCFHBbHAnqI7tvzu95p
         pZtQ==
X-Gm-Message-State: AOJu0YzhILsU86idP5eP/Uj5xsHU3CJ4DfYYOzgh4zeIdyIIHVmNY8vw
	p2YMaQZBijJWhZoeAv0ZscCg2r0kwjOViFtviORhLSrJJk0qUtncOgczUdLbvdRGHN94MJx/fZc
	avotxcCkDNb3NQDmAUTZPED599+1U
X-Received: by 2002:a05:6a21:3513:b0:18b:236d:3f0 with SMTP id zc19-20020a056a21351300b0018b236d03f0mr27000790pzb.43.1701402477972;
        Thu, 30 Nov 2023 19:47:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGhKtgcw5NHksOzMAUau0Dc/qB+PpJdNsaezOVmfl0zRSeeAEUNdBUUxpUuWqCHC+jsRZjfoQ==
X-Received: by 2002:a05:6a21:3513:b0:18b:236d:3f0 with SMTP id zc19-20020a056a21351300b0018b236d03f0mr27000757pzb.43.1701402477684;
        Thu, 30 Nov 2023 19:47:57 -0800 (PST)
Received: from [192.168.68.51] ([43.252.115.3])
        by smtp.gmail.com with ESMTPSA id p5-20020a170902e74500b001cfc1a593f7sm2185691plf.217.2023.11.30.19.47.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Nov 2023 19:47:57 -0800 (PST)
Message-ID: <c01d4958-1cf7-4428-9d97-f6a893f175ce@redhat.com>
Date: Fri, 1 Dec 2023 14:47:49 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/21] drivers: base: add arch_cpu_is_hotpluggable()
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Thomas Gleixner
 <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>
References: <ZVyz/Ve5pPu8AWoA@shell.armlinux.org.uk>
 <E1r5R3M-00CszH-6r@rmk-PC.armlinux.org.uk>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <E1r5R3M-00CszH-6r@rmk-PC.armlinux.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_194801_598495_F62595AB 
X-CRM114-Status: GOOD (  11.06  )
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

On 11/22/23 00:44, Russell King (Oracle) wrote:
> The differences between architecture specific implementations of
> arch_register_cpu() are down to whether the CPU is hotpluggable or not.
> Rather than overriding the weak version of arch_register_cpu(), provide
> a function that can be used to provide this detail instead.
> 
> Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>   drivers/base/cpu.c  | 11 ++++++++++-
>   include/linux/cpu.h |  1 +
>   2 files changed, 11 insertions(+), 1 deletion(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
