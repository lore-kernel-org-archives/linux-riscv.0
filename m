Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D10C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Nov 2023 04:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SARlSQYyLeCptG/SKop/GDYuiLe4Q7ZCcUJEDq0GTDI=; b=QK7UT6NBgYy/RT
	Iycz8qJ/P/1+XEbfrFT2kU3Z7PdCoExFVGu09o2KvueiVkteI9cHpJ+UrvqX/JGT5vJyEXXa+daaA
	dKZGkasM+hN94N8KYTmn0oIkvkfjIxWYvH6gaQgi06gkYjxKyjtmIDgEW9fINkg+hDfYxNzdUN/3a
	boqRvhHMu3ThfhiucRotCJ602FUiy4GCKcvO110goVGKnOPro9saoar3zSoxhIYmNk8pmMH4/lS/z
	vxXKgAGbZSYlq6lS/SDvh1HB+6J2oz2tLuQFXRzTI0E+Zg2oXcf1rpkyY6a3x6JPcqVv1SgIMk/ce
	oukQGgy2Wq7U2baR6DWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2OBI-00DBIv-25;
	Mon, 13 Nov 2023 04:04:12 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2OBF-00DBIM-1R
	for linux-riscv@lists.infradead.org;
	Mon, 13 Nov 2023 04:04:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699848248;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MtNFooCff3vqCOUxCEz1jHRl+QbfPpBEZibpqDAaoCg=;
	b=My2WWweh8U1qeObJ2g8zEcXNUI3TkqsggCEzixeElxmoQdy9Y0p/zLrGDs8eAaiq986wyy
	tFDOmuaB151AckTRLL/7euer1gy1Q4KuI6TGkXwWmfWSSASAyVOCsoJu5pzkpKsa/rKlJq
	GoLqHp3i9DcI9xYrLaxKz/BOm3uFtsg=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-64-WEt4-ozrO6uyOUGr7NjhFw-1; Sun, 12 Nov 2023 23:04:04 -0500
X-MC-Unique: WEt4-ozrO6uyOUGr7NjhFw-1
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-1cc5c4972bdso54517165ad.1
        for <linux-riscv@lists.infradead.org>; Sun, 12 Nov 2023 20:04:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699848243; x=1700453043;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MtNFooCff3vqCOUxCEz1jHRl+QbfPpBEZibpqDAaoCg=;
        b=xFvNR5Yrm0MgjeJiYBFEq16EbK7v24TTjveHuDOaLC4nLfGmsJBJNJYeE1NXZhUAgf
         pFQFjtn9gCqNRlaDpWAPgOKbofIHYFjrD7jMvrMLI+V6Xrgm18XM8mlR8LGyZbisJ2bH
         MHb59aa5KdOU3KN0tgkrtUJlmGRFGehFbVsu7KZOkqL23cLiRbh+QkxINXCCHqCXo3cT
         Y/wQMWyJXXwZeiUhF8pEGs86M3aNjMV3Gs3qvbB0lugMx3Bue7kTrN921BLuZNYAncVO
         fuml97cE1BYZNMm0pRw03H0HC3WDyDe76uAx1nFcLjIrZ0iVFWIOXPRRm8UbcfHUzD3M
         PUDA==
X-Gm-Message-State: AOJu0Yz8fYzEDf2UTGCzGu9VMiEjbqiPvM7DWdodbeZbwl6u9cwDtqVN
	sx0NL/JQY5jIjW/jj1DY9zvVSDthyd8iQARfBGYq1txjfH3C38sJSDZfoJ+MMR/7URnV66Am8S4
	8y14pfFOahBISj7b/1Z53NKlgzv1E
X-Received: by 2002:a17:903:124b:b0:1cc:3f10:4175 with SMTP id u11-20020a170903124b00b001cc3f104175mr7395312plh.28.1699848243623;
        Sun, 12 Nov 2023 20:04:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHIUBgi1/lc4Y3idUGi3EHadW6QYxPGSgwR1L+ZBVEJt2K4HesJHzLX8fXA3t0WRPADwpmGUg==
X-Received: by 2002:a17:903:124b:b0:1cc:3f10:4175 with SMTP id u11-20020a170903124b00b001cc3f104175mr7395280plh.28.1699848243280;
        Sun, 12 Nov 2023 20:04:03 -0800 (PST)
Received: from ?IPV6:2001:8003:e5b0:9f00:b890:3e54:96bb:2a15? ([2001:8003:e5b0:9f00:b890:3e54:96bb:2a15])
        by smtp.gmail.com with ESMTPSA id u18-20020a170902e5d200b001c62d63b817sm3216342plf.179.2023.11.12.20.03.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Nov 2023 20:04:02 -0800 (PST)
Message-ID: <c4a0af68-153e-41a8-ae82-8ebb2b4c4bc9@redhat.com>
Date: Mon, 13 Nov 2023 14:03:53 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 12/22] drivers: base: Print a warning instead of
 panic() when register_cpu() fails
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
References: <ZUoRY33AAHMc5ThW@shell.armlinux.org.uk>
 <E1r0JLg-00CTxd-31@rmk-PC.armlinux.org.uk>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <E1r0JLg-00CTxd-31@rmk-PC.armlinux.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231112_200409_560544_77538E15 
X-CRM114-Status: GOOD (  13.50  )
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
