Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7175F532D5
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Mar 2026 04:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NO6h28pWR0tu3SjwP7ZISOzrxc816paELUO7Pftgzuc=; b=iapZhcAnplp2QN
	bLk9gzDlWfNpcqL0nr1LG5GKFLAgbatV8L4Yb/5iABUnJj/39vtUcHu4XaSSQbLWPx/advanhcsad
	CjmeaAEZJk0qM/EmLyTVCqF+GdXuwNGCYE5ttWHkkNxCFAD5JDUkaY8tZlbsVxwtoJl/bWpAhI0+3
	o+cshP5FzHAa1vcv8BvawfVTKLBzqwFzHu3hXwu5VTqifzMquN8/AseeMXu+zoQ48hVIOHSHAyXae
	xh15QqgvYKa5i4Ddma1R8R2nGFjNS5FHigb0gHv70bmBcTIeogaq9jUEjUAMTqDPXQJuMhumfa0sw
	j0wSbV0G9ktdy0Ny0Kdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4tVK-00000000YMb-479n;
	Tue, 24 Mar 2026 04:36:35 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4tVH-00000000YLy-0ZZr;
	Tue, 24 Mar 2026 04:36:32 +0000
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NNiqj13599991;
	Tue, 24 Mar 2026 04:30:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=UwLBZY
	0xAh69HUU4FoGM+gFkY3rpuiGhmJBMb77IXic=; b=mB9Wv5H1BQQFmjl5i+JJgj
	qn9zW0bW8lQhQu6a9d1rAws2VXcIiQIiTOQ6AbmLb/203lRQvPD4WFheBYcSd+Q4
	k2h/DDlmVJyT9YXLFPfYCF4S1MXTaNoiu1/ZL6QXOqVHf634k5gCN0/b1SQMymjJ
	i3By4hwkn+DB7dhSE4kc1N2nh1lYsNfnu9CB/PIOZOyQxQ97tO4/QTxSSxCAkz9N
	J9SwlOeMwg56JvPu6egjodai8zMXTWZTvoI79/agfx+TOQWbvls2aXuExJkZwdwr
	pHNnfrJ2DEvn0+RIt1yIBqE6TBfZkG3LtmpV2O88ojpBe1d9LnNjDOozNnw7Dcgw
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4d1ktusa71-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Mar 2026 04:30:05 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 62O3hwNd008745;
	Tue, 24 Mar 2026 04:30:05 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4d26nng532-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Mar 2026 04:30:05 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 62O4U0nh29819348
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Mar 2026 04:30:00 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6B60F2004E;
	Tue, 24 Mar 2026 04:30:00 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DC9F32004F;
	Tue, 24 Mar 2026 04:29:47 +0000 (GMT)
Received: from [9.123.14.142] (unknown [9.123.14.142])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 24 Mar 2026 04:29:47 +0000 (GMT)
Message-ID: <595e793d-adc3-4acb-af18-f0a3cf2d5e73@linux.ibm.com>
Date: Tue, 24 Mar 2026 09:59:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/5] arm64/riscv: Add support for crashkernel CMA
 reservation
To: Jinjie Ruan <ruanjinjie@huawei.com>,
        Andrew Morton <akpm@linux-foundation.org>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, catalin.marinas@arm.com,
        will@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name,
        maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        chleroy@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
        aou@eecs.berkeley.edu, alex@ghiti.fr, tglx@kernel.org,
        mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
        hpa@zytor.com, robh@kernel.org, saravanak@kernel.org, bhe@redhat.com,
        vgoyal@redhat.com, dyoung@redhat.com, rdunlap@infradead.org,
        peterz@infradead.org, feng.tang@linux.alibaba.com,
        pawan.kumar.gupta@linux.intel.com, dapeng1.mi@linux.intel.com,
        kees@kernel.org, elver@google.com, paulmck@kernel.org,
        lirongqing@baidu.com, safinaskar@gmail.com, rppt@kernel.org,
        ardb@kernel.org, leitao@debian.org, jbohac@suse.cz, cfsworks@gmail.com,
        osandov@fb.com, tangyouling@kylinos.cn, ritesh.list@gmail.com,
        eajames@linux.ibm.com, songshuaishuai@tinylab.org,
        kevin.brodsky@arm.com, samuel.holland@sifive.com,
        vishal.moola@gmail.com, junhui.liu@pigmoral.tech, coxu@redhat.com,
        liaoyuanhong@vivo.com, fuqiang.wang@easystack.cn, x86@kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, kexec@lists.infradead.org
