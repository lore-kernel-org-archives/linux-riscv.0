Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A51EC61DD6
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Aug 2026 04:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fXdaoEyd67yAIM5etzM4mWYNNb+hJRXOuj3fq9TsJvU=; b=bORz6mFGgAD2eG
	E2ZpUksZHNwjzOcIw6mDMA2NYRCAS5n3wshFFv9o020m0hBjBfj5xgoCc97n89L6O7MEQF5JT3G6t
	k8OMTcmYc0+bBauXLR/Z+vq/cjbG3z7jU3nox9ICwwoZQl+Ox02VNjttnqoWOBFZPLmZb004jBzfC
	ruOBgnANanDs6q8qf6+iAUsjKA0F4DX5Qc2wBnrM980hYIm1EAYN2yQy4gbqmQg3LP88YOSqjki0B
	J1x+hdZkuPpTcea6MLhepb9T4Xzgfc7p7zIHftIb5FKKmzcw8eCzdT7Y/6wq3H7Ur8wifMJEhITPb
	qPnhzJMYrJyHP8BJKyIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0B9F-00000006jJX-2Pfg;
	Sat, 29 Aug 2026 04:58:33 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0B9B-00000006jJ6-2bao;
	Sat, 29 Aug 2026 04:58:32 +0000
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67T4eZVp2999898;
	Sat, 29 Aug 2026 04:58:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=MvU1Yg
	ZR++bACy1sJMFzvjbRDgfeehycZdKhfrovGi4=; b=Zj5rn3Cjs02ununzct8Z2a
	GbyZyUgT7tPqEI1srPF5w4Vft8X50TI3aN9rUhwInphRH1ebh3N5sX/NtvvXXGU4
	kykve1Fa1OdKfn4SagLzHb3CLvbohgmvssIljgu/qyWR3Y6oMbnjwGxqlQgrRO23
	F5UQqbXPO9PmmFoB/+w2pN5pjSBzX8oLje2RNMbNS0p/QIF1qSBb+CODux1LweMo
	N/rY0sLgiSla69RWgwVSdQUFpMKiSTAS9JcBPpsRlWmV6AHgG1WriHAFR1G+PcWn
	Y3r/KUoOVohEtAEye91DT8zpyD8zlyyTvbMh6bfe5sA5rf4KqJNUpYAXl/TBzUuQ
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gbnud8g69-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 29 Aug 2026 04:58:21 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 67T4uKsi027085;
	Sat, 29 Aug 2026 04:58:20 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4g7p3qt9nm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 29 Aug 2026 04:58:20 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 67T4wIRd42598784
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 29 Aug 2026 04:58:18 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 455D920043;
	Sat, 29 Aug 2026 04:58:18 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3F69C20040;
	Sat, 29 Aug 2026 04:58:13 +0000 (GMT)
Received: from [9.67.168.106] (unknown [9.67.168.106])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 29 Aug 2026 04:58:12 +0000 (GMT)
Message-ID: <f1c3c554-8500-45ef-953d-b7bcece988c7@linux.ibm.com>
Date: Sat, 29 Aug 2026 10:28:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kexec_file: remove unused arch_kexec_locate_mem_hole hook
To: Mukesh Pilaniya <mpilaniy@redhat.com>, linux-kernel@vger.kernel.org
Cc: Albert Ou <aou@eecs.berkeley.edu>,
        Andrew Morton <akpm@linux-foundation.org>,
        Baoquan He
 <baoquan.he@linux.dev>, Mike Rapoport <rppt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Pasha Tatashin <pasha.tatashin@soleen.com>,
        Paul Walmsley <pjw@kernel.org>, Pratyush Yadav <pratyush@kernel.org>,
        linux-riscv@lists.infradead.org, kexec@lists.infradead.org
