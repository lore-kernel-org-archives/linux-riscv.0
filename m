Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59276C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Nov 2023 00:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bN5XYT35mzzBdkzrgXsJs8sCKZew64/8qpkP5TtRxMA=; b=IOh2YFSVmmKc8Q
	kNkpWv/WyHgEvmNlbXvnvBvNnIWWwS53qo9eeQFizxBWi/uxf13agl8SUbazty2tYM0RQGCh9eX49
	Z0jGbM+5wSe7k3N1A8i2AJV2TDBauITkyLexY2ppoCqaN8DBQJHZxby9Q9AOi5kXcQI/q4IfSgNh4
	7f6SJebTmW//YcqI7JkvLlmykbAk8HaXWTMBfGMjTz6Ju43V7egxTxMfvmLWRsfYCJHfca6zCZcRt
	IV162o0pbKb6kdjqGd3MEZ8Kmco8eCRCK1QHIa9ITeVEr68RxxeZ8godDaNnAbOMkvWsnsJ4Jfw4X
	CGDQOL78GId/7bKf5ywA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2KYX-00CuTd-1R;
	Mon, 13 Nov 2023 00:11:57 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2KYU-00CuSy-2Z
	for linux-riscv@lists.infradead.org;
	Mon, 13 Nov 2023 00:11:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699834313;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UQiJJ/dxNEHd77f2PC0oaN2B9+v5Hs6KtuITs8AqQVc=;
	b=XCXMkA5QOB0SBJCrwFOA7lVQxltMIBDSjs7jIsXedmQuofdQWUtIZ9ikOs3jAVZ2aDmDSk
	2rBOsrF/wDFq/DXq8lfzWT9nAzjusb9F/vQfsgK8yZzK8HJsrPQcLjyx2UJUwliD5GIWNX
	qJFOwcRalWgqYeM61if0BTvFpaSaY3M=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-90-OOJYrUYJNhOSvqH51lZbIg-1; Sun, 12 Nov 2023 19:11:52 -0500
X-MC-Unique: OOJYrUYJNhOSvqH51lZbIg-1
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-1cc502d401eso45316395ad.0
        for <linux-riscv@lists.infradead.org>; Sun, 12 Nov 2023 16:11:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699834311; x=1700439111;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UQiJJ/dxNEHd77f2PC0oaN2B9+v5Hs6KtuITs8AqQVc=;
        b=F1qF3fiw6tLpaxaNyzqRPWgzhVjmpMVtpSiXPrhvmeSPV+khHCMC0jVqcY0vCxhC/7
         95Wq+pVD+rqjVRa3TaxE56CYybPH12kQVCJGMpp7pArGxUQgxFMDYYchzWajAnTEP4R9
         Ju/mkPcLV/gPzFpIzaXqS3WjWrbadKS82BNwdifAOswt9oqCyOx9cV1P0s66gzhXc2I9
         mtK0otWeu0QM9KsnP63rQjfa5bjenaackzfiKNK4DjlMI5iatKVIWUgMJNu95d+m7Wm1
         6SN6lfXocfb7HjqDhquGPaVcjQTzMN54ktyfWGijMbOxmV0gdTV+kgU0JJ5qst4Kfj5G
         /qhA==
X-Gm-Message-State: AOJu0YyMsVzdwaXFkllQHeBp2D4h/GVV6SwAa9RWQvxTXI1+9oh6FlNc
	OmCBMAZpx079PUcQxFOIpG89OtUk0OMs+QH7yPx7HyJmex+R/S9+tj78MsJ3NOFPDWy8n1SsRW1
	T/uk9Tsoh5x2AYz8RypCFpMsjYLP2
X-Received: by 2002:a17:902:eecd:b0:1c3:4b24:d89d with SMTP id h13-20020a170902eecd00b001c34b24d89dmr6067391plb.40.1699834311417;
        Sun, 12 Nov 2023 16:11:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEdqJareZ27x0vWYdkv//f/HJqmqCsdd3lWu5y3OyZlPyNdejWbYRbuSoSv157Xo1Ur4thQ4Q==
X-Received: by 2002:a17:902:eecd:b0:1c3:4b24:d89d with SMTP id h13-20020a170902eecd00b001c34b24d89dmr6067370plb.40.1699834311176;
        Sun, 12 Nov 2023 16:11:51 -0800 (PST)
Received: from ?IPV6:2001:8003:e5b0:9f00:b890:3e54:96bb:2a15? ([2001:8003:e5b0:9f00:b890:3e54:96bb:2a15])
        by smtp.gmail.com with ESMTPSA id m16-20020a170902db1000b001c9b8f76a89sm3022112plx.82.2023.11.12.16.11.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Nov 2023 16:11:50 -0800 (PST)
Message-ID: <fffd8a37-bb23-4c76-aec7-aec2f1361817@redhat.com>
Date: Mon, 13 Nov 2023 10:11:42 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 04/22] Loongarch: remove arch_*register_cpu() exports
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
 <E1r0JL0-00CTwm-VX@rmk-PC.armlinux.org.uk>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <E1r0JL0-00CTwm-VX@rmk-PC.armlinux.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231112_161154_922967_1268F3A3 
X-CRM114-Status: UNSURE (   9.45  )
X-CRM114-Notice: Please train this message.
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
>   arch/loongarch/kernel/topology.c | 2 --
>   1 file changed, 2 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
