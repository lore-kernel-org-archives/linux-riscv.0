Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4355DC982F3
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jan 2026 19:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZrfnQ+DO6OE+FtxiWen40rQo1r6f/sAsZ6MEpTo8Z30=; b=ZdtYFzMxsPxz3N
	HaD6StN7ai9KPwtjT8o0ZJSc+vj/yTca69jo5UOs1krmr/LqVg5itzsp+7j3KmXjiSn6Ji5dop1pb
	5QklNN83/6Jn98H1HvwxRrTZMMPqHI3t+5yZfduINwrXLEaKRQnEiiB8e2pG3Y8mFVeIX4aT473XN
	BpumwqONYYz480+FkoXcFkbAadlAWGQhzElUUUG3Fp+lYtWbM6vxGwF1/+5GLqSlZaOfJvZ4TFEuo
	L11x60t/vAxpkITdC32C4XneH4gupWzFuGTe8BhCChYUn3qwQSyRjYxi2ESoGzM8JZ7q46O6Ff2o+
	8xGaUQzzGf8uFGbRKG3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgp6d-0000000EfMw-0moP;
	Fri, 16 Jan 2026 19:03:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgp6a-0000000EfMD-10A3
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jan 2026 19:03:33 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GIr10v006940
	for <linux-riscv@lists.infradead.org>; Fri, 16 Jan 2026 19:03:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ctdwtzx4woC6De+DgvE6qX6t
	IJzFb2FXyuR20qfZBEg=; b=LGtcOnPtOR+13bTj4jHF6nGlYrcYhfluq4KC3l/S
	6UOnnPz6682Jwq/EWmZW7agEUTEQL9y/l/PX/3AY7ugCJJZv1Nv+Nkf1HOEIVRNK
	VPWJrH9q5xHOVlCTzIs5XWUMYWhk0iG+QMZdlPRjtaH/H0G6GVd+bKz2O9p6xAWB
	hyMIE2I3yBgJAo3Ot+sE+XHGeVz8BZ3xbwVwb5LcR936uamiROOi5uArxm1Rwy33
	/a+kV+OgDTBk/cGmIw16Bz157nFLcOyn8Z8RU7UzEaqzbMIxJh24EJyUfS9gkUrt
	NeAAhMJWuU3AN0XXa8dchBbWjJ6bl+HRWAC6/YsNZ7CYfw==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bqjy9skk8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 16 Jan 2026 19:03:30 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7cfcf550e23so2713751a34.2
        for <linux-riscv@lists.infradead.org>; Fri, 16 Jan 2026 11:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768590210; x=1769195010; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ctdwtzx4woC6De+DgvE6qX6tIJzFb2FXyuR20qfZBEg=;
        b=Xq/yMjHdyWYW0QaS174PUFTw1QoNkHVfkGFMj6VzUJDuDOaxRDrhOC+5HTnw88dnpX
         G/g1QXhbpx0Q+Lw5qhchnaDRPQs7YlMuMrqZYTjFC/HdypNViHROAcI23EhhrIhzS7lr
         nc6OfyE+bdKHFTytMfgJ+c/TBW0qxiRuGEORgQtG3P2/PFRMXLrC3t+hdcBp9KSmoUHP
         yiaAQXRdCpNkl4iDYuu11xH8aRdZUPDnc+fzSTOJnQF4+sNQfveS2SLnGrBuZmDvBOVL
         JsOmvS72ZqLa5F6d95zjNEadzuE+wNZbP4YgPyBgtT53zy8kjdgrSnOljNFSYYlO3BUm
         pKKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768590210; x=1769195010;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ctdwtzx4woC6De+DgvE6qX6tIJzFb2FXyuR20qfZBEg=;
        b=QuBQyd255Iu6slx/nJhqGWyEAd4iNKdKztzFpFq7ti2BhlBIaP75jwwS8DoLQ8v023
         6MjAX8pFDulSRVWORirJi33frIttGM9AZhvT/bvZN4ZHuNV/+6f6QwFcpNUVfXWB85aJ
         5wr4HhypbzIyGRMhjTFvKWrP6l9qR1MpMVkJ9RrlIJa4mHo90A8EnN8v6P9D5d4nK9eR
         Lu/qJUUJzEe9P+xEovtbLr9P0TKDr+sGeOhloq3P56H971/LsLYWD7mm5qUu3yS+VtRl
         kRJTYbMfDUEymfNQOlsxUPCM6A+4kBs/SiR1ZhUxeAiGV6WGXG/ytcug3kJR5yhv1Bd4
         WLBg==
