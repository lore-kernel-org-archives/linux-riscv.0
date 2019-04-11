Return-Path: <SRS0=Og1w=SN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 913CCC10F11
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 01:24:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 574722083E
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 01:24:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IwPUvMni";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="p4Vj7WYT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 574722083E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Xvv01Ie7YVmY/se9u+dsLUVuiJrwhP0v6OKnVvjhX4s=; b=IwPUvMni9vcH/HBXpB8HG8Jb2
	YrHyeHiD6b4pte4clRM0q9USXrYbEzv0FQkAf+Kx3i5Ctf9kViQ4m1BGi93ESGWuNOg4dCeF4zyCw
	MvxrDc99rON3iEPKOUOtCEn2TEzIUky0m9XxFMNLQ+j6NYVvEvAptJlaZS1lZlLwd08QoBuwmNjzq
	ZeQehIjUo5wmrRDJJmoojHa70pjSyx08ktGvqyFj5E/AN3F/qiNxGh5LGzDk8NVe1RshGRx7V7u8c
	MH6bpwf5dLIh/+LXUsTuIkjhyIEQi1rkiTiiec+MEq256sJIFjXo9+y1VPDAPeSrituCLYv1eul+l
	nrfPtae9g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEOSG-0008PT-Fm; Thu, 11 Apr 2019 01:24:40 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEOSD-0008Op-FT; Thu, 11 Apr 2019 01:24:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1554945878; x=1586481878;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=pA0mRBfr809UsIMtILZaDNSaHymF9prWU9rUYK3j3Fk=;
 b=p4Vj7WYTcxLALiHOLFW2c/NBbP26vWHsT/RNAMgekzwPbaBfxKkskMvt
 Z+HVx6zh4K0zC+/omMnA1H5EG/h4bE3Abfav3W3qfbQWec5vDHvPKLW1N
 kSWDBdvtkk+gd3bME6TcXS3ik//bwseL4WeDbPDJkEAnA9E/GoGcV2zJz
 Kt/QEm46FtmrZkMja+LE3dO8N5VY3Y0dqXPhK2iCR1sDM1ycp5PkY7jjI
 Xp+1yyEwe+qQqHpNzXiaQTxcqO4aNlZ4F0LfaDlArIb8mdvMsKaE1tfud
 w1neNyAEnNEOHiShFTux4OvGo8nRgXKZYFY826nhtaujXomKc317fUeXN Q==;
X-IronPort-AV: E=Sophos;i="5.60,335,1549900800"; d="scan'208";a="106837440"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 11 Apr 2019 09:24:35 +0800
IronPort-SDR: yPzt8gYC4sHydtgt+3xhY3f6DrrMYd3nCgDSZHKUG7vJjGDsHvTqoJo7CEodaVIskPWutYUIk0
 mxRrCS+wIDwcICWx/WRsvBduNPDsoCK14QksfEZu5+1pnZLMKFixn63Xq7bUAW/GPqlE2bIfYx
 v/CZfPCPSiKy8gnJ2zCcgzTdRHDwWhaA+JZR4LHQVCnf9cYAZUaYoTJ2vMPchGx9eCq0K7pUyA
 3vKRQl6mLqNetfQH37h4HZtmIwC+4WqI/FyYVRVY+t//G/PtNcgXQqmOuO2hblgtlZW7XYYg3X
 e21Vjuj6XMSwWqtmdtPH8TL6
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP; 10 Apr 2019 18:03:36 -0700
IronPort-SDR: GMVvRU+u3GopRRJd88Ypr+QLlpPj6Dsf4rkAf7ATqXWEHAsnPQbhDRhlsc+yYKwjXvBY8sZHwN
 pt4hyKCgHUutgE4Z13/cu4VZOYZPeHXaP5SUg41fDaQYergGVTlBLvGb9BUj20c5toRl1Ee9/G
 X/alV3CAi3uquIUbEN5XllIx4+EIPqmKXj2L+wY/23bzqcKmr5bPjnt2QIMl7BT0dDdnlKNhV/
 yPM0N9bzIzVPPwGQPWgNfFca3+kNo9hN8w/+TUzUlC1zN63ObsjbG2CwDrblBv2879rdNIg+G9
 qYg=
