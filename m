Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CDA3C5AD4E
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Aug 2026 08:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xfyYbjGZWylLlyt1ok2zC6+xCH5+Ysv12Mhf0gGPuoI=; b=M/+GlDzmmQkwou
	42yQ2xlHWO5yX8GmM8aTELUx602OeJvxgz8/A+OeF7lP946E3MWWPzjITkg5Qwsk+I7AWa/gdrhNv
	mcnxNsXF1XP8/kKmDXQ+4UUAp2e/KuXQwa9un61crFMiyROBqrSj0keLYlEQU7kShWSk4LpluCo4v
	NNrnv1qvaNeA6IN5PduYpXCkLDIK0BI20VaedplkQpxsmJWv3qA1fUgLAsg0m0bNMiTXw5MRHD3Ce
	M4dAWhIOXKBjSlskfzAYMlzd2cDk+0UAH3fdRhCaulXOkC0RBbg9BQDHf/hnK8s4N7L74k5nOhwrt
	HnBGL5oSW3s0UWsBDKBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtL6A-0000000BFQ5-453t;
	Mon, 10 Aug 2026 08:11:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtL68-0000000BFPj-3BdD
	for linux-riscv@lists.infradead.org;
	Mon, 10 Aug 2026 08:11:06 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A5paPH4149882
	for <linux-riscv@lists.infradead.org>; Mon, 10 Aug 2026 08:11:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eqbNjpANnKORB8DYz+Oqi7OH
	vg9oMT+g0VlEk9fsnig=; b=NjuZraazaoi8VK076YKebQAanidnOtFf20cTAnUi
	KhsFRMKM3ugOWWGaVScAjnhwXwEcHn7Rc3JMwqyrApiB/kx2Nggui8JPFIN6yPwB
	N/5bY423M8gtTGdC85ZxfmlnejHXoly4kVKATWwiMuhW+DMw+sA2JA9Bq9ejr5gN
	stmnBpHYTjvF5CMkR1r2jZ+dsvwTKyFFoCAv/GubuKmKvTsUXRV/Jd9w8esOoHPi
	0j5Iv1d3H3TMOOqedkIZ6zyq77z8xIWphbEWOoh2V01PLCa0Qgvhu2fck7YXTx6E
	5/zQcT10hMIAWgnEdk6AP36WdvDzKtXXLEtzTJtvrmOfpw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v90dve-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 10 Aug 2026 08:11:04 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5174a236220so13408521cf.3
        for <linux-riscv@lists.infradead.org>; Mon, 10 Aug 2026 01:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786349463; x=1786954263; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eqbNjpANnKORB8DYz+Oqi7OHvg9oMT+g0VlEk9fsnig=;
        b=FP0S9snvFyjwxA9Z7WFdZib0qA/wzHCinm6iU8HDxwcwwyXlgdE6M0QSwmchSrinm6
         Vy5hT334H5kiTai2d8/Wz2iPvav1ypIudHOTCIHSZgAKJclnxn02vtfFvRNgUU9Hg5x2
         AXsTJ053vk58zCxyfuhewDE/YWLiqxsj9Zji4ixKECSQwueCFsttc/gmrzKIvdCw1gDA
         gOpun9i/bj7IT0/2IN2amaTk33Nl9DCz6vrGCHovZQ/LdwcTsns/yZE2W5PBkat+dLT7
         NYC8cudxmdrjX2ZYmqlldll8zNZ1JIuX7j1sKVn/bwJo9Ov7V0AmJ8lu/ISK5KUTQOmT
         JRRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786349463; x=1786954263;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eqbNjpANnKORB8DYz+Oqi7OHvg9oMT+g0VlEk9fsnig=;
        b=Sjxy8BkvD0VhYt5LS3/6y0GaAfUFd8H4QviQfKFz7gNHvp8woUZXTvOmoAo6yNmEa8
         vO0TVt3qwAxSmRU+379mKn/J8taWinKSzmV6nHOo8ciZYIoaDQT2YDthYRUx+6dKXW/E
         cEw8dYPaEHAPKJ8iL0yPLqHjhNW74rFOGYeTwgwnvc6eHUfJgh0o1aqJL+Gxzz2ipIvu
         HWvA84tocAHkGfUjbz5iBI8h7RVTG6S9YaCjBSf1lyej7lWiJzgqRirwkKH7Hj5qzGN5
         NFHrMzgiZ65htZxo6QQbseq4JPZdzUoPri2BvVdVUb/ZcmXuiLthuz7S1ta5I09VIvMi
         3nwA==