X-Forwarded-Encrypted: i=1; AJvYcCXpGrQfhKfNmoAoaVH1AdvVNCkKbGA952lFV8Am5X8wBe8g6hr/JsQLTFsSIl3USr+6NFDacMLv2lYIsQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6LqYmyWZAiQBpIc8QIkB0M0KqqajRLe5Sp337UuLXZJH0MjEn
	jDhhTanpbUB3Gc6u6tyz1CzVJPsLBmyCp4Xwqf9oYp3NQQsdVCU4kj34nLnGqqv2inAuDAImq6k
	mPuxGqnEMUzLmnjYNGlyo1aaRMYcaN5J5eZuf3VTTHND+/ay9jP1oM0rbaPdLAk03g2jG2/Q=
X-Gm-Gg: AY/fxX6edSdtlX+qOMtQ7LUNBH5xWgw2Ub/w9q6UlnyZ+eX95VLgJY+/8yJCOt+llW+
	TJiuCgcaoKQ+qmHMmpORR8cuETjY8bpnAk8ZzWdoPwIAENWELCUvhWABuWPR26tPzrz9HSh/Osy
	BTwZ4IHMy7BDDN/v+GC63rdnVE1HThnKmFLitAit1NwW9OKnbe0yd7D+X1bIeuRU0DvWWeFYagD
	FIUKgQGdXYSB1Oq0DOwSDVob4SP1Z3krZl3jnvNUEXcSGApO2w/WCQDvLpKhVnVKUYXLCOZU0HQ
	dhsr1nBUzUYpIuzu1yCnmhDOfoL69YnuX5MNK+EnZIwn3CGHHd5Fo3SsJb109yji+KA/BOn2jg7
	5FWpSPuvtWTOLOltjLxA=
X-Received: by 2002:a05:6830:7305:b0:7ca:f1fa:e9d7 with SMTP id 46e09a7af769-7cfe013b1cbmr1708047a34.16.1768590205344;
        Fri, 16 Jan 2026 11:03:25 -0800 (PST)
X-Received: by 2002:a05:6830:7305:b0:7ca:f1fa:e9d7 with SMTP id 46e09a7af769-7cfe013b1cbmr1708026a34.16.1768590204813;
        Fri, 16 Jan 2026 11:03:24 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7cfdf0f0137sm2144941a34.12.2026.01.16.11.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 11:03:24 -0800 (PST)
Date: Fri, 16 Jan 2026 13:03:23 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: fangyu.yu@linux.alibaba.com
Cc: pbonzini@redhat.com, corbet@lwn.net, anup@brainfault.org,
        atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com,
        aou@eecs.berkeley.edu, alex@ghiti.fr, guoren@kernel.org,
        ajones@ventanamicro.com, rkrcmar@ventanamicro.com,
        linux-doc@vger.kernel.org, kvm@vger.kernel.org,
        kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] RISC-V: KVM: add KVM_CAP_RISCV_SET_HGATP_MODE
Message-ID: <6txqxrkyqh4afmked4hdi6qekkqrb54ar3q5upz3ennnuaktsi@dtoarqt7e26t>
References: <20260105143232.76715-1-fangyu.yu@linux.alibaba.com>
 <20260105143232.76715-3-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260105143232.76715-3-fangyu.yu@linux.alibaba.com>
