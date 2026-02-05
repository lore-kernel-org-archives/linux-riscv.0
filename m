Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC4E7ECD983
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Feb 2026 15:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BMEEJLGwh7EtD4aP5VMyPBAzUwGsZ2ud/MM2jfTPdMo=; b=AOZ7Fd59CsSC5t
	67U7Wd1t9SwSN6vzr9Bd/2SuPZthqN/EOkfG5Rc2aO2kL/pcvPYNTiZH/QZnoEazQy8EslD1mLI0P
	tlJk8tl7kDYS24jyRb8duVkXHdsRxcbk/OL7uLNu6VbXml9c4t0R+PqhnUKfKvOJH63OWEi8WysyW
	aQfsRgu3iDBPwkW9OcsOp0HJaMHAY8s4qGB1PktBOkToobgiyY9lGm0gDUDQUfqEA3jcDuavrXHR4
	+gjkYGQ9prqArKJh/IuB/aaEEC3Cx3Ud5gVLiWDujjSx2TqJhWvuVp8MuxnutN+uZA3ra0IaRLxln
	ulsehu5Y4+Z329DI+TaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo1JG-0000000A8hr-2PiT;
	Thu, 05 Feb 2026 15:30:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo1Is-0000000A8fi-3RXi
	for linux-riscv@lists.infradead.org;
	Thu, 05 Feb 2026 15:30:20 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615CO4ZL4167184
	for <linux-riscv@lists.infradead.org>; Thu, 5 Feb 2026 15:29:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cRJydN6XhmQwgdowUHd7ChTT
	rTbeIpI6IAID2mzzwGs=; b=KU35dBE8bwyUOW9VZSSEqC5HMrNA/wuXACQj6795
	zvdsS6+Pb0H9CAptu1SwDfntMKDOv8Rnv6uZFcrsxiFP1vpmqmkN2/6s21nWH2Kt
	fZPbvr9dYRhPE0toxed61NGV2Epni4Q5d4T67HtkQeWAD1XGPBwuZGhLxEXpww1q
	GQVlmvK5VSDbSxtyNuBGnYp5TAMTV1i07zxNzD9KMvkE+QfJCsm4w+eihPmSojFT
	JTe0ACLX6I4RYOLr01tFraq61Gwq4miX0yV0TGx3vu9amOuPqXowvxK5jwSKCC7l
	CL/MupKKfp6ThJhDQMiR7sqxKiqVqLQhFQ5HL/dV99vRBw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4neg9qyy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 05 Feb 2026 15:29:57 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1233b81a92dso2365270c88.0
        for <linux-riscv@lists.infradead.org>; Thu, 05 Feb 2026 07:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770305396; x=1770910196; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cRJydN6XhmQwgdowUHd7ChTTrTbeIpI6IAID2mzzwGs=;
        b=XyEk3P97XotIYnd4a0BGgdaxLO18kCSN5F3TeY/y3Tma6903ILpDfurwY9duxIkQFu
         NWUcADMnSP7UZMUVTkLXnJQa+JltHWkC5UrtvmcPMHtl03MoxCqhcqPDVw3iNVRuOoaa
         MabXwj0HSkdl/BAQBhPUxn/5vJ9D+Wr7wei3GLAyH7LrMlr39whNthmiWr2OE6xh8rH+
         8H/FVKmrVhsG5ExF7W08JLXvWwFCLLN97nRIWUUzC/2pdJRFzIVS05RySY/68Q9LesIO
         eCnUS/K16JIE+qi0UV8PWn29j1cEcTf7pTpNzL8Xm0U26FFWzfGq/RZif14M+bMN39sc
         uGlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770305396; x=1770910196;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cRJydN6XhmQwgdowUHd7ChTTrTbeIpI6IAID2mzzwGs=;
        b=mryxx7JjwYibKZtQjUcrACM+r/p2myl5OzcwtE1cZh/JgqXtIT/ylgbAt+lm1Iu6OB
         0sSbhsj/np0P3nhKbz1UzGkVfU159t8GPtHhTueEXM48yEGjRI//hlPTlhZFlwC9AA8C
         eL31Pw4IXp6gm0ECq1AATZ6D0Dq3S+ZQiiL1ixHDWzidQsUIEviL+3lw2BJDjFwLDhnY
         aoEBK+9+P2tyBzpJQ0nWovs3KaBHJG9zaMfVObIvO34ZW8oAbTsAuZN4OxJvUircIn9D
         7AQB8c2R/ZIU6rw086h1f8ylsXPo2xRBuXoH40T469yTy2+zn7lebAdHsnv3/z5f8LXT
         zlvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXD8LQiosOgemWWrXmFj4kUYlSXmvYlBFaofffgCFapBDQdiutoekpcOsUlUx2UC7CfdhCkIhxflXMifA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzqRATE2yN5XHPOhV680vGEHZT2cXx7mDH8RZAE9jSOw6tOiNll
	dXwzB5jtkdlF2mCtIdyF4WpYcMBH5cDHYO4SugIynbgf5HRcoRzCHKMEu7HoML8ZL2sliFcyfdc
	LXvsVvRvktyvmzi28leWgqkkf/uYjVLCWBXzFX3Pdpbc2BHpQKyQK7/NW9sWcCBrmbvG9VvQ=
