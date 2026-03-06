Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E2BFCC05E
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Mar 2026 18:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=obNd6fBMIaVwGE2i7DDnQK1rUbP37GKAwGm0XOfm2ck=; b=v+ZoyqWygwssvF
	YfYPfbkjsu3SoSXi+MwIAQg8THgCrXh3ewywqgURT/qyVJnp7UbUU8qvwMZVd48So+C6FUSDdLBzh
	UDjkgfiqyHToZ6gH/7ZztlEM1UsIwOdUgp8CMWSmPD6Pi4skXxrw1d83PcOIaoLpqJwDeeIXxVL3M
	3AFqapyeNaljsshV4kcp/tLfWLGjge067BCLU60e7UHEdSMus0TmJTLB5eVTaAjQmcp0Fb0xjfw6S
	tSt2R6JajpAK9ipcEtJjMbgD5BZSycuQ2BpUPYQtycM9wNX81JfgxXgaMHNW8z9rgd/0DGjP7ecj1
	nctNQDGO9veoFDDLTxAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyaE4-00000004LqO-42wO;
	Fri, 06 Mar 2026 18:48:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyaE2-00000004Lph-2R0f
	for linux-riscv@lists.infradead.org;
	Fri, 06 Mar 2026 18:48:39 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626H1cSR1343467
	for <linux-riscv@lists.infradead.org>; Fri, 6 Mar 2026 18:48:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NPwo3cTU9Dl1aKmohJUbynAG
	EZLvr2w5QZ5ywnXg5H8=; b=EsEeCLFnL4zpuVKiUXVvxfIrQ40D3u8z42hPho2y
	D2oByRXhvHX+Exhu3vr/S8dmZ+LJwXQQzKkzUCxdqWIUi34BeYeT7MGq5Lwip1lH
	AqdGtG14Oy+ynPoEQTy5sWuDMGnmfEswlASnHDoZCyb8b4EmLUx8kd+UonCIJqCZ
	zEM3a5iwajrIUmpSHFjG/1ijGy2E09nMW290bR3ZFZf3JykFhiXE8wVJIyEk4HlL
	GE2jluuah0h41qcTgyjc19IwXQF1KbRKlP+q9nEaFBhycEgQumCj7AsMVKYAULk1
	RgIhia9Edt1t69Z36bg1rzC0FYP6lCL9DkAgFsW8pIDnAg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cr2uqre68-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 06 Mar 2026 18:48:37 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2bdf6fe90a9so8456331eec.1
        for <linux-riscv@lists.infradead.org>; Fri, 06 Mar 2026 10:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772822917; x=1773427717; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NPwo3cTU9Dl1aKmohJUbynAGEZLvr2w5QZ5ywnXg5H8=;
        b=btg4eZXmnhwWYNlWnIYNX4bOBfJ4XDgjczAxk2XM+rELf74Xn2B1qQ3GN6vLPwcHJ1
         hHIOya8Fno19c8D0s23FHtVBQLDPYAFoPEuS5D6CvFUpYMIuuE9WJ+1+ZzYzlIwsW9zb
         78vtJgEVlyyN+/V6UzXfAV1cZzCfH9YHW6saUsLGzTCGNq4ZuvVeySRd5aYXZ8Z1v9b4
         xR8gR67PFSnR93Yo+P3vONnT587uIEMNcRU4+Q4y7OyVuCwALKG1dqswbNLUHOYcweF9
         mB2OaJVxdHD7i1jfWqLC3kN8/cEZkw0tzFHIuFxg9uGgk3X8wBjl8sqbrqdCISLxw70o
         2bng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772822917; x=1773427717;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NPwo3cTU9Dl1aKmohJUbynAGEZLvr2w5QZ5ywnXg5H8=;
        b=NNnBzOAfUJCDqUlJ5hzJpjTPdjGl4PYJs4sQ0TYTLn5PGvgyZ67tGR8eHFuDADvu+K
         mFeFbCUHXpWpQOHzz6H8jrZGENui3M3BhsvZu+mE3TE+Eti2j2ia5emMJpA+jdPmJLhH
         33M0qVv43EUNSCikuj2kxTFuRBez/TBCAeX9+/j8LmWSgdTGMwzGD3/y0vEFlujYzq1J
         THHouCVWDRLqimLkexCoLPmOcDrUCy9st9GAGNSleMO06YaISyVqgf0+5K58y/hyQA4V
         6LTCRl1akl/jateTTOA3YW2aKO+JG38ggNUR1rxLh+n1bs+tz2QGql7DDn1NPmJC9Dzd
         Io4A==
