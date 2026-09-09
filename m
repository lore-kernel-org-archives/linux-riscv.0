Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DBCCC79FB6
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 22:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=utiP+r9eLhzujdm2aOyOhgfLGek9OMrUrewtzHinde8=; b=QPRRGwF1sozfsB
	Nh0tpwzWkH/RnYbwJmQ/+DEhywrg8vx+67qEwQse3KKUgC7+G9p2Mu05nE9PvY8ehvIBHeYS0VGCM
	zFYDbYPft9ZhLE+z6A5IpXSzlxYS2lnuS+myiOF9y1WF8HfsJlx/WY+fR6ZU2qzAkndVt/hHPDY/p
	Qd8Uurw6PW7DXeYctqFwgB9jZsTTuzw9eclesqcBmXhtj97j5O8vqS3eVWhAhXoVNida4VNZiham1
	VeBWUJs11kdjJFnw2gQtbVZ3olnUpjxwaqEeWXUkIPKaZ1+4w6dFqGn2CFqsyLFM53ZM5gk+PAU44
	2IodqOnmKankSMb8bXTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4QeW-0000000CzuM-3b8t;
	Wed, 09 Sep 2026 22:20:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4QeU-0000000CztU-3lXK
	for linux-riscv@lists.infradead.org;
	Wed, 09 Sep 2026 22:20:24 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689M9lbN3789022
	for <linux-riscv@lists.infradead.org>; Wed, 9 Sep 2026 22:20:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BeK/1z0Ffq++309QbXgeNFfaNMYbnkujkRsfU6JzN9s=; b=nz85hBmbk8CF/1HF
	vTbyg+KZf8S/LNo2l7OjmmbgE6jb/RLqXJZdXx/7KYe21yZXFTVCre8/zf9vuEjT
	Gwnk4rQ356tz9ul05I9yxskqShI8GX4s2iQeZXOABk6ey4K1iSCCJ9V5i0lPpxv4
	V9tPOriHxMK7eLuOgElzHggEBXrpL4HyySQPlJPFhhW+gi5N6+1W2ULGEKGB3eTC
	vW+C5kul7NAkiIj6B4eKLhIkaSolGj23ti7/B2aRh095fvIMj+wOG/YdUMb3kUwY
	KcoH9tg26lUD3KFlRiFzbuVd3gufBeg0AK9RL9ToYc3SG69/O/VhL4agBbyLx0mr
	cXB2lg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyggtm2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 09 Sep 2026 22:20:21 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398fe469aa0so10496155a91.2
        for <linux-riscv@lists.infradead.org>; Wed, 09 Sep 2026 15:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788992419; x=1789597219; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=BeK/1z0Ffq++309QbXgeNFfaNMYbnkujkRsfU6JzN9s=;
        b=IgwWt+3TvAIpon2CB8prFqa2kmNXP1OZXFOTHf9c+L2Szmgt0zbrFUy61kbghUWGKl
         D14GCfes8Ajfx5dBv3lwPs5roA/IaIR5oNetwp3BcVo4GlJTCE51gajJt0MQ+Y9wRtAR
         l/nxHjrj3KbZqqKst4PZylI8KTv73CTJp4NtXQEwGF0tBq/2Be7tmgPzkCr5zQT1/fz2
         yksC+Z2j2zO3jmzFaVbI4AELxWtBHnNHNOpI/skPG8VPMB3La8hqSS9ECw5smYAhbwah
         LnAylLOTG+ohbUyPlQObN3SozOLl1HyVwbtBkUl2bpJBZPnvx4kK6tY44ZDy6/EKCHAv
         stXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788992419; x=1789597219;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BeK/1z0Ffq++309QbXgeNFfaNMYbnkujkRsfU6JzN9s=;
        b=XpaO6JTSJwU1WS16H+Kl/MxJWj4vkq4IR5agTyT+C3MuL1jcmW1tNBY6n26E93htM2
         MNp/Y9jZyMwy8w/n4Mms7MSKzfoD4a2D3lgGUTs/SQTS4QzhXTn1bIfC54/ZY1I9o50T
         2nWhDLwIc0d7xCp8jcEGmGRSmBHBesbux6SQ0e9DkwLZI1z5qF5NqNnUWCN0oI925duB
         BtLY7d9PMbngBwUCctcpFQ43TdID8xlMoNNI2WaFRFaSdR+44RbDWEUnCs4avfKniPkI
         1S7pHU3SXucdFJJ0icaWyUgDY11nj0fqFleFxyn6vP1+lY41llBE9uYJxsXaeb8QoeCd
         uf6Q==
X-Forwarded-Encrypted: i=1; AKwUvBzaZTrzOA3RxMBVH52t79nFYQl0HA+/7YmgkSsf7LgSw038SnLPXQfOQQWP+vxDbyv3xdfcW9Ms22+VAg==@lists.infradead.org
X-Gm-Message-State: AFuF++myIRw1CHVrGtSHxt4dJuI9HCpFlQkfErf42wAZh1xjX5NQDNig
	kTRToQP7Mi19U/zCILzjiBL/b4zesqUhD4tPzX6R5NjbGiaQKRnTf6MmzSmW+R9cHoe9eIdvQPN
	13zHM12Ojztz0sU+09F/orkU/wvjlvlD8QCLRMN8ZP/3xOSH8TQNwXRWY0mdaKpt7Litr+o4=
