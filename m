Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3596CA5FCE
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Oct 2026 13:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dpDzBzElGoLVsbWZBu/01BDbk8DIoXEW7h5JoR0Wklk=; b=tAmGdSxNv1TPhl
	lfbwfQ8iAhTD2R7A6lUP3YeG8MQ7K98YMI2QKXBarnEunomVc3TkZUS+RlRLQcjhHpbE2T+T7eF1I
	z17PGVjGxBBrVReAxHf8mUmMzgws1XTK3PBXQyO22xY3e8t5aokxRZVrrIcRxFKt0JTwMkoGmSyIO
	kB9FKd+qsQvyJm8NxDel3TJDZzz2HDEtqGeyRNaRzc8OV06jEotvg5dN3PU9cVlWEnt6jqclSncip
	I4y5hNmtGhC5MDXi/3fOwoP2ZAFuYPcrCRSGaB+7vYr1JOmFAsQZOJuFSLOU3WJfpRdAU8QVQuVYe
	mg5wuKNC6pgmBVxoBWAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDihE-0000000GWlW-2kmr;
	Mon, 05 Oct 2026 13:25:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDihB-0000000GWk2-37Gq
	for linux-riscv@lists.infradead.org;
	Mon, 05 Oct 2026 13:25:34 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695CFU9g2849755
	for <linux-riscv@lists.infradead.org>; Mon, 5 Oct 2026 13:25:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JDSp49czoELykwuV0c41NKt0
	WWebvsAlOsdvzWqmJjk=; b=ThrBDxLZbRBxo/UjtYhkuhkuLg0Uh4kM0MKwjJLf
	xm/A9+6Gtj4iAmBrvNZ7C0nl/fpvVgXJqgwb8Tih9OAI9Unr3xok853TLmZvk1fC
	RqC+UFkVNzFSL94sjL+hWvJ4/k0wvj0HnBa8wlqgfbGwwssvNzvT8q/swStZ5RGH
	yU5ldsDeaiGZ0xBgVxrB9KqrbRUZkaXea2FKoDQOZCEMcV6Tem68A+3hX1uZBV0n
	qwfdZPP76FWkVuzPoZri5/v2KatI3rplDHKULtnfzi9lwDiDWFBxi33+HcxezSju
	A3ld06RpJWAiKHwYzVeq/6c0LYPp2l4rVSuQmCeKgqeZSw==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h49u40pgf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 05 Oct 2026 13:25:31 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-66c70f5abc2so1833678d50.1
        for <linux-riscv@lists.infradead.org>; Mon, 05 Oct 2026 06:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791206731; x=1791811531; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JDSp49czoELykwuV0c41NKt0WWebvsAlOsdvzWqmJjk=;
        b=a0HjPXmkfIj6bBCir678FdEPU1KSMTlc56KbdnJHjwHY0ccRH1v4O/afjTrAksKI0F
         Qx71lsxt1blkohVvFNkxaPQeIkCagueTIKdFfGiVhzcqCRggvG+Dw6LcfG7HibQSITul
         Ktn6D1SKdx0oO7IrHJC5ZWynmGCW6Qy7Uhyx0IOEJrLvwq9sD+DQKXk9OS+HZ2YTdvng
         TRLP8df4qnbYNzWiJEpbCpzFRli4JBuScjXQjz1OMcONDctvstEhcdtCN7qJ/1lgbeZv
         tP94EhIgDCAwx0xA2+qsb2/DRCOMcPZ/TY/EFVRYre77syA7Ha9+fK3yes16A1xxhJJ6
         C34A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791206731; x=1791811531;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JDSp49czoELykwuV0c41NKt0WWebvsAlOsdvzWqmJjk=;
        b=rRkubGct17NN9C4qz5cvre8pro22cwIEpwPEv2/j1KdANTnWqnnDfQzwx4T9GuTX5O
         vVqvHhwND2GwRkEYAaE7DUafxRhP6jkiDcciMvTxdUjA9rklnXxQhpOz/ArOY8ODTEVi
         XreSVw0Gq05FrFgoHYVIpKm/0ZkiX2TJn6sf58LBkJUWdxuFYPwOGXP2JSAQsjcTqxuN
         sgYR2QlW75mzGp6Z3NKSnCuFSNfh/fbblJ0M0UBAANwKK0b92fDMjYYUQMgqpIAii01F
         6D0Er9wVZxJ0su9R0/Xwxvl7uYOZYmehMi+9rEIt3A7QHGquFQ3pcFTV+vYuF6DtwzLC
         LnNQ==
