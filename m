Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F5D1EF06E1
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Feb 2026 16:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mE9o8H43qCTULCg+aO1KDxv3yV98eqxCVsu24tUZX88=; b=XXCWqGOWbrQsa4
	xRjuzXffQbDk2hxadYuRLJIL0WsavvivUbvgBEoBFJ2NJo4pcrxujdPIJFLWdAy2y5HVEC1lBYv2h
	5YNuyQUQAMBW/jSFFSOx4fs7aVVWknqaGi3jTjhLIkoMFN7rmjzO8QM9MiFZAb0T6XoHpvhDww6fy
	N+PKBYUbH9vaRfHtv4O3DqCMNoDBNZc/+WPflqHMXHGN/RfxFN3yRDl/WEBc5pcuy2UskKDoiiQJO
	HPQUhCakpMTzV/W9EeDSPHxuSt7JZO9I1McWE0daNdLnhWK95A24StUrbay5MjRUulP+XXOcT17Hm
	rM9kZ+ZMziG9ORqxNQGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vp7sU-0000000DUJn-07Ne;
	Sun, 08 Feb 2026 16:43:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vp7sQ-0000000DUJE-2DM2
	for linux-riscv@lists.infradead.org;
	Sun, 08 Feb 2026 16:43:16 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6187tEqZ1272719
	for <linux-riscv@lists.infradead.org>; Sun, 8 Feb 2026 16:43:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qyFbrkasGvytW0vFg5FR+HBR
	DKrens4j/ebP3iog8uQ=; b=PkutnRG+Gn+RCa1hcMKBojXKg1NgYLPsuKQj+Ziq
	qYhbZykVzF4yBRMMUQpsoC+wbsDpZjWv7J4oCl8rRK54CTL9L1yZwU2sSk4Hvrkl
	qgYerpESiVdjvGPXXV8YAM78/Rl0T4b8/gO7oqYs80Oe6Ka4H8O+Uz0Mvc0HwGmn
	pa4cT5xqkb4yYdVQbZxeTo0Cj00r2nqLHrvreL5Shl+o9VloQY8kM28uaN7kDEVB
	32Rsf+oAbLNgXN8O0Xb7Nma55nC9/zFFKO70CkxUZaFz7vkXc6Ahic9AshI/Y1ZN
	x9vwJvc/Q1GCr1wm1iCmS9IzpttnqY7Y7bHpL12pekSHVg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c6g658y8h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Sun, 08 Feb 2026 16:43:12 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-127133794b6so911606c88.1
        for <linux-riscv@lists.infradead.org>; Sun, 08 Feb 2026 08:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770568991; x=1771173791; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qyFbrkasGvytW0vFg5FR+HBRDKrens4j/ebP3iog8uQ=;
        b=cE5B4AJCRHM5BthRZVvryDBXRi28Ic7GHWpHkajY31VJbJy98Vx5K6/W4VCu/r92t8
         04VdJGG04iw5zsZiQkZcEcaAlCpAXsguDg/pJZrbWcyStbL90dXdpytAQPgxvCC5xt7I
         YTEAjs/ZD4242NASHcFTVoTVlXHq/m+9VO/Anb7u1f/LxZtbtBQQ0TmxzNcO3h4TdEWa
         WK52nrZndEtO1e5x11Pp/BMh9So7RJa9PLNN+FM+eUnK2nsTHbn37vPah9OL8S/4iUVN
         67G1E7UieXFAzdN4rT677vfbJZyzyhq6zRd71/9dHQHDiP6Cbh+xfU/RjTGrPiU9cdr7
         3YGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770568991; x=1771173791;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qyFbrkasGvytW0vFg5FR+HBRDKrens4j/ebP3iog8uQ=;
        b=HJ0P+hWad2lIl9ZBE+r1DvdbziqOLlKNWOLIr36eURRQXnoMAcCP7qWTQ84rdFUDwI
         XUkuTP5LswB1KzB3V+wttvYbfBAVOc4HjEPsyJBSiljF7yA9ik8S8jssnQOgT1CR8qNy
         7kWBqKsW41TkxZptyrEVx6um3u9+bQr9DiHLcT45mTJxDN0yTpTHCipMa815Oevcdz6r
         9a334ZdktMqxTWcTQDj6IJ+n8w22QTPbqI++BM+3RJACY1ZMMH+9sGEe6dRwLILX1q9a
         JhOodnw3UEkmLh0wHJFTryLa4XywVipOR5Qw/6xgkTaHgo9m4h0lLTihWiIqfUgn12iC
         L5gg==
