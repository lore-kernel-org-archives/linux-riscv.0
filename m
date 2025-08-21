Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F97FCA0EEB
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Aug 2025 15:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rGxRhhrkvsH9lRiwNkY5uCWc1LutyUbBohHRBJ1dQxM=; b=TRCOanHrZJLbwm
	q/9akheDJ2l9a8Rz9ayBNLC498BB7v97Cd4cr0MUtAAJHKPFsorHMJ4O2lfx1HXiLXxy2BESJc4fd
	wLfUHHcEx1Xs71jccTqNqoeyjD/ijRWPUCtB1SA6viM5fIcgGkx3iChN3m7sW9yg9W7eYJfdw8R1a
	oJg4hpaIsRdbiFoA4LMnAQaM3XvNTvTvLiSDpfvN7WvVdbMshC4BnVN+wkBUBi6mgVRRgsbWNFPx4
	y6GIGQMb6PvM5l8G9O19hI8hUAvVY/4FnETwbRyLfW9CKqUS5bz1ySNoPhUQyWD0DpwUSfeq3A8ik
	7yK1kXNLREeW0SohYKug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up7Fa-0000000HNUH-3Vbf;
	Thu, 21 Aug 2025 15:30:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up3d3-0000000GmhT-1RAJ
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 11:38:50 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L9b6Y5026986
	for <linux-riscv@lists.infradead.org>; Thu, 21 Aug 2025 11:38:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LhV/iyN2vz9S9UCj9WMIpEylKKJUmXDVwEl9OAB6pww=; b=dqrlXWmQ8VKGmkcO
	2vxgHTn0ll1pFE0aAhwHIFBENQbveoi5QTe1SgWJerKyiN0z4MSPK1vzdIIHvjdY
	I8ssoyFjHckrRL23u0k2xlDWHs/woBz+XwN0EhBQSr943yjj7A5pVeuqpFioVV+p
	jCeAGkSpZcPAFm/ztGO/Va2p/ifUNYEcCIjbb6QwMusXwheHeaOGJbml4gUfcY4d
	jHECSXhkYclqATbmSzXb2c10voHXORQLjCPFYXPobvlnv9I3wwhswLOY/Ub2tEIS
	iT0fD6cB9lqdoEOokbZzgg53uE0pTKobqcrKo9brBQllMp4j5ox/lFLmCXcFvW0P
	5Oqflw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n528w7fc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 21 Aug 2025 11:38:48 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70a928da763so19864546d6.2
        for <linux-riscv@lists.infradead.org>; Thu, 21 Aug 2025 04:38:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755776327; x=1756381127;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LhV/iyN2vz9S9UCj9WMIpEylKKJUmXDVwEl9OAB6pww=;
        b=WnmwIOlwyDhn2hDP9dJ0NGVgiqJugSg84KhaLBqLlTHJa+NzCLnhpqOhS3/aIj8ISP
         ODeBsAm9BnGdaE8REpZM8DSzVtVTa6VQxpOl4oZRPjLcKqlvLvES0QU+E7JeCPUJW2+g
         cCTTxs3uurZ2QNqwyZdfa785+hzkzhdx+896QiuabbMXzcnaMzx9j/P7vA0v211gihev
         8gOlKIUt41w9ZeDNfejuc5rAFr8j6pIexKtpJx66UGDQLrOgIps/RHXMlGTmHAGiklYO
         NnouyOV/lkvk2XKotObJNEXaE3wB64FwS8z5n0q88cJfwCoiI9y/zzZWChuVshEPYQ7G
         /cVA==
X-Forwarded-Encrypted: i=1; AJvYcCWr4dD/4//3zCo4FgmDx2gy5YEHF81K4ei5hzMPoyXt51sGlKnatf+zOT4MqSv6pg6Tc1MjiyF9+M5AwQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyteCW6H7MAe2dIrE8l2NcNf8Qxy7n00cU/VVVTGCmrvMzXUQKd
	GNRka+r8dBjlCrVeExmtZ6teOHDgyZMZFWt9P62fx/21pprbg3CqbKq7EQ2uETqAFlPyyI/XSeD
	khjP+dPVYZOyGQyLGXda+O2ZY4uBfLzQZCPusKi6v9YYX0GvD/jf6t1NV9WI/0qrhw7Xi+z0=