X-Forwarded-Encrypted: i=1; AKwUvBzOE/lzzW1ucKSw4ciAuJytix7/TC/Mpfj6LlSsP54XyJ3bHmVjIuPG6MuECYw3B4x/51hUsZU4zMPO/A==@lists.infradead.org
X-Gm-Message-State: AFq9FYLsiPo/XTlj/lr3uSiDUfwg7hKwrfVv169Aqe6Fmmymgw71joUd
	d5bJt4OWjSB0zSI3rxVfB9rBsW+7FMNB9PlaHUVqOB4lJXSCIkULSGfXiriZhhzEm6jPT/O3sRi
	TaADR2ngVgrdoMMC49YSdnk/+RhBy76ckuY96KqmyaEZzdfSX6crjxDCuGzi3QiToCiPkN44=
X-Gm-Gg: AYBFou3P7W1qOx0yh7yFb+zBqsvlhrMKo3+WUsLQ5VlOax6ImTgYyROg9meaLJ2zMlU
	J41NqCBS80oJ+hYlDIeoYXnJJK5ziVQ2b+TMuu3o1IoGIALkOITBILv5ovYI6srFx7whdH1Ffhf
	BynWEzx0YYjuyWe7BDBT4H5r78CVWSAyOyVn5I9lHUP7O9yXxfCmJZ/zj2xT8hUpQvZfGgbtgjk
	LbYY9gYrz8O1Ift2DlLKzL9hMGEEC3nrtrz7FVo9rso3zddIG1hdWbs3NvlTQXuZ8/T+LxaFlVV
	L1tuHH3OsgNEzO4xD1dA7PiAHuXNK2Nq0RScPTbz+QGTEyms8W+/aOWqVmGLBXD/oNdEONivnwU
	HVIcuSQZbnv+96680HHlhZTGT6Rs=
X-Received: by 2002:a53:db4c:0:b0:675:68f4:67cc with SMTP id 956f58d0204a3-677ac165dddmr3375801d50.80.1791206730544;
        Mon, 05 Oct 2026 06:25:30 -0700 (PDT)
X-Received: by 2002:a53:db4c:0:b0:675:68f4:67cc with SMTP id 956f58d0204a3-677ac165dddmr3375750d50.80.1791206728277;
        Mon, 05 Oct 2026 06:25:28 -0700 (PDT)
