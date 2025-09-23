Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26FF1CAC5A7
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Sep 2025 01:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eCUIkBNg3uLH+b5YLhDJ0oJSV4NxWi5WWosfJt3Dryc=; b=vudTELirQVI3MW
	NpBUXuo+2iV7tFe2UmmefYM1jomYWODP1ZuSAAVXZjShG5RC0ek8Fea0uvn0jyGbSJD0s2ic1TD46
	irt2KBIxUyALZ8dp9SBqOSUoF2+fOfrsYV3HUlSNVJIjwvAUo6j50eX/czLy9HXadh+DGk+phj/pE
	+Es2N//5+FfPCBfITxbLMvGMXmWVnmtMb/2g0luCgrQOzINqoa6aUaXlckN4A5InvyCtU23w7/cI4
	LbHdnuQVcno/QdAfNPb7+p5IEVdizcD5fl6w5z5nPc1jNp0XqeTobzk4PrPlG60dv1emYbGeUxMLz
	uT1tR/XyXtTFcmQH8NtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0sIa-0000000C4ae-15Nx;
	Tue, 23 Sep 2025 01:58:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0sIX-0000000C4Zm-0x9e
	for linux-riscv@lists.infradead.org;
	Tue, 23 Sep 2025 01:58:30 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58MG8VVq008465
	for <linux-riscv@lists.infradead.org>; Tue, 23 Sep 2025 01:58:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wjZBpcuck2b3wq2R80w3BXiH3NCwuHgMqXfKHFPCfUw=; b=UqevwbKuVrII/QtV
	nwG11NVaZ1R6HuGxJB/01OGjPm2+eEpRGoK+UolPuBI21JvO3GbVEISDIWjZKeLS
	BPENgATFfm/GL+JUgAFomijvrXZennRbZFnnHvbk937sIebZrXINrxRg6WIyt+Fx
	vLVxw5PKkSGAOif2n2Dpx93ljmphbhm1V9aoLMq8LUWysIZJ1L6bjS5+unjePSQS
	amv4yZDARGHBEzXfLp7u6kZWmkOcJkM9gyGFG1I8d5sofY5PdckFzlCeOn/DyDgZ
	NJlahtyP157t1jxmC/a2AjY+9MwqXgrQo4fZO5EBHqCobtwgW/HAXaLyzaedJuLA
	0iwkeQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499mn7esvk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 23 Sep 2025 01:58:27 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-798ab08dde5so65463756d6.2
        for <linux-riscv@lists.infradead.org>; Mon, 22 Sep 2025 18:58:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758592707; x=1759197507;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wjZBpcuck2b3wq2R80w3BXiH3NCwuHgMqXfKHFPCfUw=;
        b=v/1M1i5UakWFKu8xVkFQ87PEkbDJdB+Nb6H0iSTk6fvf2G30rqk3pHL+VJ86spTjMR
         qPtr4oZBgsXe4rgvLHWHpfo9yBHe1/cKmuhVc9IbCGF+FCiths6EMg7WUp37RSXmylao
         TEz2hFI4JQ+XhyjMLu8xShWZvE1v/wOLHaFy7SSEFBzbOGqmYt0H/t9nmlZUlO1j5rw9
         sd0Ks00B1ZGwD6W26V9IgVY7DYQ1239yMbsUzrwWreZzzPi4b7nhkt5x699DqV+GYQZz
         //dq+ydPb/DtYXyvqlAmlkf6n8imtTrEHlXHOHyHYL5a106+Jiin+L2t/eUA9dGN6D/W
         BGQg==
X-Forwarded-Encrypted: i=1; AJvYcCXoGrXV6jrzmZ0dxwdXYEpPJvthrnRxOTSChmkm6kG6B1tl9ceJb/H/jtactrMGqT+RRlZWDIrp1cTLtQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyNz48e64mpF/GpqI/xOs7cRou/Vt5Ebn9DakhrF1U9dV5XTl4E
	nsbZZ4vbU+1rCsy6wVe2FPO0d2MUpOhb52/SqZVfXb9Sa5Jlv99R3CEgcuqlroAeQ98hwrgCl8T
	oqYSF47USAN3hEdJBgixkciIUcqIvp2LhS0vcH3ArIrGn4iwgg6Z7CalgoGqdeVDCpelM7+4=