X-Gm-Message-State: AOJu0Yx9wVixWcyh1o8ECrV01LLSpr0sNKqOsjdm0AyZG0anjyu959gv
	DvKq9silMToEBKcNxkDA4go6NIrJqB4TZkaGUM8zgkbVHaJe9u5z0/IF1I2MloRl4hEOL+42K4w
	lYzk5Sn+70lGZu5gO86aPuBOM07SQK3Ttlrbto4Gmu4zLLVQ7CDfyEakblTgYBV28UxwKTOs=
X-Gm-Gg: AR+sD104ca49KwJr9v4Y3m5U+RpWLLlTvTzSzPZL73rvUPj0hgLTJ9hnpNWyTgLdFL0
	8gpQBFOQVJRqVEXiBE4OKpC50hAGoCY6l8rQOfgYk5K2wg+4k9H/cYvTZJDHFrYe0/nFDMOIKL8
	CqAqketgQmUY64NnvYguwS5fSMhkIc7rq8Yt6lS6viVf+sEFB0THOl4Mbu78cF2lWLqmoB3O5Em
	Esb5Lv29daQG0vlM9lVK9vUZclqr34DDWOSLpAgEy/R9bFyE4kCXbS6xVwMKQ9/rYBAXHllh4Nz
	9/Nvdj+0KrH0VhUOTTXmsYGGlELEkDK1vpRbObmCRamVo44g3V10/BfRPFSw9VKOiWHfdzHR0WK
	VAuAG/lP/zk5nlcgLynBbVJfIkyST30V3c7JW5Pw=
X-Received: by 2002:a05:622a:1447:b0:527:43a:2f30 with SMTP id d75a77b69052e-52ce5f6013emr413945471cf.1.1786349462971;
        Mon, 10 Aug 2026 01:11:02 -0700 (PDT)
X-Received: by 2002:a05:622a:1447:b0:527:43a:2f30 with SMTP id d75a77b69052e-52ce5f6013emr413945051cf.1.1786349462559;
        Mon, 10 Aug 2026 01:11:02 -0700 (PDT)