Received: from c02v91rdhtd5.sdcorp.global.sandisk.com (HELO [10.111.66.167])
 ([10.111.66.167])
 by uls-op-cesaip01.wdc.com with ESMTP; 10 Apr 2019 18:24:34 -0700
Subject: Re: [PATCH v4 0/5] TLB/I$ flush cleanups and improvements
To: Anup Patel <anup@brainfault.org>, Christoph Hellwig <hch@infradead.org>
References: <cover.1553647082.git.gary@garyguo.net>
 <20190410070446.GA18678@infradead.org>
 <CAAhSdy36Ukh-rCZPnyQh9y8iUi730wBuY_qGO+ctK1_L=sCU1g@mail.gmail.com>
 <20190410101141.GA29411@infradead.org>
 <CAAhSdy3rnHBbc7EO7apnLr549ohQwTFk86GL=uMFiHex2_pEhA@mail.gmail.com>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <13a2404a-a865-6a4e-10e0-6763d3c7ae6f@wdc.com>
Date: Wed, 10 Apr 2019 18:24:23 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAAhSdy3rnHBbc7EO7apnLr549ohQwTFk86GL=uMFiHex2_pEhA@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190410_182437_654338_34135CE2 
X-CRM114-Status: GOOD (  13.03  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Gary Guo <gary@garyguo.net>,
 Anup Patel <Anup.Patel@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
 "opensbi@lists.infradead.org" <opensbi@lists.infradead.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 4/10/19 3:22 AM, Anup Patel wrote:
> On Wed, Apr 10, 2019 at 3:41 PM Christoph Hellwig <hch@infradead.org> wrote:
>>
>> On Wed, Apr 10, 2019 at 02:31:04PM +0530, Anup Patel wrote:
>>>> Can you clarify the races?  I know Anup had some FIFO-order commits
>>>> in opensbi about a week ago, did they address you concerns?
>>>>
>>>> Anup, do you have performance numbers for the old opensbi vs your
>>>> implementation of the optimized TLB flushing vs this patch?
>>>
>>> Atish had posted performance numbers on his GitHub PR at:
>>> https://github.com/riscv/opensbi/pull/111
>>>
>>> These performance numbers are as follows.....
>>>
>>> Benchmark used: A microbenchmark that mmap a ramdisk (1G) and
>>> multiple threads access 50MB of memory randomly.
>>>
>>> https://github.com/westerndigitalcorporation/hmmap/blob/master/userspace/hmmap_uspace_common.c
>>>
>>> The result is averaged over 25 iterations for 8 threads on HiFive
>>> Unleashed board. In both cases around ~1M remote tlb flushes are triggered.
>>>
>>>                                   IPI               SBI            Gain
>>> Average Write Time             2.53183        2.43263           +4.34%
>>> Average Read Time             1.32198         1.24643           +6.09%
>>> Total Time                    97.7589         92.859            +5.01%
>>
>> So what does this mean?  I assume the codebases are latest(-ish)
>> opensbi and latest(-ish) kernel with the patches from Gary, and
>> IPI is with the lernel based code enabled, and SBI is with the SBI
>> calls?
> 
> Yes, this is measured using Gary's v4 patches.The IPI numbers are
> with in-kernel remote TLB flush whereas SBI numbers are with
> SBI-based remote TLB flush.
> 
> Atish's changes for remote TLB flushes are available in latest OpenSBI.
> 
> Regards,
> Anup
> 

The patch to access the tlb statistics in vmstat can be found here.

https://patchwork.kernel.org/project/linux-riscv/list/?series=103939

Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
