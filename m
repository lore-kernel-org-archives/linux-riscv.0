Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D066CECD992
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Feb 2026 18:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fcsObG+FHtj0kXxtmmE1UzW8LQ5/ktYrqhJ75BdkaaY=; b=e/4sGql/NA2VNk
	J9xfi2r8rRjrBI+RdkIcS8Oclt1Fvu4qzEjp0VkqsZ+JElwkjjjNpl6Oogwr+qp+TI5jLkdLjhuAz
	DVn04eU+NuPtUQEWfScYLuKdUVFhZMMZ9LcAPTJJ8O1IsVYZY4bckE1qytm6v9nxTtIVNqRVESCBW
	1+CEH1fyq4SaZpIcMOYZIqR1bfn78WT7fTHO/AtXoEo/e4IDlb2xaQ2Q6S7PD+uLBAsJ6k3Z4M3Il
	FCppyoJoj1KJ4P0P9yEp9SiQOZToLsgqLXIv5FmU0pltbN5YkhZpbxBUoEgIr+hm9Z8v8t0bAfM+O
	tGsYuxhhMaFBw6hn/4qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo3yp-0000000AMEI-3LHM;
	Thu, 05 Feb 2026 18:21:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo3yn-0000000AMDG-172W
	for linux-riscv@lists.infradead.org;
	Thu, 05 Feb 2026 18:21:26 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615AjhKq2157615
	for <linux-riscv@lists.infradead.org>; Thu, 5 Feb 2026 18:21:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xaaQh/d3o4zexWT6KtAUFHYS
	pjo/w8LAVOendENj7o0=; b=LArKC8QWlqq5EcIWlj+OY0MIC45250XWIdws7g6y
	gmkRgQt6miW+cRwLwSAiYuzLl31ZvH13otJV+Yrt3BpBaq+Dvfm4AlTmSkRIV/1O
	SZw59uGnr0QktqzxSEDcJdPVZ0/nZGZWlzAZxWXPh9oZda+R0+/8U7AVUEZ9SJbC
	UiVLyy3JBjcLvKkWSXy4mb3rolYVeJhY8wVgXkbLttFDVr2aKrU6Ejo+/IG7FXrW
	wOm+Ph3auIYIkL9qnkb3adXSm7q1Y09IQNp43KNA+V9NlTjb1a16uo0/waGuDfh3
	IdO1e6DPo52khXRIQGSJX9abbqmsySY3pWStqaOW9CCggw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4gynu23h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 05 Feb 2026 18:21:23 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2b71041d135so1519622eec.1
        for <linux-riscv@lists.infradead.org>; Thu, 05 Feb 2026 10:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770315683; x=1770920483; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xaaQh/d3o4zexWT6KtAUFHYSpjo/w8LAVOendENj7o0=;
        b=edNSgvIBhk34xTKpCWDTl9Shs0F2t7dNpWh3vxaqhMtaWn9Uzbkw5NwFELy03D8vtt
         imarzWoz025I31ndVHIN+beD6FAeU1rLjROi4zMODdf/yJpuFJ4+Nq5rA4Y7K6aI3HBw
         C/D9v5T0Yyapq3zR4iRxoubMwImtjMw9/PsonCOyNFKMpRp33XwRKExCvcnNEBPOVR5d
         hSHhdabwf8IUDD6QrGRFe8KuBsM2Pom04fSyJLS/fNL/5mM7JyyUCZGjfsrXrKgxB3Jh
         U68ahsvWXYsPbT4cnbLI0huTxxxZxVWo0gjcHSuXYVZhnlDRtSzNcY8aYIUusuvKodqz
         A76Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770315683; x=1770920483;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xaaQh/d3o4zexWT6KtAUFHYSpjo/w8LAVOendENj7o0=;
        b=rNH24cTV+E9jUfQorjEj6ESRY83gAOOXAV3W27Le6uWuuc9KblSjzRad2brjT/eit1
         eiL/0h3xfJFQPGQPSUZhvuSaitK7rZ45OrFcsFveoF9C3O9EDMp5E56HZlQ6PVNlR0re
         CrvoUlo+XCP7fSZ9EQkhpubhw5SWT+0yc5MKv6yF/mY92Es901H5Te+m3k6UpOBSL3Wt
         J+CTEiskk0Q6JHKp+zEXuNQUKDOgEh/7Y9BDwhufkOiAgDgYJPPdltANjoyKpaYTKeSo
         2+zBm2svO2JHxgJ4sTXWefRpDxAtPD0XneAxwbI2fbmpU84QR3UjNxH6mMp4SRTU6EV/
         Ko2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXuQ9yiLymASkDFl1eAplmY7IFvbyox8UwMwQ09olLH8FsubJmKxYR421IvlwNkhAbmP57qw2KRHFD0OQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6qStEKssiQfyS2TvwX2xvymISa3FfcEKOXbU6ivmjUC1/pR24
	cbYxxKDavoFD0uhg5Qj47SXt/hoMpBttlpCscxjuRSjdebDqF6DqsEuqNGPeDvmCNO0S3TidWW7
	pFvRfcopfaioPIeH347rayl7KSYTIzeD1m54kgKInSVOqNrk9VrpKV0uGF4INOwwAqM/Gfk630M
	Get0k=
