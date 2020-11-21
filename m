Return-Path: <SRS0=iP4b=E3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 131C6C56201
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Nov 2020 02:03:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 691B724124
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Nov 2020 02:03:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mLbFz0ZO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="10KXWheb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 691B724124
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=qNasxM+0wpyY2UMC6rNUv1Ag74UA+tsnRbBEdSLh3E0=; b=mLbFz0ZOTl5mnImMUnHpVaShf
	242ZEFIdACHsCDkb64utiaAoYzQDGlKrLA+3MflWE/dukfqSXC8aC+M9v9GZbdjWrA3ddL8A9qzRb
	bMwmEFDPv3DrBfBWrRtwGrxJU3nvHLaf6WkcMweYc5XI+WYf59+uba+QS5oQ/mhGj8DuTqq7CmevH
	pyPOC4PJNmCyaT8jS4M0uaJDUGOi3qEseoX4eJ1ejrJrw/FK/hMXvG0nx01emI54h7veS4G0WIKzv
	99tkYP+xEJkKWcsIoH8VIyvLkshvC8E9b3VOiqGPdeBFKllLBcsP3Dyo9sdYw4G8E9qtGiqreOOjt
	kZ8C9qsJg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kgIFB-000618-3i; Sat, 21 Nov 2020 02:03:17 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgIF9-00060E-Ee
 for linux-riscv@lists.infradead.org; Sat, 21 Nov 2020 02:03:16 +0000
Received: by mail-pg1-x543.google.com with SMTP id q28so8904334pgk.1
 for <linux-riscv@lists.infradead.org>; Fri, 20 Nov 2020 18:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=nPnxZmOuQtc2QtpdIwYqYkgLmJHUqSyVCOGjsd+282E=;
 b=10KXWheb60ng6Ch8zRAfM4VncMaP5LEQSKpcExHA3/h8hhtJ3XCF1X6K0ha9taEP2k
 sVX5X9HNihtT0GlO8odb29mCLoAUo+nAxXpGbHXPbGEpzKtxgc+iYNZ+50pKBjUHchqq
 QgRUDtYLBuJfsL9zh7IovrQVPtfSQfVtPF7t4vBpABRvFjq9oEphnkoa8oNA36NwUSCL
 QTsRlSyExL3yZtwOg6ni5aTHuRawOzkXKVFYIVjBszBy1+/8Q7pwr3764l5ZaKitFHX2
 KZIOZ5m25LFhQtPIQh3/MEHXkNU58VlYhBh50R2WL4/Eh3A/ll6GRsRoO8IQKn1oMXRD
 F2tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=nPnxZmOuQtc2QtpdIwYqYkgLmJHUqSyVCOGjsd+282E=;
 b=TAL7JvGmO40SACZvyquTDu/WsvZ4+zO6vL27zzM8N2pXw4ElmcrHUdn5qMQe+MWNq9
 w98neerbOSHTFl9hnLfLG/ZWUtCCsLo25veiKYLGSpt7HkCs9QWAM1GLn0FCcwkFGEpv
 0on7miRwLFLgD8QySqenEYc5GAn9RBv3YBtuqkFY7h8csN5bYkmSJ/jQWTsxFLsQnqRG
 wUAuas+rfqhQnwVfMHT3galQVvzenIu9wZFc0MaMh/cRL/xMGoxWpRKq272lxEfe7fem
 P9NSrjNYxKaEPuLuBQDB3CxlU21mN1MaXWjxJwh93JcIyOwZMO1AzSypJbj6qdNbHjpU
 iciw==
X-Gm-Message-State: AOAM532jS/jYnklHG4a/3e0gGf/gdElUbbJgCXXA9x+n3e5Q53rF5Ivp
 G5CGo7vsNcx9JDcztO+aUOd8GA==
X-Google-Smtp-Source: ABdhPJxs9SxOKQmp2K0L56/ZWT5uX9uGpjmCzR37XJTOTy9NHs60QVk6oJozDNfprUDnxVNeyhSZiw==
X-Received: by 2002:a63:a04:: with SMTP id 4mr8279807pgk.396.1605924193775;
 Fri, 20 Nov 2020 18:03:13 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id l133sm5432213pfd.112.2020.11.20.18.03.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 18:03:13 -0800 (PST)
Date: Fri, 20 Nov 2020 18:03:13 -0800 (PST)
X-Google-Original-Date: Fri, 20 Nov 2020 18:03:09 PST (-0800)
Subject: Re: [PATCH] riscv: Add HAVE_IRQ_TIME_ACCOUNTING
In-Reply-To: <454abd65-915b-d8cc-f375-34ebfb2ca9b7@huawei.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: wangkefeng.wang@huawei.com
Message-ID: <mhng-4e4287d6-b583-43b7-9dfd-569bb2112617@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201120_210315_496141_93C246A7 
X-CRM114-Status: GOOD (  16.54  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: corbet@lwn.net, linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 12 Nov 2020 00:56:13 PST (-0800), wangkefeng.wang@huawei.com wrote:
> Any comments, kindly ping...

I guess I missed this one too.  It's now on for-next as well.  Thanks!

>
> On 2020/10/28 12:28, Kefeng Wang wrote:
>> RISCV_TIMER/CLINT_TIMER is required for RISC-V system, and it
>> provides sched_clock, which allow us to enable IRQ_TIME_ACCOUNTING.
>>
>> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
>> ---
>>   Documentation/features/time/irq-time-acct/arch-support.txt | 2 +-
>>   arch/riscv/Kconfig                                         | 1 +
>>   2 files changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/features/time/irq-time-acct/arch-support.txt b/Documentation/features/time/irq-time-acct/arch-support.txt
>> index d9082b91f10e..6fc03deb1c38 100644
>> --- a/Documentation/features/time/irq-time-acct/arch-support.txt
>> +++ b/Documentation/features/time/irq-time-acct/arch-support.txt
>> @@ -23,7 +23,7 @@
>>       |    openrisc: | TODO |
>>       |      parisc: |  ..  |
>>       |     powerpc: |  ok  |
>> -    |       riscv: | TODO |
>> +    |       riscv: |  ok  |
>>       |        s390: |  ..  |
>>       |          sh: | TODO |
>>       |       sparc: |  ..  |
>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> index 44377fd7860e..dfbc1351ee62 100644
>> --- a/arch/riscv/Kconfig
>> +++ b/arch/riscv/Kconfig
>> @@ -68,6 +68,7 @@ config RISCV
>>   	select HAVE_FUTEX_CMPXCHG if FUTEX
>>   	select HAVE_GCC_PLUGINS
>>   	select HAVE_GENERIC_VDSO if MMU && 64BIT
>> +	select HAVE_IRQ_TIME_ACCOUNTING
>>   	select HAVE_PCI
>>   	select HAVE_PERF_EVENTS
>>   	select HAVE_PERF_REGS

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
