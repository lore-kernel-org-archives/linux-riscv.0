Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26389E63C8C
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Feb 2026 19:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pZFR1pPliQfYfzK4JRvtAgJAHPYkJIHaLCFNdI281d8=; b=cB9kw7V675zRvh
	gL4FHI5xJQhIQ6oUnifBotuTaZRkA29E7ayMMP5zV2YkIbqdbqaLg5eqzvFhRqxZE94FNUvX92dZu
	phCOcx3WaNkAZfm9FL8d8dG+TqHc7A1sEMLYz5VKitrGOiUv3sJ0YcqNgacwg257D/Lxj/pf8VR5C
	lLJpyiGA9Cb6n/W9s6lb/qhYVLdWpm+OCFynZ7KO4Ld97Y0zxcpIZL7czs8vlHgaLHdngpvVYPRGd
	Z0isQf+RtJfSejMvfVMMwTQ8UkgcTXqsEZBmcfYeesQg618WegRkz5jUoN49rCDvc/LplY4UJISk5
	7J9g2VZABbetGML6AZcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmzNU-00000005UiN-2ifL;
	Mon, 02 Feb 2026 19:14:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmzNS-00000005UgW-1WGc
	for linux-riscv@lists.infradead.org;
	Mon, 02 Feb 2026 19:14:27 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612HSjZL3743868
	for <linux-riscv@lists.infradead.org>; Mon, 2 Feb 2026 19:14:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/8zI+RIop4TnDr5DdAUmDHiyZhpKs0Nv2xs4iv2+KGE=; b=S4pPMtsCc78QnI5G
	/VtZ9+pEPulUv/gY0C4oEuQlmLvZ5LxZDmQeMk/oXwp2u2Z/FSopfMRZlITtFVtm
	AM2gzLtqaigijBFZRqxGUY8MYRfHB3ysBtr5XzRIQ2CEdaBamMBz0IH/nNGwu170
	HrJqJAmRpH+wVy07ZoyDzi7hrUkoNS6SJiy+TMOZanhSCOivZrtxB1sxqD1a5Rug
	6inUY+m/XSR38YQC8/VWtLgZ3dDKDeIj5hezzRQKu3WeBCBQvL4FmstGDRvLWfy9
	c1xcrFm5JzmgG5xson/0wfZDrR7LDNgNgPJi5ZO66jJP574sUtO7yoqU/VioeFuO
	dzj00g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2tp0sh4m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 02 Feb 2026 19:14:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c5e166fb75so1540469985a.0
        for <linux-riscv@lists.infradead.org>; Mon, 02 Feb 2026 11:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770059664; x=1770664464; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/8zI+RIop4TnDr5DdAUmDHiyZhpKs0Nv2xs4iv2+KGE=;
        b=L2sjANszWKq50NglZqjoVcZi/SLsFz9gU3zXAW0NkMvs5w6gviJQT+OnxwXHCR9esl
         M/bpZnLrPw3ELhGTCssOIZHtdZUEooZdY9YwtARoc+N9d5Ta8BzXJkwjp+Zd5AmY3Jml
         rcGmlUArOWLMtGagO/a1RGW+tQSfE1FnUJoxez+3kBsiGOdCj/A5Tps/LKOc7iA9/Amg
         n40Wc2G1vcmW/ROSoRedRGCPVLvrkdTalKlw6AER9ClRkfgFKU65EANvf1Tml9s70QrG
         upM7cRc3W4vxE2lsizK+cIYPMqlyfX8mv8Elj8SeN2nbSa+4EkHB2zjrom+y5IMkoCt8
         OkzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770059664; x=1770664464;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/8zI+RIop4TnDr5DdAUmDHiyZhpKs0Nv2xs4iv2+KGE=;
        b=jXjv+ZV3YqzvnXM373NjfprHYTr1Pjq4dCAGEhhq33Dmj2aAzxHbo+zizV0G5koknp
         74PSLUe2+3x2s2gYyJGwr4uL9DyC9ljQDggP1eChw+p/pyjR1/LeWs2yvdy/Q+zeT/m4
         uZ026wM5WoA+NYxcx4wbZ8JCPb5q5XbW6PrVFSDVBEWM1gi1WksrU+U/t4n79qqo/seE
         qGEyT4w2DskzYT9Nxox+kZrz2tgOrGGjcDMR4pLCx76qNiUApn71w86NvEWAPuleSo5R
         XkU4NsCfKsTMWwGZaBF70wCQjBPh6eXOQ1xpLPH0eryOXJFaqXmCktkyIcs2EOsIPsaq
         3UjA==
X-Forwarded-Encrypted: i=1; AJvYcCVXsu0OUILMcWQdfqaDN6Zoj9OgPBLJanhgO0oQ60UnR37mD6rJyZXUeYIIOOu1XOZLMrQMsjt/xp6eBA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzj0D4rcHXUvwR+4YqK9fJKu8dK9fDb9e2MhP/IjTjaW31Lrv74
	jo7Cqzfe5k0jWbBC8aiVvS5mgEHRk8yqK8KLwudnlAV4LW2xzgQ+nMUHkDW0d05SqHXafxfQBSw
	bTH8/OxjTP4KDoQPJBH5jvauAoMJL5483GSo0EKptejr1Ydxg8rPtxDgEObblDkUgXroBipY=