Received: from localhost (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-677c1b4a383sm3109497d50.7.2026.10.05.06.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 06:25:27 -0700 (PDT)
Date: Mon, 5 Oct 2026 15:25:23 +0200
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: iommu@lists.linux.dev, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: tomasz.jeznach@linux.dev, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, tglx@kernel.org, anup@brainfault.org,
        atish.patra@linux.dev, fangyu.yu@linux.alibaba.com,
        zhangzhanpeng.jasper@bytedance.com, zong.li@sifive.com
Subject: Re: [RFC PATCH v3 01/14] iommu/riscv: Allocate MSI tables for
 second-stage domains
Message-ID: <dqo5xn7bz2wffbgolx76wryc7p7xsaygz2wrxhxvgnwekfpenu@tnu5uw4hauat>
References: <20260928143113.49838-1-andrew.jones@oss.qualcomm.com>
 <20260928143113.49838-2-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260928143113.49838-2-andrew.jones@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 6ky9G2RrhwIsosVYtZJ-cusVDXvYYUoc
X-Proofpoint-GUID: 6ky9G2RrhwIsosVYtZJ-cusVDXvYYUoc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA1MiBTYWx0ZWRfX7ToBUC4SqjY/
 IoOuV7RuR5XvGT11t4nEECS+iYvy1JWryMzV7eFZhw7PKfwRJJyHVA2CGY76RnQbQy04O0H8rXr
 WdK23/ZqnXCs8+wlylxSgN5VNvl9tBY=
X-Authority-Analysis: v=2.4 cv=LuEHWXdc c=1 sm=1 tr=0 ts=6ac3a54b cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=zRh97aRZNhiOMYVz81Er1w==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=WSAePdX2diYu_KTn0zcA:9 a=CjuIK1q_8ugA:10
 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA1MiBTYWx0ZWRfXxdpnWaLua1dQ
 6TCpl8A0C2QFd1uPLt2kmAbS8igVC2mzCNW++kzASEQFtDMm7+RDFnXKAIwObPKI2Kg1vxy5I+0
 1MOpnV1SwgD+rUeiXMfrBxDi6A57WHf3WbiIRcsSMn+nvY3pAbYwpbOGKT54O26GmNe3J+2l0Eu
 cfFOSqMwevQO80d5zxnihTsVSm5tCfDQG4isGXssPAKMC9SoztQoYNqZOnpOM+X88SH1OhT4IL4
 QeN9RJta8DPlzSl5g3wmG5BDJCM6iAwZPtXetkS0PgrgeOCanRdG5BHbLHYFN/jLOpUq64dOgi1
 ZrQV9A+A6//uDJ8tUrVadeeYwVViEXsO1pTpIyUU1n+9S7iroy4isEz/xis8FIeNyaCG5jZAGSe
 ojs9iYbZQjWC4czQAscGe+bhLdvySoT32VT2BPdoST2OpSwL8NX98wr7KZ+IVZuSj+jaO8GzQAX
 Z2/B7q8NA6/9WsttHnw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 clxscore=1015 spamscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_062533_779603_E75C91B9 
X-CRM114-Status: GOOD (  20.14  )
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

On Mon, Sep 28, 2026 at 04:31:00PM +0200, Andrew Jones wrote:
> IRQ bypass maps guest IMSIC addresses through a flat-mode MSI page
> table owned by the second-stage domain. Allocate the table lazily
> during device attachment when the attaching IOMMU supports MSI_FLAT,
> and free it when the domain is destroyed.
> 
> The required capacity depends on hypervisor support and VMM policy.
> Expose the runtime-writable riscv_iommu.nr_msi_ptes parameter to set the
> MSI table capacity of new second-stage domains. It defaults to 512
> entries (8 KiB), and zero disables MSI table allocation for new domains.
> Existing domains retain the capacity selected when they were created.
> 
> Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
> ---
>  drivers/iommu/riscv/iommu.c | 61 +++++++++++++++++++++++++++++++++++++
>  drivers/iommu/riscv/iommu.h |  7 +++++
>  2 files changed, 68 insertions(+)
> 
> diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
> index 0953aaf594cb..3bbb4d0d0a85 100644
> --- a/drivers/iommu/riscv/iommu.c
> +++ b/drivers/iommu/riscv/iommu.c
> @@ -22,6 +22,8 @@
>  #include <linux/iopoll.h>
>  #include <linux/irqchip/riscv-imsic.h>
>  #include <linux/kernel.h>
> +#include <linux/moduleparam.h>
> +#include <linux/mutex.h>
>  #include <linux/pci.h>
>  #include <linux/generic_pt/iommu.h>
>  
> @@ -30,6 +32,16 @@
>  #include "iommu-bits.h"
>  #include "iommu.h"
>  
> +#undef MODULE_PARAM_PREFIX
> +#define MODULE_PARAM_PREFIX "riscv_iommu."
> +
> +#define RISCV_IOMMU_DEFAULT_NR_MSI_PTES	512
> +
> +/* A zero value disables guest MSI table allocation. */
> +static unsigned int riscv_iommu_nr_msi_ptes = RISCV_IOMMU_DEFAULT_NR_MSI_PTES;
> +module_param_named(nr_msi_ptes, riscv_iommu_nr_msi_ptes, uint, 0644);
> +MODULE_PARM_DESC(nr_msi_ptes, "Number of PTEs for new second-stage domains (default: 512)");

I never liked the need for this parameter. I think I have a way to remove
it, ensure table size supports (and no more than supports) the guest's
IMSIC topology, and moves ownership of the MSI table to the hypervisor
(which, since the MSI table is only needed for VM's, is likely the better
owner). I'll experiment with that idea for the next version.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
