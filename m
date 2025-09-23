Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44FCBCAC5AA
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Sep 2025 02:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3w1sFYNrYYCT8TxWfVDw/MRFMPmTS3S4p0/bkT/jEJw=; b=JF2JXLG5YwbKE4
	RamZUFgmgwm029wNeJfEakzgKMMSx1J9cA18dcj53/+KeEHx+vnpyetkZkjroG64mxXgKlHTmWlFj
	hmh0BjirSwuUKRg4ad8b23r8aBehM3mY4ybWdNkR8j7mpXDPVBU3QxSvY2mXVJmj8l3U5ApuL0Zi7
	i1/orMcLb2yy7DGikFxVpaKIN+7LAbLZ440lGycueWAXHjtflDQPBcnB3gynHbNCbpSBq94NpDOQg
	SoyuT4Xq1/TAzzvcfYho1R/s240VQelxj3RTRaalqgnTUTc5bW/Vm1VTX6E/AavlKGvUwPkNQqUhI
	W76epsDpcdX44Q8XW91A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0sg2-0000000C8OI-2vYt;
	Tue, 23 Sep 2025 02:22:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0sg0-0000000C8NO-1lR5
	for linux-riscv@lists.infradead.org;
	Tue, 23 Sep 2025 02:22:45 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58N1QhsY002151
	for <linux-riscv@lists.infradead.org>; Tue, 23 Sep 2025 02:22:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KYZdiDOC5bv4MOoPW35JMcR2jYyqaiNntVfeN1yqhgg=; b=Dva4qX74c4VcO2Z1
	MwUph+vRGW8LYXbbTJHY/ay2/UDlewSudstSxvlrbo2R0ODnnANAAR9krUH0LjMJ
	qrRf7LxQFpOUGx4B5t7019JTOI2bNwrPL8V0RSH68W+2CZVcB1tPC2COxSybdhmy
	LQzxHEHqE5/v9Tn8BvDH8o0ITdd7DEYc3FuNQjXT/gx4GzVpk0eJaIX9iVVMMmis
	Z4jw7XdWU28r73v1eyrukNOJGhR3XXTXAWrIAkyN9bfU+CF8gLcwJ8VCgqIPn3Fc
	EGPJWKXFmBEzXQr8Me7Hjb2dicbpjfy0yNEKWdMyu+sx1828FMnxYJ5QNsYiVppZ
	zQ/b4Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bhvjr3xf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 23 Sep 2025 02:22:43 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-79e48b76f68so89593056d6.3
        for <linux-riscv@lists.infradead.org>; Mon, 22 Sep 2025 19:22:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758594162; x=1759198962;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KYZdiDOC5bv4MOoPW35JMcR2jYyqaiNntVfeN1yqhgg=;
        b=gofPz7YDugc/Tg8IyjdFnhp9fpdzyC9hfQgt6bnaR7tvaikBf4+HffYp5un98UxrHf
         pPzFHbRhvFGjkHyOpVyl9hz4X07S5mRLg0oZLOzjmPcpGHtgPGoRO/3OQtFDqPPy8918
         Blf22jdhmAt33sXj9gjcYHIQxTSzg6o7exnrBgSycAASxaHvvcdC+M+gh23BXARKsR6K
         EuYx8Eoe6EOvFN2BwNDf1veiN28Iyby+8LTtn4r99nQyyZHTmRUTrvJWz+JHtUe0XVEq
         uD68mRsNjIzkA8YiOtd7aFo+2Tghyx0xgUC0Qr6la6aIlq1MJH+1EFx2Wjzhs2z8w5kI
         vTtQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/iNJKV1AD8CWhcmTrE3wLk5AP4EEcYA+55sasFFklml2+G9even//xz8DqbSO8gajgn2YZZIbXLmjXQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzqtOZW7s7xYBkSdZHY2nrwgahI4eRaIh8l01+49GGi68imAAYy
	m6zXLPMAoaW5FtfTVAp1IbUw0cEIu4ouU6FSvI2SrK4AHNczqTEIiraN4UhHwPy76lcwKy6egIh
	kc1zdSspE7EnaHlHYiVyKZgcuWg1ZGEi33G+zYPPpfzpUgl7OoUimmJn0HVuh9JUUbPD4gds=
