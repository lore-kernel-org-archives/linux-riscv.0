Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE639EDF042
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Feb 2026 06:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tmUL78LiN+OBksV+4RutlAPLKc0XPVCbpH7kwRWlDAY=; b=w4gmND84qG/V7gEyKncoy9FEwm
	js4/OYadbJMcqnUEvPgABNfscZPlbLN/3Sh7aCVkNCXYbuYcZrPMDUaluifpIt+AKT+CiPWU4yScU
	qxQUG4GzlkiGGMtbwuiZ81X+OFzR8xuh9QLxfgKMdHVpMVtCS4qudfOCimziP2ume1VdTNoTovjFc
	e4cVnhmTKcNCk1n+Phk4wn8A399tCuHO/pJL/yXwZfdCVIbWPRZDOS0PBssnI/7bc9+WV3Qbu2yBo
	eJUBWaYgtXGagQGD58zE+96oVWQiooDgQ3gcyk+j9nDXI65j11Fe4deo2SS6XkQVCEop78zo+7g5P
	4dcPu4Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqPyK-00000001fyK-0EEM;
	Thu, 12 Feb 2026 06:14:40 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqPyG-00000001fxU-3KE1;
	Thu, 12 Feb 2026 06:14:38 +0000
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61BFYKsD369791;
	Thu, 12 Feb 2026 06:11:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=ojMHV+
	TxP6e3FLHmg8fIJfthetl5cVOWSrR8HU/Rc/I=; b=Ey17cf9bfbIHupEH0Z0c42
	ETQ1EmhdoqHoKSr9VFi0UrrqyZJS6bAF0Ir9TUvG4I2MJJMtmzkjctMQjbdkcxws
	E+SUFXx7PkDLaXOQ1yRFQ+7fLoKS3ohJUR2mBqinTC77OsPjA/BlEl+GIE08CQzf
	GCEht20jhHb8NRTGtPBaGMuu1yrIpfjlqp+EfLOZfibFIA+OZ/NUKonPzXKlPZI9
	jtwtCW67v7u9qijheZq0SnfyIwG6aIv9iqOzd0hnzpKrD+G3xTpqneMut937gnyt
	EmfYF/wl62aU6LwgfCrISp3z8VAgHQOnCgBQ80+0+FFjLUdz32zQculJmDG5uS2A
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4c696x24ge-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Feb 2026 06:11:26 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61C4ZFKh019251;
	Thu, 12 Feb 2026 06:11:24 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4c6hxk8y2q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Feb 2026 06:11:24 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61C6BKpV15008004
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Feb 2026 06:11:21 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C3C1D2004D;
	Thu, 12 Feb 2026 06:11:20 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9437220040;
	Thu, 12 Feb 2026 06:11:01 +0000 (GMT)
Received: from [9.39.27.166] (unknown [9.39.27.166])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 12 Feb 2026 06:11:01 +0000 (GMT)
Message-ID: <5b6f4093-3ddd-477d-ade4-fe31429cf3cd@linux.ibm.com>
Date: Thu, 12 Feb 2026 11:41:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] crash: Exclude crash kernel memory in crash core
To: Jinjie Ruan <ruanjinjie@huawei.com>, corbet@lwn.net,
        catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org,
        kernel@xen0n.name, maddy@linux.ibm.com, mpe@ellerman.id.au,
        npiggin@gmail.com, chleroy@kernel.org, pjw@kernel.org,
        palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
        tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, hpa@zytor.com, akpm@linux-foundation.org,
        bhe@redhat.com, vgoyal@redhat.com, dyoung@redhat.com,
        rdunlap@infradead.org, pmladek@suse.com, feng.tang@linux.alibaba.com,
        pawan.kumar.gupta@linux.intel.com, kees@kernel.org, elver@google.com,
        arnd@arndb.de, lirongqing@baidu.com, fvdl@google.com,
        leitao@debian.org, rppt@kernel.org, ardb@kernel.org, jbohac@suse.cz,
        osandov@fb.com, ryan.roberts@arm.com, cfsworks@gmail.com,
        tangyouling@kylinos.cn, ritesh.list@gmail.com, thuth@redhat.com,
        hbathini@linux.ibm.com, eajames@linux.ibm.com, bjorn@rivosinc.com,
        songshuaishuai@tinylab.org, kevin.brodsky@arm.com,
        samuel.holland@sifive.com, vishal.moola@gmail.com,
        junhui.liu@pigmoral.tech, dwmw@amazon.co.uk, pbonzini@redhat.com,
        thomas.lendacky@amd.com, kai.huang@intel.com, ubizjak@gmail.com,
        coxu@redhat.com, liaoyuanhong@vivo.com, fuqiang.wang@easystack.cn,
        brgerst@gmail.com, x86@kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, kexec@lists.infradead.org
