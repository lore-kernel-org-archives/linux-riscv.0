Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD2EC4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Dec 2023 03:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tZFpkHszHQ3ci6wjaB5sUbWRZcLjJCjFmbh7dOYR2ag=; b=ia2WpzFb5mi/j4
	zqOPkJ6H7tcfmecNJLLcFI70Dk/E22XEP7WN93IiIEEg9i5LgpKonBdfUHGOpKlW/zHx6JrLfgFPc
	smkg+NKRR2t49hfy9HsFdD+tNvBsOV7/zhc6euU1mR2itUo/Vfk5dYC4Zu0C8isInNorS7RLuoXvT
	IaAIl5KCI4k3WdFLue9yiIgLLGskH7bzKTidX0vah2G5KhhGz21H5xNlWENMlHvEQLVjjJa+TFgkp
	Ch0tN2YWLd8xJPhEkJNFBl3h47sjgAkxsjxQV8LWL5yDlupLXO/pFOCk9j+nPHNf67zBuKoJPQ4d3
	pmKleYkO2W6FMnJ4QtgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8uWF-00CY3F-0H;
	Fri, 01 Dec 2023 03:48:47 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8uWC-00CY23-1O
	for linux-riscv@lists.infradead.org;
	Fri, 01 Dec 2023 03:48:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701402523;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/3AzxV0WgKZTUkZI9KNfIOtjrPxu2v3xdf2PUplwrRY=;
	b=fAmVaU1qLwGmSYFnif6OOQLTppkStrvz9HlB+dDY0FVN1DzUGN+rfk46fdUGhOZdsm6aua
	9gfLBi9A2KYYXO1BbDLJqa5HDkp3kveq3OY5y0t9TU2FgeFuTSJLEy7G6ApGvCp0bCsnVR
	OpifonJc6p5VOu46qy/dSkGbMDIIas4=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-471-bHIBLhxeOHeiEF2gGuhDmg-1; Thu, 30 Nov 2023 22:48:41 -0500
X-MC-Unique: bHIBLhxeOHeiEF2gGuhDmg-1
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-1cfccc9d6bcso1560865ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 30 Nov 2023 19:48:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701402521; x=1702007321;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/3AzxV0WgKZTUkZI9KNfIOtjrPxu2v3xdf2PUplwrRY=;
        b=jl/GZCpEBcLRzy3tJj7ZY8Cv01rEN1CN/D7gQ/G27DboC55v4z1KbG4BkVgj6sUqT8
         ew+ghzkra2c2NDX1gqjDTvq12wkPhW5RLLjlDjHV+Bvh08KmHAc+EDYT6iakXoqedagj
         P0uCtu8sUe5OZxaCzbiLcZmh48L1lMdNTUCKbfpBc4pWxEehNeGDjc5w4n1+ywG/ef0r
         I5i2P8XTm2AfpK6AAIIvL+F619Q8B7azFOIvbv5AM6DtvqytY6n6RTIzZwTxgJogdzIQ
         ZhfKFMbcwP7xka05GogbhPwDiLAdMvHSfpJkwdWCbH3PyqpFgTfYJVzqdKh0YcOw5U48
         oABQ==
X-Gm-Message-State: AOJu0YyMMcslWOuJSIkUd6gkj6jmrYJCcjXkwexeoIo2ijBiP0Z2OiB1
	b0i8rGkh9NdOuI9DlEXHkcCepRn5yq525Nh1ij486QCqsMsqs4v4Nz+uaIFS18/26GlUgnctQ51
	p40nIFrx9g+lpzTWBPyTrNLq910i4
X-Received: by 2002:a17:903:22cc:b0:1d0:1c45:fca6 with SMTP id y12-20020a17090322cc00b001d01c45fca6mr8848389plg.55.1701402521010;
        Thu, 30 Nov 2023 19:48:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFPJHgKJ9VKrBg6ysMgalrHEAISDmXhJQ0ZqsSvXKSLoKD01csDbzaLvkOj/ql3EV9F3wt2Rw==
X-Received: by 2002:a17:903:22cc:b0:1d0:1c45:fca6 with SMTP id y12-20020a17090322cc00b001d01c45fca6mr8848375plg.55.1701402520729;
        Thu, 30 Nov 2023 19:48:40 -0800 (PST)
Received: from [192.168.68.51] ([43.252.115.3])
        by smtp.gmail.com with ESMTPSA id p5-20020a170902e74500b001cfc1a593f7sm2185691plf.217.2023.11.30.19.48.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Nov 2023 19:48:40 -0800 (PST)
Message-ID: <86e58855-c5c9-42d0-b983-bf36a8b9b2b0@redhat.com>
Date: Fri, 1 Dec 2023 14:48:33 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/21] drivers: base: Move cpu_dev_init() after
 node_dev_init()
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
 "Rafael J. Wysocki" <rafael@kernel.org>
References: <ZVyz/Ve5pPu8AWoA@shell.armlinux.org.uk>
 <E1r5R3R-00CszO-C0@rmk-PC.armlinux.org.uk>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <E1r5R3R-00CszO-C0@rmk-PC.armlinux.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_194844_663319_99B4FC41 
X-CRM114-Status: GOOD (  10.79  )
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
> NUMA systems require the node descriptions to be ready before CPUs are
> registered. This is so that the node symlinks can be created in sysfs.
> 
> Currently no NUMA platform uses GENERIC_CPU_DEVICES, meaning that CPUs
> are registered by arch code, instead of cpu_dev_init().
> 
> Move cpu_dev_init() after node_dev_init() so that NUMA architectures
> can use GENERIC_CPU_DEVICES.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
> Note: Jonathan's comment still needs addressing - see
>    https://lore.kernel.org/r/20230914121612.00006ac7@Huawei.com
> ---
>   drivers/base/init.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