X-Gm-Gg: ASbGncs1IVYUFTZgKZQDCNQ5jhDfTjPPKTLvnMqXC3OY164KlQzMKP8FikWii2KzTVW
	xjJ47i7kO8cv35PSnlhe2GU+s9hQTNzXo2MpmvnHBBk1WuV4xtwk16KG2Ad7dZn6ecEuIzkp2t5
	UzpgYQkdVpT9MrqoIY/Xcs/KxLrlFpZt2f31MH+TAtq1KwJqsdLpjfFzvgnUJYPrDBtLlrSEcLr
	Xt3MS0S4qz8G7n76RCDenUktWVhsxUtGayKIPDEiU6xc2jkFjpFSo4fbcccdOOa0+rcy/xD6gwF
	6MfEbc9KB4Z1rqtesqf0CuTcdG0ULiJfN0uWK4gSfBu1h0TJimMc2Jl3LWWRVA1p03U6SYqzUIS
	23GwGh0NvtGZvlSLBg4SfGmAeDP5vsE/dCR5HKwjfAVYdXoXX3tzz
X-Received: by 2002:a05:6214:b6e:b0:781:a369:ef8c with SMTP id 6a1803df08f44-7e7037282f6mr11557226d6.16.1758594162169;
        Mon, 22 Sep 2025 19:22:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGMFcPFMs9tf/BLVuoml4neszEVGYIRwTOalLcM6zhPAy5PO9HwGdTChfgqLduK9x1pWRJPw==
X-Received: by 2002:a05:6214:b6e:b0:781:a369:ef8c with SMTP id 6a1803df08f44-7e7037282f6mr11557046d6.16.1758594161644;
        Mon, 22 Sep 2025 19:22:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-578a957396esm3767822e87.107.2025.09.22.19.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 19:22:40 -0700 (PDT)
Date: Tue, 23 Sep 2025 05:22:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
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
Subject: Re: [PATCH v2 5/8] drm/bridge: add a driver for T-Head TH1520 HDMI
 controller
Message-ID: <gqsj4ikfwqpt26axmz2omvi36xavyxjvslhepsr2czvnjse7in@5yqzg6o7r3mh>
References: <20250921083446.790374-1-uwu@icenowy.me>
 <20250921083446.790374-6-uwu@icenowy.me>
 <yy57lh5rmbubtqscpquoy3np65tm465cqbtmjw5pqiwxjnecsh@d4qbxe3d4sc5>
 <d8240b212b9557878a12ee835a1c8b4840236580.camel@icenowy.me>
 <201a9bb7732d51f4807b3b3644e91333f1b746d6.camel@icenowy.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <201a9bb7732d51f4807b3b3644e91333f1b746d6.camel@icenowy.me>
X-Proofpoint-ORIG-GUID: PYp3Xr-qoae3MujH3ryQH2WEEIc9hO53
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAxMSBTYWx0ZWRfX9jgkboTJZhl8
 H2rcYyzA7UeQfRSMrxOA7mT5uAfABT7EXQPEsXybKT8gj6xCfAyEppL31hn+zdlaO0vh0JrzSOI
 6Aw4v3avNQtD8fj7Gan61o12+E3whXfwb2rGvgABjnwa/HPwPRw1yHzjl43uPZ1l5YiaII/gjvB
 LQB/PE/feeu3LbX+JIRcvEhCua558cyBfkz7YqRr7qRMZLy1i2Zvsif8YIalkpFe1FVCd6IL8v9
 VIMEAdzcgaYdlX+YgwHvXZHOcJwHuqAVkbV9Q2GUjSXLukerlO38XMtLfIgityaXOi2m9TBcZ9R
 lonhKndALBbIRtr2yRDSAQiYyr4yU1NJ3NScxu5bXQj/njqkHm03J3heM8F/fsuOWG+7OR/ISY6
 eEnr9erR