References: <20260209095931.2813152-1-ruanjinjie@huawei.com>
 <20260209095931.2813152-2-ruanjinjie@huawei.com>
 <50693f0c-c610-4347-86aa-40d50dc681fc@linux.ibm.com>
 <31c2ae53-cbb7-bfad-9b8f-f9e1a254491e@huawei.com>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <31c2ae53-cbb7-bfad-9b8f-f9e1a254491e@huawei.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=WZYBqkhX c=1 sm=1 tr=0 ts=698d6f0e cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=i0EeH86SAAAA:8 a=B_ciY6P1UxUjS-fdd_UA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: pPQWyo0dBerxEXBQvX-fWAqozUfKAgMU
X-Proofpoint-ORIG-GUID: NJnrqqmFwVChV0NJpqnRbaDGJlc_JaK5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDAzOSBTYWx0ZWRfX3ttwUOBSfW6t
 I/8Hz+DYXVvSSlj/G1NDONhkkFRDOcWcVU8ZWOdCaeQiSqDBoTdIv6+Tc99oUe5HVGftG7lRYeC
 51L9B6eK/zNvaD/TOWeehy7QYHzeOiC8KMMJKPPTR3Xt2B9vcK5BU+o/qLnzLcsSVlo9cZKimqz
 ulVMaPptKVRdY0bjVlTsSHPmhipS7GGPPQoUCKIsYkLSiKIsscPzVZcXkXBlJu93n5DUvZoJgFa
 eO2d6xI6jWJjuPHEG3c3eWKO5rkBYYfOhsQsl9iZouncmrOlkxuxUDiENFvM/CV/MmDZRRhmJfY
 dzsY0+TnQ9Et6vmgImq7ts8pYMkZlJvhVf9ksKIhh6xagoBwd+qGyH+7OQxKgLGqkPIp27VeuSs
 IHivRppL66tOv1wzzSnPdFaTvaoVdda7zpGiTmfzC6304JgPWIwVr5IoU/c2X9EH91PGbdFawpf
 cKNP0JormcRl9vWEjdw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_01,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602120039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_221436_967848_CDA1F668 
X-CRM114-Status: GOOD (  29.69  )
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

