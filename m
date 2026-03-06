Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E88FCC05D
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Mar 2026 19:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o6ccri0c8bMNFQEecd0IDl3VX7jIFcpP0lt714kr38s=; b=yRFKgHTq+a4Tyl
	VPfBzKOpPRr38NMhZlmyrOmrHriBZpXYFpmZ4eW+9oXLvxzRz2zZTPQiYeJxfpZcbq8MttIELSHlc
	wYCsTVhPpbBucUp1+Th8lW+TN5W8GImNBzshb6SiMq8X1PnoKBkCKebEYhhvpG10A8/cLsman328A
	z9O0VPVloP7JSAX2Vt45+h2F+jKT3dvT198D4Rq8pqmyBguRCACUPh4Th/ENO1SFDSc2regkXvajF
	bdDlp65JAgzNf3S+32Dt4wfpgd5GI3fIqU/QfJpmuUvVPo6bt+kTzvf8POMRfAW0v95Rdl1qN8TOv
	hNIHEEyfV4S3qtmvzgFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyaT9-00000004NAs-0Dv8;
	Fri, 06 Mar 2026 19:04:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyaT6-00000004NAg-3oO6
	for linux-riscv@bombadil.infradead.org;
	Fri, 06 Mar 2026 19:04:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=AEOAphMTxOtU+FeDqrKslYGY3bAJTeE8NjE65jpbiNM=; b=HwMBy4JTkEQoGfHBHQSAP3xl8G
	b3RxbzehaCsEEy4no/ckeFuy7L8RXY2Mr6dOn2DZEyPPJdXBJkQMTBVnaah7Ri+zGPijBsxNyBkMM
	Zjvjy2P/6pEY4wQWN+LlhVYUC9M8arAef8mLMbf9chC1pjp4T4SmYd+s02Fes8zeJV9NzQKzIkyAi
	DBXjyHGDHac/4YREC5kdTqbd8Y0ptOJNKGtChWcXLlBGLTIdyqHCIUkjmb6tT7cRcIbUvFSRmSqa0
	IBXFB2KEwTgvBpFpg91casd1o0EgQbsj0UP1kjDdm4pw5Li/+cmxOCdPrZ4c7D62dWfQxh3XoDU+Q
	UwE0PRqg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyaT3-00000009V8W-3P9O
	for linux-riscv@lists.infradead.org;
	Fri, 06 Mar 2026 19:04:11 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626H1Zg64115491
	for <linux-riscv@lists.infradead.org>; Fri, 6 Mar 2026 19:04:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AEOAphMTxOtU+FeDqrKslYGY
	3bAJTeE8NjE65jpbiNM=; b=LH5Ew2bJNm384DOERQnlB/g0uXjkq0MrVzViVT71
	WAqzzHqDvTLHiGHZ/tMURig3oM9FlmF0OrHZW1pYJs0iOiffcIheShW4UTEn5Jxr
	U3h3m2C2Yoz0iZPBPnNkH7YmqIPbdATG7yLAWomSYR6d0IO+9JIXpQ8ybKXrCQgC
	Yis2p+vczuf8HKZyYD/XtDN33SbZuKcGPCAt7hD5Sq+DEbh5LYW4KEEKvKF1+iKb
	btayfvs22QL1K/g1SHHm+cskZZctzt8xud2XDGvOe7FnGBBRuzfUU6p/6odvN/6J
	48Du7qq7d05rXs01jqibJmKwXZa4+bqAPgg3V/rp1vWo1A==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqv9u9vab-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 06 Mar 2026 19:04:06 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2be07cafe1cso79457373eec.0
        for <linux-riscv@lists.infradead.org>; Fri, 06 Mar 2026 11:04:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772823845; x=1773428645; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AEOAphMTxOtU+FeDqrKslYGY3bAJTeE8NjE65jpbiNM=;
        b=SqlQDvHGYXu7oUvlstp0cBHQku4UOsdZPIkfQ5Lu3ALxrlnvWddPsGdbgtlbTXqwnE
         BXbAePoQG2/b/JsoJ2DQDEJyBguofx5EwOanAqoV2y/N6Ox6PZ9dwJy5Kw/9+6h+JgkE
         5BDG1RvSQEdzoiMKqrNQYaZhe7eT32RiuB5Qy5oIC02IrAX+JVDABuDHIwsVoIazmBuv
         OugrxQr1hVsnuB9p/zRiwuFnpE2RMAtKen045SBjsOKvcOLpvNYfCghe5Pqalh9NlPIr
         nEB4W2AlNlHCpUDnAIDcLcYLDEC0BmPqY76NN4yI8Ymph9JsEHEp5oUUJHLfgk0wTTtk
         bFeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772823845; x=1773428645;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AEOAphMTxOtU+FeDqrKslYGY3bAJTeE8NjE65jpbiNM=;
        b=QvWfNMc+9HC5K68QJXIgm4fM+xgF3QTHwpf6ynXfHsJHG2zE/3/pEapSggR247eEHt
         OPY6AlqTuPBWBSGwby1OM89OyJ+YSPDTNFkjozJuUoKa5m7ej0+a2nGw45+Tqp9xmxmB
         IXSSI+IQIHaPpQR7xM9/L8usa36rPVTJ2hY2lm11EnDBwKhoHjGNCLUcrMhzV4IAqqWh
         UenSWGw4MqfVoz2bhVz2eog0NBLyaGAyd/maTLwp5JHs5RmMkAJFQfjv8hSGQYn1RXxl
         Xu8hYG4MQwSvnekBEoWQbzkHAP+QnPSRuNeu1eZpFjd0CV5/OKxnzcHBJUD3J4b9e2gP
         Yg8w==
