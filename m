Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8863DD6AAEC
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Apr 2026 18:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc:Subject:
	From:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CxbGGYhTvTJbmzzGOILPcJpMv8l4yuksf0TG2NqSDeo=; b=M7dmpcFX/qkMlk
	32Zp7qJmbfEv2HwUmqOreQ7FGag1vJZ5bgvJLthO8/7nTilPaknQjEgYtTArsLg4YCBwr81N+E8X7
	X9IqKj+B6uImO0LkNonTaMZVb1tYaZwBizG/xX9YoM5lrrUdBp7f311xw2QDB8veeSRhy49XGBwi8
	RQSfjLI+Wtu3spUlooyOLVRl0ee1VMVrdsxgFh89udzVkJEzUd7Ay4F0a/et2s1LB+BOwrsHNe3XK
	1LsoFVEvq4c9VFGNMlTNnuHkzj1Mi/zksRnjmnwD797dIE/cZE/3Mp0WY1q3maPFz3sHr7P4gW8M1
	GRUZYAnVU+4HS9CSvvpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Mla-00000000ebP-2zQW;
	Thu, 02 Apr 2026 18:27:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8MlX-00000000eak-3ico
	for linux-riscv@lists.infradead.org;
	Thu, 02 Apr 2026 18:27:41 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632G4mVh2528300
	for <linux-riscv@lists.infradead.org>; Thu, 2 Apr 2026 18:27:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TU8QdhgxiCPZ6ep8IVIJN8LEHXfbUR2Kb96nB47jKKM=; b=lIx2EtkhreUt/UB8
	TcY4yytliO4NobIg6t5Web89r/EuGQJD0W+TOYbx/0zqiBGnYZhjcTYORLrFUcD0
	CQ22tk0nHZDuW6ArbPcr2JjmsgUZsP/FKJ1ch1dJN3nvxgiSYtSQP4qs3S23u5Li
	y5rxkGDmTD/JDnPxxbp1aPOxqHKGBZA/nzxnvEyDK9Uxzz94QYwWtvt1auGNQP9H
	gSSWo3Ph083pXVrIr7q8EkdHbX/vks9hqlkBzadws5X26MR+qekYnRchKF4/XgWN
	1yDMjOvziZ4/RyLbnZLN/57PySHYG+W7hbHSPHq0Uvy/7inQ6fTsrYCp0Z1Wxh8G
	+LGErA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9txc8r4v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 02 Apr 2026 18:27:39 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b317c40acso30384191cf.1
        for <linux-riscv@lists.infradead.org>; Thu, 02 Apr 2026 11:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775154458; x=1775759258; darn=lists.infradead.org;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TU8QdhgxiCPZ6ep8IVIJN8LEHXfbUR2Kb96nB47jKKM=;
        b=Pzj5FWLGYRV4+QcvQHdHT3joX00v6SS8HYUQpCqERpT27Bed/VmIMXejTaZDbFgJ0k
         9j/hMTXK34qrpT2og3h9O6lbQZQqyTZrmYAhYzf7GEgqo+Lrrs2XFM6W9r+q/yYwm040
         yUAV1GBv4db4IWfFJznYjAtYdSl3cJVBTVB8aJJ1sdj0xivAyld1HwwH5zHgYrOmhqkQ
         qwQqfq3qnKxqhie/V0m/0VmDuAC1hE8anCltPQ8fS4kD9iwt4SRdPr23z3LmDeA41DxA
         Bcm5mrk2nkFqpUEHw4QEcOoAQbRic57b97XxclFzR3wWdouSKfpbrPvXLie2nK0UltRS
         syJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775154458; x=1775759258;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TU8QdhgxiCPZ6ep8IVIJN8LEHXfbUR2Kb96nB47jKKM=;
        b=GHWTmL8/fPOOrZATJOyK++sc/FGttv2vPQpoYg86c6tfKztGlFHLUfHI7pfaWLUzFI
         rjjc/3a99RAPHEyJhvyKkcA9MaXdB40oDeALlUqh178QoblQru9ofmWa8v0b80FUVa61
         Upj/BWl5+qGj7Sr+eNWAVTcUF3UZ1tiQkTRw99tGtyrxgo46EUO0IPG7HIEAuEoO3I6F
         vXcfK40tX0KBK2CSL9snkMH5ycVcWQQ9qID2Ey2l47uiS/GapWcUJaTQodA+K8XeqDVJ
         oe3uryVnOiElatOt0ac3kAyF9t3ehbheSfl3VUGHqS7svfNfJZfSy/vdnZCqAfGzV+Rl
         HlPg==
