Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0043DC5B572
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Aug 2026 14:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rbM2+Q8uaiRNCswu+MBJH2oIYC5zbrb2yWjFDR12S2M=; b=acWYAsz42JdzED
	mfX745HhVHGIimSLdbXgUpwwR+8AtcJX75apEONPb/ur7o+/7y298sDT6WsrCf6tQg3cjph4XPZ8o
	rUUlNtASfcrcuFtVagujD6LaH6YZDWKZ2lb1XuKFf+ZteOT0dki0dc+L7uaeUTyOUBYnoDMQ6xK14
	s2/gcfoVPbCBVC7aZ/GbqW0MHroiDQ91J8WFiJAIyf+WGA1wW9BQ4R0TzpHEt4Y9Uao9BREKwrZF2
	xM1JDJnCxk12IRf5tCNMtarR2vAGK9gYuksFJYvdu5mF79lvMIYe7UuMY9I0WeiEoO1YKOWsOuPdz
	b9mSg0UQS7G2jA6PgcAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxn8Z-0000000Ebqs-09Ko;
	Sat, 22 Aug 2026 14:55:59 +0000
Received: from out30-110.freemail.mail.aliyun.com ([115.124.30.110])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxn8S-0000000Ebq3-2Za5
	for linux-riscv@lists.infradead.org;
	Sat, 22 Aug 2026 14:55:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1787410544; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=2ZCxDvxQ0l5oes9P6kZCTA+Nmj1at6x6MNlnmoiY7JA=;
	b=a/ztF/GLVS79BYXOmwWww97Qd6baOhg+mtf8/HOlzGLHV9hoe0Fq10ALXkEVrU7Pz0gbz9pl+J638tdASmfSR/8CxTsgksz4Cs9GxF0zBGHJ5gUGhsfH+bGXovAyB1SCnUF8mjyp1EUdEIt+tjI1Jk/iT2t1a0dpGfOtI0umP0M=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R321e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=23;SR=0;TI=SMTPD_---0X9OkhzD_1787410538;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0X9OkhzD_1787410538 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 22 Aug 2026 22:55:40 +0800
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
Subject: Re: [RFC PATCH v3 01/10] iommupt: Add RISC-V Second-stage (iohgatp) page table support 
Date: Sat, 22 Aug 2026 22:55:33 +0800
Message-Id: <20260822145533.26659-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260821135501.GB1114497@ziepe.ca>
References: <20260821135501.GB1114497@ziepe.ca>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260822_075554_060293_558B9D3C 
X-CRM114-Status: GOOD (  13.63  )
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

>> @@ -126,6 +135,15 @@ riscvpt_entry_num_contig_lg2(const struct pt_state *pts)
>>
>>  static inline unsigned int riscvpt_num_items_lg2(const struct pt_state *pts)
>>  {
>> +	/*
>> +	 * Second-stage (iohgatp) root page tables have 4x the usual number of
>> +	 * entries (2048 = 2^11 instead of 512 = 2^9) to cover the 2 extra GPA
>> +	 * bits in Sv39x4/Sv48x4/Sv57x4.  Only the root (top) level is
>> +	 * enlarged; all other levels remain at the standard 9-bit index width.
>> +	 */
>> +	if (pts_feature(pts, PT_FEAT_RISCV_S2) &&
>> +	    pts->level == pts->range->top_level)
>> +		return PT_TABLEMEM_LG2SZ - ilog2(sizeof(u64)) + 2;
>
>You shouldn't need this, see how ARMv8 is constructed which does the
>same thing. Instead
>
>static inline unsigned int armv8pt_num_items_lg2(const struct pt_state *pts)
>{
>	/*
>	 * It is not allowed to call pt_num_items_lg2() at the top level, this
>	 * API restriction is specifically an optimization avoid overheads
>	 * dealing with concatenated tables here.
>	 */
>	PT_WARN_ON(pts->level == pts->range->top_level);
>

Thanks for pointing at ARMv8 for comparison. I hadn't noticed your
newly posted patch [1], Now that I've looked at it, I agree
armv8pt_num_items_lg2() is the right way to implement this and
will follow that pattern for RISC-V in the next version.

>> @@ -272,6 +291,19 @@ riscvpt_iommu_fmt_init(struct pt_iommu_riscv_64 *iommu_table,
>>  	case 57:
>>  		pt_top_set_level(&table->common, 4);
>>  		break;
>> +	/*
>> +	 * Second-stage (iohgatp): Sv39x4 / Sv48x4 / Sv57x4.
>> +	 * The top level is the same as for the first-stage counterpart.
>> +	 */
>> +	case 41:
>> +		pt_top_set_level(&table->common, 2);
>> +		break;
>> +	case 50:
>> +		pt_top_set_level(&table->common, 3);
>> +		break;
>> +	case 59:
>> +		pt_top_set_level(&table->common, 4);
>> +		break;
>
>Are all these widths valid for both S1 and S2? It should reject
>illegal vasz..
>

Agreed, will fix. 39/48/57 are only valid for S1 and 41/50/59 are only
valid for S2 -- I'll gate each group on PT_FEAT_RISCV_S2 and reject the
other combination.

>>  struct pt_iommu_riscv_64_hw_info {
>>  	u64 ppn;
>> -	u8 fsc_iosatp_mode;
>> +	union {
>> +		/*
>> +		 * First-stage (fsc/iosatp) MODE encoding:
>> +		 *   8 = Sv39, 9 = Sv48, 10 = Sv57
>> +		 * Used to program DC.fsc.iosatp.MODE.
>> +		 */
>> +		u8 fsc_iosatp_mode;
>> +		/*
>> +		 * Second-stage (iohgatp) MODE encoding:
>> +		 *   8 = Sv39x4, 9 = Sv48x4, 10 = Sv57x4
>> +		 * Used to program DC.iohgatp.MODE.
>> +		 * The numeric values are identical to fsc_iosatp_mode;
>> +		 * the caller selects the interpretation based on domain type.
>> +		 */
>> +		u8 iohgatp_mode;
>> +	};
>
>suggest not using a union and instead have the get_info populate only
>the one correct for the fmt. It makes it slightly more robust that
>s1/s2 don't get intermixed improperly?
>

Makes sense, will drop the union in favor of two separate fields and
have riscvpt_iommu_fmt_hw_info() only fill in the one that matches the
format's stage.

Thanks,
Fangyu


>Jason

[1] https://lore.kernel.org/linux-iommu/0-v2-563ee63886f0+1209-iommupt_armv8_jgg@nvidia.com/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
