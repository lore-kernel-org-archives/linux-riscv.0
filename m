Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25399E9129A
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Feb 2026 14:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y9ag1pzK9H/mGXE8+FLaN/B9zbNY3gQQlfVD/tOV4sA=; b=fC238WenA20020
	5c89Uv72kRHbU80/qm+TnaoUwvwbD0sbb4CxfWgxd01JrkXyY4CgXJl0QS9TUKdwpQgkREiJdWDRW
	LkItJACJlyPCOdZERHN/++1Ki0Fjc7Q962CLrY6kdUUahXOJHJmpXNzjn8rMBMD6rJpuWSsIh60NB
	MZbluIjVJBM4I9zIrJiL0D+LTjTJwp64lg/34Rbo+z4heHve3AY2qaAavxYO896yKBUuM/sXbDmO4
	6agefMQ4jxPmd7StNRwhwYpeLWVl/bcs7Hd5O6MvjSm3DCyKZhHP9ganpuFrUzEFMKcmrXAKuWkWI
	PKmepbPcqmUFhYhSQOiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo0li-0000000A3XB-051I;
	Thu, 05 Feb 2026 14:55:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo0le-0000000A3WN-246c
	for linux-riscv@lists.infradead.org;
	Thu, 05 Feb 2026 14:55:40 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615B4ADg177750
	for <linux-riscv@lists.infradead.org>; Thu, 5 Feb 2026 14:55:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sQsqX44DUNzihTZKDnTdc2J2
	cKiScOMC8GyFnzDeQdU=; b=WdK8KA6baec4m76KEECT2zVxe8SZ7JvZaJ9yFrOn
	fmV2o8AhuMaDKJwSADpXWAMWTO106dSvfkOc7ylxlQubQECRAQZGkOClpfhjJ5Qa
	5iFSLMpiTYdGiXDdXAC4hEz599HV/KYvluRTUApNmJRMUs+Txf3DoV3khYtphzUJ
	rz3PHkl8IzsCXguF4Rcnpl9Re98FEicdKMSFArN1gDOUsXUJ6kItIM7v9UGAcprv
	AmqkTVbq1nKFohXIql0YD4qWU3rTw65Ll/dL+GU6cN9h8xFn6uuCpPOAFEWUp06x
	7HBS9yOSxwDJISL5oM9ipVK+Z90XL1AxvLBOTVyD5lPvEg==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4t0p0nwu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 05 Feb 2026 14:55:37 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-45e5690bfe4so3743688b6e.1
        for <linux-riscv@lists.infradead.org>; Thu, 05 Feb 2026 06:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770303336; x=1770908136; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sQsqX44DUNzihTZKDnTdc2J2cKiScOMC8GyFnzDeQdU=;
        b=V9cOZahLoD1bTgkvxDCRqb7MsYk9EqpdWiq0bR7cDQKKLxKStqcCzApEd1KzQwLH5m
         /JI7iz/TvbUROmWBlpjUrd8XtM31w0uGuxZMi2/hw6pQbBbBWtYuck/EBXR1JV7KZSLb
         7J4Vaggoew0Z2M8F0ag98gMbosoLc99znFmkSadjv7kDqbjHkzqYTi6h/tkdKh+DlB48
         /FuG2LFKid5JxqcqF9YWj9XXhBxSnmgtz4AM8gCNEXPCdc4aY1UzRyUTvZqwb+mKnSGS
         upxq47CXaeD0V33Ec8RVZIJKl3AQ4shXy7pUupLyDjQPpPzG8MixQgoAgldQklcHAIus
         1vpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770303336; x=1770908136;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sQsqX44DUNzihTZKDnTdc2J2cKiScOMC8GyFnzDeQdU=;
        b=o9JBdpAiz6+mO12JOX4ef76tcqg+jITTviXhwBWipSN5wLbTI2KXbB0s+zTM1c254x
         wDmwLLMn2BWhljdhCFR4ERZCQeuOwfyQIICUfQzOXZyzyA+D28FfmF6SPyOIwfHE0T+C
         ptAZzPc8uFnld/0Z+HzofqVG//YONDuXkBqsXJfmoBj2NB1r83oD8LepGTWfYDaUPndK
         JQCldv6j0UudQo1ibzTDIYKbB5S9UMp++mEs2T4LbeCx2zZCji4ZJtJUMGkSELOtCY4a
         F10ty43Vly7YG1/T6VdJA4c0nWn+WtPGwb2DFp9YuQ/sq1LNUV4T0YeF8OQT3VT24lgW
         IDLw==
