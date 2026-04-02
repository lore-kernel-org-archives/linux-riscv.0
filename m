Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1926DD6AAF7
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Apr 2026 18:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5SbCpgygisZ9bl7HQXUDhiHxzTGNmR2JxxFt8P+eF3A=; b=CpCbSq8KfDRjCd
	s2MQ1kNimnI2+jfATaX+3S4yGgS/f/GWXD0gRItRiUjLz8Cy+Uh5GB2epHHuQGTptj0GZ9baoBzp9
	1B0j1MTSAWE1aXI3gqQ4GI/M7Qd2fmLhw3T1CIv69Rm7soo4joeROKpJVguhgkDrpInZIfEySUAHe
	yp6F0Snim7SgtFPADeMNm+HTMBjBDD3tt1CzSwPpla0ze+warqoNed7c+N6DQ8kaAPBfmr5p+QjU8
	kPGx65PqqzOnEDojU4/vzVAPQ7MU/OOYf2xvVp1GeEl98FNglQJg7oqDYuoBOTPIwp0Z967QbZAde
	FuRva5PpOuMPkZ4JzMtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8MOD-00000000d38-41xe;
	Thu, 02 Apr 2026 18:03:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8MOC-00000000d22-0zmH
	for linux-riscv@lists.infradead.org;
	Thu, 02 Apr 2026 18:03:33 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632G4TCY462646
	for <linux-riscv@lists.infradead.org>; Thu, 2 Apr 2026 18:03:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lYQtuyJBlPg9nIy8rieYc5p+WTM4wC63ZTZ5EXpCsbs=; b=baEI5sjFaoyiOmwJ
	6mC9I/vBqJCuVOKeeG8RAV8t+T/tQcSPKl4zMsKt/k7zM4s13o8KipNtBQDhNaWY
	w1XaAgPmtXEOxXd9Wr5XDjiEZ0QtQYWmodYntrfe1tGDBe+fEB0VWaF0L/2n9ANW
	YP8q2uW/bQpa3Ximk1y2kuzn8KE3Gro4M0Px1yoTyuBHcfMEaAFFP/wpDJNqabDE
	DUeRYabbiNjQ2fP7b0He/m35pi1ZD3Bi/CfpqdoV0D9ti9ajN38NaNaz1LyGjjY8
	qnSrGDmZeJsqGJIZbtGLrnPDH5qqeGkt9JXxOL+FfK1fb3uXI69ks+tGb8W6kRCV
	QKr0xw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9b9h4fsx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 02 Apr 2026 18:03:31 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6059d4c73d5so128250137.2
        for <linux-riscv@lists.infradead.org>; Thu, 02 Apr 2026 11:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775153010; x=1775757810; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lYQtuyJBlPg9nIy8rieYc5p+WTM4wC63ZTZ5EXpCsbs=;
        b=TY6vSi/BDKEXqZYgjrR/wd94lyUS9Q0VudhqZtppJT9suk2kRdcdmwTBm2fP0EjfgL
         QnQSx8xqU5W4SMe64+DX7xLqpZnkqDofzQQ+NtmoSL5L4wWbug2qrzWLjJvw62tAcwD+
         Z1kWHAk0pdQMDx41H+4Mwohx3wP+IE+cASpnTco/CR3MEFtby6hGOcpIFx+LWfu4ykNK
         9K1IU4RpNOmvKpg6H5gILL0xd+ze2mmPzuLC3XKffLlKxL+lxIWGTqzfdTIJIZ7h34aK
         AtoW+08YQCOWMbwfRFXNZ7kKxxeVeSKM3MrZ3iWKnwq6IOytQB1v+hrvjhzGJAFu4rnc
         /cYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775153010; x=1775757810;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lYQtuyJBlPg9nIy8rieYc5p+WTM4wC63ZTZ5EXpCsbs=;
        b=MBpSBaWRy5nMyZT2NMyrzjrJgZc4yCDzbugPfhoX/qkk1iih5nmYOrKcmJHAlQLPAt
         7zf69HTz0gpxQx8h7BFRAT4oOrLU/ivkNMXe7c1/qscOb+bLbnnTYJyAnH+/ITp0g5Om
         j1ujAGwQ/ZXz7JabVhWuh/JOI5X4QlRekPJWjaVHVfxU4LESKlcQjGLftw20X2bM+sbf
         3bF8umiejjy612dLqXgQT34OJ0NJcVOgHYmopTYnplFQDSSPwUwXXWjMCPpTvP/fE0JM
         Ui9BDalj+4Ppx7L5iilVo3qUF28XnjY4QTYlBp8t29uzs1lL4oZWbvdWet2Uv/CUxTPH
         2DEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfJD55xBshBYK4930SJQLtE1RTRHV/891P+A5Gy+3KigoJwbPMyhnbD/4DF5J9aF+SMTYwFNYKVq+iwg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzveMZZ/6ALWcepPKKh8jhJzMve7ENH8/Cu1W0rRPr9uDY7Eov1
	QaAohhqNi1jm31b5ArW2e2L5AqoeblUXOIuZnLDHDEkilcSEhyOr1lhPft3sL/tJRgprfegvRan
	xvi3DXmyv/850K2sVknmK8jAiWKy7Ou8/jY+Lhsz68SKopr0oa1POFpYsMOF9oPzfGMv0dtk=
