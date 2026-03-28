Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D92EA10F3DE9
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Mar 2026 16:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3s/eq7lqzFD9AnA9llDFP8DCkiuQJizD3G/GNMRbdiA=; b=GCO3uSO1tIuZey
	FOh8qLyvLaAl4sLlS2bdw6xC1kr4IOFDPWJKDq8dtOTm8C1mh5hNfDWrZnzaF77IrnSTWzkQwAExK
	G2jfHyKgK6FmxxiV5klZ0dtH7opJKE0eUS6LvuxgEs2zI5Eaa8G3bYCH1lZ1XMJtMK3XKkbOIjGmr
	wBRAPvH4PJwZgUHYxTK5OzaLIm+XHLVUsX4AdKSfdwA9mc90Ya8kW7bMog5CN7KeQ9pmfyOdb2rFk
	Zrfrs0+LLUOWoixVrzgHccULo23bCDoIYepka+67tIZ0gqQTfe4FQc9Q/Sot4Hmdh9PrnRtJQth5x
	0pYpSfSRqOw6/+E5ed3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6WRo-0000000975A-1IRg;
	Sat, 28 Mar 2026 16:23:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6WRl-0000000974m-2wyI
	for linux-riscv@lists.infradead.org;
	Sat, 28 Mar 2026 16:23:39 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62S2Bv7m2478167
	for <linux-riscv@lists.infradead.org>; Sat, 28 Mar 2026 16:23:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RA4nBlWgztaz1cG6MHDMjX9F
	FkozFbtIx4EKomLp8tk=; b=IIR4Q1C9QbVxxc1LXIQj16QxFkq3qHVAkAP47ipW
	SK2uRVXFtOosAusTjE3EOiD19AfzCUSHv+B1L/12PARBXulOwUCPmPQ4P1hWkA2j
	cRUX1prM7ngj2faTfzeN6IMrbkO3mYeVAwrhNkXfgbSq3fb1bGYk5lk50YX3OoeF
	+u7CEOgdzcWO017cWJeWk4PgYNYwQIVweYuDDuBCsaYEIrPVqKeIZ6bv1wsvZUVi
	qgCmna8VMaCUrSuxgqHzBaWalaOVvJILrAntT8mmDBMrjrVhYEqBpcjMxXvmwj3h
	/neSBGMawj8zpU0CYrFBKfI/nwutoEC3+qmhS19QeiUmMA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d660497xj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Sat, 28 Mar 2026 16:23:35 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2bdc1b30ac8so3950419eec.1
        for <linux-riscv@lists.infradead.org>; Sat, 28 Mar 2026 09:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774715015; x=1775319815; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RA4nBlWgztaz1cG6MHDMjX9FFkozFbtIx4EKomLp8tk=;
        b=LOazZMZTnohVVrOjr89E+QotfLlGA5Ue9tyhTyU3V9DV2oYNxzpj2QT/MHxNCe/wWD
         gxoTCuR94yQHZOWlH1PZwT83bdrrRdwT4H/FPst1r/N9M6eEVh5jx8zk4ciKDyjt/SPY
         8R0Xaec4EOx8LwvP24Qu9VSb5ueiSVwZ7gSf4DlskKW59CKNumTIEv1D5fxktzQtvS5u
         eOT47xfzyiUAASRm34XhM/DuGjRHpz0lR782s7yAMf6VRoHj0i+dx8JdSGRHLwf/T2MC
         tAF6kvtOkSKekxANyLpfxM68LdjfsNV6MuewKylnmBgEQWR9ORiiJa+a5h7WegWrF1TD
         2CMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774715015; x=1775319815;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RA4nBlWgztaz1cG6MHDMjX9FFkozFbtIx4EKomLp8tk=;
        b=CQLpLeGp4vXubkI7Buq0t6olCylrW12SHddh68pdxjKFnMMcraDkcEISTwZJQ/olNR
         bb8hYpLHRxn/WtH1mDzzBsdYRJAhrkRluaGsmUyVTWV79an3K7B6npmNKzjbY1NOSyj4
         Trw/LeiF9qxWq4/o3Ty7c0vZM35KCtA+VN2OBFyY2ynzo7q3Od2sjLzgTxzxaWbwQ2ok
         PTANYEHnK1oohYKp2IopXDGLDFS/KuGNj/qBnENaTqDc6DFKcmk2NqTEn8zGP6ElOmvU
         B5z84LF9yyngV9Wn9SNbM+KifHIn0UBlIXU1lC7LrqrqPxQEOrMtst9hKBieuyaoImai
         /V/A==
X-Forwarded-Encrypted: i=1; AJvYcCVizSky0+UUlyqyznz/FnFOcy6PjH1/8TjGm12/kk9FrNm2yi4v/2Keyz+xz6dwTDhrr6+frOPiY5I4Lw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzyNh1E+VCKLZBBrJghEjKu7zTwD4rqz1S94+HtA0SleHjSJUpz
	3zuRy/Bub2YSMVbYZebgOQMVSpXomyJfBN1svaodXW0qk0VXBcFfrdhZQfE0k/+0RuoqVYS9d7D
	3l3sl90mH5OwRE9IdYBdh4gUNtEKwstR1jBWK7YLRwOyjSz1PP79QqRdyVmQJBAbgW/+3GVU=
