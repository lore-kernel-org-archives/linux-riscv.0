Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AC75C982D8
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Sep 2026 16:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HGsY9NZyTPYnK7tEcUBGozfHd/YPp7wG0cW++k8vagE=; b=uzFB/zFJ0LVjAY
	Q2ivOjOsE46YINhlOjhtzXSP57e8rKfdpXy2cKWoOQcwheNLYJ0kjDheorPMQ3FQ0NqBBNmnyddq3
	yd5676Plcv6VXmvvpjCZR1kFt/Kj/L1cnB6eyI7qNuOLIJwaqUScl2QC2r1cdUlNGcneDHA6RLcn+
	I1sDh6N8ysFhJFxUeE4SNnMU5OIIO+eHpgMsBp1O9H6TzdNqZo3qx/OCZ616uTc3hPTzxJt4LG98F
	wU6zIjiiTYOTA2B6SAlGAbSiKgctijBPBrSD9JwaJpdWRiJ7xShf2gF7KaiRuM2KzH//Gnupj4nw5
	ilTEAqLuCAGpCx42PZOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7b99-0000000Ey9Y-03CK;
	Fri, 18 Sep 2026 16:09:07 +0000
Received: from mail-pj2-x05.google.com ([2607:f8b0:4864:39::5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7b96-0000000Ey8u-3qpn
	for linux-riscv@lists.infradead.org;
	Fri, 18 Sep 2026 16:09:06 +0000
Received: by mail-pj2-x05.google.com with SMTP id d9443c01a7336-2d942de6574so7099925ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 18 Sep 2026 09:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789747743; x=1790352543; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sTFwCwuuJBdUqXmrDgIcnP3ObUsaQ9UCrGTYomH04hg=;
        b=T+XpI8ONZpw9nbk9e/1fnwVIPTldXbTmcMchqQoxXSL4+zCPCEAFhG10L980AMFs6j
         W+vrjvdYSOYf4/PyhD+iWP9qdKyEhMgfJZBeZET29pV8cYaWWzGdNVCD77wt//uQGaQP
         7dgX6oWAq9YCaNQis/y/iOxPKmpwzy2X3cDAPxxkaDpxzBvKMblbJkbTnII01j4jU7lA
         ZSDaXQUUCi8eEyZFZAJWK9zACNaEPVux4iQtGLDiHgB7ByIAiorJ06mWpP043v5xEshL
         EkRkxSXBdx1jfS38fdcHncuAn2+U/E4gNyVrM2ZsK1PhMocWhSGc6koyDW/OliF83GR9
         0OOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789747743; x=1790352543;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sTFwCwuuJBdUqXmrDgIcnP3ObUsaQ9UCrGTYomH04hg=;
        b=M0TsugSzjLVXP1MM3wF9gUXuHZ6vgOoNhj8XxmvQg+eF0s6F6LIUKb/lvWv8ZZCObT
         1RgzMBowA1XqBrNt1v/uqizqN2kOe9mJL1zOupAE0bixLtSTgh3ov3HUMJ4sVa11b9a6
         OXnMNhMzGlbu5m1kEFQDeRHnyZb2DXKvLyIBaj+M4cM2dZrqY2jNJvOIRRxW4+9Uu3nz
         9U346ragQhkL3rbf9r7EnxGz63Xp8Bp956OqjC55Btj17BNmndoFhi1CDD/y1BBaugGG
         9CITtzlbEfsb4X2vyUHx3PiRldK+MbEI5z1Sin98TR5ccK7+U2ncbv3OUE+E4LzCthR3
         X69A==
X-Forwarded-Encrypted: i=1; AKwUvBzusa1LoHT0nzdcPDrE/W/YZJTZEx6b09KuWf6uzaVIsJg9iOxt2nJ9UaH7CHzK3FPbRnyxFRc2dl2K/w==@lists.infradead.org
X-Gm-Message-State: AFuF++kxJfuO7VW91KHMfKoIJCrK2/+Nu2mRw+MGN6gQh1kfuk913dvi
	jXCpi64O8lca+LFsJ2oVnNxrSkQOV+iJRbMxk0bCoy3HGypqPP0OivZq
X-Gm-Gg: AYBFou19aJnFjB+35qP0rKbe7dDU1YP5zgT0bW46w/Eu74/XmAEYuW/k3B2ewWfKldY
	2j3N42nS0ZBbEEmpcfGcxl9QvQj/4A+MN1gxoHPTK5wOZk/0u/CCcAhvAz3bs1p/A829YxuIfCd
	ZOTNQoZmP6ZlDMyLWhrsL2NzvYzdoyYozX+qD1FDYh1xOGTXf/1JwSnNdbL9W9lP3EaQtWxyDMf
	GOU89BJo2oqjLiSyTAm7motusZiYVHGTFgbcx0u1gJO37BOKP+cMPq/GJnH+PapgzmAoDmzRVWQ
	gDnfkXoFPQtV5uTePNXr+pMUeml+tnkq9L+CXeEzavW0gljwr6CuE9rn3rhT3GMKWXYcwMf9lwt
	tmxWH+ScvNHeWGHBIDmj2/VwGKA2gGwuwRkdx6II7yuUFB9pxKKITdOKuA2dimxu3D/+TuIkadr
	nrSQGDjrvxcTG2dha1bZ/4qizoM/qcUPPAZMBYgsaeGynUnoG5PUB0hH1xSaJmp+6xrR6HapEXT
	L1QBA8WXnlIrG0odg==
X-Received: by 2002:a17:902:ea0c:b0:2dd:c100:7ccb with SMTP id d9443c01a7336-2ddc1007e5cmr1279195ad.71.1789747742619;
        Fri, 18 Sep 2026 09:09:02 -0700 (PDT)
Received: from [192.168.50.100] ([111.199.57.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddb76025afsm10835745ad.73.2026.09.18.09.08.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 09:09:01 -0700 (PDT)
Message-ID: <6d1bfb10-fd04-4e4e-895d-55c16fcea13f@gmail.com>
Date: Sat, 19 Sep 2026 00:08:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 04/10] iommu/riscv: use data structure instead of
 individual values
To: fangyu.yu@linux.alibaba.com
Cc: guoren@kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
 tomasz.jeznach@linux.dev, joro@8bytes.org, will@kernel.org,
 robin.murphy@arm.com, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, baolu.lu@linux.intel.com,
 jroedel@suse.de, zong.li@sifive.com, andrew.jones@oss.qualcomm.com,
 anup@brainfault.org, jgg@nvidia.com, jgg@ziepe.ca, kevin.tian@intel.com,
 atish.patra@linux.dev, skhawaja@google.com, vasant.hegde@amd.com,
 joerg.roedel@amd.com, gong.shuai@sanechips.com.cn
References: <20260915032828.11250-1-fangyu.yu@linux.alibaba.com>
 <20260915032828.11250-5-fangyu.yu@linux.alibaba.com>
From: Gong Shuai <gsh517025@gmail.com>
In-Reply-To: <20260915032828.11250-5-fangyu.yu@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_090905_008110_BEC98C99 
X-CRM114-Status: GOOD (  20.92  )
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

On 9/15/2026 11:28 AM, fangyu.yu@linux.alibaba.com wrote:
> From: Zong Li <zong.li@sifive.com>
> 
> The parameter will be increased when we need to set up more
> bit fields in the device context. Use a data structure to
> wrap them up.
> 
> Signed-off-by: Zong Li <zong.li@sifive.com>
> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> ---
>   drivers/iommu/riscv/iommu.c | 27 +++++++++++++++++----------
>   1 file changed, 17 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
> index a6c8307e82ea..c5b6214ee672 100644
> --- a/drivers/iommu/riscv/iommu.c
> +++ b/drivers/iommu/riscv/iommu.c
> @@ -1165,7 +1165,7 @@ static void riscv_iommu_iodir_iotinval(struct riscv_iommu_device *iommu,
>    * interim translation faults.
>    */
>   static void riscv_iommu_iodir_update(struct riscv_iommu_device *iommu,
> -				     struct device *dev, u64 fsc, u64 ta)
> +				     struct device *dev, struct riscv_iommu_dc *new_dc)
>   {
>   	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
>   	struct riscv_iommu_dc *dc;
> @@ -1204,10 +1204,10 @@ static void riscv_iommu_iodir_update(struct riscv_iommu_device *iommu,
>   	for (i = 0; i < fwspec->num_ids; i++) {
>   		dc = riscv_iommu_get_dc(iommu, fwspec->ids[i]);
>   		tc = READ_ONCE(dc->tc);
> -		tc |= ta & RISCV_IOMMU_DC_TC_V;
> +		tc |= new_dc->ta & RISCV_IOMMU_DC_TC_V;

According to SPEC 3.1.3.3, the "V bit" does not exist in DC.ta.
This should be a convention from when the iodir_update() function
did not yet use `struct riscv_iommu_dc` as a parameter, using bit 0
of DC.ta to indicate that the DC is valid. Now that iodir_update()
receives the complete dc, it can directly access DC.tc.V, so this
convention should no longer be necessary and will cause confusion.

>   
> -		WRITE_ONCE(dc->fsc, fsc);
> -		WRITE_ONCE(dc->ta, ta & RISCV_IOMMU_PC_TA_PSCID);
> +		WRITE_ONCE(dc->fsc, new_dc->fsc);
> +		WRITE_ONCE(dc->ta, new_dc->ta & RISCV_IOMMU_PC_TA_PSCID);

`RISCV_IOMMU_PC_*` should be replaced with `RISCV_IOMMU_DC_*` for
readability. There are several other similar places in this file
that are unrelated to Process Context or PASID but use the *PC* macros.


Thanks,
Shuai

>   		/* Update device context, write TC.V as the last step. */
>   		dma_wmb();
>   		WRITE_ONCE(dc->tc, tc);
> @@ -1288,22 +1288,22 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
>   	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
>   	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
>   	struct pt_iommu_riscv_64_hw_info pt_info;
> -	u64 fsc, ta;
> +	struct riscv_iommu_dc dc = {0};
>   
>   	pt_iommu_riscv_64_hw_info(&domain->riscvpt, &pt_info);
>   
>   	if (!riscv_iommu_pt_supported(iommu, pt_info.fsc_iosatp_mode))
>   		return -ENODEV;
>   
> -	fsc = FIELD_PREP(RISCV_IOMMU_PC_FSC_MODE, pt_info.fsc_iosatp_mode) |
> +	dc.fsc = FIELD_PREP(RISCV_IOMMU_PC_FSC_MODE, pt_info.fsc_iosatp_mode) |
>   	      FIELD_PREP(RISCV_IOMMU_PC_FSC_PPN, pt_info.ppn);
> -	ta = FIELD_PREP(RISCV_IOMMU_PC_TA_PSCID, domain->pscid) |
> +	dc.ta = FIELD_PREP(RISCV_IOMMU_PC_TA_PSCID, domain->pscid) |
>   	     RISCV_IOMMU_PC_TA_V;
>   
>   	if (riscv_iommu_bond_link(domain, dev))
>   		return -ENOMEM;
>   
> -	riscv_iommu_iodir_update(iommu, dev, fsc, ta);
> +	riscv_iommu_iodir_update(iommu, dev, &dc);
>   	riscv_iommu_bond_unlink(info->domain, dev);
>   	info->domain = domain;
>   
> @@ -1378,9 +1378,12 @@ static int riscv_iommu_attach_blocking_domain(struct iommu_domain *iommu_domain,
>   {
>   	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
>   	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
> +	struct riscv_iommu_dc dc = {0};
> +
> +	dc.fsc = RISCV_IOMMU_FSC_BARE;
>   
>   	/* Make device context invalid, translation requests will fault w/ #258 */
> -	riscv_iommu_iodir_update(iommu, dev, RISCV_IOMMU_FSC_BARE, 0);
> +	riscv_iommu_iodir_update(iommu, dev, &dc);
>   	riscv_iommu_bond_unlink(info->domain, dev);
>   	info->domain = NULL;
>   
> @@ -1400,8 +1403,12 @@ static int riscv_iommu_attach_identity_domain(struct iommu_domain *iommu_domain,
>   {
>   	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
>   	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
> +	struct riscv_iommu_dc dc = {0};
> +
> +	dc.fsc = RISCV_IOMMU_FSC_BARE;
> +	dc.ta = RISCV_IOMMU_PC_TA_V;
>   
> -	riscv_iommu_iodir_update(iommu, dev, RISCV_IOMMU_FSC_BARE, RISCV_IOMMU_PC_TA_V);
> +	riscv_iommu_iodir_update(iommu, dev, &dc);
>   	riscv_iommu_bond_unlink(info->domain, dev);
>   	info->domain = NULL;
>   


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
