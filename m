Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 928CEFEE4C9
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Feb 2026 13:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kpHj9PiXUhhDoKFO/aVIO61+zkzOUlwYF6EMuPSbbAo=; b=q0PJ4vxOlby6jG3dNJOMQ8ih1s
	YEd6ETmvDeHdmsZyJlEeh5jwaagomXL14og5xkGZE/gFagcfFeqX8FCARDUWZlVVubQM6lnT9wNTj
	3xOL8EP0B/VaeSQRjCk+O3/tVSI7MK3U9Y/VqwaGgZCHhaSInSYhP1H8grl6whOIy9IDhG6Ud2SXV
	u85m0aZkEV2oBY0ObA9p6k9vDD64qqPvBVJWs4Hx/4pzaXGxcYnLSVjRDrVqGbGmszUo8x6enFExE
	dVkS12qvNKcR6ZOP3VJvMHYovNGdNtKEkdlTGKdT9bmEYyfdDv1mGlkNNksWm/ztaCx6zpvxvIV55
	WnAVUtrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwK4E-00000009qvk-3ekR;
	Sat, 28 Feb 2026 13:09:10 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwK4B-00000009qvF-2SiC;
	Sat, 28 Feb 2026 13:09:08 +0000
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61S8lkMb2447252;
	Sat, 28 Feb 2026 13:08:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=e3h6lK
	PADkarDnV9tMxKLLerzBFFSfZGDUJSV7g45+k=; b=Hk0p4k/6smPydLZ9oUzc20
	aNTzGjk1n/5sgfK0KV4ceX9Dm6YdaNab5b1xrnIszlnopxp+JuFjIuM4KxxW2b5U
	g4Te7MHDdwLeRg1DOwpHofxhauRWgj/IGpkdZMt+xF/8spsQoq+vYFcXCX/Uc4AF
	//BBJN0zoOPhizc3V1fVdyHvI2kPKjxQrA0Ihf44i4KIRnJa1rCS/8l2887pLJEm
	kn52QT4bWE0Mo6EWHldILKR39ExM+V63Ytbcz5lJOw0wanVZr0VVULqjuqbHSYI3
	ylroQUGK5swb/FPlIkCy3wGLjHl2NC1+MT3VSz9iGV/pIks7OMaQTrpjHOxLZ8sw
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cksrhrwsf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 28 Feb 2026 13:08:21 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61SAMWO5013438;
	Sat, 28 Feb 2026 13:08:20 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4cfqdypsva-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 28 Feb 2026 13:08:20 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61SD8GuF57278852
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 28 Feb 2026 13:08:16 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0C9A920040;
	Sat, 28 Feb 2026 13:08:16 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D495B20043;
	Sat, 28 Feb 2026 13:07:57 +0000 (GMT)
Received: from [9.124.209.149] (unknown [9.124.209.149])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 28 Feb 2026 13:07:57 +0000 (GMT)
Message-ID: <c20e22cd-e1bf-4993-9ee8-bce62a5c0879@linux.ibm.com>
Date: Sat, 28 Feb 2026 18:37:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/5] crash: Use crash_exclude_core_ranges() on powerpc
To: Jinjie Ruan <ruanjinjie@huawei.com>, corbet@lwn.net,
        skhan@linuxfoundation.org, catalin.marinas@arm.com, will@kernel.org,
        chenhuacai@kernel.org, kernel@xen0n.name, maddy@linux.ibm.com,
        mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org,
        pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
        alex@ghiti.fr, tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, hpa@zytor.com, robh@kernel.org,
        saravanak@kernel.org, akpm@linux-foundation.org, bhe@redhat.com,
        vgoyal@redhat.com, dyoung@redhat.com, pmladek@suse.com,
        rdunlap@infradead.org, dapeng1.mi@linux.intel.com, kees@kernel.org,
        paulmck@kernel.org, lirongqing@baidu.com, arnd@arndb.de,
        rppt@kernel.org, ardb@kernel.org, leitao@debian.org, jbohac@suse.cz,
        cfsworks@gmail.com, ryan.roberts@arm.com, tangyouling@kylinos.cn,
        ritesh.list@gmail.com, hbathini@linux.ibm.com, eajames@linux.ibm.com,
        songshuaishuai@tinylab.org, samuel.holland@sifive.com,
        kevin.brodsky@arm.com, vishal.moola@gmail.com,
        junhui.liu@pigmoral.tech, coxu@redhat.com, liaoyuanhong@vivo.com,
        brgerst@gmail.com, fuqiang.wang@easystack.cn, x86@kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, kexec@lists.infradead.org