X-Gm-Gg: ASbGnctw0/gnMdmPcEvBP/4VEnmITzEbfnmKbBxHGGY5kf51Cqs5+LrczFk3aozqC/x
	BsBI7ClWUDI0/Zr9STUeHi9BalfwyGoMUL7L1rauTkqkzt0RDwTs1/XN5WbbSJoXUD2MXgatpnx
	7V2BF/pG2CxW3l9Xuiin7zwqEP0KNC26FYtJaQ3OS2KMUtQ60tmLI3qWudEBHYt+GEY56fu1EOY
	hTdmSQlOh5RMwD5iBvGb/jeNYxawxsFkRTICA1177rif5+TvtAjLH1m0ZSQ8NXip4CxQ6RBX0Uy
	4r1E9VWRU7RKquXlKZ4V7jzwInW/H3q3RDoGb0nBfwjarU58yRu00AhUbKKGvQCCjLmP1b7bY7H
	1IfjGWx6U2S8ffDMgGRPBwq16jyoxtCYrV5grWWAlAum7KeEWwkpn
X-Received: by 2002:ad4:5b83:0:b0:709:deb2:3dc8 with SMTP id 6a1803df08f44-70d88e96aa9mr17675826d6.17.1755776327015;
        Thu, 21 Aug 2025 04:38:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7jwjG1JMdr3j/LqweySCRNMMJR62FsucFpS7iLp2vys3QoG1tjFvDqJFIxcnvDKur/3ihlg==
X-Received: by 2002:ad4:5b83:0:b0:709:deb2:3dc8 with SMTP id 6a1803df08f44-70d88e96aa9mr17675436d6.17.1755776326298;
        Thu, 21 Aug 2025 04:38:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef369d92sm3098411e87.64.2025.08.21.04.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 04:38:45 -0700 (PDT)
Date: Thu, 21 Aug 2025 14:38:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Drew Fustini <fustini@kernel.org>,
        Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Heiko Stuebner <heiko@sntech.de>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Michal Wilczynski <m.wilczynski@samsung.com>,
        Han Gao <rabenda.cn@gmail.com>, Yao Zi <ziyao@disroot.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [RFC PATCH 5/8] drm/bridge: add a driver for T-Head TH1520 HDMI
 controller
Message-ID: <hkz5zdhy7i6tmmpntvqydck6fnpegpbletfwj6h7mtppkw3qub@bzfvf2vfcudj>
References: <20250814164048.2336043-1-uwu@icenowy.me>
 <20250814164048.2336043-6-uwu@icenowy.me>
 <sp2pdifimqych5zn3mt7pnba3vl25qflgiys76s7dwmyt3jd72@bmwkc7s6p6c4>
 <63b2ac72fe1d15d214e880f223bb3035e177a07b.camel@icenowy.me>
 <F2C43938B17FA1E1+aKLaKQfN1Ax8Blcx@LT-Guozexi>
 <7ad9a700dce9342d720740525626340237eb8d9f.camel@icenowy.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7ad9a700dce9342d720740525626340237eb8d9f.camel@icenowy.me>
X-Authority-Analysis: v=2.4 cv=I4c8hNgg c=1 sm=1 tr=0 ts=68a70548 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=H813rAELB5ahqNAuXgQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: QmuclBUyvFhsQBsevM8RLH0dmMzk9btE
X-Proofpoint-ORIG-GUID: QmuclBUyvFhsQBsevM8RLH0dmMzk9btE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX6S9oMRDCWEzS
 lmj1GkCJB23qA2aAqFN0xHnFzN0ZqDgPuYX80D/iIBwLAc7nWK5MP6lR8bF9OQsSgw0TZ9cLk5R
 eDJPmovla4z8sTPMVI9ZTV3nZmTUGTACJou6dRZv2c6x5Gf6cScqa2xxtVOYboSV/oBeAkf3jwT
 eqw0mstxPRCGGpVyOGEcaxKMCBFjlI1y9mxv02JWaVq70aVntZUyfCiX9H+jnqo9jrSOdrzj+Rs
 S7WNeIyBTSf66ivMAj2Tot9/pEMRiWnt/m5tMETbqd4vWmlSpdYesTG99a+hcEc+k1dB9Pg1eKr
 Ezo3pL+Ix7LBR76wKGD6f5Um6UHPmGKPrC+rOWs7E7XBtCPYJSUeIJd3/yuDoToG6RXXURkQXfR
 R5o1vEjXRRkPugDNgoST2Sgl4XI42Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_043849_505489_3D276D12 