X-Gm-Gg: AZuq6aKdgNPajivVciAZC8s0Bj2d1Dr+sPfUct8ri4gzBvy7ynoIirmELBXVbPo54/I
	4hVEnwTeMfVUJMzx6y3/NrLWRW1Oe3A2IlhA5rdxNv82M7aojNvuPUHV9kRANfFpRBWBTDGRcsK
	4cVV4v2lFk+KF9ZiXgNGi673IgvrM5PdL8ct655vW+8egbmfYWIFxo7BzKMxIUVRae/BpDZMJTS
	TUUFkVUAMnnNoEEF3ghMl76byiNtffuM3LOieU2kBoF3Xjp0DtSu0OSEyWk8TEuCVvKen/WxNVn
	aEVKmSB2Z9SyZwznm8CCYgNcEXjZSKzVF9akVspPAb6k0D5lL2a8lnkP6Z6jDGoI2/xy64+vpfB
	VNYxjgviJlmun1rnlu2o=
X-Received: by 2002:a05:7022:408a:b0:127:fa:7758 with SMTP id a92af1059eb24-12700fa842dmr590926c88.9.1770315682521;
        Thu, 05 Feb 2026 10:21:22 -0800 (PST)
X-Received: by 2002:a05:7022:408a:b0:127:fa:7758 with SMTP id a92af1059eb24-12700fa842dmr590911c88.9.1770315681918;
        Thu, 05 Feb 2026 10:21:21 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-127041e5e3asm18160c88.7.2026.02.05.10.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 10:21:21 -0800 (PST)
Date: Thu, 5 Feb 2026 12:21:20 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: cp0613@linux.alibaba.com
Cc: pjw@kernel.org, anup@brainfault.org, alex@ghiti.fr, guoren@kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: smp: Align secondary_start_sbi to 4 bytes
Message-ID: <o7fbcofuyu3nuqk2bituvfr7fitsiiimvu55h4wyefezpuqniw@34xczmgjn5lm>
References: <20260205121625.716-1-cp0613@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260205121625.716-1-cp0613@linux.alibaba.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDEzOSBTYWx0ZWRfXxP44mW2lsp+g
 hUHTdrezzfHDl0BNWOzrGdpGRvUKLyP/cOVdDXZ0wBpHQxOtjXqMhM3WAtrVcqpOR4QFmXgqk07
 XHdxSWaFIC3p5eoygzX1K+KxCYrX2nmLWiZ45soBARpvKfJnEylQ5RDQNGjnX3S9cTE2Yi28CUn
 B9RW75jfKwamtR0XHOH2i/RUPNu2SJt4IpEy8PSFZ8pRpEDhCFcXm5p114VCAq65rf6TmfATnAP
 +PXig++YmvYEKhNXJcIWN7pIgaGNncpkpmIFPTZMbi4OQ93iqjXy8G2mHPremlZ65cTweIC1K5J
 5n2aqarEIPrMU4siSab3bJrHuS8PAd0KedM31Jp2YTFVwkJQniryIEDBkwvHPAFJrRZx0/iDpiC
 HDyqPa55OUfxob9GoX6rMB69Cf3vW82+UGn0AbHa4qcwoWg8d/f4iRPRkTA2GLfOL27ZrSG4jyU
 moYXNKVJcJ4fKsI9OxQ==
