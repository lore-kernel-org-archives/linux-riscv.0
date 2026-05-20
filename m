Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A2BCD4F3C
	for <linux-riscv@archiver.kernel.org>; Wed, 20 May 2026 16:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2HnaKfJRiooWMiNMY5DwXx9f8iqq6vRGjODJT9QVJV8=; b=uHSnQ4/mEm5s3x
	VvJGCirkFA11XGp60lqMgf34XObTL0BsltszjdHcj6YSBsq8Ta4Ao/bLw52GVe8+oi2C/MOYL5lQt
	kgNMt9xxy3ORuZnKHlstAcclFsyezumre8pBsRVbJioA/3htSSGt0pDC9v/56uU0J/oeFoI6RtGG7
	M6ap6kFMltJRr8nz4g6sD+5fzoD9eQ7Lf2YYU3C6sYu/aNDiN10RbVFasb2HnGZhJ3n9pO80pCcK0
	GTn+YNoj/k7Gpw1/iHlucdsn/mj4hR5nOMUb56oc0bV6DWTSnb8ooMGbWjq4olJX8JxZKCasz6+em
	oY5736iMax//Fg8DNc8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjOO-000000057D3-2FHY;
	Wed, 20 May 2026 16:03:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjOJ-000000057Ce-3BGM
	for linux-riscv@lists.infradead.org;
	Wed, 20 May 2026 16:03:29 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K9oTg01178134
	for <linux-riscv@lists.infradead.org>; Wed, 20 May 2026 16:03:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zA7pObzAMVJ588IBJt5ZdjHy
	sWlv5exY/p5KZLGwEaI=; b=coOk3mEjiLOVItEW+pPAt/2bIGLAkiLk2KUps3rK
	MnrH3SSw8Az/5hOsMGXJhk9nCQwDhLbp11FErLochf08cjSy2zrNyM7DGmdAcUIC
	HrKP2x8sTZChMIm06e835jU5+Sa05jGew6KSNoUhwjUI41vevsgJ2E9nbjHj/hC2
	etzQoKs+AgBEqVCCVLFNOeG2M+4UFiKZVog+BaN2MnQejtESS3IF1rje5QRq0uCH
	2PFpA2o0fUKHYeNVg5yXiad8ZbIKk9k8wR1kD4ovtBoqLLDwFG+bhPxX438LD59w
	JAlzSbPm/EAEVRCMDMHooD7PXHqSMRLP35Rdii9G5JtOuw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ap6sdwx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 20 May 2026 16:03:27 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-135405e4035so25856382c88.1
        for <linux-riscv@lists.infradead.org>; Wed, 20 May 2026 09:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779293006; x=1779897806; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zA7pObzAMVJ588IBJt5ZdjHysWlv5exY/p5KZLGwEaI=;
        b=NXcZWSwjU/yL5kv/6Bd8eJz60wXErmKEQFqBvGeG79XWT1vPqBjmvd+kFPAceMDCZg
         Rs3vi2BamGbym3anKjZzqRO5twEltDPoIHuxmGUX7ZV18d7eKn32dG1XZ5QsCFQtVVSe
         SqRtuOInnMODU/UkGA+U1ysHFmI+N0UfbjIWoiGQ4Xjk7Hcc22NuW7wPqjZ0PPx1WbcG
         M5RUPGDO4QGo0QJhAOn0YFaK7rMMdFMbUEuElOFZYNBUeksPf3oq5zFYzGofKYMCYPAU
         UaIXmGeJrjHZNgE5uNzQLzC4h0fng3TvP65M1hNHeX3b21jbolMSTncWeYB81AsOjEeQ
         2K4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779293006; x=1779897806;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zA7pObzAMVJ588IBJt5ZdjHysWlv5exY/p5KZLGwEaI=;
        b=Igjzro/Oh3lDWRr/ZubtNAHrRMV/c6UGCdNb6PsoeK72dN3epXSASU9BWzeD0oG08q
         ZDxgATJ95FO2ptS20Mng3ioyhwpTNVwjlW+R6R2KgjwTtKsOpVNH4rFp+Xp0MUeDp9FU
         5+o+bAL5maDHG6jtIAoFwBAR8fdWt6Wl6ACzFC4KEVlGLhOFVF1J8nZK/D5wmri5+cg8
         7hF9gqdwnAx63/cF3IE0XCy7Vvacg5E6+HAkLVI1Vf+UeLpKmV3BlHvcGhuWatscykJl
         fy7Ze7zNtufQlLpHlI59nORiRXmbDx1VnYryC5NzZqxbLT//lJdDpIOJ8bqXlERqDwb4
         cKUA==
X-Forwarded-Encrypted: i=1; AFNElJ9YQcT5eLA+a164+/LMkBkVetknAlJCWiD/3MJmKGM7mb/RRtq5FNaHAcFV9OZ2JVf/v9cI2Qd3MVOchA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywp6fJcBy8RjS2Aai7TP1P6Hl+oMyFqhHtPwDzDymKsw/lcEnxP
	hbseEIklceeoywjCZ+nymEzDCsgmGzlWLy0/I3gzf7VtgY6/jjEHP+k9grCnwv1674Wkp2ggmTU
	PC8stV6Gkl6QJxwSLZWxuvHZBHmCs9BnYjs99OAPrkyRVBu413OcBvGz9I9NUz49OzoA8rdo=