X-Proofpoint-GUID: PYp3Xr-qoae3MujH3ryQH2WEEIc9hO53
X-Authority-Analysis: v=2.4 cv=Csq/cm4D c=1 sm=1 tr=0 ts=68d20473 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=YJUo16DlFZw7r3sCiXcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_01,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230011
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_192244_474459_50B12D43 
X-CRM114-Status: GOOD (  40.99  )
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

T24gVHVlLCBTZXAgMjMsIDIwMjUgYXQgMDk6MzA6MDVBTSArMDgwMCwgSWNlbm93eSBaaGVuZyB3
cm90ZToKPiDlnKggMjAyNS0wOS0yM+aYn+acn+S6jOeahCAwOToxMSArMDgwMO+8jEljZW5vd3kg
WmhlbmflhpnpgZPvvJoKPiA+IOWcqCAyMDI1LTA5LTIz5pif5pyf5LqM55qEIDA0OjAwICswMzAw
77yMRG1pdHJ5IEJhcnlzaGtvduWGmemBk++8mgo+ID4gPiBPbiBTdW4sIFNlcCAyMSwgMjAyNSBh
dCAwNDozNDo0M1BNICswODAwLCBJY2Vub3d5IFpoZW5nIHdyb3RlOgo+ID4gPiA+IFQtSGVhZCBU
SDE1MjAgU29DIGNvbnRhaW5zIGEgU3lub3BzeXMgRGVzaWduV2FyZSBIRE1JIGNvbnRyb2xsZXIK
PiA+ID4gPiAocGFpcmVkCj4gPiA+ID4gd2l0aCBEZXNpZ25XYXJlIEhETUkgVFggUEhZIEdlbjIp
IHRoYXQgdGFrZXMgdGhlICJEUCIgb3V0cHV0IGZyb20KPiA+ID4gPiB0aGUKPiA+ID4gPiBkaXNw
bGF5IGNvbnRyb2xsZXIuCj4gPiA+ID4gCj4gPiA+ID4gQWRkIGEgZHJpdmVyIGZvciB0aGlzIGNv
bnRyb2xsZXIgdXRpbGl6aW5nIHRoZSBjb21tb24gRGVzaWduV2FyZQo+ID4gPiA+IEhETUkKPiA+
ID4gPiBjb2RlIGluIHRoZSBrZXJuZWwuCj4gPiA+ID4gCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTog
SWNlbm93eSBaaGVuZyA8dXd1QGljZW5vd3kubWU+Cj4gPiA+ID4gLS0tCj4gPiA+ID4gQ2hhbmdl
cyBpbiB2MjoKPiA+ID4gPiAtIENyZWF0ZWQgYSBuZXcgZnVuY3Rpb24gdG8gc2V0IFBIWSBwYXJh
bWV0ZXJzIGFuZCByZWZhY3RvcmVkIHRoZQo+ID4gPiA+IMKgIGNvbnRyb2wgZmxvdyBvZiB0aGUg
Y29uZmlndXJlX3BoeSBjYWxsYmFjay4KPiA+ID4gPiAKPiA+ID4gPiDCoE1BSU5UQUlORVJTwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKg
wqAgMSArCj4gPiA+ID4gwqBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL0tjb25maWfCoMKgwqDCoMKg
wqDCoMKgwqAgfMKgIDEwICsrCj4gPiA+ID4gwqBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL01ha2Vm
aWxlwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAxICsKPiA+ID4gPiDCoGRyaXZlcnMvZ3B1L2RybS9i
cmlkZ2UvdGgxNTIwLWR3LWhkbWkuYyB8IDE3Mwo+ID4gPiA+ICsrKysrKysrKysrKysrKysrKysr
KysrKwo+ID4gPiA+IMKgNCBmaWxlcyBjaGFuZ2VkLCAxODUgaW5zZXJ0aW9ucygrKQo+ID4gPiA+
IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGgxNTIwLWR3LWhk
bWkuYwo+ID4gPiA+IAo+ID4gPiA+IGRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlO
RVJTCj4gPiA+ID4gaW5kZXggZjYyMDY5NjNlZmJmMC4uOThhZjlkZDM2NjRmNSAxMDA2NDQKPiA+
ID4gPiAtLS0gYS9NQUlOVEFJTkVSUwo+ID4gPiA+ICsrKyBiL01BSU5UQUlORVJTCj4gPiA+ID4g
QEAgLTIxNzU5LDYgKzIxNzU5LDcgQEAKPiA+ID4gPiBGOsKgwqDCoMKgwqDCoERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9yZXNldC90aGVhZCx0aDE1MjAtCj4gPiA+ID4gcmVzZXQu
eWFtbAo+ID4gPiA+IMKgRjrCoMKgwqDCoMKgYXJjaC9yaXNjdi9ib290L2R0cy90aGVhZC8KPiA+
ID4gPiDCoEY6wqDCoMKgwqDCoGRyaXZlcnMvY2xrL3RoZWFkL2Nsay10aDE1MjAtYXAuYwo+ID4g
PiA+IMKgRjrCoMKgwqDCoMKgZHJpdmVycy9maXJtd2FyZS90aGVhZCx0aDE1MjAtYW9uLmMKPiA+
ID4gPiArRjrCoMKgwqDCoMKgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aDE1MjAtZHctaGRtaS5j
Cj4gPiA+ID4gwqBGOsKgwqDCoMKgwqBkcml2ZXJzL21haWxib3gvbWFpbGJveC10aDE1MjAuYwo+
ID4gPiA+IMKgRjrCoMKgwqDCoMKgZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMv
ZHdtYWMtdGhlYWQuYwo+ID4gPiA+IMKgRjrCoMKgwqDCoMKgZHJpdmVycy9waW5jdHJsL3BpbmN0
cmwtdGgxNTIwLmMKPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9L
Y29uZmlnCj4gPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL0tjb25maWcKPiA+ID4gPiBp
bmRleCBiOWUwY2E4NTIyNmE2Li5mNzVlNmFkMDQxNzlmIDEwMDY0NAo+ID4gPiA+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9icmlkZ2UvS2NvbmZpZwo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2UvS2NvbmZpZwo+ID4gPiA+IEBAIC0zMjIsNiArMzIyLDE2IEBAIGNvbmZpZyBEUk1f
VEhJTkVfVEhDNjNMVkQxMDI0Cj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoGhlbHAKPiA+ID4gPiDC
oMKgwqDCoMKgwqDCoMKgwqAgVGhpbmUgVEhDNjNMVkQxMDI0IExWRFMvcGFyYWxsZWwgY29udmVy
dGVyIGRyaXZlci4KPiA+ID4gPiDCoAo+ID4gPiA+ICtjb25maWcgRFJNX1RIRUFEX1RIMTUyMF9E
V19IRE1JCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgdHJpc3RhdGUgIlQtSGVhZCBUSDE1MjAgRGVz
aWduV2FyZSBIRE1JIGJyaWRnZSIKPiA+ID4gPiArwqDCoMKgwqDCoMKgwqBkZXBlbmRzIG9uIE9G
Cj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgZGVwZW5kcyBvbiBDT01NT05fQ0xLCj4gPiA+ID4gK8Kg
wqDCoMKgwqDCoMKgZGVwZW5kcyBvbiBBUkNIX1RIRUFEIHx8IENPTVBJTEVfVEVTVAo+ID4gPiA+
ICvCoMKgwqDCoMKgwqDCoHNlbGVjdCBEUk1fRFdfSERNSQo+ID4gPiA+ICvCoMKgwqDCoMKgwqDC
oGhlbHAKPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoCBDaG9vc2UgdGhpcyB0byBlbmFibGUgc3Vw
cG9ydCBmb3IgdGhlIGludGVybmFsIEhETUkKPiA+ID4gPiBicmlkZ2UgZm91bmQKPiA+ID4gPiAr
wqDCoMKgwqDCoMKgwqDCoCBvbiB0aGUgVC1IZWFkIFRIMTUyMCBTb0MuCj4gPiA+ID4gKwo+ID4g
PiA+IMKgY29uZmlnIERSTV9UT1NISUJBX1RDMzU4NzYyCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDC
oHRyaXN0YXRlICJUQzM1ODc2MiBEU0kvRFBJIGJyaWRnZSIKPiA+ID4gPiDCoMKgwqDCoMKgwqDC
oMKgZGVwZW5kcyBvbiBPRgo+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL01ha2VmaWxlCj4gPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL01ha2VmaWxlCj4g
PiA+ID4gaW5kZXggMjQ1ZThhMjdlM2ZjNS4uNDIxZTQ0NWZmMWNkOSAxMDA2NDQKPiA+ID4gPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL01ha2VmaWxlCj4gPiA+ID4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2JyaWRnZS9NYWtlZmlsZQo+ID4gPiA+IEBAIC0yNyw2ICsyNyw3IEBAIG9iai0k
KENPTkZJR19EUk1fU0lMX1NJSTg2MjApICs9IHNpbC1zaWk4NjIwLm8KPiA+ID4gPiDCoG9iai0k
KENPTkZJR19EUk1fU0lJOTAyWCkgKz0gc2lpOTAyeC5vCj4gPiA+ID4gwqBvYmotJChDT05GSUdf
RFJNX1NJSTkyMzQpICs9IHNpaTkyMzQubwo+ID4gPiA+IMKgb2JqLSQoQ09ORklHX0RSTV9TSU1Q
TEVfQlJJREdFKSArPSBzaW1wbGUtYnJpZGdlLm8KPiA+ID4gPiArb2JqLSQoQ09ORklHX0RSTV9U
SEVBRF9USDE1MjBfRFdfSERNSSkgKz0gdGgxNTIwLWR3LWhkbWkubwo+ID4gPiA+IMKgb2JqLSQo
Q09ORklHX0RSTV9USElORV9USEM2M0xWRDEwMjQpICs9IHRoYzYzbHZkMTAyNC5vCj4gPiA+ID4g
wqBvYmotJChDT05GSUdfRFJNX1RPU0hJQkFfVEMzNTg3NjIpICs9IHRjMzU4NzYyLm8KPiA+ID4g
PiDCoG9iai0kKENPTkZJR19EUk1fVE9TSElCQV9UQzM1ODc2NCkgKz0gdGMzNTg3NjQubwo+ID4g
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RoMTUyMC1kdy1oZG1pLmMK
PiA+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGgxNTIwLWR3LWhkbWkuYwo+ID4gPiA+
IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiA+ID4gaW5kZXggMDAwMDAwMDAwMDAwMC4uZWZiMjdk
MzdmZjY1Mgo+ID4gPiA+IC0tLSAvZGV2L251bGwKPiA+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL3RoMTUyMC1kdy1oZG1pLmMKPiA+ID4gPiBAQCAtMCwwICsxLDE3MyBAQAo+ID4g
PiA+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCsKPiA+ID4gPiArLyoKPiA+
ID4gPiArICogQ29weXJpZ2h0IChDKSAyMDI1IEljZW5vd3kgWmhlbmcgPHV3dUBpY2Vub3d5Lm1l
Pgo+ID4gPiA+ICsgKgo+ID4gPiA+ICsgKiBCYXNlZCBvbiByY2FyX2R3X2hkbWkuYywgd2hpY2gg
aXM6Cj4gPiA+ID4gKyAqwqDCoCBDb3B5cmlnaHQgKEMpIDIwMTYgUmVuZXNhcyBFbGVjdHJvbmlj
cyBDb3Jwb3JhdGlvbgo+ID4gPiA+ICsgKiBCYXNlZCBvbiBpbXg4bXAtaGRtaS10eC5jLCB3aGlj
aCBpczoKPiA+ID4gPiArICrCoMKgIENvcHlyaWdodCAoQykgMjAyMiBQZW5ndXRyb25peCwgTHVj
YXMgU3RhY2gKPiA+ID4gPiA8a2VybmVsQHBlbmd1dHJvbml4LmRlPgo+ID4gPiA+ICsgKi8KPiA+
ID4gPiArCj4gPiA+ID4gKyNpbmNsdWRlIDxsaW51eC9jbGsuaD4KPiA+ID4gPiArI2luY2x1ZGUg
PGxpbnV4L21vZF9kZXZpY2V0YWJsZS5oPgo+ID4gPiA+ICsjaW5jbHVkZSA8bGludXgvbW9kdWxl
Lmg+Cj4gPiA+ID4gKyNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KPiA+ID4gPiAr
I2luY2x1ZGUgPGxpbnV4L3Jlc2V0Lmg+Cj4gPiA+ID4gKwo+ID4gPiA+ICsjaW5jbHVkZSA8ZHJt
L2JyaWRnZS9kd19oZG1pLmg+Cj4gPiA+ID4gKyNpbmNsdWRlIDxkcm0vZHJtX21vZGVzLmg+Cj4g
PiA+ID4gKwo+ID4gPiA+ICsjZGVmaW5lIFRIMTUyMF9IRE1JX1BIWV9PUE1PREVfUExMQ0ZHwqDC
oDB4MDbCoMKgwqDCoC8qIE1vZGUgb2YKPiA+ID4gPiBvcGVyYXRpb24gYW5kIFBMTCBkaXZpZGVy
cyAqLwo+ID4gPiA+ICsjZGVmaW5lIFRIMTUyMF9IRE1JX1BIWV9DS1NZTVRYQ1RSTMKgwqDCoMKg
MHgwOcKgwqDCoMKgLyogQ2xvY2sgU3ltYm9sCj4gPiA+ID4gYW5kCj4gPiA+ID4gVHJhbnNtaXR0
ZXIgQ29udHJvbCBSZWdpc3RlciAqLwo+ID4gPiA+ICsjZGVmaW5lIFRIMTUyMF9IRE1JX1BIWV9W
TEVWQ1RSTMKgwqDCoMKgwqDCoMKgMHgwZcKgwqDCoMKgLyogVm9sdGFnZSBMZXZlbAo+ID4gPiA+
IENvbnRyb2wgUmVnaXN0ZXIgKi8KPiA+ID4gPiArI2RlZmluZSBUSDE1MjBfSERNSV9QSFlfUExM
Q1VSUkdNUENUUkzCoDB4MTDCoMKgwqDCoC8qIFBMTCBjdXJyZW50Cj4gPiA+ID4gYW5kCj4gPiA+
ID4gR21wIChjb25kdWN0YW5jZSkgKi8KPiA+ID4gPiArI2RlZmluZSBUSDE1MjBfSERNSV9QSFlf
UExMRElWQ1RSTMKgwqDCoMKgwqAweDExwqDCoMKgwqAvKiBQTEwgZGl2aWRlcnMKPiA+ID4gPiAq
Lwo+ID4gPiA+ICsjZGVmaW5lIFRIMTUyMF9IRE1JX1BIWV9UWFRFUk3CoMKgwqDCoMKgwqDCoMKg
wqAweDE5wqDCoMKgwqAvKiBUcmFuc21pc3Npb24KPiA+ID4gPiBUZXJtaW5hdGlvbiBSZWdpc3Rl
ciAqLwo+ID4gPiA+ICsKPiA+ID4gPiArc3RydWN0IHRoMTUyMF9oZG1pX3BoeV9wYXJhbXMgewo+
ID4gPiA+ICvCoMKgwqDCoMKgwqDCoHVuc2lnbmVkIGxvbmcgbXBpeGVsY2xvY2s7Cj4gPiA+ID4g
K8KgwqDCoMKgwqDCoMKgdTE2IG9wbW9kZV9wbGxjZmc7Cj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKg
dTE2IHBsbGN1cnJnbXBjdHJsOwo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoHUxNiBwbGxkaXZjdHJs
Owo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoHUxNiBja3N5bXR4Y3RybDsKPiA+ID4gPiArwqDCoMKg
wqDCoMKgwqB1MTYgdmxldmN0cmw7Cj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgdTE2IHR4dGVybTsK
PiA+ID4gPiArfTsKPiA+ID4gPiArCj4gPiA+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgdGgxNTIw
X2hkbWlfcGh5X3BhcmFtcwo+ID4gPiA+IHRoMTUyMF9oZG1pX3BoeV9wYXJhbXNbXSA9IHsKPiA+
ID4gPiArwqDCoMKgwqDCoMKgwqB7IDM1NTAwMDAwLMKgIDB4MDAwMywgMHgwMjgzLCAweDA2Mjgs
IDB4ODA4OCwgMHgwMWEwLAo+ID4gPiA+IDB4MDAwNwo+ID4gPiA+IH0sCj4gPiA+ID4gK8KgwqDC
oMKgwqDCoMKgeyA0NDkwMDAwMCzCoCAweDAwMDMsIDB4MDI4NSwgMHgwMjI4LCAweDgwODgsIDB4
MDFhMCwKPiA+ID4gPiAweDAwMDcKPiA+ID4gPiB9LAo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoHsg
NzEwMDAwMDAswqAgMHgwMDAyLCAweDExODMsIDB4MDYxNCwgMHg4MDg4LCAweDAxYTAsCj4gPiA+
ID4gMHgwMDA3Cj4gPiA+ID4gfSwKPiA+ID4gPiArwqDCoMKgwqDCoMKgwqB7IDkwMDAwMDAwLMKg
IDB4MDAwMiwgMHgxMTQyLCAweDAyMTQsIDB4ODA4OCwgMHgwMWEwLAo+ID4gPiA+IDB4MDAwNwo+
ID4gPiA+IH0sCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgeyAxMjE3NTAwMDAsIDB4MDAwMSwgMHgy
MGMwLCAweDA2MGEsIDB4ODA4OCwgMHgwMWEwLAo+ID4gPiA+IDB4MDAwNwo+ID4gPiA+IH0sCj4g
PiA+ID4gK8KgwqDCoMKgwqDCoMKgeyAxNjUwMDAwMDAsIDB4MDAwMSwgMHgyMDgwLCAweDAyMGEs
IDB4ODA4OCwgMHgwMWEwLAo+ID4gPiA+IDB4MDAwNwo+ID4gPiA+IH0sCj4gPiA+ID4gK8KgwqDC
oMKgwqDCoMKgeyAxOTgwMDAwMDAsIDB4MDAwMCwgMHgzMDQwLCAweDA2MDUsIDB4ODNjOCwgMHgw
MTIwLAo+ID4gPiA+IDB4MDAwNAo+ID4gPiA+IH0sCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgeyAy
OTcwMDAwMDAsIDB4MDAwMCwgMHgzMDQxLCAweDAyMDUsIDB4ODFkYywgMHgwMjAwLAo+ID4gPiA+
IDB4MDAwNQo+ID4gPiA+IH0sCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgeyAzNzEyNTAwMDAsIDB4
MDY0MCwgMHgzMDQxLCAweDAyMDUsIDB4ODBmNiwgMHgwMTQwLAo+ID4gPiA+IDB4MDAwMAo+ID4g
PiA+IH0sCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgeyA0OTUwMDAwMDAsIDB4MDY0MCwgMHgzMDgw
LCAweDAwMDUsIDB4ODBmNiwgMHgwMTQwLAo+ID4gPiA+IDB4MDAwMAo+ID4gPiA+IH0sCj4gPiA+
ID4gK8KgwqDCoMKgwqDCoMKgeyA1OTQwMDAwMDAsIDB4MDY0MCwgMHgzMDgwLCAweDAwMDUsIDB4
ODBmYSwgMHgwMWUwLAo+ID4gPiA+IDB4MDAwNAo+ID4gPiA+IH0sCj4gPiA+ID4gK307Cj4gPiA+
ID4gKwo+ID4gPiA+ICtzdHJ1Y3QgdGgxNTIwX2hkbWkgewo+ID4gPiA+ICvCoMKgwqDCoMKgwqDC
oHN0cnVjdCBkd19oZG1pX3BsYXRfZGF0YSBwbGF0X2RhdGE7Cj4gPiA+ID4gK8KgwqDCoMKgwqDC
oMKgc3RydWN0IGR3X2hkbWkgKmR3X2hkbWk7Cj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgc3RydWN0
IGNsayAqcGl4Y2xrOwo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCByZXNldF9jb250cm9s
ICptYWlucnN0LCAqcHJzdDsKPiA+ID4gPiArfTsKPiA+ID4gPiArCj4gPiA+ID4gK3N0YXRpYyBl
bnVtIGRybV9tb2RlX3N0YXR1cwo+ID4gPiA+ICt0aDE1MjBfaGRtaV9tb2RlX3ZhbGlkKHN0cnVj
dCBkd19oZG1pICpoZG1pLCB2b2lkICpkYXRhLAo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X2luZm8gKmlu
Zm8sCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBj
b25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSkKPiA+ID4gPiArewo+ID4gPiA+ICvC
oMKgwqDCoMKgwqDCoC8qCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgICogVGhlIG1heGltdW0gc3Vw
cG9ydGVkIGNsb2NrIGZyZXF1ZW5jeSBpcyA1OTQgTUh6LCBhcwo+ID4gPiA+IHNob3duIGluIHRo
ZSBQSFkKPiA+ID4gPiArwqDCoMKgwqDCoMKgwqAgKiBwYXJhbWV0ZXJzIHRhYmxlLgo+ID4gPiA+
ICvCoMKgwqDCoMKgwqDCoCAqLwo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoGlmIChtb2RlLT5jbG9j
ayA+IDU5NDAwMCkKPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJu
IE1PREVfQ0xPQ0tfSElHSDsKPiA+ID4gCj4gPiA+IElzIGl0IHRoZSBsaW1pdGF0aW9uIGZvciB0
aGUgcGl4ZWwgY2xvY2sgb3IgZm9yIHRoZSBUTURTIGNoYXIgY2xvY2sKPiA+ID4gKHRoZQo+ID4g
PiBkaWZmZXJlbmNlIG1ha2VzIHNlbnNlIGZvciBub24tOC1icGMgbW9kZXMuCj4gPiAKPiA+IEkg
aGF2ZSBubyBpZGVhLCB0aGUgQlNQIGRyaXZlciBkaWRuJ3QgY29uc2lkZXIgbm9uLThicGMgbW9k
ZXMsIGFuZCBJCj4gPiBoYXZlIG5vIG5vbi04YnBjIGRldmljZXMgdG8gdGVzdC4KPiAKPiBTaG91
bGQgSSByZWplY3Qgbm9uLThicGMgbW9kZXMgaGVyZSBiZWNhdXNlIG9mIGxhY2sgb2YgaW5mb3Jt
YXRpb24/CgpObyBuZWVkIHRvLCB0aGV5IHdvbid0IGJlIHVzZWQgYW55d2F5LgoKPiAKPiA+IAo+
ID4gPiAKPiA+ID4gPiArCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgcmV0dXJuIE1PREVfT0s7Cj4g
PiA+ID4gK30KPiA+ID4gPiArCj4gPiA+IAo+ID4gCj4gCgotLSAKV2l0aCBiZXN0IHdpc2hlcwpE
bWl0cnkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