References: <20260827144452.508328-1-sourabhjain@linux.ibm.com>
 <d16164ef-7211-4272-bc74-bc38efd8623e@redhat.com>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <d16164ef-7211-4272-bc74-bc38efd8623e@redhat.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: QFEz6_1xCeh_s7XdPVEckiU29dNxYHT7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDAzNiBTYWx0ZWRfX2BX64Y0kbRAQ
 yc4BSUY5FEDucDc/PeW2rD8DJYpfjGFnD9GKQXtS/TI2Jdd3miY6W4iSmHZq8CGFR2bijfbcLoK
 EmVLyVCSTWshiJaVBIEsgCGgphuiOGlnZiDWSu7bO8sUs6Z4yTxvzUVOlvZ37R6Pa8PcHthar/D
 Zzwx/D97IfYtYt/uL9jOJGfbfDO+S/yr7EeeOLH1ZZ7jEdNvnmyjWVsaL+52Yiu88j3MnSGQGjJ
 0vWd6Cn/WbHJfcgOnwk8S2Q1xxixWF57aUYk1hOoJI8HUp/09XgFyWW85ANYojvGxkSZrRRPQT+
 Xq23mkOB86FfTLtOejS8pB3Vhbjv+Muuu8EP06/0kJksmcAR323qDWnVMV6+GmzLme+AKVNbQex
 Rh+3CcnZRGsIh1babi8dJLFXC4H7Dx9SF2uSvnTsdkiIGntsPq+Zj8IMMXwxgdTyOjy6PWT1MrM
 tWeY19Kd223stIRnN8Q==
X-Proofpoint-ORIG-GUID: QFEz6_1xCeh_s7XdPVEckiU29dNxYHT7
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDAzNiBTYWx0ZWRfXxQd/LPuLAi1s
 gY/kvfTHIyKx6iKe6VDrVjCSOgeiiCJePziKcWU0pLAeh38sLfjmXdIJL4DzSo6jc/V/ykxYLFL
 KUiItu7b3WEx964RM5BBbZkG8lPoN6g=
X-Authority-Analysis: v=2.4 cv=B92JFutM c=1 sm=1 tr=0 ts=6a9266ed cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=V8glGbnc2Ofi9Qvn3v5h:22 a=20KFwNOVAAAA:8
 a=Z4Rwk6OoAAAA:8 a=VwQbUJbxAAAA:8 a=_O3DOGVWAAAA:8 a=7ipKWUHlAAAA:8
 a=JfrnYn6hAAAA:8 a=VnNF1IyMAAAA:8 a=QOtqApWeW9QkeAJZ1uEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=HkZW87K1Qel5hWWM3VKY:22 a=2TKV-7w1aU1AVAwN0oqT:22
 a=gpc5p9EgBqZVLdJeV_V1:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1011 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608290036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_215829_808429_379B9DC1 
X-CRM114-Status: GOOD (  25.64  )
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

