Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9523CF6BF4
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jan 2026 07:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D4zt+JdOjFQHzvE9c3AMck/TjMnyK+ZaA1gE1qbqhA0=; b=A72IACv5LXx2QJ
	SFudvP9BvG+OcHeSFypVzr1f4sVxY82qUayYcafSNze5YzlvFp3alE6GUY3m3aqe8neIXaE0fiiII
	aJeQAbQEVm2Ipsj5BdkPlbP3Dr/IGh7oubbfv5WVQ/un9gkwUQNXpNxmF4TMciWOIFyP0FYwTEgfK
	ZHhIbdMj6Nd03YkzlV4IBKtxnHLkjAl9iqVnYXw/BdQLjnQS3n8MfQdiagdCGvY2yE8sPbWVv4/uV
	lxOzgsT4RObbCFWUos2oeuhHnrLu3V82dH/mbTC65Rr7DrpEKnO/Vi6NxZuzC0U062HbTs7Xpw3gZ
	n8HEg5OoW9a5QyVKisKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdOBK-0000000EIvL-1M5u;
	Wed, 07 Jan 2026 07:42:14 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdOBI-0000000EIud-2AC4;
	Wed, 07 Jan 2026 07:42:13 +0000
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 606JHNFG010621;
	Wed, 7 Jan 2026 07:41:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=1OZUwc
	KFlVEp1Wy+fiQBJUjbSRrLG01ise870K7kToI=; b=bFsXPVWQffGEjgz43qR9SU
	oK9i1gKcGibfmctolAf0Q95wRmnUngUTNHd2zM2G59babPu8XdgILHMZoDz0wTAq
	4eYjSWZgPNgZWVYDTk+OnX/6LCj5+1HiBQ/iP/uakjlCDMjjRGVBsfez5YEDAbXO
	/cxf/ovbbw7QTTH/ZgMhjz10jPo4lJbKXYM40fkI70r7pVtga2xeU1Vi249nCNK4
	KaHEo1JhOt7nZ/TTwFjtbW4SoR59yMc9EOw/EB/PI5a86kvDMKfglBi5kb05SFED
	GVS7bn13G3twfi4Y3S0a7SRsE3R8CbgFviQmZjdfEB1rnMvxqrwaawJSzuiM3WDw
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4beshexq7s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Jan 2026 07:41:05 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 6073cmdh005264;
	Wed, 7 Jan 2026 07:41:05 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4bfexk7rkb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Jan 2026 07:41:04 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6077f2aR16122176
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 7 Jan 2026 07:41:03 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CF7732004E;
	Wed,  7 Jan 2026 07:41:02 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8A3312004B;
	Wed,  7 Jan 2026 07:41:02 +0000 (GMT)
Received: from [9.111.198.188] (unknown [9.111.198.188])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  7 Jan 2026 07:41:02 +0000 (GMT)
Message-ID: <167cbd49-e0ba-4b1d-a724-e64ab6ee863c@linux.ibm.com>
Date: Wed, 7 Jan 2026 08:41:02 +0100
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
From: Holger Dengler <dengler@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20260105051311.1607207-16-ebiggers@kernel.org>
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA1NyBTYWx0ZWRfX2Ar3kzLBShn/
 kdRHVYkMALEAtFOLTrFv3UfaLcyHGNcf2FudjUR/NeyXQ7HAsrwQwlYZneMJ2N2uGvAupQRk1e/
 TSguKGdM8P/wi3igdzTYXCbt1TuRtcriMIpKGz1q+34bvm2mFZxURCDAEFZ7ryUhKJA/DdD2MAp
 3o8LQKFDglWsyiT4LMj68s0SN7DVxC4u641BbU+DyD+pblgwJ0jw1Pe5/qmd6ArnP1Z100oAPvL
 a6Add51rNovhsAzGHW4iUYS/l7vtFWxtXxTJVz7G0slY/W7koj28QBNWoTI0rf38mxOrTtj1UCV
 N+zXBL+vzIKjyQNF3RLFspYinN9vgfuVJpQ0nkXy/1ShtyuR4fKH4FNlzq/G6QmdwxV0SdyQavG
 GIgvHZEtzy4g9sk9HKKrGeBGxWK2zEF1eq+89TivB8tIEmzU7X8E2C3eipi9+Bwb9ZDpNNfyMTV
 7YxdoBUyksPo7u0Y7Rw==
X-Proofpoint-GUID: ucJZtlyWTiqD4d7TJcTXL99WK-bHXMG1
X-Proofpoint-ORIG-GUID: ucJZtlyWTiqD4d7TJcTXL99WK-bHXMG1
X-Authority-Analysis: v=2.4 cv=AOkvhdoa c=1 sm=1 tr=0 ts=695e0e11 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=w46-cfdy0MOtRbFV-QQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0 impostorscore=0
 clxscore=1011 suspectscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2512120000 definitions=main-2601070057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_234212_679196_2285DF1D 
X-CRM114-Status: GOOD (  16.18  )
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

