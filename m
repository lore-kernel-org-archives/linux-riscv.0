Return-Path: <SRS0=AFlu=PR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93A24C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  9 Jan 2019 22:15:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5276520685
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  9 Jan 2019 22:15:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NpncoDy6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="k4LdLoG9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5276520685
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=7fEGOVHHYZmm5W3DYiEHq8UMDf0Fzld0lItbCgLcLTA=; b=NpncoDy6HdQI8MVuUhDqlQRF5
	E+9oko3/aMku0wIG4TXVKpSCvGkJeZ1BXUiZiGpDh1XCCqXY851jVDyDR/FdyoxfP+a7rk3BgIsoQ
	AD4OftQajbKom5olU3eX1jObPoFCSvQTO6yg3WLaXwgN7o5Wh/+evY4xsGscwRZ+rfwJSMnVmOz+h
	TB7G3QtTzj4kOJ34LeG76jqYzGIzqs3D6L5JGfHGC0DKYCN0vwaDfQY19Ab5PN4WIcqgFWuaf7WkG
	6gXiygDzm13Ln3LCmejszBmbXZmgyrUCx1MyvDDKEQhkwEpMlv9qW6GLt5S12OCT3Z6O3PsvaeuS3
	zUSrKjDWg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ghM8D-0005Bt-W1; Wed, 09 Jan 2019 22:15:25 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghM82-0004xo-7C
 for linux-riscv@lists.infradead.org; Wed, 09 Jan 2019 22:15:20 +0000
Received: by mail-pg1-x541.google.com with SMTP id g189so3905454pgc.5
 for <linux-riscv@lists.infradead.org>; Wed, 09 Jan 2019 14:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=d2Ibfq/kWCaitgycAn562AQ9eeLheTO8tI2f2YqFmvU=;
 b=k4LdLoG9IHDAx7IQkC0eay2ohC/UvPIC/ifqkl+6FjnjUoqCDaRdm6VjjDplYmP/Uf
 VmsqBebhMQc7L6AilqoD03WU+PSmOZMdNsc8abMRZ3T2GGKUriTEBMzA5Lh8hmftYH9v
 bZ/HEu1H/9OiPPcxULlsEk6Xvb4aM2lmzHckcxhF8jajK2KRpRGiSzNVsTmC4AM6UDi/
 vrlXodEUZEOdz83WXV+nbAh1Q23Y6WC2iaITE8IYekG2TktAsu5w3BUCXoRF8kEMkRuG
 H3IpQVFESPv7uQBWSwIgJU+UbEUMI5jGecUBBksLVv1gaLfdsX6F9qkMzU/eHi4LjDcP
 h6bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=d2Ibfq/kWCaitgycAn562AQ9eeLheTO8tI2f2YqFmvU=;
 b=p/3eg1eT09xA1qPK0+XEQluhL/hjKHQ/vyyT34Y3aHootwIF+vuZAp77T4TRz8VbCb
 btzXZg01RdhTgZHp96tBNWPaojvp0Sn3JqQw24K3gQVFriCxQTgNxD98cIG16BXGDuKw
 IkqQq5meXPIvWrmuKoRHr4fWxLICTHAe4o4HDdI0vsfOSFL8tCbSr607pgXnMLRRnXtY
 jnbFgWcBiF54dw1HUecrshUDG2fX8tJ+0vGQL40+9U+GDWlb2FNG/rFGv1c04TnYuhrw
 E3BkyWuDXLXgKqGcpQUh0HhOAG/n2x2Wqskd3yHTNE07/i6zU/W5/zxYFFPGlGRTIstu
 5ngw==
X-Gm-Message-State: AJcUukc+eAUYdd71d7QYIZJFAeBZ2i8lMdbLjKEPJlR5tmwO2AwAxsXz
 mITdA1PTzJRXS6yOuPDco7bJGw==
X-Google-Smtp-Source: ALg8bN7kndK/t+MnWm6mUgX+ItjmmuX9D+RwHNksaXHLekJVu+RmMt1185wQ2u5o3jbpZ8P6WG0kmQ==
X-Received: by 2002:a63:a401:: with SMTP id c1mr4872224pgf.403.1547072113498; 
 Wed, 09 Jan 2019 14:15:13 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id m20sm89164895pgv.93.2019.01.09.14.15.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 09 Jan 2019 14:15:12 -0800 (PST)