X-Gm-Gg: ATEYQzzjhNwHjdiKnozFCIcmqe8Ll8iKAlLUX6ItFQjJaSFN838oruOl0M/Ttxutz0t
	VHQIp5y5EMOZfpzrhjfZjkLs42FtftQ4CUpbxlrx5T7i4y6lKdI1Hbf84birMYJYs0/4alVNWeA
	AVuPDC7AEdVKqRWp+Khe79Vo7eiOFhB5+zauyf13/WoyPK3IsRjoPvn4LsIlf3fc8khiq+gCmDn
	XM0cw/7Q/e/UGDLpAtdcgijPYxyZZEHTYwpozImiX/gpDRZ/YgyyEiUB3Z2FyC0FVOEmk3hzHfW
	5soUVp/GRz4d2qVSSjWC/imswQxmbBZ9aI5suy0BZsCLNrEA7cQg7mFNOz8wQNFD9h+8ZatoC+h
	OTRNY/GmIxaRVK73umfdzDSBL3yX4rzs=
X-Received: by 2002:a05:7301:541a:b0:2c1:88ea:9c92 with SMTP id 5a478bee46e88-2c188eaa9a6mr2249402eec.8.1774715014878;
        Sat, 28 Mar 2026 09:23:34 -0700 (PDT)
X-Received: by 2002:a05:7301:541a:b0:2c1:88ea:9c92 with SMTP id 5a478bee46e88-2c188eaa9a6mr2249385eec.8.1774715014295;
        Sat, 28 Mar 2026 09:23:34 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c68b2ff2sm2374188eec.18.2026.03.28.09.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 09:23:33 -0700 (PDT)
Date: Sat, 28 Mar 2026 11:23:32 -0500
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Joerg Roedel <joro@8bytes.org>
Cc: Ethan Tidmore <ethantidmore06@gmail.com>,
        Tomasz Jeznach <tjeznach@rivosinc.com>, Will Deacon <will@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Robin Murphy <robin.murphy@arm.com>,
        Alexandre Ghiti <alex@ghiti.fr>, Yaxing Guo <guoyaxing@bosc.ac.cn>,
        iommu@lists.linux.dev, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/riscv: Fix signedness bug
Message-ID: <uhhd56nw64kofhkgkipzhofwhv6vqbh3lrklzyliyysmvxs4fw@nkhiijvf65q5>
References: <20260319182644.1082740-1-ethantidmore06@gmail.com>
 <gbresi4jgjmt3cydjftumy7f3afrk2ondap4mx6xfjmrtdnvsq@fpv4htqzdcvz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <gbresi4jgjmt3cydjftumy7f3afrk2ondap4mx6xfjmrtdnvsq@fpv4htqzdcvz>
X-Proofpoint-GUID: lZtMfMLlcHRJPedraWAkMt49ePPxw-CT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI4MDEyMCBTYWx0ZWRfX38wKanNkP3pw
 r00bydSSDRQuxUYCUiB0OB+DAWjvj9uNQNQU59NSym/VroCLlXaQhe4TIb+KjM89mJtbEiNiShV
 2lnd/s47ys5F/2eDcT6bYXZFbDg9FU850s1qDdYS07mpAUBC6kG+ESqyfDNfCFZnoD8YHcarByQ
 32B61qK1rjmAA9GzTAS/pcvo+xk6G6I0SayZg/uI1VK1vX98u92f4j9jTBugE4oJAKY4ObqZraf
 OfIGJY6s8RPGwZzhrtOfekwnrYV+nGqiDJYzJGsdyuXFPNjGeQTxwdRRwhr1Ps+QIRlOPdymNAy
 L3/gV7OAI3aa+BMeTT3jkLW7l/4H+Duk/x3hcHiYLXNr+qez1qi2r9UvUqgur8nGnmzXJfna6nl
 UFonqa6IsWxvKMQ5EYqpRxo59M4rt/S88X2UVhJEqkxekRp5tEhC51wrGmz6hJKPnSknr914Q+N
 uHodobVys9E+oluWxmQ==
X-Proofpoint-ORIG-GUID: lZtMfMLlcHRJPedraWAkMt49ePPxw-CT
X-Authority-Analysis: v=2.4 cv=G/4R0tk5 c=1 sm=1 tr=0 ts=69c80088 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=HLK3u_a7HVCP4a0YeuQA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-28_02,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603280120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_092337_899951_DD807E04 
X-CRM114-Status: GOOD (  12.30  )
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

On Fri, Mar 27, 2026 at 09:35:05AM +0100, Joerg Roedel wrote:
> On Thu, Mar 19, 2026 at 01:26:44PM -0500, Ethan Tidmore wrote:
> >  drivers/iommu/riscv/iommu-platform.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> Applied, thanks.

There's a v2 of this patch with the fixes tag fixed

https://lore.kernel.org/all/20260326175738.750060-1-ethantidmore06@gmail.com/

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
