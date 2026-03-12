Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 939B7105A586
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Mar 2026 11:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xx4eB/o6Db73rz35FwAw5VGX/Pxzv5huKBy8X/2PkUM=; b=OYR+3YUlwuDzQD
	kz3N41nTGoQ/a5T1OchPdfuPDmIgf0P0VJ5HLPnG1a1+pXnIdoyHTHMVpMCVTbS0wtlBvPng7fUsc
	XktBzz0OWiMXd37YcCM8XjaBec+76Sq+NZrhrWs4GzDTBJeit8mSaoqFgwJQveL0uKtcABtCAobqS
	yuDUldoAQjyGu0jEYlsK4wzdUsn1BE5o2sAnPKXIOuzY66pvyAeX1JV+oY0sbVr5+fNm/7uei/0oE
	7iLIQz33oo/n9Gfx7nXph+pU8i0fpsyKqk3FygJBgeEg9mulLg0AhYgUvNewXemtwXKFcJqOGOF9j
	AzPf2//L/OVdxYlQ+1fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0dyS-0000000DvBC-0OIk;
	Thu, 12 Mar 2026 11:13:04 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0dyP-0000000DvAG-0kq1;
	Thu, 12 Mar 2026 11:13:02 +0000
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BMWPq02279397;
	Thu, 12 Mar 2026 11:12:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=qFwb11
	X0zrrF96hDRnrNne+UfFUOQp/uf8JCpdTCVwI=; b=CkvJemL88mOKrQnUYcuUw9
	v/lgsBx8TN5vdU6h/SIF8Ldu3K8Ug6D+Yp5oOpfuyZmsQt8w7UWAJS27LWxzO2AB
	qJiJZKWL+I2Ssbtc0opT3qdsA44BKHuwAaYqVM6g7nsQbGEODsco5l+huQ5I+xxx
	BZauCHcdzpBAr+cc4WxU22UEDZypALbDY+VCjW8DLlk/6wxbAXi1ZFzuAYIAmh+O
	k+3Slj+7c9xAMUhN9xjLSefjQUt4axPosk4bfZ0jp7bigiV9LjFIJtfSfaUqWV/p
	lktUd/dgHUAUJ+cXeQbwo7JBL0aKhao8/lM1CDSj9CGS2NQB30kI8Vv4JtgGvZwA
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cuh91jb9v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Mar 2026 11:12:53 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 62C9aRxI014797;
	Thu, 12 Mar 2026 11:12:52 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4cuha8a1xj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Mar 2026 11:12:51 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 62CBCoTr36503948
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Mar 2026 11:12:50 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F28362004B;
	Thu, 12 Mar 2026 11:12:49 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1A21220040;
	Thu, 12 Mar 2026 11:12:47 +0000 (GMT)
Received: from [9.109.204.116] (unknown [9.109.204.116])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 12 Mar 2026 11:12:46 +0000 (GMT)
Message-ID: <71921cca-b890-41c4-93e9-957d3f647ffa@linux.ibm.com>
Date: Thu, 12 Mar 2026 16:42:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/15] arch/powerpc: don't initialize kasan if it's
 disabled
To: Baoquan He <bhe@redhat.com>, kasan-dev@googlegroups.com
Cc: linux-mm@kvack.org, andreyknvl@gmail.com, ryabinin.a.a@gmail.com,
        glider@google.com, dvyukov@google.com, linux-kernel@vger.kernel.org,
        linux-um@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
        loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, x86@kernel.org, chris@zankel.net,
        jcmvbkbc@gmail.com, linux-s390@vger.kernel.org, hca@linux.ibm.com
References: <20260225081412.76502-1-bhe@redhat.com>
 <20260225081412.76502-10-bhe@redhat.com>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <20260225081412.76502-10-bhe@redhat.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: sK4H9fwZp-KLt_Uh6QEN1FURiK-VcUay
X-Authority-Analysis: v=2.4 cv=E6/AZKdl c=1 sm=1 tr=0 ts=69b29fb5 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=uAbxVGIbfxUO_5tXvNgY:22 a=20KFwNOVAAAA:8
 a=voM4FWlXAAAA:8 a=VnNF1IyMAAAA:8 a=e6XaAvPcIE9lEXRYuwcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IC2XNlieTeVoXbcui8wp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDA4NyBTYWx0ZWRfX/mtfNCEYEuc6
 WHnW4p9iVwWYhz47Or92vnI3HCFHwJtfujDrjNzVlJPrH+HNMFrM5rei+tcs68Z8xKbUMLW4OGS
 nCC3o1olVSQZigyKu8dPplVewbl+wRYHv9pug6m4GgXDTxjkx/bFrguphZ3UlQo8DTuZgOK7pT7
 XoX/Pn2toTKs0nsYAIR0bSRishOkQI7WvgwwfqCbulME6FSQeiA+c1uiCQVkk5pmlyfJAVn0xAp
 Pd2bmli4VyUJXDxXTGZdXRFpkSuVHPAXPQU/E02hIaN/9uTz9550KWyukcPEC/RWPfdtgQaWvnT
 dA5KdZMWC431ZuagttMr9l48fgf2ZsGNNBHZ778481DcVjv3LdLN4uwlF7NKiDY3IpRloCGz839
 sR9Hlsf9U+wi24kTc7YK1aOscBc/I0desU0vcau1oECfMdpaWfrggI5bqsG8fSprzOHFsV0rdAa
 5fL4EVBZVPzrPv5kKmA==