SGkgRXJpYywKCmZpcnN0IG9mIGFsbDogaGFwcHkgTmV3IFllYXIhIEFOZCB0aGFua3MgZm9yIHRo
ZSBzZXJpZXMuCgpPbiAwNS8wMS8yMDI2IDA2OjEyLCBFcmljIEJpZ2dlcnMgd3JvdGU6Cj4gSW1w
bGVtZW50IGFlc19wcmVwYXJla2V5X2FyY2goKSwgYWVzX2VuY3J5cHRfYXJjaCgpLCBhbmQgCj4g
YWVzX2RlY3J5cHRfYXJjaCgpIHVzaW5nIHRoZSBDUEFDRiBBRVMgaW5zdHJ1Y3Rpb25zLgoKSSdt
IG5vdCBzdXJlLCBpdCBpdCBtYWtlcyBzZW5zZSB0byBpbXBsZW1lbnQgdGhpcyBvbiBzMzkwIGF0
IGFsbC4gVGhlIENQQUNGCmluc3RydWN0aW9ucyBjb3ZlciBmdWxsIG1vZGVzIG9mIG9wZXJhdGlv
bnMgYW5kIGFyZSBvcHRpbWl6ZWQgdG8gcHJvY2VzcyBtb3JlCnRoYW4gb25lIGNpcGhlci1ibG9j
ay1zaXplICgqKS4gRm9yIHNpbmdsZS1ibG9jayBvcGVyYXRpb25zLCB0aGUgcGVyZm9ybWFuY2UK
bWlnaHQgYmUgd29ydGggdGhhbiB1c2luZyB0aGUgZ2VuZXJpYyBmdW5jdGlvbnMuIEkgd2lsbCBs
b29rIGludG8gaXQgYW5kIGRvCnNvbWUgcGVyZm9ybWFuY2UgdGVzdHMuIElmIHRoZXJlIGlzIGEg
cG9zc2liaWxpdHkgdG8gcGx1Zy1pbiB0byB0aGUgbGV2ZWwKd2hlcmUgdGhlIG1vZGVzIG9mIG9w
ZXJhdGlvbiBhcmUgaW1wbGVtZW50ZWQsIGl0IHdvdWxkIG1ha2UgbXVjaCBtb3JlIHNlbnNlCmZv
ciBzMzkwLgoKKCopIFllcywgaXQncyBhIGJpdCB1bmNvbW1vbiwgYnV0IHRoZSBDUEFDRiBpbnN0
cnVjdGlvbnMgb24gczM5MCBjYW4gcHJvY2VzcwptdWx0aXBsZSBibG9jayB3aXRoIGEgc2luZ2xl
IGluc3RydWN0aW9uIGNhbGwhIFRoZXkgYXJlIHNvIGNhbGxlZCBsb25nIHJ1bm5pbmcKaW5zdHJ1
Y3Rpb25zLgoKPiBUaGVuLCByZW1vdmUgdGhlIHN1cGVyc2VkZWQgImFlcy1zMzkwIiBjcnlwdG9f
Y2lwaGVyLgo+IAo+IFRoZSByZXN1bHQgaXMgdGhhdCBib3RoIHRoZSBBRVMgbGlicmFyeSBhbmQg
Y3J5cHRvX2NpcGhlciBBUElzIHVzZSB0aGUgCj4gQ1BBQ0YgQUVTIGluc3RydWN0aW9ucywgd2hl
cmVhcyBwcmV2aW91c2x5IG9ubHkgY3J5cHRvX2NpcGhlciBkaWQgKGFuZCBpdCAKPiB3YXNuJ3Qg
ZW5hYmxlZCBieSBkZWZhdWx0LCB3aGljaCB0aGlzIGNvbW1pdCBmaXhlcyBhcyB3ZWxsKS4KPiAK
PiBOb3RlIHRoYXQgdGhpcyBwcmVzZXJ2ZXMgdGhlIG9wdGltaXphdGlvbiB3aGVyZSB0aGUgQUVT
IGtleSBpcyBzdG9yZWQgaW4gCj4gcmF3IGZvcm0gcmF0aGVyIHRoYW4gZXhwYW5kZWQgZm9ybS4g
IENQQUNGIGp1c3QgdGFrZXMgdGhlIHJhdyBrZXkuCj4gCj4gU2lnbmVkLW9mZi1ieTogRXJpYyBC
aWdnZXJzIDxlYmlnZ2Vyc0BrZXJuZWwub3JnPiAtLS0gYXJjaC9zMzkwL2NyeXB0by8KCi0tIE1p
dCBmcmV1bmRsaWNoZW4gR3LDvMOfZW4gLyBLaW5kIHJlZ2FyZHMKSG9sZ2VyIERlbmdsZXIKLS0K
SUJNIFN5c3RlbXMsIExpbnV4IG9uIElCTSBaIERldmVsb3BtZW50CmRlbmdsZXJAbGludXguaWJt
LmNvbQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