CgpPbiAxMi8wMi8yNiAwODo1OCwgSmluamllIFJ1YW4gd3JvdGU6Cj4KPiBPbiAyMDI2LzIvMTAg
MjA6MzAsIFNvdXJhYmggSmFpbiB3cm90ZToKPj4gSGVsbG8gSmluamllLAo+Pgo+PiBPbiAwOS8w
Mi8yNiAxNToyOSwgSmluamllIFJ1YW4gd3JvdGU6Cj4+PiBUaGUgZXhjbHVkZSBvZiBjcmFzaGtf
cmVzLCBjcmFzaGtfbG93X3JlcyBhbmQgY3Jhc2hrX2NtYSBtZW1vcnkKPj4+IGFyZSBhbG1vc3Qg
aWRlbnRpY2FsIGFjcm9zcyBkaWZmZXJlbnQgYXJjaGl0ZWN0dXJlcywgaGFuZGxpbmcgdGhlbQo+
Pj4gaW4gdGhlIGNyYXNoIGNvcmUgd291bGQgZWxpbWluYXRlIGEgbG90IG9mIGR1cGxpY2F0aW9u
LCBzbyBkbwo+Pj4gdGhlbSBpbiB0aGUgY29tbW9uIGNvZGUuCj4+Pgo+Pj4gQW5kIG1vdmUgdGhl
IHNpemUgY2FsY3VsYXRpb24gKGFuZCB0aGUgcmVhbGxvYyBpZiBuZWVkZWQpIGludG8gdGhlCj4+
PiBnZW5lcmljIGNyYXNoIGNvcmUgc28gdGhhdDoKPj4+Cj4+PiAtIE5ldyBDTUEgcmVnaW9ucyBv
ciBmdXR1cmUgY3Jhc2gtbWVtb3J5IHR5cGVzIGNhbiBhdXRvbWF0aWNhbGx5Cj4+PiAgwqDCoCBh
Y2NvdW50ZWQgZm9yIGluIGNyYXNoIGNvcmU7Cj4+Pgo+Pj4gLSBFYWNoIGFyY2hpdGVjdHVyZSBu
byBsb25nZXIgaGFzIHRvIHBsYXkgd2hhY2stYS1tb2xlIHdpdGgKPj4+ICDCoMKgIGl0cyBwcml2
YXRlIGFycmF5IHNpemUuCj4+Pgo+Pj4gVG8gYWNoaWV2ZSB0aGUgYWJvdmUgZ29hbCwgNCBhcmNo
aXRlY3R1cmUtc3BlY2lmaWMgZnVuY3Rpb25zIGFyZQo+Pj4gaW50cm9kdWNlZDoKPj4+Cj4+PiAt
IGFyY2hfZ2V0X3N5c3RlbV9ucl9yYW5nZXMoKSBhbmQgYXJjaF9wcmVwYXJlX2VsZjY0X3JhbV9o
ZWFkZXJzKCkuCj4+PiAgwqDCoCBUaGUgMXN0IGZ1bmN0aW9uIHByZS1jb3VudHMgdGhlIG51bWJl
ciBvZiBtZW1vcnkgcmFuZ2VzLCBhbmQKPj4+ICDCoMKgIHRoZSAyc3QgZnVuY3Rpb24gZmlsbCB0
aGUgbWVtb3J5IHJhbmdlcyBpbnRvIHRoZSBjbWVtLT5yYW5nZXNbXSBhcnJheSwKPj4+ICDCoMKg
IGFuZCBjb3VudCB0aGUgYWN0dWFsIG51bWJlciBvZiByYW5nZXMgZmlsbGVkLiBUaGUgZGVmYXVs
dAo+Pj4gaW1wbGVtZW50YXRpb24KPj4+ICDCoMKgIGlzIGNvbnNpc3RlbnQgd2l0aCBhcm02NCBh
bmQgbG9vbmdzb24uCj4+Pgo+Pj4gLSBhcmNoX2NyYXNoX2V4Y2x1ZGVfbWVtX3JhbmdlKCkuIFJl
YWxsb2MgZm9yIHBvd2VycGMuIFRoZSBkZWZhdWx0Cj4+PiAgwqDCoCBpbXBsZW1lbnRhdGlvbiBp
cyBjcmFzaF9leGNsdWRlX21lbV9yYW5nZSgpLCBhbmQgdXNlCj4+PiAgwqDCoCBjcmFzaF9leGNs
dWRlX21lbV9yYW5nZV9ndWFyZGVkKCkgdG8gaW1wbGVtZW50IHRoZSBhcmNoIHZlcnNpb24KPj4+
ICDCoMKgIGZvciBwb3dlcnBjLgo+Pj4KPj4+IC0gYXJjaF9nZXRfY3Jhc2hfbWVtb3J5X3Jhbmdl
cygpLiBHZXQgY3Jhc2ggbWVtb3J5IHJhbmdlcyBmb3IgYXJjaCBhbmQKPj4+ICDCoMKgIHRoZSBk
ZWZhdWx0IGltcGxlbWVudGF0aW9uIGlzIGdlbmVyaWMgYWNyb3NzIHg4NiwgYXJtNjQsIHJpc2N2
LCBhbmQKPj4+ICDCoMKgIGxvb25nc29uIGJ5IHVzaW5nIHRoZSBmaXJzdCB0d28gYXJjaCBmdW5j
dGlvbnMgYWJvdmUuIHBvd2VycGMgaGFzIGl0cwo+Pj4gIMKgwqAgb3duIGltcGxlbWVudGF0aW9u
IGJ5IGNhbGxpbmcgZ2V0X2NyYXNoX21lbW9yeV9yYW5nZXMoKS4KPj4+Cj4+PiBUZXN0ZWQgb24g
eDg2LCBhcm02NCBhbmQgcmlzY3Ygd2l0aCBRRU1VLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEpp
bmppZSBSdWFuIDxydWFuamluamllQGh1YXdlaS5jb20+Cj4+PiAtLS0KPj4+ICDCoCBhcmNoL2Fy
bTY0L2tlcm5lbC9tYWNoaW5lX2tleGVjX2ZpbGUuY8KgwqDCoMKgIHzCoCA0NyArLS0tLS0tLS0K
Pj4+ICDCoCBhcmNoL2xvb25nYXJjaC9rZXJuZWwvbWFjaGluZV9rZXhlY19maWxlLmMgfMKgIDQ1
ICstLS0tLS0tCj4+PiAgwqAgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2tleGVjLmjCoMKgwqDC
oMKgwqDCoMKgwqDCoCB8wqAgMTMgKysrCj4+PiAgwqAgYXJjaC9wb3dlcnBjL2tleGVjL2NyYXNo
LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgNTIgKysrKysrLS0tLQo+Pj4g
IMKgIGFyY2gvcG93ZXJwYy9rZXhlYy9maWxlX2xvYWRfNjQuY8KgwqDCoMKgwqDCoMKgwqDCoCB8
wqAgMTcgKystCj4+PiAgwqAgYXJjaC9wb3dlcnBjL2tleGVjL3Jhbmdlcy5jwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAxOCArLS0tCj4+PiAgwqAgYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9rZXhlYy5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAxMCArKwo+Pj4gIMKgIGFy
Y2gvcmlzY3Yva2VybmVsL21hY2hpbmVfa2V4ZWNfZmlsZS5jwqDCoMKgwqAgfMKgIDM3ICsrLS0t
LS0KPj4+ICDCoCBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9rZXhlYy5owqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB8wqAgMTAgKysKPj4+ICDCoCBhcmNoL3g4Ni9rZXJuZWwvY3Jhc2guY8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMTA0ICsrLS0tLS0tLS0tLS0tLS0t
LS0KPj4+ICDCoCBpbmNsdWRlL2xpbnV4L2NyYXNoX2NvcmUuaMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHwgMTE0ICsrKysrKysrKysrKysrKysrKystLQo+Pj4gIMKgIGtlcm5lbC9j
cmFzaF9jb3JlLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHzCoCA3MSArKysrKysrKysrKy0tCj4+PiAgwqAgMTIgZmlsZXMgY2hhbmdlZCwgMjY5IGluc2Vy
dGlvbnMoKyksIDI2OSBkZWxldGlvbnMoLSkKPj4+Cj4gWy4uLl0KPgo+Pj4gIMKgIGV4dGVybiB2
b2lkIGNyYXNoX2lwaV9jYWxsYmFjayhzdHJ1Y3QgcHRfcmVncyAqcmVncyk7Cj4+PiBkaWZmIC0t
Z2l0IGEvYXJjaC9wb3dlcnBjL2tleGVjL2NyYXNoLmMgYi9hcmNoL3Bvd2VycGMva2V4ZWMvY3Jh
c2guYwo+Pj4gaW5kZXggYTMyNWMxYzAyZjk2Li41YWRlOWE4NTNmYjAgMTAwNjQ0Cj4+PiAtLS0g
YS9hcmNoL3Bvd2VycGMva2V4ZWMvY3Jhc2guYwo+Pj4gKysrIGIvYXJjaC9wb3dlcnBjL2tleGVj
L2NyYXNoLmMKPj4+IEBAIC00MTksMzAgKzQxOSwyMSBAQCB1bnNpZ25lZCBpbnQgYXJjaF9jcmFz
aF9nZXRfZWxmY29yZWhkcl9zaXplKHZvaWQpCj4+PiAgwqDCoMKgwqDCoCByZXR1cm4gc2l6ZW9m
KHN0cnVjdCBlbGZoZHIpICsgKHBoZHJfY250ICogc2l6ZW9mKEVsZjY0X1BoZHIpKTsKPj4+ICDC
oCB9Cj4+PiAgwqAgLS8qKgo+Pj4gLSAqIHVwZGF0ZV9jcmFzaF9lbGZjb3JlaGRyKCkgLSBSZWNy
ZWF0ZSB0aGUgZWxmY29yZWhkciBhbmQgcmVwbGFjZSBpdAo+Pj4gd2l0aCBvbGQKPj4+IC0gKsKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlbGZjb3JlaGRyIGluIHRoZSBrZXhl
YyBzZWdtZW50IGFycmF5Lgo+Pj4gLSAqIEBpbWFnZTogdGhlIGFjdGl2ZSBzdHJ1Y3Qga2ltYWdl
Cj4+PiAtICogQG1uOiBzdHJ1Y3QgbWVtb3J5X25vdGlmeSBkYXRhIGhhbmRsZXIKPj4+IC0gKi8K
Pj4+IC1zdGF0aWMgdm9pZCB1cGRhdGVfY3Jhc2hfZWxmY29yZWhkcihzdHJ1Y3Qga2ltYWdlICpp
bWFnZSwgc3RydWN0Cj4+PiBtZW1vcnlfbm90aWZ5ICptbikKPj4+ICtpbnQgYXJjaF9nZXRfY3Jh
c2hfbWVtb3J5X3JhbmdlcyhzdHJ1Y3QgY3Jhc2hfbWVtICoqY21lbSwgdW5zaWduZWQKPj4+IGxv
bmcgKm5yX21lbV9yYW5nZXMsCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
c3RydWN0IGtpbWFnZSAqaW1hZ2UsIHN0cnVjdCBtZW1vcnlfbm90aWZ5ICptbikKPj4+ICDCoCB7
Cj4+PiArwqDCoMKgIHVuc2lnbmVkIGxvbmcgYmFzZV9hZGRyLCBzaXplOwo+Pj4gIMKgwqDCoMKg
wqAgaW50IHJldDsKPj4+IC3CoMKgwqAgc3RydWN0IGNyYXNoX21lbSAqY21lbSA9IE5VTEw7Cj4+
PiAtwqDCoMKgIHN0cnVjdCBrZXhlY19zZWdtZW50ICprc2VnbWVudDsKPj4+IC3CoMKgwqAgdm9p
ZCAqcHRyLCAqbWVtLCAqZWxmYnVmID0gTlVMTDsKPj4+IC3CoMKgwqAgdW5zaWduZWQgbG9uZyBl
bGZzeiwgbWVtc3osIGJhc2VfYWRkciwgc2l6ZTsKPj4+ICDCoCAtwqDCoMKgIGtzZWdtZW50ID0g
JmltYWdlLT5zZWdtZW50W2ltYWdlLT5lbGZjb3JlaGRyX2luZGV4XTsKPj4+IC3CoMKgwqAgbWVt
ID0gKHZvaWQgKikga3NlZ21lbnQtPm1lbTsKPj4+IC3CoMKgwqAgbWVtc3ogPSBrc2VnbWVudC0+
bWVtc3o7Cj4+PiAtCj4+PiAtwqDCoMKgIHJldCA9IGdldF9jcmFzaF9tZW1vcnlfcmFuZ2VzKCZj
bWVtKTsKPj4+ICvCoMKgwqAgcmV0ID0gZ2V0X2NyYXNoX21lbW9yeV9yYW5nZXMoY21lbSk7Cj4+
PiAgwqDCoMKgwqDCoCBpZiAocmV0KSB7Cj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgIHByX2Vycigi
RmFpbGVkIHRvIGdldCBjcmFzaCBtZW0gcmFuZ2VcbiIpOwo+Pj4gLcKgwqDCoMKgwqDCoMKgIHJl
dHVybjsKPj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0Owo+Pj4gIMKgwqDCoMKgwqAgfQo+
Pj4gIMKgICvCoMKgwqAgaWYgKCFpbWFnZSB8fCAhbW4pCj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0
dXJuIDA7Cj4+PiArCj4+PiAgwqDCoMKgwqDCoCAvKgo+Pj4gIMKgwqDCoMKgwqDCoCAqIFRoZSBo
b3QgdW5wbHVnZ2VkIG1lbW9yeSBpcyBwYXJ0IG9mIGNyYXNoIG1lbW9yeSByYW5nZXMsCj4+PiAg
wqDCoMKgwqDCoMKgICogcmVtb3ZlIGl0IGhlcmUuCj4+PiBAQCAtNDUwLDE0ICs0NDEsMzQgQEAg
c3RhdGljIHZvaWQgdXBkYXRlX2NyYXNoX2VsZmNvcmVoZHIoc3RydWN0Cj4+PiBraW1hZ2UgKmlt
YWdlLCBzdHJ1Y3QgbWVtb3J5X25vdGlmeSAqCj4+PiAgwqDCoMKgwqDCoCBpZiAoaW1hZ2UtPmhw
X2FjdGlvbiA9PSBLRVhFQ19DUkFTSF9IUF9SRU1PVkVfTUVNT1JZKSB7Cj4+PiAgwqDCoMKgwqDC
oMKgwqDCoMKgIGJhc2VfYWRkciA9IFBGTl9QSFlTKG1uLT5zdGFydF9wZm4pOwo+Pj4gIMKgwqDC
oMKgwqDCoMKgwqDCoCBzaXplID0gbW4tPm5yX3BhZ2VzICogUEFHRV9TSVpFOwo+Pj4gLcKgwqDC
oMKgwqDCoMKgIHJldCA9IHJlbW92ZV9tZW1fcmFuZ2UoJmNtZW0sIGJhc2VfYWRkciwgc2l6ZSk7
Cj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0ID0gcmVtb3ZlX21lbV9yYW5nZShjbWVtLCBiYXNlX2Fk
ZHIsIHNpemUpOwo+PiBJIGxpa2UgdGhlIG92ZXJhbGwgZGVzaWduIGZvciBoYW5kbGluZyBjcmFz
aGtlcm5lbCBtZW1vcnkgZXhjbHVzaW9uCj4+IGluIHRoaXMgcGF0Y2ggc2VyaWVzLCBlc3BlY2lh
bGx5IHRoZSB3YXkgeW91IG1hbmFnZWQgdG8gZnJlZSB0aGUKPj4gY3Jhc2hfbWVtIG9iamVjdCAo
bWVtKSBpbiB0aGUgZ2VuZXJpYyBjb2RlIChjcmFzaF9wcmVwYXJlX2VsZjY0X2hlYWRlcnMoKSku
Cj4gVGhhbmtzIGZvciB0aGUgcmV2aWV3Lgo+Cj4+IEhvd2V2ZXIsIHRoZSB3YXkgY3Jhc2ggbWVt
b3J5IGlzIHByZXBhcmVkIGFmdGVyIGEgbWVtb3J5IGhvdHBsdWcKPj4gZXZlbnQgb24gcG93ZXJw
YyBieSBjYWxsaW5nIHJlbW92ZV9tZW1fcmFuZ2UoKSwgY2FuIGxlYXZlIHRoZSBjcmFzaAo+PiBt
ZW1vcnkgcmFuZ2VzIHVuc29ydGVkLiBUaGlzIGNhbiBjYXVzZSBpc3N1ZXMgaW4gdGhlIGdlbmVy
aWMgY29kZQo+PiB3aGVuIGV4Y2x1ZGluZyBjcmFzaGtlcm5lbCBtZW1vcnksIGJlY2F1c2UgY3Jh
c2hfZXhjbHVkZV9tZW1fcmFuZ2UoKQo+PiBleHBlY3RzIGNyYXNoX21lbSB0byBiZSBzb3J0ZWQu
Cj4gWW91IGFyZSBhYnNvbHV0ZWx5IGNvcnJlY3QuCj4KPj4gU28gSSB3cm90ZSBhIHNpbXBsZSBw
YXRjaCB0byBjb3ZlciB0aGlzIHNjZW5hcmlvLiBJbmNsdWRpbmcgdGhlCj4+IHBhdGNoIGJlbG93
IGFzIHRoZSBmaXJzdCBwYXRjaCBpbiB0aGlzIHNlcmllcyB3b3VsZCBiZSBoZWxwZnVsLgo+PiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNjAyMTAxMjA4MDMuNDMzOTc4LTEtc291cmFi
aGphaW5AbGludXguaWJtLmNvbS8KPiBUaGFua3MgZm9yIHRoZSBhZGRpdGlvbmFsIHBhdGNoLiBJ
J2xsIGFkZCBpdCBhcyB0aGUgZmlyc3QgcGF0Y2ggaW4gdGhlCj4gbmV4dCByZXZpc2lvbiB0byBl
bnN1cmUgY3Jhc2hfbWVtIHJlbWFpbnMgc29ydGVkIGFmdGVyIG1lbW9yeSBob3RwbHVnCj4gZXZl
bnRzIG9uIHBvd2VycGMuCgpUaGFua3MgeW91LgoKUGxlYXNlIHVzZSB0aGUgbGF0ZXN0IHZlcnNp
b24gKHYyKSBhdmFpbGFibGUgaGVyZToKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjYw
MjEyMDYwMTU5LjczMzAyMy0xLXNvdXJhYmhqYWluQGxpbnV4LmlibS5jb20vCgpSZWdhcmRzLApT
b3VyYWJoIEphaW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
