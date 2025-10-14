Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 622DDCCD187
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Oct 2025 05:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oj8i0eLgJOYZyQPJT5OHkNsLK8Q4vLBJ0zCoRM67/+I=; b=sYRx2yCSm9wdk0
	R/X2CGmvXuiNUsFiMg/Q6s6E8xNqedlgVrRCsvfJNElaeDmxf1+sDBBuHkEr1H8y7swWRSuDfvyWu
	pDLACKm6jbMZx0vepxcmpQaovv9TrPou3E2Ke1ZfhUp0IJnhnbXuamcrKson1yRl7gmTdtUm1z7kp
	NEC7zKDNQiKqpdC2fUxipENRKLIPMVENXUrFlalZcfWUAMR3OZdHtmM9DT8HMXmrafGBdldu8JviX
	A3Jx+NJ1SdUk3eC3T+XHjXolVMKjmeqbuhM7j8Uwjlfdcsh19AYb3jHNdn4Y2voHYNV56CHgSPYKx
	eXXa8ydETxKMlIYfOetg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Xxz-0000000FF76-2e5Q;
	Tue, 14 Oct 2025 05:52:59 +0000
Received: from omta038.useast.a.cloudfilter.net ([44.202.169.37])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Xxv-0000000FF6n-41QI
	for linux-riscv@lists.infradead.org;
	Tue, 14 Oct 2025 05:52:57 +0000
Received: from eig-obgw-6005b.ext.cloudfilter.net ([10.0.30.162])
	by cmsmtp with ESMTPS
	id 8LkJv2x8kSkcf8XxuvtnAm; Tue, 14 Oct 2025 05:52:54 +0000
Received: from box5620.bluehost.com ([162.241.219.59])
	by cmsmtp with ESMTPS
	id 8XxtvzqFNLidY8XxtvrTJs; Tue, 14 Oct 2025 05:52:53 +0000
X-Authority-Analysis: v=2.4 cv=bq1MBFai c=1 sm=1 tr=0 ts=68ede535
 a=30941lsx5skRcbJ0JMGu9A==:117 a=30941lsx5skRcbJ0JMGu9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=7vwVE5O1G3EA:10 a=HaFmDPmJAAAA:8
 a=rGH4yh80M_cO9nZo6tcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=nmWuMzfKamIsx3l42hEX:22 a=Wh1V8bzkS9CpCxOpQUxp:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=w6rz.net;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tjFZRGr9e1ufehZZIU8TnF6ufx2C24WBWJ4fCdRYGpU=; b=fs+OCGSrJSqmZXQAoNGP1aKdrc
	clChslfPhCxPWvpV+0l00GWwfhcAQ0qMUErxiIMYL5kISvubmAj66dwFaeHCL2VNe0G9onknkQzns
	St2AUPt5tVS227hzDCCXnRQevlu651pfYvbgi2ZbBZqcwx67JNHSmc8G5tM1a+c5gcAGsFpHRG1c4
	FR5wyrBfFb+Yr9nhw+O6rU+Z/IO29NUwQG/rukoLCJgfsK0G7RfzsiYwY+4Xa/S2hJtVosxa1Fp4A
	LDWtojpoZLj7kaHNhnwmWe5c+BCEujiasdTwpDt/s8mn/qXP1IjR/IYoEYdfNyeEqLIbn4QzQ9r92
	mm/SRhpQ==;
Received: from c-73-92-56-26.hsd1.ca.comcast.net ([73.92.56.26]:55152 helo=[10.0.1.116])
	by box5620.bluehost.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.98.1)
	(envelope-from <re@w6rz.net>)
	id 1v8Xxp-00000003IY1-3ScS;
	Mon, 13 Oct 2025 23:52:49 -0600
Message-ID: <b203ba27-7033-41d9-9b43-aa4a7eb75f23@w6rz.net>
Date: Mon, 13 Oct 2025 22:52:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: SiFive FU740 PCI driver fails on 6.18-rc1
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
 Bjorn Helgaas <helgaas@kernel.org>, Conor Dooley <conor@kernel.org>
