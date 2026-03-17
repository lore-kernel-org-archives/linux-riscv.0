Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F851FB5EA7
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Mar 2026 02:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NOdusL2o3c3CkJ9sMoKTE4wvYJMULh+UgO59hKZXZHs=; b=D+jWEsvwm0/cEg
	8o8mxV2HharAvXCxXvhtQz6JPttLFUUCPTxYMwRPGs8A4Lt7k4k/8cbGir7/3NscOwktVt6GIX9gK
	eE+MzaOaAC+2SD9yl/imjE/TYjwYec6YDSD++d4dj2iO1PHZKJvod8yOHbVgRh2CTw6ayhMu/pomP
	x9lWPg7fE586s6mqlxD0k6S5eCQlDPAH9PHTj2OPHiasDDhVocyjZOeNQwqDHBWT3Bs2dPI8q6R7L
	xfZfJFIZyMLtz56QZTW5wb/ZR3BcqpuS4VJjjyg7Zu61rdLgvPxAaQZvzycJgev5ggnFk+pYK7kYj
	xhx6Po0aPE0V9EEG3Yzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2KLk-00000005G41-3V6L;
	Tue, 17 Mar 2026 02:40:04 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2KLh-00000005G3X-46nc;
	Tue, 17 Mar 2026 02:40:03 +0000
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GFmO7Q1067860;
	Tue, 17 Mar 2026 02:39:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=WAyxlZ
	Ob18faDii1hcBxce5sODl/jY3fcpYkQYaZOtY=; b=nVrnEhTTLbk/Spff2mRY4U
	Bk1xD4c7IRsuUQn2vkQWWQnsTW/n9CztKIRqpCqgswr1gAN9izU/AmUNyr52krq7
	Ebjv73kCfCp7xk9eKMg6LYkMGxzpLeIpffM6NWo3IyGvQeEvApEQ9bDSBAJq7/CP
	rh45PAGE4cd4d8eKVA7j+ks402Bw2yiQLotdYBs52KJN62oiR2atI6uHi9TxLj5J
	OdH+C5rgBXaTz7snJSJf4qXaj95VxdkqOKTARCFoApbhPLCiDoLPYef7WRdP0Fma
	q/leTHOKiVDuZ8EtsU1N4KXXIHZ/JZll9xoTl88NeNZRiGiB882uJ3B99myaGbBQ
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cvybs2pa9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Mar 2026 02:39:50 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 62H1NC99028708;
	Tue, 17 Mar 2026 02:39:48 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4cwkgk77u0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Mar 2026 02:39:48 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 62H2dkFp58327300
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Mar 2026 02:39:46 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AEF492004E;
	Tue, 17 Mar 2026 02:39:46 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1E8312004B;
	Tue, 17 Mar 2026 02:39:43 +0000 (GMT)
Received: from [9.123.14.142] (unknown [9.123.14.142])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 17 Mar 2026 02:39:42 +0000 (GMT)
Message-ID: <161b024f-9022-45c6-9808-815b8ea83bd9@linux.ibm.com>
Date: Tue, 17 Mar 2026 08:09:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/15] arch/powerpc: don't initialize kasan if it's
 disabled
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Baoquan He <bhe@redhat.com>, kasan-dev@googlegroups.com
Cc: linux-mm@kvack.org, andreyknvl@gmail.com, ryabinin.a.a@gmail.com,
        glider@google.com, dvyukov@google.com, linux-kernel@vger.kernel.org,
        linux-um@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
        loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, x86@kernel.org, chris@zankel.net,
        jcmvbkbc@gmail.com, linux-s390@vger.kernel.org, hca@linux.ibm.com
References: <20260225081412.76502-1-bhe@redhat.com>
 <20260225081412.76502-10-bhe@redhat.com>
 <71921cca-b890-41c4-93e9-957d3f647ffa@linux.ibm.com>
 <0bc30137-3f1d-4a4a-8573-8f26866fcc26@kernel.org>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <0bc30137-3f1d-4a4a-8573-8f26866fcc26@kernel.org>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=MMttWcZl c=1 sm=1 tr=0 ts=69b8bef6 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=uAbxVGIbfxUO_5tXvNgY:22 a=20KFwNOVAAAA:8
 a=voM4FWlXAAAA:8 a=VnNF1IyMAAAA:8 a=5rPG81X-PvUkzTHTjkcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IC2XNlieTeVoXbcui8wp:22
