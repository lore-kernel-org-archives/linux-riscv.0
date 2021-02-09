Return-Path: <SRS0=3nDB=HL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1D2FC433E0
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Feb 2021 00:56:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44C1F64E77
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Feb 2021 00:56:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 44C1F64E77
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8FMIo5qyl6aBZVpZAgkwpWmUDinmT9Ks45GBHaRxlSE=; b=RlUhfzBu1sldc7N/ACByF8ked
	ltydL3crS6rlVqw818u5FjkMln/r6DN8tOQ356J2pw1YPP5IZfpimJX99PRYA8VSZwrLlB11p0RlE
	nB61gBu44y1K0UB5kt7/S112yMbbkEFDwlpqzN15Slf1hcXR0AVsWe/4yjHyQTAt981KaKKfQuYW/
	nQQv4XJcBjKk92JRDM6XixkSJRdzpwMxSnhJZBhoX2/3MOC2N1pFrlNWuci+wGCndseqR6x1PBt2N
	InYlJFAUWGb4qAVwZt65MHLQFGCjpjVBWM8YdECEIBEnxAgxFD5eXdTsH1II/sNdj2/OHoY4DjYpE
	L6+YRxd7w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9HKD-0002fQ-W2; Tue, 09 Feb 2021 00:56:18 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9HKB-0002e9-0B
 for linux-riscv@lists.infradead.org; Tue, 09 Feb 2021 00:56:16 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4DZPYt45bgzjKJ4;
 Tue,  9 Feb 2021 08:54:58 +0800 (CST)
Received: from [10.174.177.244] (10.174.177.244) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.498.0; Tue, 9 Feb 2021 08:56:00 +0800
Subject: Re: [PATCH] riscv: Cleanup setup_bootmem()
To: Atish Patra <atishp@atishpatra.org>
References: <20210207123856.141737-1-wangkefeng.wang@huawei.com>
 <CAOnJCUKdabPhU-xm4eHsG-nS5WYREkE6gG39PgdyknT=HTgeRg@mail.gmail.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <1089f7b7-071e-e5ba-699c-72133c576c03@huawei.com>
Date: Tue, 9 Feb 2021 08:55:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAOnJCUKdabPhU-xm4eHsG-nS5WYREkE6gG39PgdyknT=HTgeRg@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.174.177.244]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_195615_314921_A14E14CC 
X-CRM114-Status: UNSURE (   7.41  )
X-CRM114-Notice: Please train this message.
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
Cc: Atish Patra <atish.patra@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On 2021/2/9 6:03, Atish Patra wrote:
> On Sun, Feb 7, 2021 at 4:35 AM Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
>> After the following patches,
>>
>>    commit de043da0b9e7 ("RISC-V: Fix usage of memblock_enforce_memory_limit")
>>    commit 1bd14a66ee52 ("RISC-V: Remove any memblock representing unusable memory area")
>>    commit b10d6bca8720 ("arch, drivers: replace for_each_membock() with for_each_mem_range()")
>>
>> some logical is useless, kill the mem_start/start/end and unneed code.
>>
> /s/logical/logic
> /s/unneed/uneeded
oops, will update and send new one, thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
