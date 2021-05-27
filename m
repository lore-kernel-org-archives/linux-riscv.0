Return-Path: <SRS0=ju53=KW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAE1EC4708A
	for <linux-riscv@archiver.kernel.org>; Thu, 27 May 2021 13:17:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8876B611AE
	for <linux-riscv@archiver.kernel.org>; Thu, 27 May 2021 13:17:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8876B611AE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d5zXCmcnwboAjjvqslM6EiBEWMC+iosMr2NaZpXyams=; b=I+ZH3a6z9TK/2YHsuXvmj0od4w
	MMGS47R3Byvreq2yyK2G+HQcin9HD+7KzMYr78Pfz6b1N+26JMGYKhoYkOeS6zPGqJtKBSxS1HbSh
	ahEdR1SgTJscQCogQ2JWEAosIMx2446fvcrE37cD3RNGeTVxukMqTSGUuL2J4OIaYOs9wipsqgmtO
	k7NE+kYhgFcI0Ng7n1EzNKaesgIwSLOzeoCv8hAtN3ff5xPTuM8+OgjDuYkZ2NXUMFZF5IKiHsyut
	3umz18rSH+my14j2biCc8+FHgyJL267VGBXP3UTV4Cp+TfVzGdy17e7ye4aV4m/wdOjDfF7vCFTQK
	746WWinw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmFsW-006AEz-JY; Thu, 27 May 2021 13:16:48 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmFr4-0069Id-9q
 for linux-riscv@lists.infradead.org; Thu, 27 May 2021 13:15:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622121315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nniuAa72sE4gvcHGS9iEOWcgWFhFvQ/8I0FZAsyELBg=;
 b=M0qQZgdpR41ibFK002IcZYTPvFTlAMK5dN12hHI3ati81Q0BZfQxloGgHlSvH4KXgi2IK3
 ZZu5OB7w4nnyNO/0PzxdtsiLztoZ0f+zpznB/+neOfBp75stPWj3tGjG5CKzEAEKsEDGAY
 Piszv7mAlXmrR5T4gn1jwGJHvaFoV+s=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-Nn-cFAeYMLyavjO8D0knKg-1; Thu, 27 May 2021 09:15:13 -0400
X-MC-Unique: Nn-cFAeYMLyavjO8D0knKg-1
Received: by mail-ej1-f72.google.com with SMTP id
 jz28-20020a17090775fcb02903dc26615f46so824ejc.8
 for <linux-riscv@lists.infradead.org>; Thu, 27 May 2021 06:15:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nniuAa72sE4gvcHGS9iEOWcgWFhFvQ/8I0FZAsyELBg=;
 b=hOcr12t4hSYRV6UN84daIJg7C8cot3lueRW6Rs7E+s5DYzmHDUKLnXzyhiy+eWSuv+
 sVjiZOOc4BGDSGkEWATEWD59+UkeA0tGeZUH67C5BZKXnuyZumRZgKMc7v+hX2NKpk7d
 JxwnvQ3pSAMjO/KcGv8MKLfwUSGNEWnJSa2LE7TZ+I44IjjvIiYpXF8PqRh6thLUi24P
 rHH75jRj0NGFy73GtjmCgtv40PlyZHnUDJMGiyX5X7Kbs7MPBviO4OeScGNa1/u6jEJ5
 rFc4HjQvX+EkneUiAYaid/Q3Va3friWp8PANhCh+9lgJU0OuG21Urqy2inOWJhqq9aZA
 y6XQ==
X-Gm-Message-State: AOAM532tZsCHNM6MwZmF/HY9BCmiEXQ7zTE3EPTgcM4gneCvD9D7XkKO
 2gC0PQutH69bY7HA6JxGHyfD7szUtTFBvwb2FFpxy56zNVICZtr717tu/Fn+mM7Zy3SHjJ3QgkA
 Rm//R1WgsWSdghDOPW41kFyYWB+Nu55a4MC1nfRH9zgPKfTlzTcWFBZCq2mHPyZsy2b8MfZLO53
 Ijc5Rl
X-Received: by 2002:a05:6402:128d:: with SMTP id
 w13mr4004184edv.253.1622121311540; 
 Thu, 27 May 2021 06:15:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxEkO5i2RPt7nC6EqQe3UeUqDjFv3CAplMPws2DceuBTmuPXf4faGnGExEXuS/IVujpBVJ4zQ==
X-Received: by 2002:a05:6402:128d:: with SMTP id
 w13mr4004146edv.253.1622121311262; 
 Thu, 27 May 2021 06:15:11 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n25sm1005390ejz.28.2021.05.27.06.15.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 May 2021 06:15:10 -0700 (PDT)
Subject: Re: [PATCH] riscv: remove unused SBI helpers and exports
To: Anup Patel <anup@brainfault.org>, Christoph Hellwig <hch@lst.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
References: <20210527072047.2572741-1-hch@lst.de>
 <CAAhSdy0GQNmXeOwhhaxPAPNgK+zP=EGzNc3LUPg_BhEaqv6yBg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <1b8c5e1b-8997-74f1-b18c-feba8bb1711d@redhat.com>
Date: Thu, 27 May 2021 15:15:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAAhSdy0GQNmXeOwhhaxPAPNgK+zP=EGzNc3LUPg_BhEaqv6yBg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210527_061518_461430_4A2AD772 
X-CRM114-Status: GOOD (  11.36  )
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

On 27/05/21 15:10, Anup Patel wrote:
>> -
>> -/**
>> - * sbi_remote_hfence_vvma_asid() - Execute HFENCE.VVMA instructions on given
>> - * remote harts for current guest virtual address range belonging to a specific
>> - * ASID.
>> - *
>> - * @hart_mask: A cpu mask containing all the target harts.
>> - * @start: Start of the current guest virtual address
>> - * @size: Total size of the current guest virtual address range.
>> - * @asid: The value of address space identifier (ASID).
>> - *
>> - * Return: None
>> - */
>> -int sbi_remote_hfence_vvma_asid(const unsigned long *hart_mask,
>> -                               unsigned long start,
>> -                               unsigned long size,
>> -                               unsigned long asid)
>> -{
>> -       return __sbi_rfence(SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA_ASID,
>> -                           hart_mask, start, size, asid, 0);
>> -}
>> -EXPORT_SYMBOL(sbi_remote_hfence_vvma_asid);
> All sbi_remote_hfence_xyz() calls are used by KVM RISC-V module.
> 

Why aren't all these added by the series that add the module (not 
talking about KVM only)?

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
