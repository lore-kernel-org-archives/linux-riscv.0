Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76AF7E6BF10
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jan 2026 19:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OSHHLDUr4OvqI9vamuLXiJikaKNfoH5ohvAcLjl59hw=; b=nRo8jp/+xfTb+c
	nqBExPhT0e0+BsAYSdpHu7Fbnx4pKCscIc4g15V5g4hbIB66zoJVceV0tYOatPUr+dMQgQ6bWcERK
	C3BWNsSessWslTLs+beXSMcUX8dnMYX7ApFNSkIYR6PjSKBctWtLU9jUDYJ4QLwL1cOiDZJKe6v+q
	K9T9/BqKXLikzwJcvZt0Ddlt5dBlZfmx2ojGya71LMTsUBDSrimLUPZiCHpZhX03x3OVlFhMV9EmY
	xjrTw63BcqqqBmCdv6kjLlNbUhgtqF4ryoyu5WH1R/4vVAXbiW6fR++OPT370FDJzFVRn7EZXs0t6
	vgg4ZkjajhvnJ34+FI8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vluds-00000001u0l-192Q;
	Fri, 30 Jan 2026 19:58:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vludq-00000001u0Q-1f5c
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jan 2026 19:58:55 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60UJjliA2966361
	for <linux-riscv@lists.infradead.org>; Fri, 30 Jan 2026 19:58:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gG+M+PPDwqTghnjTqDKDABOD
	qqkOeb2jHmdjVhPJUbk=; b=jQDmoqQb3g/IgRMXou0tPXzREhjuRFospemBY0KJ
	14GoOaLKfXCurZ9G7N+J/+PTMqEQ7TgndXyh51T972c7YINKKMGtgzKZHvlDTqZW
	g7Bye/5V/M2UU6FSwKBRPfUzCOGwpax1+LlkvPJWWxspdahnEw5ehjm1ZJwMAvK9
	k5Qz0A5WvrTKkIrdcFWtJy+/wYphqXuwOtTNZ6eV1QMav6VdS/wJIg+/y1GfaI68
	AdAgG+/SMEKhAgDoeKKfYGwK4ZPMFWof6LSteFgl1wiwnNlkop5LwPxKGXozA1qb
	QpFFUXvyEQ+mYty5x5e0yKnCyttzObQJaL0J69ZRZjjfrw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1332g181-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 30 Jan 2026 19:58:53 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2b795cff830so14175789eec.1
        for <linux-riscv@lists.infradead.org>; Fri, 30 Jan 2026 11:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769803133; x=1770407933; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gG+M+PPDwqTghnjTqDKDABODqqkOeb2jHmdjVhPJUbk=;
        b=OIU0HqjgTBRzjIlzUxb8PQ+Vi88VkeWkd0hg1Mg4GoExH9xfNwIk8wEADY2ezybaUD
         4514+XYr3rFV8exUz+AxkRjw3Y7Sqio3T3EH26lhPxbN8JJRhVV8GldqozmPytsK7YWc
         8ETKRj7OJaFAEo1opRzBNmIlRhJ+zoHv7mF8LTYFr7UTBrAXyq/J2YQqz0OEkKcNhnFl
         Mfkx9ImKUQaRhMxPPVVA5yjpGKCXp8gLFVNFOJzV5VhjfNhLxAPUbPq1keGl1CB+X/pj
         PEYD7aluXaKInl7zaTMdKgWparK44ytac7bhxwAiztDN96UeHhIj2lktyRD1dGXF/tKW
         ijkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769803133; x=1770407933;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gG+M+PPDwqTghnjTqDKDABODqqkOeb2jHmdjVhPJUbk=;
        b=bQW5Umg7/Hi6oxq6olyJd+Ui5Jg//27j2LK0RR5USPv1OhSH49exL09cPZY3yaVCk4
         Jz0IBmm1kEAysrwT9KE+tno2coD7drZw6vPJ9dMaCevFFTUdOz5vsfMDpbPdk9BpAqul
         t9FXwiNSy4Xq10neGgzJhFdkiJnmS8XOGoFL8D3h/m3GCvbzYpBAXQvQn8zR7jJsPSWj
         gxF/CIGF3HlkBxr5ZvWAQNjL/ucUDSiL2/ZDiea16aZUOoBXZm1ek3Ijpb/bKqHzS8Aq
         afMT0W+gS4xKpdeixgznafUpD0xWYkjkONtvBefoMyR0vv2h+tYzm2bm8jWN0XBSKYPI
         25Qg==