X-Forwarded-Encrypted: i=1; AJvYcCWU/5LcSzalryy82HTPNnbZp/E8Iuo5d3jVmexA6COAFsD4YWEIQJr6qXWeb6GTMjR1ySJyfAbgBUXEJw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxgZUCaQCtCrztFyZTysEyv1Iw9WXbNZrvLwnqsTozW6cbL2tsH
	STEAxPAOYTA/qC8kD8ieuMP3LxcgG9Kd7FPtN9aomVbhcJxnooC/WVcUfpRK/sUVVoKdvWHVg7O
	lUbCvctJZ9317wmGN65jTYbZ6FzfQYPwYXs/dAWfrssZWdBeA1uNh5SVkntjCJ4t3eb4fVdU=
X-Gm-Gg: ATEYQzw2QT7z+WMGT73ZHdW78GEhRG8cNfRtpjgu62BKqRKNb7Gj+E2uWvIkcz8kzcJ
	8JS51tbREUyTTBySj9NSChrKlz/OahSJrwrJkI+rJXDK2VtOMKoS2zBwKqR8RBYEWpOJ10JYd+F
	zwzoqSNzpBepYPb+RFVEJoNlTPRDen9+IP0KH+fYxcg9oi0GKfWwSvlDzV9wkLaMlJ8PGw9gw0j
	EguwFViVVpvTQBAZpeYuoOTjbNz5Q8Oh/OFhvkeKMKt2o+n3XE9FGvEGwikEIOdJLZJxy4r0dBQ
	1x73NmZLLNI3YEeZjmZv83CNvxq3wGH+j/3BcGc+UZB3WkE6KGNeMScT/GlZJXyDBwXqEo6oMzH
	cvvOwPA3ZjvoUp+09mHcL1Q6KmcpZXKk=
X-Received: by 2002:a05:693c:2b13:b0:2be:3cd:62bc with SMTP id 5a478bee46e88-2be4deaed2bmr1242301eec.13.1772823845203;
        Fri, 06 Mar 2026 11:04:05 -0800 (PST)
X-Received: by 2002:a05:693c:2b13:b0:2be:3cd:62bc with SMTP id 5a478bee46e88-2be4deaed2bmr1242278eec.13.1772823844574;
        Fri, 06 Mar 2026 11:04:04 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f848178sm1735603eec.14.2026.03.06.11.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 11:04:03 -0800 (PST)
Date: Fri, 6 Mar 2026 13:04:02 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Conor Dooley <conor@kernel.org>
Cc: Guodong Xu <guodong@riscstar.com>, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Anup Patel <anup@brainfault.org>,
        =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Charlie Jenkins <charlie@rivosinc.com>,
        Charlie Jenkins <thecharlesjenkins@gmail.com>,
        Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [RFC PATCH v1 04/11] riscv: Add B to hwcap
