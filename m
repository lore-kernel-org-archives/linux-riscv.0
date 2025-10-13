Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40BD0CCA476
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Oct 2025 09:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=62ej9SOsB8BSNW5ueDfq0OVgcQNxIkA8p7SULhOWcy8=; b=0u//uE8SASLHmQ
	0UU5/YN2vWuRFvtt4l8WhfoC2iw5SqhSIq/D0PCEhTp7uboS3+DhTpqTnsAh7bt8c2maUKSeOqU6X
	PhchzJyEV5WasieBiIctFZNezvFSpkALLMLp0OQJVy7CrUxFUaX8pFboaqccpb6f6+cmofjU3PDoo
	6WmlUa3xqnyebBuFsuFwbNdXvZzDUMM0Y9SYYMLj+N6QTzmueVEVKHNY63AZy9k4+vXhR0r0EEKEw
	qnjLsHkpDFIUp7H5BnwawXNC5MR0nuZm8x24ClzG1j2osvsLyV9KvReBtNyiOvId02RvSennik/GE
	eCrmk+lhKlybIydF2SYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8FGB-0000000CoT3-3X4m;
	Mon, 13 Oct 2025 09:54:31 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8FG8-0000000CoRj-3h2V;
	Mon, 13 Oct 2025 09:54:30 +0000
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59CItNjC016803;
	Mon, 13 Oct 2025 09:54:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Z4zvsJ
	gRbqk2uOgXGdCBLemP+s3D2MhNTErwRnrv45Y=; b=Qw+WLgxeXvUW6V8iM0+k6s
	kA3H6QLObi5JJmvPMKCOtXTlnNKd60rJxP/orofeYoab9gjCaxJP7GQMccIJbVCw
	64Tuei/2QQByB/2ZrCglB7QWowuw2LqoGHtcUZeogLriSmjlKmsPMlcDrBIIy7yi
	MAmE+24pxTfxq53q51aq7ggsbbV59cJHtnwkIgO491yKyam5VyiMTAOLP3UtzXNZ
	Q8OLEuVCXh09frmVwZ7qsJni+ZlH4osUl7uqoMUpjA4aH5r6uh3CTW2Kg1gegmzZ
	q3or63P3s9ZlhuhF1+X0EjI5goxMTHroXjCowhFaDNzPNhTWXe+tEp6LKoirTq0w
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49qewtr6rj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Oct 2025 09:54:04 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 59D9s3j8013035;
	Mon, 13 Oct 2025 09:54:03 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49qewtr6rf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Oct 2025 09:54:03 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 59D99IXs015178;
	Mon, 13 Oct 2025 09:54:02 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 49r1jrwdnc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Oct 2025 09:54:02 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 59D9s17c33096440
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Oct 2025 09:54:01 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CB3AA5805E;
	Mon, 13 Oct 2025 09:54:01 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DC4D558052;
	Mon, 13 Oct 2025 09:53:55 +0000 (GMT)
Received: from [9.111.15.176] (unknown [9.111.15.176])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 13 Oct 2025 09:53:55 +0000 (GMT)
Message-ID: <5165448792268e184e508a9c76fa0ce382a4a389.camel@linux.ibm.com>
Subject: Re: [PATCH v1 02/20] iommu: Introduce a test_dev domain op and an
 internal helper
From: Niklas Schnelle <schnelle@linux.ibm.com>
To: Nicolin Chen <nicolinc@nvidia.com>, joro@8bytes.org, jgg@nvidia.com,
        kevin.tian@intel.com
Cc: suravee.suthikulpanit@amd.com, will@kernel.org, robin.murphy@arm.com,
        sven@kernel.org, j@jannau.net, jean-philippe@linaro.org,
        robin.clark@oss.qualcomm.com, dwmw2@infradead.org,
        baolu.lu@linux.intel.com, yong.wu@mediatek.com, matthias.bgg@gmail.com,
        angelogioacchino.delregno@collabora.com, tjeznach@rivosinc.com,
        pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
        heiko@sntech.de, mjrosato@linux.ibm.com, wens@csie.org,
        jernej.skrabec@gmail.com, samuel@sholland.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        virtualization@lists.linux.dev, patches@lists.linux.dev