X-Proofpoint-GUID: rtA-eD-bAAkH3sArUGEKw8WpTAfVcbfA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDE0MSBTYWx0ZWRfXydK5S/IKNiyI
 o2FrnotxfiiD0qNNbLQMYnjXt6PK/aLu0JFD637+EhkX5pCgN8p/ZODsCE3xOQn56s67fHyDdsY
 yY9EneF3TFFf581vVLzWUl+NSJIMZ+Duak6rYS5ejLw6bctU69hd9NacacyE7DmEXxtMEcvTrVH
 sXRUhpNu8o9yxvgzJ94e+vnASwT1w74v98y/k7HOmRB9D3hx6zK0Hdc/NCmQJQJtPxYiPFR+HOR
 b8bdyp13kppYI3kOVKgcuAfC5zcMZCEu+31TnBOKkmP6TEQztDaMMgmqnRWBfO4qLmRNIkVsCVV
 EhOQu0YKE9CDkja8CfJdKko4wx6y7kcMG/Uk+l3lN6eGiIWDrlXuJsPEgDPDbg52GJr77z9W2Fb
 xKjK1DAq5FXgZYHowwNFYAMhWTRc/aVHxtvuuFQCnmxeJE1S6twOgYnQOFrD4jgxTNt4A5S2BWk
 PTsDnrsNrdAdSry14IQ==
X-Authority-Analysis: v=2.4 cv=OJIqHCaB c=1 sm=1 tr=0 ts=696a8b82 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=JfrnYn6hAAAA:8 a=SRrdq9N9AAAA:8
 a=y9tgS1qgbWeIrQugNAQA:9 a=CjuIK1q_8ugA:10 a=Z1Yy7GAxqfX1iEi80vsk:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: rtA-eD-bAAkH3sArUGEKw8WpTAfVcbfA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_07,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160141
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_110332_394525_7A9B7015 
X-CRM114-Status: GOOD (  19.17  )
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

On Mon, Jan 05, 2026 at 10:32:32PM +0800, fangyu.yu@linux.alibaba.com wrote:
...
> +	case KVM_CAP_RISCV_SET_HGATP_MODE:
> +#ifdef CONFIG_64BIT
> +		if (cap->args[0] < HGATP_MODE_SV39X4 ||
> +			cap->args[0] > kvm_riscv_gstage_max_mode)
> +			return -EINVAL;
> +		if (kvm->arch.gstage_mode_initialized)
> +			return 0;
> +		kvm->arch.gstage_mode_initialized = true;
> +		kvm->arch.kvm_riscv_gstage_mode = cap->args[0];
> +		kvm->arch.kvm_riscv_gstage_pgd_levels = 3 +
> +		    kvm->arch.kvm_riscv_gstage_mode - HGATP_MODE_SV39X4;
> +		kvm_info("using SV%lluX4 G-stage page table format\n",
> +			39 + (cap->args[0] - HGATP_MODE_SV39X4) * 9);

I don't think we want this kvm_info line, particularly if it doesn't also
include a VM ID in some form to allow readers to know which VM is using
the selected format. Let's either drop it or change it to kvm_debug and
include a VM ID.

Thanks,
drew

> +#endif
> +		return 0;
>  	default:
>  		return -EINVAL;
>  	}
> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index dddb781b0507..00c02a880518 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -974,6 +974,7 @@ struct kvm_enable_cap {
>  #define KVM_CAP_GUEST_MEMFD_FLAGS 244
>  #define KVM_CAP_ARM_SEA_TO_USER 245
>  #define KVM_CAP_S390_USER_OPEREXEC 246
> +#define KVM_CAP_RISCV_SET_HGATP_MODE 247
>  
>  struct kvm_irq_routing_irqchip {
>  	__u32 irqchip;
> -- 
> 2.50.1
> 
> 
> -- 
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
