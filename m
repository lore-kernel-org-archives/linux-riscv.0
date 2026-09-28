Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3669DC9833E
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 10:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=57PKgCdmdgEtQFUmYde+rJghS2uIqQ8oauYrR6H+NKE=; b=XvAmBI43mhpcV3
	MBvYY7BN8lusBjdm0Oj7qsFXQXCHyFbGobU0yinXygJIsYOm/fwFUJ9XDe6r5dBntRCoD1OG4yHKD
	nxE0eoLA9zO3g5+2qtWRLuWTMelVgQ4QEaNQelz3I9UiybjnTkyKqy+4GEvu4t+kw50j6ICwTiIWJ
	T1/7HLaoWUHxL8HS8Sm1FbhJaEL8pCN9M5d4ufCCW4XBjBPd6wfytllPTgwX8mmDaJFS4hufiojVN
	u/t86tylZSOKw6wgMXnJ+Ddk3AZr3B/izasEFja93ZwU86KJJehv4rWPZD+bCYm5blgnPurWfoLra
	st4ndZpl9gaHE8Av3fhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB8XY-00000000LEm-013A;
	Mon, 28 Sep 2026 10:24:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB8XU-00000000LDX-3YXx
	for linux-riscv@lists.infradead.org;
	Mon, 28 Sep 2026 10:24:54 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S9MACw1603555
	for <linux-riscv@lists.infradead.org>; Mon, 28 Sep 2026 10:24:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JunxL7oqClUJ+DsAanyRKj4r
	dJd/Q7BGxwsr424FObM=; b=UX5AkMlZvPxLTlrKpBAg9qNfrwOwRYyTkcw5q+4j
	RPzg+7cBq5CmGHUhsfctEzZWyH5vSGsEphMCrLYeAHLbvOmTYCQ7swMf1Io/qIvx
	qrPW0tJTGV+EfNbt4SBXOV/wQ3qB/VLUwGn9352uvrTOnGK8Wjr6CTPBPHnNR7M0
	DwouI9sbwgrQXn9FMxFsUdb3ayAHPcNxrGtl++eWmBy7FoVttCnKJmHhzCRMk4uC
	QPJL2aCQsTLtQP4OXfTjyiAT5okBXpeQ6s9OtQeST/V5Qe42t/57HMgeNviHfi2G
	UHcVHi/4DYPyAo1MHBpnvjYHNmSzpkaSNgYRfX31b9Xt8A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gynb6g9fe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 28 Sep 2026 10:24:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93c58ee2116so452842785a.3
        for <linux-riscv@lists.infradead.org>; Mon, 28 Sep 2026 03:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790591091; x=1791195891; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JunxL7oqClUJ+DsAanyRKj4rdJd/Q7BGxwsr424FObM=;
        b=UBfVL45jL39BZO3y2Xr5zpqdZnu7TbYYyTZh4I/l2KEeBpcgu0xakmczyZ8Psm3piK
         mHQA5cHjC0n/aPXjzAqWvs0Rvl17xuN2awtleRsaQrN/OmnQqMpRfP2TPQS2rHOnWQ4S
         7BQyNl9toi2kuZeWXI5uDYquLN9vEw7NbhPf4xdESbYJB8WQrBilXGBf71dCvzzm+hP6
         iHtv3Y4eyRfuVaJQpBHgLXiF1oQ5NYpPWu9lObczdBpFiCRzas9AOe2WFMbr3Obnuirb
         uO+AqljCnODLbZTTkZtBFoGI1T3S8Mh5pJY4b0kvz42X0SG/D2eBEaaAVbMXdBVSKsz2
         v/Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790591091; x=1791195891;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JunxL7oqClUJ+DsAanyRKj4rdJd/Q7BGxwsr424FObM=;
        b=DayVOPl1l7GR7QZbIWfeMjgQdjieaX9Axzrum1Y2tSrSdTGTBQhln3phMlH3gjCk/O
         0cbWebpuA37T5rE0fRSid0zBo1qEyhLaDUN4bytLBGyOGId/9SYLB8d3DjN5kbChRkby
         c2pQYYBSB31InuMmCxH6qXORkvavQi5HpgTbokJUjsYDn/HLcN/A1z85Csr3r0OBNM2U
         V0H4r5uQGpABJsVBffv4sCgeS/3RUuRiZsP5LTF6ue2ux/HTkfGLLRAv8zpHDL6dqujQ
         hCASdeSUP5pxR+V4ot+1oN00Sq38TNKViT/K2fzCzoUh+pEGX4H5WdXG8fgSetjD4xKp
         1TQA==