X-Forwarded-Encrypted: i=1; AJvYcCVDfjkexMMvTimq3/tQOGYVXCaE61tG6YI4Pcj8NZPlLKaaT0k9bhsD+iZcqVPLOcClesWoYWkTzWlMrQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx98FfRWJo2S9c8W2lgH1eFOZCwzp1TmsGWkugjWOKcU6seOzUo
	YQms394oEzXOXVwpMDjbG3doPOidW9u+oxCwrl5NGbhfUcAGMHPQMwzfVji4mWLf2zIJsgyE6HR
	9JKBuC6HIxbjvMoJV0kffTMpk1mwveu93dmtbK00bhcLPsZsZ2yQXW9iH2ATF4w3Bx/zFyVA=
X-Gm-Gg: ATEYQzwHEEJOZYRuK6mguoNcGvRytjBDP5/rsodA6bfDstpAvB4mmFzyDOPdwkNX6Yl
	d4Zm3k9e7+hiVVqpaJO5uDkq/rsSO0y7kTH86RVc3O+RJyLWcKouBK2Vh5L1gaHMrV1EFB3f4mQ
	gZMQDvfiJhNjYDwnIGX1ItFtTs0wP+awbAo9Jp6VqXHJUjIky+LQKbyzwSqrgYEUithYvSLy4cv
	g6XlDJsB0Ev8pxP/PPwZFYijfpg67qAmaU4GOan64ItWvmVNOY2YmMJxowdJfga2BtqeBG5Z0dr
	Lo3LESoMBootz7U9M53zI1qUPYUeBehSK+b426wjv/AirxchZiEMQc3kq2SNeY86pHNTNGiuOQY
	MqvfuNWg14L4xk7xGia66p1JV8JhRPDk=
X-Received: by 2002:a05:7300:a883:b0:2b0:5b6b:6529 with SMTP id 5a478bee46e88-2be4e064a5fmr1152043eec.39.1772822917081;
        Fri, 06 Mar 2026 10:48:37 -0800 (PST)
X-Received: by 2002:a05:7300:a883:b0:2b0:5b6b:6529 with SMTP id 5a478bee46e88-2be4e064a5fmr1152030eec.39.1772822916383;
        Fri, 06 Mar 2026 10:48:36 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f984ceasm1998273eec.32.2026.03.06.10.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 10:48:35 -0800 (PST)
Date: Fri, 6 Mar 2026 12:48:34 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        Andrew Jones <ajones@ventanamicro.com>,
        Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Atish Patra <atish.patra@linux.dev>, Anup Patel <anup@brainfault.org>,
        Jiakai Xu <jiakaiPeanut@gmail.com>
Subject: Re: [PATCH 1/2] RISC-V: KVM: Fix array out-of-bounds in
 pmu_ctr_read()
