Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1753CD5BB1
	for <linux-riscv@archiver.kernel.org>; Mon, 25 May 2026 14:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=drzabV+eXA9CpNnHCFtbEvyzYczNw0oxTL0fbwosGlg=; b=angLruDklfMhkp
	wLGybJMp8k7i6ZRCumBLsMLaNFS8eWNs/CSNo24ZHExUqE8cdUm0ukUuSXoN8j2fPS4glPq8mNEUL
	TopXzaLZtuuL9l4vwkgV1KbcWIwVdshHiUs0w71oB+T7SYbdBT+26M/s6a2vOe9BLlwQKjCGQ7bsZ
	73hWdUqI7i8VDiTDXDvunC/hAJTyHOIVfvep/FgiZBYSllVNDMRJasHgR6zXbzK4rtDjVUfxkU5X2
	crkcl6+UcdiCgvF1V1XDARTs0mEwyiBrkXkCmRjnG/ogl9cGCBBTXp4lYEN7OWvpEasikZmD0O5CB
	6r3ruP6CjF2/fpM9Y6cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRWEr-0000000HPWc-4AFM;
	Mon, 25 May 2026 14:25:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRWEo-0000000HPVe-3pMR
	for linux-riscv@lists.infradead.org;
	Mon, 25 May 2026 14:25:04 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64PE97sV3795813
	for <linux-riscv@lists.infradead.org>; Mon, 25 May 2026 14:25:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CimRH9tWSXyiYROIt/pqx3jW
	xGGINVTH7plufiWPUGI=; b=SpvBpIykoluXKkwoVd19Xfm29xS1/IiNWs0Sf0rp
	o7yqitoLvyqnRWiaPyPCGw5mlhPPcpsl3Dzw4NRu4Yw8MK6umJ06AzvdXZ55zMyW
	G0K1WAONJQgkeRHD3TN9AS9CcUucZBN4EkCB6tBWmaiRMZUNTd90cooob3AEZgjN
	0Dk4fy+6U3bCsyc49yOnL8xoil2j6SufoPySKKjbjhThHuANQVEErvb+J5LQXWoe
	NNed/9gC4bdAFN3ls2KtvOAsDWfFXeVAyPlxIK9gT8qQQLhG+/co25lpeSbeLsg3
	9griLae0lbmatS6y0kU2m9fjr2Dkc2i1fE7vlbz0H/xOIw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecqx881mb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 25 May 2026 14:25:01 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2ee5b73c5f2so1916634eec.0
        for <linux-riscv@lists.infradead.org>; Mon, 25 May 2026 07:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779719100; x=1780323900; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CimRH9tWSXyiYROIt/pqx3jWxGGINVTH7plufiWPUGI=;
        b=JUtdLdsdJrlmMnY4VdcgxR70IRkOFWGc0EAANH/H1hqF7C30uieeCB/nrDbXFRYJ0+
         7ZoWdh67WxWkHJ6YHC/OT+tcQt+67TBud2JgAqbWdAiC6DWruwHesd8k2BXYNXf8oGIR
         t+9Ev+0N/2c1epesp06UY83NrlRZhW7/dD+44MwNNZ9zCv6/pjwXSCX5Ej6z+0t2qqRc
         sme0h/G6Xec7i7QwATmflh6qcUUILzoAHyR5vw+PX0w6oY7T7I7naeZqPZUjFrQAOZ/1
         hrCJ9RGa9YtBijtQjQ8r68GNGIKs8kUNsjKiK8J+Yuh0r+U6Dp+tq8wie7KMC7V2QAvZ
         jWow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779719100; x=1780323900;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CimRH9tWSXyiYROIt/pqx3jWxGGINVTH7plufiWPUGI=;
        b=rM5EW3zcGIuJ7DboYzytYWn0irln9HAIA4v8iuD9A9WiTw9YxJlxV2qlpcJhDwi8Wj
         y3p0o4vzHYmNVwPExsT0Q6NAv2j3Y55lP+YpxYLZt/qBO6j/uyzkqNjIXhorxU20BswW
         NwBGx37SEzAWzDtcNwkfw2w8RIld3FTXDsO3DDIJ189oIW2byDTr4Nwtwpnp9Fgtt5iE
         N+PGHEAXXbvcDy8xysVSMWYpu8MaLCQmyD5R1jVah77hK3eqdkwYVwTYe12Bv4sOLqRg
         ThY4qmU5gWEyUAJuW0abk3y+ICG9YfqF2pWQIuJsUxAt+KGejTMKU6JgbaPOi7KwHjAy
         T6YA==
X-Forwarded-Encrypted: i=1; AFNElJ/o3upBFQ9UpduA9TadhZxDbawa1MRYUesLYr1kmhtkpffKPenqHTA+XkKsW8qYCXo+JcezAwS2JT+yCA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzdGXp46b0YPLrwuLoM2fAWqdHO1jGaLrNKRAL0vc6Zdygb5ldA
	s5hnrcerT8mP1UD2nkModw3uKP6UzsGgVIDeqcppagIvYCMkGD3rN2XY2+eaTPu9Z7npnpW8g96
	MhthLloqWI2LPW3JDGaM4tHqgJ3iBB6ptIu+KNESbHou7sWvCoaRMex2C5aWEuK+FNhOdmME=
