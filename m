Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF7CC54E67
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2024 05:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AxC4MaS+nED3AYofpbFTxOR+voIOScSN/eb+tKOluvg=; b=RqDoCE7n2n6UCz
	QW53BvkXgvW+flj1+2j9Mu/Nfz3wX2lH7kEtaJGOHyjYogdpm8a2EZFguUMq0VyaXLzjg4SSNHtiS
	XYbSEPJxbWD0yxU+8X//n3N5d9UeQBN1jlNBf2dDYn2buQoTYsErHp18+sNmTNtgBqJiEk6mgbmO9
	JvwvFlL+LwGHuA7Wpq7W0CVRhcVUsZwdk/7Z6tlxwiMBmA53SEMv1mYp44vcOKrDDTMwIxtlHhUIC
	kjl+D7szcXkbt6l2Bi+BNODIR9/DgMig3gAMGFg1Zv4VUpyEGBsxLjchk4k01hhAlTFlqkFL6CZOE
	Y+kd12hTVhP9Ig9FwrzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpiZE-0000000CbHS-2upl;
	Thu, 28 Mar 2024 05:44:48 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpiZA-0000000CbGX-2LWF;
	Thu, 28 Mar 2024 05:44:45 +0000
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 42S4SIqh013913;
	Thu, 28 Mar 2024 05:44:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=j0SWms8hODj0cUzE9l0AaXEGYpd3vYPfb3RMtj2pLNY=;
 b=RDR/iIjfEk0SJAnO9sYtDRf/fCuthJ1wBEqMaB8Fb9xjGQpYmlVmxUOQvpLyPK6GOJBs
 vtw3wKzpo/+B8O7S55UCTCoFvX2f25u54RLP/618T9QBAgTqIHj9gycBsJWRhuJJQYKL
 hjVZW7fx6PHWzZU9ea9bjzRKQ5SJz3d1lgzmgmcKsXh8L/p0uXmlqu6lyzatmUGdsUjy
 z5tFSTweHYAR9a3sxvOGIcxbyqA9sDWbqWSyjsEhZxB6+pFPpVDWEew+NZlxRVLGaaA1
 yAifRtS0jWfGVt/B9gFqq/gwQBHqneyXJzDXObojM1Gga0dRDzWCuRLzmhznKAhe2IDl YA== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3x51hj05b9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Mar 2024 05:44:32 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 42S4oUhs028623;
	Thu, 28 Mar 2024 05:44:30 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3x2adpkjhp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Mar 2024 05:44:30 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 42S5iQZR16056650
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 28 Mar 2024 05:44:28 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9D5672004E;
	Thu, 28 Mar 2024 05:44:26 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B90332004B;
	Thu, 28 Mar 2024 05:44:25 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 28 Mar 2024 05:44:25 +0000 (GMT)