X-Forwarded-Encrypted: i=1; AJvYcCXFK6dWydbtfUey+rXJLIGkcvg0pFRXpq6RJGm/E7/Lhj9qLkmh1/lBzbDKCjKfyVzVBylSRmg6NB1FHQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywk0AcycVBOdd9OkUP+4MM/DbU1jUp63W/2e3DqzsnVqGTRExXM
	oy0Gsu/AaXBzqaj4oNuLsxJHzR5d/8GtdC0l81Xfi++4jOqdjz7oTQp0Rr8HvFHNZegmFQsp36k
	G8VWOmY0TTT5ZcoxtusgeCpM+NtIa2fohCUYVRUR0V4SEqpMzVbbr8agP/r7zGeG5u3gKPUCzzq
	7mtyM=
X-Gm-Gg: ATEYQzzO/YfIwcNYVc1xTMXcCB0VAe1xc3kFgqUJxuL5MpKqoQsvfgbEM0PF220r5Ud
	+beBn40N/o7wE9Fmha5vwJxaBktsDqcvCTikwyO2tzRMi6Bt9TCIjqAG8TK/icpO04t0Eo/JL5y
	Qd95tDremYnxZTNXoVnWXdBEoGnP/fZGJwmlmajG70zd7sdqGZDCL8kz0lQGPFpyYSvV1wnCwzE
	i0SLlKbObz/p9lh2aFsOp1yiuABUKkIBbMfNq5Q+9nJlQaAFsvtIB9raq+Aas85daXBMA6Ymzig
	D1i5QGRKR2z0CcqMOF69ZBEP5EF42CY+KfhE0gxrox6hvORbr0uUDOBO2iOgTTPSXSQ2C7hgOpr
	cjAsb2OcLrdj9qYg917rS0IzzAaacD+nSB1N+uDw99SLXnG9eCbR8B5K8DGrO
X-Received: by 2002:a05:622a:790c:b0:509:15d8:2c0a with SMTP id d75a77b69052e-50d62a8e346mr5227671cf.32.1775154457654;
        Thu, 02 Apr 2026 11:27:37 -0700 (PDT)
X-Received: by 2002:a05:622a:790c:b0:509:15d8:2c0a with SMTP id d75a77b69052e-50d62a8e346mr5227311cf.32.1775154457216;
        Thu, 02 Apr 2026 11:27:37 -0700 (PDT)
Received: from localhost (ip-86-49-249-15.bb.vodafone.cz. [86.49.249.15])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cff128bsm116569366b.53.2026.04.02.11.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 11:27:36 -0700 (PDT)
Mime-Version: 1.0
Date: Thu, 02 Apr 2026 20:27:33 +0200
Message-Id: <DHIVQI1DY4MK.27YZ2NPDXF5WM@oss.qualcomm.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?=
 <radim.krcmar@oss.qualcomm.com>
Subject: Re: [PATCH v7 4/4] RISC-V: KVM: add KVM_CAP_RISCV_SET_HGATP_MODE
Cc: <guoren@kernel.org>, <andrew.jones@oss.qualcomm.com>,
        <linux-doc@vger.kernel.org>, <kvm@vger.kernel.org>,
        <kvm-riscv@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