X-Proofpoint-ORIG-GUID: HWoExDelsoEK2cbRMVIpcCVRBxC05kk2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDAxNyBTYWx0ZWRfXywbZf72OQQWO
 6dqxsntbcC6njezyY+HUqTo0rMFEcHOa573IhojGtmtl6Ek/h9rDkQ2yRH41g07ro4PtNLNlOC6
 bI4CP+Eo7cJqO30z4F4OpwJRb7oS9s2B+PdrBZGIhhBwTfWdoX+mdVUGUIDK9tPDGQazj/yuJTA
 8yPRocQXGhSyuDnhQ4sEbwI/SIqoTBAF+OwumN6W7cofg79urUof1tkhBjgR3ss/tzvou0Gkwsd
 kjOMcJu1j/1arCqKQXLU99t6T+WhXTTVqGlTTLue2d9D5oEUDDDzvtgbq8qOG3+dpMjYEFX37y/
 MF9157RX5GHtISXonVIOAQoXt0lzPq516Jmwt2G/r+aSNaAAKuzXUoWGFtTXrZT8xJszLvgcI2P
 Fo9Fl3eSCV46HHhRmWODojBiOnxk4jwwWvyrUxIBwQYEXgzcNqAiNbnyKMgsdgR+EmKOgA328e5
 Ky+m+8qMEGSY1KVS2Cw==
X-Proofpoint-GUID: ey18HYg4huOLB-DOzeSP3hWnR40_py-b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_06,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_194002_367697_439274F0 
X-CRM114-Status: GOOD (  18.21  )
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