X-Gm-Gg: AZuq6aJ6XZBlk/Q9oUvLINHTSsTJyzcgX+78u5WJxIfm/pdg0fIXvML154qaZY2KmyC
	qyLYZ6x/GADJ2c9QF21ajTO3slvGiWpZyx56SndciYnRiTfrTe68QYiPRTBlX4T4qibyL88DMVN
	Nvp80M1W3QnI8fibMvwFWvq0WLqnoLGHZmFQZOukPBJVa0oHRkxLorgZGCtge29pTCaDiewC8sD
	mjXc6gF6eDKsND9xA11DlMzkzRgQmWI1bjgl6VDKZGRIckQ9fmrnKOx3DIO5IbpfUrYTlH8DHjj
	tXl07s3wU0oVCmV5RomSqdT+JLf1t32Ts0/UguhPhPp0rybq4AV9hPOkoM+k6tChby4sWSC2OTb
	ExNeTudje/SNiMITqf2ZiY3IrF3E7C4Zou+zGcx/jitB6Tl/5
X-Received: by 2002:a05:620a:254c:b0:8c5:38f2:810e with SMTP id af79cd13be357-8c9eb330b40mr1572185085a.82.1770059664089;
        Mon, 02 Feb 2026 11:14:24 -0800 (PST)
X-Received: by 2002:a05:620a:254c:b0:8c5:38f2:810e with SMTP id af79cd13be357-8c9eb330b40mr1572179985a.82.1770059663552;
        Mon, 02 Feb 2026 11:14:23 -0800 (PST)
Received: from localhost (ip-86-49-253-11.bb.vodafone.cz. [86.49.253.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-482e267b699sm98668775e9.16.2026.02.02.11.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 11:14:22 -0800 (PST)
Mime-Version: 1.0
Date: Mon, 02 Feb 2026 19:14:21 +0000
Message-Id: <DG4PS6NRRUC1.1FL8WBJVEEM4D@oss.qualcomm.com>
Subject: Re: [PATCH v4 2/4] RISC-V: KVM: Detect and expose supported HGATP
 G-stage modes
Cc: <guoren@kernel.org>, <ajones@ventanamicro.com>, <rkrcmar@ventanamicro.com>,
        <andrew.jones@oss.qualcomm.com>, <linux-doc@vger.kernel.org>,
        <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
To: <fangyu.yu@linux.alibaba.com>, <pbonzini@redhat.com>, <corbet@lwn.net>,
        <anup@brainfault.org>, <atish.patra@linux.dev>, <pjw@kernel.org>,
        <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?=
 <radim.krcmar@oss.qualcomm.com>
References: <20260202140716.34323-1-fangyu.yu@linux.alibaba.com>
 <20260202140716.34323-3-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20260202140716.34323-3-fangyu.yu@linux.alibaba.com>
X-Proofpoint-ORIG-GUID: tIlhTPuQ4fFh22Sd0aju4k4o77CI_lE0
X-Authority-Analysis: v=2.4 cv=VJ/QXtPX c=1 sm=1 tr=0 ts=6980f790 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=HFCiZzTCIv7qJCpyeE1rag==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=SRrdq9N9AAAA:8 a=PElOwc1BOWmaZxrSg6EA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDE1MCBTYWx0ZWRfX4sEQDzJ0jJpo
 KygvRDqGQ1W+ghxKkTOtWFPFYvoM0CZB8kG1MbLTyDiN898FVUo6iFoNJYMXmcCRhLK5XDRGKHE
 1QkL6mCmpHXB3yjzFKOeCafokJCFdz7gvZp50ZVt8OBhTrXuJSQg6pQOlPu8szgh8wT2pazzb9F
 viykkK7selW1/Dtoqp1ypmr2KwosVRCCpqSCqj1X822gxCPKghUHVwdFIYRSm5PCJxJ+SlFJXRk
 cT8Nr99mMNgExdUJomuAmFJbyyhn1HVrPpvZKV+4IhL+nRjgFf8ImwXCTg59aV9Y4FxHDyYPC84
 xDKAl+EZLHq5opZitA0Un5hnXlPLWc/IBanKSNyipEOq35g57LolOtmtfGpaZxERUYEtTezmbwl
 uF3CglwvLzo8F/8938HK7Zw60JBLrVNXIepiQUaJCeLOTOyYjJmTNp6UTl3lUPbyyiz/G/+kyd9
 JMl0Y5cEmuq3B8AF47w==
X-Proofpoint-GUID: tIlhTPuQ4fFh22Sd0aju4k4o77CI_lE0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_05,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020150
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_111426_520275_B122F33B 
X-CRM114-Status: GOOD (  13.08  )
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

2026-02-02T22:07:14+08:00, <fangyu.yu@linux.alibaba.com>:
> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>
> Extend kvm_riscv_gstage_mode_detect() to probe all HGATP.MODE values
> supported by the host and record them in a bitmask. Keep tracking the
> maximum supported G-stage page table level for existing internal users.
>
> Also provide lightweight helpers to retrieve the supported-mode bitmask
> and validate a requested HGATP.MODE against it.
>
> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> ---
> diff --git a/arch/riscv/include/asm/kvm_gstage.h b/arch/riscv/include/asm/kvm_gstage.h
> @@ -75,4 +76,40 @@ void kvm_riscv_gstage_wp_range(struct kvm_gstage *gstage, gpa_t start, gpa_t end
> +enum kvm_riscv_hgatp_mode_bit {
> +	HGATP_MODE_SV39X4_BIT = 0,
> +	HGATP_MODE_SV48X4_BIT = 1,
> +	HGATP_MODE_SV57X4_BIT = 2,

I think it's a bit awkward to pass 9 when selecting the hgatp mode, but
then look for bit 0 when detecting it...
Why not to use the RVI defined values for this UABI as well?

There are only 16 possible hgatp.mode values, so we're fine storing them
in a bitmap even on RV32.

Thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