X-Gm-Message-State: AFuF++l151xr1AYWsgF70SGmlSJxbK+qUDuQiN+YAI9uZT8IAf2ztknD
	eofkyrE1ZnoWTiNLRjx8BKuhIkMKXy5z6iKm75Dp2TiLHtZW89dUlQ/lIf8mdi0deH4eGEfVj2z
	3q0nsCandpCgHVTmSDpc7N+piKAuzdqwwUVybGAVA9Afhw4nUg7q+oGNew6/TWONaY3V0TXjWHD
	eXDtk=
X-Gm-Gg: AYBFou1zReUlQlD6PM4JrLADmP26fw9Eoeu/4JPKZs7Jbeuc9+YkGu0SCCYRBFDpXG4
	/K31GMZFwelFbS2w7yGt8q//0efFD3qjgvfOIhWdDRjbYyjwtjprPV+QWF3EJelgW+cQnVCXWKa
	nQYP/uGLe3gvkTGAUV/4uWQrti9c7vNuR0wBrLinygA0/Jokdz0C1rSrLwxQBJ3yTH+duXDgY/L
	FEJrh90jzpy/oJ6p3UbxVIBQBDwbvP3u2kJCZNOyiPewlkA24uokJldMNTXURP3jspmtIhg0g4l
	tEMVif5kauCWACBqir5KSAfmcIEsukodTgW96PObxsGw6dvPW1xaovHY64dzge8tYzXvvZ/N6yu
	zoeVwIZnUkjrZM8Qk+qT40/0DRDIhq9GslXoGog==
X-Received: by 2002:a05:620a:27c4:b0:939:6de8:43d8 with SMTP id af79cd13be357-93c474e3f96mr1838773485a.44.1790591091112;
        Mon, 28 Sep 2026 03:24:51 -0700 (PDT)
X-Received: by 2002:a05:620a:27c4:b0:939:6de8:43d8 with SMTP id af79cd13be357-93c474e3f96mr1838770285a.44.1790591090707;
        Mon, 28 Sep 2026 03:24:50 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2dbd3bcac3sm248301666b.73.2026.09.28.03.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 03:24:49 -0700 (PDT)
Date: Mon, 28 Sep 2026 12:24:49 +0200
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: Re: [PATCH v6 00/16] iommu/riscv: Enable MSI remapping, IOMMU_DMA
 and VFIO
Message-ID: <k3crwedsmlusfc4goakdviqufyrsy43s2t2cksp3vbyva2u37t@ttyx32r5f3yd>
References: <20260925151659.419512-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260925151659.419512-1-andrew.jones@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA0MSBTYWx0ZWRfX16CO9Xovsqst
 4jy34w0f0UuvM6Fcq4t/2sUOm7/f/okD4h1109/g72CqQ0tvaYDlHbwzUtJBuU7RG0i+dGl99w+
 lZhtAjMg6cYHYwVF1+MlgQ2uHBhJO31g0pzwRzgfC6wIsMLZEsFaBOE7ousCYnKYHjWPvGJJBAA
 reXDcsjkfW6V4KK8hQJS1nOko01ETaGSbsCXB0p3zFgA8lgIogfF/M8KTDAdzUZCmO5eltvKQGr
 ppUvZnkO9Un9KTdTqF4ZMlW+h+1ZBs91FpZHd7yhh+BL6AoS4/nelrJnfMaEN5UgCjAZH2GMIAF
 socoMAFHtHu+A4IhK/woiD0uf38vdkDAN8bgoZPAdbwDXlb+JQoccNlSgeVnDt/zRWnmxzZvh2Q
 C1qWFENimCrkvJSXoGZ5rVOQPRHa9hCPvOikKeWCu4nU+38A9gwp4ZJicMV3acO94rOEHNQovtH
 dNVVJIztbJDd5/X87OQ==
X-Authority-Analysis: v=2.4 cv=K+e3jCWI c=1 sm=1 tr=0 ts=6aba4073 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=rbBGQWOvsAlMenIskvQA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA0MSBTYWx0ZWRfX+kwuqpV8MKJq
 ir0EqHKiOyPVUlyywZSJ8SdzmzrOYjlGbFrORCVwref86qWgmAo8lz/6rfo8zLraInJ5AVaY9YT
 pZZKTvuilI2OCxkuWfhdn5DQgpLQwys=
X-Proofpoint-ORIG-GUID: RYnainJvkAJ4unV5W_okAOpJPQW0bLhI
X-Proofpoint-GUID: RYnainJvkAJ4unV5W_okAOpJPQW0bLhI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_032453_024436_BFE57235 
X-CRM114-Status: GOOD (  11.44  )
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

On Fri, Sep 25, 2026 at 05:16:43PM +0200, Andrew Jones wrote:
> This series adds MSI remapping for IMSIC so a device's MSI target gets
> translated the same way its DMA does, allowing RISC-V to enable IOMMU_DMA
> and paging domains by default.
>

Sashiko only had findings on two patches, and I've replied them. IMHO,
neither warrant a v7.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
