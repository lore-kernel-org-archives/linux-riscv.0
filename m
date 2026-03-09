Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EAFBFCA18D
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Mar 2026 21:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yx/4Fmipfl2oKZ6pSxQ507VrMzRlZcuoPH+h18isT2o=; b=vrgUpxaw/vlm3K
	NWwWgoaE8f6JtPe5VOjbYtFw05aS1iwboUstYPInvMXRNq5V/+ndCbs1XCBSixDcl2o/Py19oPTJV
	bVPd2Cb1t5wKUdpMYar0fgz5PlntxVOmh+tUypkheikE1ru5FYxIp7uDOGbghKn1n2Q7spurVhkx0
	YIBEHtq6psM5yQ12cBSVJEvMZj6azy6SmKsyCfSCqQTNu+dt9212M7W3D4CZVjHno4Q28CENZ6krU
	WgitcNUgV94qsYp0X5orDcLUt0x5yWwLyrJkn6B8dqLJM3nfRK9bu+evjEjpFIajr6J2BvqSOGR0L
	FTiz8D8sWaazWAXoEq2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzhuF-00000008A3Z-1WT0;
	Mon, 09 Mar 2026 21:12:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzhuB-00000008A2j-3Vzy
	for linux-riscv@lists.infradead.org;
	Mon, 09 Mar 2026 21:12:49 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HBmDR859614
	for <linux-riscv@lists.infradead.org>; Mon, 9 Mar 2026 21:12:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hIRGX75FqhGaD3BMA10Fm2iv
	i9uf9Iqa56+NA2iQds4=; b=iwctoPmuglmq0Tf+ez67wQOU7T44KIlV1E5lOjbX
	bcNC4aXZ4D6Gzwyp3ADUzKFH6lmeJwdOSjiXKTvKwvcMdEtmiZYFyeUzUuiuFp40
	VAbZ/7znO6OIghtb5LL6ebpNHstAtdHXaBxA2FJRHnkD2T0+WCOl/9wbu4uJ4eqD
	mM2ZEaGJ018xRi7699eftmMw1bcfPEGSpTXEwgOPHOFl+8FsH4CMBvh7RyEEyCs3
	tqQ+mU7KJbPRZiY8MrtuIczgqdvj/zKiMWC7r9GdIJXYELL+wfepJMQMi4ggbypU
	qR/ZOUhCgrwm/aFcvBctADV4jotTPmIJvjEdnF4+4E7JlQ==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyhbsdea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 09 Mar 2026 21:12:45 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-679c5ed0942so134897389eaf.1
        for <linux-riscv@lists.infradead.org>; Mon, 09 Mar 2026 14:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773090764; x=1773695564; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hIRGX75FqhGaD3BMA10Fm2ivi9uf9Iqa56+NA2iQds4=;
        b=TCqi+CMKjqOJR5T+oOo98yLDBjRawoDo9v+mwrMwkGZr5Fym8v6kacFQY9EgFGrWqW
         KtQJNJZfG4EtWjWfobIp6HhkENjQ+nfl9+6edoSCzSUMWL6Exv7SgcedIxklXlt6wuQ7
         9G9jiD7pFW3Rii6AypHlOZ/hHqXidlxNjkZpDl0e1C8+GJgR17xJT2Si+UVNzWoqlim+
         pqSLI9nqRb9zpIdE32+eEwi4/gYpd37IqcIyhrjpcIYacBufCcBSSAWSF5iDVtpdUlUZ
         jK+j7oS88EtRMD2upiu4YrRfgO3AtQsvdKpyfOROWYMfKhCdC2jNU0phRc2wRwnmOn9K
         X3iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773090764; x=1773695564;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hIRGX75FqhGaD3BMA10Fm2ivi9uf9Iqa56+NA2iQds4=;
        b=f3zEVcHGD7SCiPD5V3zOORBsGMMHRFsZ8tV8gckH4C+GZlL1P53cLuvfhv0aO8Fht4
         45Zsk7tog91Ior2Z2Dk5+7i95FpN7Rbid6QF6qe7R4RD6YqxDvy9JsINJlh2UXk70jIL
         Qf5LkrlDGJAUFbeWNZjaO7MVzc6+lNxtNPZG4JpTmnLMpOcfm9j1vem4a4HjGRsWNtu8
         EnogVrgw7rXH0x5RY0mBkSrOBAq6U0/IznMpZngUlopR+od8UKCyinB538l/dC+Nv9qs
         2ohHjxcAGQ/5k9c8cKMuwmuZ64vzc2gHbrWcDn+O4ju6+5ZCCh7BNwMah0UBaK+O+Nf7
         CRHw==
X-Forwarded-Encrypted: i=1; AJvYcCXba9VvaYBO/TXtsKWWoAYvE7dcebb0eS0X5302p0X5W4TMV8KahKdayneO1mImyi51hrjTU0tZkLkBpw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwNK7ycjYKsUuREoXiM9ibKxy/HN1lAgrrdAPY414XHxoYqU3t5
	Lppb8AooslkBD2p+Pp8cc18G3Tjzo8UrsndlrxdfZTWird/Mhff4JUQIj0Zt3WwotERAmbOHPmY
	GHt4EsaoHllWzq/fReWEfeuwq1U9db4oJ+kaeJU2iDUqI433ncMMgRKO7gk1KvYfhXP1rGBY=
