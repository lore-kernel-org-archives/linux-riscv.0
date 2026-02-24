Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D186CF4BB98
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Feb 2026 22:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/3DK29SmzOcFf/PAEUUmRQ1JN1TsGo2b6l+zyVndbIY=; b=nhXJIOU0uMQBZ2
	wk6zX1lEiBxSARevuFtWg1SYrUioIuEFVAncpSWfNgtUjUpDogCB8VI5C9jk7WnWZBY59dlZIgH1y
	3gkdPPOXjnKvqrlaZjE6E1JPS0HNpT7WpIb5sldLPcRm8A8//6FmqmME8xSg82HU+LxO4rlFVftbK
	W0BRcXQJAdOTxCblSQvKdf4iFoB1FxPp/YOWU5alFmcUWaG6Zp6//ZK/P3jN/ftzVmQLDhRPmQUfe
	mz+Q6KR/Y8ffmH3XgOo63J5kYw4m0jL8JbGb/WRI3zNQvXpUlsE85nCFklJTPy+EoGFfXheWliivr
	zR+IDXSsuPWPobZtdbIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv10b-00000002sfX-1wSu;
	Tue, 24 Feb 2026 22:36:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv10Y-00000002seR-3sEl
	for linux-riscv@lists.infradead.org;
	Tue, 24 Feb 2026 22:36:00 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OH5f4x2334766
	for <linux-riscv@lists.infradead.org>; Tue, 24 Feb 2026 22:35:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jl3/kGLy/uiPn4E9pCww6rxR
	H2A13SEeo46Ae3ywkm8=; b=XX7g7Ft0xLvppEfCX8r7ER8OMh4f6cTzRW7dZQh4
	mdVLfHdvzZ4Jm0VmMGs8S9EI/Y4DHbe+bTNRbQ19fQMgyH5CpiCyPjfFuMxuABHD
	Y+2AuJ2RnGRO5Zuj6YZ2kw+kocvRKVcnmxMDub3GHTYW9JIwaknLrLFqaQaq33Px
	8iZomqe07aMpgVANr0o5rXVVmWycHRPgu21YvPrlx9DAxvyaACW1w0rGd/pamkWD
	e3EAoijW0pBfyEBlmqhQjggxFPHqdeLBvsYaFO/ibdLuHgqc30E8qeVAwsFxgb9w
	3GaMKCADAWcLiQ4n6lGVSB2mWQQno3Hftd5NcV706zjxgQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chg37s3yy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 24 Feb 2026 22:35:58 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2bd3bf5dde4so5801009eec.1
        for <linux-riscv@lists.infradead.org>; Tue, 24 Feb 2026 14:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771972557; x=1772577357; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jl3/kGLy/uiPn4E9pCww6rxRH2A13SEeo46Ae3ywkm8=;
        b=cEWA0oNRyC1ibIbX59GYxtZg9QsFo3sMfWFDYcLUSq1DRYjD6jfcfMIw+NVwbcFaC8
         292ZnNYJ3sOJ8djoDAukIpvmT4Z5WcNVaFGbxsngZ6dLVnkd5npAUw6gZI5XUdE0uxqP
         DfFOMNhxj5XpsX9fStFM4/wDVWzn4y0RiY/9w/FkxpBi1YNWTsLwYNhBYKgf3uF4zoGW
         jojh9evY0WCXOggg2xPI1aRbcD2xlAblVzeZeTa97zIhWiKQCQgQ1PB/V64afR7g125o
         l75jyHm3RuO3KsmuuRE5l0NrGf+Ut011jrAxchKjJHMLxUfMddwAr60cGflY0VxsNXjp
         lSXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771972557; x=1772577357;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jl3/kGLy/uiPn4E9pCww6rxRH2A13SEeo46Ae3ywkm8=;
        b=tP1NR67RD/uJgtG5NB0+/dc/IgMUYhMzrcoOvuloKT9fWOBA5jvX4YaQUD3vj8cZen
         W0OkWdR1t8EDjr1yxxywXWS4JFsAqhhlbW+rDdwdsGwzSDBAzoOfatDb53j8guImwBOX
         YYYr0QLKwrd1I+M5Zm4KEF1RspNLj2nXpMISZUNRQOXPDL7ELTH210uqYkhG3vd/2LQ+
         MX8BU6Rtivtud+pf5wpEPBzLoTHzHtk4WkrBAIAcXdm+qU44eT4vLt99hBZmRTs+QuCW
         8v1TXmU1IWKSFAdijwptC8Nnbp/7En/NJ010E5jlXgFNrAPVSKuOv1c0foXBKWlI2/S8
         Z1yQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9ZM8lElA/JsnfqKPxo6qVt+c6zqPGiMn9GTU8rJPWcNU16TVOSANaI5W94jefsuNBV6eZVYOsko87Tw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzCJKe7upSM50YYJauVIGVLybPqXq4AM+HxRAOJhUPNPgjl4zxP
	NtHxb246/EOxK1Xabwg4KnLPPQwIjrk3WQ1opaE6hy5t5O8MPYoVkpAyjpnff9IAkTKwkSTi8JN
	8ry2h2GCr0EJYc+ANss2Tn+KkzjT+6n7GPYsiMJtnsB8uBJ+JTPakty2FMOskw8mu1Q8M7io=
