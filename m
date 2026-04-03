Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61637E85377
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Apr 2026 15:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bzm2VgG8uCtyKFCrpoGgnkDzfHGavKaWsfM2G3s0/Ng=; b=UnSjX6hEgFlK0H
	lju4IGqrQr1G7zLxF4vkApRTbZqsYsJ5fMj0KDgKLZ69RJXtemx6XMc96oIUBej5+ykXRwLjNiDuL
	WtxRAo5G/7qVqW1zHUDRRhVraLsD6wc6Mxon8mOSkoWOaVkHA6xY0B8btmxuZUOVY0tEavvSLlX+x
	15c3YLtc/gRu8PnxoTvPuK6YWkjYdgH1FQzncJ0/au7UIaSLyt76oNF3+sQUPGALWfKjODprtlOPn
	WyTyQOz1IYjIvZIK9Z9Vk3Swr5G0+zIwRJjzPto2CGS6C/lrxJV+WPyduy9RqVXTjT64TgZeDdnAJ
	GZksGpBF3da483wIpAzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8gTr-00000002DIZ-1CtA;
	Fri, 03 Apr 2026 15:30:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8gTn-00000002DE6-3L5Z
	for linux-riscv@lists.infradead.org;
	Fri, 03 Apr 2026 15:30:41 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633FQGkv2707221
	for <linux-riscv@lists.infradead.org>; Fri, 3 Apr 2026 15:30:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=x057pD4qBgfPmH6mGQKhbfbL
	KZ/u2npmqoIAxD1CZvw=; b=L02kEkE9FOYWgfe2dQtakWR9UsPL3StLa56Iu0UF
	3res9c4iJA2e2FD9Rp+3DG+v7VSToZub/BnjJiCP+7K6tdIhwJ1EoEFcTOWR3jkZ
	SJEexQqo05ehKOtc5SCv+Ej0nOFkYW7MlsnqhA+rlnSns4uAo53KYfK1xapvjbCC
	qAGNFWR+KyQfTqUzt67Z5lEWqH8a23fCEj4LSxgQ5Vt4IiZF+GUDCNAQvXjvRIdh
	6pcmW612kZN07QsahOzFfotPhL3Ju3R7JoVzCjm+IwZRks+wioNpnxDPYKieR6uH
	/VO0v+QX5ArUi2IxNrU4eFCVEQQTxssoixyoqMRzAqb/PQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9yfjjx12-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 03 Apr 2026 15:30:38 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2bda35eab74so2105907eec.0
        for <linux-riscv@lists.infradead.org>; Fri, 03 Apr 2026 08:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775230237; x=1775835037; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x057pD4qBgfPmH6mGQKhbfbLKZ/u2npmqoIAxD1CZvw=;
        b=G/jgboqv7ixXwUwn7DGrdIEcYl6TbB7OqNQeuhqjVaZAbDy7bgVNaTqPmTpF+v54Al
         GeWT8XgYWI4FBYJ5CfyBZHzzDA3Yj2f/zX1iobumsE7nf84+p73jFYYJetBcZr1bLQWJ
         VXjg6Xt8ot7XaWOuapOpD05TeMOfUnfgQ1myXq5z4r9a40GWeLqZm7yv4rQKxnMP45pq
         Or03RdOEnRZg+gYbII3yluYmmX02uzeLT9onq7ARextdCMf0kzPt+KEme7Wark6qwj7E
         wsSEBVT/nxBBM74Q5iHErfbBI5at54EVKN11QUndLUn/Z1BZoeZqBqnDA4SEic3kY/Gw
         Vwyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775230237; x=1775835037;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x057pD4qBgfPmH6mGQKhbfbLKZ/u2npmqoIAxD1CZvw=;
        b=NcKnH5F1abLK4JoMjq85lyqzCmomrIhR7mmNnrdu4szSusnUltLpGDCnLHsybn7pHA
         t1+MJlzVBHZKwVpiJNCXARDAddc5Se4PmJ2l3oDHmNctX/Xe5DBskV2RbRUBi7SoGi12
         OOrC4NpHEUAbA/q1YDssPsFihsBWjWbSyk422ooOiicH8n6P2LpDBXuFJtfHyqKIlvqP
         XSxzvxY/SY298OKtjmVOMcJJjGEkZjKXbADOmFiU4EgBRM3yJa5Xz5LnYAB0hS4hg3rT
         tAhj3ypCv75fSNptgSWJlMmWt/aBGdTOKgc93hzD1yVQjLxOgJ/y7Z5k9poImSFdjAVV
         4b2w==