X-Forwarded-Encrypted: i=1; AJvYcCWRUEkrl6hLXbH1Pw4VwlrxjjiDMVtmwZbZQO5Ay/blVTuc3OI1KEokemvozlbR3PrVibWh7MvT4ekz1w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzbZlMrHnS3xUghrjAlvHnk4mQ97Fk2Q1xm/1Jf+sBOBVe9Rw08
	HS1LZ3QMbDDQBvnVp3bTrX3F30EjQZlo3LKF4hGwM01f8iJIUel05F2MUJlBH0S3mKdXYJMGVIn
	0m2BrhRXpoKJFqEcXJ6L6kQ9Geu/vKcrEbZCKtq2F7lNNOmELOfStot8jVVfP5CQkIkBkKmI=
X-Gm-Gg: AZuq6aIewSwjd54EERbRXF7OSbkvAtNaVzET9sc3n/+qHmoqlqIeWhaZ1NYkDv4kR+c
	uqVfxFD2jaWafnlLtvthVo/DpsPJRKNBUpQRq/SaON/Rk/IQBYmZx/hD19Hg3iO112TSp7pKVEu
	2Fr87mOwzJUtFTAeAvb/iOeF48wvpNGCw1zBR3iFE0S1QqSD/yTClc1/OGMqj7wte9SyEwM05S4
	vl5cKUashTiYh45cwkn8OiQi6Eu05Op44j5RjZGx7ZR+mfpH4YuwCEjMpPyOTKiV8r5WOBpHDZW
	mTIwhCD5DEhmLGQwLiX6RhD0wNZGRlmPIWL69mg8QECPiORljxPjIi1HWapnGapa7BHCqMmFXEL
	YYmwdTIOmxF1G605YywY=
X-Received: by 2002:a05:6808:4f64:b0:450:ca65:ef60 with SMTP id 5614622812f47-462d5a2ea64mr3150890b6e.39.1770303331608;
        Thu, 05 Feb 2026 06:55:31 -0800 (PST)
X-Received: by 2002:a05:6808:4f64:b0:450:ca65:ef60 with SMTP id 5614622812f47-462d5a2ea64mr3150874b6e.39.1770303331218;
        Thu, 05 Feb 2026 06:55:31 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-462d67cf83esm3226817b6e.16.2026.02.05.06.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 06:55:30 -0800 (PST)
Date: Thu, 5 Feb 2026 08:55:29 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: fangyu.yu@linux.alibaba.com
Cc: alex@ghiti.fr, anup@brainfault.org, aou@eecs.berkeley.edu,
        atish.patra@linux.dev, corbet@lwn.net, guoren@kernel.org,
        kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, palmer@dabbelt.com,
        pbonzini@redhat.com, pjw@kernel.org, radim.krcmar@oss.qualcomm.com
Subject: Re: [PATCH v5 3/3] RISC-V: KVM: add KVM_CAP_RISCV_SET_HGATP_MODE
Message-ID: <uqklo2bxvs6v7kg2yotmzbba7x4r3evmqlj3gubwiptrimy2es@dtl3rtmclwso>
References: <ocfqo4zpsg6yyaz6kd65jrvudtb35uerdsueazqdk6w7c5lvdf@wvwzhc57gxez>
 <20260205012808.98973-1-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260205012808.98973-1-fangyu.yu@linux.alibaba.com>
