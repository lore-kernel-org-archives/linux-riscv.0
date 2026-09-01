Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B2F0C61DD3
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Sep 2026 13:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r4JdhxBXhfs80h8jT5c4NdDh5pUerUUOs+922jEOobg=; b=RnvwMM5iqC4Pz4
	OqbFPN2aHRg4uIGezo7IQDpz42EUZ3PFzBN1oHEoqaItA4gl0TiEUQ/lWtCBXWruFzBx8fcU5WAR8
	tX8YMicesERQGlgiqRxIfxcIACNIE7lrxVRJBF5dBzkz8wLRnaGdl3C3MO0kkdgq7IHrLVvKuuXEq
	xz5BYSMRotFz5qe2/NH+IaG5T1yJWYyz8Yla0dZHbx9IhUS/J9P0lz1sSvdx0eZNojE3GTciOzvYK
	mUfLqj0C8o8ZxBFFgcGowekqVPGVMxroFTKSNk3zaLsIysbIy+SDWqzLFzCpVW+HURbhOI/GXXdXV
	4l5u/mf+zPNPAHSCN6ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1OpT-0000000CFS2-0cOS;
	Tue, 01 Sep 2026 13:47:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1OpR-0000000CFRh-01Tv
	for linux-riscv@lists.infradead.org;
	Tue, 01 Sep 2026 13:47:10 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681DVnOG2829432
	for <linux-riscv@lists.infradead.org>; Tue, 1 Sep 2026 13:47:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1fLyC2LJrsM
	PxrmgLgJESqyo9n3KdTEyY8OKdLzlv20=; b=TpJPlRuE09hUQt5ujRbsxtN4hHW
	aQJG3Pd3y80qZiMkth3qtVPLWthdPCJEamQkRVoBmz53Rw94Z3GXGa4u2v2c+ERz
	vtqkNV2whnUchFAb+0v8jVtTnVLg4hHR2eRtmL0Ahcg3JweOBNP8ii7Eb55/r5W/
	iLpOULYwGL0ht0M1hxlHiFV2i1phYsS1jWvgxMYn1Sf0J6JWZ2lz/o21MeDYqfB6
	kPRPRLniEtZ1izpEF0xQhIDNbAJ6LDKQA5C8DdYPQEoEor5/vNe9ydxpBmEDfp/5
	4r2foM+JY2b9PDpsSIiv+YifBlx8RD4uPpCmLtqAXgQMabMyq6qeEPw0CEw==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp7r2k7r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 01 Sep 2026 13:47:07 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6b1c1538784so3313660eaf.3
        for <linux-riscv@lists.infradead.org>; Tue, 01 Sep 2026 06:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788270427; x=1788875227; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1fLyC2LJrsMPxrmgLgJESqyo9n3KdTEyY8OKdLzlv20=;
        b=YF+TuXRCUWQIQqHN3DpbZoJ+88EJbReHmxWO8KfN5dy0bQJNKFu+YR1GxFnaC5doGL
         vIBtjFsVhrugPb3HySTifCBk7n1XjRbQ8YcEDku3Jfr93riRtteuBY3SCzetumwzQFUH
         8edD8IyaDNGJLRab47LVqJmnR/fAebxhozwTIJNgQi38/tHNod0Jsq0BbenlN4+sIeQn
         i1htiyPkOGzvrg08IHZ0EdcnAHlKLrX1X1jkF+l+Y9hxkAMH3m0jtJj4Db7KZr1+e+H4
         jFFo7CORzgqQSEKC2JbxVOJoeCTBID21t6fBVM70P+RqdNkOt/H8UgN8B9jM+o3BVuZy
         mZhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788270427; x=1788875227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1fLyC2LJrsMPxrmgLgJESqyo9n3KdTEyY8OKdLzlv20=;
        b=BE956L9Q3rzOj/wEt1DdipchI8aNv4gioTGGMT7pd7fVSMGbUBqsiHo4JJmL/fVtjG
         SnQZi4/4rfXmkZAflA9B1PTpq9OpzHpbQUJCvmAuB1ons35qbv+oCzUQUXZaCfG0aGie
         HVuI3gmmW6MkTLbMHLxdUFS1CAR9jJkI+Iylmh7r2syK8rSkAGMEL27TBzHe0eOAO4PE
         z5e1C1mhyWCzAj97d1JKLthjlw6OTlC9/TYE7IUvt+RKZMiiPWG91weZc8K01WsFCLc6
         AFrzxNikaGa7NEZK95FZzDUeJrX3KnyRTCuAw+ik10yK/H/DH59gyuqZiw4DUxJERJh7
         th/Q==
X-Gm-Message-State: AFuF++mcmSm4/dGbu+zjUP9OrEFdwKgb7/AdpP4OLbK/hK6MZO/H6ajU
	TR6p51v7Hr2eNA4rlM3uQpzPv0aJtGWrXmxgktc26/F1SoIa2bdj2OOZNW/7QqO7Wa9Z33kI/qp
	jhllquYF2XdNoXMDFIzbCQ3nDJCPU34r7yiDcaVYYPQzLGStQwewzpWUz9F31UGmJV3OXbiRcMQ
	zxZ+w=
