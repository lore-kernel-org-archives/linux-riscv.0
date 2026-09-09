Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD49C79FB7
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 18:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9KlLYx45q9tnM5bI/B+8+XYM58Fhf36COCL6TmYxM1Q=; b=ZC1sgyBF8eGQMZ
	xoDCvmqmtNxzoS/15guygIn6w9p9icPydOQnoOXUgCYjRV4YUvma8eGcMY/B0qvvGNU5Eo9kSmcso
	R/LKpB4jQnWNsElNwfMJ/vEfGmtDNsS32tU9gQpOCEXzJDusgPX/5V7sQFOJ6TfpnI3AjOzN6sG5J
	+9W4gD8X1maPNN1FPaXobnURN7Ufb7dX5YBlU6E0w3cqhpc1X++eRD0r6h96Dtq8iqNgHcSCVzSjl
	MZELUqho7xmShwC3StnoXcmrzm0G4eWhCuNLriTbfbVjeH0qGObahcOyCMKBodpFt/QDmuHEmDBeV
	SyzEeKc0Tf/Ty4I5MCTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4N9x-0000000Cchr-0nsD;
	Wed, 09 Sep 2026 18:36:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4N9u-0000000Cch0-0NkD
	for linux-riscv@lists.infradead.org;
	Wed, 09 Sep 2026 18:36:35 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689H7T6S3716347
	for <linux-riscv@lists.infradead.org>; Wed, 9 Sep 2026 18:36:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mIQgohTE2rOvQzNapNCth9eVCnLrSjsevoHbhxyKhm8=; b=f9fHyVhIBtdv6EUr
	DlNghKVHtEJRyrLKeXFDlVLXSO1UAA+Yn7hGbI1f0UYI1DNCkSV2lKeExYYLGD6g
	CSPcVJVcKhiTXh+Xxk/ETQTYTWiD579T5wEStNDRoul/rvzTnmVWP+boZ79lxeYB
	FXY6hC14K1DEc4aUkeAYYXllFrx0NuolQS0A1f6pVA4SDRMZaY7G+8AWxlJU+/m5
	q6QTEC2o3J+6eOxTUhYEmqbFUC7PKOZIsJUYrpGkhwey7ynH8YGPR2uJl30S6bXj
	1vlfmR5qjsJ07tSDg2GrWJP2dkDKKKIPmCtHs7DDLTuwk43KCYv1lOSTaNjljB4R
	hLNSRA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk7921wrb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 09 Sep 2026 18:36:33 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39512608fb1so12946654a91.1
        for <linux-riscv@lists.infradead.org>; Wed, 09 Sep 2026 11:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788978993; x=1789583793; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mIQgohTE2rOvQzNapNCth9eVCnLrSjsevoHbhxyKhm8=;
        b=RT64gjgs8fGKdbNLywcGPXNjleYktlN9/4agdOcUjCZ4zUlVZDPkGLYmpANnKui7Y0
         DX8FHf+G0TpRYLmC2tYNjbQaS6iKHGpvR4n33gKBnQ7vRE8KKIOzr+huvuZ1eOX2Rjhv
         B6doh3PIRLv1F7l46C4bCmK04274XW6SDNkpQDXgg+IpRNxIsIzfkS4/kZ58nNON0NVK
         5xsKajZOloIeNwu3/FCQIGCJnX1Ike6ze5+tq3FJCv4HMBUqI4HpTAGOIiw5SKyXUJuR
         z/UlAuSo3ZtuYIfMIU9EJvXXiWk208U+gXiVIsajnJPGJ4oNFxnyxIRJ9uelEKfHROQx
         lc4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788978993; x=1789583793;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mIQgohTE2rOvQzNapNCth9eVCnLrSjsevoHbhxyKhm8=;
        b=hYIGuOijufL3AmpaEzRit9Fmj0xmeVlZIbcxZT7OmwyS8tjJKomHnwnXZLJvV+PU+P
         F43LKX6UuMG+/UlhqHCB88dlIGsplWw39hKD4M3sAdDg1YMYqwAnu+qWEIILsJy1jwAn
         sdPQqBt+lARGcJUI0o4qhUHlaphJMlh8PezK7AL4YYspABfNYATjSMCoGI/nIBE7v3Sm
         hoF8gNcb5oAhv1No6ku7ks045+9lpA1fcGpEOuDMYw1HS9xZ50WWt1zSNswPx/3xuwuD
         gv1v+QkLfmGEgKEdGf7wf7oVg2to7TNvfgrkUIJxTGrj2wwZ7Mpq2kh1OEPptOw9QT59
         ammA==
