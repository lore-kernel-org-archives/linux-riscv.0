Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AAE2F8A149
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Apr 2026 08:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=blP2EhV7zB4SlGbctfR1vBzbyW/UHMZG5kZqXxxzPHg=; b=ZES21daeMYnfN7
	UAIgR1j/En2iu1igL7VSKr4jWxYMvxQjU4ENI/kzAel3sQnpXEWdB0IUsrvGe2Qgx+7KIPctxzQSu
	U6H33IWKvbiIdJnaZoftJzu3EwBRyqjQAVmvH9OeLfGXGHopZadnrCmrjt/vddnOH1gkHoZRvffVK
	88JIyw2ybyyR0kmso/TEnpYAJ73kj1CHDZy9oX1fl5uVHN/R5I9ZrZKFh8EDjLrIN7xHOJ0hyieDC
	GkO8uFC/iLVt2fJjl5n+OG967+TmqTq3isDPoNe+80qbGnE7WojK+ebmT5iHRGMB6fL5sAHhC6gQG
	edjrLtJaPhK86JmrMSyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDIWP-00000002CdQ-380W;
	Thu, 16 Apr 2026 08:56:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDIWM-00000002Cbp-3dKL
	for linux-riscv@lists.infradead.org;
	Thu, 16 Apr 2026 08:56:24 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G6JQnC1668278
	for <linux-riscv@lists.infradead.org>; Thu, 16 Apr 2026 08:56:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7PJKkSl8igezGMSjj7lPVu8P
	ECVNUlUo2WNQqgBP0H4=; b=NbxAPdKoDsZzWMXdXMrFQoUQxjz31jjjxA/6ZbLe
	RevTpxrcJ5W3ZfKhvZXzz59whcSQ/ePhzXVzjs1ci0f9z1Rst7ygLV8ft+RaWocI
	ATrwYD5ULhHpxIDwxu9VayTd3UZp1idaxB4KMM/mBmH7UlfYMLAmGUGMqiz0lVAE
	EphmRqC63AJzfBcl8I5yrQ6sMjM9zxR1e7a/sc5i/xnXOaXL+aBvXiavsjzugbDV
	giCzqIh2ZcMQQIDeubrBvG8d1yM1UmzGYfGOfEGV/DCrx+LpAYqpOqstytoHZqMR
	dFFf1sbGIoMUDzEho72lSHF9uDLZ/O+KBHFIicULn8pSLg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djtd90kst-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 16 Apr 2026 08:56:21 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-12c20a91932so17871884c88.1
        for <linux-riscv@lists.infradead.org>; Thu, 16 Apr 2026 01:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776329781; x=1776934581; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7PJKkSl8igezGMSjj7lPVu8PECVNUlUo2WNQqgBP0H4=;
        b=f/svGJYboks70Aduje9hYDP4BJWK5xVJrYBMC4xepSGm05Rzfr0hkADQuW2zni41cj
         RdKJeUJyrMa4smsUoR3lOixYt3y7qJDixO68ubPysKSD+6Yh+Uvwz+MqdeHDV/62PlZR
         TMDLxl7hvWQIj3W8OegY0nbQ5WPbGb9ScMDj2HFfybjjlr20SgtQOa9KuyYJHxGHeQWQ
         2ZHSj07tKvUgbg1f9qwmQ+/VnFzeeXC6B1TYMo1ibq0yBMgNwGOIKv8hCVHV/+f6vZuA
         LVlHvi8AzsfjGVRcNdSEziLzsGNf4tzKreqiwi/rBSaSEZyODMa5g/02UpmIvGoY9Cws
         9uSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776329781; x=1776934581;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7PJKkSl8igezGMSjj7lPVu8PECVNUlUo2WNQqgBP0H4=;
        b=GLCOA46JfhyYPb/6Axl2HvZIGLuPAk8tgIfo/UY8J6ox43AHAy/9NOtTY7LyZm3HbA
         Bug8RHf29TqMz58kI1ORnGTDi43zOtMjpQ3NjmhM/Magrp3lhv13O27Zrwj6DseY5O/5
         Fkp3qCcQVSUpkYSQ4mrZ7IXXiSz8P5DYTVe8nNM8FTW/fZE+qSdYzucvTMYa/FXFT6Lr
         Bc3D2B7WI7LjG+89AHlsqeecv6pkOHqzH4XDrUMFiyA/gF5P9B20HHCfcNYj08VJxLEU
         LfTsP+DKZdD5jB32qYHukvp/C0W3sOZksccFlclnX6/YA4YQ8YqPeYWMGDnJplrt1sA1
         cQTA==
