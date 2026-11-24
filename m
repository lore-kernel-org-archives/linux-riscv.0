Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5542606A6A0
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2026 18:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iniA7JI1;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oOnZvmhF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=e3NmqbLRgBCSZbNR2lNPyDrzGVbKKSH379RyjvPFlGw=; b=iniA7JI1a0N/znhBQnG6Eho2Pn
	yTzYG2ncuxLcleIlSSChuKEh8rhLU78+3JaaSUyd3vMmGljMYk5Hv/ZiLzo1OxG1hd7tU/TeWj5rY
	qmC8G2zkD59T6SXCtjWrSjQo3pgfELtDDrOXuETkon6/dYouCXHvbqbNPglst1Dv0fbd+r0X6+jpr
	TU0B0zeE1WavaVPuOYvjMppyejKBIDFXHHKFrngZ/ckzECmpRhecoSDmfhBgfUC/Ni3v9pHXpuQMM
	OzED+fJPFks1aWLjbaHYo/JIA7eg1AKwr/e0Kvq3miVyIHkVsQUZwx3TZvkKavy8mHkHvSHsDOvgA
	HAdPIuLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVvDN-00000007UVd-3NXX;
	Tue, 24 Nov 2026 18:26:01 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVvDJ-00000007UUL-1wX4
	for linux-riscv@lists.infradead.org;
	Tue, 24 Nov 2026 18:25:58 +0000
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFa3Fr1235397;
	Tue, 24 Nov 2026 18:25:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Ra3jsC
	KFlcyeQDzEHh5eXFmT0/Lsiag2Ank3S7B2Ljk=; b=oOnZvmhFVNG5Kr8XsfcFc4
	5NIcvm4VfWZqI/AVSBiPZECeE8oY0iOTNcWveDWF0UkcikXu6fnz06Bdrc7W3dxO
	NoGlyqXgKRFHe57HciR3lFKsO0IcO7+88dtRrScNjIq2YAe5Op4+FU8wqHeG7O3E
	ixl+NcSx96vzOL71pWpVYdUmR9DvOqFhbt7iNt5/Kjd5X9x4lw0yU+r3f7Mdyax3
	5GddgGFKr3eIQ5/hk+b96jECQf+uLAy4gf2e+3stWsewwe9i5MMiJxOBXzRqEbGj
	1W+6/xUF4+oEiBYeMZtYkhNv5TjOTQ4RO0aYzmI2FA858YUOnuyaafjHExiZJyIQ
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j34g3948h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 24 Nov 2026 18:25:48 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFJbNd3536144;
	Tue, 24 Nov 2026 18:25:47 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4j5axks24c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Nov 2026 18:25:46 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6AOIPhDw52494668
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Nov 2026 18:25:43 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4D7A92004B;
	Tue, 24 Nov 2026 18:25:43 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5F26520040;
	Tue, 24 Nov 2026 18:25:41 +0000 (GMT)
Received: from p-imbrenda (unknown [9.111.42.244])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with SMTP;
	Tue, 24 Nov 2026 18:25:41 +0000 (GMT)
Date: Tue, 24 Nov 2026 19:24:24 +0100
From: Claudio Imbrenda <imbrenda@linux.ibm.com>
To: Carlos =?UTF-8?B?TMOzcGV6?= <clopez@suse.de>
Cc: kvm@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-s390@vger.kernel.org, linux-riscv@lists.infradead.org,
        seanjc@google.com, pbonzini@redhat.com, akpm@linux-foundation.org,
        david@kernel.org, peterx@redhat.com, ljs@kernel.org,
        borntraeger@linux.ibm.com, frankja@linux.ibm.com,
        Steffen Eiden
 <seiden@linux.ibm.com>,
        Andreas Grapentin <gra@linux.ibm.com>, Marc Zyngier
 <maz@kernel.org>,
        Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik
 <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Sven
 Schnelle <svens@linux.ibm.com>
Subject: Re: [PATCH v3 9/9] KVM: s390: don't unmap the gmap on permission
 upgrade
Message-ID: <20261124192424.157a46a3@p-imbrenda>
In-Reply-To: <20261112142039.907090-11-clopez@suse.de>
References: <20261112142039.907090-2-clopez@suse.de>
	<20261112142039.907090-11-clopez@suse.de>
Organization: IBM
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=SoQFe/O0 c=1 sm=1 tr=0 ts=6b05d6ac cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=uAbxVGIbfxUO_5tXvNgY:22 a=AIa7Fw-m9XHv1_55a70A:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA3MSBTYWx0ZWRfX6p5dAHjNm+tJ
 qQNhTSDIlZnGYtXWPLXPqs5WlzEtXy+hx65yydYPUl/PGfIM7uVi9ErV5Q32g+TgTNi6JdF3m7P
 5r7jOiAPI82eUkSec2zsoD31ScW/wJ0=