References: <20260323072745.2481719-1-ruanjinjie@huawei.com>
 <20260323095548.fa4e13d6e8ae5005ae585e13@linux-foundation.org>
 <4cfde40c-673a-12b0-dfc5-703d582d6ea9@huawei.com>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <4cfde40c-673a-12b0-dfc5-703d582d6ea9@huawei.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: yqbo1T1ZaS3NpXm72fU-pbHKExRLmg3o
X-Authority-Analysis: v=2.4 cv=aMr9aL9m c=1 sm=1 tr=0 ts=69c2134e cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=c92rfblmAAAA:8
 a=i0EeH86SAAAA:8 a=m-v9b-Je9hLO35U8NS8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDAzMyBTYWx0ZWRfXzR3+xHlpbmBf
 h/N+fBRudva2vYWP6OptwoTRwOQzk1I8/3wQnvPa8Rt/ZrqSgHhrsvrawZDmpMS0QwmYF43FDLf
 HlCcmZsZgGC9X4WGG+3JZZK+v1BoEcZgoSmWPT7YCzbgc19cK+AUrfnZA/DUdwa/YT8kQD4rVlJ
 +AYgnBwkbmjz7qrae9ZCL552mIuzQ18wgAemKsIkFWdhOLIL4ViVPczjF8UwQTYlK4/5RG8BQ8Q
 tl3FOXuw+eX+JAqN+wSMhGu6UgmoqO7EbJb8S22yBrkRpJwFgdl/rtl8Q0hKyH19wnnthRldQqI
 X/qDqLZ7EhN0SsJ3JFGZ1b1s+r8tmBO0tZUjYSrg9H8a4ceYd1A47+bG1j2tcY2xqcNcb3ffolE
 iJSsS9+xp+U8AIJYdBrf1z4HTVo/7/BmQXix362mLRgyxssrXQT2AO9/MLJgcELw2l/0CYMNHHh
 HrbQML69S4TZV0GnIYA==
X-Proofpoint-GUID: fSy1nmOMAAI_wqT62ef4G42SLgos6nvO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_01,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_213631_327520_66E42708 
X-CRM114-Status: GOOD (  23.98  )
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