X-Gm-Gg: AZuq6aI01FOxSYNeKEalxaElKOCaJtOtmBiRmOnBzGQtjtItYugRlxg/yNXm0X7+Ad3
	BprR3NPMe62KIyPjhQ88l11zbCiRG0orpl7Q+6wsNmPXGN+mwrgMrBFtmhASKuXosFp2axFdWUa
	iLukxTzo2cg6tlgp1rXJybsBG8Ho+Ll8Q7+zdV5r6dtDnJGIcBXZLAHcatVBuo/vxkYNJCTpda0
	8GcpNOrpvpTIeXm60/aA84OpTxZin+AjpGcv8B3AddDK//6gvVmhpMf7L72mKs12n+yQSSgrB5n
	ihmbxig1ucZnlldg9RrzWaCoyW7N8cBAcu1jCHy989m2rt2PvuU5DhgJaxS201v9LQFH65CdnKr
	WEpkZyBfTpQI3PhX5xlE=
X-Received: by 2002:a05:7022:6a5:b0:11d:fd41:62c8 with SMTP id a92af1059eb24-126fc2ef50bmr1459937c88.13.1770305396383;
        Thu, 05 Feb 2026 07:29:56 -0800 (PST)
X-Received: by 2002:a05:7022:6a5:b0:11d:fd41:62c8 with SMTP id a92af1059eb24-126fc2ef50bmr1459922c88.13.1770305395713;
        Thu, 05 Feb 2026 07:29:55 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-126f503087esm4715815c88.12.2026.02.05.07.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 07:29:54 -0800 (PST)
Date: Thu, 5 Feb 2026 09:29:53 -0600
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
Subject: Re: [PATCH v6 1/2] RISC-V: KVM: Validate SBI STA shmem alignment in
  kvm_sbi_ext_sta_set_reg()
Message-ID: <zudnvpsirxbfjwh6plmj5utumgvj4tmzdddegneu3f22vfxdz3@dza2x6bur6pb>
References: <20260205010502.2554381-1-xujiakai2025@iscas.ac.cn>
 <20260205010502.2554381-2-xujiakai2025@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260205010502.2554381-2-xujiakai2025@iscas.ac.cn>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDExNiBTYWx0ZWRfX9TASV1kROB/F
 X3CB1MzZYg4mR9mN2ITPoq1F0bHRkdCSUHYG1Jb9tpEJCyXdB2of3gPt7vvWkm26x/CYWFXIvDs
 aqynPHi4N6YABoj+D/D9CR3um7SgiyEqIHRLANXQBmEEumlVXH6f3RUMYw2xgHB0/lhml36zRPu
 AXVtozxRkMbBr1TR/oqKVFTBR8H1JQFvBytockZkRpOEag4VMFPdhC5nzfHRCKfG73CzsJrohJO
 tGUf98hScvyTgJOXnagnu99RlFlmADdjEllHLgvdoOVdRKOps0s6mgt+hxnZC50L7a4FhBh2V5/
 TCTVTofHMHlCohv35zRvL/U+obv5HVV/ufuBdryqW92QaUyQsA/1XnjFsb0nouhSV3zHtXQ/6pr
 0kK1U883SrtPBXhaPX6yvMDXvzXlo8Sa/IbLbSuPMZ1v9Xat9suHddzXeqOjzFQqtk+FayPpB1/
 whimox5+2zFk51Spclw==
X-Authority-Analysis: v=2.4 cv=ZITaWH7b c=1 sm=1 tr=0 ts=6984b775 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=9wIPkYZYpLDyJTQGRwgA:9 a=CjuIK1q_8ugA:10 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: zH7YdlgUDAEkZ2vMO33sFleN3-pQ8j0B
X-Proofpoint-GUID: zH7YdlgUDAEkZ2vMO33sFleN3-pQ8j0B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_03,2026-02-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602050116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_072959_020127_D107A17F 
X-CRM114-Status: GOOD (  31.70  )
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