X-Authority-Analysis: v=2.4 cv=GdcaXAXL c=1 sm=1 tr=0 ts=6984dfa4 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=SRrdq9N9AAAA:8 a=EUspDBNiAAAA:8
 a=nd4HULJE9tGIbypOo2AA:9 a=CjuIK1q_8ugA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: AOEejJYbBu_abAJUjJD7Zp2fo-MYqYhD
X-Proofpoint-GUID: AOEejJYbBu_abAJUjJD7Zp2fo-MYqYhD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_04,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_102125_463113_647BFFBF 
X-CRM114-Status: GOOD (  25.10  )
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

On Thu, Feb 05, 2026 at 08:16:25PM +0800, cp0613@linux.alibaba.com wrote:
> From: Chen Pei <cp0613@linux.alibaba.com>
> 
> During SMP boot, the secondary_start_sbi address is passed to the
> slave core via sbi_hsm_hart_start. In OpenSBI, this address is
> written to STVEC in sbi_hart_switch_mode.
> 
> According to the privileged specification, the BASE field of STVEC
> must always be aligned on a 4-byte boundary. However, System.map
> reveals that secondary_start_sbi is not a 4-byte aligned address.
> 
> For example, the address of secondary_start_sbi is
> 0xffffffff80001066, and the disassembly is as follows:
> 
> Dump of assembler code from 0xffffffff80001052 to 0xffffffff8000107a:
>    0xffffffff80001052 <_start+4178>:    c.nop   -11
>    0xffffffff80001054 <_start+4180>:    auipc   gp,0x1a1f
>    0xffffffff80001058 <_start+4184>:    addi    gp,gp,84
>    0xffffffff8000105c <_start+4188>:    csrw    satp,a2
>    0xffffffff80001060 <_start+4192>:    sfence.vma
>    0xffffffff80001064 <_start+4196>:    ret
>    0xffffffff80001066 <_start+4198>:    csrw    sie,zero
>    0xffffffff8000106a <_start+4202>:    csrw    sip,zero
>    0xffffffff8000106e <_start+4206>:    li      t0,2
>    0xffffffff80001070 <_start+4208>:    csrw    scounteren,t0
>    0xffffffff80001074 <_start+4212>:    auipc   gp,0x1a1f
>    0xffffffff80001078 <_start+4216>:    addi    gp,gp,52
> 
> When writing to STVEC at address 0xffffffff80001066, the actual
> write address is 0xffffffff80001064, corresponding to the address
> of the previous ret instruction. This is unexpected, and if an
> interrupt occurs at this point, it will cause unpredictable results.
> 
> However, secondary_start_sbi immediately masks all interrupts and
> updates STVEC, so no problems occurred.
> 
> In summary, it is more reasonable to make secondary_start_sbi
> satisfy 4-byte alignment.
> 
> Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
> ---
>  arch/riscv/kernel/head.S | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> index bdf3352acf4c..f35dbfa79505 100644
> --- a/arch/riscv/kernel/head.S
> +++ b/arch/riscv/kernel/head.S
> @@ -124,6 +124,7 @@ relocate_enable_mmu:
>  
>  	ret
>  #endif /* CONFIG_MMU */
> +.align 2
>  #ifdef CONFIG_SMP
>  	.global secondary_start_sbi
>  secondary_start_sbi:
> -- 
> 2.50.1
>

Looks good, but the .align 2 would ideally go inside the
#ifdef CONFIG_SMP, just above the label.

Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
