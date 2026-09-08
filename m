Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA58DC79F82
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 14:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SXwRFJM6KWWHNRph7YdzDxvzoZhaZ/hdyv/7MA93Wf8=; b=gd/fzTvcd6dqg7
	tZaRlN/ECBIc9C94zb6uYh39DboPFs9vXohF5A/WpVQse/kyYIJD3UnHQP11zv9jCT38D4DFLruc7
	BE0GKNjPEtA18oJoF6eJ2tXJ4/txxBYepLxuyc/dw2whx+CNgI+1Z2WDfT4jE2vo7t0mTN7rgaWXQ
	S56lJGLQPa+LuzBDVAVB5ph+vyKY5l68BR2kBxWwDzl4vxIEkRBEXHyztVw+DUIo8QaehDjb4KzUX
	Gkldv54ReN11Dk0nXAl7n/ma4aNq8vtb+jqmXsNcYlRiok3wUE5h4cWIkjlRlgScFdv/HtabFxnxh
	9UImLUuvbq9aUvM+CrHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3wQN-00000009Dxq-27Oq;
	Tue, 08 Sep 2026 14:03:47 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3wQG-00000009DwR-1Kaw;
	Tue, 08 Sep 2026 14:03:45 +0000
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688D1gN04008041;
	Tue, 8 Sep 2026 14:03:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Kqndma
	W8DL9z5lUDZrm9whEknryFxk+Tb/v8/jM4l2k=; b=YIKyU/c/H2YnhGEjQBTa9F
	dGyW1cMyR8KPdeMzvyf7ZKByaoGiinWEyo8cS/v1j4OLIntRGtT+aycfFi9HZZ6g
	IupqGgQQhmriK5BQzjtXIQitZ3Z+sXnY8CEvS9rMjYVQJdO79qCnhyuEuhxaEH/L
	y+XM+TuWHWlUgF/DdA25SyUq2zqec4Ah859o3SI1mkj803zNxzFQXTnZXH4z6GLE
	ZCdp0TVWF9z+RXUIcyQXhlJ4E87Ct2Ss67T8WynuRHDsn5Zcj1PRqHRCOauCdw93
	69kR/q7nng1XtMu11UlnKvVgFf5b1Y2ze3gWAWRYrRGHhnZXjCl6aK3G6NBYCpRg
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ggbjrq4a1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Sep 2026 14:03:12 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 688DuE46015482;
	Tue, 8 Sep 2026 14:03:11 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4gh03ybyjg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Sep 2026 14:03:10 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 688E37pW45154618
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 8 Sep 2026 14:03:07 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2C5972004B;
	Tue,  8 Sep 2026 14:03:07 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5BD1E20043;
	Tue,  8 Sep 2026 14:02:41 +0000 (GMT)
Received: from [9.61.253.97] (unknown [9.61.253.97])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue,  8 Sep 2026 14:02:40 +0000 (GMT)
Message-ID: <264436d6-4a2a-4fe7-8b10-bbbd69cf7fd5@linux.ibm.com>
Date: Tue, 8 Sep 2026 19:32:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 17/24] powerpc/vdso: Enable the vdsocheck tool
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt
 <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        Andy Lutomirski <luto@kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Kees Cook <kees@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>, Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
        Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
        Gary Guo <gary@garyguo.net>,
        =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>,
        Benno Lossin <lossin@kernel.org>,
        Andreas Hindborg <a.hindborg@kernel.org>,
        Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
        Danilo Krummrich <dakr@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Christophe Leroy <chleroy@kernel.org>, Boqun Feng <boqun@kernel.org>,
        Nicolas Schier <nsc@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, linux-mm@kvack.org, linux-um@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        loongarch@lists.linux.dev, linux-s390@vger.kernel.org,
        linux-mips@vger.kernel.org, rust-for-linux@vger.kernel.org,
        linux-kbuild@vger.kernel.org, Jan Stancek <jstancek@redhat.com>,
        Arnaldo Carvalho de Melo <acme@redhat.com>,
        Alexandre Ghiti <alexghiti@rivosinc.com>
References: <20260908-vdso-absolute-reloc-v5-0-3a93791af1cf@linutronix.de>
 <20260908-vdso-absolute-reloc-v5-17-3a93791af1cf@linutronix.de>