X-Gm-Gg: ATEYQzzdTxrO9koByHMlGlornQ4K8HC8Yhkfyd571sUS3YQHpT9+o73E8NL2i2qfToD
	yesutR17mylNMD9AS3VDhbo6wH/oJQkCM5N9EaK5Y4Ul+A4IA3n9P/F0yDRwruwa3DWmXYZdfnN
	3Jqc4CHw8xc6KjHh6dFBLypG7pKHc1ApJHLDxJ95hFW3IFkbr6aAgFmEcux4ITYOxU24UugpJlc
	bi7XfggM+U+DjzG5ZzNCctwk/e1zhh5gp4sAcNtQF9C7nuq6Z+N0uridJ4rpKGB8xkInXAb5H/l
	QJrZZpzZ0wguhfKdE1wj8ZRJKKORtepp9fsF0IOv7Pad/H6namRiC6WBI0wbQPrTHKCmqOMvBfJ
	AXm8CgeqVtJcJ+YS5qVUjPtZRK5/zXUg=
X-Received: by 2002:a05:7301:1e92:b0:2ba:9115:2fab with SMTP id 5a478bee46e88-2bdc31a9008mr50756eec.12.1771972557374;
        Tue, 24 Feb 2026 14:35:57 -0800 (PST)
X-Received: by 2002:a05:7301:1e92:b0:2ba:9115:2fab with SMTP id 5a478bee46e88-2bdc31a9008mr50743eec.12.1771972556842;
        Tue, 24 Feb 2026 14:35:56 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bd7dbe82desm8327254eec.20.2026.02.24.14.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 14:35:55 -0800 (PST)
Date: Tue, 24 Feb 2026 16:35:54 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
        kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-kselftest@vger.kernel.org, Anup Patel <anup@brainfault.org>,
        Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>,
        Andrew Jones <ajones@ventanamicro.com>,
        Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>,
        Jiakai Xu <jiakaiPeanut@gmail.com>
Subject: Re: [PATCH v7 3/3] RISC-V: KVM: selftests: Add RISC-V SBI STA shmem
 alignment tests
Message-ID: <7spmby7jcusyegus2knlhb7nvnyk5c3yz4z5luu6piymj6rwsv@zgktge5bmgd5>
References: <20260213103557.3207335-1-xujiakai2025@iscas.ac.cn>
 <20260213103557.3207335-4-xujiakai2025@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260213103557.3207335-4-xujiakai2025@iscas.ac.cn>
X-Authority-Analysis: v=2.4 cv=br1BxUai c=1 sm=1 tr=0 ts=699e27ce cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=9ujUvY2DB1qyNZ7L-csA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDE5NyBTYWx0ZWRfXx8PlJK/clknG
 XS/0ePlTbBw0wfDFhN8qDjk9QbO9VUszWwyyIVHc6uFLhKPUdGOiMj2EDNW4UiafbvGxo6pzamG
 R3gRFN27ea35mRI8aYmOWpHdvnKKMwMMghbHFAaNkE+eP8csTk9p9kVft+7PnEAs9FmPwY3BFN2
 zpyfghYH9dSrYdj9CAPCm/R1vepbJnP5mArrTbxron8NIsnqIBJ9/TtQel+5X+Fvqy12YErqZ0g
 Q3NQscogwI7YD0S03Zjn+tHGOib3slZMgYdaVHHKaU87pc2gFEmsb/k+ksTeE9e7oQRrAvNGuyN
 YQ5DnpkbINyUo2QlzT7QB946+PFbh6jfJN/GxuSV6ge9aHbuD8JsdCOIhlnNUUXezZuMmR20siX
 K8QYMf8Kjs2ur3oxMwRYtuQzE7zhelxf7sxUf46mDHRVivFLjtlvPdgvf+R8YyTD1U8S6arIfuj
 4GPVdYkzXKKX3+PSRRg==
