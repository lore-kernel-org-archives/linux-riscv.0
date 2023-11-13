Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D3BC4167D
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Nov 2023 04:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LBN/HVMS0+AIT1pUK9O3E3diaijXAqnvGXo+Nf6bOCw=; b=WVp+yRCJ2TgY1S
	sgp6CyQIvlsCR10lrGbCA3pM+fiFwQ59JbM0w4sQAbzlWqYdxqgBPzWg1nIRfNjJaTcvtyFs6PXnI
	tWierWvAHQvjS+dFlN1YGMSxEqo+PtMCDSuNPkdDbB6YifWjfSYKPsZ+CbeSSlkLFj9Snbhs2TEOC
	yKemzRUAJJzM7CNu8Cq/uqtnayQtaa05KdTw8Dcwd2k2VecVSl6FTmxEt00mE+Tfusd+f1ydhZx6z
	nk+fcNKKjfy5U2OWw6e8F/Rqrsh4LxrCIFoZfwTicrpKCZnrCB1lWXSrxA5uw02JAGw2HHUxT7egA
	ZDLaTfdb+v11tzQMVAfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2OK8-00DCl0-1w;
	Mon, 13 Nov 2023 04:13:20 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2OK5-00DCjg-38
	for linux-riscv@lists.infradead.org;
	Mon, 13 Nov 2023 04:13:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699848796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OYixRZav3C3iBpUpIpT8jXDG1/jkmr5ugIcaaWqfvjU=;
	b=hceDXwasxkLksaFb+ViMBnRjFPwdMBBrylWWo+4v6PxmE5IT2T9N3hyA6JJ5+XK7eEjZov
	UG2eNgULAylPEapMEjWIdv6sPsDYPcUsvFIXpnFrJRWcxWqPcG/6Ykk40Pv/AlA6U3IJjN
	hIRrko2h2GnDsKMXLwzM8JddRyoh2Wk=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-381-etYF4RnQMd6tyceVDRDXsg-1; Sun, 12 Nov 2023 23:13:13 -0500
X-MC-Unique: etYF4RnQMd6tyceVDRDXsg-1
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-1cc2a0c7c6cso38864905ad.1
        for <linux-riscv@lists.infradead.org>; Sun, 12 Nov 2023 20:13:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699848792; x=1700453592;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OYixRZav3C3iBpUpIpT8jXDG1/jkmr5ugIcaaWqfvjU=;
        b=utUhZXJwQJAOorv5Htp4jRjeWUrwFNYMMaF8CiakDgU5l9b5/jAOdeFXY3dfGMUXQ0
         llwtwFRbO6kmdNxqBmjkD9dasz3ExFKe03qYtfbaUrXY37Z64tnvw1Cx3c43jN67y1ps
         QqG093lPojFA2srruaQ5hp5Q4YQ/PkFkeCjKTtXvLmdPXSi2msPyjQszHU9PQsc2PFo+
         K/fe0j5WDqtnw4E9eouG4zceCW7Lc+iyZxWZo7m4K1L1jEDaB3/ubfjEEkQ1KQElP82i
         TW4UZylZZ+IHoeHjy2RJmYYwSogZtTyowty+m9T8oXKtZzoU5LmUsCVjo5FyF3fiqrO8
         QEVA==
X-Gm-Message-State: AOJu0YwLwMNijyCnz0iU+wVk4+upUIxU42Yv4zXK6qBLz7uB4RSbVROi
	sXUai9lmmrbVjYyQejOKv1ZeJYuEo7tQtuZRwrt7Wp3yU0mgbqi8akzr1eHcnUA+l6cl6vdXZJD
	YJDGNKjlwJP5/8Xo6yxT7JcJxbzBV
X-Received: by 2002:a17:903:41cd:b0:1cc:6fa6:ab62 with SMTP id u13-20020a17090341cd00b001cc6fa6ab62mr4016468ple.29.1699848792645;
        Sun, 12 Nov 2023 20:13:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFeVOFMA0QCBZizKA9tBYcgAmzTI5mhR1cqxGbQYoi32/jpLTsg/y/gXt+4vuBSLdXi2pW82A==
X-Received: by 2002:a17:903:41cd:b0:1cc:6fa6:ab62 with SMTP id u13-20020a17090341cd00b001cc6fa6ab62mr4016447ple.29.1699848792330;
        Sun, 12 Nov 2023 20:13:12 -0800 (PST)
Received: from ?IPV6:2001:8003:e5b0:9f00:b890:3e54:96bb:2a15? ([2001:8003:e5b0:9f00:b890:3e54:96bb:2a15])
        by smtp.gmail.com with ESMTPSA id 6-20020a170902c10600b001cc41059a11sm3227272pli.196.2023.11.12.20.13.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Nov 2023 20:13:12 -0800 (PST)
Message-ID: <9890d7b5-a51b-4556-bd20-96b617e6b880@redhat.com>
Date: Mon, 13 Nov 2023 14:13:02 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 15/22] x86/topology: Switch over to
 GENERIC_CPU_DEVICES
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
 <E1r0JLv-00CTy1-Gq@rmk-PC.armlinux.org.uk>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <E1r0JLv-00CTy1-Gq@rmk-PC.armlinux.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231112_201318_076230_AB1B8018 
X-CRM114-Status: GOOD (  15.59  )
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
> From: James Morse <james.morse@arm.com>
> 
> Now that GENERIC_CPU_DEVICES calls arch_register_cpu(), which can be
> overridden by the arch code, switch over to this to allow common code
> to choose when the register_cpu() call is made.
> 
> x86's struct cpus come from struct x86_cpu, which has no other members
> or users. Remove this and use the version defined by common code.
> 
> This is an intermediate step to the logic being moved to drivers/acpi,
> where GENERIC_CPU_DEVICES will do the work when booting with acpi=off.
> 
> This patch also has the effect of moving the registration of CPUs from
> subsys to driver core initialisation, prior to any initcalls running.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ----
> Changes since RFC:
>   * Fixed the second copy of arch_register_cpu() used for non-hotplug
> Changes since RFC v2:
>   * Remove duplicate of the weak generic arch_register_cpu(), spotted
>     by Jonathan Cameron. Add note about initialisation order change.
> Changes since RFC v3:
>   * Adapt to removal of EXPORT_SYMBOL()s
> ---
>   arch/x86/Kconfig           |  1 +
>   arch/x86/include/asm/cpu.h |  4 ----
>   arch/x86/kernel/topology.c | 27 ++++-----------------------
>   3 files changed, 5 insertions(+), 27 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