Content-Language: en-US
From: R Nageswara Sastry <rnsastry@linux.ibm.com>
In-Reply-To: <20260908-vdso-absolute-reloc-v5-17-3a93791af1cf@linutronix.de>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=E7T9Y6dl c=1 sm=1 tr=0 ts=6aa015a0 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VnNF1IyMAAAA:8
 a=0oLV-YkNZL8bY7TGgZYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE1MSBTYWx0ZWRfX3KyouA8o5rAD
 ByjA/dZC1Xn2n5rWH2E08Rby3F+ieH1b8xVcBpTsx0Pq3F1Kh8H6gO0eZ56x8axONjS0M7Vrmnn
 1W+1YJV6A3rf0XXO5ICf/YfbKJvemH4=
X-Proofpoint-ORIG-GUID: pTJswYdOioXws7GKWQycoAhrlwYXMjr-
X-Proofpoint-GUID: gTxGanC_PLNk6Cp8fvurHqYNODghYxXb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE1MSBTYWx0ZWRfX+h8v/6PDKP+Z
 jAdm1rpGv4OhJjZsh6igckQQoLJoC7k9srOWBrLXydyr1uM/ouNV0nG/uX0KMsRisoyR2/cj7Mb
 Hy2sciE8csHY6RSCpOx2nHtrmmW9Bn3O8HYVkQEH4zuSVA5NUU414f/b1P3dY2Y9XVnEpbCvJEP
 gZdPdvU+PEg2VuiKByiM4jecbnLFEgaHV5/AHo2rbC0Fn3xseCHAZ0BYnJpQACipja6Fj5ZcajM
 9S0iR7edRavzStHw3Bl0kcStsnMxiBYTJV59jwjjZrHbhDEDVEGjtlhKJlGMl7XI9iVT6tVB69E
 /bcJ2zCAI+cma3BesLX1c2J13X5ouAGoXJs8yD7QAv6QzEAtvkL7oWFOsTBNu+FkE5yVjZH/1kZ
 OZGjxAMbcSHhLhthhYM2mHEV+LTIa+3ZOqkA9IE9Sq7oBPMJ8eRmrGM9/yOAAzelV4MYH0qfW5K
 8wt2O27vBLIE4mVUxeA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_02,2026-09-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_070340_476205_9CAE2C21 
X-CRM114-Status: GOOD (  20.55  )
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

