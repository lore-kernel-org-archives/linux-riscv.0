Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD6F7C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Nov 2023 00:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WgjgJ3UFsfchkgi4NDtFRpgm4QLquU1j1v46D2SUCbc=; b=Oa0Nlsx7kT63CT
	Wqv0SvE3meAaNBUN5k/MpSG/qFaoFLaFX7ky1IqsJdSYOqRn8r0lcKcqxTu0LMLlA3n9M1m62bSPF
	BlxZQRtZvbY29mTaHEmhF21kdeLJW0EbIMRC0YPt2nPZH4rshbR1RUvwLgf+VLpnM2BzkPoIM9LF/
	BhAyuO5PB8cD3+t/bfKwEbl1XA5oWtpCQ7E9lpqs6o/aiOnWOboj1CCAHl3GjbrTcZqyRmOPwMjCc
	+BwTWbNjcKJOd9rzYa/3TqHjICiwJ6jNgeRmyXT1eoR6Nz6H6HqN+XVQAgS28ML24vJvhfJTxzCXm
	Qs2UluIfdkeMm6HU3N4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2LI4-00CxHT-0m;
	Mon, 13 Nov 2023 00:59:00 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2LI2-00CxGj-16
	for linux-riscv@lists.infradead.org;
	Mon, 13 Nov 2023 00:58:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699837137;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cDT/Yw6MepTUY5berRyzp+iGTh5/71yTqnFQ/kYgufg=;
	b=F2nQ34+LtuVNAzyHYMhY7XKF8bKgDNlg2lTV3kPzOyfNVqMTnoyZycOp3/kc191s/cPkOT
	X9y36lz/hegBsN5yN0+KnUJa1Wh3z27wNu1V7y1dhKJHdpVpaZ/Uzz59iae17ivmd+/piC
	IaPEuDzPSDJOa3dvZmFTGJa+XSk1Ruo=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-672-E8vRCkkHN8OJnMhk7p9CGw-1; Sun, 12 Nov 2023 19:58:56 -0500
X-MC-Unique: E8vRCkkHN8OJnMhk7p9CGw-1
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-1cc23f2226fso37856085ad.0
        for <linux-riscv@lists.infradead.org>; Sun, 12 Nov 2023 16:58:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699837135; x=1700441935;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cDT/Yw6MepTUY5berRyzp+iGTh5/71yTqnFQ/kYgufg=;
        b=Lsb6CB8lTjaHxYfMlkGEpt4lU03mveBRfPa7lxLi1LH5U+j48ixsN21S6Cj4es/hLU
         4b9hBqZRCjduuOVbIjUIYOLlsNrBnmX7nJcwBfShzU7GcrGmNHFK/P1AhdPHwS6wqPgc
         dkvMtQb1heE7CB/AVX1s/gHJmSZ3BRUWlg8LMlMqR0B8dyRM99v3nnAw7JMPN7pOiHiJ
         +SxqJpnndh4uKKFre3vCzY9Q4I4eYpoAEwsMmrtcKjk6YZtfQxDMZWQIZJ2SbQfppDz2
         U0B28JurbMrHdDZsmLw86ln7n/m8hzprRTL2hSLQ0uNqxXlwNo1gbhe/V4NsmHK90i5/
         UQWA==
X-Gm-Message-State: AOJu0Ywcl9mB3pkAjWomS0lpwGMGsCMrNhU4epJH6szf7gPh6P8DZuae
	Bpmt5OrNgi1P7cH7xU1xYeB+q0Nz2VHbWksmTUH8hK99mZ3YakPk1+uhwJbj8cmfBu9Q5WEYnxu
	PI1hI1C7XuLn5LNdbjDRnfO+8iknb
X-Received: by 2002:a17:903:18a:b0:1c5:d063:b70e with SMTP id z10-20020a170903018a00b001c5d063b70emr3527462plg.53.1699837134995;
        Sun, 12 Nov 2023 16:58:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEYIxs5W0nH5PRlEPeC7HszJcExOhwxIk5eQviHGK0uTrxM/8D+SW3tGS+WkqqASqjIUf7rPA==
X-Received: by 2002:a17:903:18a:b0:1c5:d063:b70e with SMTP id z10-20020a170903018a00b001c5d063b70emr3527451plg.53.1699837134747;
        Sun, 12 Nov 2023 16:58:54 -0800 (PST)
Received: from ?IPV6:2001:8003:e5b0:9f00:b890:3e54:96bb:2a15? ([2001:8003:e5b0:9f00:b890:3e54:96bb:2a15])
        by smtp.gmail.com with ESMTPSA id 13-20020a170902c24d00b001c5fc291ef9sm3053276plg.209.2023.11.12.16.58.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Nov 2023 16:58:54 -0800 (PST)
Message-ID: <095c2d24-735b-4ce2-ba2e-9ec2164f2237@redhat.com>
Date: Mon, 13 Nov 2023 10:58:46 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 10/22] drivers: base: Move cpu_dev_init() after
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
References: <ZUoRY33AAHMc5ThW@shell.armlinux.org.uk>
 <E1r0JLV-00CTxS-QB@rmk-PC.armlinux.org.uk>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <E1r0JLV-00CTxS-QB@rmk-PC.armlinux.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231112_165858_449084_BDB48FC5 
X-CRM114-Status: GOOD (  10.62  )
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

With Jonathan's comments addressed:

Reviewed-by: Gavin Shan <gshan@redhat.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