X-Gm-Gg: ASbGncufkuX7PBbdZYDhMeuqJnocI0fua+PEpr3bK/TC0YhPGWk2fM6I52UrwFKJWCB
	9eFpjZ+93QUaPLwGsYKsOKYJ+nt0OKo1eMoZLX2C6/fqSySnRjhiIfgyNFl2Vo7LgQTJrgHf4tU
	cFRXxXBk23Xfj/8lrMWzHHRGNlzcp5dzqfUmcJj876ixqfJYI7X501pPlWZzjmDd8LmxXthGFoJ
	F2wffsdZx4q9K0Pvo9nidZ+9pQ07heKqTPRtcERQs+93fLCxdybuYn7OM2kvufF78E5qpWevmqj
	EGAQYTNVX+wjZj5VRF4u82rbEsrn3mpRR1JTzX/2v3dn5+UHfG2l5+F8NLIKUOelkV8TnEiRWwO
	rPnlR1BlryGhL2Ob5bn8ubk/V+rF+aYZPjZYe8vmgogLmtN80JDg7
X-Received: by 2002:a05:6214:f6c:b0:78e:ea84:768f with SMTP id 6a1803df08f44-7e705d7bf47mr11042996d6.30.1758592706907;
        Mon, 22 Sep 2025 18:58:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2UHfHXJZyQ10p2X6Fpt5TanjCh8LeDMIwT7ePmjsHI9tTKDN1phKB8vhk3eST38TyWHjFsw==
X-Received: by 2002:a05:6214:f6c:b0:78e:ea84:768f with SMTP id 6a1803df08f44-7e705d7bf47mr11042766d6.30.1758592706397;
        Mon, 22 Sep 2025 18:58:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-57e80683e89sm1357059e87.95.2025.09.22.18.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 18:58:25 -0700 (PDT)
Date: Tue, 23 Sep 2025 04:58:23 +0300
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
Subject: Re: [PATCH v2 3/8] drm: verisilicon: add a driver for Verisilicon
 display controllers
Message-ID: <7zswcrcfsypbd36mddslreeli2zbrn33nyqkxmwdufakhl2vgm@bb6i6zfgeznh>
References: <20250921083446.790374-1-uwu@icenowy.me>
 <20250921083446.790374-4-uwu@icenowy.me>
 <a46szgmjrwgqhv5issuijyvih4tof3xa45tdhxv4qjplekszpz@55tgbkeby7zr>
 <dacdfabb30fae413949d8bde28a709096ecda4c7.camel@icenowy.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dacdfabb30fae413949d8bde28a709096ecda4c7.camel@icenowy.me>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzMyBTYWx0ZWRfX6IHGBqNwMG2Q
 LapDBpQxXVO92zyTbtTsqhKtnIsRJ6JLb7S8A897AGhSIW4VC0cnV7DQ0YgjKqxUnD66DM5AoaC
 U/UdM4YkC/wYNDNyDT0JHd6z/YXRFj7EJqKexu1AxiFMrx8GILf1q1beEMjwJD2NtuUWEneZdVK
 YY67vPuhQmdMKlJ031yjOYTg4IerbEMGvlQxAaWBOnvvutFj3QqYGdoznFw1QGRKiWDCWS58USz
 iycdI8w0ghqcvVNektE7tBF8LFH+qFCW8T+qfmnhgAUeeqCKlWjL0VfzGeTseap4vLBs9MOlFL7
 2l/M2VJuHRvOXxP9GWWBXO6DcI8a+90PNj6Fw+QhGHxa+f+JpD3rDQfPbQPWlDaGg4JVRoX3xVd
 x8RFzbW3
X-Proofpoint-GUID: 9L17GzzzTsCzLzhqlfm4yY2sTF7e_b6H
X-Proofpoint-ORIG-GUID: 9L17GzzzTsCzLzhqlfm4yY2sTF7e_b6H
X-Authority-Analysis: v=2.4 cv=EZrIQOmC c=1 sm=1 tr=0 ts=68d1fec3 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=ZNbfwUPgZe5FKaAedJYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_01,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509200033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_185829_388396_B2316E7D 
X-CRM114-Status: GOOD (  39.93  )
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