X-Forwarded-Encrypted: i=1; AJvYcCW1xumdRIzvKY9zwe0DT1lFbppcz1Bv1ZFVtvipevYije0PdNRsO+gYSAysuuF6JsFV2yt7K9t45TxAaA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzxRd1jM93r1+K6oXt9khmcRH8tvW63jzfkrCgdKGChpIKJ2q1I
	+XwjXVp2D88D/77m0OxXQ7lV3YJpFClZ9Fz3prFnydO/w6NVClSdg8XNdSfXbntbJy72Y30aVdu
	pELSRlFZ4NEPhSeH8DQTh1JRTsNpC1Tbx5d6fReeUnLsXDyewW4TaznDWwOuDnjlX/r9XNW0=
X-Gm-Gg: AZuq6aKz2CMvxoTGBosC85I4fImdtErYZ+RPn2mFmLRzirgTD5e4m7t44TwoJXD0OAB
	Nnop8SZ4RDR3dL0NaZhWwJ05hQw+9qg/g8Do/25vRmjmSa95LVmHGbd0imli2pmUCJ7rGvpHIK2
	iSKmBWgGw/k7zUZjNBS3iuhrqBQm8IOMCxuYEEp5XE5oUBvU6TGquxlGHV09EBJ/qp2Mzh+qIXd
	Tw9y5GerSYP31+mdAllmfsrDr7Mol/2tXgQYdJ/y/C76Y80TsqX87WTB94BEpLSHWAJhajPHXyh
	5pDUpJKgxjqbjNaCh7BysyxPIK8raj9bHHz4kAReW3DPlb8zTluSfbURFqYoi2cey/5vwmy8mQ8
	D+mKiENUOnrM939glb+o=
X-Received: by 2002:a05:7300:cc0c:b0:2ba:6e87:5263 with SMTP id 5a478bee46e88-2ba6e8788a8mr523576eec.32.1770568991446;
        Sun, 08 Feb 2026 08:43:11 -0800 (PST)
X-Received: by 2002:a05:7300:cc0c:b0:2ba:6e87:5263 with SMTP id 5a478bee46e88-2ba6e8788a8mr523561eec.32.1770568990890;
        Sun, 08 Feb 2026 08:43:10 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ba6d1c61c3sm1199441eec.19.2026.02.08.08.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 08:43:10 -0800 (PST)
Date: Sun, 8 Feb 2026 10:43:09 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Guodong Xu <guodong@riscstar.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/8] riscv: cpufeature: Add parsing for B
Message-ID: <rbhjt6qmraoxsdur74mhl2ugy7orr2mb237ynq2sxrraqkl5zm@yc6kim3ic6as>
References: <20260207-isa-ext-parse-export-v1-0-a64d3a8bc20a@riscstar.com>
 <20260207-isa-ext-parse-export-v1-1-a64d3a8bc20a@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260207-isa-ext-parse-export-v1-1-a64d3a8bc20a@riscstar.com>
X-Authority-Analysis: v=2.4 cv=GqNPO01C c=1 sm=1 tr=0 ts=6988bd20 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ee_2aqc6AAAA:8 a=Y2NC8pMVq5XtuLsIzfUA:9
 a=CjuIK1q_8ugA:10 a=vr4QvYf-bLy2KjpDp97w:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-ORIG-GUID: aQke_y67bKXOqkp4X2AwxA--IEQlHtkA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA4MDE0NCBTYWx0ZWRfX/vl8zxyZRjZv
 L2faKibqUpxLX3txr2WKl92DkVVLjaw5KCA783xAAPz0kDx1Cr3vYOARzoM0yfPLj7D/IBKXQMe
 wWQmRoHFybnoT7j7OaDnyiKunPy8ZYxF41f5zbgH2qXZJDIIwu11txT8M5Je8oEc286F/zv3yKk
 NRTZ0ASdc7KO0juJVSc2CHHIXrcdITwtWhr154PN9yMm8iw7HY8tQWvwQuGqfZSDU/fzyx+1hpI
 SQRDZQ3ApDPlyhe+nnR6+Z4QAzgHHWr8GHeC5aFytihLbGaKpwXcq3piVxE+O/SNaqDkQ/0/JiI
 0qKhMp3QWMiOVTRR3YXFz7Lw4pT1K7cNYuWeCt5zeSyEoxIuNUC6S+AqALi5CNhOX8fiopC49XT
 LKzMJR4NpK8+kh0XZS8NKZTlcEfbIWce9GRnsv+qPXVbXz1IrxDQ2tmDGKty4cVo0MccMRT6qzj
 bmdgneIHIpeW4gH1SyQ==
