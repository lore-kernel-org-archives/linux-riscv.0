Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9399CC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Nov 2023 00:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CiSudad31L5JGl40el4pM4Bs58QknarM1xqfFLLgzS4=; b=npAg30WRRDQysG
	a6lgTSZObQJ5RIUNQBIFrxfTihx3ee05bZBwGQBraw6mRHtWwcsfqEJx20GKn7yDGdkY93qHKXHbl
	o5NU5O1lvo6pNf+ntSAvxF9UiuUq5pyIU7NTacO1epq6MQMlFUBhYZAlC2SEag+3UoMgO8wLEVxjj
	tW0dY/Z/HPasXPul44+NyPIvN/njQUg1lv1xpDtKlpY6gN4cJpuygli9TbsHhZ2sIdgaD7YAVfp/9
	1fwVLgQorCiZRuC/JGmlt2zN5OBuMBaRX5y58HmYnh3sDmIFx6smPa4KOSjpQ3GGyiVWgf8DNkv95
	AwoVgaBcYp5k0uCIKU1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2KVc-00CuE0-2c;
	Mon, 13 Nov 2023 00:08:56 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2KVa-00CuD6-0C
	for linux-riscv@lists.infradead.org;
	Mon, 13 Nov 2023 00:08:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699834132;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LZoVE59pXWGm0JQT+CMJNCgS+fu8REHYPUoz78JAFk8=;
	b=VOvWfk3frlAdT2f75dfTeT4ZpG5d7tOblk7SDU2Sr6+8PAbp8SrekcoN47qW7ptdVxKEbW
	1Vc2CiT+MVEgaHAyooP2iKbIddrnbfaESxs1miWd/kE0sKKIWvLT8p6oyk/kk88y9va9tf
	DBPtjbytJr5vcsd+njKmnYTzLMGf/vs=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-mCSjbrQbM_qBB5VG8E0JxA-1; Sun, 12 Nov 2023 19:08:51 -0500
X-MC-Unique: mCSjbrQbM_qBB5VG8E0JxA-1
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-6b6f4c118a9so3926871b3a.1
        for <linux-riscv@lists.infradead.org>; Sun, 12 Nov 2023 16:08:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699834130; x=1700438930;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LZoVE59pXWGm0JQT+CMJNCgS+fu8REHYPUoz78JAFk8=;
        b=wD8hm1ZlLddrCCrJ6YG5xYFW/efsiSQngH8IeA0zNKEdDrDbOBbiv8RWqydI7J8fKq
         vfc+WfglCHyGbVv2vxFUX7aYtVOu+FjNaytbIxFzHr63x1Rogm1y4ClHJKcvQeM2yCcB
         cQQj5KJTs22/fzwX2Om5Qk6MNwfKqgFL2ojHv0QDqxeWPedGpq8bMByJ0dLYfiVrG55V
         uuqN8yd+plsm1JXE3a5th7fp5hleWq3UMXEfkORPYXg/JInQSFkhKcVRI2gnZ9JqEGdh
         ebjyYdbnBNkquIiT/RLW3gOJ537H4Htgq9TNT1LBMPIcIu1vky1KDPubDdn/WUGDghkX
         635w==
X-Gm-Message-State: AOJu0Yy5crd59SGHXyf4byXNySW1Um70iBsFMpSIzMqMoX+wFRJBQJQO
	b4WINuVq6BA2WkPJFqFaELLgdzOh+kgZbllUgzrAefIa8gWFocLs4Kcp/XPVXUGevab5MsQGebF
	Cxhp5Ikw2I7rmrNhOBwfm01Mknen5
X-Received: by 2002:a05:6a20:748b:b0:186:603b:6b53 with SMTP id p11-20020a056a20748b00b00186603b6b53mr1091868pzd.0.1699834130300;
        Sun, 12 Nov 2023 16:08:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEuXsyqcDEY3uU8V/1tkBaOM8ZFpVTqspPi9KzQF+bgKRFukH+13LuLcTE/aP13+7JgHA4Nsg==
X-Received: by 2002:a05:6a20:748b:b0:186:603b:6b53 with SMTP id p11-20020a056a20748b00b00186603b6b53mr1091836pzd.0.1699834129822;
        Sun, 12 Nov 2023 16:08:49 -0800 (PST)
Received: from ?IPV6:2001:8003:e5b0:9f00:b890:3e54:96bb:2a15? ([2001:8003:e5b0:9f00:b890:3e54:96bb:2a15])
        by smtp.gmail.com with ESMTPSA id y18-20020a1709027c9200b001b53c8659fesm2998333pll.30.2023.11.12.16.08.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Nov 2023 16:08:49 -0800 (PST)
Message-ID: <baa98649-1840-48aa-89ac-0c27a08559d5@redhat.com>
Date: Mon, 13 Nov 2023 10:08:40 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 03/22] x86/topology: remove arch_*register_cpu()
 exports
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
 <E1r0JKv-00CTwf-R9@rmk-PC.armlinux.org.uk>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <E1r0JKv-00CTwf-R9@rmk-PC.armlinux.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231112_160854_167615_8F44424E 
X-CRM114-Status: GOOD (  10.51  )
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

On 11/7/23 20:29, Russell King (Oracle) wrote:
> arch_register_cpu() and arch_unregister_cpu() are not used by anything
> that can be a module - they are used by drivers/base/cpu.c and
> drivers/acpi/acpi_processor.c, neither of which can be a module.
> 
> Remove the exports.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>   arch/x86/kernel/topology.c | 2 --
>   1 file changed, 2 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