Message-ID: <7cv4cq43l33fvpbikecjecfulomzurfmlbjk45u6amvdmnmrhu@7padusm25g5l>
References: <20260306073739.3441292-1-xujiakai2025@iscas.ac.cn>
 <20260306073739.3441292-2-xujiakai2025@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260306073739.3441292-2-xujiakai2025@iscas.ac.cn>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE3NyBTYWx0ZWRfXx33XX+FupQM6
 fy0OL6MqXuBUXXDFi5tO2kXw7gFHd+lQArYAbgu3r0MX1e540bkzAcV5PU0hqZuly1Ux/ZqNHgF
 x7/Vgt6niwnZz1ngE9v8x4cw3CtUMzDdDkf9DFyisnW2dDyrzpy2yqrHgBfF+PLh4IDNrB+Bb/O
 qHY/aPZANjK6cusilVT5oQfhfg0jxQV5Gev1Y3guDCrutw5nV/7ip/NvoxxILDZxShY+PkYwJkt
 eqWZCBzGDMu6SwY+znKlcpDHj5BBQq75ycboUwB3294rgC4HBxkZOsKjPY2IPHzmKI64ec+1X+T
 3LgT81LrGGdzpIpoXzFEgt370WJMDwL6rg/ebbcERijibvofxyIaQ1evH5/SrMh14fhx/fSGpHS
 pQSg32aDpiW+po7x17OKmvGA7iyPierqMsyJafDZPSyhNTmiL582Oe2sBxziYzmLY8+5WHyYet6
 t1cy73sa052/kEGdUnQ==
X-Proofpoint-GUID: 91ql-9As0eab7g3sYo82dot1Fl82CFaX
X-Proofpoint-ORIG-GUID: 91ql-9As0eab7g3sYo82dot1Fl82CFaX
X-Authority-Analysis: v=2.4 cv=Q+HfIo2a c=1 sm=1 tr=0 ts=69ab2186 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=JfrnYn6hAAAA:8 a=pGLkceISAAAA:8 a=ABfPBq6YoVPYWZtmEusA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603060177
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_104838_769348_68A18815 
X-CRM114-Status: GOOD (  26.57  )
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

On Fri, Mar 06, 2026 at 07:37:38AM +0000, Jiakai Xu wrote:
> When a guest invokes SBI_EXT_PMU_COUNTER_FW_READ on a firmware counter
> that has not been configured via SBI_EXT_PMU_COUNTER_CFG_MATCH, the
> pmc->event_idx remains SBI_PMU_EVENT_IDX_INVALID (0xFFFFFFFF).
> get_event_code() extracts the lower 16 bits, yielding 0xFFFF (65535),
> which is then used to index into kvpmu->fw_event[]. Since fw_event is
> only RISCV_KVM_MAX_FW_CTRS (32) entries, this triggers an
> array-index-out-of-bounds:
> 
>   UBSAN: array-index-out-of-bounds in arch/riscv/kvm/vcpu_pmu.c:255:37
>   index 65535 is out of range for type 'kvm_fw_event [32]'
> 
> Add a bounds check on fevent_code before accessing the fw_event array,
> returning -EINVAL for invalid event codes.
> 
> Fixes: badc386869e2c ("RISC-V: KVM: Support firmware events")
> Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
> Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
> ---
>  arch/riscv/kvm/vcpu_pmu.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
> index e873430e596b..c6d42459c2a1 100644
> --- a/arch/riscv/kvm/vcpu_pmu.c
> +++ b/arch/riscv/kvm/vcpu_pmu.c
> @@ -252,6 +252,10 @@ static int pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
>  
>  	if (pmc->cinfo.type == SBI_PMU_CTR_TYPE_FW) {
>  		fevent_code = get_event_code(pmc->event_idx);
> +		if (fevent_code >= SBI_PMU_FW_MAX) {
> +			pr_warn("Invalid firmware event code [%d] for counter [%ld]\n", fevent_code, cidx);

We shouldn't add warnings for these types of things since a guest could
fill the host's log buffer. At most it could be a warn-once, but I think
we should just return the error as quickly as possible. It looks like
there are other pr_warns in the pmu emulation code that should probably
be audited to see if they should be removed or changed to warn-once as
well.

Thanks,
drew

> +			return -EINVAL;
> +		}
>  		pmc->counter_val = kvpmu->fw_event[fevent_code].value;
>  	} else if (pmc->perf_event) {
>  		pmc->counter_val += perf_event_read_value(pmc->perf_event, &enabled, &running);
> -- 
> 2.34.1
> 
> 
> -- 
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