X-Proofpoint-ORIG-GUID: appgZUPYvO44oILc1-ob_bhU232DA-fp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1011 malwarescore=0 phishscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_041301_224130_C5E8F653 
X-CRM114-Status: GOOD (  20.18  )
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

CgpPbiAyNS8wMi8yNiAxMzo0NCwgQmFvcXVhbiBIZSB3cm90ZToKPiBIZXJlLCBrYXNhbiBpcyBk
aXNhYmxlZCBpZiBzcGVjaWZpZWQgJ2thc2FuPW9mZicgaW4ga2VybmVsIGNtZGxpbmUuCj4KPiBU
aGlzIGluY2x1ZGVzIDMyYml0LCBib29rM3MvNjQgYW5kIGJvb2szZS82NC4KPgo+IFNpZ25lZC1v
ZmYtYnk6IEJhb3F1YW4gSGUgPGJoZUByZWRoYXQuY29tPgo+IENjOiBsaW51eHBwYy1kZXZAbGlz
dHMub3psYWJzLm9yZwo+IC0tLQo+ICAgYXJjaC9wb3dlcnBjL21tL2thc2FuL2luaXRfMzIuYyAg
ICAgICAgfCA2ICsrKysrLQo+ICAgYXJjaC9wb3dlcnBjL21tL2thc2FuL2luaXRfYm9vazNlXzY0
LmMgfCA0ICsrKysKPiAgIGFyY2gvcG93ZXJwYy9tbS9rYXNhbi9pbml0X2Jvb2szc182NC5jIHwg
NCArKysrCj4gICAzIGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvbW0va2FzYW4vaW5pdF8zMi5jIGIvYXJj
aC9wb3dlcnBjL21tL2thc2FuL2luaXRfMzIuYwo+IGluZGV4IDFkMDgzNTk3NDY0Zi4uMGVhMmE2
MzZjOTkyIDEwMDY0NAo+IC0tLSBhL2FyY2gvcG93ZXJwYy9tbS9rYXNhbi9pbml0XzMyLmMKPiAr
KysgYi9hcmNoL3Bvd2VycGMvbW0va2FzYW4vaW5pdF8zMi5jCj4gQEAgLTE0MSw2ICsxNDEsMTAg
QEAgdm9pZCBfX2luaXQga2FzYW5faW5pdCh2b2lkKQo+ICAgCXU2NCBpOwo+ICAgCWludCByZXQ7
Cj4gICAKPiArCS8qIElmIEtBU0FOIGlzIGRpc2FibGVkIHZpYSBjb21tYW5kIGxpbmUsIGRvbid0
IGluaXRpYWxpemUgaXQuICovCj4gKwlpZiAoa2FzYW5fYXJnX2Rpc2FibGVkKQo+ICsJCXJldHVy
bjsKPiArCj4gICAJZm9yX2VhY2hfbWVtX3JhbmdlKGksICZiYXNlLCAmZW5kKSB7Cj4gICAJCXBo
eXNfYWRkcl90IHRvcCA9IG1pbihlbmQsIHRvdGFsX2xvd21lbSk7Cj4gICAKPiBAQCAtMTcwLDcg
KzE3NCw3IEBAIHZvaWQgX19pbml0IGthc2FuX2luaXQodm9pZCkKPiAgIAo+ICAgdm9pZCBfX2lu
aXQga2FzYW5fbGF0ZV9pbml0KHZvaWQpCj4gICB7Cj4gLQlpZiAoSVNfRU5BQkxFRChDT05GSUdf
S0FTQU5fVk1BTExPQykpCj4gKwlpZiAoSVNfRU5BQkxFRChDT05GSUdfS0FTQU5fVk1BTExPQykg
JiYga2FzYW5fZW5hYmxlZCgpKQo+ICAgCQlrYXNhbl91bm1hcF9lYXJseV9zaGFkb3dfdm1hbGxv
YygpOwo+ICAgfQo+ICAgCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9tbS9rYXNhbi9pbml0
X2Jvb2szZV82NC5jIGIvYXJjaC9wb3dlcnBjL21tL2thc2FuL2luaXRfYm9vazNlXzY0LmMKPiBp
bmRleCAwZDNhNzNkNmQ0YjAuLmZiZTRjOWE3ZTQ2MCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Bvd2Vy
cGMvbW0va2FzYW4vaW5pdF9ib29rM2VfNjQuYwo+ICsrKyBiL2FyY2gvcG93ZXJwYy9tbS9rYXNh
bi9pbml0X2Jvb2szZV82NC5jCj4gQEAgLTExMSw2ICsxMTEsMTAgQEAgdm9pZCBfX2luaXQga2Fz
YW5faW5pdCh2b2lkKQo+ICAgCXU2NCBpOwo+ICAgCXB0ZV90IHplcm9fcHRlID0gcGZuX3B0ZSh2
aXJ0X3RvX3BmbihrYXNhbl9lYXJseV9zaGFkb3dfcGFnZSksIFBBR0VfS0VSTkVMX1JPKTsKPiAg
IAo+ICsJLyogSWYgS0FTQU4gaXMgZGlzYWJsZWQgdmlhIGNvbW1hbmQgbGluZSwgZG9uJ3QgaW5p
dGlhbGl6ZSBpdC4gKi8KPiArCWlmIChrYXNhbl9hcmdfZGlzYWJsZWQpCj4gKwkJcmV0dXJuOwo+
ICsKPiAgIAlmb3JfZWFjaF9tZW1fcmFuZ2UoaSwgJnN0YXJ0LCAmZW5kKQo+ICAgCQlrYXNhbl9p
bml0X3BoeXNfcmVnaW9uKHBoeXNfdG9fdmlydChzdGFydCksIHBoeXNfdG9fdmlydChlbmQpKTsK
PiAgIAo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvbW0va2FzYW4vaW5pdF9ib29rM3NfNjQu
YyBiL2FyY2gvcG93ZXJwYy9tbS9rYXNhbi9pbml0X2Jvb2szc182NC5jCj4gaW5kZXggZGNhZmE2
NDE4MDRjLi5mNzkwNmY5ZWY5YmUgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9wb3dlcnBjL21tL2thc2Fu
L2luaXRfYm9vazNzXzY0LmMKPiArKysgYi9hcmNoL3Bvd2VycGMvbW0va2FzYW4vaW5pdF9ib29r
M3NfNjQuYwo+IEBAIC01NCw2ICs1NCwxMCBAQCB2b2lkIF9faW5pdCBrYXNhbl9pbml0KHZvaWQp
Cj4gICAJdTY0IGk7Cj4gICAJcHRlX3QgemVyb19wdGUgPSBwZm5fcHRlKHZpcnRfdG9fcGZuKGth
c2FuX2Vhcmx5X3NoYWRvd19wYWdlKSwgUEFHRV9LRVJORUwpOwo+ICAgCj4gKwkvKiBJZiBLQVNB
TiBpcyBkaXNhYmxlZCB2aWEgY29tbWFuZCBsaW5lLCBkb24ndCBpbml0aWFsaXplIGl0LiAqLwo+
ICsJaWYgKGthc2FuX2FyZ19kaXNhYmxlZCkKPiArCQlyZXR1cm47Cj4gKwo+ICAgCWlmICghZWFy
bHlfcmFkaXhfZW5hYmxlZCgpKSB7Cj4gICAJCXByX3dhcm4oIktBU0FOIG5vdCBlbmFibGVkIGFz
IGl0IHJlcXVpcmVzIHJhZGl4ISIpOwo+ICAgCQlyZXR1cm47CgpTaG91bGQgd2UgbG9nIGluIHRo
ZSBrZXJuZWwgbG9nIGJ1ZmZlciB0aGF0IEtBU0FOIGlzIGRpc2FibGVkPwoKUmlnaHQgbm93LCBJ
IGRvbid0IHNlZSB0aGUga2VybmVsIGFkdmVydGlzaW5nIHRoZSBzYW1lLgoKJCBkbWVzZyB8IGdy
ZXAgLWkga2FzYW4KW8KgIMKgIDAuMDAwMDAwXSBLZXJuZWwgY29tbWFuZCBsaW5lOiAKQk9PVF9J
TUFHRT0oaWVlZTEyNzUvL3ZkZXZpY2Uvdi1zY3NpQDMwMDAwMDcwL2Rpc2tAODEwMDAwMDAwMDAw
MDAwMCxtc2RvczIpL3ZtbGludXotNy4wLjAtcmMzKyAKY3Jhc2hrZXJuZWw9Mkcga2FzYW49b2Zm
CgpUZXN0ZWQgdGhpcyBzZXJpZXMgb24gcG93ZXJwYyBQc2VyaWVzIHBsYXRmb3JtLgpTbyBmZWVs
IGZyZWUgdG8gYWRkOgpUZXN0ZWQtYnk6IFNvdXJhYmggSmFpbiA8c291cmFiaGphaW5AbGludXgu
aWJtLmNvbT4KCi0gU291cmFiaCBKYWluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