References: <20260226130437.1867658-1-ruanjinjie@huawei.com>
 <20260226130437.1867658-4-ruanjinjie@huawei.com>
 <3576865b-65bd-4289-babc-975a543eb775@linux.ibm.com>
 <0a776b5f-5a88-2c71-7305-d30d9240c2cb@huawei.com>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <0a776b5f-5a88-2c71-7305-d30d9240c2cb@huawei.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=Rp/I7SmK c=1 sm=1 tr=0 ts=69a2e8c6 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=i0EeH86SAAAA:8 a=SqbkEvhUw2NNNf05Xa8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDEyMSBTYWx0ZWRfX071lBZNc4yPs
 a+VvK7FC4ZLJ83ujFSxE4qKrT2im2H45r5MaQT28kHvEJTqd6pJVaAyuSjQ3NuM6wUa0qEH2alF
 P1jCkPqkp6CqN0DKLbWKVk21rKn8njj0UZAYJeaU8TzE/4SPRd0l4Zs1QS7ZiiOL/7qs3FoMu6G
 5csaG6FOvpwfilpgha8+Qro/2ZkMmOh4FsC3nEWvKPC+6uws9ppkA2uxtJuI7qYY4767PsvsYoF
 EsF4NUtz447QS7ih5aGhLRWxZs0pYsfIx4JJJmsUkfBQZzN4/aNXD+3Qe9CGx4E+D7TcSZtBXEI
 XFXUL1muBf1u/clq8TG8N1+SmISXqsyGVdsRfh4SMvQngoVyIAT0YOagP6M0o6qk6U4uLYL2oHz
 3Abjnl6QdWdZlzi3KOhcXYOhHL66mqa0R9Vsau62cBWDsTUfJyfY4QGts602vgdSDGI5+I3b7Rt
 tTiPIRyq15vMDpnE3VQ==
X-Proofpoint-GUID: VU3eDeJEliDLLLNFpw6e5qki7AdYAUd0
X-Proofpoint-ORIG-GUID: qiO9pP1xveZBu3XCkKWBR8dO855n6A-Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_04,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602280121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_050907_641758_147BF5A1 
X-CRM114-Status: GOOD (  20.01  )
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

