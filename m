Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79DFDE6BF0A
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jan 2026 19:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ka0j4SL6fF4qLHy+85WYQRmFbbqS5p9937TZTwuCIFI=; b=x0C6DRMWphHPLm
	pDPd7vSAY7G2d7qZzuhEzaozpyGebEyrADMwIS7XrjfJ1vIJvta5hY8zShpUUrh5QfiMlN80yMbw/
	p5xZInG1sG0h92kRrweAubP5gnweSj2U0jzT1V04zzKytm66+WoLp9QeAdiwPiXIgFjojMb7MX6Xu
	54ZHRNF7/nUtBklYvNAQb3daRnSXwPJubdmm056UgrzSqNodLHIJIq+VDltg9XxWcykD5takWatL8
	OGatB2bEBvOn09PiX1Sv3aTh44QfWNmREDTzLH+jJ4u+L8s/Z+UndkubBrTD4wclqmYCMrSRTZ3/p
	K4JnhiVlHNAYOksHgrcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlu3h-00000001siY-3FI7;
	Fri, 30 Jan 2026 19:21:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlu3f-00000001si2-1yQY
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jan 2026 19:21:32 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60UBiaWU1485236
	for <linux-riscv@lists.infradead.org>; Fri, 30 Jan 2026 19:21:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bXe9Lrt7dSp+Dy1ApjFhZbK3
	Rd1JE1rBVyTVQSittNQ=; b=SZqsK2qKpHHoSsFrI+E5IyhBJgdCVpnxw9YwrGUW
	Sg/dTSZPenHA0gQ8UIMth55J22wj3SO4FrypsAMXbijrAAVb+41nHk2S8d3pBUTN
	rantylkNrSmjP5LZlCQVrdhfYlWmzQNgw4t0X3ebLmrFuxVLDIm/Y2mV4LYyou4P
	as4TzZE6q3IBbB4KwPqk14T4XaAQsYktMn4tkcrhb2HtIQaxpeZqyqD08igDzmX1
	3m3T+iEKF3GWi+5t1MGkpYCTFdh36TZURMM/yh4tmgomdEGRgiARd4/v2zDlJXNF
	bOhmHDHuho/EkY3WUjd8eeS41voGj554cYpRuATjifZ+qw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0nsfamh5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 30 Jan 2026 19:21:30 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2b6f0b345e3so17313328eec.0
        for <linux-riscv@lists.infradead.org>; Fri, 30 Jan 2026 11:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769800889; x=1770405689; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bXe9Lrt7dSp+Dy1ApjFhZbK3Rd1JE1rBVyTVQSittNQ=;
        b=iheMZ+9S97VLTnUPGNrfNG/moAEwL+/9/i/GaIQyidanE88dPZlJeqoMSFXQaitLoe
         MxLogk8+TPSn/kPIUPzSa//HLwY7OzBTAC3MD3MIUSgFml11QNy6YI50PtxMRXmLoV6c
         f/SraDKY/sxSGaPcYKa/rXlP9ObiVO3SAyQK4cQZTzf/EAJR2innYfIEaitHCG7AGW/T
         gnRJLWuwrhPiu+9Z52l4McS96UlDM6pHDfXV+prJpDjS5fUy/56YT2hKYchHsFYqg2h6
         ugfTqxixyH2cx+R4fK34EtanGHEK102lWW3hn+C1lOsP7+cAXh/XoHDMa+JCyAeflpaT
         3q/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769800889; x=1770405689;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bXe9Lrt7dSp+Dy1ApjFhZbK3Rd1JE1rBVyTVQSittNQ=;
        b=Yq6LcuF7z3XSSJnPWj4l/7gQLbkXDport7EmzVwgPd5Oc/rI7TNZszfVCFAfclkeNc
         ZH9+fOQ8OH+lB8sYc2P3qOsFpuiMxxqP/Et+EFXudpVRIBFIyz1kCzd+QEiSYSihV33h
         pHp+F14zvWLzTFoarahLkujStKjVU039vJ5HRhGjnASClFAyXRm9/lcJRcjEYB0+dghD
         kotoN7IOOEngiKsM2RanMU0JK0d1KfqWpUqy79q3iHMkiZU6Ce2wPtvjvIwynW/YvMW6
         RDa/cYxkc1pqCr2jLRqL96PqIAIR19vJx+PGJqHs9a2n+AlOV9sYaf9T5RKWUrBgwNgp
         fdog==