X-Forwarded-Encrypted: i=1; AJvYcCVpMsz4qLFAAG6PmipxRuu3wrAu+PoQ/ls+sbZ+wXbxSMSsUxmoiuUywhof4FnmbbT6XXIb+43Jn2i3qQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwhcH66sAr1YVoNZOiGrriQvxkjvy6U9OOdTrZ321t42c8BUFva
	i6XofW1PNdrNdQxBGeeIh22LqQfmC7kRBmeREK2mV2rsC9hzXSA47mfjMMuIUcimeYmCS+RXh60
	RtdCpbz0XUVsWxoUNmJ3LfS69K5EXB4PwJCkR+sBPk/G3ZEAe0i1cFo1kg20uVG2BQN62hMA=
X-Gm-Gg: AeBDievkepy3KVgBG+TpVI07n/nK+cm9nJbKcYDfKZ5c7skAgeJMwey7ZCCem7Rjmra
	DevIgU2SjYplfZtA1uzQqbFydYF0qX15rgLs/TB/9Fvs5I7nm1Ethn+7nfQmbQefjz8lSTm3bmA
	bAZcB7ezjrcPqBO5WxXJqZNbvnDHZGabj0vrP6x9Y9yzXU/QxdJtI1Fq6WOUVjHkoXf+RF5khH3
	sq+g5bPNZuFxavkc7Sv1WiVY9/cJHcWrz+VyCmI2vddXZhN0+6Vy5Uu+qRTYQGoXEJIWtpBzjp0
	x05X7qMnaiEDiy155EkQlySuXB/KFWPpdR+4HjWnos/9nEJI3/OLhQC9WSbYrJYtXqqU4SvQVxn
	/OfbFwoSCv5ZpcjnNre3hlJ9yKAnDg2Q=
X-Received: by 2002:a05:7300:6c1f:b0:2c1:517d:5e97 with SMTP id 5a478bee46e88-2cbf9ee8ce0mr1399194eec.7.1775230237343;
        Fri, 03 Apr 2026 08:30:37 -0700 (PDT)
X-Received: by 2002:a05:7300:6c1f:b0:2c1:517d:5e97 with SMTP id 5a478bee46e88-2cbf9ee8ce0mr1399167eec.7.1775230236741;
        Fri, 03 Apr 2026 08:30:36 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2cc0c6ec215sm2627655eec.4.2026.04.03.08.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 08:30:36 -0700 (PDT)
Date: Fri, 3 Apr 2026 10:30:35 -0500
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Jiakai Xu <jiakaiPeanut@gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Fix shift-out-of-bounds in
 make_xfence_request()
Message-ID: <hkbpiuquqvsseu7tkv5gtlfxlj7qvsjoj6rndntty2btpcmdpx@4dfgpwffld2k>
References: <20260403061302.2203179-1-xujiakai2025@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260403061302.2203179-1-xujiakai2025@iscas.ac.cn>
X-Proofpoint-GUID: P257i6xS7Ubo-MPJntH_NqSZDfBRpI0h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDEzNyBTYWx0ZWRfXxw123c3ewhs2
 64bP99Q/AopINRfFOSdog4BZc2Bvk/qPo+apDU4Sm2iK/4s/rDGkL25A4abpnrDSsPzrCHJ8EhG
 YFx0XeE02jxEhTGERc39/ZK6/HSOZbCRkGJRJ6cMXRNBNTZiQnlrqOmdectYfU7wZ+mNTIysf7R
 7W+ijF/CVAXyumZbAw6xm0yWnsD6NfAxwSbXUFprtXpUJlVe+il1qtQLump2vK0XC56XqfjYfxV
 8K89/iYBM+QiJ4Joy4HSltYPw9B8bzYqZI0I/Bt4+3ccYsI4aB79OipaO9wua6nbQGskpnOaLg3
 kOFkiQVDQVyFVCltMRj0bt4Rqr3zB9kBXpMvptHH9wYKWXR6i9Wb3zr79+5MY9GT1eMlHftF8tI
 Xeb12t1EJpdp9PZOC/E398OFvetbxg2/xL9EiO77qUMITQjoCJoKfYO7rht2fgB6ZhfFHNvuJUA
 7rNMy7G132NnmcY/JOg==
