Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DF5ACD4F54
	for <linux-riscv@archiver.kernel.org>; Wed, 27 May 2026 15:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IaA4db5uTY792zPP+zlcD+ttiGfIiANQsrPT5rdNUYU=; b=x8ZMha8MkzXVmh
	9bsB3FkOPbKY/Oski30gh1ddLtV2RPV0RR/R/9sH4tUVgshHRSpcBZSqjQTjguE+IGU8Y+VgttHai
	ffcvUN8emEl7BVT5JOFRRATgBE0J78clA0cgM05tKxHkWo5S1ARmZ69OFoR7XR2zpcfXFKltG5jEw
	GkAfPMfAPtrV0i1lbr/ElomTUps7fk3cS95Xm/YN4M7rxj6rejbHLhIdP16SXm1suEEyQwJmVo7XF
	YW73t1wayQfuxzYfOyJi1eolrzrJ5K4wg4OWMZMLL1OrCeBc3LlH2MQdkk23nR9BJh0Fs76nVtN6H
	oZZz9S5xAPJwI0Z1K7Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSGZe-00000004Rqc-2F5Q;
	Wed, 27 May 2026 15:53:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSGZb-00000004Rpk-0CsR
	for linux-riscv@lists.infradead.org;
	Wed, 27 May 2026 15:53:36 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64RAW5Km1403112
	for <linux-riscv@lists.infradead.org>; Wed, 27 May 2026 15:53:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TjJldvT7FSi/xrhKmKtEzNTk
	czqnTLHADBywYWMgN28=; b=gQN4r0ZgLx+XsiOlcrE29Zz5Vl81aCXbacw27mXF
	g38Vz5TPdBTqq+ezM9Jf7bCtfCTz1kxPsnUYUkLf48k/abCqUCQrHWtbhPVlQEqf
	S/NcU/DuplQEWDep45FZIH+6ITPYc4gPCzJouApBCxxZ1Oxav37U0uRWN0MQ8mWf
	FDe5k4SXcHkDEt1k1bHURNPehZHzxk+CIcmtMiUFZ/6phyOOcxhmdflMHqONS+vD
	pTWCS1Un93n210sb0A+nlm5ymKWcVVZPDBKAPU65ulveECcn2RIycvskDx1bpRCD
	EjcbLuK91uAuMKZxxV8NL23EmOhCgXqqZVjJDLOl1vUkEw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edxxas72q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 27 May 2026 15:53:33 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3041ab826ddso11288265eec.0
        for <linux-riscv@lists.infradead.org>; Wed, 27 May 2026 08:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779897213; x=1780502013; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TjJldvT7FSi/xrhKmKtEzNTkczqnTLHADBywYWMgN28=;
        b=ZtxgzILxezxTr1srPmJMclk4Y+CnAyNk5XcwCrtiHklrZVz0tY2VHHZ6VtIQMbklGi
         dr39xuh20nkian0Xp6XH7K3hdy8gUPza/eKo8s5ScEkGV5m6r5S7ZFuvbcJCumic08Tx
         /w0PwxlWMZhEfBN5x9izzQb/S3cGCPnOu33SwFxgsOCmTy+m8tz5/1jXkBjCovza3HTh
         5Gad59NcbCKmcSMcDFN9aIBD9HJHkVs7wKiEurAu8BiEHJhTxQfbPnaohEhhw4vhxZYS
         qxpFwLxU8ZA0jNm327MBOm5SrzblCbUvWuxXAlLBel6qppCnZ+zBEDQHWAM//y9Ab9Mq
         iG/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779897213; x=1780502013;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TjJldvT7FSi/xrhKmKtEzNTkczqnTLHADBywYWMgN28=;
        b=JTx7/mAMne3zBoKnbpGKQWjWJ0A6L94GvRtBkdAqiAZ+pEwP+9yF9i5gc7KkS62fYm
         L11UEO9s43vu8cyI9KQT/mBWW+IcOtOlEYykvVWAQ2vO2mcA1zPq6csrQugD9rczHQNu
         vbjgxPHQRez0HtbUOJepO+9HapCVkiWzzBNXRbimBkQuoGCXBjqBTSDm5/tEsO+VUydl
         6TPT/hP1zJT2ySlw/Evbcx+TdcAwcYEIDXSWhapWDbGxtgqCZgnHAYA+LxegSNYjOoQY
         BFbqoFH8iu2HvgVAjf1Unbei/luKae5tNrYntvIRAWqBnVvg3beHDbYIhlKoHGUP2RV1
         iUyQ==
X-Forwarded-Encrypted: i=1; AFNElJ+U0OtS9uz1qLWYzgZO9irUWgUM2mnKNpyCFgzYKAs1GhncSI5f/CV0aYAEP2jlIdIx3a4Xat6jqmtPiQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxmySA5Xcs3AKw9bfFGuhoCQ/Pr79geXnQ2q25JzOKANJ5MZLls
	uLaiLHG+6b0VdL2Q0VxdViepKEV2TIlqGS1ciwGe8InUGyzdTHVGydVmiDYMgbHdNyR3DsQBs3c
	tl9Y1CEShjA2h9R3p6NYQ/LslUoIL9lfd+uQX8eQS5T7hYrazBWzCcdKntD5zlkCtZAKfCfo=
