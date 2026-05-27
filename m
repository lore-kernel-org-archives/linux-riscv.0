Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84162CD4F54
	for <linux-riscv@archiver.kernel.org>; Wed, 27 May 2026 16:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vz/HoCgK3QBlZlHsNGODOVSPcJfm3McE48W16PepkOo=; b=ReiY6UvYko1lb/
	tF3YQqFhw7TE/gccq+HgkUrHLPUb0C0Fj418jGW00G13YSO7qCXD033ZeQhxbv0UXYV4mcY4pCowR
	zdILphE5eFP0s9w6MWqkILYQ+eHuZBO8D4uYIBnvMGopxsis4P7bh/t4YE1jO3c0IFBHRuAaV8YI+
	zBSpKYGCkk2T1F4YsBezCqq64bIVo6DuP0ECmJ2syZWRvMEKZM4tWn6Eu4TJVH37i6ub1zgE6R8Ge
	0L1SznxTpXtrD95QtVzFmfPOu3vvVCiiIhA1dJTvP8Ck3qnqrby2i8BKSr7qm/KIKyQ6SuxABjrEw
	3goJjCcwR4yg3wpv4Hvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSHDx-00000004WSY-3P6P;
	Wed, 27 May 2026 16:35:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSHDv-00000004WR8-202r
	for linux-riscv@lists.infradead.org;
	Wed, 27 May 2026 16:35:16 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64RA6Xoi1149360
	for <linux-riscv@lists.infradead.org>; Wed, 27 May 2026 16:35:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3o/qC8F03FVtWvVL+To0ZZ8G
	ZQPvSZaDhCCbgVrIpSk=; b=OljyIpPW1Bpt0pM8Vh+sEa5MvLEqha4zmw6RCVwi
	21zDtiVA67hiZVBT63mzSLd71m798KJCmzz7Cb31jIh2FIDkxXrBHMc+l5sB4RtO
	UYUoKMTW1TJERhd310gbTIiI2uTZcazPB+oOedZ94Kl0yN3mjmPOXQEB0C2vw/zP
	ThGhorK1HP6NZB7dpThJKIS2iW3vQ03ZPDC7smO/GG2cAKAmJWEv7QY7Rw2MZKqO
	JA1vqLu7t+k6/9LibvGr+YjcCi92vj1FS/gHIbDNmIZfeJ9qUc/E8pwXycGG+sgH
	TvEovUyhF434EdvWvxzbGJ/vrcaUENG6/J9vpRGIMb6NYQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edxjshggg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 27 May 2026 16:35:14 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-304bbf2423cso832434eec.0
        for <linux-riscv@lists.infradead.org>; Wed, 27 May 2026 09:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779899714; x=1780504514; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3o/qC8F03FVtWvVL+To0ZZ8GZQPvSZaDhCCbgVrIpSk=;
        b=iqxrpbAAqPfm8KZ4w0/aPXRiaDLqljIYBCxi/yGLIeJ9fc/Qzb+9sApim1LRsnfT/5
         KQwoPktIMhZr8otOYij7o9qBh8kc0PEa9lfWpUGkOzC0kKoGJP9497+WZacpbzukJc4q
         AKAyU878rn/CdCysx25blWczNqBhOaQt3XDeMm9N/q/5dG7AgJx9IZJYcjsomcoC4zUx
         8xoUfKJTLgTzROb+rvliIa6Tcs95j8Sl6cC53ZXxRCjrpNQ7NIwg4XDdgF5N7NfNKjr5
         6ERuoPZnnR6fkGVpCgvtw+XaNFWTs1ocDG/D0DUr11pQaCvWAJ/azWbOfTzHSxwHHp7O
         1chg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779899714; x=1780504514;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3o/qC8F03FVtWvVL+To0ZZ8GZQPvSZaDhCCbgVrIpSk=;
        b=ZafWvVGv/jHtGSFWqPJcP+D2wDPyTnJVkiQ8Y848a/MId3HEnJaSkD9BqAJxkItw36
         BINsIObgdJosOfO7HYp6SPm6byyXT1Z1KJxjRwHZA81arGycY/TCj7h0jTkblqr9eWwP
         DeD8CKMuY0Mh4KDYpGEhqDhM4KjVwiducbsRKzPgGnrsJlfEkEjsLp40uFWlqWa+k2FZ
         8UY2AJg6AZ1E8wnFV1656RnQlXMjYk9HVvg12reLJGOdErNW+M6vw697bZXOGSaOjXl3
         m6kd2qCnGyAHea5xJIjTkFcw1Pu1ydc34T83H2Jkzaq9oHo2CU9y60paf9GMhozoi/I7
         d3jA==