X-Gm-Gg: Acq92OF2mhnSbsbVUl8TtPkBPFNKjZriw/NqCCSiIvPzBn3PI726gvnDy7nRV7B9oM+
	AYC7bCZ8fRucMT6h39ullV2zFT9PeRfhWJshbvGXjGTgOdBnyqa6PGnzkgBvvjMY+yL/tHCk1IY
	yvX6sDQ1sJ7EQvcQ4+cyLjz+2LpUHpWagw/GG9VLFrSfWr6hq/Ak1vuVwnfhoRvdDfgf6p0RsuN
	5ZMAW9xaKcluY1kXX2R0tKnQjalnYi7RS+p1PdGQ1dMH5NWwuC2BUiOH5QgyxJqa2iHrxPCTNu/
	ymd705lX5TvFYJ72pCSAPRsauunkRBxNz23oxvG1O0oQeJxUOnUU8uw2ynm/Yvqt+32nVsaMLNV
	dqYgURC19NR8gxS4WLsm/zIsFRXqqVbY=
X-Received: by 2002:a05:7300:640c:b0:2c5:b23e:48a6 with SMTP id 5a478bee46e88-30449128923mr6707556eec.23.1779719100261;
        Mon, 25 May 2026 07:25:00 -0700 (PDT)
X-Received: by 2002:a05:7300:640c:b0:2c5:b23e:48a6 with SMTP id 5a478bee46e88-30449128923mr6707536eec.23.1779719099671;
        Mon, 25 May 2026 07:24:59 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30452230b25sm10085541eec.15.2026.05.25.07.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 07:24:58 -0700 (PDT)
Date: Mon, 25 May 2026 09:24:57 -0500
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Jiakai Xu <jiakaiPeanut@gmail.com>
Subject: Re: [PATCH v2] RISC-V: KVM: Document a TOCTOU race in SBI system
 suspend handler
Message-ID: <las73pw6yo3judqw2355p3vjecbneglvam7tqwluak7uag5mew@ck5foo5g6a2u>
References: <20260525013642.999187-1-xujiakai2025@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260525013642.999187-1-xujiakai2025@iscas.ac.cn>
X-Authority-Analysis: v=2.4 cv=HITz0Itv c=1 sm=1 tr=0 ts=6a145bbd cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=EP6mWf-phXB2IQ1a4JYA:9
 a=CjuIK1q_8ugA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: IXT9LqfzU5sV5zfirMu0aoCFOid1Pr-L
X-Proofpoint-ORIG-GUID: IXT9LqfzU5sV5zfirMu0aoCFOid1Pr-L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDE0NyBTYWx0ZWRfX03i1eifWkfRZ
 v0vXwA9UQ1kR8R1nqFDRLTZ/A6kBcBcGkjygDpYGidxQMMkkLgqNsYGIa5/3Uo2nAG5vyJ9Wshx
 KJ9Qx56ggqjXDQXK0DQ6N1wB1s4tIAZvAFE5JMwh/a0sRbFWG/G+7+Nyt8hwKR0UHRASJ/Lj1Ku
 Rq4yki8y917OQYRzls6/lNxSryg4oMaKGLicUb3iKLfr0CfFoRlNgBxU1jCVhw6RjYNgQFpjF9n
 FbcQBDlxbj8ats/XNuK2IZen45gMc7Fg1C6QEjSL2uPR8svBDWH8arMRrClEWyNetRECBlQlGHt
 BybWCA9Xdtq5XqznFHMwdnucl14Rl/dA64x8qHaJilaVJ7Ccd9i56xAQYxAoxQ7L6Y9fbh+ndR1
 cZrNIGMycXmhZ0PMDa9kB5IryKSbYCCNQ+j2Ryj0JS0VIG3yY7zbueAOFaStROsqwAfv2MDVs1h
 OAQnd0FNPiQZe6r2j/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_072503_089009_9A9B36A8 
X-CRM114-Status: GOOD (  24.51  )
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

On Mon, May 25, 2026 at 01:36:42AM +0000, Jiakai Xu wrote:
> The SUSP handler checks that all other vCPUs are stopped before
> entering system suspend, but a concurrent HSM HART_START can start
> a vCPU after it has already passed the check.
> 
> This is a known TOCTOU race. We do not fix it because:
> 1. Triggering it requires a pathological guest.
> 2. Only guest state is at risk, not host integrity.
> 3. Userspace can double-check vCPU states before suspend.
> 
> Add a comment documenting the race and the rationale for not fixing it.
> 
> Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
> Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
> Assisted-by: YuanSheng:DeepSeek-V3.2
> ---
> V1 -> V2:
> - Replaced the fix with a comment.
> Link: https://lore.kernel.org/linux-riscv/20260521142030.1560861-1-xujiakai2025@iscas.ac.cn/t/#u
> ---
>  arch/riscv/kvm/vcpu_sbi_system.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/riscv/kvm/vcpu_sbi_system.c b/arch/riscv/kvm/vcpu_sbi_system.c
> index c6f7e609ac794..6f64a59e5d3c4 100644
> --- a/arch/riscv/kvm/vcpu_sbi_system.c
> +++ b/arch/riscv/kvm/vcpu_sbi_system.c
> @@ -35,6 +35,20 @@ static int kvm_sbi_ext_susp_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
>  			return 0;
>  		}
>  
> +		/*
> +		 * Check that all other vCPUs are stopped before entering
> +		 * system suspend.
> +		 *
> +		 * There is a known TOCTOU race here: a concurrent HSM
> +		 * HART_START on another vCPU can start a vCPU after it
> +		 * has already passed this check, violating the invariant.
> +		 *
> +		 * We do not fix this because:
> +		 * 1. Triggering the race requires a pathological guest.
> +		 * 2. Only guest state is at risk, not host integrity.
> +		 * 3. Userspace can double-check vCPU states before
> +		 *    proceeding with suspend.
> +		 */
>  		kvm_for_each_vcpu(i, tmp, vcpu->kvm) {
>  			if (tmp == vcpu)
>  				continue;
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
