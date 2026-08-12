Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB8DDC5B572
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 15:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Subject:Cc:To:From:Message-ID:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W/ClL2QcFziFj+Y1MPrc8fE397RIu7vvFTfpEeE30CQ=; b=eFm41HlxBWpGb5
	4AgMAYOIxWhekYtSc62WqNitMW0fxAqvSnj5YbDhpHRJHWbUeEUG8i0s43JLB9xJ22wG5yct6rSu3
	64ZSsTIQUJJXp/hXSWcIB+Y0juCBrzyyHJB+GQtqDAer1tGIQLdai6zQNuaESgDufS0l/Dzi28TQ5
	61wjsCrLns+gcIDF3UhBvuk4fwarRT+9mJE3QiL6U2kp1DBA3wB8fQrlIs0ZNm4p3h4H10AbW4ko/
	ICLLcVkyU4jKi62dyFAwpCsa6CSzglXQoVL7oJVVuC1lXMVMIcu9NnBiEMxJ+Ew9zC5ZHmXX6vKoM
	+m0RM4EdbAmxZg6zBi2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuAZ6-0000000GRFx-2G8V;
	Wed, 12 Aug 2026 15:08:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuAZ4-0000000GRFP-04G9
	for linux-riscv@lists.infradead.org;
	Wed, 12 Aug 2026 15:08:23 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CDbqjH3597950
	for <linux-riscv@lists.infradead.org>; Wed, 12 Aug 2026 15:08:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d5og3NAwXYSPZz2d48+V2J5XesJedhZ2AvckE+OW3Go=; b=a2fyRxSdqAcfJTia
	YC40ZY3P5/NshqG1npdGBFHD/w1FPBnG2LVykWmqDsBY3+8ePBPb4Fg2uGAPSitf
	UpUCE8xvXr+X2vxrZb6mP3VpidvQTBoguMNrlzJmABb8XwszO+QggkEA3QyhV2J5
	tSg8VYxdvw8GEb5ku+vCEirE+kGvlYhlbHqhDA0qhBSNYWoCBwouXQejpnPXGx+7
	3KXwEw9TO25DoKvs4eV3A+5K7vzvQlbiRyPViDXcxXnZdCPLSIY2ZOXXOz86OclT
	DD4keaUrA7SILJnsS9XFp6Xv8HvgyQIT6QZl0sI36TbIp/hcWdqJBddVTqfQD4x5
	lzzLQQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g08jrmj79-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 12 Aug 2026 15:08:21 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e5a616d07so1416900a91.2
        for <linux-riscv@lists.infradead.org>; Wed, 12 Aug 2026 08:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786547300; x=1787152100; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d5og3NAwXYSPZz2d48+V2J5XesJedhZ2AvckE+OW3Go=;
        b=CG6roGQbaKwLSmLCVfx2FZU+6jCaeFzefiLE27aryqGD7Esc6vzLOIfafr5aZ+Y4jW
         RpwxL98qhVWXD7I2gRmMPnSBeeL5vhmHTjitLpzsLX10TT4SwHKRkaKwnfVdR5qANeM1
         wsbkJTffPTX7T1CuGp0ToaxHsuSOLfgBkULSCMMvMyWLuOiYFNvkfUfAnwy0Nax+TzJK
         BhJnMbuDJ386/u0CdkgkMGVEzpav9+nTNPU53aALrET8IdFpQBs6zxB9DmAAc4RtTLrn
         0QgdmTR1x63am6a3rInUShKCFWbCxBU5lBeOz0ezLZh+2ySIhkDyQ2yDHy9YDvh3HWjs
         x+dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786547300; x=1787152100;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d5og3NAwXYSPZz2d48+V2J5XesJedhZ2AvckE+OW3Go=;
        b=WtQdsdravj8e+JVJQFAHJmmVyi+7w/ulSgVQsq48TD9oY72jGb4yeAfPp29EOEKqly
         gC3//Fof0uKf07pucbWisTwY0iTdXQBBd5pBKnwnTJbBY6MoT+tjqepx+StyZgD8IcGJ
         1H11/9UkEhwbulXlp9rHkAZTfJzY+PMCxZC1ujyryZo3GXdouYcWJPxqcfyAu0nCyCQi
         X0SYU/zaoFxF2O2jkL4Wvyvf8I9DFmd73sewlHvO7BCA5VpUV3xOKAU3mfulROCqqXH/
         kDsfH1nx4ydzhZrrb1BVCToZVDT76ExzpHKrqIX5qP86Me6+RoiCYqVlwALwd75li18U
         Rzkw==
X-Forwarded-Encrypted: i=1; AHgh+RoNYkm9DdEpyzYgJaPRE8HBRbO4/nH9HhfmJRtmtgmWM2cTS7p/LiBP8+LOeoKlTNMRyIrtuSwc4QmQvA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywvn1HfLdf3NIjcAFiCvF9/+ed8bIB6I6G+QNn3b7yAon40YxWj
	H7rE5p6ptx3i6MTAfVOacV6WcrDbKIBHzpN4/rtc3yQXUHjFjYSXy4YllfQHBxomrxtbSwm3VjO
	Mg7mXzftKJeN0PIAvbBW3BIUlsp8fFyAbqQ9BrEeU/m69zYCGrvE7Dm/wjxNaIoaC3ZfGiBo=
