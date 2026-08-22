Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF822C5B572
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Aug 2026 15:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hz2OxykBJG6I3DN2KtPtRb1uIhXFvmHAxg1Wq1JzurA=; b=QxmuSKOEEwgOgW
	/uI5SHZ0klxSf7G+NFGveK1jg9jqfCLl6e6ssCjfxnLSKuhI8gqX8yZkGm9FmOIt1PqQwn7Ec4q0m
	XgQLx9YRVhkoOrrqGprpDovCndIPIQmizLAshEx1BIfJpbh/utAcd/WB4n/jl/s0CCzRcdPQj9egw
	o6paTQYfmo6/4UW96xINeT58UFPJ6rY8BL97h1JQkCXMKPh10ss4NtTCA49jzL3xG7WJF2NO1qQEF
	5y0ANiMnJYSeA+fUBmUc7/asUPTrj9klXKcUhL/lmwf6efPEvc0yOOAp6mTNk/t4pSYndYbdIMlM1
	3FtkoePrGmVP2gbwgYlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxnEa-0000000EcIA-0kG3;
	Sat, 22 Aug 2026 15:02:12 +0000
Received: from out30-118.freemail.mail.aliyun.com ([115.124.30.118])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxnEY-0000000EcHr-0ZGN
	for linux-riscv@lists.infradead.org;
	Sat, 22 Aug 2026 15:02:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1787410928; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=wSA+U68kMi1vHAuDTRRzoLt1djKESRXXHhCMc7teURU=;
	b=Et6YiXyOy92piKVEf92ykjakg0IszkJYu2nnlr0OFc3Uq4tMXW6DxtkOtRNUkPTlnzFvTlb1lt4z3ZEHzpkvbmiBh56s2kju+Sv1dYNDyu7yoKqcZaSJlMeMvJTxpKPSKd1xRaXmyYy5Nwlwk81OnVRwON6M6Jq96JIJ/eATamE=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=23;SR=0;TI=SMTPD_---0X9Ok1h0_1787410924;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0X9Ok1h0_1787410924 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 22 Aug 2026 23:02:06 +0800
From: fangyu.yu@linux.alibaba.com
To: jgg@ziepe.ca
Cc: alex@ghiti.fr,
	andrew.jones@oss.qualcomm.com,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	atish.patra@linux.dev,
	baolu.lu@linux.intel.com,
	fangyu.yu@linux.alibaba.com,
	guoren@kernel.org,
	iommu@lists.linux.dev,
	joro@8bytes.org,
	jroedel@suse.de,
	kevin.tian@intel.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robin.murphy@arm.com,
	skhawaja@google.com,
	tomasz.jeznach@linux.dev,
	vasant.hegde@amd.com,
	will@kernel.org,
	zong.li@sifive.com
Subject: Re: [RFC PATCH v3 02/10] iommupt: Add RISC-V dirty tracking PTE ops
Date: Sat, 22 Aug 2026 23:01:57 +0800
Message-Id: <20260822150157.27501-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260821140341.GC1114497@ziepe.ca>
References: <20260821140341.GC1114497@ziepe.ca>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260822_080210_750549_7269D647 
X-CRM114-Status: UNSURE (   7.66  )
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
>>
>> diff --git a/drivers/iommu/generic_pt/fmt/riscv.h b/drivers/iommu/generic_pt/fmt/riscv.h
>> index 5692c033dbde..09581798e753 100644
>> --- a/drivers/iommu/generic_pt/fmt/riscv.h
>> +++ b/drivers/iommu/generic_pt/fmt/riscv.h
>> @@ -226,6 +226,49 @@ static inline void riscvpt_attr_from_entry(const struct pt_state *pts,
>>  }
>>  #define pt_attr_from_entry riscvpt_attr_from_entry
>
>Does this work for all stages or does it need  pt_dirty_supported ?

Good catch, no it doesn't. This patch didn't add a pt_dirty_supported(),
so it falls back to the default "always true", which isn't right --
iommu.c only sets TC.GADE and wires up dirty_ops for second-stage
domains, first-stage never gets TC.SADE set.

Thanks,
Fangyu

>
>Jason
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
