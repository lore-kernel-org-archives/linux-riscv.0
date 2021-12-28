Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3255C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Dec 2021 16:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mjf2eqI/SWJ71ucbjld+7L7HkRWbemhAxdXiod6hxDU=; b=ffWhfjg9RdVZ17
	V8FhlLEdyJq6CdaRDk7ZTWQe5ZJHtjS3RLf+OK/s0Z9cAUWCSUUBwesM2aur5YmFWfegug0807MvA
	eQiwE11ujfegk28mLfnu02ZJ44fVzJtUvXG5MQTo+XuFEyXetwDxJ5gpoDLasmvj66NJ8Vz/TnGgc
	BXJ9pwTGquVNMZiiQWYFc2emjLO1m5tLU7ekOsLsKeCuhZH0w7vT1cp6+apsNN+F4DAiGs7oaT4ka
	FCwNjGBebuMQD18In0NUQk/8dbagKc2zYJpDeHrnUIaYD/p5GWsGsIbmQ0FWfVLpz5LMTLuXp6CpI
	/S6o26Qaj+xenbBIe/JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2Fid-001Zsh-Ar; Tue, 28 Dec 2021 16:52:59 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2Fia-001Zry-0y
 for linux-riscv@lists.infradead.org; Tue, 28 Dec 2021 16:52:57 +0000
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BSDBwGe021961; 
 Tue, 28 Dec 2021 16:52:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=a32109lO5hXlV4YcaWf1ox6UFY5Br8kMOoPfJAXHf0E=;
 b=dWY7cJXr/YHov0KQtm1JxI4Q/wwchAF5lqYJuZpzbIzSb5X5FkFFOBGBbuugD66Tyj6W
 eQuJ8GzkofU/EWZHqDUNyaDb3gep7drgFNtQBzAspCi6hu3+N3TrWhVtgZ59oEQdik4Q
 ClxVu69kGqc8GdVDGtsynJFOJYITXnbDFdLQTAPNnoQMEblhdYjZ+ipmo57MXsBcXhxz
 eMekyIdt2vUGKn1w/FAKmCwtbbmxqkCztLktZettPsGEVSYpPtxDxY0AghCouctOkWvx
 /FUsJNcB7OtyheRy7ExLhacXUVdAAUFjpQIRjlvtYFDHglS8WSXkMs3CXMY9Py3j2tjL ug== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d838g4568-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Dec 2021 16:52:13 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BSGlsTJ012280;
 Tue, 28 Dec 2021 16:52:12 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d838g454x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Dec 2021 16:52:12 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BSGmYOH008235;
 Tue, 28 Dec 2021 16:52:10 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03fra.de.ibm.com with ESMTP id 3d5tx9gt9s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Dec 2021 16:52:09 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1BSGhcfn34865614
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Dec 2021 16:43:38 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 592C4A4053;
 Tue, 28 Dec 2021 16:52:07 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 52F26A404D;
 Tue, 28 Dec 2021 16:52:06 +0000 (GMT)
Received: from sig-9-145-12-118.uk.ibm.com (unknown [9.145.12.118])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 28 Dec 2021 16:52:06 +0000 (GMT)
Message-ID: <5112a787b635d5d2fc80a7f126c28176ad151098.camel@linux.ibm.com>
Subject: Re: [RFC 28/32] PCI: make quirk using inw() depend on HAS_IOPORT
From: Niklas Schnelle <schnelle@linux.ibm.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 John Garry <john.garry@huawei.com>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren
 <guoren@kernel.org>,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-csky@vger.kernel.org
Date: Tue, 28 Dec 2021 17:52:05 +0100
In-Reply-To: <20211228163541.GA1599602@bhelgaas>
References: <20211228163541.GA1599602@bhelgaas>
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 5iyGr8ouzv3OWEfchyBH9Sr19Eu51H6j
X-Proofpoint-ORIG-GUID: B-ofO_CZlSIZvoI4iX2rwQs5W2YUfq_C
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-28_08,2021-12-28_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112280075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211228_085256_100381_12136236 
X-CRM114-Status: GOOD (  38.20  )
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