X-Forwarded-Encrypted: i=1; AJvYcCUYucnij9ckA1o2J3w0Gqo+arYm2/DO7kcY/0nGjiYdppIGJa6ncW3vKcVyYDeatmk2YQAvnchnlWFnhQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzm5TQljJCKe565xwVJwWSU+SBtTxH8wT3xiZ21VutFYoCXrhct
	3r6EmdyVesTntXTzQQSw5Yly/v4RKckFmiVyMgO4pDdRGnZxso8hxdzATrAvFj03byn/F4Pw5Jx
	eQK/DTUP8L7bsmed0rsIdMFHHHr25RJkxk+HZOHceTHE/fQXgm6WHjtyqrIpxUrTw/awUsC4=
X-Gm-Gg: AZuq6aK9QHwz/C+8l6wRcUSewhS7gB6yDqtOzUkxl3H6jOwF2GeJ3+oGniDcJXzb0um
	rJ+A8MAI4oaK1ZGiwu//z4Z11RzSwiy1dn488Xp9tVcssM32fDMywEs7HXcd+cp/kW0z+rTDT8i
	Rn7/hqzp0LzT0xsoXdLGQr/tLdoCFonF1NATyf64AnpBPG2TLKBhSZLFucp9ZGpaUfG//zpn4Zi
	p1Mpkdff1lSqpPgcogmHCGMzq/aku17CNQYAdAwnNEDY4WF0Y5eeTgvnG8T9F2XZN3QYGLLTvQT
	M8tU4G02fQxKQZMySU7mALB3/LSyhlF++Vf/lF7PpDin420T2R9aLyUDMkzxQ1sqmI6Y0k40wiK
	q0UpgEvdit6UbP3DWbWU=
X-Received: by 2002:a05:7301:2288:b0:2b7:23ba:af2e with SMTP id 5a478bee46e88-2b7c89658bbmr1882837eec.43.1769803133212;
        Fri, 30 Jan 2026 11:58:53 -0800 (PST)
X-Received: by 2002:a05:7301:2288:b0:2b7:23ba:af2e with SMTP id 5a478bee46e88-2b7c89658bbmr1882825eec.43.1769803132685;
        Fri, 30 Jan 2026 11:58:52 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a1abeb6asm13435031eec.19.2026.01.30.11.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 11:58:52 -0800 (PST)
Date: Fri, 30 Jan 2026 13:58:51 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
        iommu@lists.linux.dev, Joerg Roedel <joro@8bytes.org>,
        linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <pjw@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Tomasz Jeznach <tjeznach@rivosinc.com>, Will Deacon <will@kernel.org>,
        lihangjing@bytedance.com, Xu Lu <luxu.kernel@bytedance.com>,
        patches@lists.linux.dev, xieyongji@bytedance.com
Subject: Re: [PATCH v2 5/5] iommu/riscv: Allow RISC_VIOMMU to COMPILE_TEST
Message-ID: <dn7bsft2qvjod3sm6omneq37pwr2jtdzgobapy6obpgccg7soc@ctvs3c2w4vob>
References: <0-v2-b11ebca8abb6+c096-iommu_pt_riscv_jgg@nvidia.com>
 <5-v2-b11ebca8abb6+c096-iommu_pt_riscv_jgg@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5-v2-b11ebca8abb6+c096-iommu_pt_riscv_jgg@nvidia.com>
X-Authority-Analysis: v=2.4 cv=V8dwEOni c=1 sm=1 tr=0 ts=697d0d7d cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Ikd4Dj_1AAAA:8 a=RJvRfVeWPKEwyB7QEjIA:9
 a=CjuIK1q_8ugA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: D-9HBE7QBkWdAt6VFSOjQ5oGCXnvFkpU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDE2NCBTYWx0ZWRfXzdtu0/nwgtFu
 3nMM7/nd9gQnf/8ll4qOi7XHmZrFsDsh7GBo2fpzEBfe66hIyeKP9A6xbx9+66vR7qi8eM8PbnH
 NufR7F9wOL25jVEtG/NCtsVPPpCUH2Vlc67mRRc0hkwjo1hMs5l+jEexeQUC0X8vb6RO56xEC0S
 DGfaIbZdHIFD3JeHrCcph1gDgc+cMTi/QClTq9bA68FUUPmMBjr+/zv70Galrw2/yCv6Hu9S+IO
 1qnWmvyv/035tRz5itPKYLVF6t5PZ3uHh0YxjCS4MP6jM/n00RJKOB7VBde9MrWOZYY4r1E1Rpe
 UtGhayhFPMBw7sD2hv8l4lqyh1Ftne/zIquds4yuqhZOgEqCpsp1ffrEpUCfUtr9dokc6YIgpSC
 AOU3YK0EwNIN2KbQRLi2njQ78h6IJCuuh2jjE9ugg6bDD4y57O66a3XPkPxS/NU345CnSsmsz3t
 OWs81wrnVaSe5wlA8Gg==