X-Forwarded-Encrypted: i=1; AJvYcCWzU4Jd8vBTZKvYzwzJvwsLP5M8iuFUv5VN2Q4DFMUUaVvHagfWL4L/sM70zSEP+YR+DT+z6S9xzrSdVQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzTBUobbnn5u2oBzI0Rz8YTvcAGaPS4K5cqAb1y8Cf6LXAuEoUr
	sjQenjD7PVn7UfKcT29VZHOOzjXzLBKhfv3nyPOPfKGgpWvXlJv/MJcOCadIzS5lZiFiohz5OIp
	EQcAfDZGoBwM9ih+F1iw2qWBhRugpBz5b7reFiTmNv11QndiFmKLtihde33JFZQkP88BEYPhhS6
	sm7GM=
X-Gm-Gg: AZuq6aIs7fxXTN0S6fxLVWLa/flmePfK1Etn1pA+zmLJ99x2f232JyPyflzaMa6k9Eg
	WexUyDSdohlBVBsPv4apiLKwXDfq1q8PPaokcAxm5fMnpV2eU3UPhHQhZb7CddxOhMN5nBnGSJY
	Yc43tgL6vlAv3hSYzyu6hmPkuUGomwrFSNQIHgGzw5hXL6PZpzIa5PoV4EVRTdBrtaMf6DXmjn/
	XDlES1dqIgPNsM67mfZE6JbwHQRgOxHtv3RGluk9UOrKVbCXsG6TP9qlLjYZ14bwr1XywNjGyQK
	wVtHqMwPnmfxLSqOVKCVUWwvEmtEuY74rRcxaSEqa6xyWNAaIjpQudmLe2zJWDJyRqbZwshZZyq
	0BoXIZRdEsInohtlM348=
X-Received: by 2002:a05:7300:a944:b0:2b7:2813:6a61 with SMTP id 5a478bee46e88-2b7c8634cd2mr2270952eec.6.1769800889394;
        Fri, 30 Jan 2026 11:21:29 -0800 (PST)
X-Received: by 2002:a05:7300:a944:b0:2b7:2813:6a61 with SMTP id 5a478bee46e88-2b7c8634cd2mr2270939eec.6.1769800888834;
        Fri, 30 Jan 2026 11:21:28 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a16cfaa8sm12015146eec.4.2026.01.30.11.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 11:21:28 -0800 (PST)
Date: Fri, 30 Jan 2026 13:21:27 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
        iommu@lists.linux.dev, Joerg Roedel <joro@8bytes.org>,
        linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <pjw@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Tomasz Jeznach <tjeznach@rivosinc.com>, Will Deacon <will@kernel.org>,
        lihangjing@bytedance.com, Xu Lu <luxu.kernel@bytedance.com>,
        patches@lists.linux.dev, xieyongji@bytedance.com
Subject: Re: [PATCH v2 1/5] iommupt: Add the RISC-V page table format
Message-ID: <hay56yg2plriyehsvy6zbyaptf6xvnj65zzvurllvpar6gyklr@i4cb6zenwap6>
References: <0-v2-b11ebca8abb6+c096-iommu_pt_riscv_jgg@nvidia.com>
 <1-v2-b11ebca8abb6+c096-iommu_pt_riscv_jgg@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1-v2-b11ebca8abb6+c096-iommu_pt_riscv_jgg@nvidia.com>
X-Proofpoint-ORIG-GUID: g3ahdf0vL1tXOdpbA2hfekJNKB4V1k74
X-Authority-Analysis: v=2.4 cv=EvjfbCcA c=1 sm=1 tr=0 ts=697d04ba cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Ikd4Dj_1AAAA:8 a=MAu47OgHUst8qGL3NBsA:9
 a=CjuIK1q_8ugA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: g3ahdf0vL1tXOdpbA2hfekJNKB4V1k74
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDE1OCBTYWx0ZWRfX1McjWuIOZISF
 t97oZ4Z3pKQ/Nv+nNQrk18A7KPk7EbP6TZk51rLAoOIrSOSHHJEaal1DNqF3inHLHROlHTvyXQE
 TWHzRotcMb5Xtt9wvGG/9JhKAoUk8hh0Mm7gKtWuq0mLDWd76ZkIrmBuTVi6tyt7FxIfSEKFRT+
 ihZHbv+HZeAznT6ZkV6/JbSzXUeQc0zQiAyOcoleeWbrCiiJQt14Fzp1dyCxedKISi6Zut12guU
 3gMpopZuasV7epnyilW/YIdu8h5mIuo3y3wS00hvPyoE1e1B6rfkyDtya5d9K2ubXPaLtjV10Ot
 gJWmBB6q4NyKnHTHX4DLT2/BCrxy9kB7HqFJMEdPiy46KRtEKoFa1c5iAy7hpOW2lncrYmawxBJ
 3oaLVktx+1BE0fomb2h09ADYDtjFp8SwyIgEYjRikgYl1qkrworn8FvQzyM6M4GkAsO7+L05ocy
 BG/j51rTPnuB2zt5yRg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_02,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300158
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_112131_528314_B2DE2DF2 
X-CRM114-Status: GOOD (  24.31  )
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