X-Gm-Gg: AYBFou1DqVsCPOKHW/6EMv5ckGD3N1tsCXdUI11E+eBZUircANyBl9On1ysWLAgBFaU
	cfavsfx0IaA6PQhCZoK4xshqluGouzdV6OwXUlDBceQlFezgJgJyCHHutWouuJOG++ekHQrxQRW
	ziHDYCSaJugbyne45wFe+UzNZ/KTGYhLcBwXgcgpq3seDh8BZ9G0sMf2d60knfzoEe3j+y7I5d2
	NwIkF0dFCmi4aok46K8bhi3JDqQC7a8MIYFCSzLwaTFl+ibBr6xE3nWunowzVdP1SizcidAAskp
	GLlyHuGBeV4FD11/W1hh16o69Cy8oiysdtrHT/sE4hLhgERhNmBSpavAMcPCu5WrGCeFHV3YDCh
	4QA2ASqFQlOXQRg4ct7UfOR9Hndk=
X-Received: by 2002:a17:90b:4d86:b0:38e:6aa7:68ad with SMTP id 98e67ed59e1d1-39d70980956mr4531192a91.5.1788992419287;
        Wed, 09 Sep 2026 15:20:19 -0700 (PDT)
X-Received: by 2002:a17:90b:4d86:b0:38e:6aa7:68ad with SMTP id 98e67ed59e1d1-39d70980956mr4531105a91.5.1788992418800;
        Wed, 09 Sep 2026 15:20:18 -0700 (PDT)
Received: from localhost ([50.35.44.179])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b9f68e4sm51299924eec.24.2026.09.09.15.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 15:20:18 -0700 (PDT)
Date: Wed, 9 Sep 2026 15:20:14 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Oleg Keri <okerixx@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Sumit Gupta
 <sumitg@nvidia.com>,
        Beata Michalska <beata.michalska@arm.com>,
        Prasanna
 Kumar T S M <ptsm@linux.microsoft.com>,
        Russell King
 <linux@armlinux.org.uk>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt
 <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
 <alex@ghiti.fr>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, driver-core@lists.linux.dev,
        linux-pm@vger.kernel.org, Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/2] arm64: topology: fix arch_freq_get_on_cpu()
 overflow above 4.19 GHz
Message-ID: <20260909152014.000055d8@oss.qualcomm.com>
In-Reply-To: <20260909192351.33910-2-okerixx@gmail.com>
References: <20260909192351.33910-1-okerixx@gmail.com>
	<20260909192351.33910-2-okerixx@gmail.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDI1MSBTYWx0ZWRfX3XhxnTWrPr4u
 WXgJZ8VoZCJ9oZkmczWKOwC+bpKb2MdbLBpBhpUbbYGfunhjPAl/biEgQTcHDUWeLm6IfFnmUju
 6P1P4jEWgOU2jEiEQ0cqsoAPvI/D8GY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDI1MSBTYWx0ZWRfX1luXGh19Agzf
 9U/yGEylQ0r0Gd5HGVkoEl438vEdo6OIEq5CXrGtMDXXP5Ik2nFb8cyHUi1iTvSXujVHb+YtjhF
 Bm26/0BI5UBrvLs1LLx3b2Fl/OFn83LYIACaNrJqcHMvcHQf4biGOW9g4v33jzMTUUuWs2FIy1D
 T8FPlVUZ0vPNIF063wlw7+NwkAyllbCFGYPWtSBSrN5kpGtgwWQChVazlCxUbIYOXpH4XvocSrj
 ET+luAtAuDT8whBdKxFw6tmPW1ppXJLxCz/sPcQe1jobPmO+dHyvQTPgju0B6h0UDU3Hqk0QL0C
 dWKJuN9SzlYp5sT/cueuQbrHQndqEonbj0yJd6fMFB+GCislgFzF9IfhIcw/s/R7Ji7mf+2EM8x
 vp8uWclBQjsULHIWfqSEMV00aZ5+DW6mVI/25s/rcihEntcYKXkixzZfXu0V6eFKMe9YQ3Z6dgf
 ldOYaB7jdu6en94l0rw==
X-Proofpoint-ORIG-GUID: 8QkSIcRddNo6hx6mHLHXJz-Ec5pTy55C
X-Proofpoint-GUID: 8QkSIcRddNo6hx6mHLHXJz-Ec5pTy55C
X-Authority-Analysis: v=2.4 cv=Z/F5j3RA c=1 sm=1 tr=0 ts=6aa1dba5 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=aNnz9XPx1a4JIXSYt2cE/A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=GPoSAeC3DJVMy4bTL1oA:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-09_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609090251
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_152023_048122_CB654A84 
X-CRM114-Status: GOOD (  23.01  )
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

On Wed,  9 Sep 2026 21:23:50 +0200
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
> Suggested-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
You don't add that for a review comment unless it results in a whole new patch.

+CC Sibi who is a whole lot more familiar with Glymur than I am!

Jonathan

> Signed-off-by: Oleg Keri <okerixx@gmail.com>
> ---
>  arch/arm64/kernel/topology.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> index d28438f8b83f..0eca321ff113 100644
> --- a/arch/arm64/kernel/topology.c
> +++ b/arch/arm64/kernel/topology.c
> @@ -245,8 +245,7 @@ int arch_freq_get_on_cpu(int cpu)
>  	 * (see amu_scale_freq_tick for details)
>  	 */
>  	scale = arch_scale_freq_capacity(cpu);
> -	freq = scale * arch_scale_freq_ref(cpu);
> -	freq >>= SCHED_CAPACITY_SHIFT;
> +	freq = (scale * arch_scale_freq_ref(cpu)) >> SCHED_CAPACITY_SHIFT;
>  	return freq;
>  }
>  


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