Cc: bhelgaas@google.com, mani@kernel.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv <linux-riscv@lists.infradead.org>,
 Paul Walmsley <pjw@kernel.org>, Greentime Hu <greentime.hu@sifive.com>,
 Samuel Holland <samuel.holland@sifive.com>, regressions@lists.linux.dev
References: <20251013212801.GA865570@bhelgaas>
 <bc7deb1a-5f93-4a36-bd6a-b0600b150d48@oss.qualcomm.com>
 <95a0f2a4-3ddd-4dec-a67e-27f774edb5fd@w6rz.net>
 <759e429c-b160-46ff-923e-000415c749ee@oss.qualcomm.com>
Content-Language: en-US
From: Ron Economos <re@w6rz.net>
In-Reply-To: <759e429c-b160-46ff-923e-000415c749ee@oss.qualcomm.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - box5620.bluehost.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - w6rz.net
X-BWhitelist: no
X-Source-IP: 73.92.56.26
X-Source-L: No
X-Exim-ID: 1v8Xxp-00000003IY1-3ScS
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: c-73-92-56-26.hsd1.ca.comcast.net ([10.0.1.116]) [73.92.56.26]:55152
X-Source-Auth: re@w6rz.net
X-Email-Count: 17
X-Org: HG=bhshared;ORG=bluehost;
X-Source-Cap: d3NpeHJ6bmU7d3NpeHJ6bmU7Ym94NTYyMC5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfKLEuou6thWfKwBm+YlM02mUvul/AJ9xRu6yWkhIq6BDK6ejFOkW6TA3SEXgsFMRX9Vw0TrZC7QXi5EWd5OaMRcQh0Ef0pPdBAiO2LCdfTyE/U4EDCIw
 NW5XFuMvCgflatFvBHFt8+YdiO8BvgQ06qcbNvlRq0NVLgJG0eNp2w28mv43P7DYIrD4qEYGI1QRQNEo4HVDUmESvzfuCMapRWk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_225256_069402_7AA58BAC 