X-Proofpoint-GUID: D-9HBE7QBkWdAt6VFSOjQ5oGCXnvFkpU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_02,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_115854_446572_D66F9AB8 
X-CRM114-Status: GOOD (  26.89  )
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

On Tue, Jan 06, 2026 at 11:06:49AM -0400, Jason Gunthorpe wrote:
> This driver used to use a lot of page table constants from the architecture
> code which prevented COMPILE_TEST on other architectures. Now that iommupt
> provides all of the constants internally there are only two small bumps
> preventing COMPILE_TEST.
> 
> - Use the generic functions for the riscv specific phys_to_pfn() and
>   pfn_to_phys()
> 
> - Use CONFIG_MMIOWB to block off the mmiowb() barrier
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/riscv/Kconfig      | 5 +++--
>  drivers/iommu/riscv/iommu-bits.h | 4 +++-
>  drivers/iommu/riscv/iommu.c      | 4 +++-
>  3 files changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iommu/riscv/Kconfig b/drivers/iommu/riscv/Kconfig
> index a329ec634cf1c5..f681188d19a1bc 100644
> --- a/drivers/iommu/riscv/Kconfig
> +++ b/drivers/iommu/riscv/Kconfig
> @@ -3,8 +3,9 @@
>  
>  config RISCV_IOMMU
>  	bool "RISC-V IOMMU Support"
> -	depends on RISCV && 64BIT
> -	default y
> +	default RISCV
> +	depends on (RISCV || COMPILE_TEST) && 64BIT
> +	depends on GENERIC_MSI_IRQ

This new depends isn't called out in the commit message. Maybe it should
even be its own patch with a fixes d5f88acdd6ff ("iommu/riscv: Add support
for platform msi") tag, but, either way, thanks for the fix.

>  	select IOMMU_API
>  	select GENERIC_PT
>  	select IOMMU_PT
> diff --git a/drivers/iommu/riscv/iommu-bits.h b/drivers/iommu/riscv/iommu-bits.h
> index 98daf0e1a30690..29a0040b1c32ea 100644
> --- a/drivers/iommu/riscv/iommu-bits.h
> +++ b/drivers/iommu/riscv/iommu-bits.h
> @@ -17,6 +17,7 @@
>  #include <linux/types.h>
>  #include <linux/bitfield.h>
>  #include <linux/bits.h>
> +#include <asm/page.h>
>  
>  /*
>   * Chapter 5: Memory Mapped register interface
> @@ -718,7 +719,8 @@ static inline void riscv_iommu_cmd_inval_vma(struct riscv_iommu_command *cmd)
>  static inline void riscv_iommu_cmd_inval_set_addr(struct riscv_iommu_command *cmd,
>  						  u64 addr)
>  {
> -	cmd->dword1 = FIELD_PREP(RISCV_IOMMU_CMD_IOTINVAL_ADDR, phys_to_pfn(addr));
> +	cmd->dword1 =
> +		FIELD_PREP(RISCV_IOMMU_CMD_IOTINVAL_ADDR, PHYS_PFN(addr));
>  	cmd->dword0 |= RISCV_IOMMU_CMD_IOTINVAL_AV;
>  }
>  
> diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
> index 4e2e08114bbf15..7a63f1771295b1 100644
> --- a/drivers/iommu/riscv/iommu.c
> +++ b/drivers/iommu/riscv/iommu.c
> @@ -160,7 +160,7 @@ static int riscv_iommu_queue_alloc(struct riscv_iommu_device *iommu,
>  	if (FIELD_GET(RISCV_IOMMU_PPN_FIELD, qb)) {
>  		const size_t queue_size = entry_size << (logsz + 1);
>  
> -		queue->phys = pfn_to_phys(FIELD_GET(RISCV_IOMMU_PPN_FIELD, qb));
> +		queue->phys = PFN_PHYS(FIELD_GET(RISCV_IOMMU_PPN_FIELD, qb));
>  		queue->base = devm_ioremap(iommu->dev, queue->phys, queue_size);
>  	} else {
>  		do {
> @@ -436,7 +436,9 @@ static unsigned int riscv_iommu_queue_send(struct riscv_iommu_queue *queue,
>  	 * 6. Make sure the doorbell write to the device has finished before updating
>  	 *    the shadow tail index in normal memory. 'fence o, w'
>  	 */
> +#ifdef CONFIG_MMIOWB
>  	mmiowb();
> +#endif

Taking inspiration from powerpc we'd put the #ifdef CONFIG_MMIOWB in
arch/riscv/include/asm/mmiowb.h

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