On Tue, Jan 06, 2026 at 11:06:45AM -0400, Jason Gunthorpe wrote:
> The RISC-V format is a fairly simple 5 level page table not unlike the x86
> one. It has optional support for a single contiguous page size of 64k (16
> x 4k).
> 
> The specification describes a 32-bit format, the general code can support
> it via a #define but the iommu side implementation has been left off until
> a user comes.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/generic_pt/.kunitconfig        |   1 +
>  drivers/iommu/generic_pt/Kconfig             |   9 +
>  drivers/iommu/generic_pt/fmt/Makefile        |   2 +
>  drivers/iommu/generic_pt/fmt/defs_riscv.h    |  29 ++
>  drivers/iommu/generic_pt/fmt/iommu_riscv64.c |  11 +
>  drivers/iommu/generic_pt/fmt/riscv.h         | 313 +++++++++++++++++++
>  include/linux/generic_pt/common.h            |  16 +
>  include/linux/generic_pt/iommu.h             |  11 +
>  8 files changed, 392 insertions(+)
>  create mode 100644 drivers/iommu/generic_pt/fmt/defs_riscv.h
>  create mode 100644 drivers/iommu/generic_pt/fmt/iommu_riscv64.c
>  create mode 100644 drivers/iommu/generic_pt/fmt/riscv.h
> 
> diff --git a/drivers/iommu/generic_pt/.kunitconfig b/drivers/iommu/generic_pt/.kunitconfig
> index 52ac9e661ffd2b..db0a5b2b3c7867 100644
> --- a/drivers/iommu/generic_pt/.kunitconfig
> +++ b/drivers/iommu/generic_pt/.kunitconfig
> @@ -4,6 +4,7 @@ CONFIG_DEBUG_GENERIC_PT=y
>  CONFIG_IOMMU_PT=y
>  CONFIG_IOMMU_PT_AMDV1=y
>  CONFIG_IOMMU_PT_VTDSS=y
> +CONFIG_IOMMU_PT_RISCV64=y
>  CONFIG_IOMMU_PT_X86_64=y
>  CONFIG_IOMMU_PT_KUNIT_TEST=y
>  
> diff --git a/drivers/iommu/generic_pt/Kconfig b/drivers/iommu/generic_pt/Kconfig
> index ce4fb478691457..df0fef423584d5 100644
> --- a/drivers/iommu/generic_pt/Kconfig
> +++ b/drivers/iommu/generic_pt/Kconfig
> @@ -50,6 +50,14 @@ config IOMMU_PT_VTDSS
>  	  level Second Stage page table. It is similar to the X86_64 format with
>  	  4K/2M/1G page sizes.
>  
> +config IOMMU_PT_RISCV64
> +       tristate "IOMMU page table for RISC-V 64 bit Sv57/Sv48/Sv39"
> +	depends on !GENERIC_ATOMIC64 # for cmpxchg64
> +	help
> +	  iommu_domain implementation for RISC-V 64 bit 3/4/5 level page table.
> +	  It supports 4K/2M/1G/512G/256T page sizes and can decode a sign
> +	  extended portion of the 64 bit IOVA space.
> +
>  	  Selected automatically by an IOMMU driver that uses this format.

I assume we want to keep this 'Selected automatically...' line in the help
text of IOMMU_PT_VTDSS too, so it should be duplicated here.

>  
>  config IOMMU_PT_X86_64
> @@ -66,6 +74,7 @@ config IOMMU_PT_KUNIT_TEST
>  	tristate "IOMMU Page Table KUnit Test" if !KUNIT_ALL_TESTS
>  	depends on KUNIT
>  	depends on IOMMU_PT_AMDV1 || !IOMMU_PT_AMDV1
> +	depends on IOMMU_PT_RISCV64 || !IOMMU_PT_RISCV64
>  	depends on IOMMU_PT_X86_64 || !IOMMU_PT_X86_64
>  	depends on IOMMU_PT_VTDSS || !IOMMU_PT_VTDSS
>  	default KUNIT_ALL_TESTS

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