X-Proofpoint-ORIG-GUID: _bOIgOxr_71bpzoMoIN84JN7KDxL3hkY
X-Proofpoint-GUID: dlWeO2vv-EDCUQu4fy26Fmp8c1EHzeHa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA3MSBTYWx0ZWRfX+h8EAijKXqe5
 V6b1bS4c+YLh7vvhyQUKQ/smtKmFgYHCj6DxqojRQ4HVbE+AZ3JaN0DC2GvWKwfecsm5KM3q1tF
 HZJ1a8qM9WJxDWcUORAvrBEZXPaj2GF4tPsnQpbamBQi50GGUxdJTeBrWikcgR75u5jvyUr9AUj
 bMaPF2BWeCmR7hpNSNT0ucBQu8LOI8fZnu+ph9PXZscXA/9oYeTXxMxcdNYhGzbQwyvyxdrzXKr
 6+9hMmtZmT3Ha1CPL3DR1B99bmCpVaaTlKctbRkfy3RgEcXmrDon/5/Tz3Yt+k2IMsKlxlmNv1i
 qsB3cvUFV0Uu3hpBeMLU3bLOXLdlE5JWmAIXj08XCOwXpq6YcVdCgr/W+w/yrXpCKf0PvhrESBt
 O13rYkkaud/WnF6pBfqx78gZks+Bs2OIuTYpcwrxMskeBMk45d1lJ3Q/S1FnFyR2I1EmIv6yPiR
 Uz31equXc3fVclY/ACQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_102557_530685_E1613886 