X-Authority-Analysis: v=2.4 cv=OrpCCi/t c=1 sm=1 tr=0 ts=69cfdd1e cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=rTD6Z3Ji9OhdE_Ng1OYA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: P257i6xS7Ubo-MPJntH_NqSZDfBRpI0h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_083039_954672_EDF422C4 
X-CRM114-Status: GOOD (  25.04  )
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

On Fri, Apr 03, 2026 at 06:13:02AM +0000, Jiakai Xu wrote:
> The make_xfence_request() function uses a shift operation to check if a
> vCPU is in the hart mask:
> 
>   if (!(hmask & (1UL << (vcpu->vcpu_id - hbase))))
> 
> However, when the difference between vcpu_id and hbase
> is >= BITS_PER_LONG, the shift operation causes undefined behavior.
> 
> This was detected by UBSAN:
>   UBSAN: shift-out-of-bounds in arch/riscv/kvm/tlb.c:343:23
>   shift exponent 256 is too large for 64-bit type 'long unsigned int'
> 
> Fix this by adding a bounds check before the shift operation.
> 
> This bug was found by fuzzing the KVM RISC-V interface.
> 
> Fixes: 13acfec2dbcc ("RISC-V: KVM: Add remote HFENCE functions based on VCPU requests")
> Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
> Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
> ---
>  arch/riscv/kvm/tlb.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/kvm/tlb.c b/arch/riscv/kvm/tlb.c
> index ff1aeac4eb8eb..500e001513a11 100644
> --- a/arch/riscv/kvm/tlb.c
> +++ b/arch/riscv/kvm/tlb.c
> @@ -333,14 +333,17 @@ static void make_xfence_request(struct kvm *kvm,
>  	unsigned long i;
>  	struct kvm_vcpu *vcpu;
>  	unsigned int actual_req = req;
> +	unsigned int idx;
>  	DECLARE_BITMAP(vcpu_mask, KVM_MAX_VCPUS);
>  
>  	bitmap_zero(vcpu_mask, KVM_MAX_VCPUS);
>  	kvm_for_each_vcpu(i, vcpu, kvm) {
>  		if (hbase != -1UL) {
> -			if (vcpu->vcpu_id < hbase)
> +			idx = vcpu->vcpu_id - hbase;
> +
> +			if (idx < 0 || idx >= BITS_PER_LONG)

idx is unsigned, so I would expect this 'idx < 0' to produce a warning
that it's always false.

I wouldn't introduce idx and just change the current condition instead

  if (vcpu->vcpu_id < hbase || vcpu->vcpu_id >= hbase + BITS_PER_LONG)
     continue;

>  				continue;
> -			if (!(hmask & (1UL << (vcpu->vcpu_id - hbase))))
> +			if (!(hmask & (1UL << idx)))
>  				continue;
>  		}
>  
> -- 
> 2.34.1
> 

unsigned arithmetic makes my head hurt. It would hurt less if we
guaranteed the ranges of all the components. vcpu_ids are
guaranteed to be [ 0, min(KVM_MAX_VCPU_IDS, INT_MAX) ), see
kvm_vm_ioctl_create_vcpu(). We should also test and reject hbase
and hmask in all the SBI calls to ensure that hbase is in the
same range as vcpu_ids and hmask is in the [0, BITS_PER_LONG)
range.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
