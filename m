Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3920D4A5F4
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Jan 2026 14:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9UpwwXdg0IDiLHeBhHOx1Ar6Nwy6se7xQ73pYRFOHo8=; b=fuPaod7Id97F36nhsDho/r6sy2
	7nS3c8D3GEmQ9oPpQonQn/WNXbN7Bs8caLlwbXjaWdR31/5Mil/jwpSOQEXhEO5J86Xz9M9V1Q1tU
	EIaaMLHou6j+a5glHT9MrI7c6B1j8Ojg3VVsVF0U2NJwGFhBuXcZPJhRCitwhpNMb/+PWWeZra+kf
	enlBeGCvoyYFVi4uj02cO5sO8EaxB0zuVTGcFYcy2K55aqbP5Z+KHAER578xvO4Mbo0DxdDzeoGBJ
	jHx/5Mv5m7W6T2uyMriou2bM4AqjzszIbN2AiU+dsXrFZ4g3sd3F8tFjTllrpFsI0sNZYy3tpfFJj
	8YGLSe+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhTqV-00000000G7c-44TM;
	Sun, 18 Jan 2026 14:33:39 +0000
Received: from out30-100.freemail.mail.aliyun.com ([115.124.30.100])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhTqS-00000000G55-12Pe
	for linux-riscv@lists.infradead.org;
	Sun, 18 Jan 2026 14:33:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1768746798; h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type;
	bh=iCz/1vk1Ei2IWAYd4SZ6Ak/RPBfeSYsHibOQYewCZg0=;
	b=Fx1eFvS5dpbFf5c1i032zOrnmlXKQcfb8uVQ4TyELifMz+QpAb1psq1xxpO2Pe0EQhGGCZ33XYIeRTcg6L9oZLn5WPxPvlc31rjRtVJHwr0eMQ5C+bhuIfIGymCRr9HROoj2HdOQ3ODrfQ+DDp91orixQT0LQXpEy5quY0YoWno=
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0WxG4hj5_1768746789 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sun, 18 Jan 2026 22:33:11 +0800
From: fangyu.yu@linux.alibaba.com
To: guoren@kernel.org
Cc: ajones@ventanamicro.com,
	alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	fangyu.yu@linux.alibaba.com,
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
Date: Sun, 18 Jan 2026 22:33:09 +0800
Message-Id: <20260118143309.94209-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <CAJF2gTQj-mtbg8Q9fN6=EprfV0XaXy-X=auP9iwrF-nLAJ4Ovg@mail.gmail.com>
References: <CAJF2gTQj-mtbg8Q9fN6=EprfV0XaXy-X=auP9iwrF-nLAJ4Ovg@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_063336_830968_591FED2E 
X-CRM114-Status: GOOD (  19.10  )
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
Content-Type: multipart/mixed; boundary="===============3553259018674569475=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3553259018674569475==
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