Date: Wed, 09 Jan 2019 14:15:12 -0800 (PST)
X-Google-Original-Date: Wed, 09 Jan 2019 14:14:27 PST (-0800)
Subject: Re: [PATCH 0/3] Hugetlbfs support for riscv
In-Reply-To: <91664ec7-d148-1c0a-8d1a-82815c5c7f6a@oracle.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: mike.kravetz@oracle.com
Message-ID: <mhng-fc16a975-cefa-45b3-b3d0-2d763cdd9614@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190109_141514_655508_A94348F6 
X-CRM114-Status: GOOD (  23.92  )
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
Cc: aou@eecs.berkeley.edu, catalin.marinas@arm.com, ndesaulniers@google.com,
 linux-riscv@lists.infradead.org, aghiti@upmem.com, atish.patra@wdc.com,
 akpm@linux-foundation.org, mingo@kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 09 Jan 2019 11:23:22 PST (-0800), mike.kravetz@oracle.com wrote:
> On 12/9/18 10:21 PM, Alexandre Ghiti wrote:
>> This series introduces hugetlbfs support for both riscv 32/64. Riscv32
>> is architecturally limited to huge pages of size 4MB whereas riscv64 has
>> 2MB/1G huge pages support. Transparent huge page support is not
>> implemented here, I will submit another series later.
>
> Thanks for doing this.
>
> Since patches only touch riscv specific code, I did not look too closely
> and do not feel qualified to offer an opinion as to whether they are correct
> for the architecture.o

Sorry about that.  These appear to have missed by inbox somehow.  I think they 
did manage to get caught by patchwork

    https://patchwork.kernel.org/cover/10720635/

I'll take a look...

> With that said, the patches do look reasonable with a few comments below.
>
>> CMA or (MEMORY_ISOLATION && COMPACTION) must be enabled so that boot
>> reserved gigantic pages can be freed: indeed, one can reduce the number
>> of huge pages by calling free_gigantic_pages which in turn calls
>> free_contig_range, defined only with those configs defined.
>> However I don't see any strong dependency between free_contig_range
>> and those configs, maybe we could allow hugetlbfs users to free boot
>> reserved hugepages without those configs activated, I will propose
>> something if Mike Kravetz agrees.
>
> Yes, that should be modified.  I think it would be a simple matter of moving
> free_contig_range out of that ifdef block.  If you would like, I can submit
> a patch for that.
>
> Somewhat related, I do not think your patches enable dynamic allocation of
> gigantic pages.  Not sure if that was an oversight or conscious decision.
> I am not sure this is a highly used feature, but if you can do it on riscv
> then why not?
>
> Another 'missing feature' in your patches is PMD sharing.  This feature if
> only of value for BIG shared hugetlbfs mappings.  DB folks like it.  As
> mentioned above, I do not know much about riscv so I do not know if this
> might be of use to potential users.
>
>> - libhugetlbfs testsuite on riscv64/1G:
>>   - brk_near_huge triggers an assert in malloc.c, does not on x86.
>>   - mmap-gettest, mmap-cow: testsuite passes the number of default free
>>     pages as parameters and then fails for 1G which is not the default.
>>     Otherwise succeeds when given the right number of pages.
>>   - map_high_truncate_2 fails on x86 too: 0x60000000 is not 1G aligned
>>     and fails at line 694 of fs/hugetlbfs/inode.c.
>>   - heapshrink on 1G fails on x86 too, not investigated.
>>   - counters.sh on 1G fails on x86 too: alloc_surplus_huge_page returns
>>     NULL in case of gigantic pages.
>>   - icache-hygiene succeeds after patch #3 of this series which lowers
>>     the base address of mmap.
>>   - fallocate_stress.sh on 1G never ends, on x86 too, not investigated.
>
> In general, libhugetlbfs tests seem to have issues with anything besides
> default huge page size.  You encountered that and noted that tests break
> for 1G pages on x86 as well.  Cleaning all that up has been on my todo list
> for years, but there always seems to be something of higher priority. :(

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
