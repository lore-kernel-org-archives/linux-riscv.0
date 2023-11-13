Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E381C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Nov 2023 04:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oQiSEfJR4v/kBau7rm/mZ+ustYKWeIvHV6F5fpZelVk=; b=H7OCptAhL0gy6X
	R0kqJiBPjyc6LCOeTBFOsV7qSLHxbEOqNkAci1AeLf1HpKdgkbgmPxzf5jpc69KAqVqtPHl5b8M77
	Ip/N8cHXkfGx7wuzAAwsDtOIsejXYdW0psnPjyQacm0/RK/65jq4hhGKAfvx7m8GzHARfWEQD96GF
	/J82FuHN2mGu1NPGolR/he6M+xXUDIzh/vi4ICZ36sGgsCUzJil4wI5VH4zeQu4yMU4A1HWV2f4yp
	mPV9CwHUZ/mDU+Jg8rj3fHANFWoILH57+NDMKc0manmox69jzENCOgbPBrQC8IxEy1EAGL5Zm/EC3
	QfmwzYOMrMP6qfMRP0IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2ORj-00DDtj-2J;
	Mon, 13 Nov 2023 04:21:11 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2ORg-00DDsO-14
	for linux-riscv@lists.infradead.org;
	Mon, 13 Nov 2023 04:21:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699849267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jFv0/+ZJ8QcMT7pXMYPj0XHvwSazMYJli5PQ5trCgZ4=;
	b=Qaj4AD4NWKE02XqzY43tk91B/sswBOd2Iaa7CDvvK9RX7AJq6iKzrFnwVIBmoCyKqZLQz+
	iQAbrTX7p+hqX6eL5R3MIcF9l/AKF2VilS19989CxMIBVXslNvJ17EDHqxOwWenmcIaLJ7
	ONvZksy4WMM+D70tOPh9kCnWn9VobPU=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-529-rEJuVKRRMwWEB9eZA5wuyw-1; Sun, 12 Nov 2023 23:21:04 -0500
X-MC-Unique: rEJuVKRRMwWEB9eZA5wuyw-1
Received: by mail-yb1-f199.google.com with SMTP id 3f1490d57ef6-da0c7d27fb0so4830288276.1
        for <linux-riscv@lists.infradead.org>; Sun, 12 Nov 2023 20:21:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699849264; x=1700454064;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jFv0/+ZJ8QcMT7pXMYPj0XHvwSazMYJli5PQ5trCgZ4=;
        b=YICb2Kcx1PjN6jzFS/9Ys/BRRnRStGNbbg+f6zjiRBimx9pMj0amatXzRedRuguHUd
         Oe+wwQHWvTEDhs+g7ErZbrKN8XVbIMEseypoU6m0IipwGDLU/DuJxbzX4//vCJMbdDCZ
         woplz7EWO7Ki4pc5uZXU+0FN9fuVZmnAC8MV5ZPcU/Bp6iPelzznB5x6oqMgb1GC9EH0
         nkvJgjh3D3Kxsfk2hTI75hIxabwy2uXszUBl0bd0oiuGyEWw7hA7BQthB/D0XFhBK9fd
         Q7CsZckx6d2D/NDYAxKyciDNfW9Jkwv12GTZL4bpQPRpTh47QM4SacoyvAzC4wCMumC4
         xZnw==
X-Gm-Message-State: AOJu0Yw0HZc2KdYVGCe0l3C7Sii2dWLtHE6QozjoNQ6eIpCXjxIAhcXV
	Do7HvpYpr0W/sfgIOwYN0joBa+QtpCx4r/rvAt4/SpBtdMgWZprvpHzvUM4ljbBDW6sPWLqGpxc
	1UCFEr/0k/zTueBqQmf/1voJEHCI3
X-Received: by 2002:a05:6902:1547:b0:d43:a84f:a6aa with SMTP id r7-20020a056902154700b00d43a84fa6aamr5454596ybu.39.1699849264126;
        Sun, 12 Nov 2023 20:21:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGuE/Omh7ETDkhtAEC+3zelpWf91MkxxlfVCO0FA1pnNxNCnMWL4q2N7gIaAN7fVOCOVWdIYg==
X-Received: by 2002:a05:6902:1547:b0:d43:a84f:a6aa with SMTP id r7-20020a056902154700b00d43a84fa6aamr5454579ybu.39.1699849263873;
        Sun, 12 Nov 2023 20:21:03 -0800 (PST)
Received: from ?IPV6:2001:8003:e5b0:9f00:b890:3e54:96bb:2a15? ([2001:8003:e5b0:9f00:b890:3e54:96bb:2a15])
        by smtp.gmail.com with ESMTPSA id fm6-20020a056a002f8600b006c4db182074sm3111661pfb.196.2023.11.12.20.20.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Nov 2023 20:21:03 -0800 (PST)
Message-ID: <227771fa-1f22-4b9d-81f5-709f4f0c68c9@redhat.com>
Date: Mon, 13 Nov 2023 14:20:55 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 18/22] LoongArch: Switch over to GENERIC_CPU_DEVICES
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
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
References: <ZUoRY33AAHMc5ThW@shell.armlinux.org.uk>
 <E1r0JMB-00CTyJ-08@rmk-PC.armlinux.org.uk>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <E1r0JMB-00CTyJ-08@rmk-PC.armlinux.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231112_202108_439215_AB968B2A 
X-CRM114-Status: GOOD (  18.57  )
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
> This allows topology_init() to be removed.
> 
> This is an intermediate step to the logic being moved to drivers/acpi,
> where GENERIC_CPU_DEVICES will do the work when booting with acpi=off.
> 
> This is a subtle change. Originally:
> - on boot, topology_init() would have marked present CPUs that
>    io_master() is true for as hotplug-incapable.
> - if a CPU is hotplugged that is an io_master(), it can later be
>    hot-unplugged.
> 
> The new behaviour is that any CPU that io_master() is true for will
> now always be marked as hotplug-incapable, thus even if it was
> hotplugged, it can no longer be hot-unplugged.
> 
> This patch also has the effect of moving the registration of CPUs from
> subsys to driver core initialisation, prior to any initcalls running.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
> Changes since RFC v2:
>   * Explain the change in behaviour in the patch description
>     (highlighted by Jonathan Cameron - thanks.) Add note about
>     initialisation order change.
> ---
>   arch/loongarch/Kconfig           |  1 +
>   arch/loongarch/kernel/topology.c | 29 ++---------------------------
>   2 files changed, 3 insertions(+), 27 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
