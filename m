Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4954FCC05C
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Mar 2026 18:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tUXyrsQcE0qsAwT09FKZgQ0eYWcsiTp/RFoxN7C1LRo=; b=CsaTKkoSCA3Mfh
	v6E6DcleWsJcngDuxiDLXPFWoF27f4z7dm5vDTFB41Io3S7eTgWkA+eJKmPxJHZAIxK4iE5E3642h
	Y2VsYguIW/aPD+iA/Fxub8DOwHZiTnSySNq0UcljcZ1He6QiYFFJNbgQiYrhzg4Ffx2e3kzNNmJPb
	KOa7shXDo/iD7TYAb4YnmNfRJBK41M4sjnHoExOU/v1syl8U7wXxINxDi6T4hQk7n6nk2J+pbyZ+Z
	UG5KPxRGID5AAy0uV0hsZT5Z7rHP+2UOvTRINnPszSP3q+eAH6CPpImVqHQAU9XCoCoqHjyTJJxAq
	NtdoJQJ68/RC8fP1TCJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyaIW-00000004MF1-3xhI;
	Fri, 06 Mar 2026 18:53:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyaIU-00000004ME4-1VcV
	for linux-riscv@lists.infradead.org;
	Fri, 06 Mar 2026 18:53:15 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626H1ZBS232614
	for <linux-riscv@lists.infradead.org>; Fri, 6 Mar 2026 18:53:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vbp1ttRZMGjxaHz3QpJiubYE
	eCxSAMpCj2BS/Tc8NRU=; b=Z1ANarkkgcNTCYsGCtI6BQ07sr77CJ5gvLjPNzHy
	Ck+e7fNdPA8bbKm556RRejS510orYKj4IRNF2gjGmYADjALjRz/oU9SvUVrOm50m
	6AyJNHyKU41dt5feCUOVgxYTG0/JORX+Mw5Qdioj7Q63KKOn5VO89q4Eg/f5XmUV
	WZI0DuEa0qOr9ogVIYlASFNTFLyFtfkxJ1CqTiAgBpTVt2eTctv0qdzyl0QfuRRW
	jNWHN1I+27K96f8ItaVaHFyptjBwVzRqnZ8q5TIkpyBBriSjESvWl+vzNlLxVCrm
	WOaLVLlXHkRXjUMCpxDST6M7xRv8INtbEZgisvm6sYZTvw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqgp4427e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 06 Mar 2026 18:53:13 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1273dfdaf5dso6946489c88.0
        for <linux-riscv@lists.infradead.org>; Fri, 06 Mar 2026 10:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772823192; x=1773427992; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vbp1ttRZMGjxaHz3QpJiubYEeCxSAMpCj2BS/Tc8NRU=;
        b=cq9MBIqVHXT1ea8MwScNylLvHU9lqH6g6CJhpPedkO5WDMikNa92aBbYVCnAdjptVA
         munKve5Nl7JZ08lDV7uWPcwh2PZKXchJpyvfAN7G7V53easPVoTvICUo2sbMB1pD9U7R
         2Y+Demh4bRUGk4eZBh17XXXsibzmtMsvdfdpbEzB67v8cxrfYUqfwPbXdYRAPKccSEfe
         HANsDed2mXxgX/UZT4O54q72H/mKB5Jr8S84OvLNTxDcg9Wv9hKb/H7HvEW0iEJv/JzG
         32DYgsR9vFDrYXq4EF+zPdCkMzsz21fowsqTpq0bnzU4O6588NEgQp/vSVQWghhfj7zL
         tbYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772823192; x=1773427992;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vbp1ttRZMGjxaHz3QpJiubYEeCxSAMpCj2BS/Tc8NRU=;
        b=Nuk1PDw8j4pz/pbx39RJki84lbOBz3zhOjJ9OkvwisLFSZWBmX6nxKMju5+J0IjHxA
         voCA1xkS7+IAe0oUcuofUGuTL2N5OrjydEBYv/NsUW5VxHs/HzcxCCLk12U1vzIfTf4S
         McV/Pzzu4K936srTGduTQ/BsUxYruMFmMCYJN8gpmoGQx6GWsc9Sb0gdiD79EYb2PyO/
         gYkiowQ9eUnVx7dHgtbbvpYyeu2ipuHS76yxLBMzK+EFDarHJRMLqKkJq0102Sxk8wYm
         T0weq2pN8ljk9q4kgIbHmcmjiU80N7oTD+BKPO3uRFndyTOpex02fRvfp+ZRmU1dK4W4
         bvjw==
X-Forwarded-Encrypted: i=1; AJvYcCWSr65L/DBNaHZ8URuqM/qV7ZMTIwL5ChPDw1kR4JAPVmBZwF/Q6AVMbfSKnzZamkg82Z1MSZ+1Oobbnw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzMEPDcBm5/GEwTWU4E47kekrVBBowxwk4F4JWzQCF1r4wnC3uq
	+DR6sl/jJS7iPa8BZkBL4PV/n4KW+zQH19bQLEWr/EwPO3tFIqu5/Sa1oweJAu6G5OgDo4WGCPk
	mxgnRnq41gstWeTm6NS1DN6ogmtcicQjxJ9AEkYa1b+IfrcYQ7sctpwZqtEhrFztWECYRbhk=