Date: Mon, 13 Oct 2025 11:53:55 +0200
In-Reply-To: <32ce256a2ece5d63e99d5858f953586859818ffc.1760312725.git.nicolinc@nvidia.com>
References: <cover.1760312725.git.nicolinc@nvidia.com>
	 <32ce256a2ece5d63e99d5858f953586859818ffc.1760312725.git.nicolinc@nvidia.com>
Autocrypt: addr=schnelle@linux.ibm.com; prefer-encrypt=mutual; keydata=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
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ja8dMn81Ji4yLbr55cE_Ms7S-Y6FhoQZ
X-Authority-Analysis: v=2.4 cv=Kr1AGGWN c=1 sm=1 tr=0 ts=68eccc3c cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=Ikd4Dj_1AAAA:8 a=VnNF1IyMAAAA:8
 a=2r8vE0gUvGf4FGDepHgA:9 a=QEXdDO2ut3YA:10 a=DXsff8QfwkrTrK3sU8N1:22
 a=Z5ABNNGmrOfJ6cZ5bIyy:22 a=bWyr8ysk75zN3GCy5bjg:22
X-Proofpoint-ORIG-GUID: W_vlSK1gr5FYYE4DJOMkPdPg_D8wMkht
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNCBTYWx0ZWRfX5ZHcU7Bp3WCb
 OcOu2OBfw8Sh3iGoeLPLO48LoatK4FR/vYxBENU6+YeNkaHuYg7bQUMAJX9bxXTbHD7H0mZb+TZ
 2m/uxx1NV+Q05fWL3vuFTP0nd7yoRlL5eGr6NzjGUImm95PRC68gGIQocOtzIpmCWriF8QwHXGu
 yUpjQ/l1cBKGzGS5D4xiwB/3T3aYg4Kzoa4AgmbMqzdSwnBpbOF2YCpuuiyG1E7PtdePeweCobZ
 Y5LaAjzvml1CN8wR1K0KIVfjU6FiS7odd8x0PckUi4/xxiigPnm2A5rBbhaCMMOoZ7PWhaZ5Bpm
 WXdkfRFixjkEuyv75YMa5J/HWXNa6/w2gf+ZdwO8oRInZZRVgDaJZb3xjE0iVaZD2aimoYcxXPO
 b9SXrfyC8KmYW8cwpBtmJf1mYePvDQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1011 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110014
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_025428_917145_ACC8A9DB 
X-CRM114-Status: GOOD (  38.48  )
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