X-Proofpoint-GUID: aQke_y67bKXOqkp4X2AwxA--IEQlHtkA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_04,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602080144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260208_084314_784772_AE630380 
X-CRM114-Status: GOOD (  22.65  )
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

On Sat, Feb 07, 2026 at 06:27:55PM +0800, Guodong Xu wrote:
> The B extension comprises the Zba, Zbb, and Zbs extensions, as defined
> by version 20240411 of the RISC-V Instruction Set Manual Volume I
> Unprivileged Architecture.
> 
> Add B as a superset extension so that when "b" is encountered in the ISA
> string or devicetree, its sub-extensions are automatically enabled.
> 
> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
>  arch/riscv/include/asm/hwcap.h |  1 +
>  arch/riscv/kernel/cpufeature.c | 10 ++++++++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index aa2af21f3bd32573558e964f94b32f9739f4c89f..35e87e4a8475a9201e84e7f9f8a4d10dfd9e4759 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -11,6 +11,7 @@
>  #include <uapi/asm/hwcap.h>
>  
>  #define RISCV_ISA_EXT_a		('a' - 'a')
> +#define RISCV_ISA_EXT_b		('b' - 'a')
>  #define RISCV_ISA_EXT_c		('c' - 'a')
>  #define RISCV_ISA_EXT_d		('d' - 'a')
>  #define RISCV_ISA_EXT_f		('f' - 'a')
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 63ad6393b2c6dcbfd6e7e247cf4bacb6c11fe58e..3d3af82a53250f29204a3fb138feaf520a878d0e 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -480,6 +480,15 @@ static const unsigned int riscv_supm_exts[] = {
>  	RISCV_ISA_EXT_SUPM
>  };
>  
> +/*
> + * The B extension comprises Zba, Zbb, and Zbs.
> + */
> +static const unsigned int riscv_b_exts[] = {
> +	RISCV_ISA_EXT_ZBA,
> +	RISCV_ISA_EXT_ZBB,
> +	RISCV_ISA_EXT_ZBS,
> +};
> +
>  /*
>   * The canonical order of ISA extension names in the ISA string is defined in
>   * Chapter 27 of the RISC-V Instruction Set Manual Volume I Unprivileged ISA
> @@ -528,6 +537,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
>  	__RISCV_ISA_EXT_DATA_VALIDATE(d, RISCV_ISA_EXT_d, riscv_ext_d_validate),
>  	__RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_q),
>  	__RISCV_ISA_EXT_SUPERSET(c, RISCV_ISA_EXT_c, riscv_c_exts),
> +	__RISCV_ISA_EXT_SUPERSET(b, RISCV_ISA_EXT_b, riscv_b_exts),
>  	__RISCV_ISA_EXT_SUPERSET_VALIDATE(v, RISCV_ISA_EXT_v, riscv_v_exts, riscv_ext_vector_float_validate),
>  	__RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_h),
>  	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicbom, RISCV_ISA_EXT_ZICBOM, riscv_xlinuxenvcfg_exts, riscv_ext_zicbom_validate),
> 
> -- 
> 2.43.0

Hi Guodong Xu,

As part of the "hwprobe: Introduce rva23u64 base behavior" RFC [1] I
posted a similar patch where I also added B to hwcap. Can you take a
look at that?

[1] https://lore.kernel.org/all/20260206002349.96740-1-andrew.jones@oss.qualcomm.com/

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
