Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89A9DC4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Dec 2023 03:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wMoch5ZtJVLwIUEoTNCFRGV3CAbTLuEjq568FWKKnq4=; b=NUmzdrftCjBOHV
	4TKFa8D6HLXvYPPokchFhFseEXQY6j7gKZ3LNxWT5LqAmX+r9MFwhMe2ExOYZZWtRwu3Z2SRcDaFQ
	mOMYZ6pv70qtjnbrcxWVM55bt6WqQx9N3BgH9q+l7vRKWREi4r/bhUmccM286jV4NSo/m5dxdfSGK
	aGSJrj8TucC++0+78h4y/4wjRac7iCbb76ZKJHjtV9Dtn3raoSLcoL0YBzCnzG3hNFiLr/kcdAXyo
	8BKlswWqHBR3zd6uR/Y8S4b/DJnc7xhVoPSsG+Wcq+4Je+UWZ5R42ecqd9PYITExz1xSVabBwG1Af
	H+EOq0aCHHEf8FJdL8/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8uWk-00CYFe-21;
	Fri, 01 Dec 2023 03:49:18 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8uWh-00CYE2-32
	for linux-riscv@lists.infradead.org;
	Fri, 01 Dec 2023 03:49:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701402555;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IO8CL2qjeIUr0LsYwreVkjK8516DQtyOeewHK7H786o=;
	b=WGu4YqHA2ly7lIBRb5cmtWLi5WqsiTeGBSOgibj+nx4++AXyK7ZsEtv2GYNHC2kyyWjipB
	yfENv9zdCkglh41tmGkeQTVkU716gjXy1Imt0DaVvIn14xh4uR/2vgPO83XBmn2z/DmeoP
	bx0ooj+aQf6f1CAztnw2y3tD3Gym1HY=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-695-2WP2UtZMOQ2dAtFeFekMxA-1; Thu, 30 Nov 2023 22:49:13 -0500
X-MC-Unique: 2WP2UtZMOQ2dAtFeFekMxA-1
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2855e4715e4so2197924a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 30 Nov 2023 19:49:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701402552; x=1702007352;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IO8CL2qjeIUr0LsYwreVkjK8516DQtyOeewHK7H786o=;
        b=WukMywEVIBDnSFHfBID33txeAODREN8XJxLN70B/LVO8UPHT9pqpf5qoI8LkYUuSG3
         mZRczbrK3meeNvqcbHxIl0CqDhXZtpF8IGW9/L8xcLvPhN/VWJO7xk6dg9t2pOb+Rfc2
         /cMrgXwVodx75flGGbbpuTjyckJy5tzRyQdBX4NjqAVBgAYGp5B40qvy+fWHIvpwFJrg
         74CmO+D9hBj8as0AzR6ulmjGSnFprLreAuGe53JSKMdY/n75M2Aiqa1RfM2iVeWAFSec
         6fR8fZpf8ghzdB7MhRA43vD5CtgjXzr23Zs/CuPEpnauhmRAPariypbE8njDHK/i/Fi1
         iq5g==
X-Gm-Message-State: AOJu0Yz1MVBGj9lpmNsm0+IttlQ05+Q2spnuECsDIqTbEqEsFESt/VSG
	qgqrETI97b2DTEuL/I7bZAwtXjT0DDaEX7wIGrnc6XfA3IPKKqpTvMsSAJ7bepnaZpQzoJI+Zlw
	WuiXQAkXA5UUnunl5dID/1SXTig3P
X-Received: by 2002:a17:902:e80e:b0:1cf:daca:2b5e with SMTP id u14-20020a170902e80e00b001cfdaca2b5emr17322851plg.38.1701402552344;
        Thu, 30 Nov 2023 19:49:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHVVbr2zUe8qqYTBkmHgB1fO8oP/OS0GFEHLzxacC4remFDnJNuIkfv1IWdcQ4cpeu8xrZWrg==
X-Received: by 2002:a17:902:e80e:b0:1cf:daca:2b5e with SMTP id u14-20020a170902e80e00b001cfdaca2b5emr17322834plg.38.1701402551963;
        Thu, 30 Nov 2023 19:49:11 -0800 (PST)
Received: from [192.168.68.51] ([43.252.115.3])
        by smtp.gmail.com with ESMTPSA id p5-20020a170902e74500b001cfc1a593f7sm2185691plf.217.2023.11.30.19.49.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Nov 2023 19:49:11 -0800 (PST)
Message-ID: <e0b38120-8b09-4695-974c-f3c3ef226f22@redhat.com>
Date: Fri, 1 Dec 2023 14:49:03 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/21] drivers: base: Print a warning instead of panic()
 when register_cpu() fails
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
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <ZVyz/Ve5pPu8AWoA@shell.armlinux.org.uk>
 <E1r5R3W-00CszU-GM@rmk-PC.armlinux.org.uk>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <E1r5R3W-00CszU-GM@rmk-PC.armlinux.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_194916_043846_4D10114D 
X-CRM114-Status: GOOD (  14.06  )
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
> From: James Morse <james.morse@arm.com>
> 
> loongarch, mips, parisc, riscv and sh all print a warning if
> register_cpu() returns an error. Architectures that use
> GENERIC_CPU_DEVICES call panic() instead.
> 
> Errors in this path indicate something is wrong with the firmware
> description of the platform, but the kernel is able to keep running.
> 
> Downgrade this to a warning to make it easier to debug this issue.
> 
> This will allow architectures that switching over to GENERIC_CPU_DEVICES
> to drop their warning, but keep the existing behaviour.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>   drivers/base/cpu.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
