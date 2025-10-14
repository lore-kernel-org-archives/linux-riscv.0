Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0531FCCD192
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Oct 2025 14:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zv49LL/Pdru6xzsuoTIsCK53uOCeTltfdVPiU1wjSqw=; b=wLUHWTHTBfFlzm
	w7nsKfygZ6V2jezIGPzfgDgit1c7UdwAGGzdfhwiafqOXW9egEpg9dVXxQTMCtDiHgJbnvriS/2eK
	Kf/+rGnExVifnbVefGMzm+8nfQtCCErdh1y1/pHpvevIHRP8GuDwnwUpxEjnwz/ACVXl1fYL5Pie+
	Glu+kmRbWQd9KMDY3+SIdgcdhpGCp/uChDPzbWxATwH0Hr4Khf/gZZ6Eayn5QdIkNc29/5KqL3cco
	uLB22ZOtev+rYqUS0kO0Pt13oh0ARDPE+Tyl4gYpA7pnOUsIQZ+IjpMu5Drch2wqedHNX5qrDfXFp
	Qt8ZQ2Q3O/OKUKkkFOjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8fu8-0000000GbmK-18c5;
	Tue, 14 Oct 2025 14:21:32 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8fu3-0000000GbkS-0G4h;
	Tue, 14 Oct 2025 14:21:28 +0000
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59EB7WPm015294;
	Tue, 14 Oct 2025 14:20:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=2EBKHt
	oFBxc6VeU5knOorwmqOfQ2r5EFkZDTHtXao5E=; b=e+iErGsKOcPSWwqu9PWl+V
	fkDZNS6kdV7P2KCoLq1fa7FBu0rykqEZgBU+rOfEoQHCPSO4ZzAP8Zz900qrEQps
	tkOQzIVN5/KI1gfTqOdHd3M2zoH1vf7mXU8vpYmq1iaemnW78g7AlLmcp9GTlyYc
	yjqv1WmnHnxmQClIlgK/XYpB4D5H0y/juE2t8gq1crr96GS8HgmbyhykU7ddEoNs
	9+ut4mXXV7h37EzEaFNYEEBARSVYr7Gd9axEWeJR2Uike+Qdu91Qg8SHfxKri2/f
	UVY8jSF0EEcuOm4sdu5HQv4d2f6DYvu97LE3nnPTj2P0qWuoSD7EUBq4btwwdsmg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49qdnperrq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Oct 2025 14:20:54 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 59EDwQXc002823;
	Tue, 14 Oct 2025 14:20:53 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49qdnperrk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Oct 2025 14:20:53 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 59ECK0J5015016;
	Tue, 14 Oct 2025 14:20:52 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 49r3sjb467-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Oct 2025 14:20:52 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 59EEKput32637650
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Oct 2025 14:20:52 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CD13F58045;
	Tue, 14 Oct 2025 14:20:51 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8B33958050;
	Tue, 14 Oct 2025 14:20:45 +0000 (GMT)
Received: from [9.152.212.179] (unknown [9.152.212.179])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 14 Oct 2025 14:20:45 +0000 (GMT)
Message-ID: <21f4afb4069489729cf90469abf2d1321ed17bec.camel@linux.ibm.com>
Subject: Re: [PATCH v1 02/20] iommu: Introduce a test_dev domain op and an
 internal helper
From: Niklas Schnelle <schnelle@linux.ibm.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: joro@8bytes.org, jgg@nvidia.com, kevin.tian@intel.com,
        suravee.suthikulpanit@amd.com, will@kernel.org, robin.murphy@arm.com,
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
Date: Tue, 14 Oct 2025 16:20:44 +0200
In-Reply-To: <aO01TkkA7ZLDgqXg@Asurada-Nvidia>
References: <cover.1760312725.git.nicolinc@nvidia.com>
	 <32ce256a2ece5d63e99d5858f953586859818ffc.1760312725.git.nicolinc@nvidia.com>
	 <5165448792268e184e508a9c76fa0ce382a4a389.camel@linux.ibm.com>
	 <aO01TkkA7ZLDgqXg@Asurada-Nvidia>
