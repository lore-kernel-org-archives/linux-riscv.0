Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E176CD37B2
	for <linux-riscv@archiver.kernel.org>; Sat,  9 May 2026 20:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v2AU7aewMRuKS5Y6PquAcilU/H1r0AgrqnEngpXslcI=; b=C3uBfAaiHh63Lo
	kuReV4TfLwk+xzqixGWMDN51CRY7bXfwAetLNMy0NEvihocI9e5xbsHdHPhbEMT9OX12EcAGzdkrc
	uZwBF+qWh14UWL+w+5BDWfWN696ybP1kMbOkz1+K0SgDVfcbatYNNaUAt087E+DXTkHCtPAS+5zUf
	OcsRhYr3gn4Xnj9SKFquexWXznEK+z37QTRfmsQjaW8SOBu+oTbHk3ZWaecenrnAsBI9QpqRkScY7
	54746Jx22KKw1ZfpmBhAcrIIjgTX8kglOopeaiSo9ejjEvlPhgBPlyv9rVw4wDMP4s0X1inUQhOCV
	w4TfMYhXfrBvlDDicX6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLoSE-00000009cvf-1YWC;
	Sat, 09 May 2026 20:39:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLoSA-00000009cvF-3Vef
	for linux-riscv@lists.infradead.org;
	Sat, 09 May 2026 20:39:16 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 649BNfWe3845274
	for <linux-riscv@lists.infradead.org>; Sat, 9 May 2026 20:39:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8FERYh6VD5a4wdxa/Bnz7uhQ
	P4f/Pd7RYSvqE9Wu2OE=; b=DPPBDGcvwnv8ZYuPGm+6yjucliFISVowWVdRRxu7
	JMYipI+ZwiVn7QJFCWrqkiPLxoHTgD+zR9lgSMZ7A4M4RVubjKkRfF6ZwHCBkS0q
	nKsRiSjPF0hox9elKadYzZrsxRdBzKO5hIqyUVCv7iihilpHpktWG1xIZ/Hizu79
	LD3ZIWiJUKqlU7TEHWVck3p6uwO2RUuXSbeL8j4a4x5dh4CM85D8QU+mQoRRwich
	QDUgNn4+h7h+67vuEvtRq5IppJ5HNLbOx0LCYIkB3tk42UbbG6rcpZeAhIUqhjL/
	j/SSkHDrNXQ7HXxZa7ML1QQex1I7BiVRIslChXv3EjUrZQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e240h0ugf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Sat, 09 May 2026 20:39:13 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2c0f6593ef5so4019618eec.1
        for <linux-riscv@lists.infradead.org>; Sat, 09 May 2026 13:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778359152; x=1778963952; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8FERYh6VD5a4wdxa/Bnz7uhQP4f/Pd7RYSvqE9Wu2OE=;
        b=InyBafG5d7eDJz26NFpFq7NIYQL3QUiFAyUdYN4gNKgbX+qya5+xV4nPhhuyZGeuaM
         zcLhaxpeFgeFk8XB/ba7Bt2dNg9caposfAEOVRhS/ZpD8+2AG4JfB20bYCEAp11PFH/R
         IKbrA9hA2eZ41oyOpmTerCKIPAwFoaiWaR4urEqe2G1Et+pPuJ0l4uN+MaMHSvp7kew8
         An/iFD0JHQZkdnULzZtozhdraRvyWeMsc2haebp7PdqnHk58ECJhH695zTIk9mabg1rT
         mD0uN4eItU1F9obdSZwn8yp6ICcYGs80Du4Dj0DmsEK3edFgaDANGlH6JiL2M7pv7r0S
         IlFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778359152; x=1778963952;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8FERYh6VD5a4wdxa/Bnz7uhQP4f/Pd7RYSvqE9Wu2OE=;
        b=EAx9o+E8/a429ShOOWolwLbjjUpKqkyZ12qF35469pOUQ5dRjNyPNLg+eG3H9JShrr
         TnM89W9Ju4mpmsk1SSBodRPFEhEhNmHUvVYbzMXZwWWvnGmTflUMPiljuU/0WQ1ZJVst
         FDEHVEcS7f8+/iQbUDIPrRFYlDF7LahMo2ls6lUrWuBRiOijc5Hkjoa7MDw8grZ5qTlF
         s14+LtnW96IAaSc0MTqx77D7OrehvKZ51ogixW4AqpG/85XX54ciGn9OA68N6jpgaoiI
         qHWpfkJPPc8OKto3QNcY0gIyal+Tp/J4htAj8t8I5YsO0etW76IFyhrNwp/Cs+jyrvlO
         x7cQ==
X-Forwarded-Encrypted: i=1; AFNElJ/2836aB4dr4m22bl2jonKLdyQGVWZIpfLf6KeLr8K1QYYBiGy0+RwdKB3wp89awzWWMvCtB31zG54MVg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzhUFGZUgxFM5bhsEIFNhl8yqdBoARi9PXzC7/FNNKitQ4Z6xyF
	b7WIi+a+l7Y4NmB3YMZJ5zDNX6Au03iXAsswUIiFLYIKdv+DLVf4rWdk6F85XsJECJMe0HWjuyP
	sWgcsT+gQe7gR39zTs/0fSt3MmTsF7xiA7W8/E1tPzi+4bozB7aRPgscFSQVTUGcUundFpJE=