T24gVHVlLCBTZXAgMjMsIDIwMjUgYXQgMDk6MTA6MjhBTSArMDgwMCwgSWNlbm93eSBaaGVuZyB3
cm90ZToKPiDlnKggMjAyNS0wOS0yM+aYn+acn+S6jOeahCAwMzo1MyArMDMwMO+8jERtaXRyeSBC
YXJ5c2hrb3blhpnpgZPvvJoKPiA+IE9uIFN1biwgU2VwIDIxLCAyMDI1IGF0IDA0OjM0OjQxUE0g
KzA4MDAsIEljZW5vd3kgWmhlbmcgd3JvdGU6Cj4gPiA+IFRoaXMgaXMgYSBmcm9tLXNjcmF0Y2gg
ZHJpdmVyIHRhcmdldGluZyBWZXJpc2lsaWNvbiBEQy1zZXJpZXMKPiA+ID4gZGlzcGxheQo+ID4g
PiBjb250cm9sbGVycywgd2hpY2ggZmVhdHVyZSBzZWxmLWlkZW50aWZpY2F0aW9uIGZ1bmN0aW9u
YWxpdHkgbGlrZQo+ID4gPiB0aGVpcgo+ID4gPiBHQy1zZXJpZXMgR1BVcy4KPiA+ID4gCj4gPiA+
IE9ubHkgREM4MjAwIGlzIGJlaW5nIHN1cHBvcnRlZCBub3csIGFuZCBvbmx5IHRoZSBtYWluIGZy
YW1lYnVmZmVyCj4gPiA+IGlzIHNldAo+ID4gPiB1cCAoYXMgdGhlIERSTSBwcmltYXJ5IHBsYW5l
KS4gU3VwcG9ydCBmb3IgbW9yZSBEQyBtb2RlbHMgYW5kIG1vcmUKPiA+ID4gZmVhdHVyZXMgaXMg
bXkgZnVydGhlciB0YXJnZXRzLgo+ID4gPiAKPiA+ID4gQXMgdGhlIGRpc3BsYXkgY29udHJvbGxl
ciBpcyBkZWxpdmVyZWQgdG8gU29DIHZlbmRvcnMgYXMgYSB3aG9sZQo+ID4gPiBwYXJ0LAo+ID4g
PiB0aGlzIGRyaXZlciBkb2VzIG5vdCB1c2UgY29tcG9uZW50IGZyYW1ld29yayBhbmQgZXh0cmEg
YnJpZGdlcwo+ID4gPiBpbnNpZGUgYQo+ID4gPiBTb0MgaXMgZXhwZWN0ZWQgdG8gYmUgaW1wbGVt
ZW50ZWQgYXMgZGVkaWNhdGVkIGJyaWRnZXMgKHRoaXMgZHJpdmVyCj4gPiA+IHByb3Blcmx5IHN1
cHBvcnRzIGJyaWRnZSBjaGFpbmluZykuCj4gPiA+IAo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBJY2Vu
b3d5IFpoZW5nIDx1d3VAaWNlbm93eS5tZT4KPiA+ID4gLS0tCj4gPiA+IENoYW5nZXMgaW4gdjI6
Cj4gPiA+IC0gQ2hhbmdlZCBzb21lIENvbnRyb2wgZmxvd3MgYWNjb3JkaW5nIHRvIHByZXZpb3Vz
IHJldmlld3MuCj4gPiA+IC0gQWRkZWQgbWlzc2luZyBvZl9ub2RlX3B1dCB3aGVuIGNoZWNraW5n
IG9mIGVuZHBvaW50cyBmb3Igb3V0cHV0Cj4gPiA+IHR5cGUuCj4gPiA+IC0gU3dpdGNoZWQgYWxs
IHVzZXJzcGFjZS12aXNpYmxlIG1vZGVzZXQgb2JqZWN0cyB0byBiZSBtYW5hZ2VkIGJ5Cj4gPiA+
IGRybW0KPiA+ID4gwqAgaW5zdGVhZCBvZiBkZXZtLgo+ID4gPiAtIFV0aWxpemUgZGV2bV9kcm1f
YnJpZGdlX2FsbG9jKCkgaW4gaW50ZXJuYWwgYnJpZGdlLgo+ID4gPiAtIFByZXZlbnRlZCB0aGUg
dXNhZ2Ugb2Ygc2ltcGxlIGVuY29kZXIgaGVscGVycyBieSBwYXNzaW5nIGEgTlVMTAo+ID4gPiBm
dW5jcyBwb2ludGVyLgo+ID4gPiAtIExldCBkZXZtIGVuYWJsZSBjbG9ja3Mgd2hlbiBnZXR0aW5n
IHRoZW0uCj4gPiA+IC0gUmVtb3ZlZCBleHBsaWNpdCBgLmNhY2hlX3R5cGUgPSBSRUdDQUNIRV9O
T05FYCBpbiByZWdtYXAgY29uZmlnLgo+ID4gPiAtIEZpeGVkIGEgZGVidWcgcHJpbnQgdXNpbmcg
YSB2YXJpYWJsZSBiZWZvcmUgaW5pdGlhbGl6YXRpb24uCj4gPiA+IC0gRml4ZWQgYSB3cm9uZyBp
bmRleCB3aGVuIHVzaW5nIGJ1bGsgdG8gaGFuZGxlIHJlc2V0cy4KPiA+ID4gLSBBZGRlZCBtaXNz
aW5nIGNvbmZpZ3VyYXRpb24gZm9yIERQSSBmb3JtYXQgKGN1cnJlbnRseSBmaXhlZAo+ID4gPiBS
R0I4ODgpLgo+ID4gPiAKPiA+ID4gwqBkcml2ZXJzL2dwdS9kcm0vS2NvbmZpZ8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDIgKwo+ID4gPiDCoGRyaXZl
cnMvZ3B1L2RybS9NYWtlZmlsZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB8wqDCoCAxICsKPiA+ID4gwqBkcml2ZXJzL2dwdS9kcm0vdmVyaXNpbGljb24vS2NvbmZp
Z8KgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAxNSArCj4gPiA+IMKgZHJpdmVycy9ncHUvZHJtL3Zl
cmlzaWxpY29uL01ha2VmaWxlwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDUgKwo+ID4gPiDCoGRy
aXZlcnMvZ3B1L2RybS92ZXJpc2lsaWNvbi92c19icmlkZ2UuY8KgwqDCoMKgwqDCoCB8IDMzMAo+
ID4gPiArKysrKysrKysrKysrKysrKysKPiA+ID4gwqBkcml2ZXJzL2dwdS9kcm0vdmVyaXNpbGlj
b24vdnNfYnJpZGdlLmjCoMKgwqDCoMKgwqAgfMKgIDQwICsrKwo+ID4gPiDCoGRyaXZlcnMvZ3B1
L2RybS92ZXJpc2lsaWNvbi92c19icmlkZ2VfcmVncy5owqAgfMKgIDU0ICsrKwo+ID4gPiDCoGRy
aXZlcnMvZ3B1L2RybS92ZXJpc2lsaWNvbi92c19jcnRjLmPCoMKgwqDCoMKgwqDCoMKgIHwgMjE3
ICsrKysrKysrKysrKwo+ID4gPiDCoGRyaXZlcnMvZ3B1L2RybS92ZXJpc2lsaWNvbi92c19jcnRj
LmjCoMKgwqDCoMKgwqDCoMKgIHzCoCAyOSArKwo+ID4gPiDCoGRyaXZlcnMvZ3B1L2RybS92ZXJp
c2lsaWNvbi92c19jcnRjX3JlZ3MuaMKgwqDCoCB8wqAgNjAgKysrKwo+ID4gPiDCoGRyaXZlcnMv
Z3B1L2RybS92ZXJpc2lsaWNvbi92c19kYy5jwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAyMDUgKysr
KysrKysrKysKPiA+ID4gwqBkcml2ZXJzL2dwdS9kcm0vdmVyaXNpbGljb24vdnNfZGMuaMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHzCoCAzOSArKysKPiA+ID4gwqBkcml2ZXJzL2dwdS9kcm0vdmVyaXNp
bGljb24vdnNfZGNfdG9wX3JlZ3MuaMKgIHzCoCAyNyArKwo+ID4gPiDCoGRyaXZlcnMvZ3B1L2Ry
bS92ZXJpc2lsaWNvbi92c19kcm0uY8KgwqDCoMKgwqDCoMKgwqDCoCB8IDE3NyArKysrKysrKysr
Cj4gPiA+IMKgZHJpdmVycy9ncHUvZHJtL3ZlcmlzaWxpY29uL3ZzX2RybS5owqDCoMKgwqDCoMKg
wqDCoMKgIHzCoCAyOSArKwo+ID4gPiDCoGRyaXZlcnMvZ3B1L2RybS92ZXJpc2lsaWNvbi92c19o
d2RiLmPCoMKgwqDCoMKgwqDCoMKgIHwgMTUwICsrKysrKysrCj4gPiA+IMKgZHJpdmVycy9ncHUv
ZHJtL3ZlcmlzaWxpY29uL3ZzX2h3ZGIuaMKgwqDCoMKgwqDCoMKgwqAgfMKgIDI5ICsrCj4gPiA+
IMKgZHJpdmVycy9ncHUvZHJtL3ZlcmlzaWxpY29uL3ZzX3BsYW5lLmPCoMKgwqDCoMKgwqDCoCB8
IDEwMiArKysrKysKPiA+ID4gwqBkcml2ZXJzL2dwdS9kcm0vdmVyaXNpbGljb24vdnNfcGxhbmUu
aMKgwqDCoMKgwqDCoMKgIHzCoCA2OCArKysrCj4gPiA+IMKgLi4uL2dwdS9kcm0vdmVyaXNpbGlj
b24vdnNfcHJpbWFyeV9wbGFuZS5jwqDCoMKgIHwgMTU3ICsrKysrKysrKwo+ID4gPiDCoC4uLi9k
cm0vdmVyaXNpbGljb24vdnNfcHJpbWFyeV9wbGFuZV9yZWdzLmjCoMKgIHzCoCA1MyArKysKPiA+
ID4gwqAyMSBmaWxlcyBjaGFuZ2VkLCAxNzg5IGluc2VydGlvbnMoKykKPiA+ID4gwqBjcmVhdGUg
bW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3ZlcmlzaWxpY29uL0tjb25maWcKPiA+ID4gwqBj
cmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3ZlcmlzaWxpY29uL01ha2VmaWxlCj4g
PiA+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS92ZXJpc2lsaWNvbi92c19i
cmlkZ2UuYwo+ID4gPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vdmVyaXNp
bGljb24vdnNfYnJpZGdlLmgKPiA+ID4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUv
ZHJtL3ZlcmlzaWxpY29uL3ZzX2JyaWRnZV9yZWdzLmgKPiA+ID4gwqBjcmVhdGUgbW9kZSAxMDA2
NDQgZHJpdmVycy9ncHUvZHJtL3ZlcmlzaWxpY29uL3ZzX2NydGMuYwo+ID4gPiDCoGNyZWF0ZSBt
b2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vdmVyaXNpbGljb24vdnNfY3J0Yy5oCj4gPiA+IMKg
Y3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS92ZXJpc2lsaWNvbi92c19jcnRjX3Jl
Z3MuaAo+ID4gPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vdmVyaXNpbGlj
b24vdnNfZGMuYwo+ID4gPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vdmVy
aXNpbGljb24vdnNfZGMuaAo+ID4gPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9k
cm0vdmVyaXNpbGljb24vdnNfZGNfdG9wX3JlZ3MuaAo+ID4gPiDCoGNyZWF0ZSBtb2RlIDEwMDY0
NCBkcml2ZXJzL2dwdS9kcm0vdmVyaXNpbGljb24vdnNfZHJtLmMKPiA+ID4gwqBjcmVhdGUgbW9k
ZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3ZlcmlzaWxpY29uL3ZzX2RybS5oCj4gPiA+IMKgY3Jl
YXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS92ZXJpc2lsaWNvbi92c19od2RiLmMKPiA+
ID4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3ZlcmlzaWxpY29uL3ZzX2h3
ZGIuaAo+ID4gPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vdmVyaXNpbGlj
b24vdnNfcGxhbmUuYwo+ID4gPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0v
dmVyaXNpbGljb24vdnNfcGxhbmUuaAo+ID4gPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJz
L2dwdS9kcm0vdmVyaXNpbGljb24vdnNfcHJpbWFyeV9wbGFuZS5jCj4gPiA+IMKgY3JlYXRlIG1v
ZGUgMTAwNjQ0Cj4gPiA+IGRyaXZlcnMvZ3B1L2RybS92ZXJpc2lsaWNvbi92c19wcmltYXJ5X3Bs
YW5lX3JlZ3MuaAo+ID4gPiAKPiA+ID4gKwo+ID4gPiArc3RhdGljIGludCB2c19icmlkZ2VfYXRv
bWljX2NoZWNrKHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UsCj4gPiA+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVj
dCBkcm1fYnJpZGdlX3N0YXRlCj4gPiA+ICpicmlkZ2Vfc3RhdGUsCj4gPiA+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0
cnVjdCBkcm1fY3J0Y19zdGF0ZQo+ID4gPiAqY3J0Y19zdGF0ZSwKPiA+ID4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3Ry
dWN0IGRybV9jb25uZWN0b3Jfc3RhdGUKPiA+ID4gKmNvbm5fc3RhdGUpCj4gPiA+ICt7Cj4gPiA+
ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCB2c19icmlkZ2UgKnZicmlkZ2UgPQo+ID4gPiBkcm1fYnJp
ZGdlX3RvX3ZzX2JyaWRnZShicmlkZ2UpOwo+ID4gPiArCj4gPiA+ICvCoMKgwqDCoMKgwqDCoGlm
ICh2YnJpZGdlLT5pbnRmID09IFZTRENfT1VUUFVUX0lOVEVSRkFDRV9EUCAmJgo+ID4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqAgIXZzX2JyaWRnZV9vdXRfZHBfZm10X3N1cHBvcnRlZChicmlkZ2Vf
c3RhdGUtCj4gPiA+ID5vdXRwdXRfYnVzX2NmZy5mb3JtYXQpKQo+ID4gPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIC1FSU5WQUw7Cj4gPiAKPiA+IEkgc3RpbGwgdGhpbmsg
dGhhdCBpdCdzIGJldHRlciB0byBoYXZlIHBlci1pbnRlcmZhY2UgdHlwZSBicmlkZ2UKPiA+IGZ1
bmNzCj4gPiByYXRoZXIgdGhhbiBjaGVja2luZyBmb3IgdGhlIGludGVyZmFjZSB0eXBlIGluc2lk
ZSB0aGUgZnVuY3Rpb24uCj4gPiAKPiA+ID4gKwo+ID4gPiArwqDCoMKgwqDCoMKgwqB2YnJpZGdl
LT5vdXRwdXRfYnVzX2ZtdCA9IGJyaWRnZV9zdGF0ZS0KPiA+ID4gPm91dHB1dF9idXNfY2ZnLmZv
cm1hdDsKPiA+ID4gKwo+ID4gPiArwqDCoMKgwqDCoMKgwqByZXR1cm4gMDsKPiA+ID4gK30KPiA+
ID4gKwo+ID4gPiArCj4gPiA+ICvCoMKgwqDCoMKgwqDCoGJyaWRnZSA9IGRldm1fZHJtX2JyaWRn
ZV9hbGxvYyhkcm1fZGV2LT5kZXYsIHN0cnVjdAo+ID4gPiB2c19icmlkZ2UsIGJhc2UsCj4gPiA+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAmdnNfYnJpZGdlX2Z1bmNzKTsKPiA+ID4gK8KgwqDCoMKgwqDC
oMKgaWYgKCFicmlkZ2UpCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1
cm4gRVJSX1BUUigtRU5PTUVNKTsKPiA+ID4gKwo+ID4gPiArwqDCoMKgwqDCoMKgwqBicmlkZ2Ut
PmNydGMgPSBjcnRjOwo+ID4gPiArwqDCoMKgwqDCoMKgwqBicmlkZ2UtPmludGYgPSBpbnRmOwo+
ID4gPiArwqDCoMKgwqDCoMKgwqBicmlkZ2UtPm5leHQgPSBuZXh0Owo+ID4gPiArCj4gPiA+ICvC
oMKgwqDCoMKgwqDCoGlmIChpbnRmID09IFZTRENfT1VUUFVUX0lOVEVSRkFDRV9EUEkpCj4gPiA+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBlbmN0eXBlID0gRFJNX01PREVfRU5DT0RF
Ul9EUEk7Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoGVsc2UKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoGVuY3R5cGUgPSBEUk1fTU9ERV9FTkNPREVSX05PTkU7Cj4gPiAKPiA+IE5p
dDogRFJNX01PREVfRU5DT0RFUl9UTURTID8KPiAKPiBUaGUgREMgaXQgc2VsZiBuZXZlciBlbmNv
ZGVzIFRNRFMsIGFuZCBhbHRob3VnaCBtb3N0IFNvQyBjb25uZWN0IHRoZSBEUAo+IGludGVyZmFj
ZSB0byBIRE1JIFRYIGNvbnRyb2xsZXJzLCBpdCdzIHRoZW9ydGljYWxseSB0byB1c2Ugb3RoZXIK
PiBicmlkZ2VzIGhlcmUgKGUuZy4gRFAgVFggY29udHJvbGxlcnMpLgoKQnV0IE5PTkUgYWxzbyBk
b2Vzbid0IHNvdW5kIGNvbXBsZXRlbHkgY29ycmVjdCBoZXJlLiBBbnl3YXksIHRoaXMgaXMKcmVh
bGx5IGEgbWlub3IgdGhpbmcsIHNvIGZlZWwgZnJlZSB0byBpZ25vcmUgdGhpcyBjb21tZW50LgoK
PiAKPiA+IAo+ID4gPiArCj4gPiA+ICvCoMKgwqDCoMKgwqDCoGJyaWRnZS0+ZW5jID0gZHJtbV9w
bGFpbl9lbmNvZGVyX2FsbG9jKGRybV9kZXYsIE5VTEwsCj4gPiA+IGVuY3R5cGUsIE5VTEwpOwo+
ID4gPiArwqDCoMKgwqDCoMKgwqBpZiAoSVNfRVJSKGJyaWRnZS0+ZW5jKSkgewo+ID4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZGV2X2Vycihkcm1fZGV2LT5kZXYsCj4gPiA+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIkNhbm5vdCBpbml0
aWFsaXplIGVuY29kZXIgZm9yIG91dHB1dAo+ID4gPiAldVxuIiwgb3V0cHV0KTsKPiA+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldCA9IFBUUl9FUlIoYnJpZGdlLT5lbmMpOwo+
ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIEVSUl9QVFIocmV0KTsK
PiA+ID4gK8KgwqDCoMKgwqDCoMKgfQo+ID4gPiArCj4gPiA+ICvCoMKgwqDCoMKgwqDCoGJyaWRn
ZS0+ZW5jLT5wb3NzaWJsZV9jcnRjcyA9IGRybV9jcnRjX21hc2soJmNydGMtPmJhc2UpOwo+ID4g
PiArCj4gPiA+ICvCoMKgwqDCoMKgwqDCoHJldCA9IGRybV9icmlkZ2VfYXR0YWNoKGJyaWRnZS0+
ZW5jLCAmYnJpZGdlLT5iYXNlLCBOVUxMLAo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBEUk1fQlJJREdFX0FUVEFDSF9O
T19DT05ORUNUT1IpOwo+ID4gPiArwqDCoMKgwqDCoMKgwqBpZiAocmV0KSB7Cj4gPiA+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkZXZfZXJyKGRybV9kZXYtPmRldiwKPiA+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAiQ2Fubm90IGF0dGFj
aCBicmlkZ2UgZm9yIG91dHB1dCAldVxuIiwKPiA+ID4gb3V0cHV0KTsKPiA+ID4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiBFUlJfUFRSKHJldCk7Cj4gPiA+ICvCoMKgwqDC
oMKgwqDCoH0KPiA+ID4gKwo+ID4gPiArwqDCoMKgwqDCoMKgwqBicmlkZ2UtPmNvbm4gPSBkcm1f
YnJpZGdlX2Nvbm5lY3Rvcl9pbml0KGRybV9kZXYsIGJyaWRnZS0KPiA+ID4gPmVuYyk7Cj4gPiA+
ICvCoMKgwqDCoMKgwqDCoGlmIChJU19FUlIoYnJpZGdlLT5jb25uKSkgewo+ID4gPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZGV2X2Vycihkcm1fZGV2LT5kZXYsCj4gPiA+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIkNhbm5vdCBjcmVhdGUg
Y29ubmVjdG9yIGZvciBvdXRwdXQgJXVcbiIsCj4gPiA+IG91dHB1dCk7Cj4gPiA+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXQgPSBQVFJfRVJSKGJyaWRnZS0+Y29ubik7Cj4gPiA+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gRVJSX1BUUihyZXQpOwo+ID4g
PiArwqDCoMKgwqDCoMKgwqB9Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoGRybV9jb25uZWN0b3JfYXR0
YWNoX2VuY29kZXIoYnJpZGdlLT5jb25uLCBicmlkZ2UtPmVuYyk7Cj4gPiA+ICsKPiA+ID4gK8Kg
wqDCoMKgwqDCoMKgcmV0dXJuIGJyaWRnZTsKPiA+ID4gK30KPiA+IAo+ID4gT3RoZXIgdGhhbiB0
aGF0IExHVE0uCj4gPiAKPiAKCi0tIApXaXRoIGJlc3Qgd2lzaGVzCkRtaXRyeQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