X-Gm-Gg: ATEYQzyz8E4oVMZxLsv4VcLCRqcwdCILDZcAzBATMMKpaA8wHk8+mIpJ+Xlk698k4NG
	Urgc8sAkf5hwPwKjQJQOCNrsUqAP8A4n7CbBCt1rWCg0Sz9QtRUW1mVQSNCqjlFltRiLFcQlYwV
	Ujw4NOhk5AQykmXQmra1gf00jSrW6vukv7NbyxP6uN2WsB6xKCShIiJSx/EUegmTBiZITJs/iW0
	X6kCDNY8zjXonN0q1/geBaUrdZE/zjaNKKGMyNceNqk1wPA4XyT0ZkQmfyHCf3/+stmYS/inPIL
	I4JbQO2UoEtPnWmdMbD06b4onkB2zTbB8Ce7ioKESaQroEtfSaJSXzoozOrvkF1w3Rw7ABqXRk0
	3Vdt0kTGBCDOBOQ6zsOZmc5v2Yy0YCWrJWJFITSZEkmq6PywRhwrdJaIuS997
X-Received: by 2002:a05:6102:80a3:b0:604:f029:2262 with SMTP id ada2fe7eead31-605a4fa98ecmr62657137.17.1775153010445;
        Thu, 02 Apr 2026 11:03:30 -0700 (PDT)
X-Received: by 2002:a05:6102:80a3:b0:604:f029:2262 with SMTP id ada2fe7eead31-605a4fa98ecmr62587137.17.1775153009715;
        Thu, 02 Apr 2026 11:03:29 -0700 (PDT)
Received: from localhost (ip-86-49-249-15.bb.vodafone.cz. [86.49.249.15])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cec5c16sm115340866b.40.2026.04.02.11.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 11:03:28 -0700 (PDT)
Mime-Version: 1.0
Date: Thu, 02 Apr 2026 20:03:27 +0200
Message-Id: <DHIV81G43OJO.2HY4RIYFRD0RL@oss.qualcomm.com>
Subject: Re: [PATCH v7 1/4] RISC-V: KVM: Support runtime configuration for
 per-VM's HGATP mode
Cc: <guoren@kernel.org>, <andrew.jones@oss.qualcomm.com>,
        <linux-doc@vger.kernel.org>, <kvm@vger.kernel.org>,
        <kvm-riscv@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
To: <fangyu.yu@linux.alibaba.com>, <pbonzini@redhat.com>, <corbet@lwn.net>,
        <anup@brainfault.org>, <atish.patra@linux.dev>, <pjw@kernel.org>,
        <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
        <skhan@linuxfoundation.org>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?=
 <radim.krcmar@oss.qualcomm.com>
References: <20260402132303.6252-1-fangyu.yu@linux.alibaba.com>
 <20260402132303.6252-2-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20260402132303.6252-2-fangyu.yu@linux.alibaba.com>
X-Authority-Analysis: v=2.4 cv=TqLrRTXh c=1 sm=1 tr=0 ts=69ceaf73 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=fuErIE+P63Icv3tqjtEZBw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=SRrdq9N9AAAA:8 a=EUspDBNiAAAA:8 a=W-_n0kkjAAAA:8 a=VwQbUJbxAAAA:8
 a=yPi4e_CmV_5Q4fPajbcA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
 a=qeNa2pbTr82C0GpJEZFS:22
X-Proofpoint-ORIG-GUID: m9JF-DoBhm1Q5e4nkRVy-tspSo5BTXEa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDE2MiBTYWx0ZWRfX7MMzII/kgNuE
 7YzqFpzAtkhfjLi+AovZt9+sDao8EuCAIcNSZi9VkVmHoxH3aiOVFaFmhRQVwzqTQWyn5kXIuuq
 7NYCtweVxq74evFpAiKfzVVBp8iTYpBljyAVK3GrwcvHTBsVfdeuBq/NVnOhGH5TH3Tdcrmu7dC
 dxnM0lE0r+oRT3Ch8YBPnAPTbn48DAATrMk9VAcWOX9pIGCjgVC5zZkd4SQopp4jWTJXyYskV7L
 q0b+Lij6A0skiZmP8QUeLmaN6Dhqpq5aABOgGWwcHeMwFn32jnYh7LAizepnevIJcfrY/VOOAp5
 5TwJdqnyw8TNFzgmVzLSonCPST9/r9b+LRm1KxesXD/wWTq9hmD58SLI6Etn2tkPL9g3DCExISi
 RQVe5R8GiRVjzQFGkioPlsLhZGuz6+avxU9E7CVJarXx5r0xuR1KCMoaBsarasNvC95bw71cglt
 z+cdqfyM0MkIi/sYtHg==
X-Proofpoint-GUID: m9JF-DoBhm1Q5e4nkRVy-tspSo5BTXEa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_03,2026-04-02_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_110332_284086_CC44F74D 
X-CRM114-Status: GOOD (  12.31  )
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

2026-04-02T21:23:00+08:00, <fangyu.yu@linux.alibaba.com>:
> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>
> Introduces one per-VM architecture-specific fields to support runtime
> configuration of the G-stage page table format:
>
> - kvm->arch.pgd_levels: the corresponding number of page table levels
>   for the selected mode.
>
> These fields replace the previous global variables
> kvm_riscv_gstage_mode and kvm_riscv_gstage_pgd_levels, enabling different
> virtual machines to independently select their G-stage page table format
> instead of being forced to share the maximum mode detected by the kernel
> at boot time.
>
> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Reviewed-by: Guo Ren <guoren@kernel.org>
> ---
> diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
> @@ -199,7 +199,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>  		r = KVM_USER_MEM_SLOTS;
>  		break;
>  	case KVM_CAP_VM_GPA_BITS:
> -		r = kvm_riscv_gstage_gpa_bits;
> +		r = kvm_riscv_gstage_gpa_bits(kvm->arch.pgd_levels);

kvm_vm_ioctl_check_extension() also gets called from with kvm == NULL
from kvm_dev_ioctl().  I think we can continue to return
...(kvm_riscv_gstage_max_pgd_levels) in that case.

Thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