CgpPbiAyOC8wMi8yNiAwNjo1MSwgSmluamllIFJ1YW4gd3JvdGU6Cj4KPiBPbiAyMDI2LzIvMjcg
MjI6NTAsIFNvdXJhYmggSmFpbiB3cm90ZToKPj4gUmVzZW5kIG9mOgo+PiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9hbGwvMTljZjE4YjUtMzYyZC00ZmYyLThiODUtZTJlNzI4MDkyNTBjQGxpbnV4
LmlibS5jb20vCj4+Cj4+IE9uIDI2LzAyLzI2IDE4OjM0LCBKaW5qaWUgUnVhbiB3cm90ZToKPj4+
IFRoZSBjcmFzaCBtZW1vcnkgZXhjbHVkZSBvZiBjcmFzaGtfcmVzIGFuZCBjcmFzaGtfY21hIG1l
bW9yeSBvbiBwb3dlcnBjCj4+PiBhcmUgYWxtb3N0IGlkZW50aWNhbCB0byB0aGUgZ2VuZXJpYyBj
cmFzaF9leGNsdWRlX2NvcmVfcmFuZ2VzKCkuCj4+Pgo+Pj4gQnkgaW50cm9kdWNpbmcgdGhlIGFy
Y2hpdGVjdHVyZS1zcGVjaWZpYyBhcmNoX2NyYXNoX2V4Y2x1ZGVfbWVtX3JhbmdlKCkKPj4+IGZ1
bmN0aW9uIHdpdGggYSBkZWZhdWx0IGltcGxlbWVudGF0aW9uIG9mIGNyYXNoX2V4Y2x1ZGVfbWVt
X3JhbmdlKCksCj4+PiBhbmQgdXNpbmcgY3Jhc2hfZXhjbHVkZV9tZW1fcmFuZ2VfZ3VhcmRlZCBh
cyBwb3dlcnBjJ3Mgc2VwYXJhdGUKPj4+IGltcGxlbWVudGF0aW9uLCB0aGUgZ2VuZXJpYyBjcmFz
aF9leGNsdWRlX2NvcmVfcmFuZ2VzKCkgaGVscGVyIGZ1bmN0aW9uCj4+PiBjYW4gYmUgcmV1c2Vk
Lgo+Pj4KPj4+IEFja2VkLWJ5OiBNaWtlIFJhcG9wb3J0IChNaWNyb3NvZnQpIDxycHB0QGtlcm5l
bC5vcmc+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBKaW5qaWUgUnVhbiA8cnVhbmppbmppZUBodWF3ZWku
Y29tPgo+Pj4gLS0tCj4+PiAgwqAgYXJjaC9wb3dlcnBjL2tleGVjL3Jhbmdlcy5jIHwgMTYgKysr
Ky0tLS0tLS0tLS0tLQo+Pj4gIMKgIGluY2x1ZGUvbGludXgvY3Jhc2hfY29yZS5owqAgfMKgIDQg
KysrKwo+Pj4gIMKgIGtlcm5lbC9jcmFzaF9jb3JlLmPCoMKgwqDCoMKgwqDCoMKgIHwgMTkgKysr
KysrKysrKysrKy0tLS0tLQo+Pj4gIMKgIDMgZmlsZXMgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygr
KSwgMTggZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9rZXhl
Yy9yYW5nZXMuYyBiL2FyY2gvcG93ZXJwYy9rZXhlYy9yYW5nZXMuYwo+Pj4gaW5kZXggNmM1OGJj
YzNlMTMwLi5lNWZlYTIzYjE5MWIgMTAwNjQ0Cj4+PiAtLS0gYS9hcmNoL3Bvd2VycGMva2V4ZWMv
cmFuZ2VzLmMKPj4+ICsrKyBiL2FyY2gvcG93ZXJwYy9rZXhlYy9yYW5nZXMuYwo+Pj4gQEAgLTU1
Myw5ICs1NTMsOSBAQCBpbnQgZ2V0X3VzYWJsZV9tZW1vcnlfcmFuZ2VzKHN0cnVjdCBjcmFzaF9t
ZW0KPj4+ICoqbWVtX3JhbmdlcykKPj4+ICDCoCAjZW5kaWYgLyogQ09ORklHX0tFWEVDX0ZJTEUg
Ki8KPj4+ICDCoCDCoCAjaWZkZWYgQ09ORklHX0NSQVNIX0RVTVAKPj4+IC1pbnQgY3Jhc2hfZXhj
bHVkZV9tZW1fcmFuZ2VfZ3VhcmRlZChzdHJ1Y3QgY3Jhc2hfbWVtICoqbWVtX3JhbmdlcywKPj4+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBs
b25nIGxvbmcgbXN0YXJ0LAo+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHVuc2lnbmVkIGxvbmcgbG9uZyBtZW5kKQo+Pj4gK2ludCBhcmNoX2NyYXNoX2V4
Y2x1ZGVfbWVtX3JhbmdlKHN0cnVjdCBjcmFzaF9tZW0gKiptZW1fcmFuZ2VzLAo+Pj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGxvbmcgbG9uZyBtc3RhcnQsCj4+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgbG9uZyBsb25nIG1l
bmQpCj4+Cj4+IHVwZGF0ZV9jcmFzaF9lbGZjb3JlaGRyKCkgaW4gYXJjaC9wb3dlcnBjL2tleGVj
L2NyYXNoLmMgc3RpbGwgY2FsbHMKPj4gY3Jhc2hfZXhjbHVkZV9tZW1fcmFuZ2VfZ3VhcmRlZCgp
LCBjYXVzaW5nIGEgYnVpbGQgZmFpbHVyZS4KPj4KPj4gbGQ6IGFyY2gvcG93ZXJwYy9rZXhlYy9j
cmFzaC5vOiBpbiBmdW5jdGlvbiBgdXBkYXRlX2NyYXNoX2VsZmNvcmVoZHInOgo+PiAvcm9vdC9s
aW51eC9hcmNoL3Bvd2VycGMva2V4ZWMvY3Jhc2guYzo0NTQ6IHVuZGVmaW5lZCByZWZlcmVuY2Ug
dG8KPj4gYGNyYXNoX2V4Y2x1ZGVfbWVtX3JhbmdlX2d1YXJkZWQnCj4+Cj4+Cj4+IFRvIGZpeCB0
aGlzOgo+PiAtLS0tLS0tLS0tLS0tLQo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2tleGVj
L2NyYXNoLmMgYi9hcmNoL3Bvd2VycGMva2V4ZWMvY3Jhc2guYwo+PiBpbmRleCA4OTg3NDJhNTIw
NWMuLmU1OWU5MDljMzY5ZCAxMDA2NDQKPj4gLS0tIGEvYXJjaC9wb3dlcnBjL2tleGVjL2NyYXNo
LmMKPj4gKysrIGIvYXJjaC9wb3dlcnBjL2tleGVjL2NyYXNoLmMKPj4gQEAgLTQ1MSw3ICs0NTEs
NyBAQCBzdGF0aWMgdm9pZCB1cGRhdGVfY3Jhc2hfZWxmY29yZWhkcihzdHJ1Y3Qga2ltYWdlCj4+
ICppbWFnZSwgc3RydWN0IG1lbW9yeV9ub3RpZnkgKgo+PiAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgYmFzZV9hZGRyID0gUEZOX1BIWVMobW4tPnN0YXJ0X3Bmbik7Cj4+ICDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCBzaXplID0gbW4tPm5yX3BhZ2VzICogUEFHRV9TSVpFOwo+PiAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgZW5kID0gYmFzZV9hZGRyICsgc2l6ZSAtIDE7Cj4+IC3CoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoHJldCA9IGNyYXNoX2V4Y2x1ZGVfbWVtX3JhbmdlX2d1YXJkZWQoJmNtZW0s
IGJhc2VfYWRkciwKPj4gZW5kKTsKPj4gK8KgIMKgIMKgIMKgIMKgIMKgIMKgIHJldCA9IGFyY2hf
Y3Jhc2hfZXhjbHVkZV9tZW1fcmFuZ2UoJmNtZW0sIGJhc2VfYWRkciwgZW5kKTsKPj4gIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIGlmIChyZXQpIHsKPj4gIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIHByX2VycigiRmFpbGVkIHRvIHJlbW92ZSBob3QtdW5wbHVnZ2VkIG1lbW9y
eQo+PiBmcm9tIGNyYXNoIG1lbW9yeSByYW5nZXNcbiIpOwo+PiAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgZ290byBvdXQ7Cj4+Cj4+IFdpdGggdGhlIGFib3ZlIGNoYW5nZSBp
bmNsdWRlZCwgdGhpbmdzIGFyZSB3b3JraW5nIGZpbmUgb24gcG93ZXJwYy4KPiBJdCBzZWVtcyB0
aGUgZGVjbGFyYXRpb24gb2YgY3Jhc2hfZXhjbHVkZV9tZW1fcmFuZ2VfZ3VhcmRlZCgpIGFkZGVk
IGluCj4gYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2tleGVjX3Jhbmdlcy5oIGNhbiBhbHNvIGJl
IHJlbW92ZWQuCgpZZXMsIGxldHMgcmVtb3ZlIGl0LgoKPgo+Pgo+Pj4gIMKgIHsKPj4+ICDCoMKg
wqDCoMKgIHN0cnVjdCBjcmFzaF9tZW0gKnRtZW0gPSAqbWVtX3JhbmdlczsKPj4+ICDCoCBAQCAt
NjA0LDE4ICs2MDQsMTAgQEAgaW50IGdldF9jcmFzaF9tZW1vcnlfcmFuZ2VzKHN0cnVjdCBjcmFz
aF9tZW0KPj4+ICoqbWVtX3JhbmdlcykKPj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBz
b3J0X21lbW9yeV9yYW5nZXMoKm1lbV9yYW5nZXMsIHRydWUpOwo+Pj4gIMKgwqDCoMKgwqAgfQo+
Pj4gIMKgIC3CoMKgwqAgLyogRXhjbHVkZSBjcmFzaGtlcm5lbCByZWdpb24gKi8KPj4+IC3CoMKg
wqAgcmV0ID0gY3Jhc2hfZXhjbHVkZV9tZW1fcmFuZ2VfZ3VhcmRlZChtZW1fcmFuZ2VzLAo+Pj4g
Y3Jhc2hrX3Jlcy5zdGFydCwgY3Jhc2hrX3Jlcy5lbmQpOwo+Pj4gK8KgwqDCoCByZXQgPSBjcmFz
aF9leGNsdWRlX2NvcmVfcmFuZ2VzKG1lbV9yYW5nZXMpOwo+Pj4gIMKgwqDCoMKgwqAgaWYgKHJl
dCkKPj4+ICDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBvdXQ7Cj4+PiAgwqAgLcKgwqDCoCBmb3Ig
KGkgPSAwOyBpIDwgY3Jhc2hrX2NtYV9jbnQ7ICsraSkgewo+Pj4gLcKgwqDCoMKgwqDCoMKgIHJl
dCA9IGNyYXNoX2V4Y2x1ZGVfbWVtX3JhbmdlX2d1YXJkZWQobWVtX3JhbmdlcywKPj4+IGNyYXNo
a19jbWFfcmFuZ2VzW2ldLnN0YXJ0LAo+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNyYXNoa19jbWFfcmFuZ2VzW2ldLmVuZCk7Cj4+PiAtwqDC
oMKgwqDCoMKgwqAgaWYgKHJldCkKPj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gb3V0
Owo+Pj4gLcKgwqDCoCB9Cj4+PiAtCj4+PiAgwqDCoMKgwqDCoCAvKgo+Pj4gIMKgwqDCoMKgwqDC
oCAqIEZJWE1FOiBGb3Igbm93LCBzdGF5IGluIHBhcml0eSB3aXRoIGtleGVjLXRvb2xzIGJ1dCBp
ZiBSVEFTL09QQUwKPj4+ICDCoMKgwqDCoMKgwqAgKsKgwqDCoMKgwqDCoMKgIHJlZ2lvbnMgYXJl
IGV4cG9ydGVkIHRvIHNhdmUgdGhlaXIgY29udGV4dCBhdCB0aGUgdGltZSBvZgo+Pj4gZGlmZiAt
LWdpdCBhL2luY2x1ZGUvbGludXgvY3Jhc2hfY29yZS5oIGIvaW5jbHVkZS9saW51eC9jcmFzaF9j
b3JlLmgKPj4+IGluZGV4IDAzM2IyMDIwNGFjYS4uZGJlYzgyNmRjNTNiIDEwMDY0NAo+Pj4gLS0t
IGEvaW5jbHVkZS9saW51eC9jcmFzaF9jb3JlLmgKPj4+ICsrKyBiL2luY2x1ZGUvbGludXgvY3Jh
c2hfY29yZS5oCj4+PiBAQCAtNjgsNiArNjgsNyBAQCBleHRlcm4gaW50IGNyYXNoX3ByZXBhcmVf
ZWxmNjRfaGVhZGVycyhzdHJ1Y3QKPj4+IGNyYXNoX21lbSAqbWVtLCBpbnQgbmVlZF9rZXJuZWxf
bWEKPj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
dm9pZCAqKmFkZHIsIHVuc2lnbmVkIGxvbmcgKnN6KTsKPj4+ICDCoCBleHRlcm4gaW50IGNyYXNo
X3ByZXBhcmVfaGVhZGVycyhpbnQgbmVlZF9rZXJuZWxfbWFwLCB2b2lkICoqYWRkciwKPj4+ICDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgbG9uZyAqc3osIHVu
c2lnbmVkIGxvbmcgKm5yX21lbV9yYW5nZXMpOwo+Pj4gK2V4dGVybiBpbnQgY3Jhc2hfZXhjbHVk
ZV9jb3JlX3JhbmdlcyhzdHJ1Y3QgY3Jhc2hfbWVtICoqY21lbSk7Cj4+PiAgwqAgwqAgc3RydWN0
IGtpbWFnZTsKPj4+ICDCoCBzdHJ1Y3Qga2V4ZWNfc2VnbWVudDsKPj4+IEBAIC04OCw2ICs4OSw5
IEBAIGV4dGVybiBpbnQga2ltYWdlX2NyYXNoX2NvcHlfdm1jb3JlaW5mbyhzdHJ1Y3QKPj4+IGtp
bWFnZSAqaW1hZ2UpOwo+Pj4gIMKgIGV4dGVybiB1bnNpZ25lZCBpbnQgYXJjaF9nZXRfc3lzdGVt
X25yX3Jhbmdlcyh2b2lkKTsKPj4+ICDCoCBleHRlcm4gaW50IGFyY2hfY3Jhc2hfcG9wdWxhdGVf
Y21lbShzdHJ1Y3QgY3Jhc2hfbWVtICpjbWVtKTsKPj4+ICDCoCBleHRlcm4gaW50IGFyY2hfY3Jh
c2hfZXhjbHVkZV9yYW5nZXMoc3RydWN0IGNyYXNoX21lbSAqY21lbSk7Cj4+PiArZXh0ZXJuIGlu
dCBhcmNoX2NyYXNoX2V4Y2x1ZGVfbWVtX3JhbmdlKHN0cnVjdCBjcmFzaF9tZW0gKiptZW0sCj4+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgbG9uZyBs
b25nIG1zdGFydCwKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1
bnNpZ25lZCBsb25nIGxvbmcgbWVuZCk7Cj4+PiAgwqAgwqAgI2Vsc2UgLyogIUNPTkZJR19DUkFT
SF9EVU1QKi8KPj4+ICDCoCBzdHJ1Y3QgcHRfcmVnczsKPj4+IGRpZmYgLS1naXQgYS9rZXJuZWwv
Y3Jhc2hfY29yZS5jIGIva2VybmVsL2NyYXNoX2NvcmUuYwo+Pj4gaW5kZXggOTZhOTZlNTExZjVh
Li4zMDBkNDRhZDU0NzEgMTAwNjQ0Cj4+PiAtLS0gYS9rZXJuZWwvY3Jhc2hfY29yZS5jCj4+PiAr
KysgYi9rZXJuZWwvY3Jhc2hfY29yZS5jCj4+PiBAQCAtMjg3LDI0ICsyODcsMzEgQEAgdW5zaWdu
ZWQgaW50IF9fd2Vhawo+Pj4gYXJjaF9nZXRfc3lzdGVtX25yX3Jhbmdlcyh2b2lkKSB7IHJldHVy
biAwOyB9Cj4+PiAgwqAgaW50IF9fd2VhayBhcmNoX2NyYXNoX3BvcHVsYXRlX2NtZW0oc3RydWN0
IGNyYXNoX21lbSAqY21lbSkgeyByZXR1cm4KPj4+IC0xOyB9Cj4+PiAgwqAgaW50IF9fd2VhayBh
cmNoX2NyYXNoX2V4Y2x1ZGVfcmFuZ2VzKHN0cnVjdCBjcmFzaF9tZW0gKmNtZW0pIHsKPj4+IHJl
dHVybiAwOyB9Cj4+PiAgwqAgLXN0YXRpYyBpbnQgY3Jhc2hfZXhjbHVkZV9jb3JlX3Jhbmdlcyhz
dHJ1Y3QgY3Jhc2hfbWVtICpjbWVtKQo+Pj4gK2ludCBfX3dlYWsgYXJjaF9jcmFzaF9leGNsdWRl
X21lbV9yYW5nZShzdHJ1Y3QgY3Jhc2hfbWVtICoqbWVtLAo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGxvbmcgbG9uZyBtc3RhcnQsCj4+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgbG9uZyBsb25nIG1l
bmQpCj4+PiArewo+Pj4gK8KgwqDCoCByZXR1cm4gY3Jhc2hfZXhjbHVkZV9tZW1fcmFuZ2UoKm1l
bSwgbXN0YXJ0LCBtZW5kKTsKPj4+ICt9Cj4+PiArCj4+PiAraW50IGNyYXNoX2V4Y2x1ZGVfY29y
ZV9yYW5nZXMoc3RydWN0IGNyYXNoX21lbSAqKmNtZW0pCj4+PiAgwqAgewo+Pj4gIMKgwqDCoMKg
wqAgaW50IHJldCwgaTsKPj4+ICDCoCDCoMKgwqDCoMKgIC8qIEV4Y2x1ZGUgY3Jhc2hrZXJuZWwg
cmVnaW9uICovCj4+PiAtwqDCoMKgIHJldCA9IGNyYXNoX2V4Y2x1ZGVfbWVtX3JhbmdlKGNtZW0s
IGNyYXNoa19yZXMuc3RhcnQsCj4+PiBjcmFzaGtfcmVzLmVuZCk7Cj4+PiArwqDCoMKgIHJldCA9
IGFyY2hfY3Jhc2hfZXhjbHVkZV9tZW1fcmFuZ2UoY21lbSwgY3Jhc2hrX3Jlcy5zdGFydCwKPj4+
IGNyYXNoa19yZXMuZW5kKTsKPj4+ICDCoMKgwqDCoMKgIGlmIChyZXQpCj4+PiAgwqDCoMKgwqDC
oMKgwqDCoMKgIHJldHVybiByZXQ7Cj4+PiAgwqAgwqDCoMKgwqDCoCBpZiAoY3Jhc2hrX2xvd19y
ZXMuZW5kKSB7Cj4+PiAtwqDCoMKgwqDCoMKgwqAgcmV0ID0gY3Jhc2hfZXhjbHVkZV9tZW1fcmFu
Z2UoY21lbSwgY3Jhc2hrX2xvd19yZXMuc3RhcnQsCj4+PiBjcmFzaGtfbG93X3Jlcy5lbmQpOwo+
Pj4gK8KgwqDCoMKgwqDCoMKgIHJldCA9IGFyY2hfY3Jhc2hfZXhjbHVkZV9tZW1fcmFuZ2UoY21l
bSwKPj4+IGNyYXNoa19sb3dfcmVzLnN0YXJ0LCBjcmFzaGtfbG93X3Jlcy5lbmQpOwo+Pj4gIMKg
wqDCoMKgwqDCoMKgwqDCoCBpZiAocmV0KQo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHJldHVybiByZXQ7Cj4+PiAgwqDCoMKgwqDCoCB9Cj4+PiAgwqAgwqDCoMKgwqDCoCBmb3IgKGkg
PSAwOyBpIDwgY3Jhc2hrX2NtYV9jbnQ7ICsraSkgewo+Pj4gLcKgwqDCoMKgwqDCoMKgIHJldCA9
IGNyYXNoX2V4Y2x1ZGVfbWVtX3JhbmdlKGNtZW0sIGNyYXNoa19jbWFfcmFuZ2VzW2ldLnN0YXJ0
LAo+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGNyYXNoa19jbWFfcmFuZ2VzW2ldLmVuZCk7Cj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0ID0gYXJj
aF9jcmFzaF9leGNsdWRlX21lbV9yYW5nZShjbWVtLAo+Pj4gY3Jhc2hrX2NtYV9yYW5nZXNbaV0u
c3RhcnQsCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBjcmFzaGtfY21hX3Jhbmdlc1tpXS5lbmQpOwo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDC
oCBpZiAocmV0KQo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7Cj4+
PiAgwqDCoMKgwqDCoCB9Cj4+PiBAQCAtMzMxLDcgKzMzOCw3IEBAIGludCBjcmFzaF9wcmVwYXJl
X2hlYWRlcnMoaW50IG5lZWRfa2VybmVsX21hcCwKPj4+IHZvaWQgKiphZGRyLCB1bnNpZ25lZCBs
b25nICpzeiwKPj4+ICDCoMKgwqDCoMKgIGlmIChyZXQpCj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKg
IGdvdG8gb3V0Owo+Pj4gIMKgIC3CoMKgwqAgcmV0ID0gY3Jhc2hfZXhjbHVkZV9jb3JlX3Jhbmdl
cyhjbWVtKTsKPj4+ICvCoMKgwqAgcmV0ID0gY3Jhc2hfZXhjbHVkZV9jb3JlX3JhbmdlcygmY21l
bSk7Cj4+PiAgwqDCoMKgwqDCoCBpZiAocmV0KQo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoCBnb3Rv
IG91dDsKPj4+ICAgIAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