X-Gm-Gg: ATEYQzy+NEp4CDEv58lRGxFbTXbFresL94Y1Q7spScEcFgBsUaT5ZaYVdSCtEpLV5gg
	sch8etRfCB3YvVlRsSUV5BrjH63Pp7VW204KHcQdpD9YzCX025xqtvdUtJAgcFXHJorejuv7Lly
	loc3Si5lPQrnlGED3syoBal2PZYoJEl8MkAmbqR09ofKY4CD+AQYdYV2uofaurS0aM9FZYX+9kI
	3QwaBIkr8RZ9amxZAXK6mvrEXERl4W6Fc471HDzRQUuxny+lw01g4/PMyUFO3GVtK/Qnwxc+UY0
	jZM05jt8P8DeJ30OFDjfa2178ehBVuzIY/SiX7+584BnIqHNRks2DTughBuUVJakY461GO1fZFt
	DzL0EX1zTJ1DfzmN6BKUAfjX8NIjaOE8=
X-Received: by 2002:a05:6820:1991:b0:67a:1d88:46d5 with SMTP id 006d021491bc7-67b9bcd3839mr7601104eaf.31.1773090764546;
        Mon, 09 Mar 2026 14:12:44 -0700 (PDT)
X-Received: by 2002:a05:6820:1991:b0:67a:1d88:46d5 with SMTP id 006d021491bc7-67b9bcd3839mr7601074eaf.31.1773090764040;
        Mon, 09 Mar 2026 14:12:44 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-67bacd85dd6sm3996753eaf.11.2026.03.09.14.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 14:12:43 -0700 (PDT)
Date: Mon, 9 Mar 2026 16:12:43 -0500
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Osama Abdelkader <osama.abdelkader@gmail.com>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org,
        kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] RISC-V: KVM: fix PMU snapshot_set_shmem on 32-bit hosts
Message-ID: <guxeojlqqz6cfjdilxnuaeyft4cn4lwdrbplat7xgd5w5hod44@uxqymidomd55>
References: <20260307234355.69831-1-osama.abdelkader@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260307234355.69831-1-osama.abdelkader@gmail.com>
X-Authority-Analysis: v=2.4 cv=Rcmdyltv c=1 sm=1 tr=0 ts=69af37cd cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=JfrnYn6hAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=tWgbADMcUQFZQAcJDasA:9
 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19 a=CjuIK1q_8ugA:10 a=rBiNkAWo9uy_4UTK5NWh:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE4OCBTYWx0ZWRfXwDhdfI1kdbV3
 nekkFpmMpYBlgNX55NAkr79WhnFMC6UFakm1cDJ+LxfC0Px6C4PpICechQKJj738eq9mnQVvGWF
 AUPFTSeEYFgkK96eVyNctW4DVuOokk4LtsZZzklKvINpT/RgQekTG9abKwOotQV7Enw7F1c73Y8
 OLCSx/yEfIIOr4HEz8i6ZTGE1MxJ2UdkqJ8OFDkPSdIAJaCzkCG235WJTKvGPVDA8leGwRDHMgC
 OPKOjHsDKfVChbfEqVg1DvdQWAL2MOKRMNgfhGp1YXvcyi2CqQfP5SOXkIRMpps1X0elb8GtC6o
 qCgXFx38BR4aj2xmU4xfro8vHZFQLR2ou2n2mZSPu6tB1LmIoFF2o2KvbL9adsDAypgLcSss2lc
 TZfF1zyvyjpPp4gYzOflM/HzzCsj3rPAl1z9++Jocl5bj8FY+G7oBFCFdVVsdgyBqYfKUUKjqTI
 TnIFBOvY95cGJ1qVcjw==
X-Proofpoint-GUID: Hg1qaeRzCDRj7zi2Mdq_C8dYpCZAyD4N
X-Proofpoint-ORIG-GUID: Hg1qaeRzCDRj7zi2Mdq_C8dYpCZAyD4N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090188
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_141247_989531_CAF086AE 
X-CRM114-Status: GOOD (  19.63  )
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

On Sun, Mar 08, 2026 at 12:43:54AM +0100, Osama Abdelkader wrote:
> When saddr_high != 0 on RV32, the goto out was unconditional, causing
> valid 64-bit addresses to be rejected. Only goto out when the address
> is invalid (64-bit host with saddr_high != 0).
> 
> Fixes: c2f41ddbcdd7 ("RISC-V: KVM: Implement SBI PMU Snapshot feature")
> Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
> ---
>  arch/riscv/kvm/vcpu_pmu.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
> index 4d8d5e9aa53d..045099ca904b 100644
> --- a/arch/riscv/kvm/vcpu_pmu.c
> +++ b/arch/riscv/kvm/vcpu_pmu.c
> @@ -425,9 +425,10 @@ int kvm_riscv_vcpu_pmu_snapshot_set_shmem(struct kvm_vcpu *vcpu, unsigned long s
>  	if (saddr_high != 0) {
>  		if (IS_ENABLED(CONFIG_32BIT))
>  			saddr |= ((gpa_t)saddr_high << 32);
> -		else
> +		else {
>  			sbiret = SBI_ERR_INVALID_ADDRESS;
> -		goto out;
> +			goto out;
> +		}

nit: Could add the {} to the if-arm too in order to keep things balanced.
Otherwise,

Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>

Thanks,
drew

>  	}
>  
>  	kvpmu->sdata = kzalloc(snapshot_area_size, GFP_ATOMIC);
> -- 
> 2.43.0
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
