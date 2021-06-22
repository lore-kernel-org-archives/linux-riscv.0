Return-Path: <SRS0=VH9+=LQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 119A9C2B9F4
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Jun 2021 17:45:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF065611CE
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Jun 2021 17:45:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF065611CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=codethink.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1tsS4oGDP6eYU4V6vXcPHLLz9T+ZqwZaHRGx1F0lniE=; b=O2nM6U4XwVBG/1n+ukVACETE7x
	A1l9OmFdfuDSprZITIrliTuazXoQHhsy7bs1a9uuiMAxFbawxSayogrDWC/9fwB5ZVbYv2Yz/G0DT
	LD7ij4i1vAWzMQ+Qg1p5NXzdTsSiqnCEl4hviC1eJZyJ1dRX9CBHXMjZgDp1CfSOIi21/M7ZuZlAy
	8hXSE2n/w9ynduqLBeNAllCk1ih/Hi4oyTGr3ws1cFHrKdJlgjMW/tXBy9LnEknUNKbsFKtydRkml
	Vm6RviClE9TUlOmZBZQK5tIQZfPq0UIcYBVd5IV/s2fBbMFF4eLnCyhwSliDywfi06Wmsqxtsm2Vk
	K0UP7JpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvkT5-00850w-ND; Tue, 22 Jun 2021 17:45:47 +0000
Received: from imap2.colo.codethink.co.uk ([78.40.148.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvkT2-00850K-UC
 for linux-riscv@lists.infradead.org; Tue, 22 Jun 2021 17:45:46 +0000
Received: from cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net
 ([86.15.83.122] helo=[192.168.0.18])
 by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
 id 1lvkSw-0000OM-AE; Tue, 22 Jun 2021 18:45:38 +0100
Subject: Re: [PATCH v2 0/5] riscv: improving uaccess with logs from network
 bench
To: Akira Tsukamoto <akira.tsukamoto@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <5a5c07ac-8c11-79d3-46a3-a255d4148f76@gmail.com>
 <e7d5f98b-5e0d-19b3-08f5-a7b49d542a85@codethink.co.uk>
 <f54ec904-2bf5-0c29-d467-7465993d5d6b@gmail.com>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <a222f892-a2bc-c531-d17e-3ec2c8708fcd@codethink.co.uk>
Date: Tue, 22 Jun 2021 18:45:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <f54ec904-2bf5-0c29-d467-7465993d5d6b@gmail.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_104545_028802_C4A57C90 
X-CRM114-Status: GOOD (  18.78  )
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

On 22/06/2021 13:05, Akira Tsukamoto wrote:
> On 6/22/2021 5:30 PM, Ben Dooks wrote:
>> On 19/06/2021 12:21, Akira Tsukamoto wrote:
>>> Optimizing copy_to_user and copy_from_user.
>>>
>>> I rewrote the functions in v2, heavily influenced by Garry's memcpy
>>> function [1].
>>> The functions must be written in assembler to handle page faults manually
>>> inside the function.
>>>
>>> With the changes, improves in the percentage usage and some performance
>>> of network speed in UDP packets.
>>> Only patching copy_user. Using the original memcpy.
>>>
>>> All results are from the same base kernel, same rootfs and same
>>> BeagleV beta board.
>>>
>>> Comparison by "perf top -Ue task-clock" while running iperf3.
>>
>> I did a quick test on a SiFive Unmatched with IO to an NVME.
>>
>> before: cached-reads=172.47MB/sec, buffered-reads=135.8MB/sec
>> with-patch: cached-read=s177.54Mb/sec, buffered-reads=137.79MB/sec
>>
>> That was just one test run, so there was a small improvement. I am
>> sort of surprised we didn't get more of a win from this.
>>
>> perf record on hdparm shows that it spends approx 15% cpu time in
>> asm_copy_to_user. Does anyone have a benchmark for this which just
>> looks at copy/to user? if not should we create one?
> 
> Thanks for the result on the Unmatched with hdparm. Have you tried
> iperf3?

I will see if there is iperf3 installed. I've not done much other than
try booting it and then try booting it with a kernel i've built from
upstream.

> The 15% is high, is it before or with-patch?

Can't remember, I did this more to find out if the copy to/from user
was going to show up in the times for hdparm.

> Akira
> 


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