X-Proofpoint-ORIG-GUID: 8YiZPK_XMFzTQ05Cm0zG4uh3GuslkaS2
X-Proofpoint-GUID: 8YiZPK_XMFzTQ05Cm0zG4uh3GuslkaS2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602240197
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_143558_970507_B147CEFA 
X-CRM114-Status: GOOD (  26.11  )
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

On Fri, Feb 13, 2026 at 10:35:57AM +0000, Jiakai Xu wrote:
> Add RISC-V KVM selftests to verify the SBI Steal-Time Accounting (STA)
> shared memory alignment requirements.
> 
> The SBI specification requires the STA shared memory GPA to be 64-byte
> aligned, or set to all-ones to explicitly disable steal-time accounting.
> This test verifies that KVM enforces the expected behavior when
> configuring the SBI STA shared memory via KVM_SET_ONE_REG.
> 
> Specifically, the test checks that:
> - misaligned GPAs are rejected with -EINVAL
> - 64-byte aligned GPAs are accepted
> - all-ones GPA is accepted
> 
> Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
> Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
> ---
> V6 -> V7: 
> - Removed RISCV_SBI_STA_REG() macro addition and used existing 
> KVM_REG_RISCV_SBI_STA_REG(shmem_lo) instead.
> - Refined assertion messages per review feedback.
> - Split into two patches per Andrew Jones' suggestion:
>     Refactored UAPI tests from steal_time_init() into dedicated 
>     check_steal_time_uapi() function and added empty stub for 
>     RISC-V.
>     Filled in RISC-V stub with STA alignment tests. (this patch)
> ---
>  tools/testing/selftests/kvm/steal_time.c | 26 +++++++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/kvm/steal_time.c b/tools/testing/selftests/kvm/steal_time.c
> index a814f6f3f8b41..2af7fd7513d55 100644
> --- a/tools/testing/selftests/kvm/steal_time.c
> +++ b/tools/testing/selftests/kvm/steal_time.c
> @@ -233,6 +233,7 @@ static void check_steal_time_uapi(struct kvm_vcpu *vcpu)
>  
>  /* SBI STA shmem must have 64-byte alignment */
>  #define STEAL_TIME_SIZE		((sizeof(struct sta_struct) + 63) & ~63)
> +#define INVALID_GPA (~(u64)0)

This belongs in kvm_util_types.h

>  
>  static vm_paddr_t st_gpa[NR_VCPUS];
>  
> @@ -327,7 +328,30 @@ static void steal_time_dump(struct kvm_vm *vm, uint32_t vcpu_idx)
>  
>  static void check_steal_time_uapi(struct kvm_vcpu *vcpu)
>  {
> -	/* RISC-V UAPI tests will be added in a subsequent patch */
> +	struct kvm_one_reg reg;
> +	uint64_t shmem;
> +	int ret;
> +
> +	reg.id = KVM_REG_RISCV_SBI_STA_REG(shmem_lo);
> +	reg.addr = (uint64_t)&shmem;
> +
> +	/* Case 1: misaligned GPA */
> +	shmem = ST_GPA_BASE + 1;
> +	ret = __vcpu_ioctl(vcpu, KVM_SET_ONE_REG, &reg);
> +	TEST_ASSERT(ret == -1 && errno == EINVAL,
> +		    "misaligned STA shmem returns -EINVAL");
> +
> +	/* Case 2: 64-byte aligned GPA */
> +	shmem = ST_GPA_BASE;
> +	ret = __vcpu_ioctl(vcpu, KVM_SET_ONE_REG, &reg);
> +	TEST_ASSERT(ret == 0,
> +		    "aligned STA shmem succeeds");
> +
> +	/* Case 3: INVALID_GPA disables STA */
> +	shmem = INVALID_GPA;
> +	ret = __vcpu_ioctl(vcpu, KVM_SET_ONE_REG, &reg);
> +	TEST_ASSERT(ret == 0,
> +		    "all-ones for STA shmem succeeds");
>  }

I'd remove the 'Case 1', 'Case 2', text from the comments because it'll
be a pain to maintain when people want to add/remove test cases.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
