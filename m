Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80D7DD29FF8
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jan 2026 12:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PoPLIIBPDFrhzrjX1mugYFEyeVL0W0PWAmqjj2AUUvs=; b=t/k+f3V1sgiQ0t
	bzYag1jAHY/HPdNJMwVBqJLVlq4cNr/ngeWjf32up2FrF99E7maWa9dL52oK8556xAioq+CrSwh+Q
	K1hJfzh1gnrOWw45I+vcBDq9B2mhtZZ+39OS6ABuTM8YTHwTJZHBPYQova5LtpI3YMhdCOS78KAar
	jZPWVryX/WjF7PR37fSJPzTgKmbztXSUpBnDKLOVJ07V1FKo/l5Pq7kV9YPbq/v0mMjIsoUeqVoMd
	YZBzE6GAgjdw5Ddg/3b32UFHWVrcmetP74LSNouTbxKutuG0izzADIvTQtDtn6Y7YCa7kjOiXmDVl
	iiE6Jm30eT72gaACJFCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfzjl-000000097X5-2umr;
	Wed, 14 Jan 2026 12:12:33 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfzji-000000097VC-2exu;
	Wed, 14 Jan 2026 12:12:32 +0000
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60E6dduV001269;
	Wed, 14 Jan 2026 12:12:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=pzHVxv
	E5ODBHsgsz8pyhe6cG5oMDjzw2x+Um2O9cGO8=; b=lMJWfhbEbMAC0y/nZY42B/
	5YaagzgIChz+c+hXT+p0sPjrIsQKN01YUhffjjGLx0tcgLpD555fPceEiis/cMPo
	Ud+G/Q9qOY9L/BVKtJsa6PM7nPLQ2li2e5HZ1Fq0/wc1cTTUI/2bgTGdegdjgLMg
	zr8PcN7jyW7myFFQBc+mnSiZIqK3UBp2rwlFjaGbBtFtH75Enu8vC2GfCCWGS/lt
	IDWXQCvJxHqU4aNYABYn2I68yeuDhL+ER6cPDB/3djfxAenBiZERQZim3y2zwN62
	Q+vsqMpVm+LV40sb9OoEMQXKU2l8r41K+Yb0TalBh3Lydh2cRDmoTWd1RStYZX+Q
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bkc6h91dy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Jan 2026 12:12:23 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60E8Y3X7031269;
	Wed, 14 Jan 2026 12:12:23 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4bm3t1sjyu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Jan 2026 12:12:22 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60ECCLDO44564742
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 Jan 2026 12:12:21 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3811E20043;
	Wed, 14 Jan 2026 12:12:21 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E59C620040;
	Wed, 14 Jan 2026 12:12:20 +0000 (GMT)
Received: from [9.111.193.9] (unknown [9.111.193.9])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 14 Jan 2026 12:12:20 +0000 (GMT)
Message-ID: <f31a9a3f-ec9a-44e1-85ae-c0e0391ff0fc@linux.ibm.com>
Date: Wed, 14 Jan 2026 13:12:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/36] lib/crypto: s390/aes: Migrate optimized code into
 library
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
        "Jason A . Donenfeld" <Jason@zx2c4.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        sparclinux@vger.kernel.org, x86@kernel.org,
        Harald Freudenberger <freude@linux.ibm.com>,
        linux-crypto@vger.kernel.org
References: <20260105051311.1607207-1-ebiggers@kernel.org>
 <20260105051311.1607207-16-ebiggers@kernel.org>
 <167cbd49-e0ba-4b1d-a724-e64ab6ee863c@linux.ibm.com>
 <20260107203458.GA2200@quark>
From: Holger Dengler <dengler@linux.ibm.com>
Content-Language: de-DE
In-Reply-To: <20260107203458.GA2200@quark>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 0JISleG8ICtApQmeXiUHRBk2QsRrV-GL
X-Proofpoint-ORIG-GUID: 0JISleG8ICtApQmeXiUHRBk2QsRrV-GL
X-Authority-Analysis: v=2.4 cv=TaibdBQh c=1 sm=1 tr=0 ts=69678827 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=ZiP0gMQ4KlzIHEEEXi0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA5OCBTYWx0ZWRfX5A+i08xANtZk
 Fe+bZobRq26jJWk184c/YDGBQCyOVVLaLTd7R8/xRa2F7V2TV8Bg+SsBN/h5dn5SfGzmh/wYuz5
 w30g6R0CLgIL1jn/JcBYwYqbkxyZpkEfj16M+S4Affu9dsapUUHK0CVqv+IhI4UyQQIrYFEEB0Z
 3B9m8UtdjEXn9TKdLvp2EtGA7bwr8Alb3lyx1W8g1FvkDLqWZH8pNiHlGy3bUSdyIYaBBzJ6Ksu
 0hIrAA0Vz1lE+E3NgThKtT8Ny5YVbfRradjECMhYhDl9l3y2VMv+nwgy2ECrru+8J9islTgzfan
 nQJxf6ZdIBhgXVxQNe9ke1h11g9yU3MtkbRg2UKG439sbAXH7R/Fn6hMC6skQh5adHr6hOm9T9R
 /VzDc94a0vrwPKWt5A5rwL1Wgu+r0uvCX12NNuyZVH782uArTzidCMQGvU81ZBbcWtx+kFbgpbO
 RBT7auXbzpAuG57LgUg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2512120000
 definitions=main-2601140098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_041230_794924_00DB6C34 