SGVsbG8gTXVrZXNoLAoKT24gMjgvMDgvMjYgMTg6NTAsIE11a2VzaCBQaWxhbml5YSB3cm90ZToK
PiBIaSBTb3VyYWJoLAo+Cj4gVGhlIHBhdGNoIHRvdWNoZXMgdGhyZWUgZmlsZXMgYWNyb3NzIHRo
cmVlIHN1YnN5c3RlbXMgc28ga2V4ZWM6IHdvdWxkIGJlCj4gYSBtb3JlIGFjY3VyYXRlIHByZWZp
eCB0aGFuIGtleGVjX2ZpbGUsIGZvciBlLmcuOgo+Cj4ga2V4ZWM6IHJlbW92ZSB1bnVzZWQgYXJj
aF9rZXhlY19sb2NhdGVfbWVtX2hvbGUgaG9vawoKQXMgSSB1bmRlcnN0YW5kIGl0LCB0aGUga2V4
ZWM6IHByZWZpeCBpcyBnZW5lcmFsbHkgdXNlZCB3aGVuIHRoZSBjaGFuZ2VzIAphcHBseSB0byBi
b3RoCnRoZSBrZXhlY19sb2FkIGFuZCBrZXhlY19maWxlX2xvYWQgc3lzY2FsbHMuCgpTaW5jZSB0
aGVzZSBjaGFuZ2VzIGFyZSBzcGVjaWZpYyB0byBrZXhlY19maWxlX2xvYWQsIEkgdXNlZCB0aGUg
CmtleGVjX2ZpbGU6IHByZWZpeCBmb3IgdGhlIHBhdGNoIHRpdGxlLgoKVGhhdCBzYWlkLCBJ4oCZ
bSBoYXBweSB0byBmb2xsb3cgdGhlIGNvbnZlbnRpb24gaWYgeW91IGFuZCBvdGhlcnMgZmVlbCB0
aGUgCnBhdGNoIHNob3VsZCB1c2UgdGhlCmtleGVjOiBwcmVmaXguIE90aGVyd2lzZSwgSSB3b3Vs
ZCBwcmVmZXIgdG8ga2VlcCB0aGUga2V4ZWNfZmlsZTogcHJlZml4LgoKCj4KPiBPbiAyNy8wOC8y
NiA4OjE0IHBtLCBTb3VyYWJoIEphaW4gd3JvdGU6Cj4+IE5vIGFyY2hpdGVjdHVyZSBwcm92aWRl
cyBhbiBpbXBsZW1lbnRhdGlvbiBvZgo+PiBhcmNoX2tleGVjX2xvY2F0ZV9tZW1faG9sZSgpLiBV
c2Uga2V4ZWNfbG9jYXRlX21lbV9ob2xlKCkgZGlyZWN0bHkKPj4gYW5kIHJlbW92ZSB0aGUgdW51
c2VkIGZhbGxiYWNrIHdyYXBwZXIgZnJvbSB0aGUga2V4ZWMgaGVhZGVyLgo+Pgo+PiBUaGlzIHNp
bXBsaWZpZXMgdGhlIGtleGVjIG1lbW9yeSBhbGxvY2F0aW9uIHBhdGggd2l0aG91dCBjaGFuZ2lu
Zwo+PiBpdHMgYmVoYXZpb3IuCj4+Cj4gQWxzbywgaXQgbWlnaHQgYmUgd29ydGggbWVudGlvbmlu
ZyBpbiB0aGUgY29tbWl0IG1lc3NhZ2UgdGhhdCB0aGlzIGhvb2sKPiB3YXMgb3JpZ2luYWxseSBp
bnRyb2R1Y2VkIGJ5IGNvbW1pdCBmODkxZjE5NzM2YmQgYW5kIHRoYXQgdGhlIGxhc3QgYXJjaAo+
IG92ZXJyaWRlIHdhcyByZW1vdmVkIGluIGNvbW1pdCA2ZTUyNTBlYWE2NjU7IG1ha2luZyBpdCBz
YWZlIHRvIHJlbW92ZSBub3cuCgpTdXJlLCBJIGRvbuKAmXQgbWluZCBpbmNsdWRpbmcgdGhpcyBp
biB2Mi4KCgo+Cj4gT3RoZXJ3aXNlLCB0aGUgY2hhbmdlIGxvb2tzIGdvb2QgdG8gbWUuIEZlZWwg
ZnJlZSB0byBhZGQ6Cj4gUmV2aWV3ZWQtYnk6IE11a2VzaCBQaWxhbml5YSA8bXBpbGFuaXlAcmVk
aGF0LmNvbT4KClRoYW5rcyBmb3IgdGhlIHJldmlldy4KCi0gU291cmFiaCBKYWluCgo+Cj4+IENj
OiBBbGJlcnQgT3UgPGFvdUBlZWNzLmJlcmtlbGV5LmVkdT4KPj4gQ2M6IEFuZHJldyBNb3J0b24g
PGFrcG1AbGludXgtZm91bmRhdGlvbi5vcmc+Cj4+IENjOiBCYW9xdWFuIEhlIDxiYW9xdWFuLmhl
QGxpbnV4LmRldj4KPj4gQ2M6IE1pa2UgUmFwb3BvcnQgPHJwcHRAa2VybmVsLm9yZz4KPj4gQ2M6
IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAZGFiYmVsdC5jb20+Cj4+IENjOiBQYXNoYSBUYXRhc2hp
biA8cGFzaGEudGF0YXNoaW5Ac29sZWVuLmNvbT4KPj4gQ2M6IFBhdWwgV2FsbXNsZXkgPHBqd0Br
ZXJuZWwub3JnPgo+PiBDYzogUHJhdHl1c2ggWWFkYXYgPHByYXR5dXNoQGtlcm5lbC5vcmc+Cj4+
IENjOiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4+IENjOiBrZXhlY0BsaXN0cy5p
bmZyYWRlYWQub3JnCj4+IFNpZ25lZC1vZmYtYnk6IFNvdXJhYmggSmFpbiA8c291cmFiaGphaW5A
bGludXguaWJtLmNvbT4KPj4gLS0tCj4+ICAgYXJjaC9yaXNjdi9rZXJuZWwva2V4ZWNfZWxmLmMg
fCAgMiArLQo+PiAgIGluY2x1ZGUvbGludXgva2V4ZWMuaCAgICAgICAgIHwgMTUgLS0tLS0tLS0t
LS0tLS0tCj4+ICAga2VybmVsL2tleGVjX2ZpbGUuYyAgICAgICAgICAgfCAgMiArLQo+PiAgIDMg
ZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxNyBkZWxldGlvbnMoLSkKPj4KPj4gZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2tleGVjX2VsZi5jIGIvYXJjaC9yaXNjdi9rZXJu
ZWwva2V4ZWNfZWxmLmMKPj4gaW5kZXggM2U5YTMyYWNiOGYyLi5jYTVhYmJhZDU5ZTUgMTAwNjQ0
Cj4+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2tleGVjX2VsZi5jCj4+ICsrKyBiL2FyY2gvcmlz
Y3Yva2VybmVsL2tleGVjX2VsZi5jCj4+IEBAIC05MSw3ICs5MSw3IEBAIHN0YXRpYyBpbnQgZWxm
X2ZpbmRfcGJhc2Uoc3RydWN0IGtpbWFnZSAqaW1hZ2UsIHVuc2lnbmVkIGxvbmcga2VybmVsX2xl
biwKPj4gICAJa2J1Zi5tZW1zeiA9IEFMSUdOKGtlcm5lbF9sZW4sIFBBR0VfU0laRSk7Cj4+ICAg
CWtidWYuY21hID0gTlVMTDsKPj4gICAJa2J1Zi50b3BfZG93biA9IGZhbHNlOwo+PiAtCXJldCA9
IGFyY2hfa2V4ZWNfbG9jYXRlX21lbV9ob2xlKCZrYnVmKTsKPj4gKwlyZXQgPSBrZXhlY19sb2Nh
dGVfbWVtX2hvbGUoJmtidWYpOwo+PiAgIAlpZiAoIXJldCkgewo+PiAgIAkJKm9sZF9wYmFzZSA9
IGxvd2VzdF9wYWRkcjsKPj4gICAJCSpuZXdfcGJhc2UgPSBrYnVmLm1lbTsKPj4gZGlmZiAtLWdp
dCBhL2luY2x1ZGUvbGludXgva2V4ZWMuaCBiL2luY2x1ZGUvbGludXgva2V4ZWMuaAo+PiBpbmRl
eCAwYWY4YWU0ZmRkMDguLmU1ZjFjZmMxMWZlZiAxMDA2NDQKPj4gLS0tIGEvaW5jbHVkZS9saW51
eC9rZXhlYy5oCj4+ICsrKyBiL2luY2x1ZGUvbGludXgva2V4ZWMuaAo+PiBAQCAtMjU5LDIxICsy
NTksNiBAQCBpbnQga2V4ZWNfa2VybmVsX3ZlcmlmeV9wZV9zaWcoY29uc3QgY2hhciAqa2VybmVs
LCB1bnNpZ25lZCBsb25nIGtlcm5lbF9sZW4pOwo+PiAgIGV4dGVybiBpbnQga2V4ZWNfYWRkX2J1
ZmZlcihzdHJ1Y3Qga2V4ZWNfYnVmICprYnVmKTsKPj4gICBpbnQga2V4ZWNfbG9jYXRlX21lbV9o
b2xlKHN0cnVjdCBrZXhlY19idWYgKmtidWYpOwo+PiAgIAo+PiAtI2lmbmRlZiBhcmNoX2tleGVj
X2xvY2F0ZV9tZW1faG9sZQo+PiAtLyoqCj4+IC0gKiBhcmNoX2tleGVjX2xvY2F0ZV9tZW1faG9s
ZSAtIEZpbmQgZnJlZSBtZW1vcnkgdG8gcGxhY2UgdGhlIHNlZ21lbnRzLgo+PiAtICogQGtidWY6
ICAgICAgICAgICAgICAgICAgICAgICBQYXJhbWV0ZXJzIGZvciB0aGUgbWVtb3J5IHNlYXJjaC4K
Pj4gLSAqCj4+IC0gKiBPbiBzdWNjZXNzLCBrYnVmLT5tZW0gd2lsbCBoYXZlIHRoZSBzdGFydCBh
ZGRyZXNzIG9mIHRoZSBtZW1vcnkgcmVnaW9uIGZvdW5kLgo+PiAtICoKPj4gLSAqIFJldHVybjog
MCBvbiBzdWNjZXNzLCBuZWdhdGl2ZSBlcnJubyBvbiBlcnJvci4KPj4gLSAqLwo+PiAtc3RhdGlj
IGlubGluZSBpbnQgYXJjaF9rZXhlY19sb2NhdGVfbWVtX2hvbGUoc3RydWN0IGtleGVjX2J1ZiAq
a2J1ZikKPj4gLXsKPj4gLQlyZXR1cm4ga2V4ZWNfbG9jYXRlX21lbV9ob2xlKGtidWYpOwo+PiAt
fQo+PiAtI2VuZGlmCj4+IC0KPj4gICAjaWZuZGVmIGFyY2hfa2V4ZWNfYXBwbHlfcmVsb2NhdGlv
bnNfYWRkCj4+ICAgLyoKPj4gICAgKiBhcmNoX2tleGVjX2FwcGx5X3JlbG9jYXRpb25zX2FkZCAt
IGFwcGx5IHJlbG9jYXRpb25zIG9mIHR5cGUgUkVMQQo+PiBkaWZmIC0tZ2l0IGEva2VybmVsL2tl
eGVjX2ZpbGUuYyBiL2tlcm5lbC9rZXhlY19maWxlLmMKPj4gaW5kZXggNTlmYjlkNzFlOWQ4Li45
YTk4MTM1OWFkZGQgMTAwNjQ0Cj4+IC0tLSBhL2tlcm5lbC9rZXhlY19maWxlLmMKPj4gKysrIGIv
a2VybmVsL2tleGVjX2ZpbGUuYwo+PiBAQCAtNzg0LDcgKzc4NCw3IEBAIGludCBrZXhlY19hZGRf
YnVmZmVyKHN0cnVjdCBrZXhlY19idWYgKmtidWYpCj4+ICAgCWtidWYtPmNtYSA9IE5VTEw7Cj4+
ICAgCj4+ICAgCS8qIFdhbGsgdGhlIFJBTSByYW5nZXMgYW5kIGFsbG9jYXRlIGEgc3VpdGFibGUg
cmFuZ2UgZm9yIHRoZSBidWZmZXIgKi8KPj4gLQlyZXQgPSBhcmNoX2tleGVjX2xvY2F0ZV9tZW1f
aG9sZShrYnVmKTsKPj4gKwlyZXQgPSBrZXhlY19sb2NhdGVfbWVtX2hvbGUoa2J1Zik7Cj4+ICAg
CWlmIChyZXQpCj4+ICAgCQlyZXR1cm4gcmV0Owo+PiAgIAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