On Thu, Feb 05, 2026 at 01:05:01AM +0000, Jiakai Xu wrote:
> The RISC-V SBI Steal-Time Accounting (STA) extension requires the shared
> memory physical address to be 64-byte aligned, or set to all-ones to
> explicitly disable steal-time accounting.
> 
> KVM exposes the SBI STA shared memory configuration to userspace via
> KVM_SET_ONE_REG. However, the current implementation of
> kvm_sbi_ext_sta_set_reg() does not validate the alignment of the configured
> shared memory address. As a result, userspace can install a misaligned
> shared memory address that violates the SBI specification.
> 
> Such an invalid configuration may later reach runtime code paths that
> assume a valid and properly aligned shared memory region. In particular,
> KVM_RUN can trigger the following WARN_ON in
> kvm_riscv_vcpu_record_steal_time():
> 
>   WARNING: arch/riscv/kvm/vcpu_sbi_sta.c:49 at
>   kvm_riscv_vcpu_record_steal_time
> 
> WARN_ON paths are not expected to be reachable during normal runtime
> execution, and may result in a kernel panic when panic_on_warn is enabled.
> 
> Fix this by validating the computed shared memory GPA at the
> KVM_SET_ONE_REG boundary. A temporary GPA is constructed and checked
> before committing it to vcpu->arch.sta.shmem. The validation allows
> either a 64-byte aligned GPA or INVALID_GPA (all-ones), which disables
> STA as defined by the SBI specification.
> 
> This prevents invalid userspace state from reaching runtime code paths
> that assume SBI STA invariants and avoids unexpected WARN_ON behavior.
> 
> Fixes: f61ce890b1f074 ("RISC-V: KVM: Add support for SBI STA registers")
> Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
> Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
> ---
> V5 -> V6: Initialized new_shmem to INVALID_GPA as suggested.
> V4 -> V5: Added parentheses to function name in subject.
> V3 -> V4: Declared new_shmem at the top of kvm_sbi_ext_sta_set_reg().
>           Initialized new_shmem to 0 instead of vcpu->arch.sta.shmem.
>           Added blank lines per review feedback.
> V2 -> V3: Added parentheses to function name in subject.
> V1 -> V2: Added Fixes tag.
> ---
>  arch/riscv/kvm/vcpu_sbi_sta.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/riscv/kvm/vcpu_sbi_sta.c b/arch/riscv/kvm/vcpu_sbi_sta.c
> index afa0545c3bcfc..3b834709b429f 100644
> --- a/arch/riscv/kvm/vcpu_sbi_sta.c
> +++ b/arch/riscv/kvm/vcpu_sbi_sta.c
> @@ -181,6 +181,7 @@ static int kvm_sbi_ext_sta_set_reg(struct kvm_vcpu *vcpu, unsigned long reg_num,
>  				   unsigned long reg_size, const void *reg_val)
>  {
>  	unsigned long value;
> +	gpa_t new_shmem = INVALID_GPA;
>  
>  	if (reg_size != sizeof(unsigned long))
>  		return -EINVAL;
> @@ -191,18 +192,18 @@ static int kvm_sbi_ext_sta_set_reg(struct kvm_vcpu *vcpu, unsigned long reg_num,
>  		if (IS_ENABLED(CONFIG_32BIT)) {
>  			gpa_t hi = upper_32_bits(vcpu->arch.sta.shmem);
>  
> -			vcpu->arch.sta.shmem = value;
> -			vcpu->arch.sta.shmem |= hi << 32;
> +			new_shmem = value;
> +			new_shmem |= hi << 32;
>  		} else {
> -			vcpu->arch.sta.shmem = value;
> +			new_shmem = value;
>  		}
>  		break;
>  	case KVM_REG_RISCV_SBI_STA_REG(shmem_hi):
>  		if (IS_ENABLED(CONFIG_32BIT)) {
>  			gpa_t lo = lower_32_bits(vcpu->arch.sta.shmem);
>  
> -			vcpu->arch.sta.shmem = ((gpa_t)value << 32);
> -			vcpu->arch.sta.shmem |= lo;
> +			new_shmem = ((gpa_t)value << 32);
> +			new_shmem |= lo;
>  		} else if (value != 0) {
>  			return -EINVAL;
>  		}
> @@ -211,6 +212,11 @@ static int kvm_sbi_ext_sta_set_reg(struct kvm_vcpu *vcpu, unsigned long reg_num,
>  		return -ENOENT;
>  	}
>  
> +	if (new_shmem != INVALID_GPA && !IS_ALIGNED(new_shmem, 64))
> +		return -EINVAL;
> +
> +	vcpu->arch.sta.shmem = new_shmem;
> +
>  	return 0;
>  }
>

Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