T24gU3VuLCAyMDI1LTEwLTEyIGF0IDE3OjA0IC0wNzAwLCBOaWNvbGluIENoZW4gd3JvdGU6Cj4g
QWRkIGEgbmV3IHRlc3RfZGV2IGRvbWFpbiBvcCBmb3IgZHJpdmVyIHRvIHRlc3QgdGhlIGNvbXBh
dGliaWxpdHkgYmV0d2Vlbgo+IGEgZG9tYWluIGFuZCBhIGRldmljZSBhdCB0aGUgZHJpdmVyIGxl
dmVsLCBiZWZvcmUgY2FsbGluZyBpbnRvIHRoZSBhY3R1YWwKPiBhdHRhY2htZW50L3JlcGxhY2Vt
ZW50IG9mIGEgZG9tYWluLiBTdXBwb3J0IHBhc2lkIGZvciBzZXRfZGV2X3Bhc2lkIGNhbGwuCj4g
Cj4gTW92ZSBleGlzdGluZyBjb3JlLWxldmVsIGNvbXBhdGliaWxpdHkgdGVzdHMgdG8gYSBoZWxw
ZXIgZnVuY3Rpb24uIEludm9rZQo+IGl0IHByaW9yIHRvOgo+ICAqIF9faW9tbXVfYXR0YWNoX2Rl
dmljZSgpIG9yIGl0cyB3cmFwcGVyIF9faW9tbXVfZGV2aWNlX3NldF9kb21haW4oKQo+ICAqIF9f
aW9tbXVfc2V0X2dyb3VwX3Bhc2lkKCkKClNob3VsZCB0aGlzIGxpc3QgYWxzbyBpbmNsdWRlIGlv
bW11X2RlZmVycmVkX2F0dGFjaCgpPyBUaGUgY29kZSBkb2VzCmluY2x1ZGUgaXQuCgo+IAo+IEFu
ZCBrZWVwIHRoZW0gd2l0aGluIHRoZSBncm91cC0+bXV0ZXgsIHNvIGRyaXZlcnMgY2FuIHNpbXBs
eSBtb3ZlIGFsbCB0aGUKPiBzYW5pdHkgYW5kIGNvbXBhdGliaWxpdHkgdGVzdHMgZnJvbSB0aGVp
ciBhdHRhY2hfZGV2IGNhbGxiYWNrcyB0byB0aGUgbmV3Cj4gdGVzdF9kZXYgY2FsbGJhY2tzIHdp
dGhvdXQgY29uY2VybmluZyBhYm91dCBhIHJhY2UgY29uZGl0aW9uLgo+IAo+IFRoaXMgbWF5IGJl
IGEgcHVibGljIEFQSSBzb21lZGF5IGZvciBWRklPL0lPTU1VRkQgdG8gcnVuIGEgbGlzdCBvZiBh
dHRhY2gKPiB0ZXN0cyB3aXRob3V0IGRvaW5nIGFueSBhY3R1YWwgYXR0YWNobWVudCwgd2hpY2gg
bWF5IHJlc3VsdCBpbiBhIGxpc3Qgb2YKPiBmYWlsZWQgdGVzdHMuIFNvIGVuY291cmFnZSBkcml2
ZXJzIHRvIGF2b2lkIHByaW50a3MgdG8gcHJldmVudCBrZXJuZWwgbG9nCj4gc3BhbS4KPiAKPiBT
dWdnZXN0ZWQtYnk6IEphc29uIEd1bnRob3JwZSA8amdnQG52aWRpYS5jb20+Cj4gU2lnbmVkLW9m
Zi1ieTogTmljb2xpbiBDaGVuIDxuaWNvbGluY0BudmlkaWEuY29tPgo+IC0tLQo+ICBpbmNsdWRl
L2xpbnV4L2lvbW11LmggfCAgMTcgKysrKystLQo+ICBkcml2ZXJzL2lvbW11L2lvbW11LmMgfCAx
MTEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tCj4gIDIgZmlsZXMg
Y2hhbmdlZCwgOTMgaW5zZXJ0aW9ucygrKSwgMzUgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdp
dCBhL2luY2x1ZGUvbGludXgvaW9tbXUuaCBiL2luY2x1ZGUvbGludXgvaW9tbXUuaAo+IGluZGV4
IDgwMWIyYmQ5ZThkNDkuLjJlYzk5NTAyZGMyOWMgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51
eC9pb21tdS5oCj4gKysrIGIvaW5jbHVkZS9saW51eC9pb21tdS5oCj4gQEAgLTcxNCw3ICs3MTQs
MTIgQEAgc3RydWN0IGlvbW11X29wcyB7Cj4gIAo+ICAvKioKPiAgICogc3RydWN0IGlvbW11X2Rv
bWFpbl9vcHMgLSBkb21haW4gc3BlY2lmaWMgb3BlcmF0aW9ucwo+IC0gKiBAYXR0YWNoX2Rldjog
YXR0YWNoIGFuIGlvbW11IGRvbWFpbiB0byBhIGRldmljZQo+ICsgKiBAdGVzdF9kZXY6IFRlc3Qg
Y29tcGF0aWJpbGl0eSBwcmlvciB0byBhbiBAYXR0YWNoX2RldiBvciBAc2V0X2Rldl9wYXNpZCBj
YWxsLgo+ICsgKiAgICAgICAgICAgIEEgZHJpdmVyLWxldmVsIGNhbGxiYWNrIG9mIHRoaXMgb3Ag
c2hvdWxkIGRvIGEgdGhvcm91Z2ggc2FuaXR5LCB0bwoKWW91J3JlIG1pc3NpbmcgdGhlIHdvcmQg
ImNoZWNrIiBhYm92ZS4KCj4gKyAqICAgICAgICAgICAgbWFrZSBzdXJlIGEgZGV2aWNlIGlzIGNv
bXBhdGlibGUgd2l0aCB0aGUgZG9tYWluLiBTbyB0aGUgZm9sbG93aW5nCj4gKyAqICAgICAgICAg
ICAgQGF0dGFjaF9kZXYgYW5kIEBzZXRfZGV2X3Bhc2lkIGZ1bmN0aW9ucyB3b3VsZCBsaWtlbHkg
c3VjY2VlZCB3aXRoCj4gKyAqICAgICAgICAgICAgb25seSBvbmUgZXhjZXB0aW9uIGR1ZSB0byBh
IHRlbXBvcmFyeSBmYWlsdXJlIGxpa2Ugb3V0IG9mIG1lbW9yeS4KCk5pdDogIuKApiBvbmx5IG9u
ZSBleGNlcHRpb24g4oCmIiAvICLigKYgbGlrZSBvdXQgb2YgbWVtb3J5IOKApiIgdGhpcyBzb3Vu
ZHMgYQpiaXQgb2RkIHRvIG1lIGJlY2F1c2Ugb24gdGhlIG9uZSBoYW5kIGl0J3Mgb25lIGV4Y2Vw
dGlvbiBidXQgdGhlbiBhbHNvCmEgZ3JvdXAgKHRlbXBvcmFyeSBmYWlsdXJlcykuCgpNYXliZSBi
ZXR0ZXI6CiLigKYgd291bGQgbGlrZWx5IHN1Y2NlZWQgd2l0aCBvbmx5IHRoZSBleGNlcHRpb24g
b2YgdGVtcG9yYXJ5IGZhaWx1cmVzCmxpa2Ugb3V0IG9mIG1lbW9yeS4iPwoKPiArICogICAgICAg
ICAgICBJdCdzIHN1Z2dlc3RlZCB0byBhdm9pZCB0aGUga2VybmVsIHByaW50cyBpbiB0aGlzIG9w
Lgo+ICAgKiAgUmV0dXJuOgo+ICAgKiAqIDAJCS0gc3VjY2Vzcwo+ICAgKiAqIEVJTlZBTAktIGNh
biBpbmRpY2F0ZSB0aGF0IGRldmljZSBhbmQgZG9tYWluIGFyZSBpbmNvbXBhdGlibGUgZHVlIHRv
Cj4gQEAgLTcyMiwxMSArNzI3LDE1IEBAIHN0cnVjdCBpb21tdV9vcHMgewo+ICAgKgkJICBkcml2
ZXIgc2hvdWxkbid0IGxvZyBhbiBlcnJvciwgc2luY2UgaXQgaXMgbGVnaXRpbWF0ZSBmb3IgYQo+
ICAgKgkJICBjYWxsZXIgdG8gdGVzdCByZXVzZSBvZiBleGlzdGluZyBkb21haW5zLiBPdGhlcndp
c2UsIGl0IG1heQo+ICAgKgkJICBzdGlsbCByZXByZXNlbnQgc29tZSBvdGhlciBmdW5kYW1lbnRh
bCBwcm9ibGVtCj4gLSAqICogRU5PTUVNCS0gb3V0IG9mIG1lbW9yeQo+IC0gKiAqIEVOT1NQQwkt
IG5vbi1FTk9NRU0gdHlwZSBvZiByZXNvdXJjZSBhbGxvY2F0aW9uIGZhaWx1cmVzCj4gICAqICog
RUJVU1kJLSBkZXZpY2UgaXMgYXR0YWNoZWQgdG8gYSBkb21haW4gYW5kIGNhbm5vdCBiZSBjaGFu
Z2VkCj4gICAqICogRU5PREVWCS0gZGV2aWNlIHNwZWNpZmljIGVycm9ycywgbm90IGFibGUgdG8g
YmUgYXR0YWNoZWQKPiAgICogKiA8b3RoZXJzPgktIHRyZWF0ZWQgYXMgRU5PREVWIGJ5IHRoZSBj
YWxsZXIuIFVzZSBpcyBkaXNjb3VyYWdlZAo+ICsgKiBAYXR0YWNoX2RldjogYXR0YWNoIGFuIGlv
bW11IGRvbWFpbiB0byBhIGRldmljZQo+ICsgKiAgUmV0dXJuOgo+ICsgKiAqIDAJCS0gc3VjY2Vz
cwo+ICsgKiAqIEVOT01FTQktIG91dCBvZiBtZW1vcnkKPiArICogKiBFTk9TUEMJLSBub24tRU5P
TUVNIHR5cGUgb2YgcmVzb3VyY2UgYWxsb2NhdGlvbiBmYWlsdXJlcwo+ICsgKiAqIDxvdGhlcnM+
CS0gVXNlIGlzIGRpc2NvdXJhZ2VkCj4gICAqIEBzZXRfZGV2X3Bhc2lkOiBzZXQgb3IgcmVwbGFj
ZSBhbiBpb21tdSBkb21haW4gdG8gYSBwYXNpZCBvZiBkZXZpY2UuIFRoZSBwYXNpZCBvZgo+ICAg
KiAgICAgICAgICAgICAgICAgdGhlIGRldmljZSBzaG91bGQgYmUgbGVmdCBpbiB0aGUgb2xkIGNv
bmZpZyBpbiBlcnJvciBjYXNlLgo+ICAgKiBAbWFwX3BhZ2VzOiBtYXAgYSBwaHlzaWNhbGx5IGNv
bnRpZ3VvdXMgc2V0IG9mIHBhZ2VzIG9mIHRoZSBzYW1lIHNpemUgdG8KPiBAQCAtNzUxLDYgKzc2
MCw4IEBAIHN0cnVjdCBpb21tdV9vcHMgewo+ICAgKiBAZnJlZTogUmVsZWFzZSB0aGUgZG9tYWlu
IGFmdGVyIHVzZS4KPiAgICovCj4gIHN0cnVjdCBpb21tdV9kb21haW5fb3BzIHsKPiArCWludCAo
KnRlc3RfZGV2KShzdHJ1Y3QgaW9tbXVfZG9tYWluICpkb21haW4sIHN0cnVjdCBkZXZpY2UgKmRl
diwKPiArCQkJaW9hc2lkX3QgcGFzaWQsIHN0cnVjdCBpb21tdV9kb21haW4gKm9sZCk7Cj4gIAlp
bnQgKCphdHRhY2hfZGV2KShzdHJ1Y3QgaW9tbXVfZG9tYWluICpkb21haW4sIHN0cnVjdCBkZXZp
Y2UgKmRldiwKPiAgCQkJICBzdHJ1Y3QgaW9tbXVfZG9tYWluICpvbGQpOwo+ICAJaW50ICgqc2V0
X2Rldl9wYXNpZCkoc3RydWN0IGlvbW11X2RvbWFpbiAqZG9tYWluLCBzdHJ1Y3QgZGV2aWNlICpk
ZXYsCj4gCi0tLSBzbmlwIC0tLQo+IEBAIC0zNjE1LDYgKzM2NTcsMTEgQEAgaW50IGlvbW11X3Jl
cGxhY2VfZGV2aWNlX3Bhc2lkKHN0cnVjdCBpb21tdV9kb21haW4gKmRvbWFpbiwKPiAgCXJldCA9
IDA7Cj4gIAo+ICAJaWYgKGN1cnJfZG9tYWluICE9IGRvbWFpbikgewo+ICsJCXJldCA9IF9faW9t
bXVfZG9tYWluX3Rlc3RfZGV2aWNlKGRvbWFpbiwgZGV2LCBwYXNpZCwKPiArCQkJCQkJIGN1cnJf
ZG9tYWluKTsKPiArCQlpZiAocmV0KQo+ICsJCQlnb3RvIG91dF91bmxvY2s7Cj4gKwo+ICAJCXJl
dCA9IF9faW9tbXVfc2V0X2dyb3VwX3Bhc2lkKGRvbWFpbiwgZ3JvdXAsCj4gIAkJCQkJICAgICAg
cGFzaWQsIGN1cnJfZG9tYWluKTsKPiAgCQlpZiAocmV0KQoKQXBhcnQgZnJvbSB0aGUgY29tbWVu
dCBhbmQgY29tbWl0IGRlc2NyaXB0aW9uIG5pdHMgbWVudGlvbmVkIGFib3ZlIHRoaXMKbG9va3Mg
Z29vZCB0byBtZS4KClJldmlld2VkLWJ5OiBOaWtsYXMgU2NobmVsbGUgPHNjaG5lbGxlQGxpbnV4
LmlibS5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