X-CRM114-Status: GOOD (  39.38  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBBdWcgMTgsIDIwMjUgYXQgMDM6NDc6MjhQTSArMDgwMCwgSWNlbm93eSBaaGVuZyB3
cm90ZToKPiDlnKggMjAyNS0wOC0xOOaYn+acn+S4gOeahCAxNTo0NSArMDgwMO+8jFRyb3kgTWl0
Y2hlbGzlhpnpgZPvvJoKPiA+IE9uIFN1biwgQXVnIDE3LCAyMDI1IGF0IDAxOjEwOjQ0QU0gKzA4
MDAsIEljZW5vd3kgWmhlbmcgd3JvdGU6Cj4gPiA+IOWcqCAyMDI1LTA4LTE25pif5pyf5YWt55qE
IDE5OjI0ICswMzAw77yMRG1pdHJ5IEJhcnlzaGtvduWGmemBk++8mgo+ID4gPiA+IE9uIEZyaSwg
QXVnIDE1LCAyMDI1IGF0IDEyOjQwOjQ1QU0gKzA4MDAsIEljZW5vd3kgWmhlbmcgd3JvdGU6Cj4g
PiA+ID4gPiBULUhlYWQgVEgxNTIwIFNvQyBjb250YWlucyBhIFN5bm9wc3lzIERlc2lnbldhcmUg
SERNSQo+ID4gPiA+ID4gY29udHJvbGxlcgo+ID4gPiA+ID4gKHBhaXJlZAo+ID4gPiA+ID4gd2l0
aCBEZXNpZ25XYXJlIEhETUkgVFggUEhZIEdlbjIpIHRoYXQgdGFrZXMgdGhlICJEUCIgb3V0cHV0
Cj4gPiA+ID4gPiBmcm9tCj4gPiA+ID4gPiB0aGUKPiA+ID4gPiA+IGRpc3BsYXkgY29udHJvbGxl
ci4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gQWRkIGEgZHJpdmVyIGZvciB0aGlzIGNvbnRyb2xsZXIg
dXRpbGl6aW5nIHRoZSBjb21tb24KPiA+ID4gPiA+IERlc2lnbldhcmUKPiA+ID4gPiA+IEhETUkK
PiA+ID4gPiA+IGNvZGUgaW4gdGhlIGtlcm5lbC4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gU2lnbmVk
LW9mZi1ieTogSWNlbm93eSBaaGVuZyA8dXd1QGljZW5vd3kubWU+Cj4gPiA+ID4gPiAtLS0KPiA+
ID4gPiA+IMKgTUFJTlRBSU5FUlPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAxICsKPiA+ID4gPiA+IMKgZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS9LY29uZmlnwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAxMCArKwo+ID4gPiA+ID4gwqBk
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL01ha2VmaWxlwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAxICsK
PiA+ID4gPiA+IMKgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aDE1MjAtZHctaGRtaS5jIHwgMTcw
Cj4gPiA+ID4gPiArKysrKysrKysrKysrKysrKysrKysrKysKPiA+ID4gPiA+IMKgNCBmaWxlcyBj
aGFuZ2VkLCAxODIgaW5zZXJ0aW9ucygrKQo+ID4gPiA+ID4gwqBjcmVhdGUgbW9kZSAxMDA2NDQg
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aDE1MjAtZHctaGRtaS5jCj4gPiA+ID4gPiAKPiA+ID4g
PiA+IGRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCj4gPiA+ID4gPiBpbmRl
eCBmZTE2ODQ3N2NhYTQ1Li5lYjg0ZTM2ZGVkNmQ1IDEwMDY0NAo+ID4gPiA+ID4gLS0tIGEvTUFJ
TlRBSU5FUlMKPiA+ID4gPiA+ICsrKyBiL01BSU5UQUlORVJTCj4gPiA+ID4gPiBAQCAtMjE3Mjgs
NiArMjE3MjgsNyBAQAo+ID4gPiA+ID4gRjrCoMKgwqDCoMKgwqBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvcmVzZXQvdGhlYWQsdGgxNTIwLQo+ID4gPiA+ID4gcmVzZXQueWFtbAo+
ID4gPiA+ID4gwqBGOsKgwqDCoMKgwqBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3RoZWFkLwo+ID4gPiA+
ID4gwqBGOsKgwqDCoMKgwqBkcml2ZXJzL2Nsay90aGVhZC9jbGstdGgxNTIwLWFwLmMKPiA+ID4g
PiA+IMKgRjrCoMKgwqDCoMKgZHJpdmVycy9maXJtd2FyZS90aGVhZCx0aDE1MjAtYW9uLmMKPiA+
ID4gPiA+ICtGOsKgwqDCoMKgwqBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RoMTUyMC1kdy1oZG1p
LmMKPiA+ID4gPiA+IMKgRjrCoMKgwqDCoMKgZHJpdmVycy9tYWlsYm94L21haWxib3gtdGgxNTIw
LmMKPiA+ID4gPiA+IMKgRjrCoMKgwqDCoMKgZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9z
dG1tYWMvZHdtYWMtdGhlYWQuYwo+ID4gPiA+ID4gwqBGOsKgwqDCoMKgwqBkcml2ZXJzL3BpbmN0
cmwvcGluY3RybC10aDE1MjAuYwo+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2UvS2NvbmZpZwo+ID4gPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL0tjb25m
aWcKPiA+ID4gPiA+IGluZGV4IGI5ZTBjYTg1MjI2YTYuLmY3NWU2YWQwNDE3OWYgMTAwNjQ0Cj4g
PiA+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL0tjb25maWcKPiA+ID4gPiA+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvS2NvbmZpZwo+ID4gPiA+ID4gQEAgLTMyMiw2ICsz
MjIsMTYgQEAgY29uZmlnIERSTV9USElORV9USEM2M0xWRDEwMjQKPiA+ID4gPiA+IMKgwqDCoMKg
wqDCoMKgwqBoZWxwCj4gPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqAgVGhpbmUgVEhDNjNMVkQx
MDI0IExWRFMvcGFyYWxsZWwgY29udmVydGVyIGRyaXZlci4KPiA+ID4gPiA+IMKgCj4gPiA+ID4g
PiArY29uZmlnIERSTV9USEVBRF9USDE1MjBfRFdfSERNSQo+ID4gPiA+ID4gK8KgwqDCoMKgwqDC
oMKgdHJpc3RhdGUgIlQtSGVhZCBUSDE1MjAgRGVzaWduV2FyZSBIRE1JIGJyaWRnZSIKPiA+ID4g
PiA+ICvCoMKgwqDCoMKgwqDCoGRlcGVuZHMgb24gT0YKPiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDC
oGRlcGVuZHMgb24gQ09NTU9OX0NMSwo+ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgZGVwZW5kcyBv
biBBUkNIX1RIRUFEIHx8IENPTVBJTEVfVEVTVAo+ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgc2Vs
ZWN0IERSTV9EV19IRE1JCj4gPiA+ID4gPiArwqDCoMKgwqDCoMKgwqBoZWxwCj4gPiA+ID4gPiAr
wqDCoMKgwqDCoMKgwqDCoCBDaG9vc2UgdGhpcyB0byBlbmFibGUgc3VwcG9ydCBmb3IgdGhlIGlu
dGVybmFsIEhETUkKPiA+ID4gPiA+IGJyaWRnZSBmb3VuZAo+ID4gPiA+ID4gK8KgwqDCoMKgwqDC
oMKgwqAgb24gdGhlIFQtSGVhZCBUSDE1MjAgU29DLgo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gwqBj
b25maWcgRFJNX1RPU0hJQkFfVEMzNTg3NjIKPiA+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqB0cmlz
dGF0ZSAiVEMzNTg3NjIgRFNJL0RQSSBicmlkZ2UiCj4gPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKg
ZGVwZW5kcyBvbiBPRgo+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2UvTWFrZWZpbGUKPiA+ID4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9NYWtlZmlsZQo+
ID4gPiA+ID4gaW5kZXggMjQ1ZThhMjdlM2ZjNS4uNDIxZTQ0NWZmMWNkOSAxMDA2NDQKPiA+ID4g
PiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvTWFrZWZpbGUKPiA+ID4gPiA+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvTWFrZWZpbGUKPiA+ID4gPiA+IEBAIC0yNyw2ICsyNyw3
IEBAIG9iai0kKENPTkZJR19EUk1fU0lMX1NJSTg2MjApICs9IHNpbC0KPiA+ID4gPiA+IHNpaTg2
MjAubwo+ID4gPiA+ID4gwqBvYmotJChDT05GSUdfRFJNX1NJSTkwMlgpICs9IHNpaTkwMngubwo+
ID4gPiA+ID4gwqBvYmotJChDT05GSUdfRFJNX1NJSTkyMzQpICs9IHNpaTkyMzQubwo+ID4gPiA+
ID4gwqBvYmotJChDT05GSUdfRFJNX1NJTVBMRV9CUklER0UpICs9IHNpbXBsZS1icmlkZ2Uubwo+
ID4gPiA+ID4gK29iai0kKENPTkZJR19EUk1fVEhFQURfVEgxNTIwX0RXX0hETUkpICs9IHRoMTUy
MC1kdy1oZG1pLm8KPiA+ID4gPiA+IMKgb2JqLSQoQ09ORklHX0RSTV9USElORV9USEM2M0xWRDEw
MjQpICs9IHRoYzYzbHZkMTAyNC5vCj4gPiA+ID4gPiDCoG9iai0kKENPTkZJR19EUk1fVE9TSElC
QV9UQzM1ODc2MikgKz0gdGMzNTg3NjIubwo+ID4gPiA+ID4gwqBvYmotJChDT05GSUdfRFJNX1RP
U0hJQkFfVEMzNTg3NjQpICs9IHRjMzU4NzY0Lm8KPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYnJpZGdlL3RoMTUyMC1kdy1oZG1pLmMKPiA+ID4gPiA+IGIvZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS90aDE1MjAtZHctaGRtaS5jCj4gPiA+ID4gPiBuZXcgZmlsZSBtb2RlIDEw
MDY0NAo+ID4gPiA+ID4gaW5kZXggMDAwMDAwMDAwMDAwMC4uZjhkZGRmM2NiMGNjYQo+ID4gPiA+
ID4gLS0tIC9kZXYvbnVsbAo+ID4gPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90
aDE1MjAtZHctaGRtaS5jCj4gPiA+ID4gPiBAQCAtMCwwICsxLDE3MCBAQAo+ID4gPiA+ID4gKy8v
IFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wKwo+ID4gPiA+ID4gKy8qCj4gPiA+ID4g
PiArICogQ29weXJpZ2h0IChDKSAyMDI1IEljZW5vd3kgWmhlbmcgPHV3dUBpY2Vub3d5Lm1lPgo+
ID4gPiA+ID4gKyAqCj4gPiA+ID4gPiArICogQmFzZWQgb24gcmNhcl9kd19oZG1pLmMsIHdoaWNo
IGlzOgo+ID4gPiA+ID4gKyAqwqDCoCBDb3B5cmlnaHQgKEMpIDIwMTYgUmVuZXNhcyBFbGVjdHJv
bmljcyBDb3Jwb3JhdGlvbgo+ID4gPiA+ID4gKyAqIEJhc2VkIG9uIGlteDhtcC1oZG1pLXR4LmMs
IHdoaWNoIGlzOgo+ID4gPiA+ID4gKyAqwqDCoCBDb3B5cmlnaHQgKEMpIDIwMjIgUGVuZ3V0cm9u
aXgsIEx1Y2FzIFN0YWNoCj4gPiA+ID4gPiA8a2VybmVsQHBlbmd1dHJvbml4LmRlPgo+ID4gPiA+
ID4gKyAqLwo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gKyNpbmNsdWRlIDxsaW51eC9jbGsuaD4KPiA+
ID4gPiA+ICsjaW5jbHVkZSA8bGludXgvbW9kX2RldmljZXRhYmxlLmg+Cj4gPiA+ID4gPiArI2lu
Y2x1ZGUgPGxpbnV4L21vZHVsZS5oPgo+ID4gPiA+ID4gKyNpbmNsdWRlIDxsaW51eC9wbGF0Zm9y
bV9kZXZpY2UuaD4KPiA+ID4gPiA+ICsjaW5jbHVkZSA8bGludXgvcmVzZXQuaD4KPiA+ID4gPiA+
ICsKPiA+ID4gPiA+ICsjaW5jbHVkZSA8ZHJtL2JyaWRnZS9kd19oZG1pLmg+Cj4gPiA+ID4gPiAr
I2luY2x1ZGUgPGRybS9kcm1fbW9kZXMuaD4KPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICsjZGVmaW5l
IFRIMTUyMF9IRE1JX1BIWV9PUE1PREVfUExMQ0ZHwqDCoDB4MDbCoMKgwqDCoC8qIE1vZGUgb2YK
PiA+ID4gPiA+IG9wZXJhdGlvbiBhbmQgUExMIGRpdmlkZXJzICovCj4gPiA+ID4gPiArI2RlZmlu
ZSBUSDE1MjBfSERNSV9QSFlfQ0tTWU1UWENUUkzCoMKgwqDCoDB4MDnCoMKgwqDCoC8qIENsb2Nr
IFN5bWJvbAo+ID4gPiA+ID4gYW5kCj4gPiA+ID4gPiBUcmFuc21pdHRlciBDb250cm9sIFJlZ2lz
dGVyICovCj4gPiA+ID4gPiArI2RlZmluZSBUSDE1MjBfSERNSV9QSFlfVkxFVkNUUkzCoMKgwqDC
oMKgwqDCoDB4MGXCoMKgwqDCoC8qIFZvbHRhZ2UKPiA+ID4gPiA+IExldmVsCj4gPiA+ID4gPiBD
b250cm9sIFJlZ2lzdGVyICovCj4gPiA+ID4gPiArI2RlZmluZSBUSDE1MjBfSERNSV9QSFlfUExM
Q1VSUkdNUENUUkzCoDB4MTDCoMKgwqDCoC8qIFBMTCBjdXJyZW50Cj4gPiA+ID4gPiBhbmQKPiA+
ID4gPiA+IEdtcCAoY29uZHVjdGFuY2UpICovCj4gPiA+ID4gPiArI2RlZmluZSBUSDE1MjBfSERN
SV9QSFlfUExMRElWQ1RSTMKgwqDCoMKgwqAweDExwqDCoMKgwqAvKiBQTEwgZGl2aWRlcnMKPiA+
ID4gPiA+ICovCj4gPiA+ID4gPiArI2RlZmluZSBUSDE1MjBfSERNSV9QSFlfVFhURVJNwqDCoMKg
wqDCoMKgwqDCoMKgMHgxOcKgwqDCoMKgLyogVHJhbnNtaXNzaW9uCj4gPiA+ID4gPiBUZXJtaW5h
dGlvbiBSZWdpc3RlciAqLwo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gK3N0cnVjdCB0aDE1MjBfaGRt
aV9waHlfcGFyYW1zIHsKPiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoHVuc2lnbmVkIGxvbmcgbXBp
eGVsY2xvY2s7Cj4gPiA+ID4gPiArwqDCoMKgwqDCoMKgwqB1MTYgb3Btb2RlX3BsbGNmZzsKPiA+
ID4gPiA+ICvCoMKgwqDCoMKgwqDCoHUxNiBwbGxjdXJyZ21wY3RybDsKPiA+ID4gPiA+ICvCoMKg
wqDCoMKgwqDCoHUxNiBwbGxkaXZjdHJsOwo+ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgdTE2IGNr
c3ltdHhjdHJsOwo+ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgdTE2IHZsZXZjdHJsOwo+ID4gPiA+
ID4gK8KgwqDCoMKgwqDCoMKgdTE2IHR4dGVybTsKPiA+ID4gPiA+ICt9Owo+ID4gPiA+ID4gKwo+
ID4gPiA+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgdGgxNTIwX2hkbWlfcGh5X3BhcmFtcwo+ID4g
PiA+ID4gdGgxNTIwX2hkbWlfcGh5X3BhcmFtc1tdID0gewo+ID4gPiA+ID4gK8KgwqDCoMKgwqDC
oMKgeyAzNTUwMDAwMCzCoCAweDAwMDMsIDB4MDI4MywgMHgwNjI4LCAweDgwODgsIDB4MDFhMCwK
PiA+ID4gPiA+IDB4MDAwNwo+ID4gPiA+ID4gfSwKPiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoHsg
NDQ5MDAwMDAswqAgMHgwMDAzLCAweDAyODUsIDB4MDIyOCwgMHg4MDg4LCAweDAxYTAsCj4gPiA+
ID4gPiAweDAwMDcKPiA+ID4gPiA+IH0sCj4gPiA+ID4gPiArwqDCoMKgwqDCoMKgwqB7IDcxMDAw
MDAwLMKgIDB4MDAwMiwgMHgxMTgzLCAweDA2MTQsIDB4ODA4OCwgMHgwMWEwLAo+ID4gPiA+ID4g
MHgwMDA3Cj4gPiA+ID4gPiB9LAo+ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgeyA5MDAwMDAwMCzC
oCAweDAwMDIsIDB4MTE0MiwgMHgwMjE0LCAweDgwODgsIDB4MDFhMCwKPiA+ID4gPiA+IDB4MDAw
Nwo+ID4gPiA+ID4gfSwKPiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoHsgMTIxNzUwMDAwLCAweDAw
MDEsIDB4MjBjMCwgMHgwNjBhLCAweDgwODgsIDB4MDFhMCwKPiA+ID4gPiA+IDB4MDAwNwo+ID4g
PiA+ID4gfSwKPiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoHsgMTY1MDAwMDAwLCAweDAwMDEsIDB4
MjA4MCwgMHgwMjBhLCAweDgwODgsIDB4MDFhMCwKPiA+ID4gPiA+IDB4MDAwNwo+ID4gPiA+ID4g
fSwKPiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoHsgMTk4MDAwMDAwLCAweDAwMDAsIDB4MzA0MCwg
MHgwNjA1LCAweDgzYzgsIDB4MDEyMCwKPiA+ID4gPiA+IDB4MDAwNAo+ID4gPiA+ID4gfSwKPiA+
ID4gPiA+ICvCoMKgwqDCoMKgwqDCoHsgMjk3MDAwMDAwLCAweDAwMDAsIDB4MzA0MSwgMHgwMjA1
LCAweDgxZGMsIDB4MDIwMCwKPiA+ID4gPiA+IDB4MDAwNQo+ID4gPiA+ID4gfSwKPiA+ID4gPiA+
ICvCoMKgwqDCoMKgwqDCoHsgMzcxMjUwMDAwLCAweDA2NDAsIDB4MzA0MSwgMHgwMjA1LCAweDgw
ZjYsIDB4MDE0MCwKPiA+ID4gPiA+IDB4MDAwMAo+ID4gPiA+ID4gfSwKPiA+ID4gPiA+ICvCoMKg
wqDCoMKgwqDCoHsgNDk1MDAwMDAwLCAweDA2NDAsIDB4MzA4MCwgMHgwMDA1LCAweDgwZjYsIDB4
MDE0MCwKPiA+ID4gPiA+IDB4MDAwMAo+ID4gPiA+ID4gfSwKPiA+ID4gPiA+ICvCoMKgwqDCoMKg
wqDCoHsgNTk0MDAwMDAwLCAweDA2NDAsIDB4MzA4MCwgMHgwMDA1LCAweDgwZmEsIDB4MDFlMCwK
PiA+ID4gPiA+IDB4MDAwNAo+ID4gPiA+ID4gfSwKPiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoHsg
fjBVTCzCoMKgwqDCoMKgIDB4MDAwMCwgMHgwMDAwLCAweDAwMDAsIDB4MDAwMCwgMHgwMDAwLAo+
ID4gPiA+ID4gMHgwMDAwCj4gPiA+ID4gPiB9Cj4gPiA+ID4gPiArfTsKPiA+ID4gPiA+ICsKPiA+
ID4gPiA+ICtzdHJ1Y3QgdGgxNTIwX2hkbWkgewo+ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgc3Ry
dWN0IGR3X2hkbWlfcGxhdF9kYXRhIHBsYXRfZGF0YTsKPiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDC
oHN0cnVjdCBkd19oZG1pICpkd19oZG1pOwo+ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgc3RydWN0
IGNsayAqcGl4Y2xrOwo+ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgc3RydWN0IHJlc2V0X2NvbnRy
b2wgKm1haW5yc3QsICpwcnN0Owo+ID4gPiA+ID4gK307Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiAr
c3RhdGljIGVudW0gZHJtX21vZGVfc3RhdHVzCj4gPiA+ID4gPiArdGgxNTIwX2hkbWlfbW9kZV92
YWxpZChzdHJ1Y3QgZHdfaGRtaSAqaGRtaSwgdm9pZCAqZGF0YSwKPiA+ID4gPiA+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29uc3Qgc3RydWN0IGRybV9kaXNw
bGF5X2luZm8gKmluZm8sCj4gPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2RlKQo+ID4gPiA+
ID4gK3sKPiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoC8qCj4gPiA+ID4gPiArwqDCoMKgwqDCoMKg
wqAgKiBUaGUgbWF4aW11bSBzdXBwb3J0ZWQgY2xvY2sgZnJlcXVlbmN5IGlzIDU5NCBNSHosIGFz
Cj4gPiA+ID4gPiBzaG93biBpbiB0aGUgUEhZCj4gPiA+ID4gPiArwqDCoMKgwqDCoMKgwqAgKiBw
YXJhbWV0ZXJzIHRhYmxlLgo+ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgICovCj4gPiA+ID4gPiAr
wqDCoMKgwqDCoMKgwqBpZiAobW9kZS0+Y2xvY2sgPiA1OTQwMDApCj4gPiA+ID4gPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIE1PREVfQ0xPQ0tfSElHSDsKPiA+ID4gPiAK
PiA+ID4gPiBXZSBzaG91bGQgcmV3cml0ZSBEVyBicmlkZ2UgaW50byBIRE1JIG9wcy4gSXQgd291
bGQgaGVscCB1cyB0bwo+ID4gPiA+IGdldAo+ID4gPiA+IHJpZAo+ID4gPiA+IG9mIHN1Y2ggZnVu
Y3Rpb25zLiBXaXRoIGl0IGluIHBsYWNlIGl0IHdpbGwgYmUgaGFuZGxlZCBieSB0aGUKPiA+ID4g
PiBnZW5lcmljCj4gPiA+ID4gVE1EUyBjbG9jayByYXRlIGNoZWNrLgo+ID4gPiAKPiA+ID4gWWVz
LCBidXQgdGhpcyBtb2RlX3ZhbGlkIGhvb2sgaGVyZSBpcyBwYXJ0IG9mIHRoZSBwcml2YXRlIGlu
dGVyZmFjZQo+ID4gPiBvZgo+ID4gPiBEVyBicmlkZ2UsIGluc3RlYWQgb2YgaW1wbGVtZW50aW5n
IGFueXRoaW5nIGZvciBvdGhlciBwYXJ0cyBvZiBEUk0KPiA+ID4gc3Vic3lzdGVtLgo+ID4gPiAK
PiA+ID4gRXZlbiBpZiB0aGUgVE1EUyBjbG9jayByYXRlIGNoZWNrIGlzIHV0aWxpemVkIGJ5IHRo
ZSBEVyBicmlkZ2UsIHRoZQo+ID4gPiBicmlkZ2UncyBpbnRlcmZhY2Ugc2hvdWxkIGJlIG1vZGlm
aWVkIHRvIGV4cG9zZSBzb21ldGhpbmcgdG8gc2V0Cj4gPiA+IHRoZQo+ID4gPiBtYXhpbXVtIGNs
b2NrIHJhdGUuCj4gPiA+IAo+ID4gPiA+IAo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gK8KgwqDCoMKg
wqDCoMKgcmV0dXJuIE1PREVfT0s7Cj4gPiA+ID4gPiArfQo+ID4gPiA+ID4gKwo+ID4gPiA+ID4g
K3N0YXRpYyBpbnQgdGgxNTIwX2hkbWlfcGh5X2NvbmZpZ3VyZShzdHJ1Y3QgZHdfaGRtaSAqaGRt
aSwKPiA+ID4gPiA+IHZvaWQKPiA+ID4gPiA+ICpkYXRhLAo+ID4gPiA+ID4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgdW5zaWduZWQgbG9uZyBtcGl4ZWxjbG9jaykKPiA+ID4gPiA+ICt7Cj4gPiA+ID4gPiArwqDC
oMKgwqDCoMKgwqBjb25zdCBzdHJ1Y3QgdGgxNTIwX2hkbWlfcGh5X3BhcmFtcyAqcGFyYW1zID0K
PiA+ID4gPiA+IHRoMTUyMF9oZG1pX3BoeV9wYXJhbXM7Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiAr
wqDCoMKgwqDCoMKgwqBmb3IgKDsgcGFyYW1zLT5tcGl4ZWxjbG9jayAhPSB+MFVMOyArK3BhcmFt
cykgewo+ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIChtcGl4ZWxj
bG9jayA8PSBwYXJhbXMtPm1waXhlbGNsb2NrKQo+ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBicmVhazsKPiA+ID4gPiAKPiA+ID4gPiBmb3Ig
KC4uLikgewo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqBpZiAobXBpeGVsY2xvY2sgPD0gcGFyYW1z
LT5tcGl4ZWxjbG9jaykKPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJl
dHVybiB0aDE1MjBfcHJvZ3JhbV9waHkoKTsKPiA+ID4gCj4gPiA+IFRoZXJlJ3Mgbm8gc3VjaCBh
IGZ1bmN0aW9uIGhlcmUsIGFuZCB0aGlzIGNoZWNrIGlzbid0IHVzZWQgZm9yCj4gPiA+IGFub3Ro
ZXIKPiA+ID4gdGltZSwgc28gaGF2aW5nIHRoZSBtYXRjaGluZyBjb2RlIGFuZCBwcm9ncmFtbWlu
ZyBjb2RlIGV4dHJhY3RlZAo+ID4gPiBvdXQKPiA+ID4gY2FuIGhlbHAgbm90aGluZy4KPiA+IEkg
dGhpbmsgRG1pdHJ5IG1lYW50IHRoYXQgdGhlIGZvbGxvd2luZyBjb2RlIHNob3VsZCBiZSBtb3Zl
ZCBpbnRvCj4gPiBhIG5ldyBmdW5jdGlvbiwgdGgxNTIwX3Byb2dyYW1fcGh5KCkuwqAgCj4gPiAK
PiA+IFRoaXMgbWFrZXMgdGhlIGNvZGUgY2xlYW5lciBhbmQgYWxzbyBhdm9pZHMgb25lIGV4dHJh
IGlmIGNoZWNrLgo+IAo+IEFzIHRoZXJlJ3Mgbm8gY29kZSByZXVzZSwgaXQgZG9lcyBub3QgbWFr
ZSBjb2RlIGNsZWFuZXIuCgpJdCByZW1vdmVzIG5lY2Vzc2l0eSBmb3IgdGhlIGV4dHJhIH4wVUwg
ZW50cnkgaW4gdGhlIGFycmF5IGFuZCByZW1vdmVzCnRoZSBwb3N0LWxvb3AgY2hlY2sgd2hldGhl
ciB3ZSBmb3VuZCBhbiBlbnRyeSBvciBub3QuCgotLSAKV2l0aCBiZXN0IHdpc2hlcwpEbWl0cnkK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
