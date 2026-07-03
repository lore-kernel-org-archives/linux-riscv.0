Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A0A5C43458
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 06:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SCriw+QShn0+d35mMeR620ee2PXbLVmkZu1RQpSQdoE=; b=DJmOz0qhbv0y/b
	VkOinrARlMsmhwx4Xxp4q4tdvI2CUcAySSBJHrpLBWcKVYvA0y8hQ/uN8irBmF1xELSHLpvKPaXw4
	o/5RVD4ttNl0n9m3AiE9vXZ9GF1aKw1v7DPpXKaqlbYXEeU7L/Cfjp1TXJsQEI4Xl6HHwpnqzlUip
	2PU4yyNyAt8w3JYzMDzcrHC5TmMlRhz6UZWLWPgAWtSCiBK16QgHjOnv1xDUHVB39hTCrJp2kzU+c
	kMZd3+uf13s6fvP4MfsqJDSrooxUH20hZ2mU7srd5wp87MdinqGjP5rR3V4IU3IZaeA3vajp5fBEU
	RDxD2AF0piyDdvC1tPnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfXDy-000000068oc-2Gw4;
	Fri, 03 Jul 2026 06:18:06 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfXDw-000000068o8-1eo4
	for linux-riscv@lists.infradead.org;
	Fri, 03 Jul 2026 06:18:05 +0000
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6631IwIc1453346;
	Fri, 3 Jul 2026 06:17:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=8pXveF
	mOOYSvyOo7QlW8sZ/yXA5rWNTgbkeIn+ezbyk=; b=r7spRylSayBaz3CBk1bvvu
	BT4KLKfrwrUU4X0hCFFldC8JyUkP1gZ+yTJQS0XAZgoDUQyT8kQsl2NN9RE+BnDp
	0Ur6gx8fKbE3nkhZnFikv0RHahFRjLZcfzpE03i1YiXm4+LzPdw+N3073CF0WKUr
	wxfQurwfnIIzFAfa474Nrqmd/Vt/icWU6UlN5SLFu/uVN6Kbr2fvufT3SNpJt7wC
	N/TRAbYtxSKETqKlFQZFcMAJWRrrEFbEF38fPnD0eUrC5144VVfDppMII8nqJLre
	80fakqbbLcZv6OeewdU95Q37nlRIp6AFiX1Dhh07/z8RmPuMx3Xeej32A8FXRYtg
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f26qgdpy7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Jul 2026 06:17:01 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 66364u8k021419;
	Fri, 3 Jul 2026 06:17:00 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4f2ruqqraa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Jul 2026 06:17:00 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6636GvOd23724404
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 3 Jul 2026 06:16:57 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E084220040;
	Fri,  3 Jul 2026 06:16:56 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5DC3D20043;
	Fri,  3 Jul 2026 06:16:56 +0000 (GMT)
Received: from tuxmaker.linux.ibm.com (unknown [9.87.85.9])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri,  3 Jul 2026 06:16:56 +0000 (GMT)
From: Sven Schnelle <svens@linux.ibm.com>
To: Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>
Cc: Peter Zijlstra <peterz@infradead.org>, Jonathan Corbet
 <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Huacai Chen
 <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
        Madhavan
 Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)"
 <chleroy@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
 <alex@ghiti.fr>,
        Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik
 <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Andy Lutomirski
 <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Ingo Molnar
 <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin"
 <hpa@zytor.com>,
        Andrew Donnellan <andrew+kernel@donnellan.id.au>,
        Mark
 Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>,
        Jiaxun
 Yang <jiaxun.yang@flygoat.com>,
        Ryan Roberts <ryan.roberts@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mukesh Kumar Chaurasiya
 <mkchauras@linux.ibm.com>,
        Shrikanth Hegde <sshegde@linux.ibm.com>, Zong
 Li <zong.li@sifive.com>,
        Nam Cao <namcao@linutronix.de>, Deepak Gupta
 <debug@rivosinc.com>,
        Lukas Gerlach <lukas.gerlach@cispa.de>,
        Rui Qi
 <qirui.001@bytedance.com>, Kees Cook <kees@kernel.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org
Subject: Re: [RFC] entry: Untangle the return value of
 syscall_enter_from_user_mode from syscall NR
