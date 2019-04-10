Return-Path: <SRS0=ShlG=SM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C29CC10F11
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2019 17:13:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CC7A206DF
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2019 17:13:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LUIFMav7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="HsDX4JA0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CC7A206DF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=rh9vg0H91UISeDbkiVMSg9+SXdTq1EvmRAPEzcXF3Ts=; b=LUIFMav7+uSVrzk9MpabMl6Lz
	Q4+RPqQVlAXRLGSrdsvnEtUYf1Wsg45H8gcSOBYqbhLrwaf5ymx/vqJGyAZP6EfO1FDdhhIfw3RMh
	FA0ju26K42CF/V3ESv+DG/mMXTUWTSJvt/PDo7ADlHV+a7K8yhn2mRgYF2YASdWg0NHoqjsQTsIkV
	3L7loo/i8B0BgFFILNMuoKBnEvzHN+FPw9MUkik8VAMqhKmMQeN4V/1hl8E97AFuW6OXNEtnfWlsK
	XPSnbubKiSXgkVMATOWxGGXVsJBVqMSAzsCOLRidZJXdzzvNuC/d3B7eGAjPG+GaGmEj8uSkb3E79
	ik9lsFXTw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEGn5-0005fA-Ta; Wed, 10 Apr 2019 17:13:39 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEGn2-0005eM-J6
 for linux-riscv@lists.infradead.org; Wed, 10 Apr 2019 17:13:38 +0000
Received: by mail-pg1-x543.google.com with SMTP id e6so1941309pgc.4
 for <linux-riscv@lists.infradead.org>; Wed, 10 Apr 2019 10:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=Loqo+ptgBIvQDOyaYvUe0ENLtUskQ9SIaVhe8fwBwp4=;
 b=HsDX4JA03d1+AsAao3WS+PUZr78vdmDtUUzkzxcSROPWrLn8Eb5FR6bTS7gfyX5Se6
 RXHmdSe3i63QH2Uwlc9iWjE2Kb/d+LZwYbiOVxuKvA8EzwkNnof6CPlbrPFGibCBkFp7
 hWnq88og4FTXpEaqx+7oGp51vE2yGyxdwHHhb5UruwL0+wyypViTL9hRTLxGBkBlBe5Z
 5qT13he4my6y/dxSEoIJLSHUik1uC5kGXGYiTwTTRDvnF0GApKaxPmfeOIMK+mweN1/G
 s+svurRAIhhqAOxphSjjmWi/Xc3BUERxrjVzN9O04aDqqGb7V3Bqxtvxuq7qAhEEzT5v
 jJXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=Loqo+ptgBIvQDOyaYvUe0ENLtUskQ9SIaVhe8fwBwp4=;
 b=j8IM/7Cm5s03cDVr7OroUEUyvJbW14ZnhYamTi2Uru0wroH/q0gY45Cix9hPdqb9K3
 1rkP11t8WOuYjKV5+xAZcfyfvhGc3VaAgFdpRgRabOkaLzLUci9S9Gig8K1y+YNklOq6
 1lgJDaYaFZag35PSa2++J5uGYKsLdUS+ynhLLYzYjxrGVk+WsqWg8Kg/VOMDj7HXy8bQ
 ICE/SQMZ4lc0a/ab0mVGPa7Qv3OL/16n07MAvtiRbfHxxMO6lfS9Y9qJfvETK7FESdFn
 roINf/gU+UVXeWbEqoqsLQIaqf5uXOu7JU189vYzb2YbYdXn7CxBDNsvQrL75Sk86eGb
 hoFQ==
X-Gm-Message-State: APjAAAWPWEBIuwiUSfQ+yWN2VITwv6uKg/zLawUt+mcuCQeAOORVRR8l
 Z/WGNtXEBxd8Jond43cHZf4zoQ==
X-Google-Smtp-Source: APXvYqy4kxmphmV7146MvOIJc2ridXyRqNiZXhX/zaBHLyntGjsvpeu6HO/0SDWusydyn5LL7KjkBw==
X-Received: by 2002:aa7:85cc:: with SMTP id z12mr44427095pfn.142.1554916415354; 
 Wed, 10 Apr 2019 10:13:35 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id j62sm35138150pfg.6.2019.04.10.10.13.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Apr 2019 10:13:34 -0700 (PDT)
Date: Wed, 10 Apr 2019 10:13:34 -0700 (PDT)
X-Google-Original-Date: Wed, 10 Apr 2019 09:43:10 PDT (-0700)
Subject: Re: [PATCH 1/3] RISC-V: Add separate defconfig for 32bit systems
In-Reply-To: <CAAhSdy1UZ3VZAa+Gtf0KQUY9Ebwm7p=qAB+Xv7HDAjfUYpFuAQ@mail.gmail.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: anup@brainfault.org
Message-ID: <mhng-291f78d2-5d90-4f44-8bbd-017264cd5be7@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190410_101336_643537_71563409 
X-CRM114-Status: GOOD (  13.35  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: aou@eecs.berkeley.edu, Anup Patel <Anup.Patel@wdc.com>,
 linux-kernel@vger.kernel.org, rppt@linux.ibm.com,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <Atish.Patra@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 09 Apr 2019 23:09:03 PDT (-0700), anup@brainfault.org wrote:
> On Tue, Apr 9, 2019 at 10:14 PM Palmer Dabbelt <palmer@sifive.com> wrote:
>>
>> On Tue, 12 Mar 2019 15:08:12 PDT (-0700), Anup Patel wrote:
>> > This patch adds rv32_defconfig for 32bit systems. The only
>> > difference between rv32_defconfig and defconfig is that
>> > rv32_defconfig has  CONFIG_ARCH_RV32I=y.
>>
>> Thanks.  I think it makes sense to have this in 5.1 so I'm going to take it
>> into the next RC.
>
> Thanks, Palmer.
>
> Can you consider "[PATCH v3] RISC-V: Fix Maximum Physical Memory 2GiB
> option for 64bit systems" for 5.1?
>
> Refer, https://patchwork.kernel.org/patch/10886895/
>
> The above patch is also required for 64bit system with more than 128GiB memory
> (i.e. server-class system).
>
> We can remove "Maximum Physical Memory 2GiB" option as separate patch.

Ya, that should go in.  It's on the branch, thanks for the reminder!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