X-Gm-Gg: Acq92OHtcZq8T+2G0+id4Ru/LqEFZEePZ3C8ixFWbyZ88GB9Uu5bJfHU7eOykqDNw4R
	LUNSxv0McCqDErWkiuK9bprA6DPEW7eEPX//uAIlck9AdoafN+gMCLp3aqtutxiZgthiCoNGdP2
	Q+rx2Zu2Ul6j2p6IBoVBI0Z4JHTWRX+b+oKteaPr6qGAeC0LL6fQ2Cd4ejmRGlT0ExB3Y7ZNGZ7
	5QHB9MUICKU4F2AEPFlv5zOK1TY4UbahTiwgf9f8ONMFR1tikjKaQwOu4TDeFGAir1rpGD1rAmK
	i9x50uK+YIsmJHKNJ7ObFaQzIQn3hbN5zqfeJAwzdbSO2fFsbZ0NMfFGelAkTuVFtLfMim8m33c
	CxHPDj84ZZuLaF6jXl6S4DyaRHce/S3I=
X-Received: by 2002:a05:7022:438f:b0:12d:b6de:8da7 with SMTP id a92af1059eb24-1317d893a55mr8179036c88.6.1778359152329;
        Sat, 09 May 2026 13:39:12 -0700 (PDT)
X-Received: by 2002:a05:7022:438f:b0:12d:b6de:8da7 with SMTP id a92af1059eb24-1317d893a55mr8179017c88.6.1778359151798;
        Sat, 09 May 2026 13:39:11 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13277bb2b14sm9696489c88.0.2026.05.09.13.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 13:39:11 -0700 (PDT)
Date: Sat, 9 May 2026 15:39:09 -0500
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
        iommu@lists.linux.dev, Joerg Roedel <joro@8bytes.org>,
        linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <pjw@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Tomasz Jeznach <tjeznach@rivosinc.com>, Will Deacon <will@kernel.org>,
        Fangyu Yu <fangyu.yu@linux.alibaba.com>, patches@lists.linux.dev
Subject: Re: [PATCH v2 0/8] Support non-leaf and range invalidation features
 in RISC-V
Message-ID: <rcxkvq5laonp6mofxmdawg7s5lgxrdy436ksbld22rngp5vrwp@guqmelktxveh>
References: <0-v2-b5156f657dc1+25f-iommu_riscv_inv_jgg@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0-v2-b5156f657dc1+25f-iommu_riscv_inv_jgg@nvidia.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA5MDIyMiBTYWx0ZWRfX0UHs/cOeDgqj
 QUpcriWAFiurv9Yemq7JQrNGD2rOiVz6XXPqSGZ6sSgHLAZo3ybREUyOU2ViWWvBxY3XSu0qtmI
 W+AS02u1+b8ckTFGc7GFn03Mchq8mjjB384+PM/JiB0y8lxWzvq174WpR+wcfyNvoXAus2CMnoF
 DPn0d3f5igAydsBhQTDeOFXW/w+G51/CzqwL7XdrkS53EWhdHaFdcc5UNP9Xd7Tc2gt/pGzK45Y
 rVPJpIdaANLAInlI4zAscG+5wrYq8aaz7KEjzprpAqXoX4Z2qJxWV3ftDnACRBU/3WOkxVGd8Bs
 4xO2SP31QNavuwLBAjgehaQjBC3QX220STbiqDYdpwVIFzgVg3UO+m9PTp3cVh9EmDIo1xEBY5N
 nphgW+A0XjP5hxX96RD+PIxzANqnr4natgEM4PRO/8bQW0BG+MUpov8yjtt+bkLU3af4WNU/gO5
 A8qVHk/1vURLb46TVZQ==
X-Proofpoint-GUID: _7lt_TY-7HdWHh6ANgkwGMyDU2UELF0N
X-Authority-Analysis: v=2.4 cv=X5Bi7mTe c=1 sm=1 tr=0 ts=69ff9b71 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=p0WdMEafAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=e4hL8whFHqtjNLFC1lYA:9
 a=CjuIK1q_8ugA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: _7lt_TY-7HdWHh6ANgkwGMyDU2UELF0N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-09_06,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605090222
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_133915_028676_C931BE36 
X-CRM114-Status: GOOD (  15.35  )
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

On Fri, May 08, 2026 at 11:52:59AM -0300, Jason Gunthorpe wrote:
> This is part of the patch pile to get SMMUv3 moved to iommupt. From
> that perspective it introduces the PT_FEAT_DETAILED_GATHER which will
> be used by both RISC-V and SMMUv3 to generate optimized invalidation
> commands.
> 
> I don't have any RISC-V anything so this needs to be tested by someone who
> does.

I dangled some tokens in front of Claude to convince him to add the
support for NL and S to QEMU's IOMMU model along with some new trace[1].
Then I based this series on [2], along with some VFIO support, and mucked
around enough to generate trace which appears to prove things are working
correctly.

For the series,

Tested-by: Andrew Jones <andrew.jones@oss.qualcomm.com>

[1] https://gitlab.com/jones-drew/qemu/-/commits/riscv/iommu-nl-s
[2] https://lore.kernel.org/all/20260508212339.381933-1-andrew.jones@oss.qualcomm.com/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