X-Gm-Gg: Acq92OF98thUIz9e4gZoTGKxZAqJWpAAKOUK0WOg5St1mtz//P8adZfokorc+GZeJk4
	RxfVhfxJmSMIMO0FZy36JBaD1WT/65qghTpW33w7Z+5iWLNCclyek+4LynywpCpQznqB/GQiDnU
	MpbvQrebqQ7fvv3FKguxjV/ulCSMU9bWTP+UFlx1vIsYyv0QNrHfnjPI8dm4AMRZq+UAgg/cp1r
	hDg4wPkTm3GBmCkBT4zShNwkptcHAE6SFAncwQooKavwboovrt+EF16uAraWbLLlGmII8GYzc6H
	Hygspd+eyIqiW6Jkg/YGX7nk3xsYRE+mDhGthL4KsweEULVOMmkm0skemOuutx6JAWaFduUDziT
	zYXslz5TJrdYP9LitS8kSf4EkJRCOr0M=
X-Received: by 2002:a05:7301:4008:b0:304:ccdd:594a with SMTP id 5a478bee46e88-304ccdd6451mr477568eec.5.1779897212920;
        Wed, 27 May 2026 08:53:32 -0700 (PDT)
X-Received: by 2002:a05:7301:4008:b0:304:ccdd:594a with SMTP id 5a478bee46e88-304ccdd6451mr477541eec.5.1779897212336;
        Wed, 27 May 2026 08:53:32 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30451ef3273sm17889766eec.2.2026.05.27.08.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 08:53:31 -0700 (PDT)
Date: Wed, 27 May 2026 10:53:30 -0500
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Guodong Xu <guodong@riscstar.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Shuah Khan <shuah@kernel.org>, Anup Patel <anup@brainfault.org>,
        Atish Patra <atish.patra@linux.dev>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Deepak Gupta <debug@rivosinc.com>, Zong Li <zong.li@sifive.com>,
        Christian Brauner <brauner@kernel.org>,
        Charlie Jenkins <charlie@rivosinc.com>,
        Samuel Holland <samuel.holland@sifive.com>, linux-doc@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, kvm@vger.kernel.org,
        kvm-riscv@lists.infradead.org, Jesse Taube <jesse@rivosinc.com>,
        Andy Chiu <andybnac@gmail.com>
Subject: Re: [PATCH v2 04/10] riscv: Add Zicclsm to cpufeature and hwprobe
Message-ID: <ssov52bc63wlfnrcxbjt56wi2jxl6yzce4lyerwkix5p2xlgri@r5tjrax3nfnc>
References: <20260511-rva23u64-hwprobe-v2-v2-0-21c5a544f1dc@riscstar.com>
 <20260511-rva23u64-hwprobe-v2-v2-4-21c5a544f1dc@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260511-rva23u64-hwprobe-v2-v2-4-21c5a544f1dc@riscstar.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDE1OSBTYWx0ZWRfX7NkN1lTMuPL1
 fh0W7jNxQz9EEWx6hm4yTdTslX/5a6OT9RcWYMJlMtN66XszOFXC64lbVoMS9SkputGszZiSp80
 mtPl67/O93/n13BYH3xD2ccLluQKKtlREt0KqV0gBpmST5LaODyJSxZheVEBA0PJPgHjn1Vlyia
 ameSWpux7I7e78lRZ982PDSoRy+WHMdYHISXJacznPeyuy05BSL3uti9U9Sbga04kh6S13FqXCz
 IugSpjbb6rSzOGvXBeg/it4W2grIcvNJfY7C4edLcJUlUTjXhvuCXiznuotUpIQPA7al7Xf3teP
 OxFiHFxgDZ8yCa4w/TDibQBihEiXcDAHCjZTuLkDW22X1x9BX6ekTU4fkMTrookoiwb5yJus7Ve
 dLubIjzVOhPuFBdcRv0DaZAn7S8bq9KRGH7zFzpW64u6qnK+JepQH3XSP54Zw2wHk046mntn7lK
 eVrYJ54luNCZlhXPJnQ==
X-Authority-Analysis: v=2.4 cv=AureGu9P c=1 sm=1 tr=0 ts=6a17137d cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=c92rfblmAAAA:8 a=ee_2aqc6AAAA:8 a=h0uksLzaAAAA:8 a=XYAwZIGsAAAA:8
 a=pFyQfRViAAAA:8 a=EUspDBNiAAAA:8 a=x1z8LLhTheR_cLHN9ccA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=GvGzcOZaWPEFPQC_NcjD:22 a=VOpmJXOdbJOWo2YY3GeN:22
 a=MSi_79tMYmZZG2gvAgS0:22 a=E8ToXWR_bxluHZ7gmE-Z:22 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-GUID: Qhuz67RqkRgEbTkTpiCNljSNQjUtHYOT
X-Proofpoint-ORIG-GUID: Qhuz67RqkRgEbTkTpiCNljSNQjUtHYOT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_02,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605270159
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_085335_099100_6DE28644 
X-CRM114-Status: GOOD (  28.26  )
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