X-CRM114-Status: UNSURE (   8.61  )
X-CRM114-Notice: Please train this message.
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMTAvMTMvMjUgMjI6MzYsIEtyaXNobmEgQ2hhaXRhbnlhIENodW5kcnUgd3JvdGU6Cj4KPgo+
IE9uIDEwLzE0LzIwMjUgMTA6NTYgQU0sIFJvbiBFY29ub21vcyB3cm90ZToKPj4gT24gMTAvMTMv
MjUgMjI6MjAsIEtyaXNobmEgQ2hhaXRhbnlhIENodW5kcnUgd3JvdGU6Cj4+Pgo+Pj4KPj4+IE9u
IDEwLzE0LzIwMjUgMjo1OCBBTSwgQmpvcm4gSGVsZ2FhcyB3cm90ZToKPj4+PiBbK2NjIEZVNzQw
IGRyaXZlciBmb2xrcywgQ29ub3IsIHJlZ3Jlc3Npb25zXQo+Pj4+Cj4+Pj4gT24gTW9uLCBPY3Qg
MTMsIDIwMjUgYXQgMTI6MTQ6NTRBTSAtMDcwMCwgUm9uIEVjb25vbW9zIHdyb3RlOgo+Pj4+PiBU
aGUgU2lGaXZlIEZVNzQwIFBDSSBkcml2ZXIgZmFpbHMgb24gdGhlIEhpRml2ZSBVbm1hdGNoZWQg
Ym9hcmQgCj4+Pj4+IHdpdGggTGludXgKPj4+Pj4gNi4xOC1yYzEuIFRoZSBlcnJvciBtZXNzYWdl
IGlzOgo+Pj4+Pgo+Pj4+PiBbwqDCoMKgIDMuMTY2NjI0XSBmdTc0MC1wY2llIGUwMDAwMDAwMC5w
Y2llOiBob3N0IGJyaWRnZSAKPj4+Pj4gL3NvYy9wY2llQGUwMDAwMDAwMAo+Pj4+PiByYW5nZXM6
Cj4+Pj4+IFvCoMKgwqAgMy4xNjY3MDZdIGZ1NzQwLXBjaWUgZTAwMDAwMDAwLnBjaWU6wqDCoMKg
wqDCoMKgIElPCj4+Pj4+IDB4MDA2MDA4MDAwMC4uMHgwMDYwMDhmZmZmIC0+IDB4MDA2MDA4MDAw
MAo+Pj4+PiBbwqDCoMKgIDMuMTY2NzY3XSBmdTc0MC1wY2llIGUwMDAwMDAwMC5wY2llOsKgwqDC
oMKgwqAgTUVNCj4+Pj4+IDB4MDA2MDA5MDAwMC4uMHgwMDdmZmZmZmZmIC0+IDB4MDA2MDA5MDAw
MAo+Pj4+PiBbwqDCoMKgIDMuMTY2ODA1XSBmdTc0MC1wY2llIGUwMDAwMDAwMC5wY2llOsKgwqDC
oMKgwqAgTUVNCj4+Pj4+IDB4MjAwMDAwMDAwMC4uMHgzZmZmZmZmZmZmIC0+IDB4MjAwMDAwMDAw
MAo+Pj4+PiBbwqDCoMKgIDMuMTY2OTUwXSBmdTc0MC1wY2llIGUwMDAwMDAwMC5wY2llOiBFQ0FN
IGF0IFttZW0KPj4+Pj4gMHhkZjAwMDAwMDAtMHhkZmZmZmZmZmZdIGZvciBbYnVzIDAwLWZmXQo+
Pj4+PiBbwqDCoMKgIDMuNTc5NTAwXSBmdTc0MC1wY2llIGUwMDAwMDAwMC5wY2llOiBObyBpQVRV
IHJlZ2lvbnMgZm91bmQKPj4+Pj4gW8KgwqDCoCAzLjU3OTU1Ml0gZnU3NDAtcGNpZSBlMDAwMDAw
MDAucGNpZTogRmFpbGVkIHRvIGNvbmZpZ3VyZSBpQVRVIAo+Pj4+PiBpbiBFQ0FNCj4+Pj4+IG1v
ZGUKPj4+Pj4gW8KgwqDCoCAzLjU3OTY1NV0gZnU3NDAtcGNpZSBlMDAwMDAwMDAucGNpZTogcHJv
YmUgd2l0aCBkcml2ZXIgCj4+Pj4+IGZ1NzQwLXBjaWUKPj4+Pj4gZmFpbGVkIHdpdGggZXJyb3Ig
LTIyCj4+Pj4+Cj4+Pj4+IFRoZSBub3JtYWwgbWVzc2FnZSAob24gTGludXggNi4xNy4yKSBpczoK
Pj4+Pj4KPj4+Pj4gW8KgwqDCoCAzLjM4MTQ4N10gZnU3NDAtcGNpZSBlMDAwMDAwMDAucGNpZTog
aG9zdCBicmlkZ2UgCj4+Pj4+IC9zb2MvcGNpZUBlMDAwMDAwMDAKPj4+Pj4gcmFuZ2VzOgo+Pj4+
PiBbwqDCoMKgIDMuMzgxNTg0XSBmdTc0MC1wY2llIGUwMDAwMDAwMC5wY2llOsKgwqDCoMKgwqDC
oCBJTwo+Pj4+PiAweDAwNjAwODAwMDAuLjB4MDA2MDA4ZmZmZiAtPiAweDAwNjAwODAwMDAKPj4+
Pj4gW8KgwqDCoCAzLjM4MTY4Ml0gZnU3NDAtcGNpZSBlMDAwMDAwMDAucGNpZTrCoMKgwqDCoMKg
IE1FTQo+Pj4+PiAweDAwNjAwOTAwMDAuLjB4MDA3ZmZmZmZmZiAtPiAweDAwNjAwOTAwMDAKPj4+
Pj4gW8KgwqDCoCAzLjM4MTcyNF0gZnU3NDAtcGNpZSBlMDAwMDAwMDAucGNpZTrCoMKgwqDCoMKg
IE1FTQo+Pj4+PiAweDIwMDAwMDAwMDAuLjB4M2ZmZmZmZmZmZiAtPiAweDIwMDAwMDAwMDAKPj4+
Pj4gW8KgwqDCoCAzLjQ4NDgwOV0gZnU3NDAtcGNpZSBlMDAwMDAwMDAucGNpZTogaUFUVTogdW5y
b2xsIFQsIDggb2IsIDggCj4+Pj4+IGliLCBhbGlnbgo+Pj4+PiA0SywgbGltaXQgNDA5NkcKPj4+
Pj4gW8KgwqDCoCAzLjY4MzY3OF0gZnU3NDAtcGNpZSBlMDAwMDAwMDAucGNpZTogUENJZSBHZW4u
MSB4OCBsaW5rIHVwCj4+Pj4+IFvCoMKgwqAgMy44ODM2NzRdIGZ1NzQwLXBjaWUgZTAwMDAwMDAw
LnBjaWU6IFBDSWUgR2VuLjMgeDggbGluayB1cAo+Pj4+PiBbwqDCoMKgIDMuOTg3Njc4XSBmdTc0
MC1wY2llIGUwMDAwMDAwMC5wY2llOiBQQ0llIEdlbi4zIHg4IGxpbmsgdXAKPj4+Pj4gW8KgwqDC
oCAzLjk4ODE2NF0gZnU3NDAtcGNpZSBlMDAwMDAwMDAucGNpZTogUENJIGhvc3QgYnJpZGdlIHRv
IGJ1cyAKPj4+Pj4gMDAwMDowMAo+Pj4+Pgo+Pj4+PiBSZXZlcnRpbmcgdGhlIGZvbGxvd2luZyBj
b21taXRzIHNvbHZlcyB0aGUgaXNzdWUuCj4+Pj4+Cj4+Pj4+IDBkYTQ4YzViMmZhNzMxYjIxYmM1
MjNjODJkOTI3Mzk5YTFlNTA4YjAgUENJOiBkd2M6IFN1cHBvcnQgRUNBTSAKPj4+Pj4gbWVjaGFu
aXNtIGJ5Cj4+Pj4+IGVuYWJsaW5nIGlBVFUgJ0NGRyBTaGlmdCBGZWF0dXJlJwo+Pj4+Pgo+Pj4+
PiA0NjYwZTUwY2Y4MTgwMGY4MmVlZWNmNzQzYWQxZTNlOTdhYjcyMTkwIFBDSTogcWNvbTogUHJl
cGFyZSBmb3IgCj4+Pj4+IHRoZSBEV0MgRUNBTQo+Pj4+PiBlbmFibGVtZW50Cj4+Pj4+Cj4+Pj4+
IGY2ZmQzNTdmN2FmYmViMzRhNjMzZTU2ODhhMjNiOWQ3ZWI0OWQ1NTggUENJOiBkd2M6IFByZXBh
cmUgdGhlIAo+Pj4+PiBkcml2ZXIgZm9yCj4+Pj4+IGVuYWJsaW5nIEVDQU0gbWVjaGFuaXNtIHVz
aW5nIGlBVFUgJ0NGRyBTaGlmdCBGZWF0dXJlJwo+Pj4+Cj4+Pj4gQXMgQ29ub3IgcG9pbnRlZCBv
dXQsIHdlIGNhbid0IGZpeCBhIGNvZGUgcmVncmVzc2lvbiB3aXRoIGEgRFQgY2hhbmdlLgo+Pj4+
Cj4+Pj4gI3JlZ3pib3QgaW50cm9kdWNlZDogZjZmZDM1N2Y3YWZiICgiUENJOiBkd2M6IFByZXBh
cmUgdGhlIGRyaXZlciAKPj4+PiBmb3IgZW5hYmxpbmcgRUNBTSBtZWNoYW5pc20gdXNpbmcgaUFU
VSAnQ0ZHIFNoaWZ0IEZlYXR1cmUnIikKPj4+IEhpIENvbm9yLAo+Pj4KPj4+IENhbiB5b3UgdHJ5
IHdpdGggdGhpcyBwYXRjaCBhbmQgc2VlIGlmIGl0IGlzIGZpeGluZyB0aGUgaXNzdWUuCj4+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1mdTc0MC5jIAo+Pj4g
Yi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWZ1NzQwLmMKPj4+IGluZGV4IDY2MzY3
MjUyMDMyYi4uYjVlMGYwMTZhNTgwIDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9wY2kvY29udHJv
bGxlci9kd2MvcGNpZS1mdTc0MC5jCj4+PiArKysgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3
Yy9wY2llLWZ1NzQwLmMKPj4+IEBAIC0zMjgsNiArMzI4LDggQEAgc3RhdGljIGludCBmdTc0MF9w
Y2llX3Byb2JlKHN0cnVjdCAKPj4+IHBsYXRmb3JtX2RldmljZSAqcGRldikKPj4+Cj4+PiDCoMKg
wqDCoMKgwqDCoCBwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBhZnApOwo+Pj4KPj4+ICvCoMKg
wqDCoMKgwqAgcGNpLT5wcC5uYXRpdmVfZWNhbSA9IHRydWU7Cj4+PiArCj4+PiDCoMKgwqDCoMKg
wqDCoCByZXR1cm4gZHdfcGNpZV9ob3N0X2luaXQoJnBjaS0+cHApOwo+Pj4gwqB9Cj4+Pgo+Pj4g
LSBLcmlzaG5hIENoYWl0YW55YS4KPj4+Cj4+Pj4KPj4gSSd2ZSBhbHJlYWR5IHRyaWVkIGl0LiBJ
dCBkb2Vzbid0IHdvcmsuIFNhbWUgZXJyb3IgbWVzc2FnZSBhcyBiZWZvcmUuCj4gQ2FuIHlvdSBz
aGFyZSB1cyBkbWVzZyBsb2dzIGZvciB0aGlzIGNoYW5nZS4KPgo+IC0gS3Jpc2huYSBDaGFpdGFu
eWEuCj4+ClvCoMKgwqAgMy4xNTk3NjNdIGZ1NzQwLXBjaWUgZTAwMDAwMDAwLnBjaWU6IGhvc3Qg
YnJpZGdlIAovc29jL3BjaWVAZTAwMDAwMDAwIHJhbmdlczoKW8KgwqDCoCAzLjE1OTg1M10gZnU3
NDAtcGNpZSBlMDAwMDAwMDAucGNpZTrCoMKgwqDCoMKgwqAgSU8gCjB4MDA2MDA4MDAwMC4uMHgw
MDYwMDhmZmZmIC0+IDB4MDA2MDA4MDAwMApbwqDCoMKgIDMuMTU5OTE2XSBmdTc0MC1wY2llIGUw
MDAwMDAwMC5wY2llOsKgwqDCoMKgwqAgTUVNIAoweDAwNjAwOTAwMDAuLjB4MDA3ZmZmZmZmZiAt
PiAweDAwNjAwOTAwMDAKW8KgwqDCoCAzLjE1OTk1M10gZnU3NDAtcGNpZSBlMDAwMDAwMDAucGNp
ZTrCoMKgwqDCoMKgIE1FTSAKMHgyMDAwMDAwMDAwLi4weDNmZmZmZmZmZmYgLT4gMHgyMDAwMDAw
MDAwClvCoMKgwqAgMy4xNjAwMzldIGZ1NzQwLXBjaWUgZTAwMDAwMDAwLnBjaWU6IEVDQU0gYXQg
W21lbSAKMHhkZjAwMDAwMDAtMHhkZmZmZmZmZmZdIGZvciBbYnVzIDAwLWZmXQpbwqDCoMKgIDMu
NTcxNDIxXSBmdTc0MC1wY2llIGUwMDAwMDAwMC5wY2llOiBObyBpQVRVIHJlZ2lvbnMgZm91bmQK
W8KgwqDCoCAzLjU3MTQ3Ml0gZnU3NDAtcGNpZSBlMDAwMDAwMDAucGNpZTogRmFpbGVkIHRvIGNv
bmZpZ3VyZSBpQVRVIGluIApFQ0FNIG1vZGUKW8KgwqDCoCAzLjU3MTUyOV0gZnU3NDAtcGNpZSBl
MDAwMDAwMDAucGNpZTogcHJvYmUgd2l0aCBkcml2ZXIgZnU3NDAtcGNpZSAKZmFpbGVkIHdpdGgg
ZXJyb3IgLTIyCgpTYW1lIGFzIGJlZm9yZSB0aGUgY2hhbmdlLiBUaGUgZW50aXJlIGxvZyBpcyBo
ZXJlOgoKaHR0cHM6Ly93d3cudzZyei5uZXQvZG1lc2cudHh0CgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