X-Forwarded-Encrypted: i=1; AFNElJ/8BenWzDt9fwT/tPMmpAkAuGjmDZbFR/R6rbi7azlzN5jlyrrkUz0Ipkdr20oAjhBzdv2Yah7HohogIQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyEkF2hloSTKIFHS2zAiTJsAIlcKJFCikCB6R/bfdyP9v2cxOZr
	atFTk9QuunOhPkxsI51aFoPy++uUVHJhOs8psgEI/spfWEVNaUF1j6Yz0On6zDEEqKIWVp7erqW
	dl2TO9CXJQucLZOxi6kSDRGkOTOOf7KcG4NWrD0c7BPRux17EVeUqHtTy1Gs6HQpQ5uPEMb0=
X-Gm-Gg: AeBDiesp+/vZAmmc+PpqumoxkYR0TuEHv9rlTeJyNHQGDeatqPgqujEFI5re7y9rvRC
	wl+SSVJgvdkuou4bqBY854RR7Ld7JsG0Bztz8osGLHAzJh9Z1xS4yTXYE5rme2bpF14Tqpg4r5v
	GV9aRqr7/znNUQ3PgGDn/X6KiLmxG43JbLsA/A6pU3Aq5C9wc+ndqzc+TwRJVfUhAJNqjTMe41c
	zSI1BESKK1F6pD9M6U8P2vFnjkLTtygnkU7w8GcG/6dgUzsRnB+tG8jJLNuESUCNyDpQLeihdE4
	TGUTK6AQ7Yr9TVlxsjHOA3fSPsfqEoK2YqEgaKMYMbKM2SZKeAgIzR1HeB3usjr8DZL0GcuCgeQ
	OAASmKNPB961GmPf/X55W/LABV09crZc2xNiPBNfFgAohtF9vxHV7Lni2QLiQ
X-Received: by 2002:a05:7022:ec6:b0:11d:f89d:85a0 with SMTP id a92af1059eb24-12c34edf982mr14938561c88.27.1776329780606;
        Thu, 16 Apr 2026 01:56:20 -0700 (PDT)
X-Received: by 2002:a05:7022:ec6:b0:11d:f89d:85a0 with SMTP id a92af1059eb24-12c34edf982mr14938542c88.27.1776329780065;
        Thu, 16 Apr 2026 01:56:20 -0700 (PDT)
Received: from localhost (ip-86-49-249-15.bb.vodafone.cz. [86.49.249.15])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c5e6b6a05sm5919161c88.14.2026.04.16.01.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 01:56:19 -0700 (PDT)
Date: Thu, 16 Apr 2026 10:56:17 +0200
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Andrew Jones <ajones@ventanamicro.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Jiakai Xu <jiakaiPeanut@gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Fix invalid HVA warning in steal-time
 recording
