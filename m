Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C237DE8B387
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Feb 2026 00:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6MohkB83lGXXU1T8wCKZw+GPYq1MGVCuh2T72KUv24M=; b=oiF6cjI8f8Wp7n
	1Iz/hMr8vGkkGEn23owylDScPhQH+wd/CO7IlMevfyp8x4HiLimeAjzadC5YFFCJe7h+tNnMTww2B
	NLWIMmbdpspKuHm880aIzO69e4eAu4YzdBkCZKGGouj3zxbcRiTrOtj32kK4L7nmOvC/c5n6D2P2x
	Z9n858tgL8elHpPWZmZ0TRbtszi7t3o1IleiRIYtUo4GtMv14ssTECyWeOI+G5jCWHhjcSd6DctnA
	p7Kcz6cQqkt5u8eAbrwddi7hR4dYmjEaD7VNzzI4i29VQJpeVo9i17CPlCxXv3FrRxOcJaoq6zUby
	/wmyRLkeiCa86qo5XMDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnQuC-00000007deT-2824;
	Wed, 04 Feb 2026 00:38:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnQu8-00000007ddN-3uHy
	for linux-riscv@lists.infradead.org;
	Wed, 04 Feb 2026 00:38:03 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613ImO8U3824266
	for <linux-riscv@lists.infradead.org>; Wed, 4 Feb 2026 00:38:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tkT8dBk1JcFJK8y0KkFaCtb2
	feCXfoj1NqY5blcEHqA=; b=VmW5at8q2VUnrKiboFseYw8SdR8392HpZha05thu
	57y3yj/QVUkYSK+5z8+U6xhhwri/9+RQKC6PQqqIBNPuoVu7p/L9Y7EF/aYoZkIj
	bnzPmgV5/uK8Z5/jiv3E5vH7xFaC/fD7IRWh6nyZE0++nNwSqwug8bLG29JPavAm
	ceHDkwls1z49Ka55lqfD6kL44jBMHjY/snZ5avOX5SrK0S9WtXqx4RsmjGJEqwQe
	nJwIHfKazhc/tWF2vhqZqqBuncB6TJMRh1syDHByOO1oEnqyyHbkfA97tAjZs4L9
	M3P339QCTFRaKSHtDqGxUMNNA0BCU8KKz+JTkUDc4l3/VQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3g33jf14-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 04 Feb 2026 00:37:59 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-124743cf760so21044823c88.1
        for <linux-riscv@lists.infradead.org>; Tue, 03 Feb 2026 16:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770165479; x=1770770279; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tkT8dBk1JcFJK8y0KkFaCtb2feCXfoj1NqY5blcEHqA=;
        b=g15tSHshtXHzNkPQrBgh1lSMlonzp3PmylPIBmt7C1QPh1vP46CF4rmrNenYgT9rPu
         1UOr3LJAXEasCX/C6lyyQKYlYq4fTFCKMcs7k5Df2MEc/Xl+C4hNTdfKG15nqijW3NM9
         OYtSoX0z6lgYqIELdI7y+5G2SMHWU/bjAJbXF6hWqQoqf2LFnuZcvMEo2SYsacPGA9XK
         AiilElUv2reuczP6Or0u+n25ypJMgU9lihd2JMPl9lubxIu97E0DZcwVsnwflqJzhfsG
         kDZaytvbCyN7r/UJEHt+W1TjwCwu6SBsm8vvz8fZ0gghb5N0nnXJ43h/9+wc5AD27bj4
         Hh2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770165479; x=1770770279;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tkT8dBk1JcFJK8y0KkFaCtb2feCXfoj1NqY5blcEHqA=;
        b=KJosd0kswXV6iUOAfwBv9h4FOZqEQiv+P6SBG7E7JXXjV6V6GZgBAAxNjEPN5W4TtE
         E8aIPegji9hWnc+mhvyB5VTEpMZ6aaD4gfVpUzFeAljBP6+OrN4thxsxXbGIYnvpu+5a
         1IGm2K4gz1r+g4WXRujleYhXwfe0YEKtuLJsppyMyAfI1SJw0Z8E/lgGavt8JDHDDbIA
         6soIaKPs68xk5qTtP4x1lzfpPLCV6+OqH9hsAFgRf3N0OzuEy4LhE7rn4iwISyOR16C0
         pXW8GiM2KSVEVz4aUCzj3HcFMuz7pRjfYOfykqnyuD7KbpceHOZ0oVWHodT01OiGwpFL
         YSEw==
X-Forwarded-Encrypted: i=1; AJvYcCUZG/T4d8Vf61+N0t9167XQ+ZYDJaDPdggGvL3HJ74PdEOxCFhDxNRZ9/1+fMag+PoHKRjxcc73h8KXEg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwHWedNyttCh9rdnYkdELzB2sGIlijf/SBPF6recMp2GbrGfJl0
	WyEUoK6lJgM5joDBDM+jHs8HjZ9hKnQmWcUs+KGUYCIyloAkesZ3TThe/M6jUxUYAd+ste13qyO
	yLuSJpNLe8dC+Wq2nL9xb911K/hfJsqOeR6p5ROnu4IHogbJSmvAbFvTwPgHkCw6FNc0bg5o=