X-Gm-Gg: ATEYQzz4Z77ChbkPGx9j8P7yYemJsvpcx25/UgJMCYm7689xrxxHEy7D/0buVxVRMYW
	NK0H74xEuwwEVEMJKgtLzq6H0/6iMM1vOi7kc+Br6YAkFH9vOGBKyqMNFplqvRkZKVNq32Gw6Cw
	Z1PVT2P7ZDJXVpyShD/yWHNdG3W8cIkKlyDeh8HI7ysxpmMTt37NO80HZHdL6/PCF1lVIndqLyv
	9BE47d0sm+YAjSLbWL04LpjrWEIUeC+NggEl5YfUIGiqv01a5ok4xWD7LE14WzCP4KCWRa1ZQrU
	k8UFXyzTdU7C6BFdShb0zvzSaPn4vXWB2HMa1CGspHYrfjGKuONGfxZwp0qUND7N/sOJbM/wh8x
	usGaa1q1aqm7DFpOVTR3KJTmJJHt30a8=
X-Received: by 2002:a05:7022:e13:b0:127:fa:7758 with SMTP id a92af1059eb24-128bbf83c4amr2989619c88.9.1772823192088;
        Fri, 06 Mar 2026 10:53:12 -0800 (PST)
X-Received: by 2002:a05:7022:e13:b0:127:fa:7758 with SMTP id a92af1059eb24-128bbf83c4amr2989614c88.9.1772823191558;
        Fri, 06 Mar 2026 10:53:11 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-128c3f58d24sm1934819c88.12.2026.03.06.10.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 10:53:11 -0800 (PST)
Date: Fri, 6 Mar 2026 12:53:10 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        Andrew Jones <ajones@ventanamicro.com>,
        Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Atish Patra <atish.patra@linux.dev>, Anup Patel <anup@brainfault.org>,
        Jiakai Xu <jiakaiPeanut@gmail.com>
Subject: Re: [PATCH 2/2] RISC-V: KVM: Fix array out-of-bounds in
 pmu_fw_ctr_read_hi()
Message-ID: <cvy2kbbkihlcza5njphjrivm7s3i4fksp3qolocff5ktzuuoad@hji3ioyoxe67>
References: <20260306073739.3441292-1-xujiakai2025@iscas.ac.cn>
 <20260306073739.3441292-3-xujiakai2025@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260306073739.3441292-3-xujiakai2025@iscas.ac.cn>
X-Proofpoint-ORIG-GUID: Q1h2GXN5z6tF_EYj5DIorJ06LAFcmpQd
X-Authority-Analysis: v=2.4 cv=LegxKzfi c=1 sm=1 tr=0 ts=69ab2299 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=JfrnYn6hAAAA:8 a=pGLkceISAAAA:8 a=GYm9Nfl5zRQZIgYA3ZMA:9 a=CjuIK1q_8ugA:10
 a=vBUdepa8ALXHeOFLBtFW:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE3OCBTYWx0ZWRfX4qJU1GcuL27x
 Tns7jfN8HQcLiekPt61SyFODO/Zxpu331LoeSYwO6mwwu3m+jJX8PtAtvtBnPNv4tM2/9aJ12st
 RbwIyAZgrBGPCq8nrd7XbQzmkVQHKJzhe7BYey6nCln0bboTDT4Q3rh6xxyzQ4m7ZaCK4xfhZhq
 xhu5qAsW60EXZOInHaaw98yH+NQQ6iqdv39ILiOCI5hsihu1HFBd21XxjMd8xL96J08f87tncOc
 mFElHvbtfrKZ+8rx41dI+qta8NIqr2pYwkQ6lujBKpi8kj83/bpfk9IhmxVlYJa9mLuu3YIXJM8
 xFVVkR/zeSEvCcJx3toEnREZcpeicJihIDhCoEHs/CVr9TiOBY09G1leiY4Z1q3/oI9jVYevvAo
 8umssA41LiNoLZf23WrUaRzgH/sEHGBg+MphOt2E5Acbwkh30C0mOgYsheEF7JMbcQkrcoj5KJ7
 4KP+VzJfU+Lxbaw8lwg==
X-Proofpoint-GUID: Q1h2GXN5z6tF_EYj5DIorJ06LAFcmpQd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060178
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_105314_511112_271A5581 
X-CRM114-Status: GOOD (  22.17  )
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

On Fri, Mar 06, 2026 at 07:37:39AM +0000, Jiakai Xu wrote:
> pmu_fw_ctr_read_hi() has the same issue as pmu_ctr_read(): when a guest
> reads a firmware counter that has not been configured, pmc->event_idx is
> SBI_PMU_EVENT_IDX_INVALID and get_event_code() returns 0xFFFF, causing
> an out-of-bounds access on kvpmu->fw_event[].

This paragraph won't make sense when it's looked at independently in the
commit history. Either don't reference pmu_ctr_read() or just fix both
with the same commit (I don't see any reason to fix them separately -
the fact the two locations getting fixed were merged separately doesn't
matter as a commit can have more than one Fixes tag)

> 
> Add the same bounds check on fevent_code before accessing the fw_event
> array.
> 
> Fixes: 08fb07d6dcf71 ("RISC-V: KVM: Support 64 bit firmware counters on RV32")
> Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
> Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
> ---
>  arch/riscv/kvm/vcpu_pmu.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
> index c6d42459c2a1..b7ceda1643ec 100644
> --- a/arch/riscv/kvm/vcpu_pmu.c
> +++ b/arch/riscv/kvm/vcpu_pmu.c
> @@ -227,6 +227,10 @@ static int pmu_fw_ctr_read_hi(struct kvm_vcpu *vcpu, unsigned long cidx,
>  		return -EINVAL;
>  
>  	fevent_code = get_event_code(pmc->event_idx);
> +	if (fevent_code >= SBI_PMU_FW_MAX) {
> +		pr_warn("Invalid firmware event code [%d] for counter [%ld]\n", fevent_code, cidx);

Same comment about the pr_warn.

Thanks,
drew

> +		return -EINVAL;
> +	}
>  	pmc->counter_val = kvpmu->fw_event[fevent_code].value;
>  
>  	*out_val = pmc->counter_val >> 32;
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
