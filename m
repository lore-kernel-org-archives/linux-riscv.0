Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3D1BFEFB56
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Feb 2026 14:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VXkMDQ+NmSjNOYHWeo7HySlPpgbKnfi3ZpcDUcTRnBY=; b=Bc9uSWBvhPr/ZzoFy7+99tCIcb
	0Xt2WA1nImQKOTCc1ATb48BKolDX2Eiqupe99M579vDN0GkXhC3z3j6WzHJzjsDjn/qmXzHERdlke
	PHwFB3cpwBEHmUs+JVaRIEMeJDe3vXbiV7HrOGP0H54J05AJ//ZDV+vUUB87ZlV5SM2EQPMMOmwmD
	FKBARYuQUh6J9BGYYSkeJUgHxxN1efPGGmNNlUMOF9MAhCPxAetkDN94Dn5HGrJUAhMMlg7oLPX6h
	+M7LvjLhl++W3rloM1yuTxQr63r+g8YfnnfhMloeWWqMMn52weLyebiEWsBnl7Qr3XGi4dS61RL+R
	ZGETHZzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzBr-00000008WI2-0jjL;
	Fri, 27 Feb 2026 14:51:39 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzBn-00000008WHE-1uqV;
	Fri, 27 Feb 2026 14:51:36 +0000
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61RDxhAZ1234657;
	Fri, 27 Feb 2026 14:51:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=jtWeGY
	tlIhoBNrUU/Rn3atorlcVCPhoOvUEbiO3QIXw=; b=ByR2b/L5/X53xebYC874SN
	HUg5T4h+cAVrJ6EU3KJMhkisdx64KFdBPRf4Ngk4eCfYjBXIU3lARM5+RnKDCkF/
	xS88gjyrnPJuuAUezDY0ksb8yQtnJA0q4B6chYE3eE9Nymj0w3Y3CV2rpGVOQoJF
	uA3euifftQjmzNNQd4QBHDwFegtEEeQW/UBG0UClfaK4ALFEgkECCz9OOXqrJR3v
	1pb/SLKT+VEXkjtEh/Q4dR7zFSO+eS0ELvx7MzYTivFyg319JhcS2A/vvEe68LbF
	VEiQX2tjyf5yvQEJl5liX/pP+LF1mnLNtudgLXLWCDkbYNEy/kt6r+ZZ6TtGOzMw
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cf4crd6nn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Feb 2026 14:50:59 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61REM4lC001653;
	Fri, 27 Feb 2026 14:50:57 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4cfr1njpn4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Feb 2026 14:50:57 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61REorr350004244
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Feb 2026 14:50:53 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 988E92004B;
	Fri, 27 Feb 2026 14:50:53 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2724020043;
	Fri, 27 Feb 2026 14:50:36 +0000 (GMT)
Received: from [9.124.211.61] (unknown [9.124.211.61])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 27 Feb 2026 14:50:35 +0000 (GMT)
Message-ID: <3576865b-65bd-4289-babc-975a543eb775@linux.ibm.com>
Date: Fri, 27 Feb 2026 20:20:34 +0530
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
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <20260226130437.1867658-4-ruanjinjie@huawei.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: 8g6pYP6-zbkoGqYlCGxh4H1YVcGADYjR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDEzMCBTYWx0ZWRfX30qX6zxbkgBu
 HpVyQ0dsZ1e/hMjf+YXrY/Y7l96+F6Gq/L7EP3s7O+PsvAQrNEOfynr0kGzxpzEyR+LT4GZoDno
 LodhkSjypbg71KtoOKEnOWF8jH31sHW6uu6bhcydiALmeqzWL81zeSzk1IGU/eJZ4a65VsTjivX
 8euHfVyd4ayhP2VXikByN9kDAe8bSJPSLecJ6zyxOpr7D2rY029FW+OGtOcFyLfk3L3Xs+jCFor
 bsaadJIIP7URf3sbJRtO69rQDj8WHIm7iA6maQ8C1SQuRVSNGAiBlWoLDncv301jGSftzY18Dsy
 nNUn7bBREX85qibTDI3thHoqZbz64JGb9R2FihBUK06S08oIQC+4veA0SrZ/YzcwaP8qNbBHl9D
 I/ao1ILtxtGkG9oHacZ7POqXB2GPtYWb+lm4FZqKRCBnKXIeUunEcpOaN+Ip55VwRiEfDlXToUk
 96zssSDnSpwHJRDYYlg==