X-Gm-Gg: Acq92OFxTEgKtU7hJ3gcvjPdloLvT7pKA1EkTMrnTcwxvke03ytZqsLalThEg3PxYKC
	3omCZlOqaBDy4v2+5uNZubG5e+xgv9VFfZtown3KkqkAWqRj9Al8q3/u7uI1FYHi+Zi/1qyLb3C
	lX5jHvoQRqBWXwdAvnkMdT139dzpaq7kIAGIu1i4+iDJJ9g+D8vJboAUB2YV6RcNy5KLXUuMjRx
	dqO/kq4ehBKHlWAYUxfbhiXQmtC6hcOKsk+QtK1ifQBdTtmsPyz6+WwaCnMHYRYfaxo1slP/BZ1
	ahhu25S12b/mEA2qDJgmtL+ACLH/bueu20rd5/1JIBfO0i09H0R/Fxssjo/QUsV8zykhf3QMOCL
	Ungz8xy4qgHWjqAd/f9duBibNIk3eRJg=
X-Received: by 2002:a05:7022:ebc5:b0:128:cedb:33c6 with SMTP id a92af1059eb24-1350451e5f6mr11410017c88.16.1779293006113;
        Wed, 20 May 2026 09:03:26 -0700 (PDT)
X-Received: by 2002:a05:7022:ebc5:b0:128:cedb:33c6 with SMTP id a92af1059eb24-1350451e5f6mr11409883c88.16.1779293005176;
        Wed, 20 May 2026 09:03:25 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cb5b3c20sm27266669c88.0.2026.05.20.09.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 09:03:24 -0700 (PDT)
Date: Wed, 20 May 2026 11:03:23 -0500
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: fangyu.yu@linux.alibaba.com
Cc: robin.murphy@arm.com, ajones@ventanamicro.com, alex@ghiti.fr,
        aou@eecs.berkeley.edu, guoren@kernel.org, iommu@lists.linux.dev,
        joro@8bytes.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, palmer@dabbelt.com, pjw@kernel.org,
        sunilvl@oss.qualcomm.com, tomasz.jeznach@linux.dev, will@kernel.org
Subject: Re: [PATCH] iommu/riscv: prefer WSI on IGS=BOTH when wired IRQs are
 described
Message-ID: <kkx6nqyc3evbfeutxkzwv6kbrotsbxopkvit2e2qh6hljicq5m@x4bb54loffkk>
References: <7dc61855-d916-4659-8137-7f3457f6a56d@arm.com>
 <20260520134416.28552-1-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260520134416.28552-1-fangyu.yu@linux.alibaba.com>
X-Proofpoint-GUID: qoZu9Sp6c2qCrKq48V5Jkg1Eqk92REMu
X-Proofpoint-ORIG-GUID: qoZu9Sp6c2qCrKq48V5Jkg1Eqk92REMu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE1NSBTYWx0ZWRfX75/jJYhK+kQO
 CdfqgijUkrPBcTN1fBWiTjHQ5CNIi0keV1wJRI568YWQ2X5KLzBrDtkbNsNZ7PPIFWqlX5DW870
 EIp0hwMtPgXTe6+IYrH9lWzw9+LbEjYGMilsWRbTh5R6ZGZmN0JAKQHXg88SAWI9D7LsAj1cHWK
 mLGjpJnWzf8cyKE7pEGWDL5W35Wo8jkgUY5TXt5Dd4ibaaK7dTSH0r7YjG5E+v8b+WbY11mOlgC
 slm6LU3s+i4zsoIPLlYgoiO07Cx/E9W6w0sXFI0tC5aPOQ+YKuSXhWv/GK5GKNymVskqoS3mwby
 nbu1WcA5KMbGh/Yi0AQGISjKOPuCJ0Wm3F3UYIUKwhUaP9ASBV/kR95SRSFELa6uY+/ZpN2EagT
 05VjxqtkUqUII0WLC+B6IalD8kzTpfxA0CZ1S1Jz0PxJtqcUyuUXhhtjl2dR+ivZy4u79eUJoFe
 6ds9Mco1T20eOcitVXQ==
X-Authority-Analysis: v=2.4 cv=FesHAp+6 c=1 sm=1 tr=0 ts=6a0ddb4f cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=SRrdq9N9AAAA:8 a=GUY1ysHpEHdUDnuj3zYA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_090327_801018_45391E9C 
X-CRM114-Status: GOOD (  12.88  )
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

On Wed, May 20, 2026 at 09:44:16PM +0800, fangyu.yu@linux.alibaba.com wrote:
...
> >(As a side note, is there a reason this is calling of_msi_configure() on 
> >a platform device when of_platform_device_create_pdata() will have done 
> >that already?)
> 
> Good catch, agreed.
>

This is here for a device creation order issue. We have similar patterns
elsewhere, e.g. drivers/irqchip/irq-riscv-rpmi-sysmsi.c:268. When the
device is created the MSI controller may not yet have been probed, so
msi_domain will be NULL. The of_msi_configure() here ensures it gets a
second chance. Anup says he has a device driver framework solution to
avoid this pattern that he intends to post soon. I'll clean this up
after that.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
