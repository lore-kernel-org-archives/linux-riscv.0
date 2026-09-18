Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAE68C982DA
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Sep 2026 16:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/7+H7xFdPsJT/Kp9i9+69sePlWkqPT9fhMXxsez/lkA=; b=AqhoyqRGI0nXtZ
	2yrSjR2JV559Jowo9BB5hY2mJ0qJipwKxgmZp+fyUpPd85nVXNxfjwLV9nwBOWhTgq7xVxH3tdFCp
	5/pYz5jYpvOfzUEs5HbPnufcDHJlImy7ume3f/GFAYwJTiJiFZLJ1EgoS54wIIHWtoJqaEBmWAF1D
	gCxWFbagBzBlUBNpVxuoybMDokuzXOD4aX0ypOODJo9l+hjhe7+6r7kUsZ5OdSUus2x3fpRTVBzBr
	6Y0uLFbGKvIGNv9rd70iBEu0l9b32YghRE6bNaWSACz2cadqY6WLwZTTxP3dkDizyO8FDIZJ0LaFT
	1PRGpZJBC71/voWtxcVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bIW-0000000F0gQ-0WQR;
	Fri, 18 Sep 2026 16:18:48 +0000
Received: from mail-pj2-x01.google.com ([2607:f8b0:4864:39::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bIT-0000000F0fD-11op
	for linux-riscv@lists.infradead.org;
	Fri, 18 Sep 2026 16:18:46 +0000
Received: by mail-pj2-x01.google.com with SMTP id 98e67ed59e1d1-39e249c766bso372163a91.0
        for <linux-riscv@lists.infradead.org>; Fri, 18 Sep 2026 09:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789748324; x=1790353124; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=joaMZtZ2JkCfx/7wOkt6uB/JF0GtO4C1SVtTGC6XgyQ=;
        b=b1+65EWJY2aj8BBWZiOJgNqFdKpIrNSbCQpTI0Wu0wnIg866Mham03tLBMKlT42kTA
         mIZqjymHnfPAsBgs63uVaOA9R8gDDimZObT2S1qawU4jddE6uh1ajr3hCfp3XT/JpbYz
         q9W8ulGkrE/c6MlrTT6iPZeHpG3Aol0q2LMQe6KlsRuGlkrj15OeeGeChITEsXC2aLv8
         zEjM05nrTpcUNiqOLHwT68pL9u8g4r3APcJlo99HsM21Nvg+Aw0veyk/vEaWwTB8vPPM
         uyP5bJQPuDHwopoCcHCSlWSbatqzRIUjSc3edY+x2hQz9o0BApCgp0VyU5ykPbw+I43y
         syLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789748324; x=1790353124;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=joaMZtZ2JkCfx/7wOkt6uB/JF0GtO4C1SVtTGC6XgyQ=;
        b=FXRgFp8PEuMIFYVpm7b7dbB6c4b7enPzYe3/jWbYfW5iO+Pt/wiLCmNmKaK8nBTISY
         5PD3+KSds4CckhUz8nRj8lE7ZqygiCPSU7L6ff2165V4ha1H7BF1dXVsiS+CVn7tJGgm
         AGFi9t8zxM7bJe8QP2pdjWgpOTaUcPsLPP2PuqEtpAz1sDh1kjVoEmQ5sNuZiiSx1N6l
         rmwN5tAhPBPsvnv/I1upKyIHH+W3IFixtGWtcPYZINDTRUtynYpTJdJgiEPc52Zdebnf
         Qsf50ME4R2jY4eKEc0hJrB86M7ysGGp38WaW/I1P9/Z2tQ8/cFABcBG61+1yho1+d0nb
         WM4Q==
X-Forwarded-Encrypted: i=1; AKwUvBxRnFHZjVFYso+TiC89EH/We0uoNtJE+ye3Pd4965BjvQczXGLbaNX6b8Tlw7xDbnA/uurPSW/RUVUaHA==@lists.infradead.org
X-Gm-Message-State: AFuF++ngiur484xYFNIUwGgH29TazIWTdhiRGNNqjBnSpDEsE9o76oNB
	JziEkO+C2z3eGVmweBmz3LNtGMfocQTwSZIP2jAneEnjalCbViljvUbt
X-Gm-Gg: AYBFou1a/temiyvQBd380jFb0IgFq/9rjYHKEcAH8SYabS+OrlsOMLTzP5O6SsSMRcJ
	zoGNp+MiZcZS0fbco6Uuo/nwloUChamUpEXleupCclftXPApnLc4OqXxYpuJlzdFpTRmWbE9ZkS
	tcUui4LftsTjuaqNWVXTOvZE97hw8z9IOMs1QZDX/S6dOWg+efomtzn61jghWtETFaon+Y8CDuz
	93xbBJ5WqksE+Dc+8L6hdb9pG8Mi4+lz16qKXFgiGmwHtoWWxBTvYoi4+qb6y5nm6HAeC580Ryk
	7hzvj5nWFq8P2116TMlgbMqGn3qDf5Y0LhWcJl9h5N0T0hHLh7Q1Slcp4IqVj/qqsTfJDHhiELf
	bJBFZVMd3ouHGk79p6ecEU0CuQOo1DXnQEScgH4X4hEa8rfqy2dX/PwK8+5XSKOSQl6ENeHxe3W
	fBsmOdEL04hdTzGuKGwlo1UptgJ9VHfC+7U2GfEteh2dzx0ifVT2OPUyPrTYw07PjoU4zQe/uZt
	AsF7IdheGRFFrYq9w==
X-Received: by 2002:a17:90b:554b:b0:39e:6c6a:2097 with SMTP id 98e67ed59e1d1-39e6c6a2359mr184187a91.56.1789748323892;
        Fri, 18 Sep 2026 09:18:43 -0700 (PDT)
Received: from [192.168.50.100] ([111.199.57.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e55895112sm1814952a91.3.2026.09.18.09.18.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 09:18:43 -0700 (PDT)
Message-ID: <90826872-1374-49e4-832d-555abf8e8369@gmail.com>
Date: Sat, 19 Sep 2026 00:18:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 08/10] iommu/riscv: Pre-enable GADE for
 second-stage domains
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
 <20260915032828.11250-9-fangyu.yu@linux.alibaba.com>
From: Gong Shuai <gsh517025@gmail.com>
In-Reply-To: <20260915032828.11250-9-fangyu.yu@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_091845_300560_7DBF0349 
X-CRM114-Status: GOOD (  17.87  )
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
> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> 
> Pre-enable RISCV_IOMMU_DC_TC_GADE in the device context when
> attaching a second-stage domain, if the IOMMU supports AMO_HWAD.
> 
> Software pre-populates second-stage page tables with D set, so
> enabling GADE by default does not change normal behavior. When
> dirty tracking is enabled, iommufd clears the pre-set D bits and
> GADE becomes necessary for hardware to update the dirty bit on
> write access.
> 
> This avoids toggling GADE dynamically and keeps device context
> setup consistent with second-stage domain attachment.
> 
> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> ---
>   drivers/iommu/riscv/iommu.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
> index 16779877351b..f01fd4e2f840 100644
> --- a/drivers/iommu/riscv/iommu.c
> +++ b/drivers/iommu/riscv/iommu.c
> @@ -1330,6 +1330,8 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
>   			FIELD_PREP(RISCV_IOMMU_DC_IOHGATP_MODE, pt_info.iohgatp_mode) |
>   			FIELD_PREP(RISCV_IOMMU_DC_IOHGATP_GSCID, domain->gscid) |
>   			FIELD_PREP(RISCV_IOMMU_DC_IOHGATP_PPN, pt_info.ppn);
> +		if (iommu->caps & RISCV_IOMMU_CAPABILITIES_AMO_HWAD)
> +			dc.tc |= RISCV_IOMMU_DC_TC_GADE;

I might be missing something, but I don't see how the GADE bit set
here reaches the hardware IOMMU DC. In riscv_iommu_iodir_update()
(in patch 04/10), it looks like only the V bit is taken:

	tc = READ_ONCE(dc->tc);
	tc |= new_dc->ta & RISCV_IOMMU_DC_TC_V;
	...
	WRITE_ONCE(dc->tc, tc);

I saw that you mentioned you tested it on QEMU. As far as I know,
mainline QEMU has not yet declared the AMO_HWAD capability. Could
you clarify whether you used a modified QEMU for this test?

Thanks,
Shuai

>   	} else {
>   		if (!riscv_iommu_fsc_supported(iommu, pt_info.fsc_iosatp_mode))
>   			return -ENODEV;


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