X-Forwarded-Encrypted: i=1; AKwUvBwNGPd1btMXk/eNAmy2nnnTWVyeXpMdSHy2TolUzCOb4VGM7xEJzAfxEOy+rtnfDEBV28I3zd8q10lmGA==@lists.infradead.org
X-Gm-Message-State: AFuF++lhODT81ibyf9EnK2I4wGx73neJPkHaLFneox1clryQ7xgT6VW3
	VHiqI8baDdq8FEXr4Md1XZp9ViDl73ljrplJw+PMUNBsoZqEj3Sxkc3Xlli8vdfUH+q+k/OYn+u
	0tZV/yXWvDVRAHTSxw61gYVNvnr1qazErPLIG4ufVVTFWSGFYZwwbTbEnGjFl+DBEwegkrXk=
X-Gm-Gg: AYBFou0MIy2hN34S/wk3j6lgkIah8Igvo5RMtmGhYX5YBMfQ/I7cSbpl8KeX0gtxg1h
	g1oKQRlGs0zwVyl5hH+LR+pLI9o6PBVheKZOuxqwCM+04gHstrYdLEHL1/Unjv/8rJZyXP2JBVC
	0XHjCw0HpnJ/+5vPZDSQae+STWu52Dz9rAGaEmm6eFdOBq8nb4qWxjP9UVijerCnAypngeAy5PT
	WyjWr+1I6/00OBr4bqixvBIvugp2MJ9UBIZ32mdTgNUTaDNXyIgfQXoi8Bmuz9uXHT5FLmHZ89W
	zBM4FTfQD/rfR7M/CbiWo4+dMuhOM16aurJSOmweMWxNzuM5C39jP/IzUS/kFVpYqiQnVMqxxKT
	8aMIIeLyVDVo44ppQbuFaTPOl/6M=
X-Received: by 2002:a17:90b:1d4f:b0:398:9be5:b417 with SMTP id 98e67ed59e1d1-39b26221eb1mr53821143a91.18.1788978992923;
        Wed, 09 Sep 2026 11:36:32 -0700 (PDT)
X-Received: by 2002:a17:90b:1d4f:b0:398:9be5:b417 with SMTP id 98e67ed59e1d1-39b26221eb1mr53821108a91.18.1788978992503;
        Wed, 09 Sep 2026 11:36:32 -0700 (PDT)
Received: from localhost ([50.35.44.179])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1433171a97esm50371041c88.12.2026.09.09.11.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 11:36:31 -0700 (PDT)
Date: Wed, 9 Sep 2026 11:36:25 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Oleg Keri <okerixx@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Beata Michalska
 <beata.michalska@arm.com>,
        Sumit Gupta <sumitg@nvidia.com>,
        Prasanna Kumar
 T S M <ptsm@linux.microsoft.com>,
        Russell King <linux@armlinux.org.uk>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert
 Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Sudeep Holla
 <sudeep.holla@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich
 <dakr@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, driver-core@lists.linux.dev,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH v1 1/2] arm64: topology: fix arch_freq_get_on_cpu()
 overflow above 4.19 GHz