Autocrypt: addr=schnelle@linux.ibm.com; prefer-encrypt=mutual; keydata=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
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAwNSBTYWx0ZWRfXyPWIZGa5NMw1
 5v70l2Ww8AWvh621mUnLUAYE/ED96Pe5OBNjx+T+yOpOYZKOVbv5c+zNL4MaaidGUUewI4h+RPc
 g0E1F3gK1wLubbLBdsog5mLrvfjitsIwvDRw75KLemF9SeNqT+G/Nuaa8d/vXw6iSbw2kh17CRZ
 8lLEmCLHmxUaCudFgXf/K/0irflo7WFbZpZ1QUigJlnLverbUXD5o/E7tnTxrPgEkC6C4OywGtj
 PQuPcCwTBFc+7x9EPB4tqKNkif80ZpbnF//ZeD1HHYGjalO0z/Y1T7BbNR53Vqzy3t2rP0aEixa
 DKgQERlLbCZoUhlBsi6Ruc63AXeG3F/UsYACHqqLTA9xlaPB1vkKXEQtm6PhTC8grABEzCx0x+p
 Z81k8ypovNnBaN/uwtOLeHGJBdtXyQ==
X-Proofpoint-ORIG-GUID: 8Tn8OuynM52x8dQ7re618PDx0uY-TkIk
X-Proofpoint-GUID: r6fD6B6EQarBaIKpq995teTAJbSfnKM6
X-Authority-Analysis: v=2.4 cv=MoxfKmae c=1 sm=1 tr=0 ts=68ee5c46 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=cyMajOFANgF3YnkSg8AA:9 a=QEXdDO2ut3YA:10 a=DXsff8QfwkrTrK3sU8N1:22
 a=Z5ABNNGmrOfJ6cZ5bIyy:22 a=bWyr8ysk75zN3GCy5bjg:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110005
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_072127_232861_56A3D92F 
X-CRM114-Status: GOOD (  25.27  )
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