X-Forwarded-Encrypted: i=1; AFNElJ+sF5lSJiu3PphkW33Sf5WQMgD+SpBxkVsAOiczM+mObddbAZ6tM5vjXorANxrTRlxxiOylPwBZPxC/DA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5J968K1NOIq6s4Q1GgapPZ+xR8O/+fbUPMOTPJKtHKDbbCMHU
	2DZ9rFBNTCCEXGDgG6XzNhaWzeoUn4fAnQM2h/yYCEZD/tE5JbKKgjSMj8Gb427IN2vA+Y3YSVG
	H18oDMGwRqPOzVIEv/1T0LbOkJY3vFuDm7IW/E9/A0E9hzt5wZC+8WZd2xzGwoQ12y+Gig/s=
X-Gm-Gg: Acq92OFRQ2NQK+WsV8Cql5ffnyel/DEzPmdDcBYARmqXZ1vZHXuhC2cOkCI3RQLE5CT
	H3TQkbC4wBpBca6pAIiZ/Tc4qyWIm9ORb/eV57esQ3XNlwiYQMrsHzFEGjNHFp9oYIxiBcYOD8s
	Nrw6hS+/ua4Vec4CCLsS1Z7SoyqVITGVCO9mxBmGGWl1NzeOiNgrb9NW34sl6MiVa7aL7i2h4/t
	ktPJNGrdQuUd2BC813P5TBUq33h9adCIpmHgic5/4UXhnZpLdBrUwiz5EVf/lN2wU/6PjjgRON3
	LQepM500nuTi7RZvVsttKMNQUDnVHdHE2BW1i3QAZBmM+8lxhP110CmuBe7oPwxs/qYMaF4m+Xr
	BnqwdKce3dVTW7h8iFVjYQg0IQVHxJto=
X-Received: by 2002:a05:7022:fe09:b0:134:ff2e:a71c with SMTP id a92af1059eb24-1365f600b14mr8303730c88.9.1779899714287;
        Wed, 27 May 2026 09:35:14 -0700 (PDT)
X-Received: by 2002:a05:7022:fe09:b0:134:ff2e:a71c with SMTP id a92af1059eb24-1365f600b14mr8303599c88.9.1779899710070;
        Wed, 27 May 2026 09:35:10 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1366aba2b9asm13381153c88.15.2026.05.27.09.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 09:35:09 -0700 (PDT)
Date: Wed, 27 May 2026 11:35:08 -0500
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
        kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v2 08/10] riscv: cpufeature: Introduce ISA bases bitmap
 and rva23u64 detection
Message-ID: <5tjmypgyxbhgxfjub5q6ne475uysse6yl473sxisjoammkdvbu@yebejqbiy6e3>
References: <20260511-rva23u64-hwprobe-v2-v2-0-21c5a544f1dc@riscstar.com>
 <20260511-rva23u64-hwprobe-v2-v2-8-21c5a544f1dc@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260511-rva23u64-hwprobe-v2-v2-8-21c5a544f1dc@riscstar.com>
X-Authority-Analysis: v=2.4 cv=C4PZDwP+ c=1 sm=1 tr=0 ts=6a171d42 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=c92rfblmAAAA:8 a=ee_2aqc6AAAA:8 a=EUspDBNiAAAA:8 a=4F2392DG074ZRd-8RbwA:9
 a=CjuIK1q_8ugA:10 a=scEy_gLbYbu1JhEsrz4S:22 a=GvGzcOZaWPEFPQC_NcjD:22
 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDE2NiBTYWx0ZWRfX6gti0H7TGDPz
 GJMd+1/ozvajUb+dZCQ7D3qj+Zt4Y4AgKaic/bVNboaRorc5vgk0b3xvmX5lZJA0KQlPGk9Crja
 1K4zK49MmCBT6FNoaGmAtTw/31JC3sLNrQvYW6bl0dzI2IsZwkQDkwO2L2ukGQt8WakHfG5hoI/
 2uiR8tHyz1CwtGGI3Fg8tbZJKNU7Fn7WNvPFkDCbBvcsUwEkATVH5BC4MPmckjVYeTgahjPBOR0
 rcFmeEtdkK4NoS4rZTq88YL4rqwE4454tMNE7L5qzgEMxDmbchrKM7DY4k4RripMPpwgdkAnwgu
 QefYzTf+GlV5+syw23fIGuaHIxl8resFdFQs27PE4o6HROsxcepKWUTS9ATIzHNcKBLpb3+2FVv
 nposAE2titmRiUf4sQLA0B+175AOzWf3Y9smG6ms22IwAwu5nYK76lYJUClVO+gSB2uhuamBDUy
 nAfF4YO8u/S9BI7+3Cw==
