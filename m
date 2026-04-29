Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4293FF8875
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Apr 2026 01:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B8eWLz33YIiYfDAwmXy+uQ41hkw8r9Y8PiuXnlNJtsk=; b=C3mduT7UGMSlCB
	ifg5+UpuYbmATz6T91eF3iA2nXHAK9C2ducLXAqCLd+onNvjW78fmiuxkpv0sIheM96eDnudIKRMO
	EbQoJROq5LRxwnr31CRjwSiXVTttfj3IembkCGwLthfSPpO6nKDlbZOhOub0cI/62FVu1QCvKt6q+
	dpGJqTPWMRgXems0ITBgkT0mKlEJZR+ublA10Zcb9+TRi3tvcyUu+8WWdZ1SP/koOH/HJqMFA3Uf5
	ohvZR91ilf0/SSp4/ikj/SCQLetA1WzFi+aTJQlxTXG2PaXwv/l9bV1yYxQXkDICuVwv7veV1q7wT
	ri7FH82YkCEyV3TaRsow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHu6T-00000002kYG-0Tne;
	Wed, 29 Apr 2026 01:52:41 +0000
Received: from out30-100.freemail.mail.aliyun.com ([115.124.30.100])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHu6Q-00000002kXb-2Fyt;
	Wed, 29 Apr 2026 01:52:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1777427555; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=M1CcrdQtHn2gSvCSo6JX/03PiEKIGjscS1LiRTMKJVg=;
	b=Ai99fKM1fPPwzo0w+6ADN4/4628so65cAD343BfNbsVYirz4p60x5dx/hIUTJcpTugTbFRqoj/22Pid6k//HPYEfpOpTmPXB43NutKyY+8mruXk0YhzK2xGQNpLDSAyV1qcKwhYx4X+YY/dAqcaYUZjMTol5wk3lGh6GeVJOKLI=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=22;SR=0;TI=SMTPD_---0X1vlR.H_1777427551;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0X1vlR.H_1777427551 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 29 Apr 2026 09:52:33 +0800
From: fangyu.yu@linux.alibaba.com
To: jgg@ziepe.ca
Cc: alex@ghiti.fr,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	atish.patra@linux.dev,
	baolu.lu@linux.intel.com,
	fangyu.yu@linux.alibaba.com,
	guoren@kernel.org,
	iommu@lists.linux.dev,
	joro@8bytes.org,
	kevin.tian@intel.com,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robin.murphy@arm.com,
	skhawaja@google.com,
	tjeznach@rivosinc.com,
	vasant.hegde@amd.com,
	will@kernel.org
Subject: Re: Re: [RFC PATCH 10/11] iommupt: Add RISC-V dirty tracking PTE ops 
Date: Wed, 29 Apr 2026 09:52:27 +0800
Message-Id: <20260429015227.67909-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260428133909.GH849557@ziepe.ca>
References: <20260428133909.GH849557@ziepe.ca>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_185238_958723_02DC4DD3 
X-CRM114-Status: UNSURE (   6.47  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

>> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>> 
>> Implement the three dirty-tracking hooks required by the generic page
>> table framework for the RISC-V format:
>> 
>>   pt_entry_is_write_dirty():
>>     Check the D bit (bit 7) in the PTE.
>> 
>>   pt_entry_make_write_clean():
>>     Clear the D bit across the full contiguous range.
>> 
>>   pt_entry_make_write_dirty():
>>     Atomically set D via try_cmpxchg64() on a single PTE.
>> 
>> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>> ---
>>  drivers/iommu/generic_pt/fmt/riscv.h | 43 ++++++++++++++++++++++++++++
>>  1 file changed, 43 insertions(+)
>
>This patch should probably go earlier in your series, before adding
>the alloc_paging flags at least.
>

Agreed. I will reorder the series and place this patch earlier.

Thanks,
Fangyu

>Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