T24gVHVlLCAyMDIxLTEyLTI4IGF0IDEwOjM1IC0wNjAwLCBCam9ybiBIZWxnYWFzIHdyb3RlOgo+
IE9uIFR1ZSwgRGVjIDI4LCAyMDIxIGF0IDA0OjI1OjI1UE0gKzAxMDAsIE5pa2xhcyBTY2huZWxs
ZSB3cm90ZToKPiA+IE9uIE1vbiwgMjAyMS0xMi0yNyBhdCAxNjozMyAtMDYwMCwgQmpvcm4gSGVs
Z2FhcyB3cm90ZToKPiA+ID4gT24gTW9uLCBEZWMgMjcsIDIwMjEgYXQgMDU6NDM6MTNQTSArMDEw
MCwgTmlrbGFzIFNjaG5lbGxlIHdyb3RlOgo+ID4gPiBJZiB3ZSBrZWVwIGl0IGluIGRyaXZlcnMv
cGNpLCBwbGVhc2UgdXBkYXRlIHRoZSBzdWJqZWN0IGxpbmUgdG8gbWFrZQo+ID4gPiBpdCBtb3Jl
IHNwZWNpZmljIGFuZCBtYXRjaCB0aGUgY29udmVudGlvbiwgZS5nLiwKPiA+ID4gCj4gPiA+ICAg
UENJOiBDb21waWxlIHF1aXJrX3RpZ2VycG9pbnRfYm1fc3RzKCkgb25seSB3aGVuIEhBU19JT1BP
UlQgc2V0Cj4gPiAKPiA+IEFoIHllYWggSSB3YXMgZ29pbmcgYmFjayBhbmQgZm9ydGggYmV0d2Vl
biBtYXRjaGluZyB0aGlzIHdpdGhpbiB0aGUKPiA+IHNlcmllcyB2cyBtYXRjaGluZyB0aGUgc3Vi
c3lzdGVtLiBJIGd1ZXNzIGdvaW5nIHdpdGggdGhlIHN1YnN5c3RlbSBpcwo+ID4gbW90ZSBpbXBv
cnRhbnQgbG9uZyB0ZXJtLgo+IAo+IEhhaGEsIHllcywgYSBsaXR0bGUgYW1iaWd1aXR5IHRoZXJl
LiAgSSBkbyB0aGluayB0aGUgc3Vic3lzdGVtIGlzIG1vcmUKPiBpbXBvcnRhbnQgYmVjYXVzZSB0
aGUgaWRlbnRpdHkgb2YgdGhlIHNlcmllcyBpcyBtb3N0bHkgbG9zdCBhZnRlciBpdCdzCj4gYXBw
bGllZC4gIFRoYW5rcyBmb3IgdGhpbmtpbmcgYWJvdXQgaXQhCj4gCj4gPiA+IEJUVywgZ2l0IGNv
bXBsYWlucyBhYm91dCBzb21lIHdoaXRlc3BhY2UgZXJyb3JzIGluIG90aGVyIHBhdGNoZXM6Cj4g
PiA+IAo+ID4gPiAgIEFwcGx5aW5nOiBjaGFyOiBpbXBpLCB0cG06IGRlcGVuZCBvbiBIQVNfSU9Q
T1JUCj4gPiA+ICAgLmdpdC9yZWJhc2UtYXBwbHkvcGF0Y2g6OTI6IHRyYWlsaW5nIHdoaXRlc3Bh
Y2UuCj4gPiA+IAkgICAgSWYgeW91IGhhdmUgYSBUUE0gc2VjdXJpdHkgY2hpcCBmcm9tIEF0bWVs
IHNheSBZZXMgYW5kIGl0Cj4gPiA+ICAgLmdpdC9yZWJhc2UtYXBwbHkvcGF0Y2g6OTM6IHRyYWls
aW5nIHdoaXRlc3BhY2UuCj4gPiA+IAkgICAgd2lsbCBiZSBhY2Nlc3NpYmxlIGZyb20gd2l0aGlu
IExpbnV4LiAgVG8gY29tcGlsZSB0aGlzIGRyaXZlcgo+ID4gPiAgIHdhcm5pbmc6IDIgbGluZXMg
YWRkIHdoaXRlc3BhY2UgZXJyb3JzLgo+ID4gPiAgIEFwcGx5aW5nOiB2aWRlbzogaGFuZGxlIEhB
U19JT1BPUlQgZGVwZW5kZW5jaWVzCj4gPiA+ICAgLmdpdC9yZWJhc2UtYXBwbHkvcGF0Y2g6MjM6
IHRyYWlsaW5nIHdoaXRlc3BhY2UuCj4gPiA+IAo+ID4gPiAgIHdhcm5pbmc6IDEgbGluZSBhZGRz
IHdoaXRlc3BhY2UgZXJyb3JzLgo+ID4gCj4gPiBUaGF0IGlzIHZlcnkgc3RyYW5nZS4gSSBkaWQg
cnVuIGNoZWNrcGF0Y2ggYmVmb3JlLiBUaGVyZSBhcmUgYSBmZXcKPiA+IHdhcm5pbmdzIG5vdCB0
byB0b3VjaCBvYnNvbGV0ZSBjb2RlIHVubmVjZXNzYXJpbHkgYW5kIGEgY2hlY2sgYWJvdXQKPiA+
IHVzaW5nIHVkZWxheSgpIChwcmUtZXhpc3RpbmcpIHBsdXMgdHdvIG1pc3NpbmcgYmxhbmsgbGlu
ZXMgaW4gcGNpLQo+ID4gcXVpcmtzLmggdGhhdCBJIGlnbm9yZWQgYmVjYXVzZSBpdCBtYXRjaGVz
IHRoZSBzb3JvdW5kaW5nIHN0eWxlLgo+ID4gCj4gPiBJIGRpZCBub3RpY2UgdGhhdCBsb3JlIGZh
aWxzIHRvIHJlbmRlciB0aGUgc3ViamVjdCBsaW5lcyBmb3Igc29tZSBvZgo+ID4gdGhlIHBhdGNo
ZXMuIEJ1dCBJIGp1c3QgdHJpZWQgZmV0Y2hpbmcgdGhlIHBhdGNoZXMgd2l0aCBiNCBvbiB0b3Ag
b2YKPiA+IHY1LjE2LXJjNyBhbmQgdGhlIHJlc3VsdGluZyB0cmVlIHBhc3NlcyAiLi9zY3JpcHRz
L2NoZWNrcGF0Y2gucGwgLS1naXQKPiA+IHY1LjE2LXJjNy4uSEVBRCIgYW5kIGhhcyBhbiBlbXB0
eSBkaWZmIHRvIG15IGJyYW5jaC4gV2hhdCB0b29sIGRpZCB5b3UKPiA+IHVzZSB0byBjaGVjaz8K
PiAKPiAiZ2l0IGFtIiBpcyB3aGF0IGNvbXBsYWluZWQuICBIZXJlJ3Mgd2hhdCBJIGRpZDoKPiAK
PiAgICQgZ2l0IGNoZWNrb3V0IC1iIHdpcC9uaWtsYXMgdjUuMTYtcmMxCgpBaCB0aGlzIHNlZW1z
IHRvIGJlIGJlY2F1c2UgbXkgcGF0Y2hlcyBhcmUgYWdhaW5zdCB2NS4xNi1yYzcuIEkgbm90ZWQK
dGhhdCBpbiB0aGUgY292ZXIgbGV0dGVyIGJ1dCBJIGd1ZXNzIHRoYXQgaXMgZWFzeSB0byBtaXNz
IGFuZCBtaWdodCBub3QKbWF0Y2ggZXhwZWN0YXRpb25zLgoKPiAgIFN3aXRjaGVkIHRvIGEgbmV3
IGJyYW5jaCAnd2lwL25pa2xhcycKPiAgIDEwOjMwOjA2IH4vbGludXggKHdpcC9uaWtsYXMpJCBi
NCBhbSAtb20vIDIwMjExMjI3MTY0MzE3LjQxNDY5MTgtMS1zY2huZWxsZUBsaW51eC5pYm0uY29t
Cj4gICBMb29raW5nIHVwIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyMTEyMjcxNjQzMTcu
NDE0NjkxOC0xLXNjaG5lbGxlJTQwbGludXguaWJtLmNvbQo+ICAgR3JhYmJpbmcgdGhyZWFkIGZy
b20gbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIxMTIyNzE2NDMxNy40MTQ2OTE4LTEtc2NobmVsbGUl
NDBsaW51eC5pYm0uY29tL3QubWJveC5nego+ICAgQW5hbHl6aW5nIDcwIG1lc3NhZ2VzIGluIHRo
ZSB0aHJlYWQKPiAgIENoZWNraW5nIGF0dGVzdGF0aW9uIG9uIGFsbCBtZXNzYWdlcywgbWF5IHRh
a2UgYSBtb21lbnQuLi4KPiAgIC0tLQo+ICAgICDinJMgW1BBVENIIFJGQyAxLzMyXSBLY29uZmln
OiBpbnRyb2R1Y2UgYW5kIGRlcGVuZCBvbiBMRUdBQ1lfUENJCj4gICAgIOKckyBbUEFUQ0ggUkZD
IDIvMzJdIEtjb25maWc6IGludHJvZHVjZSBIQVNfSU9QT1JUIG9wdGlvbiBhbmQgc2VsZWN0IGl0
IGFzIG5lY2Vzc2FyeQo+ICAgICDinJMgW1BBVENIIFJGQyAzLzMyXSBBQ1BJOiBLY29uZmlnOiBh
ZGQgSEFTX0lPUE9SVCBkZXBlbmRlbmNpZXMKPiAgICAg4pyTIFtQQVRDSCBSRkMgNC8zMl0gcGFy
cG9ydDogUEMgc3R5bGUgcGFycG9ydCBkZXBlbmRzIG9uIEhBU19JT1BPUlQKPiAgICAg4pyTIFtQ
QVRDSCBSRkMgNS8zMl0gY2hhcjogaW1waSwgdHBtOiBkZXBlbmQgb24gSEFTX0lPUE9SVAo+ICAg
ICDinJMgW1BBVENIIFJGQyA2LzMyXSBzcGVha3VwOiBLY29uZmlnOiBhZGQgSEFTX0lPUE9SVCBk
ZXBlbmRlbmNpZXMKPiAgICAgICArIFJldmlld2VkLWJ5OiBTYW11ZWwgVGhpYmF1bHQgPHNhbXVl
bC50aGliYXVsdEBlbnMtbHlvbi5vcmc+Cj4gICAgIOKckyBbUEFUQ0ggUkZDIDcvMzJdIElucHV0
OiBnYW1lcG9ydDogYWRkIElTQSBhbmQgSEFTX0lPUE9SVCBkZXBlbmRlbmNpZXMKPiAgICAg4pyT
IFtQQVRDSCBSRkMgOC8zMl0gY29tZWRpOiBLY29uZmlnOiBhZGQgSEFTX0lPUE9SVCBkZXBlbmRl
bmNpZXMKPiAgICAg4pyTIFtQQVRDSCBSRkMgOS8zMl0gc291bmQ6IEtjb25maWc6IGFkZCBIQVNf
SU9QT1JUIGRlcGVuZGVuY2llcwo+ICAgICDinJMgW1BBVENIIFJGQyAxMC8zMl0gaTJjOiBLY29u
ZmlnOiBhZGQgSEFTX0lPUE9SVCBkZXBlbmRlbmNpZXMKPiAgICAg4pyTIFtQQVRDSCBSRkMgMTEv
MzJdIElucHV0OiBLY29uZmlnOiBhZGQgSEFTX0lPUE9SVCBkZXBlbmRlbmNpZXMKPiAgICAg4pyT
IFtQQVRDSCBSRkMgMTIvMzJdIGlpbzogYWRjOiBLY29uZmlnOiBhZGQgSEFTX0lPUE9SVCBkZXBl
bmRlbmNpZXMKPiAgICAg4pyTIFtQQVRDSCBSRkMgMTMvMzJdIGh3bW9uOiBLY29uZmlnOiBhZGQg
SEFTX0lPUE9SVCBkZXBlbmRlbmNpZXMKPiAgICAg4pyTIFtQQVRDSCBSRkMgMTQvMzJdIGxlZHM6
IEtjb25maWc6IGFkZCBIQVNfSU9QT1JUIGRlcGVuZGVuY2llcwo+ICAgICDinJMgW1BBVENIIFJG
QyAxNS8zMl0gbWVkaWE6IEtjb25maWc6IGFkZCBIQVNfSU9QT1JUIGRlcGVuZGVuY2llcwo+ICAg
ICDinJMgW1BBVENIIFJGQyAxNi8zMl0gbWlzYzogaGFuZGxlIEhBU19JT1BPUlQgZGVwZW5kZW5j
aWVzCj4gICAgIOKckyBbUEFUQ0ggUkZDIDE3LzMyXSBuZXQ6IEtjb25maWc6IGFkZCBIQVNfSU9Q
T1JUIGRlcGVuZGVuY2llcwo+ICAgICAgICsgQWNrZWQtYnk6IE1hcmMgS2xlaW5lLUJ1ZGRlIDxt
a2xAcGVuZ3V0cm9uaXguZGU+Cj4gICAgIOKckyBbUEFUQ0ggUkZDIDE4LzMyXSBwY21jaWE6IEtj
b25maWc6IGFkZCBIQVNfSU9QT1JUIGRlcGVuZGVuY2llcwo+ICAgICAgICsgQWNrZWQtYnk6IERv
bWluaWsgQnJvZG93c2tpIDxsaW51eEBkb21pbmlrYnJvZG93c2tpLm5ldD4KPiAgICAg4pyTIFtQ
QVRDSCBSRkMgMTkvMzJdIHBsYXRmb3JtOiBLY29uZmlnOiBhZGQgSEFTX0lPUE9SVCBkZXBlbmRl
bmNpZXMKPiAgICAg4pyTIFtQQVRDSCBSRkMgMjAvMzJdIHBucDogS2NvbmZpZzogYWRkIEhBU19J
T1BPUlQgZGVwZW5kZW5jaWVzCj4gICAgIOKckyBbUEFUQ0ggUkZDIDIxLzMyXSBwb3dlcjogS2Nv
bmZpZzogYWRkIEhBU19JT1BPUlQgZGVwZW5kZW5jaWVzCj4gICAgIOKckyBbUEFUQ0ggUkZDIDIy
LzMyXSB2aWRlbzogaGFuZGxlIEhBU19JT1BPUlQgZGVwZW5kZW5jaWVzCj4gICAgIOKckyBbUEFU
Q0ggUkZDIDIzLzMyXSBydGM6IEtjb25maWc6IGFkZCBIQVNfSU9QT1JUIGRlcGVuZGVuY2llcwo+
ICAgICDinJMgW1BBVENIIFJGQyAyNC8zMl0gc2NzaTogS2NvbmZpZzogYWRkIEhBU19JT1BPUlQg
ZGVwZW5kZW5jaWVzCj4gICAgIOKckyBbUEFUQ0ggUkZDIDI1LzMyXSB3YXRjaGRvZzogS2NvbmZp
ZzogYWRkIEhBU19JT1BPUlQgZGVwZW5kZW5jaWVzCj4gICAgIOKckyBbUEFUQ0ggUkZDIDI2LzMy
XSBkcm06IGhhbmRsZSBIQVNfSU9QT1JUIGRlcGVuZGVuY2llcwo+ICAgICDinJMgW1BBVENIIFJG
QyAyNy8zMl0gUENJL3N5c2ZzOiBtYWtlIEkvTyByZXNvdXJjZSBkZXBlbmQgb24gSEFTX0lPUE9S
VAo+ICAgICDinJMgW1BBVENIIFJGQyAyOC8zMl0gUENJOiBtYWtlIHF1aXJrIHVzaW5nIGludygp
IGRlcGVuZCBvbiBIQVNfSU9QT1JUCj4gICAgIOKckyBbUEFUQ0ggUkZDIDI5LzMyXSBmaXJtd2Fy
ZTogZG1pLXN5c2ZzOiBoYW5kbGUgSEFTX0lPUE9SVCBkZXBlbmRlbmNpZXMKPiAgICAg4pyTIFtQ
QVRDSCBSRkMgMzAvMzJdIC9kZXYvcG9ydDogZG9uJ3QgY29tcGlsZSBmaWxlIG9wZXJhdGlvbnMg
d2l0aG91dCBDT05GSUdfREVWUE9SVAo+ICAgICDinJMgW1BBVENIIFJGQyAzMS8zMl0gdXNiOiBo
YW5kbGUgSEFTX0lPUE9SVCBkZXBlbmRlbmNpZXMKPiAgICAg4pyTIFtQQVRDSCBSRkMgMzIvMzJd
IGFzbS1nZW5lcmljL2lvLmg6IGRyb3AgaW5iKCkgZXRjIGZvciBIQVNfSU9QT1JUPW4KPiAgICAg
LS0tCj4gICAgIOKckyBTaWduZWQ6IERLSU0vaWJtLmNvbSAoRnJvbTogc2NobmVsbGVAbGludXgu
aWJtLmNvbSkKPiAKCkludGVyZXN0aW5nIG5vdyBJIGhhdmUgdG8gZmlndXJlIG91dCB3aHkgSSBk
byBnZXQgYmFkIERLSU0gc2lnbmF0dXJlCmNoZWNrcyB3aXRoIGI0IGFuZCBteSBtYWlscy4gTWF5
YmUgYjQgaGFzIGFuIGVuZGlhbmVzcyBidWcgYXMgSSdtCnVzdWFsbHkgd29ya2luZyBvbiBtYWlu
ZnJhbWUuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