In-Reply-To: <akZV7kjVh37z63Nz@kunlun.suse.cz>
References: <akVRcPsD_R_CE1qW@kunlun.suse.cz> <yt9dechlbyj0.fsf@linux.ibm.com>
	<akYreY_BHuRbxSsO@kunlun.suse.cz> <yt9d5x2xbny9.fsf@linux.ibm.com>
	<akZV7kjVh37z63Nz@kunlun.suse.cz>
Date: Fri, 03 Jul 2026 08:16:56 +0200
Message-ID: <yt9d1pdkbns7.fsf@linux.ibm.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=RYqgzVtv c=1 sm=1 tr=0 ts=6a4753de cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=uAbxVGIbfxUO_5tXvNgY:22 a=PxzjjWZHAImlhUGC5A8A:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA1MiBTYWx0ZWRfX3KioJ0aE0IJK
 6GCXJHhUp1F2Z1YveNR5roy+VlB9mYaqqPi6ZnW5aiC5GW26VV2+HS77GgwsK/LiTuT7b05HLTJ
 7bqNBO0gAyrISbMT0IKHCUvnIc+Bc/c=
X-Proofpoint-GUID: MZHualSITsNhKNRwX3VbQpZ3GLr3BMiU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA1MiBTYWx0ZWRfX1xdOF6m0TbsV
 RRdovO7OWz9x9ZJwMBitj+Ms2sSe6kn4owwgid7NsQ+hw6RMIxUbpMSid4pQ0mJnsYrCDGpBWuN
 ettr7U4yik8mEnZt/EICOdu8qFM5H9i+b35dllBVZzrNmsQ0B2SVeUuCOeJ8TraSiMkYJUJO+Nc
 BJnyRM01Jj4QXANp0Io9tTz6Hj1vAd7lh+mkuzGmIJAfH0VdAS260qxw2YxoCTBvcir1LIuYlPw
 LOfBvQ9Z5gu2kgM3zQKXqocxBvBylQvTG6K1R0ZF5Oy59AM0zBTpy13iio6Fdsb3nIFuT345/oZ
 uzPcE5TicueH+0AQBY6ur7FPfScbrnIFQO95r+GaiM+KZ/cE3mSboUBKGGWCtZHTxfM/3ubcCX4
 lKnp6tSsvLMOKZt/p9bvHcVJ7wXQ4gz33Og1uvgzaO9B74gsTFQTPb0/f/1a5u1GN5Ijss+/Nej
 V3bAm3cpL0fOCvtJW1g==
X-Proofpoint-ORIG-GUID: UKYrWbQA3xg_QgCJ6b-fW3NtJr_lLQLl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_231804_450826_88298B25 
X-CRM114-Status: GOOD (  32.17  )
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