On Mon, May 11, 2026 at 09:34:49PM -0400, Guodong Xu wrote:
> From: Jesse Taube <jesse@rivosinc.com>
> 
> Zicclsm requires misaligned support for all regular load and store
> instructions, both scalar and vector, but not AMOs or other
> specialized forms of memory access, to main memory regions with both
> the cacheability and coherence PMAs, as defined in the profiles spec.
> Even though mandated, misaligned loads and stores might execute
> extremely slowly. Standard software distributions should assume their
> existence only for correctness, not for performance.
> 
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Andy Chiu <andy.chiu@sifive.com>
> Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
> Tested-by: Charlie Jenkins <charlie@rivosinc.com>
> Signed-off-by: Jesse Taube <jesse@rivosinc.com>
> [Rebased, rewrote doc text, minor commit message revisions]
> Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> 
> ---
> v2:
> - Rebased onto v7.1-rc2; moved ZICCLSM to IMA_EXT_1 and
>   allocated a new bit for it
> ---
>  Documentation/arch/riscv/hwprobe.rst  | 4 ++++
>  arch/riscv/include/asm/hwcap.h        | 1 +
>  arch/riscv/include/uapi/asm/hwprobe.h | 1 +
>  arch/riscv/kernel/cpufeature.c        | 1 +
>  arch/riscv/kernel/sys_hwprobe.c       | 1 +
>  5 files changed, 8 insertions(+)
> 
> diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
> index c3bb26d70c748..05f746061f679 100644
> --- a/Documentation/arch/riscv/hwprobe.rst
> +++ b/Documentation/arch/riscv/hwprobe.rst
> @@ -289,6 +289,10 @@ The following keys are defined:
>         defined in the RISC-V ISA manual starting from commit f88abf1 ("Integrating
>         load/store pair for RV32 with the main manual") of the riscv-isa-manual.
>  
> +  * :c:macro:`RISCV_HWPROBE_EXT_ZICCLSM`: The Zicclsm extension is supported,
> +       as defined in the RISC-V Profiles specification starting from commit
> +       b1d80660 ("Updated to ratified state.")

Sashiko[1] points out that now that this has been moved to IMA_EXT_1 it is
no longer the correct location.

[1] https://sashiko.dev/#/patchset/20260511-rva23u64-hwprobe-v2-v2-0-21c5a544f1dc%40riscstar.com

Thanks,
drew

> +
>  * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: Deprecated.  Returns similar values to
>       :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF`, but the key was
>       mistakenly classified as a bitmask rather than a value.
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index 44bf8c7d8acc5..e8f4a7dd96a93 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -112,6 +112,7 @@
>  #define RISCV_ISA_EXT_ZCLSD		103
>  #define RISCV_ISA_EXT_ZICFILP		104
>  #define RISCV_ISA_EXT_ZICFISS		105
> +#define RISCV_ISA_EXT_ZICCLSM		106
>  
>  #define RISCV_ISA_EXT_XLINUXENVCFG	127
>  
> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
> index 9139edba0aecb..6819df159c51e 100644
> --- a/arch/riscv/include/uapi/asm/hwprobe.h
> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> @@ -116,6 +116,7 @@ struct riscv_hwprobe {
>  #define RISCV_HWPROBE_KEY_ZICBOP_BLOCK_SIZE	15
>  #define RISCV_HWPROBE_KEY_IMA_EXT_1		16
>  #define		RISCV_HWPROBE_EXT_ZICFISS	(1ULL << 0)
> +#define		RISCV_HWPROBE_EXT_ZICCLSM	(1ULL << 1)
>  
>  /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
>  
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 5cf463570229d..4b4a8157277a3 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -502,6 +502,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
>  	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicbom, RISCV_ISA_EXT_ZICBOM, riscv_xlinuxenvcfg_exts, riscv_ext_zicbom_validate),
>  	__RISCV_ISA_EXT_DATA_VALIDATE(zicbop, RISCV_ISA_EXT_ZICBOP, riscv_ext_zicbop_validate),
>  	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_xlinuxenvcfg_exts, riscv_ext_zicboz_validate),
> +	__RISCV_ISA_EXT_DATA(zicclsm, RISCV_ISA_EXT_ZICCLSM),
>  	__RISCV_ISA_EXT_DATA(ziccrse, RISCV_ISA_EXT_ZICCRSE),
>  	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicfilp, RISCV_ISA_EXT_ZICFILP, riscv_xlinuxenvcfg_exts,
>  					  riscv_cfilp_validate),
> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
> index f8f68ba781b45..9cf62266f1890 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -205,6 +205,7 @@ static void hwprobe_isa_ext1(struct riscv_hwprobe *pair,
>  		 * in the hart_isa bitmap, are made.
>  		 */
>  		EXT_KEY(isainfo->isa, ZICFISS, pair->value, missing);
> +		EXT_KEY(isainfo->isa, ZICCLSM, pair->value, missing);
>  	}
>  
>  	/* Now turn off reporting features if any CPU is missing it. */
> 
> -- 
> 2.43.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