X-Gm-Gg: AR+sD13WDRMsvo4hKYnmZlwDKJTnsr4IKVq6n7t9FqimowB8o0zawiyc99G/0/FwSR3
	C7JKtOvxmWeoheNTiUYgd28Lt0m41v4clwnkyQ+dTNsd+0aWmrvknOhQ2f1Xr/H6RINubisGrjc
	cHIbw5l77GEjsGYf52hlFQZu+Kvg1fQHy4b3J2wVh4H0xAbD3g7pELafYhQQbUGHvVy44TQWYs7
	8LZu0FE2WS8tPKglV2tIqmVM+Px+d5MegJcuWtSMMMX7QR/Axib86QmyPqEdWcRQ50mom4ExKop
	UkNwND3KFsJ/PHDk1yw4kqm/oOlgi6/Y6FZ6ZdIozPsqK07YhKEN5grHGI0=
X-Received: by 2002:a17:90b:4a8f:b0:37f:df85:272f with SMTP id 98e67ed59e1d1-39301621e8fmr6411177a91.19.1786547300502;
        Wed, 12 Aug 2026 08:08:20 -0700 (PDT)
X-Received: by 2002:a17:90b:4a8f:b0:37f:df85:272f with SMTP id 98e67ed59e1d1-39301621e8fmr6411072a91.19.1786547299966;
        Wed, 12 Aug 2026 08:08:19 -0700 (PDT)
Received: from localhost ([2a12:a305:4::40fb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392f94f24fdsm3850262a91.16.2026.08.12.08.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 08:08:19 -0700 (PDT)
Date: Wed, 12 Aug 2026 11:08:14 -0400
Message-ID: <d2cefdc95214a7912df9e8298c010b9d.guodong.xu@oss.qualcomm.com>
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, kvm@vger.kernel.org,
        conor+dt@kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 12/17] riscv: dts: spacemit: k1: Add Zic64b ISA extension
In-Reply-To: <20260701140057.EBFD91F000E9@smtp.kernel.org>
References: <20260701-rva23u64-hwprobe-v2-v5-0-2c61f94a695a@gmail.com>
 <20260701-rva23u64-hwprobe-v2-v5-12-2c61f94a695a@gmail.com>
 <20260701140057.EBFD91F000E9@smtp.kernel.org>
MIME-Version: 1.0
X-Proofpoint-GUID: lpCFF-L2DkZzWt0PJIEhkPZYhNEGlnud
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDEyMyBTYWx0ZWRfX/nj0CF+DXy9Q
 oRkV7/GdRpHZ/BnCuoA8Xm8RLB3ty5tbH1QPLDkXRbFeER5jAMBybHHzRKryxBvhQD1g+2HUjoA
 dDSfP6zSjQyhMi3p5Ib7QFmUBUhMFww=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDEyMyBTYWx0ZWRfX9zJhCzXqC7YL
 oS7/8I94DSuwC0mba7vY5bg6VlPx1FCr840H2j3rXCum4VkaMcVo/SKMPyGuW+D23UuaXlFtRFI
 SqUHc8xd8cRNk3avVGzNZW/L3KOQI/rYJjE9Dt3ULsGY6jOOfigNVE9Jp6J7HPvIfMB2Mtribtp
 l9geBfRiJ4fvp5I0+1G1xrguIMEWtMKxukvKFgPLYU0rY7m4QdR9DVhlYznDJseKqCjT4s5tTe5
 YlNVJAVHLbk7dbNbXMrcXoZlvJKK4NLIsAUkCMLa97IEgHTozjTMjnD06C+77HwO8M/8/1dOmf/
 d6T+MtfHimRQ8HRqzQMopxC/W45z2B7vpI9V+DuntVJHy1WAGZJliUMgY3rZCXprl3aQ56suhBp
 ybX7vEAZhgQUClAfbNBb9Vn3VB+QKpSEMbtmQqX5A5jaEPUs9R2atpy9dziarYP1425vELQ8bYY
 2VGcs7Uqe6ZaFr5RcwA==
X-Authority-Analysis: v=2.4 cv=Z7Dc2nRA c=1 sm=1 tr=0 ts=6a7c8c65 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=xdqrkOY86ttuWl1pWAoA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: lpCFF-L2DkZzWt0PJIEhkPZYhNEGlnud
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 clxscore=1011 impostorscore=0
 spamscore=0 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_080822_060327_5CADEFB5 
X-CRM114-Status: GOOD (  18.06  )
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

On Wed, 01 Jul 2026 14:00:57 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Adding a new ISA extension (`zic64b`) to the explicitly deprecated `riscv,isa` devicetree property.
> --
>
> commit a35d1f188ef1737f4ebf996e0483596e27176d0a
> Author: Guodong Xu <docular.xu@gmail.com>
>
> riscv: dts: spacemit: k1: Add Zic64b ISA extension
>
> This commit adds the Zic64b ISA extension to the K1 X60 cores. It updates
> both the riscv,isa-extensions list and the deprecated riscv,isa string
> across all CPU nodes in the device tree.
>
> > diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> > index 08a0f28d011fe..f179c619f5807 100644
> > --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> > +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> > @@ -54,12 +54,12 @@ cpu_0: cpu@0 {
> >  			compatible = "spacemit,x60", "riscv";
> >  			device_type = "cpu";
> >  			reg = <0>;
> > -			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
> > +			riscv,isa = "rv64imafdcbv_zic64b_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
>
> [Severity: Low]
> This isn't a bug, but the riscv,isa devicetree property is officially
> deprecated in the devicetree bindings. Is it intentional to add the
> new zic64b extension to this legacy string?
>
> The accepted policy generally dictates that new extensions should only be
> added to the riscv,isa-extensions property.

Intentional. k1.dtsi carries both riscv,isa-extensions and the
legacy riscv,isa string in every CPU node, describing the same
hardware. As long as the file keeps both properties, they must list
the same set.

Inconsistency creates confusions to readers.

Guodong

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
