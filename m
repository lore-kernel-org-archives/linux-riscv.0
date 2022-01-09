Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA62AC433F5
	for <linux-riscv@archiver.kernel.org>; Sun,  9 Jan 2022 17:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=qe2R2R0gyBUvFaPJj8WiOPVJ8lo3m027qHS4HrcDueg=; b=aRFfP0qpA01pJS3lvsjMbEydye
	jPCKltzC6/XZof5At62DqG2PwJwUZWb6O5r+MfcY3K4vIGwMXMiCYSAX4vMxuTo2nn5yk68OJJMp4
	qMoQ5jKQ/jxiCILQyO4gbG5nQo5udUK8Dmrv/WGhRh7EWFRoSvWztOSh9Fx5nOLstP1jLpiEDPqth
	HjmByzvyip3i3S1O0YRLFl6S5iUoaE8DggIjONi/rUEOnrCiiqptP5ktVETpMn4Tfj26uCLvvyUKF
	v7A6aGzjuIDwJCHJm5uuAu2lKNXsYmySUAqbtwffgwO69/Li/D0GR8RHNRGtRwQpb4r/OD6cXU/f+
	3lT3nT2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6cJc-008BCg-8W; Sun, 09 Jan 2022 17:49:12 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6cJZ-008BCF-He
 for linux-riscv@lists.infradead.org; Sun, 09 Jan 2022 17:49:11 +0000
Received: by mail-pl1-x62b.google.com with SMTP id n16so10182692plc.2
 for <linux-riscv@lists.infradead.org>; Sun, 09 Jan 2022 09:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=xsoAWNosIdPVJ1Fl9G5Tr80hXNfNjq7TugQVBy3FAk0=;
 b=oB5Sz94wLdR3j1q+l51Yresn0Y1jPQCTUvZzCkBx8kTi0BXQIaHv1dQCgnpM6FUhah
 cIbTMO4JJZyxU+ZPTAR3b2K5a1uRM+nG41E+pHWWFWAKnFZedM3ZvpPHeIdg7N5+GZAu
 yJM+tOEtuQ+HqNqFz7gAUdNfnS4hZBYR9nT6dnuTbFcU0jFW8HT8Gewi1SAFzkgQESz6
 GnGbP5o1zd6rN2qjM4BXIiq5U81ffSH1zsXdYGkzw0duZo6VzgahPpMfMTtpdbyNiMug
 X40PqNh0hSsRryVBLZbSbRZWvYgAxS2dGfdjIcA3Nb6ICHP2l41XspelCIPKb2wvEqnR
 VYsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=xsoAWNosIdPVJ1Fl9G5Tr80hXNfNjq7TugQVBy3FAk0=;
 b=VAuOqCnczPLzV3pDCKZiIapaBD/UL9bYEY3aRDL5oqj31V+rfufA1cufdEgt8N1WHy
 ZiCs2ZkZerj2Y2EWUHhLXAg5bZaifP37RETM2ROV6An8G5Dg2F9qPNPIdtQmUA9pKKsy
 b995bIXoI2Hf0oqfAE8MVUbGjzUUGAAM4mVYsEj87tGfg/uwWqET7sFky10oX+TgJ4/m
 Z8+heKJH+TrwmjluJBTjxCcnilRP3DEHEMpndRpYhOw/uEGTiXMh+WMtIA5Yxqre3RCs
 qYTBYbu6O3nE6LXsNBssbmIsHiMMhfM6KsnemzeaxawR9hfaQB1GcTQIiHj33waPUy91
 vPrw==
X-Gm-Message-State: AOAM531KfakcEwbAYyldQNQSToS9jDcZNfO1fQEShpV7gQC27TsqUgmo
 BOHYWT6JLZfAgfOrSC3crnfCbg==
X-Google-Smtp-Source: ABdhPJzLR2V3yUS3diDRA3uXEy46KKw/VEQ1VoyJDxcEBGTsI1UFlJLGwKJ/AmQ1aXC3HVOqqwc+Yw==
X-Received: by 2002:a17:90b:4b8d:: with SMTP id
 lr13mr26715780pjb.0.1641750547751; 
 Sun, 09 Jan 2022 09:49:07 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id 20sm507953pge.68.2022.01.09.09.49.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 09:49:07 -0800 (PST)
Date: Sun, 09 Jan 2022 09:49:07 -0800 (PST)
X-Google-Original-Date: Sun, 09 Jan 2022 09:48:38 PST (-0800)
Subject: Re: [PATCH -next 0/2] riscv/mm: Enable THP migration
In-Reply-To: <3c9ba160-74b2-a933-e8e5-9fd5359dc2cc@huawei.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 palmerdabbelt@google.com, wangkefeng.wang@huawei.com, anup@brainfault.org,
 alex@ghiti.fr, jszhang@kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: sunnanyong@huawei.com
Message-ID: <mhng-518b6eb2-d3e2-4ff8-b960-f0598473152c@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220109_094909_674860_EB4C052F 
X-CRM114-Status: GOOD (  19.67  )
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

On Wed, 29 Dec 2021 22:45:57 PST (-0800), sunnanyong@huawei.com wrote:
> Hi Palmer,
>
> This patchset has been sent for one month ago, I was wondering if you could
>
> have a review and give a feedback please, thanks.

Sorry for being slow, the queue got long over the holidays and I'm still 
trying to dig out.  I was kind of worried about losing some bits, but I 
don't think it's actually that big of a deal -- it's not like there's 
really any user ABI here, aside from being able to use less swap.  If 
someone wants to fix that I'm all ears, but I don't think it's worth 
waiting.

This is on for-next.

Thanks!

> On 2021/11/23 22:06, Nanyong Sun wrote:
>> This series enables THP migration on riscv via ARCH_ENABLE_THP_MIGRATION.
>> But first this adjusts PAGE_PROT_NONE to satisfy generic memory semantics
>> like the behavior of pmd_present() and pmd_trans_huge() when in
>> THP splitting or migration.
>>
>> This feature can reduce the time of THP migration by not splits THP
>> before migration and can guarantee the pages after migration are still
>> contiguous.[1]
>>
>> I have tested the below test case on qemu based on riscv after
>> enabling this feature, the throughput of THP migration gains 13x
>> performance improvement:
>> https://github.com/x-y-z/thp-migration-bench
>>
>> I also have tested and passed the test cases under
>> tools/testing/selftests/vm.
>>
>> [1]: https://lwn.net/Articles/723764/
>>
>> Nanyong Sun (2):
>>    riscv/mm: Adjust PAGE_PROT_NONE to comply with THP semantics
>>    riscv/mm: Enable THP migration
>>
>>   arch/riscv/Kconfig                    |  1 +
>>   arch/riscv/include/asm/pgtable-bits.h |  2 +-
>>   arch/riscv/include/asm/pgtable.h      | 16 +++++++++++-----
>>   3 files changed, 13 insertions(+), 6 deletions(-)
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
