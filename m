Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201F0606A324
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Nov 2026 18:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yRftn7qm;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r/2GsE11
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=psT5nRVvd+ZhJLV4LO+mTiuTAzJATBp4PBh2snLZHz4=; b=yRftn7qm3dpF4ZI+w8kXxaNviz
	KSJ6J3bryAcE4lxkVurAM3p4motW2oALDGyY5hKonXJKB7E5vOWq7CxtKpsfFMwd0FYztwmuzF8/r
	IInGolaGcxLFfn6Dcr4l6IBRVGrwYBMn4O2x9Rbnf1GuGf22YzIs4Lxx7wmI2wZ4U07CrjUVu+xYC
	dq/o06PD6KVrmjEuaAIFg4OI34/PDIZ4/n2M0v4xD/tYLIyy8NyskLWtDOYh0qdojNvFQOXwVbZ6V
	dCwVHO73xcyHLkw1qmUQsW7l28TT9sMB9LZlLIZo8frHiJRSZnZ5yfvQFT0gdKZphmB36jHybFYDd
	3jzp+s/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU6TE-0000000Cvxh-2d6b;
	Thu, 19 Nov 2026 18:02:52 +0000
Received: from mail-pi2-x09.google.com ([2607:f8b0:4864:3a::9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU6TB-0000000Cvwq-3VLB
	for linux-riscv@lists.infradead.org;
	Thu, 19 Nov 2026 18:02:51 +0000
Received: by mail-pi2-x09.google.com with SMTP id 41be03b00d2f7-cdd9d0d40a4so13893a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 19 Nov 2026 10:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795111369; x=1795716169; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=InfsSwOKE1v6TV2NrfByqErpltfDYpKmhyEWW16r+Go=;
        b=r/2GsE11cCM8CnVHF/9W2rtIrc5h1UNtDLmp3dYH/K1XmWM5lSo0ySZOgFwHTFOJ51
         VHkim0gD7X6fGWTdk9iof2SEVxAVB1KnhEDPE+TpsGFdL36kqYHmZKIoSeQUmsP+eA+W
         SyEMA4em0lTjmsN0JghvcwBR5bCUQctnzdSUP3ls4DH8TrkEGktsLMxDUJQHhqj7Kkvv
         Xft26cr3LjQC1/mTCl+T5UsZC2ZNXTJ0JfTPjNd9arPS876YfVEspgM/7JdMz5ks8mYb
         faxjas4+vIzS2XpBHTvkpoW/cVfkHfVHzbey+3tGQbDCFOZKvZXwwzOFyoSY3ayZMB2s
         ot9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795111369; x=1795716169;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=InfsSwOKE1v6TV2NrfByqErpltfDYpKmhyEWW16r+Go=;
        b=XkuXNOtZFj6tN4Zs/noshW6aBCpV88RP3HznjUPtlosRoNjBcXplvfkavd0sZDCVr9
         8l384uzcBnSaQ0sigA/+af7xFRJw5CEQuNryLreMeiYWvtSMnAF4vWl+BrQGCJGslVZB
         Hd+nwxqfqbp4g/l4L46zJ3B+ezogHXI99e46bgxWk+fsRnQ/UOPUtxjaRpsrnk2e5gbF
         xVFiCQYnWrX8fNfTmn6YEKcxlLob6MwrKOAq/qj+kAdPWHiR3OK4E67g7YjRZw2BPe+0
         HqtAaLXv4UZXaUqm2g4GdfSyWUBcrMxORWtPGjIrPrwo66W/8BeUZDGbxBWXrmCUBiWW
         NDwg==
X-Forwarded-Encrypted: i=1; AL+hErHJFHPapr2uhbWMyfuAKQnQcYhcZKDp5/TUS38edtejZORei1GYy3UMAiuVns/4DxjxQwXDWPQ8kKulPQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z+iyFVhrE84fl4NCBjkb4OqQkEQoMhlg4IyJud9/C+D+4zr/+AK
	F39Y7ACOAYQ0Hhn+A2ddl9nIcfvCM5myQltAbGrVl4S3YTmOM557ft8k
X-Gm-Gg: AYBFou2WB/c7r8h+OUJHCyr6SWwuEde2QHwXC7q3493CvA7zw5dlASOhOhqYmZW6fca
	XrpiqTrQe+IZNO+riaV8UfWa+Cjvi+szv+L8TUvhYbYSyvJ1LEKQjvxcQOAIHRFLsjs/QJYyz9P
	K7x4NYBcHH43u20sNgQpd1ivP/854IacyIGbiqKA52fF6oiEaK5mNXNkudeGn/D+rIh1mtKrLa5
	rOgWMtR5+Iqm8/2pLrA5U8fKEdbWkr4vByCPqpnxqQlB0nT22OTQAfBdw1nkrnjI8ZKy+atcjI1
	pSl75BXvdSRqNHSjO/eMRpVeYDX9EAhiV7w0byJMHtEd0v1qA6McXeBBq5REMtMho4p0UEN7pXC
	iQfnkSS9gVhL9csiCSK8WY308uxE9A0KYiiluAQ6b5sbQwpOyvQD3IbGwiinLjDaseM6TzBBS8a
	DET53iUoyy/F0ZwtNIOlDfmkb5rsOi7p13wjF7u2V8RiKNRwoS4Ykm7M5DpL+EZewXAEvfdKhEy
	+BiRNCyX9EHPdNMRPlYgzHN0JJNNyznuHZErq8+o150qt7CF16c16R/8UibyPWT5cr/WeDuF/2g
	yI7Zx9WtOcQaweIN8QUtS3juXqLuwlQk13gDbcamf2sUxgtanNGi0VfbzbCcY2e3PnI2
X-Received: by 2002:a05:6a00:4c15:b0:8a0:73d7:aa7f with SMTP id d2e1a72fcca58-8c87ca50568mr392685b3a.41.1795111368332;
        Thu, 19 Nov 2026 10:02:48 -0800 (PST)
Received: from [192.168.50.100] ([114.252.97.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873b27900sm258038b3a.47.2026.11.19.10.02.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 10:02:47 -0800 (PST)
Message-ID: <23b033cb-1b98-48cf-a089-4e710dfe3e15@gmail.com>
Date: Fri, 20 Nov 2026 02:02:00 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 05/10] iommu/riscv: support GSCID and GVMA invalidation
 command
To: fangyu.yu@linux.alibaba.com, gong.shuai@sanechips.com.cn
Cc: alex@ghiti.fr, andrew.jones@linux.dev, anup@brainfault.org,
 aou@eecs.berkeley.edu, atish.patra@linux.dev, baolu.lu@linux.intel.com,
 guoren@kernel.org, iommu@lists.linux.dev, jgg@nvidia.com, jgg@ziepe.ca,
 joerg.roedel@amd.com, joro@8bytes.org, jroedel@suse.de,
 kevin.tian@intel.com, kvm-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 nutty.liu@hotmail.com, palmer@dabbelt.com, pjw@kernel.org,
 robin.murphy@arm.com, skhawaja@google.com, tanchi25@mails.ucas.ac.cn,
 tomasz.jeznach@linux.dev, vasant.hegde@amd.com, will@kernel.org,
 zong.li@sifive.com
References: <20261104092111.119394-1-gong.shuai@sanechips.com.cn>
 <20261104112712.68199-1-fangyu.yu@linux.alibaba.com>
From: Gong Shuai <gsh517025@gmail.com>
In-Reply-To: <20261104112712.68199-1-fangyu.yu@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_100249_909627_4C9702B2 
X-CRM114-Status: GOOD (  20.92  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/4/2026 7:27 PM, fangyu.yu@linux.alibaba.com wrote:
>>Hi Fangyu,
>>
>>> From: Zong Li <zong.li@sifive.com>
>>>
>>> This patch adds a ID Allocator for GSCID and a wrap for setting up
>>> GSCID in IOTLB invalidation command.
>>>
>>> Set up iohgatp to enable second stage table and flush stage-2 table if
>>> the GSCID is set.
>>>
>>> The GSCID of domain should be freed when release domain. GSCID will be
>>> allocated for parent domain in nested IOMMU process.
>>>
>>> Signed-off-by: Zong Li <zong.li@sifive.com>
>>> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>>> Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
>>> ---
>>>  drivers/iommu/riscv/iommu-bits.h |  7 ++++
>>>  drivers/iommu/riscv/iommu.c      | 62 ++++++++++++++++++++++++++------
>>>  2 files changed, 58 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/drivers/iommu/riscv/iommu-bits.h b/drivers/iommu/riscv/iommu-bits.h
>>> index f2ef9bd3cde9..65d1f2250011 100644
>>> --- a/drivers/iommu/riscv/iommu-bits.h
>>> +++ b/drivers/iommu/riscv/iommu-bits.h
>>> @@ -720,6 +720,13 @@ static inline void riscv_iommu_cmd_inval_vma(struct riscv_iommu_command *cmd)
>>>  	cmd->dword1 = 0;
>>>  }
>>>
>>> +static inline void riscv_iommu_cmd_inval_gvma(struct riscv_iommu_command *cmd)
>>> +{
>>> +	cmd->dword0 = FIELD_PREP(RISCV_IOMMU_CMD0_OPCODE, RISCV_IOMMU_CMD_IOTINVAL_OPCODE) |
>>> +		      FIELD_PREP(RISCV_IOMMU_CMD0_FUNC, RISCV_IOMMU_CMD_IOTINVAL_FUNC_GVMA);
>>> +	cmd->dword1 = 0;
>>> +}
>>> +
>>>  static inline void riscv_iommu_cmd_inval_set_addr(struct riscv_iommu_command *cmd,
>>>  						  u64 addr)
>>>  {
>>> diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
>>> index 918fce4aa8c4..5546dfcd976c 100644
>>> --- a/drivers/iommu/riscv/iommu.c
>>> +++ b/drivers/iommu/riscv/iommu.c
>>> @@ -49,6 +49,10 @@
>>>  static DEFINE_IDA(riscv_iommu_pscids);
>>>  #define RISCV_IOMMU_MAX_PSCID		(BIT(20) - 1)
>>>
>>> +/* IOMMU GSCID allocation namespace. */
>>> +static DEFINE_IDA(riscv_iommu_gscids);
>>> +#define RISCV_IOMMU_MAX_GSCID		(BIT(16) - 1)
>>> +
>>>  /* Device resource-managed allocations */
>>>  struct riscv_iommu_devres {
>>>  	void *addr;
>>> @@ -842,6 +846,7 @@ struct riscv_iommu_domain {
>>>  	struct list_head bonds;
>>>  	spinlock_t lock;		/* protect bonds list updates. */
>>>  	int pscid;
>>> +	int gscid;
>>>  };
>>>  PT_IOMMU_CHECK_DOMAIN(struct riscv_iommu_domain, riscvpt.iommu, domain);
>>>
>>> @@ -1004,7 +1009,7 @@ static void riscv_iommu_tlbi_calc(struct riscv_iommu_tlbi *tlbi,
>>>  }
>>>
>>>  static void riscv_iommu_iotlb_inval_iommu(struct riscv_iommu_device *iommu,
>>> -					  int pscid,
>>> +					  int pscid, int gscid,
>>>  					  struct riscv_iommu_tlbi *tlbi)
>>>  {
>>>  	bool use_nl = tlbi->non_leaf &&
>>> @@ -1012,8 +1017,13 @@ static void riscv_iommu_iotlb_inval_iommu(struct riscv_iommu_device *iommu,
>>>  	struct riscv_iommu_command cmd;
>>>  	unsigned int i;
>>>
>>> -	riscv_iommu_cmd_inval_vma(&cmd);
>>> -	riscv_iommu_cmd_inval_set_pscid(&cmd, pscid);
>>> +	if (gscid) {
>>> +		riscv_iommu_cmd_inval_gvma(&cmd);
>>> +		riscv_iommu_cmd_inval_set_gscid(&cmd, gscid);
>>> +	} else {
>>> +		riscv_iommu_cmd_inval_vma(&cmd);
>>> +		riscv_iommu_cmd_inval_set_pscid(&cmd, pscid);
>>> +	}
>>
>>As I understand it, the same choice is needed in
>>riscv_iommu_bond_unlink().
>>
>>The missing GVMA command does not break anything today, because every
>>caller of bond_unlink() runs iodir_update() just before it, and that
>>already sends the GVMA for the old GSCID. But depending on that
>>ordering seems fragile, and the comment in bond_unlink(), "invalidate
>>all cached entries for domain's PSCID", is no longer true now that we
>>have S2 domains.
>>
> 
> There is no functional issue with the current code, since
> iodir_update() already performs the required invalidation.
> 
> That said, as this series adds S2 domain support,
> bond_unlink() should indeed be updated accordingly.
> Good catch.

Hi Fangyu,

I've included this code in patch 10 of the v3 nested series [1].

BTW, if you have time, would you mind reviewing the nested series?
I'd greatly appreciate your help.

[1] https://lore.kernel.org/linux-riscv/20261119132744.396426-11-gong.shuai@sanechips.com.cn/

Thanks,
Shaui

> 
> Thanks,
> Fangyu
> 
>>The change, if you think it is needed, fits better in the last patch,
>>"iommu/riscv: Add IOTINVAL.GVMA invalidations". I am replying here
>>only because the code is very similar.
>>
>>Thanks,
>>Shuai
>>
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