>Hi fangyu,
>
>On Thu, Jan 8, 2026 at 9:49 PM <fangyu.yu@linux.alibaba.com> wrote:
>>
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
>> +                                   bool inval_pdt, unsigned long iohgatp,
>> +                                   struct riscv_iommu_dc *dc, struct riscv_iommu_pc *pc)
>> +{
>> +       struct riscv_iommu_command cmd;
>>
>> +       if (FIELD_GET(RISCV_IOMMU_DC_IOHGATP_MODE, iohgatp) ==
>> +               RISCV_IOMMU_DC_IOHGATP_MODE_BARE) {
>> +               if (inval_pdt) {
>> +                       /*
>> +                        * IOTINVAL.VMA with GV=AV=0, and PSCV=1, and
>> +                        * PSCID=PC.PSCID
>> +                        */
>> +                       riscv_iommu_cmd_inval_vma(&cmd);
>> +                       riscv_iommu_cmd_inval_set_pscid(&cmd,
>> +                               FIELD_GET(RISCV_IOMMU_PC_TA_PSCID, pc->ta));
>> +               } else {
>> +                       if (FIELD_GET(RISCV_IOMMU_DC_TC_PDTV, dc->tc) || (
>> +                                   FIELD_GET(RISCV_IOMMU_DC_FSC_MODE, dc->fsc) ==
>> +                                   RISCV_IOMMU_DC_FSC_MODE_BARE)) {
>> +                               /* IOTINVAL.VMA with GV=AV=PSCV=0 */
>> +                               riscv_iommu_cmd_inval_vma(&cmd);
>> +                       } else {
>> +                               /*
>> +                                * IOTINVAL.VMA with GV=AV=0, and PSCV=1, and
>> +                                * PSCID=DC.ta.PSCID
>> +                                */
>> +                               riscv_iommu_cmd_inval_vma(&cmd);
>> +                               riscv_iommu_cmd_inval_set_pscid(&cmd,
>> +                                       FIELD_GET(RISCV_IOMMU_DC_TA_PSCID, dc->ta));
>> +                       }
>> +               }
>> +       } else {
>> +               if (inval_pdt) {
>> +                       /*
>> +                        * IOTINVAL.VMA with GV=1, AV=0, and PSCV=1, and
>> +                        * GSCID=DC.iohgatp.GSCID, PSCID=PC.PSCID
>> +                        */
>> +                       riscv_iommu_cmd_inval_vma(&cmd);
>> +                       riscv_iommu_cmd_inval_set_gscid(&cmd,
>> +                               FIELD_GET(RISCV_IOMMU_DC_IOHGATP_GSCID, iohgatp));
>> +                       riscv_iommu_cmd_inval_set_pscid(&cmd,
>> +                               FIELD_GET(RISCV_IOMMU_PC_TA_PSCID, pc->ta));
>The riscv_iommu_cmd_inval_vma() and riscv_iommu_cmd_inval_set_pscid()
>could be moved out to prevent duplicate code.

Thanks, Agreed on reducing duplication.

I'll move riscv_iommu_cmd_inval_vma() to a common path (build the VMA command
once), and only conditionally call riscv_iommu_cmd_inval_set_pscid() when
PSCV=1 is required by the spec.

>
>> +               } else {
>> +                       /*
>> +                        * IOTINVAL.VMA with GV=1,AV=PSCV=0,and
>> +                        * GSCID=DC.iohgatp.GSCID
>> +                        */
>> +                       riscv_iommu_cmd_inval_vma(&cmd);
>> +                       riscv_iommu_cmd_inval_set_gscid(&cmd,
>> +                               FIELD_GET(RISCV_IOMMU_DC_IOHGATP_GSCID, iohgatp));
>> +
>> +                       /*
>> +                        * IOTINVAL.GVMA with GV=1,AV=0,and
>> +                        * GSCID=DC.iohgatp.GSCID
>> +                        */
>> +                       /*
>> +                        * For now, the Second-Stage feature have not yet been merged, so
>> +                        * let's comment out the code first.
>> +                        */
>> +#if 0
>> +                       riscv_iommu_cmd_send(iommu, &cmd);
>> +                       memset(&cmd, 0, sizeof(cmd));
>> +                       riscv_iommu_cmd_inval_gvma(&cmd);
>> +                       riscv_iommu_cmd_inval_set_gscid(&cmd,
>> +                               FIELD_GET(RISCV_IOMMU_DC_IOHGATP_GSCID, iohgatp));
>> +#endif
>All the above should be removed from the patch; we don't need draft code.

Agreed, I will drop the entire #if 0 draft block and add a TODO here.

>
>> +               }
>> +       }
>> +       riscv_iommu_cmd_send(iommu, &cmd);
>> +}
>>  /*
>>   * Update IODIR for the device.
>>   *
>> @@ -1031,6 +1106,11 @@ static void riscv_iommu_iodir_update(struct riscv_iommu_device *iommu,
>>                 riscv_iommu_cmd_iodir_inval_ddt(&cmd);
>>                 riscv_iommu_cmd_iodir_set_did(&cmd, fwspec->ids[i]);
>>                 riscv_iommu_cmd_send(iommu, &cmd);
>> +               /*
>> +                * For now, the SVA and PASID features have not yet been merged, the
>> +                * default configuration is inval_pdt=false and pc=NULL.
>> +                */
>> +               riscv_iommu_iodir_iotinval(iommu, false, dc->iohgatp, dc, NULL);
>The riscv_iommu_iodir_iotinval() is the same level as
>riscv_iommu_iodir_update(). Could we move it out and put it after
>riscv_iommu_iodir_update()?

In riscv_iommu_iodir_update() we first clear the valid bit in dc->tc, an
IOTINVAL is required immediately after modifying the DDT/PDT entry to make
the change effective.

So riscv_iommu_iodir_iotinval() is paired with the DDT/PDT update sequence at the
same level as riscv_iommu_cmd_iodir_inval_ddt(), and keeping it adjacent preserves
the required ordering and avoids a window where stale cached context could be used.
>
>>                 sync_required = true;
>>         }
>>
>> @@ -1055,6 +1135,11 @@ static void riscv_iommu_iodir_update(struct riscv_iommu_device *iommu,
>Why do you have two riscv_iommu_iodir_update() function definitions?
>
>>                 /* Invalidate device context after update */
>>                 riscv_iommu_cmd_iodir_inval_ddt(&cmd);
>>                 riscv_iommu_cmd_iodir_set_did(&cmd, fwspec->ids[i]);
>> +               /*
>> +                * For now, the SVA and PASID features have not yet been merged, the
>> +                * default configuration is inval_pdt=false and pc=NULL.
>> +                */
>> +               riscv_iommu_iodir_iotinval(iommu, false, dc->iohgatp, dc, NULL);
>If IOTLB invalidation occurs before DDT_CACHE invalidation, the IOTLB
>may use DDT_CACHE's stall info, which may cause IOTLB invalidation to
>fail.

You're right. I placed riscv_iommu_iodir_iotinval() before riscv_iommu_cmd_send()
by mistake, I’ll fix the ordering in v2.

>
>>                 riscv_iommu_cmd_send(iommu, &cmd);
>>         }
>>
>> --
>> 2.50.1
>>
>
>-- 
>Best Regards
> Guo Ren

Thanks,
Fangyu


--===============3553259018674569475==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3553259018674569475==--