Message-ID: <qjj6rwl7kysulsjkpmqsh4ttxowgj6i7p5ewxxrkqe7zginau2@psteng6ylgz7>
References: <20260206002349.96740-1-andrew.jones@oss.qualcomm.com>
 <20260206002349.96740-5-andrew.jones@oss.qualcomm.com>
 <CAH1PCMb5YS3UzaxhHCjPJHxeTKMcdO78VTPxa7+oktbbhqQ72Q@mail.gmail.com>
 <wozbsfbvlhsqhvrvjsxyx2u5rpagwlnezythkutzqwikmzeoah@lc3brdn5cu3t>
 <CAH1PCMaAEyZVioQmyJh7oFisnFnrxhnc_exJh5=vbZSvNcieJw@mail.gmail.com>
 <z5bm4uoryuvz5cnsdl37pqmctkqrxw3kk7vqnb3vopnyg2mhl2@ctwdfkgahjfk>
 <20260306-extradite-vexingly-707b5633ef03@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260306-extradite-vexingly-707b5633ef03@spud>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE4MCBTYWx0ZWRfX5uOM0o0Vl4/p
 W69VWyTXJg8PQ6rcc0tUFaz9QTL5zRiSkLrzxJpDQzI9JVxlx26w46u/8udKkKttzvAZcR651xT
 5vwqpmxdUHuhUapo2M2HSJQN3RFUHwoDq42OhLWY7fM2TykEoW2w63yj9bXvOmrHYhnddYKZyTY
 XksfHUk90u3GBxoDBkQRjpPJo67QWy82BFdsZKMOwD0JxjT2tgcJ4bziwy/l/YUvQZWJwY8X2ts
 69Hev7s23hI+oI6EwfANuiwvTMHDkJnAhViUGOdIPWmD0gH+hdX2kFZlyZRs2Z8eHpmjuobroNE
 gwapgaqSwyW27hJFwUpHhUOymbrF/9PHIcYF//YFIyx1Bs3CNaTnLdi82z5VfmxAxPSW9BYq7Xp
 awrmLm89lH/XPEKAgyGCnq+r2C7tDm+SwY7NvKXAMH7nylnb3DGQwFbLD5tNO9BhcQDig2K73kS
 YNbh6RF0x+7voij0qxQ==
X-Proofpoint-ORIG-GUID: 5q9X2VB6rF6hDuvl1BhN1IcRK4UGUc4Y
X-Proofpoint-GUID: 5q9X2VB6rF6hDuvl1BhN1IcRK4UGUc4Y
X-Authority-Analysis: v=2.4 cv=eJoeTXp1 c=1 sm=1 tr=0 ts=69ab2526 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=8zqSyz1bBbSAnvxMoyIA:9 a=CjuIK1q_8ugA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_190410_124001_FBF081D7 
X-CRM114-Status: GOOD (  19.04  )
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

On Fri, Mar 06, 2026 at 06:50:20PM +0000, Conor Dooley wrote:
> On Fri, Mar 06, 2026 at 12:27:50PM -0600, Andrew Jones wrote:
> > On Fri, Mar 06, 2026 at 10:17:19AM +0800, Guodong Xu wrote:
> 
> > > + /*
> > > +  * B is functionally a bundle (Zba + Zbb + Zbs,
> > > +  * no additional instructions). We use SUPERSET
> > > +  * instead of BUNDLE because B needs a valid ext
> > > +  * id for isa2hwcap[] to set COMPAT_HWCAP_ISA_B.
> 
> What's the actual rationale for it working like that?
> Why shouldn't bundles appear in cpuinfo etc, I forget entirely why we
> did it this way. Feels like it'd be easier for users, no?
> 
> 2023 me might disagree, but 2026 me doesn't see the value in hiding these
> extensions. All I can think of was me being very negative, and hedging
> against bad software checking for zkn and not checking for the subsets,
> and breaking if the dt listed the entire subset but not zkn. That, or
> not wanting to implement code that looked for subset extensions and
> populated the relevant bundle if the bundle itself was missing but all
> components were there.

I also can't remember and the 2026 me doesn't want to google 2023 me's
thoughts. I think we may have opted not to publish bundles because we
didn't believe publishing them would help reduce much confusion, as the
concept of a bundle itself was a bit confusing...

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