Message-ID: <ddka3tcpcus5od4hmzauxyyqzwodqdeyzj4ttq4op5iusfugve@yacboe7mg5e2>
References: <20260415075216.2757427-1-xujiakai2025@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260415075216.2757427-1-xujiakai2025@iscas.ac.cn>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDA4MyBTYWx0ZWRfX2X8jLCqL9Er9
 cijSYwcZHdX4mQNuN5++WWLnPsXjWHM3Ybmenqr+cNGBA18tBd1Ifw3+552dAmvRwroq/D7Mv3m
 duJQkDQef/IO8VQzk497NcU6xpnOIOoktTF+vBreusDtMHS/sYqqMsicYJi3asnQnP/A5n4S1M5
 J6JWA5D3AR4qj5EKteK8Y1pDhN0ghkC1UNcxFNwCIQTGGv3zVEEV8ER+nqx+uJpNRKsNmrKP7ab
 RZ1YZ9KoheVEKDDWK4vldh1bxBDzIGgIh+OYBmcsT2EPLBtLmdQODnBty30Xzr0RhSBlWN8mIbh
 RDvDS+Ec82UM9fG+tpsNthUCKJ6tARw9SNg2ZYlLFTgB65RL4lFYCJc7Oi1EARFE1X9YY7c7pq1
 no/MavyMZcxfvIUSfNc/mioAyfF9itEoExnVYJH60lK+WuQYBj7hhx8EH3ybR9TBbXWePgpSxT4
 xLsgMa3SSQx57yQWzww==
X-Authority-Analysis: v=2.4 cv=avuCzyZV c=1 sm=1 tr=0 ts=69e0a435 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=fuErIE+P63Icv3tqjtEZBw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=KdkbrdStzu5tqnZBQrIA:9 a=CjuIK1q_8ugA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: FN9e1MInSwns8aQV2HZ6r2uNwaZXYbNd
X-Proofpoint-ORIG-GUID: FN9e1MInSwns8aQV2HZ6r2uNwaZXYbNd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_015623_019526_68A56D4D 
X-CRM114-Status: GOOD (  26.69  )
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

On Wed, Apr 15, 2026 at 07:52:16AM +0000, Jiakai Xu wrote:
> kvm_riscv_vcpu_record_steal_time() assumes that the steal-time shared
> memory GPA (vcpu->arch.sta.shmem) is always backed by a valid guest
> memory slot. However, this assumption is not guaranteed by the KVM
> userspace ABI.
> 
> A malicious or buggy userspace can set the STA shared memory GPA via
> KVM_SET_ONE_REG without establishing a corresponding memory region via
> KVM_SET_USER_MEMORY_REGION. In such cases, the GPA cannot be translated
> to a valid HVA and kvm_vcpu_gfn_to_hva() returns an error address.
> 
> The current implementation incorrectly treats this as a kernel warning
> using WARN_ON(), which may escalate to a kernel panic when panic_on_warn
> is enabled.
> 
> This is not a kernel bug condition but a normal invalid configuration
> from userspace, and should be handled gracefully.
> 
> Fix it by removing WARN_ON() and treating invalid HVA as a normal
> failure case, resetting the STA shared memory state.
> 
> Fixes: e9f12b5fff8ad0 ("RISC-V: KVM: Implement SBI STA extension")
> Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
> Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
> Assisted-by: OpenClaw:DeepSeek-V3.2
> ---
>  arch/riscv/kvm/vcpu_sbi_sta.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kvm/vcpu_sbi_sta.c b/arch/riscv/kvm/vcpu_sbi_sta.c
> index 3b834709b429f..60e50296a0085 100644
> --- a/arch/riscv/kvm/vcpu_sbi_sta.c
> +++ b/arch/riscv/kvm/vcpu_sbi_sta.c
> @@ -46,7 +46,7 @@ void kvm_riscv_vcpu_record_steal_time(struct kvm_vcpu *vcpu)
>  	gfn = shmem >> PAGE_SHIFT;
>  	hva = kvm_vcpu_gfn_to_hva(vcpu, gfn);
>  
> -	if (WARN_ON(kvm_is_error_hva(hva))) {
> +	if (kvm_is_error_hva(hva)) {
>  		vcpu->arch.sta.shmem = INVALID_GPA;
>  		return;
>  	}
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