T24gTW9uLCAyMDI1LTEwLTEzIGF0IDEwOjIyIC0wNzAwLCBOaWNvbGluIENoZW4gd3JvdGU6Cj4g
SGkgTmlrbGFzLAo+IAo+IE9uIE1vbiwgT2N0IDEzLCAyMDI1IGF0IDExOjUzOjU1QU0gKzAyMDAs
IE5pa2xhcyBTY2huZWxsZSB3cm90ZToKPiA+IE9uIFN1biwgMjAyNS0xMC0xMiBhdCAxNzowNCAt
MDcwMCwgTmljb2xpbiBDaGVuIHdyb3RlOgo+ID4gPiBBZGQgYSBuZXcgdGVzdF9kZXYgZG9tYWlu
IG9wIGZvciBkcml2ZXIgdG8gdGVzdCB0aGUgY29tcGF0aWJpbGl0eSBiZXR3ZWVuCj4gPiA+IGEg
ZG9tYWluIGFuZCBhIGRldmljZSBhdCB0aGUgZHJpdmVyIGxldmVsLCBiZWZvcmUgY2FsbGluZyBp
bnRvIHRoZSBhY3R1YWwKPiA+ID4gYXR0YWNobWVudC9yZXBsYWNlbWVudCBvZiBhIGRvbWFpbi4g
U3VwcG9ydCBwYXNpZCBmb3Igc2V0X2Rldl9wYXNpZCBjYWxsLgo+ID4gPiAKPiA+ID4gTW92ZSBl
eGlzdGluZyBjb3JlLWxldmVsIGNvbXBhdGliaWxpdHkgdGVzdHMgdG8gYSBoZWxwZXIgZnVuY3Rp
b24uIEludm9rZQo+ID4gPiBpdCBwcmlvciB0bzoKPiA+ID4gICogX19pb21tdV9hdHRhY2hfZGV2
aWNlKCkgb3IgaXRzIHdyYXBwZXIgX19pb21tdV9kZXZpY2Vfc2V0X2RvbWFpbigpCj4gPiA+ICAq
IF9faW9tbXVfc2V0X2dyb3VwX3Bhc2lkKCkKPiA+IAo+ID4gU2hvdWxkIHRoaXMgbGlzdCBhbHNv
IGluY2x1ZGUgaW9tbXVfZGVmZXJyZWRfYXR0YWNoKCk/IFRoZSBjb2RlIGRvZXMKPiA+IGluY2x1
ZGUgaXQuCj4gCj4gaW9tbXVfZGVmZXJyZWRfYXR0YWNoKCkgaW52b2tlcyBfX2lvbW11X2F0dGFj
aF9kZXZpY2UoKSwgc28gaXQgaXMKPiBhbHJlYWR5IGluY2x1ZGVkIGluIHRoZSBsaXN0IDopCgpP
ayBtYWtlcyBzZW5zZSwgdGhvdWdoIGl0IGRvZXMgbGlzdCBfX2lvbW11X2RldmljZV9zZXRfZG9t
YWluKCkKc2VwYXJhdGVseS4gRWl0aGVyIHdheSBpcyBmaW5lIGZvciBtZS4KCj4gCj4gPiA+ICAv
KioKPiA+ID4gICAqIHN0cnVjdCBpb21tdV9kb21haW5fb3BzIC0gZG9tYWluIHNwZWNpZmljIG9w
ZXJhdGlvbnMKPiA+ID4gLSAqIEBhdHRhY2hfZGV2OiBhdHRhY2ggYW4gaW9tbXUgZG9tYWluIHRv
IGEgZGV2aWNlCj4gPiA+ICsgKiBAdGVzdF9kZXY6IFRlc3QgY29tcGF0aWJpbGl0eSBwcmlvciB0
byBhbiBAYXR0YWNoX2RldiBvciBAc2V0X2Rldl9wYXNpZCBjYWxsLgo+ID4gPiArICogICAgICAg
ICAgICBBIGRyaXZlci1sZXZlbCBjYWxsYmFjayBvZiB0aGlzIG9wIHNob3VsZCBkbyBhIHRob3Jv
dWdoIHNhbml0eSwgdG8KPiA+IAo+ID4gWW91J3JlIG1pc3NpbmcgdGhlIHdvcmQgImNoZWNrIiBh
Ym92ZS4KPiAKPiBBY2suCj4gCj4gPiA+ICsgKiAgICAgICAgICAgIG1ha2Ugc3VyZSBhIGRldmlj
ZSBpcyBjb21wYXRpYmxlIHdpdGggdGhlIGRvbWFpbi4gU28gdGhlIGZvbGxvd2luZwo+ID4gPiAr
ICogICAgICAgICAgICBAYXR0YWNoX2RldiBhbmQgQHNldF9kZXZfcGFzaWQgZnVuY3Rpb25zIHdv
dWxkIGxpa2VseSBzdWNjZWVkIHdpdGgKPiA+ID4gKyAqICAgICAgICAgICAgb25seSBvbmUgZXhj
ZXB0aW9uIGR1ZSB0byBhIHRlbXBvcmFyeSBmYWlsdXJlIGxpa2Ugb3V0IG9mIG1lbW9yeS4KPiA+
IAo+ID4gTml0OiAi4oCmIG9ubHkgb25lIGV4Y2VwdGlvbiDigKYiIC8gIuKApiBsaWtlIG91dCBv
ZiBtZW1vcnkg4oCmIiB0aGlzIHNvdW5kcyBhCj4gPiBiaXQgb2RkIHRvIG1lIGJlY2F1c2Ugb24g
dGhlIG9uZSBoYW5kIGl0J3Mgb25lIGV4Y2VwdGlvbiBidXQgdGhlbiBhbHNvCj4gPiBhIGdyb3Vw
ICh0ZW1wb3JhcnkgZmFpbHVyZXMpLgo+ID4gCj4gPiBNYXliZSBiZXR0ZXI6Cj4gPiAi4oCmIHdv
dWxkIGxpa2VseSBzdWNjZWVkIHdpdGggb25seSB0aGUgZXhjZXB0aW9uIG9mIHRlbXBvcmFyeSBm
YWlsdXJlcwo+ID4gbGlrZSBvdXQgb2YgbWVtb3J5LiI/Cj4gCj4gU3VyZS4gSSBjYW4gZG8gdGhh
dC4gRml4aW5nIGJvdGggcGFydHMsIGl0IHdvdWxkIGJlOgo+IAo+ICAqIEB0ZXN0X2RldjogVGVz
dCBjb21wYXRpYmlsaXR5IHByaW9yIHRvIGFuIEBhdHRhY2hfZGV2IG9yIEBzZXRfZGV2X3Bhc2lk
IGNhbGwuCj4gICogICAgICAgICAgICBBIGRyaXZlciBjYWxsYmFjayBvZiB0aGlzIG9wIHNob3Vs
ZCBkbyBhIHRob3JvdWdoIHNhbml0eSBjaGVjaywgdG8KPiAgKiAgICAgICAgICAgIG1ha2Ugc3Vy
ZSBhIGRldmljZSBpcyBjb21wYXRpYmxlIHdpdGggdGhlIGRvbWFpbiwgc28gdGhlIGZvbGxvd2lu
Zwo+ICAqICAgICAgICAgICAgQGF0dGFjaF9kZXYgYW5kIEBzZXRfZGV2X3Bhc2lkIGZ1bmN0aW9u
cyB3b3VsZCBsaWtlbHkgc3VjY2VlZCB3aXRoCj4gICogICAgICAgICAgICBvbmx5IHRoZSBleGNl
cHRpb24gb2YgdGVtcG9yYXJ5IGZhaWx1cmVzIGxpa2Ugb3V0IG9mIG1lbW9yeS4KPiAKClNvdW5k
cyBnb29kLCB0aGFua3MhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