CgpPbiAxMi8wMy8yNiAxNjo1MywgQ2hyaXN0b3BoZSBMZXJveSAoQ1MgR1JPVVApIHdyb3RlOgo+
Cj4KPiBMZSAxMi8wMy8yMDI2IMOgIDEyOjEyLCBTb3VyYWJoIEphaW4gYSDDqWNyaXTCoDoKPj4K
Pj4KPj4gT24gMjUvMDIvMjYgMTM6NDQsIEJhb3F1YW4gSGUgd3JvdGU6Cj4+PiBIZXJlLCBrYXNh
biBpcyBkaXNhYmxlZCBpZiBzcGVjaWZpZWQgJ2thc2FuPW9mZicgaW4ga2VybmVsIGNtZGxpbmUu
Cj4+Pgo+Pj4gVGhpcyBpbmNsdWRlcyAzMmJpdCwgYm9vazNzLzY0IGFuZCBib29rM2UvNjQuCj4+
Pgo+Pj4gU2lnbmVkLW9mZi1ieTogQmFvcXVhbiBIZSA8YmhlQHJlZGhhdC5jb20+Cj4+PiBDYzog
bGludXhwcGMtZGV2QGxpc3RzLm96bGFicy5vcmcKPj4+IC0tLQo+Pj4gwqAgYXJjaC9wb3dlcnBj
L21tL2thc2FuL2luaXRfMzIuY8KgwqDCoMKgwqDCoMKgIHwgNiArKysrKy0KPj4+IMKgIGFyY2gv
cG93ZXJwYy9tbS9rYXNhbi9pbml0X2Jvb2szZV82NC5jIHwgNCArKysrCj4+PiDCoCBhcmNoL3Bv
d2VycGMvbW0va2FzYW4vaW5pdF9ib29rM3NfNjQuYyB8IDQgKysrKwo+Pj4gwqAgMyBmaWxlcyBj
aGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Pgo+Pj4gZGlmZiAtLWdp
dCBhL2FyY2gvcG93ZXJwYy9tbS9rYXNhbi9pbml0XzMyLmMgCj4+PiBiL2FyY2gvcG93ZXJwYy9t
bS9rYXNhbi8gaW5pdF8zMi5jCj4+PiBpbmRleCAxZDA4MzU5NzQ2NGYuLjBlYTJhNjM2Yzk5MiAx
MDA2NDQKPj4+IC0tLSBhL2FyY2gvcG93ZXJwYy9tbS9rYXNhbi9pbml0XzMyLmMKPj4+ICsrKyBi
L2FyY2gvcG93ZXJwYy9tbS9rYXNhbi9pbml0XzMyLmMKPj4+IEBAIC0xNDEsNiArMTQxLDEwIEBA
IHZvaWQgX19pbml0IGthc2FuX2luaXQodm9pZCkKPj4+IMKgwqDCoMKgwqAgdTY0IGk7Cj4+PiDC
oMKgwqDCoMKgIGludCByZXQ7Cj4+PiArwqDCoMKgIC8qIElmIEtBU0FOIGlzIGRpc2FibGVkIHZp
YSBjb21tYW5kIGxpbmUsIGRvbid0IGluaXRpYWxpemUgaXQuICovCj4+PiArwqDCoMKgIGlmIChr
YXNhbl9hcmdfZGlzYWJsZWQpCj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuOwo+Pj4gKwo+Pj4g
wqDCoMKgwqDCoCBmb3JfZWFjaF9tZW1fcmFuZ2UoaSwgJmJhc2UsICZlbmQpIHsKPj4+IMKgwqDC
oMKgwqDCoMKgwqDCoCBwaHlzX2FkZHJfdCB0b3AgPSBtaW4oZW5kLCB0b3RhbF9sb3dtZW0pOwo+
Pj4gQEAgLTE3MCw3ICsxNzQsNyBAQCB2b2lkIF9faW5pdCBrYXNhbl9pbml0KHZvaWQpCj4+PiDC
oCB2b2lkIF9faW5pdCBrYXNhbl9sYXRlX2luaXQodm9pZCkKPj4+IMKgIHsKPj4+IC3CoMKgwqAg
aWYgKElTX0VOQUJMRUQoQ09ORklHX0tBU0FOX1ZNQUxMT0MpKQo+Pj4gK8KgwqDCoCBpZiAoSVNf
RU5BQkxFRChDT05GSUdfS0FTQU5fVk1BTExPQykgJiYga2FzYW5fZW5hYmxlZCgpKQo+Pj4gwqDC
oMKgwqDCoMKgwqDCoMKgIGthc2FuX3VubWFwX2Vhcmx5X3NoYWRvd192bWFsbG9jKCk7Cj4+PiDC
oCB9Cj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL21tL2thc2FuL2luaXRfYm9vazNlXzY0
LmMgCj4+PiBiL2FyY2gvcG93ZXJwYy9tbS8ga2FzYW4vaW5pdF9ib29rM2VfNjQuYwo+Pj4gaW5k
ZXggMGQzYTczZDZkNGIwLi5mYmU0YzlhN2U0NjAgMTAwNjQ0Cj4+PiAtLS0gYS9hcmNoL3Bvd2Vy
cGMvbW0va2FzYW4vaW5pdF9ib29rM2VfNjQuYwo+Pj4gKysrIGIvYXJjaC9wb3dlcnBjL21tL2th
c2FuL2luaXRfYm9vazNlXzY0LmMKPj4+IEBAIC0xMTEsNiArMTExLDEwIEBAIHZvaWQgX19pbml0
IGthc2FuX2luaXQodm9pZCkKPj4+IMKgwqDCoMKgwqAgdTY0IGk7Cj4+PiDCoMKgwqDCoMKgIHB0
ZV90IHplcm9fcHRlID0gcGZuX3B0ZSh2aXJ0X3RvX3BmbihrYXNhbl9lYXJseV9zaGFkb3dfcGFn
ZSksIAo+Pj4gUEFHRV9LRVJORUxfUk8pOwo+Pj4gK8KgwqDCoCAvKiBJZiBLQVNBTiBpcyBkaXNh
YmxlZCB2aWEgY29tbWFuZCBsaW5lLCBkb24ndCBpbml0aWFsaXplIGl0LiAqLwo+Pj4gK8KgwqDC
oCBpZiAoa2FzYW5fYXJnX2Rpc2FibGVkKQo+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybjsKPj4+
ICsKPj4+IMKgwqDCoMKgwqAgZm9yX2VhY2hfbWVtX3JhbmdlKGksICZzdGFydCwgJmVuZCkKPj4+
IMKgwqDCoMKgwqDCoMKgwqDCoCBrYXNhbl9pbml0X3BoeXNfcmVnaW9uKHBoeXNfdG9fdmlydChz
dGFydCksIAo+Pj4gcGh5c190b192aXJ0KGVuZCkpOwo+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93
ZXJwYy9tbS9rYXNhbi9pbml0X2Jvb2szc182NC5jIAo+Pj4gYi9hcmNoL3Bvd2VycGMvbW0vIGth
c2FuL2luaXRfYm9vazNzXzY0LmMKPj4+IGluZGV4IGRjYWZhNjQxODA0Yy4uZjc5MDZmOWVmOWJl
IDEwMDY0NAo+Pj4gLS0tIGEvYXJjaC9wb3dlcnBjL21tL2thc2FuL2luaXRfYm9vazNzXzY0LmMK
Pj4+ICsrKyBiL2FyY2gvcG93ZXJwYy9tbS9rYXNhbi9pbml0X2Jvb2szc182NC5jCj4+PiBAQCAt
NTQsNiArNTQsMTAgQEAgdm9pZCBfX2luaXQga2FzYW5faW5pdCh2b2lkKQo+Pj4gwqDCoMKgwqDC
oCB1NjQgaTsKPj4+IMKgwqDCoMKgwqAgcHRlX3QgemVyb19wdGUgPSBwZm5fcHRlKHZpcnRfdG9f
cGZuKGthc2FuX2Vhcmx5X3NoYWRvd19wYWdlKSwgCj4+PiBQQUdFX0tFUk5FTCk7Cj4+PiArwqDC
oMKgIC8qIElmIEtBU0FOIGlzIGRpc2FibGVkIHZpYSBjb21tYW5kIGxpbmUsIGRvbid0IGluaXRp
YWxpemUgaXQuICovCj4+PiArwqDCoMKgIGlmIChrYXNhbl9hcmdfZGlzYWJsZWQpCj4+PiArwqDC
oMKgwqDCoMKgwqAgcmV0dXJuOwo+Pj4gKwo+Pj4gwqDCoMKgwqDCoCBpZiAoIWVhcmx5X3JhZGl4
X2VuYWJsZWQoKSkgewo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHByX3dhcm4oIktBU0FOIG5vdCBl
bmFibGVkIGFzIGl0IHJlcXVpcmVzIHJhZGl4ISIpOwo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJl
dHVybjsKPj4KPj4gU2hvdWxkIHdlIGxvZyBpbiB0aGUga2VybmVsIGxvZyBidWZmZXIgdGhhdCBL
QVNBTiBpcyBkaXNhYmxlZD8KPj4KPj4gUmlnaHQgbm93LCBJIGRvbid0IHNlZSB0aGUga2VybmVs
IGFkdmVydGlzaW5nIHRoZSBzYW1lLgo+Cj4gV2hlbiBLQVNBTiBpcyBlbmFibGVkIGl0IGlzIGFk
dmVydGlzZWQgd2l0aDoKPgo+IMKgwqDCoMKgcHJfaW5mbygiS2VybmVsQWRkcmVzc1Nhbml0aXpl
ciBpbml0aWFsaXplZCAoZ2VuZXJpYylcbiIpOwo+Cj4gSXNuJ3QgdGhlIGFic2VuY2Ugb2YgdGhh
dCBtZXNzYWdlIGVub3VnaCB0byB1bmRlcnN0YW5kIEtBU0FOIGlzIG5vdCAKPiB0aGVyZSA/CgpZ
ZXMgdGhpcyBzaG91bGQgd29yay4gVGhhbmtzLgoKCi0gU291cmFiaCBKYWluCgoKPgo+Pgo+PiAk
IGRtZXNnIHwgZ3JlcCAtaSBrYXNhbgo+PiBbwqAgwqAgMC4wMDAwMDBdIEtlcm5lbCBjb21tYW5k
IGxpbmU6IEJPT1RfSU1BR0U9KGllZWUxMjc1Ly92ZGV2aWNlL3YtIAo+PiBzY3NpQDMwMDAwMDcw
L2Rpc2tAODEwMDAwMDAwMDAwMDAwMCxtc2RvczIpL3ZtbGludXotNy4wLjAtcmMzKyAKPj4gY3Jh
c2hrZXJuZWw9Mkcga2FzYW49b2ZmCj4+Cj4+IFRlc3RlZCB0aGlzIHNlcmllcyBvbiBwb3dlcnBj
IFBzZXJpZXMgcGxhdGZvcm0uCj4+IFNvIGZlZWwgZnJlZSB0byBhZGQ6Cj4+IFRlc3RlZC1ieTog
U291cmFiaCBKYWluIDxzb3VyYWJoamFpbkBsaW51eC5pYm0uY29tPgo+Pgo+PiAtIFNvdXJhYmgg
SmFpbgo+Pgo+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
