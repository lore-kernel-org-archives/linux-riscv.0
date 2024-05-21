Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F0E8C25B78
	for <linux-riscv@archiver.kernel.org>; Tue, 21 May 2024 15:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZwE2vWf4J5dIGb4xf0B6TT2LaTiVMvu0fcmO4zfJTXw=; b=b2X+3Y/A7pS16j
	LAB445m9+4Kun2VuYQ7lmcEYIgVLqreGf1wQPbcbYLuB2fDm7o4vjbhicrxMz2qCIM+/w61fLM9T/
	qcNptfB9nQMDUb/m+aMjd54DayBnaUvTWcssiIeUrOmV9Y9GaEiHfz1FpgZpzCqtgo2e75CLWtqtT
	Hz/gr3ROGW6xJHW9HAb4tW8OTLEZgYuYRH1uPm8YLwYfploRD0HEoIA2RnO/VZveJFsff54jKCu99
	IbAZg380s8v0NPgSWeG5jRKopygd2bMWGc9iS5uZJ2CqgJoxX7J/DBiMCLkYcfwmZTWohojAjtDFM
	il52sU8zCaxpHk1f7gfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9RXk-00000000MvU-45M6;
	Tue, 21 May 2024 15:36:48 +0000
Received: from out0-201.mail.aliyun.com ([140.205.0.201])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9RXg-00000000MrZ-3KUF
	for linux-riscv@lists.infradead.org;
	Tue, 21 May 2024 15:36:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=antgroup.com; s=default;
	t=1716305797; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=BsUOCl1wZm20I4sMYgfdQkLnm5pLpgfzJ1P84WVKH8k=;
	b=NeLnc5xi7JQWW0zvPfktDPaYQa3TByKwliCOjY94VEn7jtsXQc7FAL1PRwuLVpfw3zgFzELGxP6jBiuwgFnT9PUw+P6MpCoIOOCbzfZ4HK4pO/pfGduBmHqQ1U2tdp1DEx8QnXrmmhlNg6o7zkDEnI8dlgi1gcamun+N6lXRg9I=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033055230028;MF=libang.li@antgroup.com;NM=1;PH=DS;RN=15;SR=0;TI=SMTPD_---.XjOK41._1716305793;
Received: from 30.236.49.195(mailfrom:libang.li@antgroup.com fp:SMTPD_---.XjOK41._1716305793)
          by smtp.aliyun-inc.com;
          Tue, 21 May 2024 23:36:35 +0800
Message-ID: <e2646fa8-5f34-4114-b3b4-a6f2ea17d811@antgroup.com>
Date: Tue, 21 May 2024 23:36:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] mm: Add update_mmu_tlb_range()
To: David Hildenbrand <david@redhat.com>, akpm@linux-foundation.org,
 chenhuacai@kernel.org, tsbogend@alpha.franken.de, paul.walmsley@sifive.com,
 palmer@dabbelt.com, chris@zankel.net, jcmvbkbc@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 ryan.roberts@arm.com, ioworker0@gmail.com, libang.linux@gmail.com
References: <20240518074914.52170-1-libang.li@antgroup.com>
 <20240518074914.52170-2-libang.li@antgroup.com>
 <b356b558-d327-4bbc-9290-4e296877d145@redhat.com>
Content-Language: en-US
From: "Bang Li" <libang.li@antgroup.com>
In-Reply-To: <b356b558-d327-4bbc-9290-4e296877d145@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_083645_488171_EF606E0F 
X-CRM114-Status: UNSURE (   7.20  )
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

Hi David,

Thanks for you review!

On 2024/5/21 17:32, David Hildenbrand wrote:
> On 18.05.24 09:49, Bang Li wrote:
>> Added update_mmu_tlb_range(), we can batch update tlb of an
>> address range.
>>
>> Signed-off-by: Bang Li <libang.li@antgroup.com>
>> ---
> 
> The generic variant that is a NOP from patch #2 should go into this 
> patch as well.

Good point. Thanks for pointing this out.

Thanks,
Bang

> 
> Apart from that LGTM
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
