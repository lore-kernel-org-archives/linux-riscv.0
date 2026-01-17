Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CE12C98313
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Jan 2026 04:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8nW4kFWXdqYcoyF4rLQEv7cPMDNKWXDPknsQ2mU3BPE=; b=iHpdx3R94/AD4KxlhkbMI3UgPf
	SA2zx2nQnbX5NNf74BVmLNw5nEVfZwW5OIyXl0cvjKg7KTdD6UuUv2J87tM/0UgUV8H9x2D6bPsZD
	CAkbtcZLU5ZOI90/PdK33RGWKgLMJ/CxSk1guiavLHpmOht8kY/aj1I59Z8+4qSidom2QQfGK7UOQ
	Y3Ezxetm984myILhE0+Bc8XUEOipKO1numDRNEAZL+8kZ1sC6OMwW1cYwa9nHkzZRZmEckEvjZJ7m
	ewUjFdcO2lMESiHfql0LUPol75K0c1vyElSv/qNJxfvIY1Om2TfmJkHCUGfmCnBvwiRD4+JdZ7XMr
	XmvKq0rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgxyP-0000000FBqg-2o5D;
	Sat, 17 Jan 2026 04:31:41 +0000
Received: from out30-112.freemail.mail.aliyun.com ([115.124.30.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgxyL-0000000FBpN-0eaV
	for linux-riscv@lists.infradead.org;
	Sat, 17 Jan 2026 04:31:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1768624287; h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type;
	bh=sdQdmbnFJtM7zv/9PxUEdmxzoy0jV5u+mvL7/Ga2jCI=;
	b=N4n7qIbxg1Tk8oM859gj0JZ2hPP/96AZB69UdxfLxIylKdhpCWD/7SsyY+bvq6a4YBi+ZG0UMzD/06TN1joEm6fP6VLEI4ad3VRWcEvitm9LJRwTO/ZsDNpdif/F4YuE5QdI3XDqO07eSbDuTuW470tGyTMF0Yp3TDVB+F2CSCQ=
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0WxC8X4A_1768624283 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 17 Jan 2026 12:31:24 +0800
From: fangyu.yu@linux.alibaba.com
To: andrew.jones@oss.qualcomm.com
Cc: ajones@ventanamicro.com,
	alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	fangyu.yu@linux.alibaba.com,
	guoren@kernel.org,
	iommu@lists.linux.dev,
	joro@8bytes.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robin.murphy@arm.com,
	tjeznach@rivosinc.com,
	will@kernel.org
Subject: Re: Re: [PATCH] iommu/riscv: Add IOTINVAL after updating DDT/PDT entries
Date: Sat, 17 Jan 2026 12:31:17 +0800
Message-Id: <20260117043117.76052-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <c5sk7h5r5fozjdyguamekenlzd7pzbtvdh2boq3arynxifba22@ii4ikea2tuyq>
References: <c5sk7h5r5fozjdyguamekenlzd7pzbtvdh2boq3arynxifba22@ii4ikea2tuyq>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_203138_336124_AC268BE7 
X-CRM114-Status: GOOD (  15.27  )
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
Content-Type: multipart/mixed; boundary="===============5814129722012935007=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5814129722012935007==
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

>> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>>
>> Add riscv_iommu_iodir_iotinval() to perform required TLB and context cache
>> invalidations after updating DDT or PDT entries, as mandated by the RISC-V
>> IOMMU specification (Section 6.3.1 and 6.3.2).
>>
>> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>> ---
>>  drivers/iommu/riscv/iommu.c | 85 +++++++++++++++++++++++++++++++++++++
>>  1 file changed, 85 insertions(+)
>>
>> diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
>> index d9429097a2b5..2900170133fc 100644
>> --- a/drivers/iommu/riscv/iommu.c
>> +++ b/drivers/iommu/riscv/iommu.c
>> @@ -996,7 +996,82 @@ static void riscv_iommu_iotlb_inval(struct riscv_iommu_domain *domain,
>>  }
>>
>>  #define RISCV_IOMMU_FSC_BARE 0
>> +/*
>> + * This function sends IOTINVAL commands as required by the RISC-V
>> + * IOMMU specification (Section 6.3.1 and 6.3.2 in 1.0 spec version)
>> + * after modifying DDT or PDT entries
>> + */
>> +static void riscv_iommu_iodir_iotinval(struct riscv_iommu_device *iommu,
>> +				    bool inval_pdt, unsigned long iohgatp,
>> +				    struct riscv_iommu_dc *dc, struct riscv_iommu_pc *pc)
>> +{
>> +	struct riscv_iommu_command cmd;
>>
>> +	if (FIELD_GET(RISCV_IOMMU_DC_IOHGATP_MODE, iohgatp) ==
>> +		RISCV_IOMMU_DC_IOHGATP_MODE_BARE) {
>
>nit: This condition can stick out. We have 100 chars.
>
Ack.

>> +		if (inval_pdt) {
>> +			/*
>> +			 * IOTINVAL.VMA with GV=AV=0, and PSCV=1, and
>> +			 * PSCID=PC.PSCID
>> +			 */
>> +			riscv_iommu_cmd_inval_vma(&cmd);
>> +			riscv_iommu_cmd_inval_set_pscid(&cmd,
>> +				FIELD_GET(RISCV_IOMMU_PC_TA_PSCID, pc->ta));
>> +		} else {
>> +			if (FIELD_GET(RISCV_IOMMU_DC_TC_PDTV, dc->tc) || (
>> +				    FIELD_GET(RISCV_IOMMU_DC_FSC_MODE, dc->fsc) ==
>> +				    RISCV_IOMMU_DC_FSC_MODE_BARE)) {
>
>nit: formatting

Ack.

>			if (FIELD_GET(RISCV_IOMMU_DC_TC_PDTV, dc->tc) ||
>			    (FIELD_GET(RISCV_IOMMU_DC_FSC_MODE, dc->fsc) ==
>			     RISCV_IOMMU_DC_FSC_MODE_BARE)) {
>
>> +				/* IOTINVAL.VMA with GV=AV=PSCV=0 */
>> +				riscv_iommu_cmd_inval_vma(&cmd);
>> +			} else {
>> +				/*
>> +				 * IOTINVAL.VMA with GV=AV=0, and PSCV=1, and
>> +				 * PSCID=DC.ta.PSCID
>> +				 */
>> +				riscv_iommu_cmd_inval_vma(&cmd);
>> +				riscv_iommu_cmd_inval_set_pscid(&cmd,
>> +					FIELD_GET(RISCV_IOMMU_DC_TA_PSCID, dc->ta));
>> +			}
>> +		}
>> +	} else {
>> +		if (inval_pdt) {
>> +			/*
>> +			 * IOTINVAL.VMA with GV=1, AV=0, and PSCV=1, and
>> +			 * GSCID=DC.iohgatp.GSCID, PSCID=PC.PSCID
>> +			 */
>> +			riscv_iommu_cmd_inval_vma(&cmd);
>> +			riscv_iommu_cmd_inval_set_gscid(&cmd,
>> +				FIELD_GET(RISCV_IOMMU_DC_IOHGATP_GSCID, iohgatp));
>> +			riscv_iommu_cmd_inval_set_pscid(&cmd,
>> +				FIELD_GET(RISCV_IOMMU_PC_TA_PSCID, pc->ta));
>> +		} else {
>> +			/*
>> +			 * IOTINVAL.VMA with GV=1,AV=PSCV=0,and
>> +			 * GSCID=DC.iohgatp.GSCID
>> +			 */
>> +			riscv_iommu_cmd_inval_vma(&cmd);
>> +			riscv_iommu_cmd_inval_set_gscid(&cmd,
>> +				FIELD_GET(RISCV_IOMMU_DC_IOHGATP_GSCID, iohgatp));
>> +
>> +			/*
>> +			 * IOTINVAL.GVMA with GV=1,AV=0,and
>> +			 * GSCID=DC.iohgatp.GSCID
>> +			 */
>> +			/*
>> +			 * For now, the Second-Stage feature have not yet been merged, so
>> +			 * let's comment out the code first.
>> +			 */
>> +#if 0
>> +			riscv_iommu_cmd_send(iommu, &cmd);
>> +			memset(&cmd, 0, sizeof(cmd));
>
>The memset isn't necessary since riscv_iommu_cmd_inval_gvma(), which
>doesn't yet exist, will overwrite dword0 and zero out dword1.

Agreed, I’ll drop memset in v2.

>
>> +			riscv_iommu_cmd_inval_gvma(&cmd);
>> +			riscv_iommu_cmd_inval_set_gscid(&cmd,
>> +				FIELD_GET(RISCV_IOMMU_DC_IOHGATP_GSCID, iohgatp));
>> +#endif
>> +		}
>> +	}
>> +	riscv_iommu_cmd_send(iommu, &cmd);
>> +}
>>  /*
>>   * Update IODIR for the device.
>>   *
>> @@ -1031,6 +1106,11 @@ static void riscv_iommu_iodir_update(struct riscv_iommu_device *iommu,
>>  		riscv_iommu_cmd_iodir_inval_ddt(&cmd);
>>  		riscv_iommu_cmd_iodir_set_did(&cmd, fwspec->ids[i]);
>>  		riscv_iommu_cmd_send(iommu, &cmd);
>> +		/*
>> +		 * For now, the SVA and PASID features have not yet been merged, the
>> +		 * default configuration is inval_pdt=false and pc=NULL.
>> +		 */
>> +		riscv_iommu_iodir_iotinval(iommu, false, dc->iohgatp, dc, NULL);
>>  		sync_required = true;
>>  	}
>>
>> @@ -1055,6 +1135,11 @@ static void riscv_iommu_iodir_update(struct riscv_iommu_device *iommu,
>>  		/* Invalidate device context after update */
>>  		riscv_iommu_cmd_iodir_inval_ddt(&cmd);
>>  		riscv_iommu_cmd_iodir_set_did(&cmd, fwspec->ids[i]);
>> +		/*
>> +		 * For now, the SVA and PASID features have not yet been merged, the
>> +		 * default configuration is inval_pdt=false and pc=NULL.
>> +		 */
>> +		riscv_iommu_iodir_iotinval(iommu, false, dc->iohgatp, dc, NULL);
>>  		riscv_iommu_cmd_send(iommu, &cmd);
>>  	}
>>
>> --
>> 2.50.1
>>
>
>A faithful implementation of the 6.3.1 and 6.3.2 guidelines for what the
>code currently supports. I presume this is fixing an issue? If so, can you
>point that out in the commit message?

Yes, this is fixing a functional issue: when software changes a leaf-level
DDT or PDT entry we weren't issuing the required IOTINVAL.
I'll update the commit message in v2.

>
>Otherwise,
>
>Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
>
>Thanks,
>drew
>
Thanks,
Fangyu


--===============5814129722012935007==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5814129722012935007==--
