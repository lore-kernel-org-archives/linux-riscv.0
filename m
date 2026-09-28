Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A940C9833E
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 10:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DlSdzpg3rIY5f45EwCb1imCn8jJlJlcaon4orf+BPgQ=; b=4EFlUyZLWprQoz
	ESqeSZxSDYiBdy2X2DrEJdivRKQdQFiXk1A2JOevFZFIau5NYTnwRO+KEU4wbCLMgNOQToGlvEm5q
	tinyjsgObzNeGBKa3sC+kRnJPSbEQdbFysqsAv1WxKVX4bQhqfjbkJclcJiVXEkyxQMHA/RlwFb5/
	M9C06aInUsxkroAheVtIXqB6/gkfxwfaooHwzF5rgou7eg4FDOqdXFrOfTaHWJkDz+Knj7vuGTjZo
	i58jhZYM9Btq4y+PNff1wZKbeicYxoRV/WZieuAliH9ONBFKJf/VKF5/jYBCcZiCIQZYIzwMGDNYH
	eD+i47AatX0ZwTJLwaKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB8Vn-00000000L3R-2yIC;
	Mon, 28 Sep 2026 10:23:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB8Vl-00000000L34-00BU
	for linux-riscv@lists.infradead.org;
	Mon, 28 Sep 2026 10:23:06 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S9MnuI3879730
	for <linux-riscv@lists.infradead.org>; Mon, 28 Sep 2026 10:23:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3QURnDCY7An5xGLNpCoc6F3i
	MxAhLlXcypiYPCF7hak=; b=VWga3LQmgyLSQieWMTHkkLx0g8x+kECFnzZbPOUB
	jwYRaR0R1GM+0CgFC+Zp0gExgtdnO8KMV3ynBV6jviGUnAjpOKM+OyPLjy/UmwZk
	AtaJXp6Wl16jG5lVYa1jrkUfOT1ZXg0/ip87IFTKGpWYtzGLRJbgLSPskUofMd0W
	9VL1uECnsJOd/bX7xS2fkODhKPMAqEp1L/MxQWwxJilsT3h9HgF7YLp8lTM93m7W
	k3sQ4nNsuYHtomz9wMxNMLvRdjXBaup1t0v6RgeJ0fNPfDCyRSGi9S7rmv+7Ykvi
	Q68iwvFNyll+JnO4r9mODYPx2ZhzXxgMA59dK7uSDEQ3xQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx77jwjh1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 28 Sep 2026 10:23:04 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-530e0cb072eso55656681cf.1
        for <linux-riscv@lists.infradead.org>; Mon, 28 Sep 2026 03:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790590983; x=1791195783; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3QURnDCY7An5xGLNpCoc6F3iMxAhLlXcypiYPCF7hak=;
        b=UT7yQ2Otjiqsk38yJRAgAGnaz5QUbOaN9WJaKxrxDA1HYRf6rNpBWuDKt4k57ZN9bd
         zxz5Egg+PeDW6xUy6vX82FQ4UGqi06akid9MKtVxRTQo2W8r3NVRSMIcwLjeGpHRfOTw
         2TjM+8b46qwTh+bn4iJkLCjjXwAxy95omkJtClpAYDIGfCh5L9BD30D4xD2z4xVa/Ucg
         iaHC0OXJeCOMZLWEKBddkToHTiukPGwv+RTiQ4HowQA4l8A/C5olWHU6DE1ZydsYmJlu
         HNMcaIP0V4FhtjRKexAy0ykt+vRJ5nWHJRyLxHN6LkO+BC9nAYm97msChltSmzm7SW04
         IZow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790590983; x=1791195783;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3QURnDCY7An5xGLNpCoc6F3iMxAhLlXcypiYPCF7hak=;
        b=LMw3te4o7Fz6BskKd6+j4SpQbRSECDWb/k4FGQzvsAeXiJw4KgVy2TjrjzaXQ/piMm
         wRRzagOqx98+tCPph8bCVxL7IgQ1AqAsQURxsLoRylB0YQOy6klEMzIvlPew1vD283x2
         +EfT31vUuX+ye1h7jk/2XeSdC7RapULZXJVM3+1n+Yqdms4KyO7R15zyGhHucwZcUgNX
         +Bz2JRom3IK56NaA7+dWK4qRtiNpPSNiM8qYA0ugiuPq4NiEJQJOYLWki2XeyITM6f8r
         dnLb5++oMsIDKyQ/7SUM7+5tsJo6OA8+XpZ6QS4dH6TTdWiPuNMNoA9YHxLb79ly53bj
         97JA==
X-Gm-Message-State: AFuF++nmaOoy+AcdpddBns9vSpxYIiufcfdxUzP9S7E3cKbACMI/uSTU
	4Lyz4re5dmJs/iMocwQ/ZqxNJKneg90dGAYOe/+jLGc4LoBjBa9wVoXPDaDSe5HvYVGlrVlLGNx
	CMiA34h97zSDM2zfdxe6YOGnepE0DotZGWpuGCRTwVCYPnliHFBvG0rYjieNDCkJMTQtasSiTq6
	VzB6Y=