TWljaGFsIFN1Y2jDoW5layA8bXN1Y2hhbmVrQHN1c2UuZGU+IHdyaXRlczoKCj4gT24gVGh1LCBK
dWwgMDIsIDIwMjYgYXQgMDI6MDE6MDJQTSArMDIwMCwgU3ZlbiBTY2huZWxsZSB3cm90ZToKPj4g
TWljaGFsIFN1Y2jDoW5layA8bXN1Y2hhbmVrQHN1c2UuZGU+IHdyaXRlczoKPj4gCj4+ID4gT24g
VGh1LCBKdWwgMDIsIDIwMjYgYXQgMTA6MTI6MzVBTSArMDIwMCwgU3ZlbiBTY2huZWxsZSB3cm90
ZToKPj4gPj4gTWljaGFsIFN1Y2jDoW5layA8bXN1Y2hhbmVrQHN1c2UuZGU+IHdyaXRlczoKPj4g
Pj4gCj4+ID4+ID4gVGhlIHJldHVybiB2YWx1ZSBvZiBzeXNjYWxsX2VudGVyX2Zyb21fdXNlcl9t
b2RlIGlzIHVzZWQgYm90aCBmb3IgdGhlCj4+ID4+ID4gYWRqdXN0ZWQgc3lzY2FsbCBudW1iZXIg
YW5kIHRoZSBpbmRpY2F0b3IgdGhhdCBhIHN5c2NhbGwgc2hvdWxkIGJlCj4+ID4+ID4gc2tpcHBl
ZC4KPj4gPj4gPgo+PiA+PiA+IEFzIHNlY2NvbXAgY2FuIGJlIGludm9rZWQgb24gYW55IHN5c2Nh
bGwsIGluY2x1ZGluZyBpbnZhbGlkIG9uZXMgdGhpcwo+PiA+PiA+IHNvbWV3aGF0IHVuZGVybWlu
ZXMgc2VjY29tcC4KPj4gPj4gPgo+PiA+PiA+IFdoaWxlIHRoZSBzZWNjb21wIHZhcmlhbnRzIHRo
YXQgdGVybWluYXRlIHRoZSBwcm9jZXNzIGRvIG5vdCBuZWVkIHRvCj4+ID4+ID4gY2FyZSBhYm91
dCB0aGlzIGZvciB0aGUgZmlsdGVyIHRoYXQgc2V0cyB0aGUgc3lzY2FsbCByZXR1cm4gdmFsdWUg
dGhpcwo+PiA+PiA+IGRpc2N0aW5jdGlvbiBpcyByZXF1aXJlZC4KPj4gPj4gPgo+PiA+PiA+IFBh
c3MgdGhlIHN5c2NhbGwgbnVtYmVyIGFzIGEgcG9pbnRlciB0byB0aGUgaW5saW5lIGVudHJ5IGZ1
bmN0aW9ucywgYW5kCj4+ID4+ID4gdXNlIHRoZSByZXR1cm4gdmFsdWUgZXhjbHVzaXZlbHkgZm9y
IHRoZSBpbmRpY2F0aW9uIHRoYXQgdGhlIHN5c2NhbGwgaXMKPj4gPj4gPiBhbHJlYWR5IGhhbmRs
ZWQuCj4+ID4+ID4KPj4gPj4gPiBUaGlzIHNob3VsZCBhdm9pZCB0aGUgbmVlZCBmb3IgdGhlIHMz
OTAgUElGX1NZU0NBTExfUkVUX1NFVCB3aGljaCBpcyB0aGUKPj4gPj4gPiB3b3JrYXJvdW5kIGZv
ciBleGFjdGx5IHRoaXMgZGVmaWNpZW5jeS4KPj4gPj4gCj4+ID4+IEknbSBub3Qgc3VyZSB3aGV0
aGVyIFBJRl9TWVNDQUxMX1JFVF9TRVQgY2FuIGJlIHJlbW92ZWQgLSB0aGUgc3lzY2FsbAo+PiA+
PiByZXR1cm4gbWlnaHQgc3RpbGwgZ2V0IHNldCBieSBQVFJBQ0VfU0VUX1NZU0NBTExfSU5GTyB3
aGVuIHRoZSB0cmFjZWUgaXMKPj4gPj4gc3RvcHBlZC4gVGhpcyBtaWdodCBiZSBhIHBvc2l0aXZl
IG51bWJlciB3aGljaCBjYW4ndCBiZSBkaXN0aW5ndWlzaGVkCj4+ID4+IGZyb20gYSBzeXNjYWxs
IG51bWJlci4gQnV0IG1heWJlIGknbSBtaXNzaW5nIHNvbWV0aGluZz8gSXQncyBiZWVuIHF1aXRl
Cj4+ID4+IGEgd2hpbGUgc2luY2UgSSB0b3VjaGVkIGFsbCB0aGF0IHB0cmFjZSBzdHVmZi4KPj4g
Pgo+PiA+IFdoZW4gdGhlIHN5c2NhbGwgcmV0dXJuIHZhbHVlIGlzIHNldCAoaW4gdGhlIHJlZ2lz
dGVycykgdGhlIHJldHVybiB2YWx1ZQo+PiA+IHdoaWNoIGlzIGFsc28gdGhlIG1vZGlmaWVkIHN5
c2NhbGwgbnVtYmVyIGlzIHNldCB0byAtMSBpbmRpY2F0aW5nIHRoZQo+PiA+IHN5c2NhbGwgd2Fz
IGhhbmRsZWQuIEF0IGxlYXN0IHRoYXQncyBob3cgdGhlIEFQSSBpcyBkZXNjcmliZWQuCj4+ID4K
Pj4gPiBTbyB5ZXMsIGlmIHRoZSBzeXNjYWxsIG51bWJlciByYW5nZSBpcyByZXN0cmljdGVkIG9y
IHRoZSBzeXNjYWxsIG51bWJlcgo+PiA+IGlzIHJldHVybmVkIHRocm91Z2ggYSBwYXRoIGRpZmZl
cmVudCBmcm9tIHRoZSBmdW5jdGlvbiByZXR1cm4gdmFsdWUgdGhlCj4+ID4gZmxhZyBzaG91bGQg
bm90IGJlIG5lZWRlZCBpbiB0aGUgZW50cnkgcGF0aCBiZWNhdXNlIHRoZSBjYXNlIGNhbiBiZQo+
PiA+IGRldGVjdGVkIHRocm91Z2ggdGhlIHJldHVybiB2YWx1ZSBhbG9uZS4KPj4gCj4+IEknbSBz
dGlsbCBmYWlsaW5nIHRvIHNlZSBob3cgdGhpcyB3b3VsZCB3b3JrIHdpdGhvdXQgYW4gYWRkaXRp
b25hbAo+PiBmbGFnLiBBc3N1bWUgYSBwcm9ncmFtICh0aGUgdHJhY2VlKSBpcyBzdG9wcGVkIGJl
Y2F1c2Ugb2YgYSBzeXNjYWxsCj4+IGVudHJ5LiBUaGUgdHJhY2VyIHRoZW4gZGVjaWRlcyB0byBz
a2lwIHRoZSBzeXNjYWxsIGFuZCBjaGFuZ2VzCj4+IHJlZ3MtPmdwcjIgKHdoaWNoIGNvbnRhaW5z
IGVpdGhlciB0aGUgc3lzY2FsbCBudW1iZXIgb3IgcmV0dXJuIHZhbHVlKQo+PiB0byBjb250YWlu
IDQyLiBXaGVuIHRoZSB0cmFjZXIgdGhhbiByZXN0YXJ0cyB0aGUgc3lzY2FsbCwgaG93IGRvZXMK
Pj4gZG9fc3lzY2FsbCgpIGtub3cgdGhhdCBncHIyIGlzIG5vdyBhIHJldHVybiB2YWx1ZSBhbmQg
bm90IGEgc3lzY2FsbCBudW1iZXI/Cj4KPiBCZWNhdXNlIHRoZW4gdGhlIHJldHVybiB2YWx1ZSBm
cm9tIHRoZSBzeXNjYWxsX2VudGVyX2Zyb21fdXNlcl9tb2RlCj4gbWFjaGluZXJ5IHdvdWxkIGJl
IC0xIGluZGljYXRpbmcgdGhlIHN5c2NhbGwgc2hvdWxkIGJlIHNraXBwZWQuIFRoYXQgaXMKPiBo
b3cgdGhlIHJldHVybiB2YWx1ZSBvZiBzeXNjYWxsX2VudGVyX2Zyb21fdXNlcl9tb2RlIGlzIGRv
Y3VtZW50ZWQsIEkKPiBkaWQgbm90IHZlcmlmeSB0aGF0IGl0IGFjdHVhbGx5IHdvcmtzIHRoYXQg
d2F5IGZvciB0aGUgdHJhY2luZyBjYXNlIG9uCj4gczM5MC4KCkkgcmVhZCB0aGUgY29kZSBhbmQg
dGVzdGVkIC0gSSB0aGluayBJIGNvbmZ1c2VkIHRoZSB3YXkgaG93IHN5c2NhbGwgYXJlCmludGVy
Y2VwdGVkIGJ5IHNlY2NvbXAgdnMuIHB0cmFjZS4gVGhlIFBJRl9TWVNDQUxMX1JFVF9TRVQgaXMg
aW5kZWVkCm9ubHkgcmVxdWlyZWQgdG8gaW5kaWNhdGUgc3lzY2FsbHMgc2tpcHBlZCB2aWEgc2Vj
Y29tcCBhbmQgbm90IHB0cmFjZS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
