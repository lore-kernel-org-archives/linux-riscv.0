Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 896CDC982D0
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Sep 2026 05:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TQ+OgqM4P2YDGtvCwKPpSPQEeZJbJmaJbuybKgsphvA=; b=kA1ydYZUh+VNjD
	A3l1GpaeKa5tDamwP86/fsDBGpfIYb3zVGm6vNYDdB1pE5ONpc++lT4TOIpHV7R+zEs3V9Wd6pfIj
	gMN3tP+pWCReC6u6qYGG65ONI+XrQXi9CtsNbOMEhRwumrh6ttC+qG01bjebuz6ysXezdgnZjDlmk
	8v6dlpsJPOkNsc1XaRaAyGGmB+SyZPDS3a3iF10GM30+3HpezTjIhz3qiMZ5xl9SV84ANqHqzDBT6
	SYGsKe3tpWqp51WezZsRUm23qovcl3eZ5HO8zZ+Xzlq2snmMA39PS41lCIKOmScE0KE8fTpOtm9nB
	TswWFck0qsPwjyl9eEBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8A5t-0000000Gvy4-12nP;
	Sun, 20 Sep 2026 05:28:05 +0000
Received: from mail-pj2-x08.google.com ([2607:f8b0:4864:39::8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8A5p-0000000GvxG-3SFj
	for linux-riscv@lists.infradead.org;
	Sun, 20 Sep 2026 05:28:03 +0000
Received: by mail-pj2-x08.google.com with SMTP id 98e67ed59e1d1-38fd9408220so625116a91.1
        for <linux-riscv@lists.infradead.org>; Sat, 19 Sep 2026 22:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789882081; x=1790486881; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kRdyhVbDbtwWbg31SSUY067XkC3mS81pEbCoqok50kg=;
        b=It9dLZaZkpzkfZkUpnGcarpzm3xRuxJdapfsVckFDaruFkk9goB2c61Hqxo/b4Lriw
         Gv+I9gvCok+okPzp/VMoWoKygnHJufWmWo6jdYhaWNaCs71J4Wph9BhOvkFi5Nxvjw2+
         LCN2RCo5gDW670TmDDH0no2vbPOv7cE6nfuUNTp692rOiTnOhYSpnyS6n846pDczpef7
         Jyb1ErOL5/k2qFkC71KoOWkbCeMvy6alOGYxj82nlWkZlXJu5iyhdfehFLuMnwv/JtQH
         34QV5jtOwZZj927Fi790Tj5/7U4FQ006r+g1Q1Xi9bckAkICooVrBETjO4yKSILiSm5h
         0E0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789882081; x=1790486881;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kRdyhVbDbtwWbg31SSUY067XkC3mS81pEbCoqok50kg=;
        b=rk3ViRTWSU7iWuTpbaVGyDMKMOpl7PsGJpWDZdZeJZO4MYiKhEMSB3ezoZIYvB/s2K
         tUOnFPQe0a365n5AHJ4+S4yYLN2BCYXClxf/1nB0sze0EhrBToMYc/kZouzU5NsXAkkF
         4Uax1vaMzj13w94APAczRzNN7na690GbToyekBrjxjAvPLPSvv1o00aKNNAJBI1KvszA
         wUGDyuB5NJbGF8t6k1Zrq3ZffeGj2m0mFxCkGjFlT64g3jYAglNxNLhSn6ZDb2q6D70q
         poqO7prBxJDZfENjE1EODftLYOMNUnLdu3R7Vh21YpjcB4zLB/viw4if7mqo6lQNp0wm
         nvmQ==
X-Forwarded-Encrypted: i=1; AKwUvBwDiVG6KHZJHpv9of9tHRCmlO56Y/e8i6bbGc27whs4HMHOxyjukSCNaOP2u3oek4pmDUjMfSmKvszdnw==@lists.infradead.org
X-Gm-Message-State: AFuF++nxslUC7z0zqEXViKrJWO1pZX/mbG31vCtl2m/lxVNaHZZAPDaM
	o6vuk31eqmOa6ujBQebcR7QWXZTXlB+u1c0U+uIEG/65DNe+mz95TBJy
X-Gm-Gg: AYBFou1LnOmEWhZsAxq84Ba3X6Si1/+yyepREw9kiwbmfPXwtnQBRcN6q06bZANceCP
	sIiJZP13bGLeJfiLMRUZfbsbV7tzW+zaQ1rXNYE3raHjCwxekmDoh/h9slIqeaWrWgREawgttAD
	vR2OSijAF6zaPtgVR7yQR210dkiPTcMnUBimxaksVKZSQRGMFd3NHbQpAtx3hCoDXOCrJ9gE3o1
	12zuH4l9gZ/aITKUaUAGO4tERRGgHUvjelSe1YUApW5+8v3f9QOAEOkAmlzkkwpuTwsXgJm+jjJ
	Cx6s/gRba2E7Vp7P7QPW6ECqLLDBJqNpXba618YRm9zYonDzGXIZ41UUcYZI34oLwCc28F5ow+z
	QsoK8hSckhZnmaSy7DEpeL1Q2xYdvThEM5LBD2jSHZGQUlUqMTk1HUJjirZeBOP1LWt+2FpnmnG
	5m6pkRzUWTwedCETZQkXLPuq+Ih+tcMmISMN/O9WsEfkR6/sV43e3fc+AVLpDc7zp3HtRLb5yyC
	P2bgsHRDgf9AFsm
X-Received: by 2002:a17:90b:2b8e:b0:39d:f024:c7ee with SMTP id 98e67ed59e1d1-39e5500a842mr11856295a91.25.1789882080607;
        Sat, 19 Sep 2026 22:28:00 -0700 (PDT)
Received: from [192.168.50.174] ([124.64.19.40])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6cabafbasm7603098a91.10.2026.09.19.22.27.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 22:28:00 -0700 (PDT)
Message-ID: <229a6c7c-f320-40a5-b9c6-06b31a5de28a@gmail.com>
Date: Sun, 20 Sep 2026 13:27:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 04/10] iommu/riscv: use data structure instead of
 individual values
To: fangyu.yu@linux.alibaba.com
Cc: alex@ghiti.fr, andrew.jones@oss.qualcomm.com, anup@brainfault.org,
 aou@eecs.berkeley.edu, atish.patra@linux.dev, baolu.lu@linux.intel.com,
 gong.shuai@sanechips.com.cn, guoren@kernel.org, iommu@lists.linux.dev,
 jgg@nvidia.com, jgg@ziepe.ca, joerg.roedel@amd.com, joro@8bytes.org,
 jroedel@suse.de, kevin.tian@intel.com, kvm-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, pjw@kernel.org, robin.murphy@arm.com,
 skhawaja@google.com, tomasz.jeznach@linux.dev, vasant.hegde@amd.com,
 will@kernel.org, zong.li@sifive.com
References: <6d1bfb10-fd04-4e4e-895d-55c16fcea13f@gmail.com>
 <20260920030846.20403-1-fangyu.yu@linux.alibaba.com>
From: Gong Shuai <gsh517025@gmail.com>
In-Reply-To: <20260920030846.20403-1-fangyu.yu@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_222801_874890_EE147BF9 
X-CRM114-Status: GOOD (  29.02  )
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

Hi Fangyu,

On 9/20/2026 11:08 AM, fangyu.yu@linux.alibaba.com wrote:
>>Hi Fangyu,
>>
>>On 9/15/2026 11:28 AM, fangyu.yu@linux.alibaba.com wrote:
>>> From: Zong Li <zong.li@sifive.com>
>>>
>>> The parameter will be increased when we need to set up more
>>> bit fields in the device context. Use a data structure to
>>> wrap them up.
>>>
>>> Signed-off-by: Zong Li <zong.li@sifive.com>
>>> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>>> ---
>>>   drivers/iommu/riscv/iommu.c | 27 +++++++++++++++++----------
>>>   1 file changed, 17 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
>>> index a6c8307e82ea..c5b6214ee672 100644
>>> --- a/drivers/iommu/riscv/iommu.c
>>> +++ b/drivers/iommu/riscv/iommu.c
>>> @@ -1165,7 +1165,7 @@ static void riscv_iommu_iodir_iotinval(struct riscv_iommu_device *iommu,
>>>    * interim translation faults.
>>>    */
>>>   static void riscv_iommu_iodir_update(struct riscv_iommu_device *iommu,
>>> -				     struct device *dev, u64 fsc, u64 ta)
>>> +				     struct device *dev, struct riscv_iommu_dc *new_dc)
>>>   {
>>>   	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
>>>   	struct riscv_iommu_dc *dc;
>>> @@ -1204,10 +1204,10 @@ static void riscv_iommu_iodir_update(struct riscv_iommu_device *iommu,
>>>   	for (i = 0; i < fwspec->num_ids; i++) {
>>>   		dc = riscv_iommu_get_dc(iommu, fwspec->ids[i]);
>>>   		tc = READ_ONCE(dc->tc);
>>> -		tc |= ta & RISCV_IOMMU_DC_TC_V;
>>> +		tc |= new_dc->ta & RISCV_IOMMU_DC_TC_V;
>>
>>According to SPEC 3.1.3.3, the "V bit" does not exist in DC.ta.
>>This should be a convention from when the iodir_update() function
>>did not yet use `struct riscv_iommu_dc` as a parameter, using bit 0
>>of DC.ta to indicate that the DC is valid. Now that iodir_update()
>>receives the complete dc, it can directly access DC.tc.V, so this
>>convention should no longer be necessary and will cause confusion.
>>
> 
> Hi Shuai:
> 
> Thanks for the clarification.
> 
> My understanding is that `ta` here is used as a
> combined concept, not only for `DC.ta`, but also
> for `PC.ta` in this flow.
> 
> The `V` bit is only initialized when `ta` is first
> set up, so the current usage still follows the
> original design, without changing most of the
> existing logic.
> 
> The original code also has comments describing
> this behavior.

I got your point.

When fsc and ta were passed as separate raw parameters, treating
them as a combined concept was arguably reasonable, since the same
bit layout is shared between DC and PC in this path. But now that
iodir_update() takes a struct riscv_iommu_dc, I think it would be
better to keep the semantics explicit.

If PDT/PC support is added later, we can introduce a separate
struct riscv_iommu_pc parameter for the PC context, instead of
trying to make one ta/fsc cover both cases.


> Thanks,
> Fangyu
> 
>>>
>>> -		WRITE_ONCE(dc->fsc, fsc);
>>> -		WRITE_ONCE(dc->ta, ta & RISCV_IOMMU_PC_TA_PSCID);
>>> +		WRITE_ONCE(dc->fsc, new_dc->fsc);
>>> +		WRITE_ONCE(dc->ta, new_dc->ta & RISCV_IOMMU_PC_TA_PSCID);
>>
>>`RISCV_IOMMU_PC_*` should be replaced with `RISCV_IOMMU_DC_*` for
>>readability. There are several other similar places in this file
>>that are unrelated to Process Context or PASID but use the *PC* macros.
>>
> 
> My understanding is similar to the `ta` case: `fsc`
> likely refers to both `dc.fsc` and `pc.fsc` in this
> path, since some of their fields share the same bit
> layout.
Yeah, exactly, they share the same layout, so logically it's fine.

> 
> If we want to rename these for readability, I think
> that should be done in a separate patch set, rather
> than as part of this one.

Agree that it should be done in a separate patch.

Thanks,
Shuai

> 
>>
>>Thanks,
>>Shuai
>>
>>>   		/* Update device context, write TC.V as the last step. */
>>>   		dma_wmb();
>>>   		WRITE_ONCE(dc->tc, tc);
>>> @@ -1288,22 +1288,22 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
>>>   	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
>>>   	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
>>>   	struct pt_iommu_riscv_64_hw_info pt_info;
>>> -	u64 fsc, ta;
>>> +	struct riscv_iommu_dc dc = {0};
>>>
>>>   	pt_iommu_riscv_64_hw_info(&domain->riscvpt, &pt_info);
>>>
>>>   	if (!riscv_iommu_pt_supported(iommu, pt_info.fsc_iosatp_mode))
>>>   		return -ENODEV;
>>>
>>> -	fsc = FIELD_PREP(RISCV_IOMMU_PC_FSC_MODE, pt_info.fsc_iosatp_mode) |
>>> +	dc.fsc = FIELD_PREP(RISCV_IOMMU_PC_FSC_MODE, pt_info.fsc_iosatp_mode) |
>>>   	      FIELD_PREP(RISCV_IOMMU_PC_FSC_PPN, pt_info.ppn);
>>> -	ta = FIELD_PREP(RISCV_IOMMU_PC_TA_PSCID, domain->pscid) |
>>> +	dc.ta = FIELD_PREP(RISCV_IOMMU_PC_TA_PSCID, domain->pscid) |
>>>   	     RISCV_IOMMU_PC_TA_V;
>>>
>>>   	if (riscv_iommu_bond_link(domain, dev))
>>>   		return -ENOMEM;
>>>
>>> -	riscv_iommu_iodir_update(iommu, dev, fsc, ta);
>>> +	riscv_iommu_iodir_update(iommu, dev, &dc);
>>>   	riscv_iommu_bond_unlink(info->domain, dev);
>>>   	info->domain = domain;
>>>
>>> @@ -1378,9 +1378,12 @@ static int riscv_iommu_attach_blocking_domain(struct iommu_domain *iommu_domain,
>>>   {
>>>   	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
>>>   	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
>>> +	struct riscv_iommu_dc dc = {0};
>>> +
>>> +	dc.fsc = RISCV_IOMMU_FSC_BARE;
>>>
>>>   	/* Make device context invalid, translation requests will fault w/ #258 */
>>> -	riscv_iommu_iodir_update(iommu, dev, RISCV_IOMMU_FSC_BARE, 0);
>>> +	riscv_iommu_iodir_update(iommu, dev, &dc);
>>>   	riscv_iommu_bond_unlink(info->domain, dev);
>>>   	info->domain = NULL;
>>>
>>> @@ -1400,8 +1403,12 @@ static int riscv_iommu_attach_identity_domain(struct iommu_domain *iommu_domain,
>>>   {
>>>   	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
>>>   	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
>>> +	struct riscv_iommu_dc dc = {0};
>>> +
>>> +	dc.fsc = RISCV_IOMMU_FSC_BARE;
>>> +	dc.ta = RISCV_IOMMU_PC_TA_V;
>>>
>>> -	riscv_iommu_iodir_update(iommu, dev, RISCV_IOMMU_FSC_BARE, RISCV_IOMMU_PC_TA_V);
>>> +	riscv_iommu_iodir_update(iommu, dev, &dc);
>>>   	riscv_iommu_bond_unlink(info->domain, dev);
>>>   	info->domain = NULL;
>>>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