X-Gm-Gg: AYBFou2yjwxkywoMWSyJ3RW0qEbggiIOFtIpeuVkIgnMXgfn8r5os15ACdC9mr6qpzB
	hW927ckaj5kjcvwsF3b7O4K7nUwk0JIyBazoa3VKhdErT8IGgOsqvPr2v4IFYPHNtNNtZy6eGyl
	23W5uDf8AeW5Jh7+GYpyJam0jwJpNCSCs/30WReDCl3ZdudaLaHIscV7uItMMn0QtqJmk/PEBu5
	xoh1pPvoi21ZG6evp4Oqcsfa4TDZkCW10nYzoLCHU8jlpZx6Q1+Rliv/JTKR1rSD5M2Kb8eySXW
	j9oKLEviLBaqZJ+i0QnXjPPoAfVX/awGb5h+AOyMhMGoZle3DLYQZp+6InrQXqT5qwiLR+MfOsr
	0gy0JlOXKz192H+seqbuDi7iszVYQOtGZwUxftg==
X-Received: by 2002:a05:620a:1a08:b0:93c:6383:48fe with SMTP id af79cd13be357-93c63834d3bmr1077853485a.65.1790590983009;
        Mon, 28 Sep 2026 03:23:03 -0700 (PDT)
X-Received: by 2002:a05:620a:1a08:b0:93c:6383:48fe with SMTP id af79cd13be357-93c63834d3bmr1077849885a.65.1790590982538;
        Mon, 28 Sep 2026 03:23:02 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a007fd1847sm45517565e9.1.2026.09.28.03.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 03:23:01 -0700 (PDT)
Date: Mon, 28 Sep 2026 12:23:00 +0200
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: Re: [PATCH v6 07/16] iommufd: Prepare software MSI installation for
 address lists
Message-ID: <jiouhcgwcqyp2l3uwvy2cswgelwezs4bmnk3zgsvkbs6kb2tjp@x2xr4ulqlp7g>
References: <20260925151659.419512-1-andrew.jones@oss.qualcomm.com>
 <20260925151659.419512-8-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260925151659.419512-8-andrew.jones@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA0MSBTYWx0ZWRfX1UFGDQ2Gtqxq
 NWCD9+hf/jIMu19np3U9RH1AtRKHYMYC6X1DlIaa0YdXiOKdmrSrvFfP3FC7/X6iqPdGlydy4LC
 pCTJViSHMIeTNTxWNOH+3+k8MlOZcy8=
X-Proofpoint-GUID: hOIDcX-h0A5JMRZyAeU-BI-UB_EfDpt7
X-Proofpoint-ORIG-GUID: hOIDcX-h0A5JMRZyAeU-BI-UB_EfDpt7
X-Authority-Analysis: v=2.4 cv=J8U/fwnS c=1 sm=1 tr=0 ts=6aba4008 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=SRrdq9N9AAAA:8 a=j5oeER8E0eYNLuWwjgYA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA0MSBTYWx0ZWRfX6//2VrhrCt0s
 hJ23aTKi3JkmS7htr8cvUDpkaM6tMtKEsz0i888yjPpQ3Vy1ESVrMItM6iydfDxjDGa7rZbA9D6
 /LoSvvsyPj4vRQDUpW0ChJwkYCNaOzs1vdLBFRxbNMxo2uKvZzA/eqsHP1x9XWa9XC4eiqk/xYy
 gWkUAB5o2UrIfse4sir/PQRGyxkUPkkVM7IZI+0dMnPIuNwNvUuSUHv/X1g6kasmok3lctEUEFQ
 SOtPUUFoHuEG2EPyToVMB+nXq18gABQHm+fVkE4WnDIe34GetnOerWYURLlWxKRyqLnDcUDBzzd
 Y9OhUvttsa0/NrF6wvUWUZvuuTD5IRah8XNO+T0EhYvvtMHvAnsKAckd9QGimqjSQWTZx5aJHp5
 i6P8HXyYGBMwofwUneE4KntF2enlmVPlufI/UEyUN32JOsenzIFWMjqQkv7YcHxB8l2QH5ocHnL
 F/moysMqv5+nl5cOP3w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_032305_044291_99EE9EC2 
X-CRM114-Status: GOOD (  15.36  )
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

On Fri, Sep 25, 2026 at 05:16:50PM +0200, Andrew Jones wrote:
> Teach the software MSI path to install every mapping in an address list
> before publishing newly allocated maps. Mark the complete list as
> required by the group and roll back mappings installed by a failed
> operation.
> 
> Keep iommufd_sw_msi() as a one-address wrapper so existing callers
> retain their current behavior.
> 
> Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
> Tested-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> ---
>  drivers/iommu/iommufd/driver.c | 101 +++++++++++++++++++++++----------
>  1 file changed, 72 insertions(+), 29 deletions(-)
>

Regarding the Sashiko finding for this patch. It's complaining about the
mixing of goto and cleanup helpers in the same function. However, there
is already precedent for that type of mixing in iommufd, so I'm inclined
to leave it unless somebody other than Sashiko shouts.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