X-CRM114-Status: GOOD (  20.00  )
X-Spam-Score: -2.6 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVGh1LCAxMiBOb3YgMjAyNiAxNToyMDozOCArMDEwMApDYXJsb3MgTMOzcGV6IDxjbG9wZXpA
c3VzZS5kZT4gd3JvdGU6Cgo+IFdoZW4gYW4gbW11X25vdGlmaWVyIGludmFsaWRhdGlvbiBvbmx5
IHVwZ3JhZGVzIHBlcm1pc3Npb25zCj4gKE1NVV9OT1RJRklFUl9SQU5HRV9QRVJNX1VQR1JBREUp
LCBrZWVwIHRoZSBleGlzdGluZyBnbWFwIGVudHJpZXMKPiBpbnN0ZWFkIG9mIHVubWFwcGluZyB0
aGVtLiBUaGUgUEZOIGlzIHVuY2hhbmdlZCBhbmQgbm8gYWNjZXNzIGlzCj4gcmV2b2tlZCwgc28g
YW4gZXhpc3RpbmcgZW50cnkgaXMgbm8gbW9yZSBwZXJtaXNzaXZlIHRoYW4gdGhlIG5ldyBob3N0
Cj4gUFRFLgo+IAo+IEEgd3JpdGUgdG8gYW4gZW50cnkgdGhhdCBpcyBzdGlsbCByZWFkLW9ubHkg
Y2F1c2VzIGEgcHJvdGVjdGlvbgo+IGV4Y2VwdGlvbiwgd2hpY2gga3ZtX3MzOTBfZmF1bHRpbl9n
Zm4oKSBoYW5kbGVzIGFzIGEgd3JpdGUgZmF1bHQuIFRoaXMKPiBhcHBsaWVzIHRvIGJvdGggczM5
MCBhbmQgYXJtNjQgZ3Vlc3RzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENhcmxvcyBMw7NwZXogPGNs
b3BlekBzdXNlLmRlPgo+IC0tLQo+ICBhcmNoL3MzOTAva3ZtL2FybTY0L2FybS5jIHwgNyArKysr
KysrCj4gIGFyY2gvczM5MC9rdm0vczM5MC9zMzkwLmMgfCA3ICsrKysrKysKPiAgMiBmaWxlcyBj
aGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvczM5MC9rdm0v
YXJtNjQvYXJtLmMgYi9hcmNoL3MzOTAva3ZtL2FybTY0L2FybS5jCj4gaW5kZXggYmQ5ZDg1MjM1
ZjQzLi41YWVlMTgxN2FhZDggMTAwNjQ0Cj4gLS0tIGEvYXJjaC9zMzkwL2t2bS9hcm02NC9hcm0u
Ywo+ICsrKyBiL2FyY2gvczM5MC9rdm0vYXJtNjQvYXJtLmMKPiBAQCAtNjc4LDYgKzY3OCwxMyBA
QCB2b2lkIGt2bV9hcmNoX2NvbW1pdF9tZW1vcnlfcmVnaW9uKHN0cnVjdCBrdm0gKmt2bSwgc3Ry
dWN0IGt2bV9tZW1vcnlfc2xvdCAqb2xkLAo+ICAKPiAgYm9vbCBrdm1fdW5tYXBfZ2ZuX3Jhbmdl
KHN0cnVjdCBrdm0gKmt2bSwgc3RydWN0IGt2bV9nZm5fcmFuZ2UgKnJhbmdlKQo+ICB7Cj4gKwkv
Kgo+ICsJICogRG8gbm90IGJvdGhlciB1bm1hcHBpbmcgaWYgdGhpcyBpcyBvbmx5IGEgcHJvdGVj
dGlvbiB1cGdyYWRlLgo+ICsJICogUGVybWlzc2lvbnMgd2lsbCBiZSBmYXVsdGVkLWluIG9uIGRl
bWFuZC4KPiArCSAqLwo+ICsJaWYgKHJhbmdlLT5mbGFncyAmIE1NVV9OT1RJRklFUl9SQU5HRV9Q
RVJNX1VQR1JBREUpCj4gKwkJcmV0dXJuIGZhbHNlOwoKdGhpcyB3b3JrcyBmb3Igbm93LCBidXQg
aW4gZ2VuZXJhbCB0aGUgbWVhbmluZyBvZiB0aGUgZmxhZ3MgYml0cyBkZXBlbmRzCm9uIHRoZSB2
YWx1ZSBvZiByYW5nZS0+ZXZlbnQ7IGl0IHdvdWxkbid0IGh1cnQgdG8gYWRkIGEgY2hlY2sgbGlr
ZSB0aGlzOgoJcmFuZ2UtPmV2ZW50ID09IE1NVV9OT1RJRllfUFJPVEVDVElPTl9WTUEKCj4gKwo+
ICAJcmV0dXJuIGdtYXBfdW5tYXBfZ2ZuX3JhbmdlKGt2bS0+YXJjaC5nbWFwLCByYW5nZS0+c2xv
dCwgcmFuZ2UtPnN0YXJ0LCByYW5nZS0+ZW5kKTsKPiAgfQo+ICAKPiBkaWZmIC0tZ2l0IGEvYXJj
aC9zMzkwL2t2bS9zMzkwL3MzOTAuYyBiL2FyY2gvczM5MC9rdm0vczM5MC9zMzkwLmMKPiBpbmRl
eCAxOGZiMjAwZjg1NGEuLjk1NGJmNmI2NDY4MyAxMDA2NDQKPiAtLS0gYS9hcmNoL3MzOTAva3Zt
L3MzOTAvczM5MC5jCj4gKysrIGIvYXJjaC9zMzkwL2t2bS9zMzkwL3MzOTAuYwo+IEBAIC01ODcx
LDYgKzU4NzEsMTMgQEAgYm9vbCBrdm1fYWdlX2dmbihzdHJ1Y3Qga3ZtICprdm0sIHN0cnVjdCBr
dm1fZ2ZuX3JhbmdlICpyYW5nZSkKPiAgICovCj4gIGJvb2wga3ZtX3VubWFwX2dmbl9yYW5nZShz
dHJ1Y3Qga3ZtICprdm0sIHN0cnVjdCBrdm1fZ2ZuX3JhbmdlICpyYW5nZSkKPiAgewo+ICsJLyoK
PiArCSAqIERvIG5vdCBib3RoZXIgdW5tYXBwaW5nIGlmIHRoaXMgaXMgb25seSBhIHByb3RlY3Rp
b24gdXBncmFkZS4KPiArCSAqIFBlcm1pc3Npb25zIHdpbGwgYmUgZmF1bHRlZC1pbiBvbiBkZW1h
bmQuCj4gKwkgKi8KPiArCWlmIChyYW5nZS0+ZmxhZ3MgJiBNTVVfTk9USUZJRVJfUkFOR0VfUEVS
TV9VUEdSQURFKQo+ICsJCXJldHVybiBmYWxzZTsKPiArCj4gIAlyZXR1cm4gZ21hcF91bm1hcF9n
Zm5fcmFuZ2Uoa3ZtLT5hcmNoLmdtYXAsIHJhbmdlLT5zbG90LCByYW5nZS0+c3RhcnQsIHJhbmdl
LT5lbmQpOwo+ICB9Cj4gIAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