Received: from [9.66.88.97] (unknown [9.66.88.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id A2EBF60112;
	Thu, 28 Mar 2024 16:44:18 +1100 (AEDT)
Message-ID: <2f25b9a2ec5d8b0fb4020e4f2e699ee067496b0a.camel@linux.ibm.com>
Subject: Re: [PATCH v11 09/11] poweprc: mm: Implement
 *_user_accessible_page() for ptes
From: Rohan McLure <rmclure@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        "linuxppc-dev@lists.ozlabs.org"
	 <linuxppc-dev@lists.ozlabs.org>
Cc: "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
        "linux-mm@kvack.org"
	 <linux-mm@kvack.org>,
        "linux-riscv@lists.infradead.org"
	 <linux-riscv@lists.infradead.org>,
        "linux-arm-kernel@lists.infradead.org"
	 <linux-arm-kernel@lists.infradead.org>,
        "x86@kernel.org" <x86@kernel.org>
Date: Thu, 28 Mar 2024 16:44:13 +1100
In-Reply-To: <3fcc8331-28ed-458f-b7f6-ba1f161eb09e@csgroup.eu>
References: <20240328045535.194800-3-rmclure@linux.ibm.com>
	 <20240328045535.194800-12-rmclure@linux.ibm.com>
	 <3fcc8331-28ed-458f-b7f6-ba1f161eb09e@csgroup.eu>
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: oPvmNjuTccY20fJQn4lge45k9qzXGhwL
X-Proofpoint-ORIG-GUID: oPvmNjuTccY20fJQn4lge45k9qzXGhwL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-28_04,2024-03-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 mlxlogscore=845 bulkscore=0 impostorscore=0 mlxscore=0 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2403210000 definitions=main-2403280034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_224444_615854_37F4C7D8 
X-CRM114-Status: GOOD (  39.27  )
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

T24gVGh1LCAyMDI0LTAzLTI4IGF0IDA1OjQwICswMDAwLCBDaHJpc3RvcGhlIExlcm95IHdyb3Rl
Ogo+IAo+IAo+IExlIDI4LzAzLzIwMjQgw6AgMDU6NTUsIFJvaGFuIE1jTHVyZSBhIMOpY3JpdMKg
Ogo+ID4gUGFnZSB0YWJsZSBjaGVja2luZyBkZXBlbmRzIG9uIGFyY2hpdGVjdHVyZXMgcHJvdmlk
aW5nIGFuCj4gPiBpbXBsZW1lbnRhdGlvbiBvZiBwe3RlLG1kLHVkfV91c2VyX2FjY2Vzc2libGVf
cGFnZS4gV2l0aAo+ID4gcmVmYWN0b3Jpc2F0aW9ucyBtYWRlIG9uIHBvd2VycGMvbW0sIHRoZSBw
dGVfYWNjZXNzX3Blcm1pdHRlZCgpIGFuZAo+ID4gc2ltaWxhciBtZXRob2RzIHZlcmlmeSB3aGV0
aGVyIGEgdXNlcmxhbmQgcGFnZSBpcyBhY2Nlc3NpYmxlIHdpdGgKPiA+IHRoZQo+ID4gcmVxdWly
ZWQgcGVybWlzc2lvbnMuCj4gPiAKPiA+IFNpbmNlIHBhZ2UgdGFibGUgY2hlY2tpbmcgaXMgdGhl
IG9ubHkgdXNlciBvZgo+ID4gcHt0ZSxtZCx1ZH1fdXNlcl9hY2Nlc3NpYmxlX3BhZ2UoKSwgaW1w
bGVtZW50IHRoZXNlIGZvciBhbGwKPiA+IHBsYXRmb3JtcywKPiA+IHVzaW5nIHNvbWUgb2YgdGhl
IHNhbWUgcHJlbGltaW5hcnkgY2hlY2tzIHRha2VuIGJ5Cj4gPiBwdGVfYWNjZXNzX3Blcm1pdHRl
ZCgpCj4gPiBvbiB0aGF0IHBsYXRmb3JtLgo+ID4gCj4gPiBTaW5jZSBDb21taXQgOGU5YmQ0MWU0
Y2UxICgicG93ZXJwYy9ub2hhc2g6IFJlcGxhY2UgcHRlX3VzZXIoKSBieQo+ID4gcHRlX3JlYWQo
KSIpCj4gPiBwdGVfdXNlcigpIGlzIG5vIGxvbmdlciByZXF1aXJlZCB0byBiZSBwcmVzZW50IG9u
IGFsbCBwbGF0Zm9ybXMgYXMKPiA+IGl0Cj4gPiBtYXkgYmUgZXF1aXZhbGVudCB0byBvciBpbXBs
aWVkIGJ5IHB0ZV9yZWFkKCkuIEhlbmNlCj4gPiBpbXBsZW1lbnRhdGlvbnMgb2YKPiA+IHB0ZV91
c2VyX2FjY2Vzc2libGVfcGFnZSgpIGFyZSBzcGVjaWFsaXNlZC4KPiA+IAo+ID4gU2lnbmVkLW9m
Zi1ieTogUm9oYW4gTWNMdXJlIDxybWNsdXJlQGxpbnV4LmlibS5jb20+Cj4gPiAtLS0KPiA+IHY5
OiBOZXcgaW1wbGVtZW50YXRpb24KPiA+IHYxMDogTGV0IGJvb2szcy82NCB1c2UgcHRlX3VzZXIo
KSwgYnV0IG90aGVyd2lzZSBkZWZhdWx0IG90aGVyCj4gPiBwbGF0Zm9ybXMKPiA+IHRvIHVzaW5n
IHRoZSBhZGRyZXNzIHByb3ZpZGVkIHdpdGggdGhlIGNhbGwgdG8gaW5mZXIgd2hldGhlciBpdCBp
cwo+ID4gYQo+ID4gdXNlciBwYWdlIG9yIG5vdC4gcG1kL3B1ZCB2YXJpYW50cyB3aWxsIHdhcm4g
b24gYWxsIG90aGVyCj4gPiBwbGF0Zm9ybXMsIGFzCj4gPiB0aGV5IHNob3VsZCBub3QgYmUgdXNl
ZCBmb3IgdXNlciBwYWdlIG1hcHBpbmdzCj4gPiB2MTE6IENvbmRpdGlvbmFsbHkgZGVmaW5lIHB7
bSx1fWRfdXNlcl9hY2Nlc3NpYmxlX3BhZ2UoKSwgYXMgbm90Cj4gPiBhbGwKPiA+IHBsYXRmb3Jt
cyBoYXZlIHB7bSx1fWRfbGVhZigpLCBwe20sdX1kX3B0ZSgpIHN0dWJzLgo+IAo+IFNlZSBteSBj
b21tZW50IHRvIHYxMCBwYXRjaCAxMC4KPiAKPiBwe20sdX1kX2xlYWYoKSBpcyBkZWZpbmVkIGZv
ciBhbGwgcGxhdGZvcm1zIChUaGVyZSBpcyBhIGZhbGxiYWNrIAo+IGRlZmluaXRpb24gaW4gaW5j
bHVkZS9saW51eC9wZ3RhYmxlLmgpIHNvCj4gcHttLHV9ZF91c2VyX2FjY2Vzc2libGVfcGFnZSgp
IAo+IGNhbiBiZSBkZWZpbmVkIGZvciBhbGwgcGxhdGZvcm1zLCBubyBuZWVkIGZvciBhIGNvbmRp
dGlvbmFsbHkgZGVmaW5lLgoKVGhlIGlzc3VlIEkgc2VlIGlzIHRoYXQgdGhlIGRlZmluaXRpb24g
aW4gaW5jbHVkZS9saW51eC9wZ3RhYmxlLmgKb2NjdXJzIGFmdGVyIHRoaXMgaGVhZGVyIGlzIGlu
Y2x1ZGVkLiBQcmlvciB0byB0aGUgcmVtb3ZhbCBvZiBhIGxvY2FsCmRlZmluaXRpb24gb2YgcHtt
LHV9ZF9sZWFmKCkgZXRjIHdlIGRpZG4ndCBydW4gaW50byB0aGlzIGlzc3VlLCBidXQgd2UKc3Rp
bGwgZG8gbm93LgoKTm90IGluc2lzdGVudCBvbiBkb2luZyBpdCB0aGlzIHdheSB3aXRoIGlmbmRl
Ziwgc28gYW1lbmFibGUgdG8Kc3VnZ2VzdGlvbnMgaWYgeW91IGhhdmUgYSBwcmVmZXJlbmNlLgoK
PiAKPiA+IC0tLQo+ID4gwqAgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy8zMi9wZ3Rh
YmxlLmggfMKgIDUgKysrKysKPiA+IMKgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3Mv
NjQvcGd0YWJsZS5oIHwgMTcKPiA+ICsrKysrKysrKysrKysrKysrCj4gPiDCoCBhcmNoL3Bvd2Vy
cGMvaW5jbHVkZS9hc20vbm9oYXNoL3BndGFibGUuaMKgwqDCoCB8wqAgNSArKysrKwo+ID4gwqAg
YXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3BndGFibGUuaMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzC
oCA4ICsrKysrKysrCj4gPiDCoCA0IGZpbGVzIGNoYW5nZWQsIDM1IGluc2VydGlvbnMoKykKPiA+
IAo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvMzIvcGd0
YWJsZS5oCj4gPiBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvMzIvcGd0YWJsZS5o
Cj4gPiBpbmRleCA1Mjk3MWVlMzA3MTcuLjgzZjdiOThlZjQ5ZiAxMDA2NDQKPiA+IC0tLSBhL2Fy
Y2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvMzIvcGd0YWJsZS5oCj4gPiArKysgYi9hcmNo
L3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzMyL3BndGFibGUuaAo+ID4gQEAgLTQzNiw2ICs0
MzYsMTEgQEAgc3RhdGljIGlubGluZSBib29sIHB0ZV9hY2Nlc3NfcGVybWl0dGVkKHB0ZV90Cj4g
PiBwdGUsIGJvb2wgd3JpdGUpCj4gPiDCoMKgCXJldHVybiB0cnVlOwo+ID4gwqAgfQo+ID4gwqAg
Cj4gPiArc3RhdGljIGlubGluZSBib29sIHB0ZV91c2VyX2FjY2Vzc2libGVfcGFnZShwdGVfdCBw
dGUsIHVuc2lnbmVkCj4gPiBsb25nIGFkZHIpCj4gPiArewo+ID4gKwlyZXR1cm4gcHRlX3ByZXNl
bnQocHRlKSAmJiAhaXNfa2VybmVsX2FkZHIoYWRkcik7Cj4gPiArfQo+ID4gKwo+ID4gwqAgLyog
Q29udmVyc2lvbiBmdW5jdGlvbnM6IGNvbnZlcnQgYSBwYWdlIGFuZCBwcm90ZWN0aW9uIHRvIGEg
cGFnZQo+ID4gZW50cnksCj4gPiDCoMKgICogYW5kIGEgcGFnZSBlbnRyeSBhbmQgcGFnZSBkaXJl
Y3RvcnkgdG8gdGhlIHBhZ2UgdGhleSByZWZlciB0by4KPiA+IMKgwqAgKgo+ID4gZGlmZiAtLWdp
dCBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvNjQvcGd0YWJsZS5oCj4gPiBiL2Fy
Y2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvNjQvcGd0YWJsZS5oCj4gPiBpbmRleCBmYWM1
NjE1ZTZiYzUuLmQ4NjQwZGRiY2FkMSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcG93ZXJwYy9pbmNs
dWRlL2FzbS9ib29rM3MvNjQvcGd0YWJsZS5oCj4gPiArKysgYi9hcmNoL3Bvd2VycGMvaW5jbHVk
ZS9hc20vYm9vazNzLzY0L3BndGFibGUuaAo+ID4gQEAgLTUzOCw2ICs1MzgsMTEgQEAgc3RhdGlj
IGlubGluZSBib29sIHB0ZV9hY2Nlc3NfcGVybWl0dGVkKHB0ZV90Cj4gPiBwdGUsIGJvb2wgd3Jp
dGUpCj4gPiDCoMKgCXJldHVybiBhcmNoX3B0ZV9hY2Nlc3NfcGVybWl0dGVkKHB0ZV92YWwocHRl
KSwgd3JpdGUsIDApOwo+ID4gwqAgfQo+ID4gwqAgCj4gPiArc3RhdGljIGlubGluZSBib29sIHB0
ZV91c2VyX2FjY2Vzc2libGVfcGFnZShwdGVfdCBwdGUsIHVuc2lnbmVkCj4gPiBsb25nIGFkZHIp
Cj4gPiArewo+ID4gKwlyZXR1cm4gcHRlX3ByZXNlbnQocHRlKSAmJiBwdGVfdXNlcihwdGUpOwo+
ID4gK30KPiA+ICsKPiA+IMKgIC8qCj4gPiDCoMKgICogQ29udmVyc2lvbiBmdW5jdGlvbnM6IGNv
bnZlcnQgYSBwYWdlIGFuZCBwcm90ZWN0aW9uIHRvIGEgcGFnZQo+ID4gZW50cnksCj4gPiDCoMKg
ICogYW5kIGEgcGFnZSBlbnRyeSBhbmQgcGFnZSBkaXJlY3RvcnkgdG8gdGhlIHBhZ2UgdGhleSBy
ZWZlciB0by4KPiA+IEBAIC0xNDQxLDUgKzE0NDYsMTcgQEAgc3RhdGljIGlubGluZSBib29sIHB1
ZF9sZWFmKHB1ZF90IHB1ZCkKPiA+IMKgwqAJcmV0dXJuICEhKHB1ZF9yYXcocHVkKSAmIGNwdV90
b19iZTY0KF9QQUdFX1BURSkpOwo+ID4gwqAgfQo+ID4gwqAgCj4gPiArI2RlZmluZSBwbWRfdXNl
cl9hY2Nlc3NpYmxlX3BhZ2UgcG1kX3VzZXJfYWNjZXNzaWJsZV9wYWdlCj4gPiArc3RhdGljIGlu
bGluZSBib29sIHBtZF91c2VyX2FjY2Vzc2libGVfcGFnZShwbWRfdCBwbWQsIHVuc2lnbmVkCj4g
PiBsb25nIGFkZHIpCj4gPiArewo+ID4gKwlyZXR1cm4gcG1kX2xlYWYocG1kKSAmJgo+ID4gcHRl
X3VzZXJfYWNjZXNzaWJsZV9wYWdlKHBtZF9wdGUocG1kKSwgYWRkcik7Cj4gPiArfQo+ID4gKwo+
ID4gKyNkZWZpbmUgcHVkX3VzZXJfYWNjZXNzaWJsZV9wYWdlIHB1ZF91c2VyX2FjY2Vzc2libGVf
cGFnZQo+ID4gK3N0YXRpYyBpbmxpbmUgYm9vbCBwdWRfdXNlcl9hY2Nlc3NpYmxlX3BhZ2UocHVk
X3QgcHVkLCB1bnNpZ25lZAo+ID4gbG9uZyBhZGRyKQo+ID4gK3sKPiA+ICsJcmV0dXJuIHB1ZF9s
ZWFmKHB1ZCkgJiYKPiA+IHB0ZV91c2VyX2FjY2Vzc2libGVfcGFnZShwdWRfcHRlKHB1ZCksIGFk
ZHIpOwo+ID4gK30KPiA+ICsKPiA+IMKgICNlbmRpZiAvKiBfX0FTU0VNQkxZX18gKi8KPiA+IMKg
ICNlbmRpZiAvKiBfQVNNX1BPV0VSUENfQk9PSzNTXzY0X1BHVEFCTEVfSF8gKi8KPiA+IGRpZmYg
LS1naXQgYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vbm9oYXNoL3BndGFibGUuaAo+ID4gYi9h
cmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vbm9oYXNoL3BndGFibGUuaAo+ID4gaW5kZXggNDI3ZGIx
NDI5MmM5Li40MTNkMDFhNTFlNmYgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Bvd2VycGMvaW5jbHVk
ZS9hc20vbm9oYXNoL3BndGFibGUuaAo+ID4gKysrIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNt
L25vaGFzaC9wZ3RhYmxlLmgKPiA+IEBAIC0yMTMsNiArMjEzLDExIEBAIHN0YXRpYyBpbmxpbmUg
Ym9vbCBwdGVfYWNjZXNzX3Blcm1pdHRlZChwdGVfdAo+ID4gcHRlLCBib29sIHdyaXRlKQo+ID4g
wqDCoAlyZXR1cm4gdHJ1ZTsKPiA+IMKgIH0KPiA+IMKgIAo+ID4gK3N0YXRpYyBpbmxpbmUgYm9v
bCBwdGVfdXNlcl9hY2Nlc3NpYmxlX3BhZ2UocHRlX3QgcHRlLCB1bnNpZ25lZAo+ID4gbG9uZyBh
ZGRyKQo+ID4gK3sKPiA+ICsJcmV0dXJuIHB0ZV9wcmVzZW50KHB0ZSkgJiYgIWlzX2tlcm5lbF9h
ZGRyKGFkZHIpOwo+ID4gK30KPiA+ICsKPiA+IMKgIC8qIENvbnZlcnNpb24gZnVuY3Rpb25zOiBj
b252ZXJ0IGEgcGFnZSBhbmQgcHJvdGVjdGlvbiB0byBhIHBhZ2UKPiA+IGVudHJ5LAo+ID4gwqDC
oCAqIGFuZCBhIHBhZ2UgZW50cnkgYW5kIHBhZ2UgZGlyZWN0b3J5IHRvIHRoZSBwYWdlIHRoZXkg
cmVmZXIgdG8uCj4gPiDCoMKgICoKPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvaW5jbHVk
ZS9hc20vcGd0YWJsZS5oCj4gPiBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgK
PiA+IGluZGV4IGVlOGM4MmMwNTI4Zi4uZjFjZWFlNzc4Y2IxIDEwMDY0NAo+ID4gLS0tIGEvYXJj
aC9wb3dlcnBjL2luY2x1ZGUvYXNtL3BndGFibGUuaAo+ID4gKysrIGIvYXJjaC9wb3dlcnBjL2lu
Y2x1ZGUvYXNtL3BndGFibGUuaAo+ID4gQEAgLTIxOSw2ICsyMTksMTQgQEAgc3RhdGljIGlubGlu
ZSBpbnQgcHVkX3BmbihwdWRfdCBwdWQpCj4gPiDCoCB9Cj4gPiDCoCAjZW5kaWYKPiA+IMKgIAo+
ID4gKyNpZm5kZWYgcG1kX3VzZXJfYWNjZXNzaWJsZV9wYWdlCj4gPiArI2RlZmluZSBwbWRfdXNl
cl9hY2Nlc3NpYmxlX3BhZ2UocG1kLCBhZGRyKQlmYWxzZQo+ID4gKyNlbmRpZgo+ID4gKwo+ID4g
KyNpZm5kZWYgcHVkX3VzZXJfYWNjZXNzaWJsZV9wYWdlCj4gPiArI2RlZmluZSBwdWRfdXNlcl9h
Y2Nlc3NpYmxlX3BhZ2UocHVkLCBhZGRyKQlmYWxzZQo+ID4gKyNlbmRpZgo+ID4gKwo+ID4gwqAg
I2VuZGlmIC8qIF9fQVNTRU1CTFlfXyAqLwo+ID4gwqAgCj4gPiDCoCAjZW5kaWYgLyogX0FTTV9Q
T1dFUlBDX1BHVEFCTEVfSCAqLwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