Ck9uIDA4LjA5LjIwMjYgMTI6MDMgUE0sIFRob21hcyBXZWnDn3NjaHVoIHdyb3RlOgo+IFRoZSB2
ZHNvY2hlY2sgdG9vbCB2YWxpZGF0ZXMgdGhlIG9iamVjdCBmaWxlcyBhbmQgZmluYWwgLnNvIGxp
YnJhcnkuCj4gSXQgY2FuIGRldGVjdCBpZiB0aGUgY29tcGlsZXIgY3JlYXRlZCByZWxvY2F0aW9u
cyB3aGljaCBhcmUgaW5jb21wYXRpYmxlCj4gd2l0aCB0aGUgdkRTTyB3aGljaCBuZWVkIHRvIGJl
IHdvcmtlZCBhcm91bmQuCj4KPiBXaXJlIGl0IHVwIGZvciB0aGUgYXJjaGl0ZWN0dXJlLgo+Cj4g
U2lnbmVkLW9mZi1ieTogVGhvbWFzIFdlacOfc2NodWggPHRob21hcy53ZWlzc3NjaHVoQGxpbnV0
cm9uaXguZGU+ClRlc3RlZC1ieTogUiBOYWdlc3dhcmEgU2FzdHJ5IDxybnNhc3RyeUBsaW51eC5p
Ym0uY29tPgoKU3lzdGVtOiBwcGM2NGxlIExQQVIgKElCTSBQT1dFUiksIExpbnV4IDcuMy1yYzIK
PiAtLS0KPiAgIGFyY2gvcG93ZXJwYy9LY29uZmlnICAgICAgICAgICAgICB8ICAxICsKPiAgIGFy
Y2gvcG93ZXJwYy9rZXJuZWwvdmRzby9NYWtlZmlsZSB8ICA0ICsrLS0KPiAgIGxpYi92ZHNvL2No
ZWNrL3Zkc29jaGVjay5ycyAgICAgICB8IDI3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKwo+
ICAgMyBmaWxlcyBjaGFuZ2VkLCAzMCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4g
ZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9LY29uZmlnIGIvYXJjaC9wb3dlcnBjL0tjb25maWcK
PiBpbmRleCAyNTgwZTI3ZTQzMjguLmYxOWUyMjVjZmM1YyAxMDA2NDQKPiAtLS0gYS9hcmNoL3Bv
d2VycGMvS2NvbmZpZwo+ICsrKyBiL2FyY2gvcG93ZXJwYy9LY29uZmlnCj4gQEAgLTMzMCw2ICsz
MzAsNyBAQCBjb25maWcgUFBDCj4gICAJc2VsZWN0IFNZU0NUTF9FWENFUFRJT05fVFJBQ0UKPiAg
IAlzZWxlY3QgVEhSRUFEX0lORk9fSU5fVEFTSwo+ICAgCXNlbGVjdCBUUkFDRV9JUlFGTEFHU19T
VVBQT1JUCj4gKwlzZWxlY3QgVkRTT19DSEVDSwo+ICAgCXNlbGVjdCBWRFNPX0RBVEFTVE9SRQo+
ICAgCXNlbGVjdCBWRFNPX0dFVFJBTkRPTQo+ICAgCSMKPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dl
cnBjL2tlcm5lbC92ZHNvL01ha2VmaWxlIGIvYXJjaC9wb3dlcnBjL2tlcm5lbC92ZHNvL01ha2Vm
aWxlCj4gaW5kZXggMzY4NzU5ZjgxNzA4Li5jYTIwYjkxYjQzNzMgMTAwNjQ0Cj4gLS0tIGEvYXJj
aC9wb3dlcnBjL2tlcm5lbC92ZHNvL01ha2VmaWxlCj4gKysrIGIvYXJjaC9wb3dlcnBjL2tlcm5l
bC92ZHNvL01ha2VmaWxlCj4gQEAgLTgxLDkgKzgxLDkgQEAgdGFyZ2V0cyArPSB2ZHNvNjQubGRz
Cj4gICBDUFBGTEFHU192ZHNvNjQubGRzICs9IC1QIC1DCj4gICAKPiAgICMgbGluayBydWxlIGZv
ciB0aGUgLnNvIGZpbGUsIC5sZHMgaGFzIHRvIGJlIGZpcnN0Cj4gLSQob2JqKS92ZHNvMzIuc28u
ZGJnOiAkKG9iaikvdmRzbzMyLmxkcyAkKG9iai12ZHNvMzIpICQob2JqKS92Z2V0dGltZW9mZGF5
LTMyLm8gJChvYmopL3ZnZXRyYW5kb20tMzIubyAkKG9iaikvY3J0c2F2cmVzLTMyLm8gRk9SQ0UK
PiArJChvYmopL3Zkc28zMi5zby5kYmc6ICQob2JqKS92ZHNvMzIubGRzICQob2JqLXZkc28zMikg
JChvYmopL3ZnZXR0aW1lb2ZkYXktMzIubyAkKG9iaikvdmdldHJhbmRvbS0zMi5vICQob2JqKS9j
cnRzYXZyZXMtMzIubyAkKHZkc29jaGVjaykgRk9SQ0UKPiAgIAkkKGNhbGwgaWZfY2hhbmdlZCx2
ZHNvMzJsZF9hbmRfY2hlY2spCj4gLSQob2JqKS92ZHNvNjQuc28uZGJnOiAkKG9iaikvdmRzbzY0
LmxkcyAkKG9iai12ZHNvNjQpICQob2JqKS92Z2V0dGltZW9mZGF5LTY0Lm8gJChvYmopL3ZnZXRy
YW5kb20tNjQubyBGT1JDRQo+ICskKG9iaikvdmRzbzY0LnNvLmRiZzogJChvYmopL3Zkc282NC5s
ZHMgJChvYmotdmRzbzY0KSAkKG9iaikvdmdldHRpbWVvZmRheS02NC5vICQob2JqKS92Z2V0cmFu
ZG9tLTY0Lm8gJCh2ZHNvY2hlY2spIEZPUkNFCj4gICAJJChjYWxsIGlmX2NoYW5nZWQsdmRzbzY0
bGRfYW5kX2NoZWNrKQo+ICAgCj4gICAjIGFzc2VtYmx5IHJ1bGVzIGZvciB0aGUgLlMgZmlsZXMK
PiBkaWZmIC0tZ2l0IGEvbGliL3Zkc28vY2hlY2svdmRzb2NoZWNrLnJzIGIvbGliL3Zkc28vY2hl
Y2svdmRzb2NoZWNrLnJzCj4gaW5kZXggZTQ1YTFmYmM2ODI5Li40MjliZGNkNjU4MTggMTAwNjQ0
Cj4gLS0tIGEvbGliL3Zkc28vY2hlY2svdmRzb2NoZWNrLnJzCj4gKysrIGIvbGliL3Zkc28vY2hl
Y2svdmRzb2NoZWNrLnJzCj4gQEAgLTY5LDYgKzY5LDMzIEBAIGZuIGFsbG93ZWRfcmVsb2NhdGlv
bnNfZm9yX21hY2hpbmUobWFjaGluZTogdTE2KSAtPiBPcHRpb248QWxsb3dlZFJlbG9jYXRpb25z
PCdzCj4gICAgICAgICAgICAgICAuLkRlZmF1bHQ6OmRlZmF1bHQoKQo+ICAgICAgICAgICB9Cj4g
ICAgICAgICAgIC5pbnRvKCksCj4gKyAgICAgICAgYmluZGluZ3M6OkVNX1BQQyA9PiBBbGxvd2Vk
UmVsb2NhdGlvbnMgewo+ICsgICAgICAgICAgICBpbl9vYmplY3RfZmlsZTogJlsKPiArICAgICAg
ICAgICAgICAgIGJpbmRpbmdzOjpSX1BQQ19SRUwyNCwKPiArICAgICAgICAgICAgICAgIGJpbmRp
bmdzOjpSX1BQQ19SRUwxNCwKPiArICAgICAgICAgICAgICAgIGJpbmRpbmdzOjpSX1BQQ19SRUwz
MiwKPiArICAgICAgICAgICAgICAgIGJpbmRpbmdzOjpSX1BQQ19SRUwxNiwKPiArICAgICAgICAg
ICAgICAgIGJpbmRpbmdzOjpSX1BQQ19SRUwxNl9MTywKPiArICAgICAgICAgICAgICAgIGJpbmRp
bmdzOjpSX1BQQ19SRUwxNl9ISSwKPiArICAgICAgICAgICAgICAgIGJpbmRpbmdzOjpSX1BQQ19S
RUwxNl9IQSwKPiArICAgICAgICAgICAgXSwKPiArICAgICAgICAgICAgLi5EZWZhdWx0OjpkZWZh
dWx0KCkKPiArICAgICAgICB9Cj4gKyAgICAgICAgLmludG8oKSwKPiArICAgICAgICBiaW5kaW5n
czo6RU1fUFBDNjQgPT4gQWxsb3dlZFJlbG9jYXRpb25zIHsKPiArICAgICAgICAgICAgaW5fb2Jq
ZWN0X2ZpbGU6ICZbCj4gKyAgICAgICAgICAgICAgICBiaW5kaW5nczo6Ul9QUEM2NF9SRUwyNCwK
PiArICAgICAgICAgICAgICAgIGJpbmRpbmdzOjpSX1BQQzY0X1JFTDE0LAo+ICsgICAgICAgICAg
ICAgICAgYmluZGluZ3M6OlJfUFBDNjRfUkVMMzIsCj4gKyAgICAgICAgICAgICAgICBiaW5kaW5n
czo6Ul9QUEM2NF9SRUw2NCwKPiArICAgICAgICAgICAgICAgIGJpbmRpbmdzOjpSX1BQQzY0X1JF
TDE2LAo+ICsgICAgICAgICAgICAgICAgYmluZGluZ3M6OlJfUFBDNjRfUkVMMTZfTE8sCj4gKyAg
ICAgICAgICAgICAgICBiaW5kaW5nczo6Ul9QUEM2NF9SRUwxNl9ISSwKPiArICAgICAgICAgICAg
ICAgIGJpbmRpbmdzOjpSX1BQQzY0X1JFTDE2X0hBLAo+ICsgICAgICAgICAgICBdLAo+ICsgICAg
ICAgICAgICAuLkRlZmF1bHQ6OmRlZmF1bHQoKQo+ICsgICAgICAgIH0KPiArICAgICAgICAuaW50
bygpLAo+ICAgICAgICAgICBfID0+IE5vbmUsCj4gICAgICAgfQo+ICAgfQo+Ci0tIApUaGFua3Mg
YW5kIFJlZ2FyZHMKUi5OYWdlc3dhcmEgU2FzdHJ5CgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