To: <fangyu.yu@linux.alibaba.com>, <pbonzini@redhat.com>, <corbet@lwn.net>,
        <anup@brainfault.org>, <atish.patra@linux.dev>, <pjw@kernel.org>,
        <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
        <skhan@linuxfoundation.org>
References: <20260402132303.6252-1-fangyu.yu@linux.alibaba.com>
 <20260402132303.6252-5-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20260402132303.6252-5-fangyu.yu@linux.alibaba.com>
X-Proofpoint-GUID: 2L_n46qWNfp35qLQqyeytfEsEDlvIS8E
X-Proofpoint-ORIG-GUID: 2L_n46qWNfp35qLQqyeytfEsEDlvIS8E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDE2NSBTYWx0ZWRfXzETG5izd9rbd
 XMqi32uRwXTzVRW2zzTS7auwrLnOGLVijFcDVaWhkVs9GPEQQ+j3PdVkxZSRtKAe8/g91rgtH09
 V2oh3i6tz0TxesM1z/kMrvu2Q8uLQhGPgVwWLiP8j4nVWQRWHHQ4naUaUO1BXGtVWoREc55Q70l
 3D6CfvHM6IR14v8eO+d1jbgznf/8AFwIt0m87Z2lBLV1i1MaFUMT2TzEFpppOZCPfgLRiXsOpUR
 pci+FZATec3qm2cLxBqWPZudkGUsLB6+GKowQovz6XYFCFmele7O4GCg0eMh8keEd9WXujKtBzW
 wGPBCOxRJJDUN3kMqlN2j/uCOFF/xaLB/Ae2Le+LQTLdJJwq3z6hHmhiKq+Tj/cfTWYHyFar6Cm
 A+U7tzP9Yec+ZaD+h/mY4cUSqvU4w4kWPX3MH/CuxpkjRJ/Hq5G7nNIxR8KW0yfQANqvh1iCq86
 dVLISKZwViOjXiESw9A==
X-Authority-Analysis: v=2.4 cv=HKXO14tv c=1 sm=1 tr=0 ts=69ceb51b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=fuErIE+P63Icv3tqjtEZBw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=SRrdq9N9AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=YvLePRtRmKwuc7oy_z8A:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_03,2026-04-02_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_112739_922042_F6401A2E 
X-CRM114-Status: GOOD (  12.91  )
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

2026-04-02T21:23:03+08:00, <fangyu.yu@linux.alibaba.com>:
> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>
> Add a VM capability that allows userspace to select the G-stage page table
> format by setting HGATP.MODE on a per-VM basis.
>
> Userspace enables the capability via KVM_ENABLE_CAP, passing the requested
> HGATP.MODE in args[0]. The request is rejected with -EINVAL if the mode is
> not supported by the host, and with -EBUSY if the VM has already been
> committed (e.g. vCPUs have been created or any memslot is populated).
>
> KVM_CHECK_EXTENSION(KVM_CAP_RISCV_SET_HGATP_MODE) returns a bitmask of the
> HGATP.MODE formats supported by the host.
>
> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
> Reviewed-by: Guo Ren <guoren@kernel.org>
> ---
> diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
> @@ -211,12 +214,23 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>  
>  int kvm_vm_ioctl_enable_cap(struct kvm *kvm, struct kvm_enable_cap *cap)
>  {
> +	case KVM_CAP_RISCV_SET_HGATP_MODE:
> +		if (!kvm_riscv_hgatp_mode_is_valid(cap->args[0]))
> +			return -EINVAL;
> +
> +		if (kvm->created_vcpus || !kvm_are_all_memslots_empty(kvm))
> +			return -EBUSY;

Since multiple VM ioctls can execute concurrently, I would protect
created_vcpus by kvm->lock and kvm_are_all_memslots_empty by
kvm->slots_lock.

Thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