X-Proofpoint-GUID: IvuRiAQp0mvX7PMUGo7_TumVon-lPwvd
X-Authority-Analysis: v=2.4 cv=bbBmkePB c=1 sm=1 tr=0 ts=69a1af53 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=i0EeH86SAAAA:8 a=WpLmoQzK6mnfzqVyAaEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_02,2026-02-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602270130
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_065135_519606_A96CDE2B 
X-CRM114-Status: GOOD (  26.12  )
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

UmVzZW5kIG9mOiAKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzE5Y2YxOGI1LTM2MmQtNGZm
Mi04Yjg1LWUyZTcyODA5MjUwY0BsaW51eC5pYm0uY29tLwoKT24gMjYvMDIvMjYgMTg6MzQsIEpp
bmppZSBSdWFuIHdyb3RlOgo+IFRoZSBjcmFzaCBtZW1vcnkgZXhjbHVkZSBvZiBjcmFzaGtfcmVz
IGFuZCBjcmFzaGtfY21hIG1lbW9yeSBvbiBwb3dlcnBjCj4gYXJlIGFsbW9zdCBpZGVudGljYWwg
dG8gdGhlIGdlbmVyaWMgY3Jhc2hfZXhjbHVkZV9jb3JlX3JhbmdlcygpLgo+Cj4gQnkgaW50cm9k
dWNpbmcgdGhlIGFyY2hpdGVjdHVyZS1zcGVjaWZpYyBhcmNoX2NyYXNoX2V4Y2x1ZGVfbWVtX3Jh
bmdlKCkKPiBmdW5jdGlvbiB3aXRoIGEgZGVmYXVsdCBpbXBsZW1lbnRhdGlvbiBvZiBjcmFzaF9l
eGNsdWRlX21lbV9yYW5nZSgpLAo+IGFuZCB1c2luZyBjcmFzaF9leGNsdWRlX21lbV9yYW5nZV9n
dWFyZGVkIGFzIHBvd2VycGMncyBzZXBhcmF0ZQo+IGltcGxlbWVudGF0aW9uLCB0aGUgZ2VuZXJp
YyBjcmFzaF9leGNsdWRlX2NvcmVfcmFuZ2VzKCkgaGVscGVyIGZ1bmN0aW9uCj4gY2FuIGJlIHJl
dXNlZC4KPgo+IEFja2VkLWJ5OiBNaWtlIFJhcG9wb3J0IChNaWNyb3NvZnQpIDxycHB0QGtlcm5l
bC5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogSmluamllIFJ1YW4gPHJ1YW5qaW5qaWVAaHVhd2VpLmNv
bT4KPiAtLS0KPiAgIGFyY2gvcG93ZXJwYy9rZXhlYy9yYW5nZXMuYyB8IDE2ICsrKystLS0tLS0t
LS0tLS0KPiAgIGluY2x1ZGUvbGludXgvY3Jhc2hfY29yZS5oICB8ICA0ICsrKysKPiAgIGtlcm5l
bC9jcmFzaF9jb3JlLmMgICAgICAgICB8IDE5ICsrKysrKysrKysrKystLS0tLS0KPiAgIDMgZmls
ZXMgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgMTggZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0t
Z2l0IGEvYXJjaC9wb3dlcnBjL2tleGVjL3Jhbmdlcy5jIGIvYXJjaC9wb3dlcnBjL2tleGVjL3Jh
bmdlcy5jCj4gaW5kZXggNmM1OGJjYzNlMTMwLi5lNWZlYTIzYjE5MWIgMTAwNjQ0Cj4gLS0tIGEv
YXJjaC9wb3dlcnBjL2tleGVjL3Jhbmdlcy5jCj4gKysrIGIvYXJjaC9wb3dlcnBjL2tleGVjL3Jh
bmdlcy5jCj4gQEAgLTU1Myw5ICs1NTMsOSBAQCBpbnQgZ2V0X3VzYWJsZV9tZW1vcnlfcmFuZ2Vz
KHN0cnVjdCBjcmFzaF9tZW0gKiptZW1fcmFuZ2VzKQo+ICAgI2VuZGlmIC8qIENPTkZJR19LRVhF
Q19GSUxFICovCj4gICAKPiAgICNpZmRlZiBDT05GSUdfQ1JBU0hfRFVNUAo+IC1pbnQgY3Jhc2hf
ZXhjbHVkZV9tZW1fcmFuZ2VfZ3VhcmRlZChzdHJ1Y3QgY3Jhc2hfbWVtICoqbWVtX3JhbmdlcywK
PiAtCQkJCQkgICB1bnNpZ25lZCBsb25nIGxvbmcgbXN0YXJ0LAo+IC0JCQkJCSAgIHVuc2lnbmVk
IGxvbmcgbG9uZyBtZW5kKQo+ICtpbnQgYXJjaF9jcmFzaF9leGNsdWRlX21lbV9yYW5nZShzdHJ1
Y3QgY3Jhc2hfbWVtICoqbWVtX3JhbmdlcywKPiArCQkJCSB1bnNpZ25lZCBsb25nIGxvbmcgbXN0
YXJ0LAo+ICsJCQkJIHVuc2lnbmVkIGxvbmcgbG9uZyBtZW5kKQoKCnVwZGF0ZV9jcmFzaF9lbGZj
b3JlaGRyKCkgaW4gYXJjaC9wb3dlcnBjL2tleGVjL2NyYXNoLmMgc3RpbGwgY2FsbHMKY3Jhc2hf
ZXhjbHVkZV9tZW1fcmFuZ2VfZ3VhcmRlZCgpLCBjYXVzaW5nIGEgYnVpbGQgZmFpbHVyZS4KCmxk
OiBhcmNoL3Bvd2VycGMva2V4ZWMvY3Jhc2gubzogaW4gZnVuY3Rpb24gYHVwZGF0ZV9jcmFzaF9l
bGZjb3JlaGRyJzoKL3Jvb3QvbGludXgvYXJjaC9wb3dlcnBjL2tleGVjL2NyYXNoLmM6NDU0OiB1
bmRlZmluZWQgcmVmZXJlbmNlIHRvIApgY3Jhc2hfZXhjbHVkZV9tZW1fcmFuZ2VfZ3VhcmRlZCcK
CgpUbyBmaXggdGhpczoKLS0tLS0tLS0tLS0tLS0KZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9r
ZXhlYy9jcmFzaC5jIGIvYXJjaC9wb3dlcnBjL2tleGVjL2NyYXNoLmMKaW5kZXggODk4NzQyYTUy
MDVjLi5lNTllOTA5YzM2OWQgMTAwNjQ0Ci0tLSBhL2FyY2gvcG93ZXJwYy9rZXhlYy9jcmFzaC5j
CisrKyBiL2FyY2gvcG93ZXJwYy9rZXhlYy9jcmFzaC5jCkBAIC00NTEsNyArNDUxLDcgQEAgc3Rh
dGljIHZvaWQgdXBkYXRlX2NyYXNoX2VsZmNvcmVoZHIoc3RydWN0IGtpbWFnZSAKKmltYWdlLCBz
dHJ1Y3QgbWVtb3J5X25vdGlmeSAqCiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBiYXNlX2FkZHIg
PSBQRk5fUEhZUyhtbi0+c3RhcnRfcGZuKTsKIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHNpemUg
PSBtbi0+bnJfcGFnZXMgKiBQQUdFX1NJWkU7CiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBlbmQg
PSBiYXNlX2FkZHIgKyBzaXplIC0gMTsKLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmV0ID0gY3Jh
c2hfZXhjbHVkZV9tZW1fcmFuZ2VfZ3VhcmRlZCgmY21lbSwgYmFzZV9hZGRyLCAKZW5kKTsKK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIHJldCA9IGFyY2hfY3Jhc2hfZXhjbHVkZV9tZW1fcmFuZ2UoJmNt
ZW0sIGJhc2VfYWRkciwgZW5kKTsKIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGlmIChyZXQpIHsK
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHByX2VycigiRmFpbGVkIHRvIHJl
bW92ZSBob3QtdW5wbHVnZ2VkIG1lbW9yeSAKZnJvbSBjcmFzaCBtZW1vcnkgcmFuZ2VzXG4iKTsK
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGdvdG8gb3V0OwoKV2l0aCB0aGUg
YWJvdmUgY2hhbmdlIGluY2x1ZGVkLCB0aGluZ3MgYXJlIHdvcmtpbmcgZmluZSBvbiBwb3dlcnBj
LgoKCj4gICB7Cj4gICAJc3RydWN0IGNyYXNoX21lbSAqdG1lbSA9ICptZW1fcmFuZ2VzOwo+ICAg
Cj4gQEAgLTYwNCwxOCArNjA0LDEwIEBAIGludCBnZXRfY3Jhc2hfbWVtb3J5X3JhbmdlcyhzdHJ1
Y3QgY3Jhc2hfbWVtICoqbWVtX3JhbmdlcykKPiAgIAkJCXNvcnRfbWVtb3J5X3JhbmdlcygqbWVt
X3JhbmdlcywgdHJ1ZSk7Cj4gICAJfQo+ICAgCj4gLQkvKiBFeGNsdWRlIGNyYXNoa2VybmVsIHJl
Z2lvbiAqLwo+IC0JcmV0ID0gY3Jhc2hfZXhjbHVkZV9tZW1fcmFuZ2VfZ3VhcmRlZChtZW1fcmFu
Z2VzLCBjcmFzaGtfcmVzLnN0YXJ0LCBjcmFzaGtfcmVzLmVuZCk7Cj4gKwlyZXQgPSBjcmFzaF9l
eGNsdWRlX2NvcmVfcmFuZ2VzKG1lbV9yYW5nZXMpOwo+ICAgCWlmIChyZXQpCj4gICAJCWdvdG8g
b3V0Owo+ICAgCj4gLQlmb3IgKGkgPSAwOyBpIDwgY3Jhc2hrX2NtYV9jbnQ7ICsraSkgewo+IC0J
CXJldCA9IGNyYXNoX2V4Y2x1ZGVfbWVtX3JhbmdlX2d1YXJkZWQobWVtX3JhbmdlcywgY3Jhc2hr
X2NtYV9yYW5nZXNbaV0uc3RhcnQsCj4gLQkJCQkJICAgICAgY3Jhc2hrX2NtYV9yYW5nZXNbaV0u
ZW5kKTsKPiAtCQlpZiAocmV0KQo+IC0JCQlnb3RvIG91dDsKPiAtCX0KPiAtCj4gICAJLyoKPiAg
IAkgKiBGSVhNRTogRm9yIG5vdywgc3RheSBpbiBwYXJpdHkgd2l0aCBrZXhlYy10b29scyBidXQg
aWYgUlRBUy9PUEFMCj4gICAJICogICAgICAgIHJlZ2lvbnMgYXJlIGV4cG9ydGVkIHRvIHNhdmUg
dGhlaXIgY29udGV4dCBhdCB0aGUgdGltZSBvZgo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4
L2NyYXNoX2NvcmUuaCBiL2luY2x1ZGUvbGludXgvY3Jhc2hfY29yZS5oCj4gaW5kZXggMDMzYjIw
MjA0YWNhLi5kYmVjODI2ZGM1M2IgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9jcmFzaF9j
b3JlLmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L2NyYXNoX2NvcmUuaAo+IEBAIC02OCw2ICs2OCw3
IEBAIGV4dGVybiBpbnQgY3Jhc2hfcHJlcGFyZV9lbGY2NF9oZWFkZXJzKHN0cnVjdCBjcmFzaF9t
ZW0gKm1lbSwgaW50IG5lZWRfa2VybmVsX21hCj4gICAJCQkJICAgICAgIHZvaWQgKiphZGRyLCB1
bnNpZ25lZCBsb25nICpzeik7Cj4gICBleHRlcm4gaW50IGNyYXNoX3ByZXBhcmVfaGVhZGVycyhp
bnQgbmVlZF9rZXJuZWxfbWFwLCB2b2lkICoqYWRkciwKPiAgIAkJCQkgdW5zaWduZWQgbG9uZyAq
c3osIHVuc2lnbmVkIGxvbmcgKm5yX21lbV9yYW5nZXMpOwo+ICtleHRlcm4gaW50IGNyYXNoX2V4
Y2x1ZGVfY29yZV9yYW5nZXMoc3RydWN0IGNyYXNoX21lbSAqKmNtZW0pOwo+ICAgCj4gICBzdHJ1
Y3Qga2ltYWdlOwo+ICAgc3RydWN0IGtleGVjX3NlZ21lbnQ7Cj4gQEAgLTg4LDYgKzg5LDkgQEAg
ZXh0ZXJuIGludCBraW1hZ2VfY3Jhc2hfY29weV92bWNvcmVpbmZvKHN0cnVjdCBraW1hZ2UgKmlt
YWdlKTsKPiAgIGV4dGVybiB1bnNpZ25lZCBpbnQgYXJjaF9nZXRfc3lzdGVtX25yX3Jhbmdlcyh2
b2lkKTsKPiAgIGV4dGVybiBpbnQgYXJjaF9jcmFzaF9wb3B1bGF0ZV9jbWVtKHN0cnVjdCBjcmFz
aF9tZW0gKmNtZW0pOwo+ICAgZXh0ZXJuIGludCBhcmNoX2NyYXNoX2V4Y2x1ZGVfcmFuZ2VzKHN0
cnVjdCBjcmFzaF9tZW0gKmNtZW0pOwo+ICtleHRlcm4gaW50IGFyY2hfY3Jhc2hfZXhjbHVkZV9t
ZW1fcmFuZ2Uoc3RydWN0IGNyYXNoX21lbSAqKm1lbSwKPiArCQkJCQl1bnNpZ25lZCBsb25nIGxv
bmcgbXN0YXJ0LAo+ICsJCQkJCXVuc2lnbmVkIGxvbmcgbG9uZyBtZW5kKTsKPiAgIAo+ICAgI2Vs
c2UgLyogIUNPTkZJR19DUkFTSF9EVU1QKi8KPiAgIHN0cnVjdCBwdF9yZWdzOwo+IGRpZmYgLS1n
aXQgYS9rZXJuZWwvY3Jhc2hfY29yZS5jIGIva2VybmVsL2NyYXNoX2NvcmUuYwo+IGluZGV4IDk2
YTk2ZTUxMWY1YS4uMzAwZDQ0YWQ1NDcxIDEwMDY0NAo+IC0tLSBhL2tlcm5lbC9jcmFzaF9jb3Jl
LmMKPiArKysgYi9rZXJuZWwvY3Jhc2hfY29yZS5jCj4gQEAgLTI4NywyNCArMjg3LDMxIEBAIHVu
c2lnbmVkIGludCBfX3dlYWsgYXJjaF9nZXRfc3lzdGVtX25yX3Jhbmdlcyh2b2lkKSB7IHJldHVy
biAwOyB9Cj4gICBpbnQgX193ZWFrIGFyY2hfY3Jhc2hfcG9wdWxhdGVfY21lbShzdHJ1Y3QgY3Jh
c2hfbWVtICpjbWVtKSB7IHJldHVybiAtMTsgfQo+ICAgaW50IF9fd2VhayBhcmNoX2NyYXNoX2V4
Y2x1ZGVfcmFuZ2VzKHN0cnVjdCBjcmFzaF9tZW0gKmNtZW0pIHsgcmV0dXJuIDA7IH0KPiAgIAo+
IC1zdGF0aWMgaW50IGNyYXNoX2V4Y2x1ZGVfY29yZV9yYW5nZXMoc3RydWN0IGNyYXNoX21lbSAq
Y21lbSkKPiAraW50IF9fd2VhayBhcmNoX2NyYXNoX2V4Y2x1ZGVfbWVtX3JhbmdlKHN0cnVjdCBj
cmFzaF9tZW0gKiptZW0sCj4gKwkJCQkJdW5zaWduZWQgbG9uZyBsb25nIG1zdGFydCwKPiArCQkJ
CQl1bnNpZ25lZCBsb25nIGxvbmcgbWVuZCkKPiArewo+ICsJcmV0dXJuIGNyYXNoX2V4Y2x1ZGVf
bWVtX3JhbmdlKCptZW0sIG1zdGFydCwgbWVuZCk7Cj4gK30KPiArCj4gK2ludCBjcmFzaF9leGNs
dWRlX2NvcmVfcmFuZ2VzKHN0cnVjdCBjcmFzaF9tZW0gKipjbWVtKQo+ICAgewo+ICAgCWludCBy
ZXQsIGk7Cj4gICAKPiAgIAkvKiBFeGNsdWRlIGNyYXNoa2VybmVsIHJlZ2lvbiAqLwo+IC0JcmV0
ID0gY3Jhc2hfZXhjbHVkZV9tZW1fcmFuZ2UoY21lbSwgY3Jhc2hrX3Jlcy5zdGFydCwgY3Jhc2hr
X3Jlcy5lbmQpOwo+ICsJcmV0ID0gYXJjaF9jcmFzaF9leGNsdWRlX21lbV9yYW5nZShjbWVtLCBj
cmFzaGtfcmVzLnN0YXJ0LCBjcmFzaGtfcmVzLmVuZCk7Cj4gICAJaWYgKHJldCkKPiAgIAkJcmV0
dXJuIHJldDsKPiAgIAo+ICAgCWlmIChjcmFzaGtfbG93X3Jlcy5lbmQpIHsKPiAtCQlyZXQgPSBj
cmFzaF9leGNsdWRlX21lbV9yYW5nZShjbWVtLCBjcmFzaGtfbG93X3Jlcy5zdGFydCwgY3Jhc2hr
X2xvd19yZXMuZW5kKTsKPiArCQlyZXQgPSBhcmNoX2NyYXNoX2V4Y2x1ZGVfbWVtX3JhbmdlKGNt
ZW0sIGNyYXNoa19sb3dfcmVzLnN0YXJ0LCBjcmFzaGtfbG93X3Jlcy5lbmQpOwo+ICAgCQlpZiAo
cmV0KQo+ICAgCQkJcmV0dXJuIHJldDsKPiAgIAl9Cj4gICAKPiAgIAlmb3IgKGkgPSAwOyBpIDwg
Y3Jhc2hrX2NtYV9jbnQ7ICsraSkgewo+IC0JCXJldCA9IGNyYXNoX2V4Y2x1ZGVfbWVtX3Jhbmdl
KGNtZW0sIGNyYXNoa19jbWFfcmFuZ2VzW2ldLnN0YXJ0LAo+IC0JCQkJCSAgICAgIGNyYXNoa19j
bWFfcmFuZ2VzW2ldLmVuZCk7Cj4gKwkJcmV0ID0gYXJjaF9jcmFzaF9leGNsdWRlX21lbV9yYW5n
ZShjbWVtLCBjcmFzaGtfY21hX3Jhbmdlc1tpXS5zdGFydCwKPiArCQkJCQkJICAgY3Jhc2hrX2Nt
YV9yYW5nZXNbaV0uZW5kKTsKPiAgIAkJaWYgKHJldCkKPiAgIAkJCXJldHVybiByZXQ7Cj4gICAJ
fQo+IEBAIC0zMzEsNyArMzM4LDcgQEAgaW50IGNyYXNoX3ByZXBhcmVfaGVhZGVycyhpbnQgbmVl
ZF9rZXJuZWxfbWFwLCB2b2lkICoqYWRkciwgdW5zaWduZWQgbG9uZyAqc3osCj4gICAJaWYgKHJl
dCkKPiAgIAkJZ290byBvdXQ7Cj4gICAKPiAtCXJldCA9IGNyYXNoX2V4Y2x1ZGVfY29yZV9yYW5n
ZXMoY21lbSk7Cj4gKwlyZXQgPSBjcmFzaF9leGNsdWRlX2NvcmVfcmFuZ2VzKCZjbWVtKTsKPiAg
IAlpZiAocmV0KQo+ICAgCQlnb3RvIG91dDsKPiAgIAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