Received: from localhost (ip-86-49-241-13.bb.vodafone.cz. [86.49.241.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995e9f0230sm282367485e9.6.2026.08.10.01.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 01:11:01 -0700 (PDT)
Date: Mon, 10 Aug 2026 10:11:01 +0200
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: linux-riscv@lists.infradead.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, kevin.tian@intel.com,
        fangyu.yu@linux.alibaba.com
Subject: Re: [PATCH v3 07/19] iommu/riscv: Add IRQ domain for interrupt
 remapping
Message-ID: <mthnplgkvilxzjzoy7x7f54shoa4v4wwkbczfpld4avmsmnc3m@lqpthhcxviy3>
References: <20260807181713.228535-1-andrew.jones@oss.qualcomm.com>
 <20260807181713.228535-8-andrew.jones@oss.qualcomm.com>
 <875x1lekog.ffs@fw13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <875x1lekog.ffs@fw13>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDA2OSBTYWx0ZWRfX4qzB26t0nNZX
 fgY0AApYO9fAu0h3Hdn0VxEAQQBjv0xdv0BEQjAP5bqiwIqCcAisYpLV6IDhjP2EacRtrORNf4e
 lRz1H1F/N2Ss39qXACrqtjRPk3aKS8w=
X-Proofpoint-ORIG-GUID: 8PpajJ16poHUkl5gtPVsIsCyUMj7yXU5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDA2OSBTYWx0ZWRfX7ShmDxqLZ0Gk
 ZPf4Q3Nevx5TVAsicSlvPHQF6QtZ5JTiqFXGTTIvuHav0t0q6Suh3SUqeOoTEAubwOq1rO+jwFp
 k4TnoipFpHeGlduZzVPK0qKTigHheoi2ifPF3SsTgR3fGJYDyYqO1kJSDqhxlKk3XwYgP/qJ6Hd
 u86DKoLBx1EUkY1vbErEG6i15RG/qhwcO/6fdOYZBqA6HKzQJfJF1MZ32ID1GNc797MXkv694sx
 MuZwJhtHelI9cUd+SvyJXb6lJcTXhZXkCN7NFpmq1mYer09hfw3/hBGo1efkZ3rWaDBxopK7KTG
 5+gpXRFhKVLc23HcL5AmuQX4guHTPOMH6lwJabzfJ5dsaUvtPQt8kyh9VQaDJLGUqyf9zizgZ/c
 SACGMMjCjrx5c1Aj4zmbwmOzZ40Xa51i0DW70ayI9cKOD/iQ7rZZh0mKr/0pd0JYoSSOAM3aZmG
 w8UTv/NRf06Zc/NIpnQ==
X-Authority-Analysis: v=2.4 cv=T5m8ifKQ c=1 sm=1 tr=0 ts=6a798798 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=VPysOpcHbS0DNrM1Xqmyow==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=oqHPoYKHcLPAEeRuAR0A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 8PpajJ16poHUkl5gtPVsIsCyUMj7yXU5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_01,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_011104_808415_776A23FE 
X-CRM114-Status: GOOD (  26.16  )
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

On Fri, Aug 07, 2026 at 10:32:15PM +0200, Thomas Gleixner wrote:
> On Fri, Aug 07 2026 at 20:17, Andrew Jones wrote:
> > +static int riscv_iommu_ir_irq_domain_alloc_irqs(struct irq_domain *irqdomain,
> > +						unsigned int irq_base, unsigned int nr_irqs,
> > +						void *arg)
> > +{
> > +	struct irq_data *data;
> > +	int i, ret;
> > +
> > +	ret = irq_domain_alloc_irqs_parent(irqdomain, irq_base, nr_irqs, arg);
> > +	if (ret)
> > +		return ret;
> > +
> > +	for (i = 0; i < nr_irqs; i++) {
> 
> for (unsigned int i = 0; .....
> 
> nr_irqs is unsigned after all
> 
> The struct irq_data declaration want's to be inside the loop as that's
> the scope where it is used.

ack

> 
> > +		data = irq_domain_get_irq_data(irqdomain, irq_base + i);
> 
> 
> > +		data->chip = &riscv_iommu_ir_irq_chip;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct irq_domain_ops riscv_iommu_ir_irq_domain_ops = {
> > +	.alloc = riscv_iommu_ir_irq_domain_alloc_irqs,
> > +	.free = irq_domain_free_irqs_parent,
> 
> https://docs.kernel.org/process/maintainer-tip.html#struct-declarations-and-initializers

I'll align the member names.

> 
> > +};
> > +
> > +static const struct msi_parent_ops riscv_iommu_ir_msi_parent_ops = {
> > +	.prefix			= "IR-",
> > +	.supported_flags	= MSI_GENERIC_FLAGS_MASK |
> > +				  MSI_FLAG_PCI_MSIX,
> > +	.required_flags		= MSI_FLAG_USE_DEF_DOM_OPS |
> > +				  MSI_FLAG_USE_DEF_CHIP_OPS |
> > +				  MSI_FLAG_PCI_MSI_MASK_PARENT,
> > +	.chip_flags		= MSI_CHIP_FLAG_SET_ACK,
> > +	.init_dev_msi_info	= msi_parent_init_dev_msi_info,
> > +};
> > +
> > +struct irq_domain *riscv_iommu_ir_irq_domain_create(struct device *dev,
> > +						    struct riscv_iommu_info *info)
> 
> You have 100 characters, please use them.

I also like to use the full 100 and will even accept a checkpatch warning
for a few extra chars when splitting (IHMO) would be worse. In this case
if I left info on the same line we'd go to 102 but splitting on parameter
lists isn't too evil, so I'd probably leave this one split.

> 
> > +{
> > +	struct irq_domain *irqparent = dev_get_msi_domain(dev);
> > +	struct irq_domain *irqdomain;
> > +	struct fwnode_handle *fn;
> > +	char *fwname __free(kfree) = NULL;
> 
> https://docs.kernel.org/process/maintainer-tip.html#variable-declarations

I'll move fwname up so I don't spoil Christmas.

> 
> > +	if (!irqparent)
> > +		return NULL;
> > +
> > +	fwname = kasprintf(GFP_KERNEL, "IOMMU-IR-%s", dev_name(dev));
> > +	if (!fwname)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	fn = irq_domain_alloc_named_fwnode(fwname);
> > +	if (!fn)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	irqdomain = irq_domain_create_hierarchy(irqparent, 0, 0, fn,
> > +						&riscv_iommu_ir_irq_domain_ops,
> > +						info);
> 
> 100 chars.

I'll change it to

	irqdomain = irq_domain_create_hierarchy(irqparent, 0, 0, fn,
                                                &riscv_iommu_ir_irq_domain_ops, info);

> 
> > +	if (!irqdomain) {
> > +		irq_domain_free_fwnode(fn);
> > +		return ERR_PTR(-ENOMEM);
> > +	}
> > +
> > +	/*
> > +	 * The RISC-V IOMMU doesn't validate MSI data, so we can't set
> > +	 * IRQ_DOMAIN_FLAG_ISOLATED_MSI. This means VFIO requires
> > +	 * allow_unsafe_interrupts.
> 
> what is allow_unsafe_interrupts? A variable, a function a parameter or
> what?

I'll change this to:

The means VFIO requires its allow_unsafe_interrupts module parameter.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