Message-ID: <20260909113625.000063be@oss.qualcomm.com>
In-Reply-To: <08ee55292c1cedf26067d1a2b02fa5657d9650e8.1788712186.git.okerixx@gmail.com>
References: <cover.1788712186.git.okerixx@gmail.com>
	<08ee55292c1cedf26067d1a2b02fa5657d9650e8.1788712186.git.okerixx@gmail.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=bd1bluPB c=1 sm=1 tr=0 ts=6aa1a731 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=aNnz9XPx1a4JIXSYt2cE/A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=vZYCpiARan6kKAuTxo4A:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDIwOCBTYWx0ZWRfXyMgWHcCoaJmR
 SrBvcobWTYRdbWSvHKVpC6mHg3FpHcl7XedOq5EUbzH5h4+BOtgBR1gdDGhd7qqkZPGkKppWmQ9
 aZgcYuKSO09lb9kq39m4arFpXaZEp5d0G8tXrWrEcJ05yHmUVdgcS74VOfTu2ihorf2DFvJ5z15
 xMpO1BhH+wmRD3jKxnTxNEIuWYt54NYHabcSdV6hqkO0/oVIktHLDgYwHxkISVSJviEsMm9tjZ5
 V7ovOW3sRKuVU4z5HNFK+xXT3yybBv8w5Kdptbi18qT5YqWyMaB7EIVBEUUilZZnBvYsmvp0aVm
 wo+/S2S2h0ZfyTYnrnRBj37DYfU6jWwPZ1ACNnTkurdYS8GS0pWOMirLxM8TxpJ7803T0fbJP/M
 0H+brbvdWv2lsDumyDzj0ooycCna2Ds3D+yOW29J0AdK+lGqdsLe4VRg676VHYB7QdfJlJMBqFC
 wrvyB41i3Z5n344sffA==
X-Proofpoint-ORIG-GUID: MH8kBZFCg0FwNjCReyPuJs9omq42Skcm
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDIwOCBTYWx0ZWRfXxDnCdwAu1T+w
 3tBLOPMEHRuae/fBOJ2yfhTlS49U09XS3f56TojWpbVvUnG4/mEjMfe/r+e4iL1JvyFXuOuhU2X
 mB+17zN/FY+AbBhC/BrEuDohdFmNsBk=
X-Proofpoint-GUID: MH8kBZFCg0FwNjCReyPuJs9omq42Skcm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011 spamscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090208
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_113634_147990_08F0FE7C 
X-CRM114-Status: GOOD (  24.04  )
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

On Sun,  6 Sep 2026 18:37:14 +0200
Oleg Keri <okerixx@gmail.com> wrote:

> arch_freq_get_on_cpu() computes the product of the frequency scale and
> the reference frequency as a u64, but assigns it to an unsigned int
> before shifting it back down:
> 
> 	freq = scale * arch_scale_freq_ref(cpu);
> 	freq >>= SCHED_CAPACITY_SHIFT;
> 
> The product is truncated to 32 bits before the shift, so the result
> wraps once arch_scale_freq_ref() exceeds 2^32 / SCHED_CAPACITY_SCALE,
> i.e. 4194304 kHz.
> 
> On a Snapdragon X2 Elite (Glymur) laptop, whose boost OPP is 4723200
> kHz, cpuinfo_avg_freq reports 524283 kHz instead of ~4723200 kHz while
> the CPU demonstrably runs at the boost frequency: a fixed workload
> completes in 1.72 s at the 4723200 kHz OPP versus 2.01 s at 4032000
> kHz, matching the 1.171 frequency ratio.
> 
> Keep the arithmetic in 64 bits until after the shift.
> 
> Fixes: 16d1e27475f6 ("arm64: Provide an AMU-based version of arch_freq_get_on_cpu")
> Signed-off-by: Oleg Keri <okerixx@gmail.com>
> ---
>  arch/arm64/kernel/topology.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> index d28438f8b83f..804758eeb63a 100644
> --- a/arch/arm64/kernel/topology.c
> +++ b/arch/arm64/kernel/topology.c
> @@ -245,8 +245,9 @@ int arch_freq_get_on_cpu(int cpu)
>  	 * (see amu_scale_freq_tick for details)
>  	 */
>  	scale = arch_scale_freq_capacity(cpu);
> -	freq = scale * arch_scale_freq_ref(cpu);
> -	freq >>= SCHED_CAPACITY_SHIFT;
> +	scale *= arch_scale_freq_ref(cpu);
> +	scale >>= SCHED_CAPACITY_SHIFT;

Maybe just do it all one line?

	freq = (scale * arch_scale_freq_ref(cpu)) >> SCHED_CAPACITY_SHIFT;

I was going to suggest that you roll in the arch_scale_freq_capacity() as well
but then we'd need a cast to ensure maths was done in 64 bits and that was uglier.

I think this should end up the same as what you have.

Thanks,

Jonathan


> +	freq = scale;
>  	return freq;
>  }
>  


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