X-Gm-Gg: AZuq6aLNRn29PV4hTEJ0GmOmHq8aYAsSw3P98h6rauCBoWa58+miXI4H71VY2Xq1QhI
	FHfylUHJ4HqbYUFoAy3hNUqzCFbpIXhH+fdSkE/tS+9ecYKjyFmR7BV9Vfpd051sNGmTHBh1CgN
	qDMvikDP6+CQy/NVkmulmOJ9u1oVHzm0Tkc2jY7C4QTB7qs622+cy8plthYLu+0OsiHgZtmS6CH
	X1c9zFfHtil1ZTic8MtLQ1rnsdpxq5RR/o7GyAwmur2L+2joWruFFYfRqSf/rT3V16MulaD/zN4
	NyZO+J+gaA1KWN/gygnwnF8LPhLbXHRQmJaWpenw7tUhXgKpeEjYN3VN/jOi6Rs4kEmgRcF6Mnq
	6gjEME4JTyIu7So2opSo=
X-Received: by 2002:a05:7022:325:b0:11d:e25a:d9ca with SMTP id a92af1059eb24-126f47bd21cmr515400c88.26.1770165478832;
        Tue, 03 Feb 2026 16:37:58 -0800 (PST)
X-Received: by 2002:a05:7022:325:b0:11d:e25a:d9ca with SMTP id a92af1059eb24-126f47bd21cmr515381c88.26.1770165478293;
        Tue, 03 Feb 2026 16:37:58 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-126f4e05ce7sm737561c88.1.2026.02.03.16.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 16:37:57 -0800 (PST)
Date: Tue, 3 Feb 2026 18:37:56 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: "qingwei.hu" <qingwei.hu@bytedance.com>
Cc: atish.patra@linux.dev, anup@brainfault.org, will@kernel.org,
        mark.rutland@arm.com, pjw@kernel.org, palmer@dabbelt.com,
        aou@eecs.berkeley.edu, alex@ghiti.fr, linux-riscv@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] RISC-V: Skip stopping cycle counter
Message-ID: <n4wxcfjzykkinijm4ci7k6yg6k6bz5owqidldeu2qhiraec7jp@swa2thx5rvbg>
References: <20260202111728.4067036-1-qingwei.hu@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260202111728.4067036-1-qingwei.hu@bytedance.com>
X-Authority-Analysis: v=2.4 cv=afVsXBot c=1 sm=1 tr=0 ts=698294e7 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=SRrdq9N9AAAA:8 a=JfrnYn6hAAAA:8
 a=968KyxNXAAAA:8 a=-qhuNgR9Vo-gAdm-t_sA:9 a=CjuIK1q_8ugA:10
 a=vr4QvYf-bLy2KjpDp97w:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: h2e31TZbIN7bX8dK0OtNhUjNy4k88js2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDAwMSBTYWx0ZWRfX9spov2rUu536
 vg2tL7eFton1CniY++pTZgPRaRav/9+owbb7kcK2UQmlejo70TXPa6joGjo0MoBI5ycyp0V7j0a
 DLMKYt3LJuVz8vH/dkvNRFKu04rVe1if418gw3/PkEKE58eKsELKeWKBhJBlGjWE6XiXjiGxpgp
 7mJ2HUVorhOtClXyspjtwe/qAM2Teb01GH9kaxPlD1UMTLpKnVbXre3K9SLINA4pJldljueYJNJ
 zORGJRK81qKvn1EZEWTOUqSkTRx1MY/nBQNZ3DHwbX428j1FIJ6K99V9f5roh6n0Ztu0iyYtDjU
 ibSbq38RZfYjXE5FVVLqTTjge6oqYSGrJuy9QrX4YlcRwtrbqzFP7IILxgxu5gev8hj0X1G4Z1C
 wrPTJxl96MFmBqyhi9Tj3ahpWrENj7k/6Jy6av2lsgTIdR2aECZvmHsYWu72CzXkAtDe3I4clEJ
 b6i3G4MEznfameF3NrA==
X-Proofpoint-GUID: h2e31TZbIN7bX8dK0OtNhUjNy4k88js2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_07,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_163801_973449_FABA1F35 
X-CRM114-Status: GOOD (  25.93  )
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

On Mon, Feb 02, 2026 at 07:17:28PM +0800, qingwei.hu wrote:
> From: Qingwei Hu <qingwei.hu@bytedance.com>
> 
> In the riscv_pmu_sbi driver, pmu_sbi_stop_all() is intended to stop
> all available counters. However, counter 0 (the cycle counter) should
> be excluded from this operation because the counter may be used in
> user mode by rdcycle.

Hi Qingwei,

It looks like Chen Pei beat you to this[1], but that patch also avoids
stopping TIME and INSTRET.

[1] https://lore.kernel.org/all/20260131112440.2915-1-cp0613@linux.alibaba.com/

Thanks,
drew

> 
> Signed-off-by: Qingwei Hu <qingwei.hu@bytedance.com>
> ---
>  drivers/perf/riscv_pmu_sbi.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index 7dd282da67ce..2bc0050dabd2 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -900,11 +900,15 @@ static int pmu_sbi_get_ctrinfo(int nctr, unsigned long *mask)
>  static inline void pmu_sbi_stop_all(struct riscv_pmu *pmu)
>  {
>  	/*
> -	 * No need to check the error because we are disabling all the counters
> -	 * which may include counters that are not enabled yet.
> +	 * No need to check the error because we are disabling all available
> +	 * counters (except the cycle counter) which may include counters
> +	 * that are not enabled yet.
> +	 *
> +	 * Cycle counter is excluded because it might be accessed by user
> +	 * mode via rdcycle.
>  	 */
>  	sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_STOP,
> -		  0, pmu->cmask, SBI_PMU_STOP_FLAG_RESET, 0, 0, 0);
> +		  0, pmu->cmask & ~BIT(0), SBI_PMU_STOP_FLAG_RESET, 0, 0, 0);
>  }
>  
>  static inline void pmu_sbi_stop_hw_ctrs(struct riscv_pmu *pmu)
> -- 
> 2.39.5
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