X-Authority-Analysis: v=2.4 cv=ItITsb/g c=1 sm=1 tr=0 ts=6984af69 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=SRrdq9N9AAAA:8 a=YnUHmWYE1xSIxKmkA7UA:9
 a=CjuIK1q_8ugA:10 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-ORIG-GUID: DgaSlQzmToRDeNgkRig4pPli7evYbIDA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDExMiBTYWx0ZWRfX7XIBGyLjr510
 8xhbfM4CpFQnG5Gu2SncHpCOUpNAcdYCsLfWjC3OaMmwRjRrkt72TcD/llGezJyojQKT/rIELqz
 waoM1hdPKALvuhU7f2yXErxfVJsO3Bbhp1PWRS8mOM8NyLb5+0sN62FXDvGvCEsAFr8cPVTSZp8
 5Ph2KuB5ybvaxvdpuuEypyY9sG6JuIkMIRf12yur68wW1V9wFdk4ms2q6MQDavnaU9UHxi/Lzcy
 QX6DL312clWGE3MjzbGDL8BxdQfZcnK5Sdbe4xECjUdLW/GIHHfGbALgZh1oY9lhi5R+6ajp7V/
 uIkyePMzfZbufqxE4RWgXuIWQjZU/G/HUWLe08U84UiOOIL216Nfpjf9gBYfTJmn/yUeLqGwzRy
 ZLkVdFGPh9WDRr+GDbIfA/toK+89d0T2jpLIfkVxHLiofEd2EZSSeO+GWf4T8HN9DI+2421EEoN
 xjroXgmoaQPsUVdLu2w==
X-Proofpoint-GUID: DgaSlQzmToRDeNgkRig4pPli7evYbIDA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_03,2026-02-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_065538_741574_5AF8535C 
X-CRM114-Status: GOOD (  31.42  )
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

On Thu, Feb 05, 2026 at 09:28:08AM +0800, fangyu.yu@linux.alibaba.com wrote:
> >> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> >> 
> >> Add a VM capability that allows userspace to select the G-stage page table
> >> format by setting HGATP.MODE on a per-VM basis.
> >> 
> >> Userspace enables the capability via KVM_ENABLE_CAP, passing the requested
> >> HGATP.MODE in args[0]. The request is rejected with -EINVAL if the mode is
> >> not supported by the host, and with -EBUSY if the VM has already been
> >> committed (e.g. vCPUs have been created or any memslot is populated).
> >> 
> >> KVM_CHECK_EXTENSION(KVM_CAP_RISCV_SET_HGATP_MODE) returns a bitmask of the
> >> HGATP.MODE formats supported by the host.
> >> 
> >> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> >> ---
> >>  Documentation/virt/kvm/api.rst | 27 +++++++++++++++++++++++++++
> >>  arch/riscv/kvm/vm.c            | 19 +++++++++++++++++--
> >>  include/uapi/linux/kvm.h       |  1 +
> >>  3 files changed, 45 insertions(+), 2 deletions(-)
> >> 
> >> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> >> index 01a3abef8abb..62dc120857c1 100644
> >> --- a/Documentation/virt/kvm/api.rst
> >> +++ b/Documentation/virt/kvm/api.rst
> >> @@ -8765,6 +8765,33 @@ helpful if user space wants to emulate instructions which are not
> >>  This capability can be enabled dynamically even if VCPUs were already
> >>  created and are running.
> >>  
> >> +7.47 KVM_CAP_RISCV_SET_HGATP_MODE
> >> +---------------------------------
> >> +
> >> +:Architectures: riscv
> >> +:Type: VM
> >> +:Parameters: args[0] contains the requested HGATP mode
> >> +:Returns:
> >> +  - 0 on success.
> >> +  - -EINVAL if args[0] is outside the range of HGATP modes supported by the
> >> +    hardware.
> >> +  - -EBUSY if vCPUs have already been created for the VM, if the VM has any
> >> +    non-empty memslots.
> >> +
> >
> >Currently the documentation for KVM_SET_ONE_REG has this for EBUSY
> >
> >  EBUSY    (riscv) changing register value not allowed after the vcpu
> >           has run at least once
> >
> >I suggest we update the KVM_SET_ONE_REG EBUSY description to say
> >
> >(riscv) changing register value not allowed. This may occur after the vcpu
> >has run at least once or when other setup has completed which depends on
> >the value of the register.
> 
> Thanks for the suggestion.
> 
> In this series the HGATP mode is configured via KVM_ENABLE_CAP at the VM level
> (kvm_vm_ioctl_enable_cap), not via KVM_SET_ONE_REG. Updating the KVM_SET_ONE_REG
> -EBUSY description might be misleading since it is vCPU one-reg specific and not
> directly related to this series.

Oh, right. I'm so used to adding registers I forgot we're only adding a
cap...

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