X-Proofpoint-ORIG-GUID: M4dYJefGGHRiYyRrlD2e3d02hrbuea9L
X-Proofpoint-GUID: M4dYJefGGHRiYyRrlD2e3d02hrbuea9L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270166
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_093515_536819_257A6850 
X-CRM114-Status: GOOD (  30.65  )
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

On Mon, May 11, 2026 at 09:34:53PM -0400, Guodong Xu wrote:
> Introduce a per-hart and host-wide bitmap of conformant ISA "bases" --
> named profile-class sets such as IMA and RVA23U64 -- and compute
> both at init time.
> 
> This is the cache that subsequent consumers (hwprobe's
> RVA23U64 base behavior bit, /proc/cpuinfo's "isa bases" lines, etc.)
> read without recomputing.
> 
> riscv_init_isa_bases() iterates over all possible cpus to populate
> each hart_isa[cpu].isa_bases, then computes the host-wide
> riscv_isa_bases against the AND-across-harts riscv_isa bitmap.  It is
> registered as a subsys_initcall so it executes after
> core_initcall(tagged_addr_init), which probes senvcfg.PMM and
> populates have_user_pmlen_*.  Without that ordering,
> riscv_have_user_pmlen(7) would still return its default false and the
> RVA23U64 detection path would always bail.
> 
> The detection itself is encapsulated in riscv_set_isa_bases(), which
> takes an output bases bitmap and an input ISA bitmap.
> 
> Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
> v2:
> - Implement riscv_init_isa_bases() that runs at system init time,
>   after tagged_addr_init() populates have_user_pmlen_*.
> - Split RVA23S64 placeholder into a future patch.
> ---
>  arch/riscv/include/asm/cpufeature.h | 14 ++++++
>  arch/riscv/kernel/cpufeature.c      | 92 +++++++++++++++++++++++++++++++++++++
>  2 files changed, 106 insertions(+)

Sashiko points out a few things about this patch which I think I
agree with

https://sashiko.dev/#/patchset/20260511-rva23u64-hwprobe-v2-v2-0-21c5a544f1dc%40riscstar.com?part=8

Additional nit below.

> 
> diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
> index 739fcc84bf7b2..facc31b2960c6 100644
> --- a/arch/riscv/include/asm/cpufeature.h
> +++ b/arch/riscv/include/asm/cpufeature.h
> @@ -25,10 +25,24 @@ struct riscv_cpuinfo {
>  	unsigned long mimpid;
>  };
>  
> +enum {
> +	RISCV_ISA_BASE_IMA,
> +	RISCV_ISA_BASE_RVA23U64,
> +	RISCV_NR_ISA_BASES,
> +};
> +
> +/**
> + * struct riscv_isainfo - per-hart ISA state
> + * @isa: bitmap of ISA extensions this hart implements
> + * @isa_bases: bitmap of profile bases this hart conforms to
> + */
>  struct riscv_isainfo {
>  	DECLARE_BITMAP(isa, RISCV_ISA_EXT_MAX);
> +	DECLARE_BITMAP(isa_bases, RISCV_NR_ISA_BASES);
>  };
>  
> +extern unsigned long riscv_isa_bases[BITS_TO_LONGS(RISCV_NR_ISA_BASES)];
> +
>  DECLARE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
>  
>  extern const struct seq_operations cpuinfo_op;
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 81145621dc378..6e8dd33aa3888 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -41,6 +41,9 @@ unsigned long elf_hwcap __read_mostly;
>  /* Host ISA bitmap */
>  static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
>  
> +/* Host ISA bases bitmap */
> +DECLARE_BITMAP(riscv_isa_bases, RISCV_NR_ISA_BASES) __read_mostly;
> +
>  /* Per-cpu ISA extensions. */
>  struct riscv_isainfo hart_isa[NR_CPUS];
>  
> @@ -1305,3 +1308,92 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
>  	}
>  }
>  #endif
> +
> +/*
> + * Compute the set of profile bases (IMA, RVA23U64, ...) a hart
> + * conforms to, given its resolved ISA bitmap.
> + *
> + * If @isa_bitmap is NULL, the host ISA bitmap (the AND across all harts) is
> + * used.
> + */
> +static void riscv_set_isa_bases(unsigned long *bases, const unsigned long *isa_bitmap)
> +{
> +	const unsigned long *isa = isa_bitmap ? isa_bitmap : riscv_isa;
> +	DECLARE_BITMAP(ext_mask, RISCV_ISA_EXT_MAX) = { 0 };
> +	DECLARE_BITMAP(tmp, RISCV_ISA_EXT_MAX);
> +
> +	/* IMA */
> +	set_bit(RISCV_ISA_EXT_I, ext_mask);
> +	set_bit(RISCV_ISA_EXT_M, ext_mask);
> +	set_bit(RISCV_ISA_EXT_A, ext_mask);
> +
> +	if (bitmap_andnot(tmp, ext_mask, isa, RISCV_ISA_EXT_MAX))
> +		return;
> +
> +	set_bit(RISCV_ISA_BASE_IMA, bases);
> +
> +	/* RVA23U64 */
> +
> +	/* Zic64b and Supm with PMLEN=7 */
> +	if (riscv_cbom_block_size != 64 ||
> +	    riscv_cbop_block_size != 64 ||
> +	    riscv_cboz_block_size != 64 ||
> +	    !riscv_have_user_pmlen(7))
> +		return;
> +
> +	set_bit(RISCV_ISA_EXT_F, ext_mask);
> +	set_bit(RISCV_ISA_EXT_D, ext_mask);
> +	set_bit(RISCV_ISA_EXT_C, ext_mask);
> +	set_bit(RISCV_ISA_EXT_B, ext_mask);
> +	set_bit(RISCV_ISA_EXT_ZICSR, ext_mask);
> +	set_bit(RISCV_ISA_EXT_ZICNTR, ext_mask);
> +	set_bit(RISCV_ISA_EXT_ZIHPM, ext_mask);
> +	set_bit(RISCV_ISA_EXT_ZICCIF, ext_mask);
> +	set_bit(RISCV_ISA_EXT_ZICCRSE, ext_mask);
> +	set_bit(RISCV_ISA_EXT_ZICCAMOA, ext_mask);
> +	set_bit(RISCV_ISA_EXT_ZICCLSM, ext_mask);
> +	set_bit(RISCV_ISA_EXT_ZA64RS, ext_mask);
> +	set_bit(RISCV_ISA_EXT_ZIHINTPAUSE, ext_mask);
> +	set_bit(RISCV_ISA_EXT_ZICBOM, ext_mask);
> +	set_bit(RISCV_ISA_EXT_ZICBOP, ext_mask);
> +	set_bit(RISCV_ISA_EXT_ZICBOZ, ext_mask);
> +	set_bit(RISCV_ISA_EXT_ZFHMIN, ext_mask);
> +	set_bit(RISCV_ISA_EXT_ZKT, ext_mask);
> +	set_bit(RISCV_ISA_EXT_V, ext_mask);
> +	set_bit(RISCV_ISA_EXT_ZVFHMIN, ext_mask);
> +	set_bit(RISCV_ISA_EXT_ZVBB, ext_mask);
> +	set_bit(RISCV_ISA_EXT_ZVKT, ext_mask);
> +	set_bit(RISCV_ISA_EXT_ZIHINTNTL, ext_mask);
> +	set_bit(RISCV_ISA_EXT_ZICOND, ext_mask);
> +	set_bit(RISCV_ISA_EXT_ZIMOP, ext_mask);
> +	set_bit(RISCV_ISA_EXT_ZCMOP, ext_mask);
> +	set_bit(RISCV_ISA_EXT_ZCB, ext_mask);
> +	set_bit(RISCV_ISA_EXT_ZFA, ext_mask);
> +	set_bit(RISCV_ISA_EXT_ZAWRS, ext_mask);
> +	set_bit(RISCV_ISA_EXT_SUPM, ext_mask);
> +
> +	if (bitmap_andnot(tmp, ext_mask, isa, RISCV_ISA_EXT_MAX))
> +		return;
> +
> +	set_bit(RISCV_ISA_BASE_RVA23U64, bases);
> +}
> +
> +/*
> + * Populate the host ISA bases bitmap (riscv_isa_bases) and each
> + * hart's per-cpu isa_bases.
> + */
> +static int __init riscv_init_isa_bases(void)
> +{
> +	int cpu;
> +
> +	for_each_possible_cpu(cpu)
> +		riscv_set_isa_bases(hart_isa[cpu].isa_bases, hart_isa[cpu].isa);
> +
> +	riscv_set_isa_bases(riscv_isa_bases, NULL);
> +	return 0;
> +}

Missing blank line here.

Thanks,
drew

> +/*
> + * Registered as subsys_initcall so it runs after
> + * core_initcall(tagged_addr_init) populates have_user_pmlen_*.
> + */
> +subsys_initcall(riscv_init_isa_bases);
> 
> -- 
> 2.43.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