X-Gm-Gg: AR+sD13/YeTVcB8uPU/7b1gY1clWcMYJKmmgbArOQ+FznCovfhZdMDmOhdQMUxprDc9
	m9BSpmT4oltUjePoMGKMi+SlrwP4aYVntdk6IlOeN4tE9OnbnYJ9cl7xnTtVQYqtZAu7TlW9jUE
	bCbiHEm6l1YcugpaMAEyyQJlchGdiDLYV/OPXrR55jaIEfj4Q+Zi0/lr8XpCERBKaloTu+0WGqM
	3dhV4mEfznZP2BpDCaJBuc8whP8/971tVGjFWK2HsZsovlJSQFHAoyF8cEALR1Tz4YfIn6ljY/2
	X+wywMwzXaqtfOP/3fg07LYogRpvH9cCKHptbbELgYziUoKYp6CzUmPbXci4HcoiDWM6esu+PnD
	I55x97MxxZF2aMuKh8efjTIRwhO9zgIWZ6Fc=
X-Received: by 2002:a05:6820:290a:b0:6b0:be69:d3cd with SMTP id 006d021491bc7-6b372e76db7mr8287141eaf.17.1788270427274;
        Tue, 01 Sep 2026 06:47:07 -0700 (PDT)
X-Received: by 2002:a05:620a:3713:b0:939:69a:4764 with SMTP id af79cd13be357-93948132492mr956841785a.39.1788269920915;
        Tue, 01 Sep 2026 06:38:40 -0700 (PDT)
Received: from localhost (ip-86-49-251-7.bb.vodafone.cz. [86.49.251.7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f1b2901sm582378466b.33.2026.09.01.06.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 06:38:40 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: Re: [PATCH v5 11/17] irqchip/riscv-imsic: Add S-mode MSI address list
Date: Tue,  1 Sep 2026 15:38:34 +0200
Message-ID: <20260901133835.345001-1-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831145943.313726-12-andrew.jones@oss.qualcomm.com>
References: <20260831145943.313726-1-andrew.jones@oss.qualcomm.com> <20260831145943.313726-12-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=beZbluPB c=1 sm=1 tr=0 ts=6a96d75b cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=on9AXyaqQ0RhfYpiXjjEXA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=rNTwnVtw_qv2rMTDxuYA:9
 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEyMiBTYWx0ZWRfX6yptQYV4XApq
 9ORopmKbSQ66hs/HM/TmiCPL9DCPFKkYqs+Nl2Xs9h075QrvadQ0zw6ZtFwrwFCF4iuhOGSN7aN
 BR3aFKRvWIXUyyXGTTJyG4EtVbwcNTBdbS2Ig2DXbTyT1BVsPC/GqOkaR6lydEZAM7N8o67n/3w
 8theSSxm8Ruz7PGLkn0WFcDGc01rHJYte6Wsnh1GZOwWvp46QuPrhPDoCh57gO/Jvi+88e4TyaG
 cn4nWDMEw1OHMHCHgbyabi6M/kpsaTCzA7wl1SA4i2aQDc/iCGR9PnmoKfLfs7L2PqVFC04cNxE
 CHQZuvcVoZVz1avDICY5wnvUzBfiboTF3Vebh4xQvX7QrAK3hH3qcUuT7pBfUaQJZJP64PoIiXw
 xRa+uGGlbZgeZafwDf+47h0aEgMjKO7l317aceMx7Gt4f8frRL8jf7t/ut92tcXx+8y0AcHzNBH
 ACHYrfYqdvARUspvWgA==
X-Proofpoint-GUID: cCIihHGkENUjIi4uZun5d76qddmbiN6-
X-Proofpoint-ORIG-GUID: cCIihHGkENUjIi4uZun5d76qddmbiN6-
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEyMiBTYWx0ZWRfX4H4bL7dhBTEH
 fnJTi7prymUjAH4KldZqAG6weu4mDQZ9LdLWpPz3Aw8jQLvFDQLfYDzfTN1k5QgblGZIF4cgQDU
 B0MXN+XkpJLv7m4BSKbhh4zxXaKjb/Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_064709_155620_482CFEB8 
X-CRM114-Status: GOOD (  16.36  )
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

A Sashiko review raised the following questions:

> +		if (!local->msi_va) {
> +			kfree(smode_msi_pa);
> +			return -ENODEV;
>
> Does this strict requirement introduce a regression on systems with partial
> IMSIC coverage?
>
> By returning -ENODEV here if any possible CPU lacks an IMSIC mapping, the
> error bubbles up to imsic_setup_state() and fatally tears down the entire
> driver. Previously, imsic_setup_state() allowed partial coverage as long as
> at least one CPU handler was found.

Partial IMSIC coverage is not functionally supported. The IPI and MSI
paths can select any online CPU and unconditionally use that CPU's
local->msi_va or local->msi_pa, so every possible CPU must have an
initialized IMSIC page. Returning -ENODEV during setup therefore
validates this invariant earlier.

>
> +		smode_msi_pa[cpu] = local->msi_pa;
>
> Could this assignment cause an out-of-bounds write on systems where the CPU
> mask is sparse?
>
> The smode_msi_pa array is allocated using num_possible_cpus() (the count of
> possible CPUs) but is indexed here by the logical CPU ID. If the CPU mask has
> gaps (for example, if logical CPUs 0 and 2 are present), num_possible_cpus()
> would evaluate to 2, but this loop would attempt to write to index 2,
> overflowing the bounds of the array. Would allocating based on nr_cpu_ids
> prevent this issue?

For RISC-V, num_possible_cpus() == nr_cpu_ids because RISC-V assigns
logical CPU IDs sequentially during both DT and ACPI discovery and
populates the possible mask from those contiguous mappings.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