X-CRM114-Status: GOOD (  29.01  )
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

T24gMDcvMDEvMjAyNiAyMTozNCwgRXJpYyBCaWdnZXJzIHdyb3RlOgo+IE9uIFdlZCwgSmFuIDA3
LCAyMDI2IGF0IDA4OjQxOjAyQU0gKzAxMDAsIEhvbGdlciBEZW5nbGVyIHdyb3RlOgo+PiBIaSBF
cmljLAo+Pgo+PiBmaXJzdCBvZiBhbGw6IGhhcHB5IE5ldyBZZWFyISBBTmQgdGhhbmtzIGZvciB0
aGUgc2VyaWVzLgo+Pgo+PiBPbiAwNS8wMS8yMDI2IDA2OjEyLCBFcmljIEJpZ2dlcnMgd3JvdGU6
Cj4+PiBJbXBsZW1lbnQgYWVzX3ByZXBhcmVrZXlfYXJjaCgpLCBhZXNfZW5jcnlwdF9hcmNoKCks
IGFuZCAKPj4+IGFlc19kZWNyeXB0X2FyY2goKSB1c2luZyB0aGUgQ1BBQ0YgQUVTIGluc3RydWN0
aW9ucy4KPj4KPj4gSSdtIG5vdCBzdXJlLCBpdCBpdCBtYWtlcyBzZW5zZSB0byBpbXBsZW1lbnQg
dGhpcyBvbiBzMzkwIGF0IGFsbC4gVGhlIENQQUNGCj4+IGluc3RydWN0aW9ucyBjb3ZlciBmdWxs
IG1vZGVzIG9mIG9wZXJhdGlvbnMgYW5kIGFyZSAgdG8gcHJvY2VzcyBtb3JlCj4+IHRoYW4gb25l
IGNpcGhlci1ibG9jay1zaXplICgqKS4gRm9yIHNpbmdsZS1ibG9jayBvcGVyYXRpb25zLCB0aGUg
cGVyZm9ybWFuY2UKPj4gbWlnaHQgYmUgd29ydGggdGhhbiB1c2luZyB0aGUgZ2VuZXJpYyBmdW5j
dGlvbnMuIEkgd2lsbCBsb29rIGludG8gaXQgYW5kIGRvCj4+IHNvbWUgcGVyZm9ybWFuY2UgdGVz
dHMuIElmIHRoZXJlIGlzIGEgcG9zc2liaWxpdHkgdG8gcGx1Zy1pbiB0byB0aGUgbGV2ZWwKPj4g
d2hlcmUgdGhlIG1vZGVzIG9mIG9wZXJhdGlvbiBhcmUgaW1wbGVtZW50ZWQsIGl0IHdvdWxkIG1h
a2UgbXVjaCBtb3JlIHNlbnNlCj4+IGZvciBzMzkwLgo+Pgo+PiAoKikgWWVzLCBpdCdzIGEgYml0
IHVuY29tbW9uLCBidXQgdGhlIENQQUNGIGluc3RydWN0aW9ucyBvbiBzMzkwIGNhbiBwcm9jZXNz
Cj4+IG11bHRpcGxlIGJsb2NrIHdpdGggYSBzaW5nbGUgaW5zdHJ1Y3Rpb24gY2FsbCEgVGhleSBh
cmUgc28gY2FsbGVkIGxvbmcgcnVubmluZwo+PiBpbnN0cnVjdGlvbnMuCj4gCj4gSSdtIGhhcHB5
IHRvIGRyb3AgdGhlIENQQUNGIHNpbmdsZS1ibG9jayBBRVMgY29kZSBpZiBpdCdzIG5vdAo+IHdv
cnRod2hpbGUuICBJIGluY2x1ZGVkIGl0IG9ubHkgYmVjYXVzZSBhcmNoL3MzOTAvY3J5cHRvLyBh
bHJlYWR5IGhhcwo+IHN1Y2ggY29kZS4gIFNpbmNlIEknbSBtYWtpbmcgaXQgc28gdGhhdCB0aGUg
Y3J5cHRvX2NpcGhlciBBUEkgc2ltcGx5Cj4gd3JhcHMgdGhlIGxpYnJhcnkgQVBJLCBpZiB0aGlz
IGNvZGUgaXMgbm90IGJyb3VnaHQgaW50byB0aGUgbGlicmFyeSBpdAo+IHdpbGwgZWZmZWN0aXZl
bHkgYmUgZHJvcHBlZC4gIFlvdSBoYWQgcHVzaGVkIGJhY2sgdGhlIGxhc3QgdGltZSBJCj4gcHJv
cG9zZWQgZHJvcHBpbmcgb25lIG9mIHRoZSBzMzkwIG9wdGltaXphdGlvbnMsIGV2ZW4gYSBmYWly
bHkgbWlub3Igb25lCj4gKGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWNyeXB0by81MWZj
OTFiNi0zYTZlLTQ0ZjctYWU5My1hZWYwYmNiNDg5NjRAbGludXguaWJtLmNvbS8pLgo+IAo+IEJ1
dCBJIGhhdmUgbm8gd2F5IHRvIHRlc3Qgb3IgYmVuY2htYXJrIHRoZSBzMzkwIGNvZGUgbXlzZWxm
LiAgSWYgdGhlCj4gQ1BBQ0Ygc2luZ2xlLWJsb2NrIEFFUyBlbi9kZWNyeXB0aW9uIGNvZGUgaXNu
J3Qgd29ydGh3aGlsZSwgdGhlcmUncyBubwo+IHJlYXNvbiB0byBrZWVwIGl0LCBzbyBJJ2xsIHJl
bW92ZSBpdC4KCk15IGFzc3VtdGlvbiwgdGhhdCB0aGUgYWVzIHNpbmdsZS1ibG9jay1vcGVyYXRp
b24gb3BlcmF0aW9uIGlzIHNsb3dlciBpbiBDUEFDRgp0aGFuIGluIHNvZnR3YXJlLCBzZWVtcyB0
byBiZSB3cm9uZy4gSSBkaWQgc29tZSBtZWFzdXJlbWVudHMgb24gZGlmZmVyZW50Cm1hY2hpbmVz
IGFuZCBpdCB0dXJucyBvdXQsIHRoYXQgaXQgaXMgdXAgdG8gfjJ4IGZhc3RlciBkb2luZyBpdCBp
biBDUEFDRi4KClNvLCBzb3JyeSBmb3IgdGhlIG5vaXNlLiBQbGVhc2UgbGVhdmUgeW91ciBzMzkw
IGltcGxlbWVudGF0aW9uIGFzIGl0IGlzLgoKUFM6IEkgaGF2ZSBhIHNpbXBsZSBrdW5pdCB0ZXN0
IGZvciBhZXMgKEtBVCBhbmQgYmVuY2htYXJrIGZvciBlYWNoIGRpcmVjdGlvbgphbmQga2V5LXNp
emUpLiBJJ2xsIHNlbmQgaXQgaW4gYSBzZXBhcmF0ZSByZXBseS4gRmVlbCBmcmVlIHRvIHBpY2sg
aXQuCgo+IEFzIGZvciBBRVMgbW9kZXMsIGxhdGVyIHBhdGNoc2V0cyBhcmUgZ29pbmcgdG8gaW50
cm9kdWNlCj4gYXJjaGl0ZWN0dXJlLW9wdGltaXplZCBBRVMgbW9kZXMgaW50byB0aGUgbGlicmFy
eSwgYW5kIHRoZSB0cmFkaXRpb25hbAo+IGNyeXB0byBBUEkgZm9yIHRob3NlIG1vZGVzIHdpbGwg
c2ltaWxhcmx5IGJlIHJlaW1wbGVtZW50ZWQgb24gdG9wIG9mIGl0Lgo+IFRoaXMgcGF0Y2hzZXQg
anVzdCBmb2N1c2VzIG9uIHRoZSBleGlzdGluZyBsaWJyYXJ5IEFQSSBmb3Iga2V5IGV4cGFuc2lv
bgo+IGFuZCBzaW5nbGUgYmxvY2sgZW4vZGVjcnlwdGlvbiBhcyBhIGZpcnN0IHN0ZXAuICAoQXMg
d2l0aCB0aGUKPiB0cmFkaXRpb25hbCBBUEksIHNpbmdsZSBibG9jayBlbi9kZWNyeXB0aW9uIGlz
IG5lZWRlZCBhcyBhIGZhbGxiYWNrIHRvCj4gaGFuZGxlIGFueSBtb2RlcyB0aGF0IGRvbid0IGhh
dmUgYSBzdGFuZGFsb25lIGltcGxlbWVudGF0aW9uLikKCk9rLiBTbyB3ZSdsbCB3YWl0IGZvciB1
cGNvbWluZyBwYXRjaHNldHMuCgotLSAKTWl0IGZyZXVuZGxpY2hlbiBHcsO8w59lbiAvIEtpbmQg
cmVnYXJkcwpIb2xnZXIgRGVuZ2xlcgotLQpJQk0gU3lzdGVtcywgTGludXggb24gSUJNIFogRGV2
ZWxvcG1lbnQKZGVuZ2xlckBsaW51eC5pYm0uY29tCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