CgpPbiAyNC8wMy8yNiAwOTozMiwgSmluamllIFJ1YW4gd3JvdGU6Cj4KPiBPbiAyMDI2LzMvMjQg
MDo1NSwgQW5kcmV3IE1vcnRvbiB3cm90ZToKPj4gT24gTW9uLCAyMyBNYXIgMjAyNiAxNToyNzo0
MCArMDgwMCBKaW5qaWUgUnVhbiA8cnVhbmppbmppZUBodWF3ZWkuY29tPiB3cm90ZToKPj4KPj4+
IFRoZSBjcmFzaCBtZW1vcnkgYWxsb2NhdGlvbiwgYW5kIHRoZSBleGNsdWRlIG9mIGNyYXNoa19y
ZXMsIGNyYXNoa19sb3dfcmVzCj4+PiBhbmQgY3Jhc2hrX2NtYSBtZW1vcnkgYXJlIGFsbW9zdCBp
ZGVudGljYWwgYWNyb3NzIGRpZmZlcmVudCBhcmNoaXRlY3R1cmVzLAo+Pj4gVGhpcyBwYXRjaCBz
ZXQgaGFuZGxlIHRoZW0gaW4gY3Jhc2ggY29yZSBpbiBhIGdlbmVyYWwgd2F5LCB3aGljaCBlbGlt
aW5hdGUKPj4+IGEgbG90IG9mIGR1cGxpY2F0aW9uIGNvZGUuCj4+Pgo+Pj4gQW5kIGFkZCBzdXBw
b3J0IGZvciBjcmFzaGtlcm5lbCBDTUEgcmVzZXJ2YXRpb24gZm9yIGFybTY0IGFuZCByaXNjdi4K
Pj4gVGhhbmtzLiAgQUkgcmV2aWV3IGhhcyBjb21wbGV0ZWQgYW5kIGl0IGFza3MgcXVlc3Rpb25z
Ogo+PiAJaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwMzIzMDcyNzQ1LjI0ODE3
MTktMS1ydWFuamluamllQGh1YXdlaS5jb20KPiBJIGJlbGlldmUgaXQgaWRlbnRpZmllZCA0IHZh
bGlkIGlzc3VlczoKPgo+IC0gVGhlIGFscmVhZHkgZGlzY292ZXJlZCBjcmFzaGtfbG93X3JlcyBu
b3QgZXhjbHVkZWQgYnVnIGluIHRoZSBleGlzdGluZwo+IFJJU0MtViBjb2RlLgo+Cj4gLSBBbiBl
eGlzdGluZyBtZW1vcnkgbGVhayBpc3N1ZSBpbiB0aGUgZXhpc3RpbmcgUG93ZXJQQyBjb2RlLgoK
WWVzIGFuZCBzdWdnZXN0ZWQgYXBwcm9hY2ggdG8gZml4IHRoZSBpc3N1ZSBsb29rcyBnb29kLgpX
aGljaCBpcyBiYXNpY2FsbHkgcmVwbGFjZSByZXR1cm4gd2l0aCBnb3RvIG91dC4KCmRpZmYgLS1n
aXQgYS9hcmNoL3Bvd2VycGMva2V4ZWMvY3Jhc2guYyBiL2FyY2gvcG93ZXJwYy9rZXhlYy9jcmFz
aC5jCmluZGV4IDg5ODc0MmE1MjA1Yy4uMTQyNmQyMDk5YmFkIDEwMDY0NAotLS0gYS9hcmNoL3Bv
d2VycGMva2V4ZWMvY3Jhc2guYworKysgYi9hcmNoL3Bvd2VycGMva2V4ZWMvY3Jhc2guYwpAQCAt
NDQwLDcgKzQ0MCw3IEBAIHN0YXRpYyB2b2lkIHVwZGF0ZV9jcmFzaF9lbGZjb3JlaGRyKHN0cnVj
dCBraW1hZ2UgCippbWFnZSwgc3RydWN0IG1lbW9yeV9ub3RpZnkgKgogwqAgwqAgwqAgwqAgcmV0
ID0gZ2V0X2NyYXNoX21lbW9yeV9yYW5nZXMoJmNtZW0pOwogwqAgwqAgwqAgwqAgaWYgKHJldCkg
ewogwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcHJfZXJyKCJGYWlsZWQgdG8gZ2V0IGNyYXNoIG1l
bSByYW5nZVxuIik7Ci3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJldHVybjsKK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgZ290byBvdXQ7CiDCoCDCoCDCoCDCoCB9CgogwqAgwqAgwqAgwqAgLyoKCkFy
ZSB5b3UgcGxhbm5pbmcgdG8gaGFuZGxlIHRoaXMgaW4gdGhpcyBwYXRjaCBzZXJpZXM/IE9yIGRv
IHlvdSB3YW50IG1lIAp0byBzZW5kIGEgc2VwYXJhdGUgZml4IHBhdGNoPwoKCj4KPiAtIFRoZSBv
cmRlcmluZyBpc3N1ZSBvZiBhZGRpbmcgQ01BIHJhbmdlcyB0byAibGludXgsdXNhYmxlLW1lbW9y
eS1yYW5nZSIuCj4KPiAtIEFuIGV4aXN0aW5nIGNvbmN1cnJlbmN5IGlzc3VlLiBBIENvbmN1cnJl
bnQgbWVtb3J5IGhvdHBsdWcgbWF5IG9jY3VyCj4gYmV0d2VlbiByZWFkaW5nIG1lbWJsb2NrIGFu
ZCBhdHRlbXB0aW5nIHRvIGZpbGwgY21lbSBkdXJpbmcga2V4ZWNfbG9hZCgpCj4gZm9yIGFsbW9z
dCBhbGwgZXhpc3RpbmcgYXJjaGl0ZWN0dXJlc++8jEknbSBub3Qgc3VyZSBpZiB0aGlzIGlzIGEK
PiBwcmFjdGljYWwgaXNzdWUgaW4gcmVhbGl0eS4uCj4KPiAgIFJhY2UgQ29uZGl0aW9uIFNjZW5h
cmlvCj4KPiAgICBUaW1lbGluZToKPiAgICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgICBUMToga2V4ZWNfbG9h
ZCgpIHN5c2NhbGwgc3RhcnRzCj4gICAgVDI6IGtleGVjX3RyeWxvY2soKSBhY3F1aXJlcyBrZXhl
Y19sb2NrCj4gICAgVDM6IGNyYXNoX3ByZXBhcmVfaGVhZGVycygpIGlzIGNhbGxlZAo+ICAgIFQ0
OiBhcmNoX2dldF9zeXN0ZW1fbnJfcmFuZ2VzKCkgcXVlcmllcyBtZW1ibG9jayDihpIgZmluZHMg
MTAwIG1lbW9yeSByYW5nZXMKPiAgICBUNTogY21lbSA9IGFsbG9jX2NtZW0oMTAwKSBhbGxvY2F0
ZXMgYnVmZmVyIGZvciAxMDAgcmFuZ2VzCj4gICAgVDY6IFtSQUNFIFdJTkRPV10gQW5vdGhlciBw
cm9jZXNzIHRyaWdnZXJzIG1lbW9yeSBob3RwbHVnCj4gICAgVDc6IGFkZF9tZW1vcnkoKSDihpIg
bG9ja19kZXZpY2VfaG90cGx1ZygpIOKGkiBtZW1ibG9ja19hZGRfbm9kZSgpCj4gICAgVDg6IE5l
dyBtZW1vcnkgcmVnaW9uIGFkZGVkIHRvIG1lbWJsb2NrCj4gICAgVDk6IGFyY2hfY3Jhc2hfcG9w
dWxhdGVfY21lbSgpIGl0ZXJhdGVzOiBub3cgZmluZHMgMTAyIHJhbmdlcwo+ICAgIFQxMDogY21l
bS0+cmFuZ2VzWzEwMF0g4oaSIE9VVCBPRiBCT1VORFMgV1JJVEUhCj4gICAgVDExOiBjbWVtLT5y
YW5nZXNbMTAxXSDihpIgT1VUIE9GIEJPVU5EUyBXUklURSEKPiAgICBUMTI6IEtlcm5lbCBjcmFz
aCBvciBtZW1vcnkgY29ycnVwdGlvbgo+Cj4gICAgV2h5IFRoaXMgSGFwcGVucwo+Cj4gICAgMS4g
RGlmZmVyZW50IGxvY2tzIHVzZWQ6Cj4gICAgICAtIGtleGVjX2xvYWQoKSB1c2VzIGtleGVjX3Ry
eWxvY2sgKGF0b21pY190KQo+ICAgICAgLSBNZW1vcnkgaG90cGx1ZyB1c2VzIGRldmljZV9ob3Rw
bHVnX2xvY2sgKG11dGV4KQo+ICAgIDIuIE5vIHN5bmNocm9uaXphdGlvbiBiZXR3ZWVuIHRoZXNl
IHR3byBvcGVyYXRpb25zCj4gICAgMy4gVGltZS1vZi1jaGVjayB0byB0aW1lLW9mLXVzZSAoVE9D
VE9VKSBpc3N1ZToKPiAgICAgIC0gU3RlcCBUNC1UNTogV2UgcXVlcnkgdGhlIG51bWJlciBvZiBy
YW5nZXMgYW5kIGFsbG9jYXRlIGJ1ZmZlcgo+ICAgICAgLSBTdGVwIFQ2LVQ5OiBNZW1vcnkgaG90
cGx1ZyBhZGRzIG5ldyByYW5nZXMgYmV0d2VlbiBxdWVyeSBhbmQKPiBwb3B1bGF0aW9uCj4KPgo+
Cj4gQW55IGNvbW1lbnRzIG9yIHN1Z2dlc3Rpb25zIG9uIHRoZSBmb2xsb3dpbmcgYXBwcm9hY2g/
Cj4KPgo+IGludCBjcmFzaF9wcmVwYXJlX2hlYWRlcnMoLi4uKQo+ICAgIHsKPiAgICAgICAgdW5z
aWduZWQgaW50IG1heF9ucl9yYW5nZXM7Cj4gICAgICAgIHN0cnVjdCBjcmFzaF9tZW0gKmNtZW07
Cj4gICAgICAgIGludCByZXQ7Cj4KPiAgICAgICAgbG9ja19kZXZpY2VfaG90cGx1ZygpOwo+Cj4g
ICAgICAgIG1heF9ucl9yYW5nZXMgPSBhcmNoX2dldF9zeXN0ZW1fbnJfcmFuZ2VzKCk7Cj4gICAg
ICAgIC8vIC4uLgo+ICAgICAgICByZXQgPSBhcmNoX2NyYXNoX3BvcHVsYXRlX2NtZW0oY21lbSk7
Cj4gICAgICAgIC8vIC4uLgo+Cj4gICAgICAgIHVubG9ja19kZXZpY2VfaG90cGx1ZygpOwo+ICAg
ICAgICByZXR1cm4gcmV0Owo+ICAgIH0KPgo+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
