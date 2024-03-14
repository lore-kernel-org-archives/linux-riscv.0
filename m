Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE14BC54E66
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Mar 2024 00:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lxqdqGQIGthmEUq7BUtyRzompz8Bd7dArtzBZATF9+w=; b=VknuznTygPwdWw
	y5UoKdah8mVBQsOOxRn2bdJtZdAMGH3O5CmufG/Ln/beYHHQQ2En//OoPRW1joDT98fpK6I9/vuIm
	MuoF08wwQs6KxlSIQPAZmuWvwmzTXpm4pDQB8GfrNP84+nJ29gRZH2fJd6KSGL34TCEiA0hcIIAje
	CRNm6h/KKWQ71WR0ahTdlFf4TxI5KMExPA+J0qriaRIzHGGB77LsAI+uBlRiTva9oprtFcPtcUyix
	H6uxcuhpr7Wk2/wg3rDt/HwQkM+fiLz9IoOusOcIXhisy6zGzCUj1nlIVfqomOXNBkfInBwgjy0+s
	ClTr57DhadaGgInryt+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkYoH-0000000CN15-24Ug;
	Thu, 14 Mar 2024 00:19:01 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkYoD-0000000CMzo-2WuN;
	Thu, 14 Mar 2024 00:18:59 +0000
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 42DLxSXT009282;
	Thu, 14 Mar 2024 00:18:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=Ij+R7IVB0uc61rJEHd4GlyzueViUctFffkK8nmeFG34=;
 b=rUTKPPO1lfCxhKHPBIanjC6M42k4sQ5Yi3bnJgBbwINXeM+qPTw4EwvDnNDy+OJ9JFc1
 2OWTiGSDRqkMdQ9DyFXT4f6t8KONsPLtSlNXk3nHN7Mbr+8enTin4VoZrlupV3kBl53K
 BBe+BZEWS05O7YA5bVEmdaZV9PE8LUY22Zo71ZR361EpSmbnLHQsAS7muswFuPkPkgqh
 oNc/3NC0Tt4Znygp+sw+bbrJLfpv1WW0G2BpJnnrirpoYRqPO1hlXh5dfA9fh9/31dsi
 Sm2QGWZrTRjN+iQj01r6Na2un84sPKjzLnN89sayoeLHoWmmrg5ORmoh0WbfCfTb0KlI 8Q== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wue9txvb7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Mar 2024 00:18:42 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 42DLRej0014855;
	Thu, 14 Mar 2024 00:18:41 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ws33p1e7g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Mar 2024 00:18:41 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 42E0Ibj733817030
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 14 Mar 2024 00:18:39 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8B2402004F;
	Thu, 14 Mar 2024 00:18:37 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A5BFA2004E;
	Thu, 14 Mar 2024 00:18:36 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 14 Mar 2024 00:18:36 +0000 (GMT)
Received: from [9.69.66.164] (unknown [9.69.66.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 8AC3A600F0;
	Thu, 14 Mar 2024 11:18:32 +1100 (AEDT)
Message-ID: <5876331b7a1bcff949ae158b404e98435948bd89.camel@linux.ibm.com>
Subject: Re: [PATCH v10 09/12] powerpc: mm: Add common pud_pfn stub for all
 platforms
From: LTC IMAP <rmclure@linux.ibm.com>
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
Date: Thu, 14 Mar 2024 11:18:00 +1100
In-Reply-To: <339a9b64-cba4-42df-82c5-9f0b1113312c@csgroup.eu>
References: <20240313042118.230397-1-rmclure@linux.ibm.com>
	 <20240313042118.230397-10-rmclure@linux.ibm.com>
	 <339a9b64-cba4-42df-82c5-9f0b1113312c@csgroup.eu>
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 2ZVABDO7QBjAP0t_L2EYR-WdFAMTx6GX
X-Proofpoint-GUID: 2ZVABDO7QBjAP0t_L2EYR-WdFAMTx6GX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-13_11,2024-03-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 mlxlogscore=999 clxscore=1015 adultscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2403140000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_171857_770102_EE277396 
X-CRM114-Status: GOOD (  36.43  )
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

T24gV2VkLCAyMDI0LTAzLTEzIGF0IDExOjA4ICswMDAwLCBDaHJpc3RvcGhlIExlcm95IHdyb3Rl
Ogo+IAo+IAo+IExlIDEzLzAzLzIwMjQgw6AgMDU6MjEsIFJvaGFuIE1jTHVyZSBhIMOpY3JpdMKg
Ogo+ID4gUHJpb3IgdG8gdGhpcyBjb21taXQsIHB1ZF9wZm4gd2FzIGltcGxlbWVudGVkIHdpdGgg
QlVJTERfQlVHIGFzIHRoZQo+ID4gaW5saW5lCj4gPiBmdW5jdGlvbiBmb3IgNjQtYml0IEJvb2sz
UyBzeXN0ZW1zIGJ1dCBpcyBuZXZlciBpbmNsdWRlZCwgYXMgaXRzCj4gPiBpbnZvY2F0aW9ucyBp
biBnZW5lcmljIGNvZGUgYXJlIGd1YXJkZWQgYnkgY2FsbHMgdG8gcHVkX2Rldm1hcAo+ID4gd2hp
Y2ggcmV0dXJuCj4gPiB6ZXJvIG9uIHN1Y2ggc3lzdGVtcy4gQSBmdXR1cmUgcGF0Y2ggd2lsbCBw
cm92aWRlIHN1cHBvcnQgZm9yIHBhZ2UKPiA+IHRhYmxlCj4gPiBjaGVja3MsIHRoZSBnZW5lcmlj
IGNvZGUgZm9yIHdoaWNoIGRlcGVuZHMgb24gYSBwdWRfcGZuIHN0dWIgYmVpbmcKPiA+IGltcGxl
bWVudGVkLCBldmVuIHdoaWxlIHRoZSBwYXRjaCB3aWxsIG5vdCBpbnRlcmFjdCB3aXRoIHB1ZHMK
PiA+IGRpcmVjdGx5Lgo+ID4gCj4gPiBSZW1vdmUgdGhlIDY0LWJpdCBCb29rM1Mgc3R1YiBhbmQg
ZGVmaW5lIHB1ZF9wZm4gdG8gd2FybiBvbiBhbGwKPiA+IHBsYXRmb3Jtcy4gcHVkX3BmbiBtYXkg
YmUgZGVmaW5lZCBwcm9wZXJseSBvbiBhIHBlci1wbGF0Zm9ybSBiYXNpcwo+ID4gc2hvdWxkIGl0
IGdyb3cgcmVhbCB1c2FnZXMgaW4gZnV0dXJlLgoKQXBvbG9naWVzLCBJIGRvbid0IGFjdHVhbGx5
IHJlbW92ZSB0aGUgNjQtYml0LCBCb29rM1Mgc3R1YiwgYXMgaXQKY3VycmVudGx5IGNvcnJlY3Rs
eSByZWZsZWN0cyBob3cgdHJhbnNwYXJlbnQgaHVnZXBhZ2VzIHNob3VsZCB3b3JrLgoKQWxzbyB0
aGUgc3R1YiB0aGF0IHdhcyBwcmV2aW91c2x5IGltcGxlbWVudGVkIGZvciBhbGwgcGxhdGZvcm1z
IGhhcwpiZWVuIHJlbW92ZWQgaW4gY29tbWl0IDI3YWY2N2YzNTYzMSAoInBvd2VycGMvYm9vazNz
NjQvbW06IGVuYWJsZQp0cmFuc3BhcmVudCBwdWQgaHVnZXBhZ2UiKS4KCj4gCj4gQ2FuIHlvdSBw
bGVhc2UgcmUtZXhwbGFpbiB3aHkgdGhhdCdzIG5lZWRlZCA/IEkgcmVtZW1iZXIgd2UgZGlzY3Vz
c2VkCj4gaXQgCj4gYWxyZWFkeSBpbiB0aGUgcGFzdCwgYnV0IEkgY2hlY2tlZCBhZ2FpbiB0b2Rh
eSBhbmQgY2FuJ3Qgc2VlIHRoZQo+IG5lZWQ6Cj4gCj4gSW4gbW0vcGFnZV90YWJsZV9jaGVjay5j
LCB0aGUgY2FsbCB0byBwdWRfcGZuKCkgaXMgZ2F0ZWQgYnkgYSBjYWxsIHRvCj4gcHVkX3VzZXJf
YWNjZXNzaWJsZV9wYWdlKHB1ZCkuIElmIEkgbG9vayBpbnRvIGFybTY0IHZlcnNpb24gb2YgCj4g
cHVkX3VzZXJfYWNjZXNzaWJsZV9wYWdlKCksIGl0IGRlcGVuZHMgb24gcHVkX2xlYWYoKS4gV2hl
biBwdWRfbGVhZigpCj4gaXMgCj4gY29uc3RhbnQgMCwgcHVkX3VzZXJfYWNjZXNzaWJsZV9wYWdl
KCkgaXMgYWx3YXlzIGZhbHNlIGFuZCB0aGUgY2FsbAo+IHRvIAo+IHB1ZF9wZm4oKSBzaG91bGQg
YmUgZm9sZGVkIGF3YXkuCgpBcyBpdCB3aWxsIGJlIGZvbGRlZCBhd2F5IG9uIG5vbiA2NC1iaXQg
Qm9vazNTIHBsYXRmb3JtcywgSSBjb3VsZApldmVuIHJlcGxhY2UgdGhlIFdBUk5fT05DRSB3aXRo
IGEgQlVJTERfQlVHIGZvciB5b3VyIHN0YXRlZCByZWFzb24uClRoZSBfX3BhZ2VfdGFibGVfY2hl
Y2tfcHVkX3NldCgpIGZ1bmN0aW9uIHdpbGwgc3RpbGwgYmUgaW5jbHVkZWQgaW4gdGhlCmJ1aWxk
IGFuZCByZWZlcmVuY2VzIHRoaXMgcm91dGluZSBzbyBhIGZhbGxiYWNrIHN0dWIgaXMgc3RpbGwK
bmVjZXNzYXJ5LgoKPiAKPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogUm9oYW4gTWNMdXJlIDxybWNs
dXJlQGxpbnV4LmlibS5jb20+Cj4gPiAtLS0KPiA+IMKgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2Fz
bS9wZ3RhYmxlLmggfCAxNCArKysrKysrKysrKysrKwo+ID4gwqAgMSBmaWxlIGNoYW5nZWQsIDE0
IGluc2VydGlvbnMoKykKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9pbmNsdWRl
L2FzbS9wZ3RhYmxlLmgKPiA+IGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3BndGFibGUuaAo+
ID4gaW5kZXggMGMwZmZiZTdhM2I1Li4xM2Y2NjE4MzEzMzMgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNo
L3Bvd2VycGMvaW5jbHVkZS9hc20vcGd0YWJsZS5oCj4gPiArKysgYi9hcmNoL3Bvd2VycGMvaW5j
bHVkZS9hc20vcGd0YWJsZS5oCj4gPiBAQCAtMjEzLDYgKzIxMywyMCBAQCBzdGF0aWMgaW5saW5l
IGJvb2wKPiA+IGFyY2hfc3VwcG9ydHNfbWVtbWFwX29uX21lbW9yeSh1bnNpZ25lZCBsb25nIHZt
ZW1tYXBfc2l6ZSkKPiA+IMKgIAo+ID4gwqAgI2VuZGlmIC8qIENPTkZJR19QUEM2NCAqLwo+ID4g
wqAgCj4gPiArLyoKPiA+ICsgKiBDdXJyZW50bHkgb25seSBjb25zdW1lZCBieSBwYWdlX3RhYmxl
X2NoZWNrX3B1ZF97c2V0LGNsZWFyfS4KPiA+IFNpbmNlIGNsZWFycwo+ID4gKyAqIGFuZCBzZXRz
IHRvIHBhZ2UgdGFibGUgZW50cmllcyBhdCBhbnkgbGV2ZWwgYXJlIGRvbmUgdGhyb3VnaAo+ID4g
KyAqIHBhZ2VfdGFibGVfY2hlY2tfcHRlX3tzZXQsY2xlYXJ9LCBwcm92aWRlIHN0dWIgaW1wbGVt
ZW50YXRpb24uCj4gPiArICovCj4gPiArI2lmbmRlZiBwdWRfcGZuCj4gPiArI2RlZmluZSBwdWRf
cGZuIHB1ZF9wZm4KPiA+ICtzdGF0aWMgaW5saW5lIGludCBwdWRfcGZuKHB1ZF90IHB1ZCkKPiA+
ICt7Cj4gPiArCVdBUk5fT05DRSgxLCAicHVkOiBwbGF0Zm9ybSBkb2VzIG5vdCB1c2UgcHVkIGVu
dHJpZXMKPiA+IGRpcmVjdGx5Iik7Cj4gPiArCXJldHVybiAwOwo+ID4gK30KPiA+ICsjZW5kaWYK
PiA+ICsKPiA+IMKgICNlbmRpZiAvKiBfX0FTU0VNQkxZX18gKi8KPiA+IMKgIAo+ID4gwqAgI2Vu
ZGlmIC8qIF9BU01fUE9XRVJQQ19QR1RBQkxFX0ggKi8KCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
