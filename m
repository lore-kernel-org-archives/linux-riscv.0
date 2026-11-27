Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A65606A321
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Nov 2026 15:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xnsGNGD2;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ouxCdVIP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yX8+ICYYQGFlEbch/ZMvBfVYbY8bE+lHKtYbszSHT9w=; b=xnsGNGD2aXZOrmyrrMssqQkXxx
	8GoSpCE2lq71RF3xg+/RqPlGoGa7C11OaAeOOEB0jYi5WvRf7Ud+8v0KF5u0OFfhcDm7DOZK3rwQC
	azEYiqW4gtrPsOJBkz5C+1bAaZyqNQa5yxaTyCkDWxWyHQOE0mtoE4DWjnMY8nqWOOw+ysLPOke2v
	rzYKDBYvAHz4TDnMJvTqKy+Ig3qd0Ic/EMtffHKCq2iFjG/A3oRi8GiShbZnPqgd0jSxH7hQ63cEK
	3j7PKUtYzcgMftq/4CrnjBu8O3MCVAlKHTafaMwAl/vPhoRZ93V+G7/PfPtKdFANR0ckotiUUeC6a
	QDPU2J6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWy7q-0000000GtV6-2tJV;
	Fri, 27 Nov 2026 15:44:38 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWy7k-0000000GtU0-1AeE;
	Fri, 27 Nov 2026 15:44:37 +0000
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE51UZ3266281;
	Fri, 27 Nov 2026 15:43:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=ZUudbv
	Dd7MPyN1ktju7yYOYQ2x2QokIUznwDazPg6Tw=; b=ouxCdVIPDTnoqzsJUQXtST
	SW++jnDmlSChVN7g7jjSSr2GEdqI+8pYUzeH9o9p++NAQ3/sVjZkebO5YpmRU+XZ
	Rs/pa96kU3ljTUuOjyojPDxFAbTVOqHFbFZwqZuXknf9srEXiKRTFwAh2eECKbJ5
	Bx0/Mg6BeU9yHjZ9z1yULD+PVzlTl5qIRdX9PpPN3pAu57283gjeW7fQ0y5GaNGX
	lKqVJQxugAEJj4Kh5bsGGI26I4wUQBDyMGpJL9kEPYLJXb10rK99tN7ND/qcvg2n
	RDDq0tlSnZ7qaIVPtFsRydTEdeoGMk3/KAoPC6T+IEtzDhbHw5AOT7UZFoQyMt5g
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j34g1npam-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 27 Nov 2026 15:43:47 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE4ETH3998991;
	Fri, 27 Nov 2026 15:43:46 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4j6x3h2p98-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Nov 2026 15:43:44 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6ARFhcV947186264
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Nov 2026 15:43:38 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 535392005A;
	Fri, 27 Nov 2026 15:43:38 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A04F22004B;
	Fri, 27 Nov 2026 15:43:34 +0000 (GMT)
Received: from [9.111.162.114] (unknown [9.111.162.114])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 27 Nov 2026 15:43:34 +0000 (GMT)
Message-ID: <a07554af-f6df-4a7f-a656-d01b8bc6ab6a@linux.ibm.com>
Date: Fri, 27 Nov 2026 16:43:34 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 12/30] x86/unwind: Add Minimal DWARF CFI kernel
 unwinder
To: Ian Rogers <irogers@google.com>, linux-kernel@vger.kernel.org,
        linux-trace-kernel@vger.kernel.org, linux-arch@vger.kernel.org
Cc: jpoimboe@kernel.org, rostedt@goodmis.org, peterz@infradead.org,
        mingo@redhat.com, tglx@kernel.org, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, catalin.marinas@arm.com,
        will@kernel.org, mark.rutland@arm.com,
        linux-arm-kernel@lists.infradead.org, pjw@kernel.org,
        palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
        linux-riscv@lists.infradead.org, acme@kernel.org, namhyung@kernel.org,
        linux-perf-users@vger.kernel.org, mhiramat@kernel.org, ast@kernel.org,
        daniel@iogearbox.net, andrii@kernel.org, bpf@vger.kernel.org,
        nathan@kernel.org, llvm@lists.linux.dev, nsc@kernel.org,
        linux-kbuild@vger.kernel.org, ojeda@kernel.org,
        rust-for-linux@vger.kernel.org, ardb@kernel.org,
        linux-efi@vger.kernel.org, maz@kernel.org, oupton@kernel.org,
        kvmarm@lists.linux.dev, shuah@kernel.org,
        linux-kselftest@vger.kernel.org, indu.bhagat@oracle.com,
        wnliu@google.com, dylanbhatch@google.com
References: <20261125061523.1540234-1-irogers@google.com>
 <20261125061523.1540234-13-irogers@google.com>
Content-Language: en-US
From: Jens Remus <jremus@linux.ibm.com>
Organization: IBM Deutschland Research & Development GmbH
In-Reply-To: <20261125061523.1540234-13-irogers@google.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: 5ZJeZ4dRYLWKasNlVNFN_HgzbYFJrPH2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA2MiBTYWx0ZWRfX3ppIf7DvuI0B
 vCLEIduUtrcdh1ifjCJ30YvokvPQxXSoffMeR6OCQbDbZZlYU+s04lE4FKdQSzPHvl5DeT/nsPk
 HYln2faN13fSVAO423AD3Vi7w0XWYeI=
X-Proofpoint-GUID: kfW7DRO-7vrKBDiqgdjT-kZh031cAVz2
X-Authority-Analysis: v=2.4 cv=c8M+0h9l c=1 sm=1 tr=0 ts=6b09a534 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=VnNF1IyMAAAA:8
 a=1XWaLZrsAAAA:8 a=w5RBXh3AvzieJi7Cyr8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA2MiBTYWx0ZWRfX3qAzkgNtC0R4
 HUyG6CTQOWPyYas2a2ejLw5Sj5SkgS+QrLoDYBCI/EAzMCTtw9O3tNX/G5nGF98UhevvaMdJVtJ
 pr1KvXtTIF+qBHW6b5LH97yXYLtnzMmuu8kPoL+zW1Cv8i3Aj4z8LcGwX3K4YypRtAv4zNndM9i
 wfHgY2arEijRcZkQ4ZIXMrNjIeyx6iM/1NcRaSBz18OqH8naX/KUse5ovf9oVT9hsZw36H3UW3L
 /e/Qn2JUTNuhsH6F4/oF7RHIEIekrRKJTTS7u5t9jpDXdFjCVQpR5zovcNKKfcWsIhIKKW8NslY
 HzQ7pcW2dMfkFomCCT7lH+LeybRe/MSuQ11Z4ZN0qinIYMAIENvpk1/7/eM+4RJYhijppy7nuAP
 cJDGtQcsa+zjcbRtV6WV18OsJEe0qjzbBkI1JX1Ozc8T29bBR34fOPSiPudo98JgaSuCi6Lzkt3
 g8rf7PJ+1CZxrm8hZqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1011 malwarescore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_074436_369942_1A57BB06 
X-CRM114-Status: GOOD (  21.99  )
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
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGVsbG8gSWFuLAoKc29tZSBlYXJseSBmZWVkYmFjay4KCk9uIDExLzI1LzIwMjYgNzoxNSBBTSwg
SWFuIFJvZ2VycyB3cm90ZToKPiBBZGQgQ09ORklHX1VOV0lOREVSX0RXQVJGX0NGSSBhcyBhIHNl
bGVjdGFibGUgeDg2LTY0IGtlcm5lbCBzdGFjawo+IHVud2luZGVyIGluIGFyY2gveDg2L2tlcm5l
bC91bndpbmRfZHdhcmYuYywgaW1wbGVtZW50aW5nIHRoZSBhc20vdW53aW5kLmgKPiBhbmQgSEFW
RV9SRUxJQUJMRV9TVEFDS1RSQUNFIGludGVyZmFjZXMgb3ZlciBjb21waWxlci1nZW5lcmF0ZWQK
PiAuZWhfZnJhbWUgYW5kIGxpbmtlci1nZW5lcmF0ZWQgLS1laC1mcmFtZS1oZHIgdGFibGVzOgo+
ICAtIEJ1aWxkIGtlcm5lbCBDIGFuZCBSdXN0IG9iamVjdHMgd2l0aCBhc3luY2hyb25vdXMgdW53
aW5kIHRhYmxlcyBhbmQKPiAgICAtZm9taXQtZnJhbWUtcG9pbnRlciB3aGlsZSBzdXBwcmVzc2lu
ZyB1bndpbmQgdGFibGVzIGluIGJvb3Qvc3RhcnR1cAo+ICAgIGFuZCBwdXJnYXRvcnkgb2JqZWN0
cy4KPiAgLSBQbGFjZSAuZWhfZnJhbWVfaGRyIGFuZCAuZWhfZnJhbWUgaW5zaWRlIFJPX0RBVEEg
dmlhCj4gICAgQVJDSF9ST0RBVEFfU0VDVElPTlMsIGluZGV4IGxvYWRhYmxlIG1vZHVsZSAuZWhf
ZnJhbWUgc2VjdGlvbnMgdmlhCj4gICAgZHdhcmZfY2ZpX21vZF9hbGxvYygpL2R3YXJmX2NmaV9t
b2RfZnJlZV9yY3UoKSwgYW5kIGVuYWJsZSBCUEYKPiAgICBleGNlcHRpb24gc3RhY2sgd2Fsa3Mg
aW4gYXJjaC94ODYvbmV0L2JwZl9qaXRfY29tcC5jLgo+ICAtIFVud2luZCBhY3Jvc3MgdGFzaywg
SVJRLCBleGNlcHRpb24sIGZ0cmFjZSwgZmdyYXBoLCByZXRob29rLCBCUEYsIGFuZAo+ICAgIGNh
bGxfb25fc3RhY2soKSBmcmFtZXMsIHdoaWxlIHJlamVjdGluZyBpbi1rZXJuZWwgcHRfcmVncyBl
eGNlcHRpb24KPiAgICBib3VuZGFyaWVzIGluIGFyY2hfc3RhY2tfd2Fsa19yZWxpYWJsZSgpLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IElhbiBSb2dlcnMgPGlyb2dlcnNAZ29vZ2xlLmNvbT4KCj4gZGlm
ZiAtLWdpdCBhL2FyY2gveDg2L2tlcm5lbC91bndpbmRfZHdhcmYuYyBiL2FyY2gveDg2L2tlcm5l
bC91bndpbmRfZHdhcmYuYwoKPiArLyoqCj4gKyAqIHVud2luZF9uZXh0X2ZyYW1lKCkgLSBBZHZh
bmNlIEBzdGF0ZSB0byB0aGUgbmV4dCBvdXRlciB4ODYtNjQga2VybmVsIGZyYW1lCj4gKyAqIEBz
dGF0ZTogQ3VycmVudCB4ODYgdW53aW5kIHN0YXRlLgo+ICsgKgo+ICsgKiBFdmFsdWF0ZXMgTWlu
aW1hbCBEV0FSRiBDRkkgZm9yIEBzdGF0ZS0+aXAsIGhhbmRsZXMgdG9wLW9mLXN0YWNrIHRhc2sK
PiArICogcHRfcmVncywgYXJjaF9yZXRob29rX3RyYW1wb2xpbmUgZW50cnksICVyc3AtdmVyaWZp
ZWQgRU5DT0RFX0ZSQU1FX1BPSU5URVIKPiArICogZW50cnkvZXhjZXB0aW9uIHB0X3JlZ3MgdHJh
bnNpdGlvbnMsIGFuZCBjYWxsX29uX3N0YWNrKCkgSVJRIHN0YWNrIHBpdm90cy4KPiArICoKPiAr
ICogUmV0dXJuOiB0cnVlIGlmIGEgdmFsaWQgb3V0ZXIgZnJhbWUgd2FzIHVud291bmQsIG9yIGZh
bHNlIHdoZW4gdGhlIGJvdHRvbSBvZgo+ICsgKiB0aGUgc3RhY2sgaXMgcmVhY2hlZCBvciBhbiBl
cnJvciB0ZXJtaW5hdGVzIHRoZSB3YWxrLgo+ICsgKi8KPiArYm9vbCB1bndpbmRfbmV4dF9mcmFt
ZShzdHJ1Y3QgdW53aW5kX3N0YXRlICpzdGF0ZSkKPiArewouLi4KCj4gKwkJLyoKPiArCQkgKiBV
bmVuY29kZWQgZW50cnkgYXNzZW1ibHkgKHByZS1FTkNPREVfRlJBTUVfUE9JTlRFUiBvcgo+ICsJ
CSAqIHBvc3QtUE9QX1JFR1MpIG9yIGFuIHVuYWxpZ25lZC9lbmNvZGVkICVyYnAgY2Fubm90IGJl
Cj4gKwkJICogdW53b3VuZCB2aWEgYSBmcmFtZS1wb2ludGVyIGd1ZXNzLgo+ICsJCSAqLwo+ICsJ
CWlmIChpbl9lbnRyeV90ZXh0KHN0YXRlLT5pcCkgfHwgKHN0YXRlLT5icCAmIChzaXplb2YobG9u
ZykgLSAxKSkpCj4gKwkJCWdvdG8gZXJyOwo+ICsKPiArCQkvKiBGYWxsYmFjayB0byBmcmFtZS1w
b2ludGVyIGd1ZXNzIGFuZCBtYXJrIHVucmVsaWFibGUgKi8KPiArCQlyb3cgPSBicGZfZnBfcm93
Owo+ICsJCXN0YXRlLT5lcnJvciA9IHRydWU7Cj4gKwl9Cj4gKwpNYXliZSBhZGQgYSBjb21tZW50
IHRoYXQgdGhlIFVOREVGSU5FRCBydWxlIGluZGljYXRlcyB0aGF0IHRoZSBvdXRlcm1vc3QKZnJh
bWUgaGFzIGJlZW4gcmVhY2hlZD8KCgkvKiBSQSB1bmRlZmluZWQgaW5kaWNhdGVzIG91dGVybW9z
dCBmcmFtZSByZWFjaGVkICovCgo+ICsJaWYgKHJvdy5yYV9ydWxlID09IERXQVJGX0NGSV9SVUxF
X1VOREVGSU5FRCkKPiArCQlnb3RvIHRoZV9lbmQ7Cj4gKwo+ICsJaWYgKHJvdy5yYV9ydWxlICE9
IERXQVJGX0NGSV9SVUxFX09GRlNFVCkKPiArCQlnb3RvIGVycjsKCkdvb2Q6IEZvciBSQSBydWxl
IG9ubHkgT0ZGU0VUIGlzIHN1cHBvcnRlZC4gIFNQIGFuZCBGUCBydWxlcyBtYXkgbmVlZApjaGVj
a2luZyAoc2VlIGJlbG93KS4KCj4gKwo+ICsJc3dpdGNoIChyb3cuY2ZhX2Jhc2UpIHsKPiArCWNh
c2UgRFdBUkZfQ0ZJX0JBU0VfU1A6IHsKPiArCQl1bnNpZ25lZCBsb25nIHNwX2Jhc2UgPSBzdGF0
ZS0+c3A7Cj4gKwo+ICsJCS8qCj4gKwkJICogY2FsbF9vbl9zdGFjaygpIHN0b3JlcyB0aGUgcHJl
LXN3aXRjaCB0YXNrLXN0YWNrICVyc3AgYXQgdGhlCj4gKwkJICogdG9wIHNsb3Qgb2YgdGhlIHBl
ci1DUFUgSVJRIHN0YWNrIChpbmZvLmVuZCAtIDEpIGFuZCBwaXZvdHMKPiArCQkgKiAlcnNwIHRo
ZXJlIGJlZm9yZSBpbnZva2luZyB0aGUgSVJRL3NvZnRpcnEgaGFuZGxlci4KPiArCQkgKi8KPiAr
CQlpZiAoc3RhdGUtPnN0YWNrX2luZm8udHlwZSA9PSBTVEFDS19UWVBFX0lSUSAmJgo+ICsJCSAg
ICBzdGF0ZS0+c3AgPT0gKHVuc2lnbmVkIGxvbmcpKHN0YXRlLT5zdGFja19pbmZvLmVuZCAtIDEp
KSB7Cj4gKwkJCWlmICghZGVyZWZfc3RhY2tfcmVnKHN0YXRlLCBzdGF0ZS0+c3AsICZzcF9iYXNl
KSkKPiArCQkJCWdvdG8gZXJyOwo+ICsJCX0KPiArCQljZmEgPSBzcF9iYXNlICsgcm93LmNmYV9v
ZmY7Cj4gKwkJYnJlYWs7Cj4gKwl9Cj4gKwljYXNlIERXQVJGX0NGSV9CQVNFX0ZQOgo+ICsJCWNm
YSA9IHN0YXRlLT5icCArIHJvdy5jZmFfb2ZmOwo+ICsJCWJyZWFrOwo+ICsJY2FzZSBEV0FSRl9D
RklfQkFTRV9GUF9JTkRJUkVDVDoKPiArCQlpZiAoIWRlcmVmX3N0YWNrX3JlZyhzdGF0ZSwgc3Rh
dGUtPmJwICsgcm93LmNmYV9vZmYsICZjZmEpKQo+ICsJCQlnb3RvIGVycjsKPiArCQlicmVhazsK
PiArCWNhc2UgRFdBUkZfQ0ZJX0JBU0VfUkVHOgo+ICsJCWlmICghZ2V0X3NjcmF0Y2hfcmVnKHN0
YXRlLCByb3cuY2ZhX3JlZywgJmNmYSkpCj4gKwkJCWdvdG8gZXJyOwo+ICsJCWNmYSArPSByb3cu
Y2ZhX29mZjsKPiArCQlicmVhazsKPiArCWRlZmF1bHQ6Cj4gKwkJZ290byBlcnI7Cj4gKwl9Cj4g
Kwo+ICsJaXBfcCA9IGNmYSArIHJvdy5yYV9vZmY7Cj4gKwlpZiAoIWRlcmVmX3N0YWNrX3JlZyhz
dGF0ZSwgaXBfcCwgJnN0YXRlLT5pcCkpCj4gKwkJZ290byBlcnI7Cj4gKwo+ICsJc3RhdGUtPmlw
ID0gZHdhcmZfcmVjb3Zlcl9yZXRfYWRkcihzdGF0ZSwgc3RhdGUtPmlwLAo+ICsJCQkJCSAgICh1
bnNpZ25lZCBsb25nICopaXBfcCk7Cj4gKwlpZiAoIXN0YXRlLT5pcCB8fCBkd2FyZl9pc19yZXRo
b29rX3RyYW1wb2xpbmUoc3RhdGUtPmlwKSkKPiArCQlnb3RvIGVycjsKPiArI2lmZGVmIENPTkZJ
R19GVU5DVElPTl9HUkFQSF9UUkFDRVIKPiArCWlmIChzdGF0ZS0+aXAgPT0gKHVuc2lnbmVkIGxv
bmcpcmV0dXJuX3RvX2hhbmRsZXIpCj4gKwkJZ290byBlcnI7Cj4gKyNlbmRpZgo+ICsKPiArCWlm
IChyb3cuZnBfcnVsZSA9PSBEV0FSRl9DRklfUlVMRV9PRkZTRVQpIHsKPiArCQlpZiAoIWRlcmVm
X3N0YWNrX3JlZyhzdGF0ZSwgY2ZhICsgcm93LmZwX29mZiwgJnN0YXRlLT5icCkpCj4gKwkJCWdv
dG8gZXJyOwo+ICsJfSBlbHNlIGlmIChyb3cuZnBfcnVsZSA9PSBEV0FSRl9DRklfUlVMRV9GUF9P
RkZTRVQpIHsKPiArCQlpZiAoIWRlcmVmX3N0YWNrX3JlZyhzdGF0ZSwgc3RhdGUtPmJwICsgcm93
LmZwX29mZiwgJnN0YXRlLT5icCkpCj4gKwkJCWdvdG8gZXJyOwo+ICsJfQoKSUlVQyBhbnkgb3Ro
ZXIgRlAgcnVsZSBmYWxscyB0aHJvdWdoIGFuZCBpcyBpbXBsaWNpdGx5IGhhbmRsZWQgYXMgU0FN
RS4KRnVydGhlcm1vcmUgcm93LnNwX3J1bGUgaXMgbm90IGNoZWNrZWQgYW55d2hlcmUsIHNvIHRo
YXQgYW55IFNQIHJ1bGUgaXMKZXhwbGljaXRseSBoYW5kbGVkIGFzIFNQID0gQ0ZBLiAgVGhlIGlt
cGxlbWVudGF0aW9ucyBmb3IgdGhlIG90aGVyIGFyY2hzCmFyZSBzaW1pbGFyLiAgTWF5YmUgSSBh
bSBtaXNzaW5nIHNvbWV0aGluZy4KCj4gKwo+ICsJc3RhdGUtPnNwID0gY2ZhOwo+ICsJc3RhdGUt
PnJlZ3MgPSBOVUxMOwo+ICsJc3RhdGUtPnByZXZfcmVncyA9IE5VTEw7Cj4gKwlzdGF0ZS0+ZnVs
bF9yZWdzID0gZmFsc2U7Cj4gKwlzdGF0ZS0+c2lnbmFsID0gcm93LnNpZ25hbDsKPiArClJlZ2Fy
ZHMsCkplbnMKLS0gCkplbnMgUmVtdXMKTGludXggb24gWiBEZXZlbG9wbWVudCAoRDMzMDMpCmpy
ZW11c0BkZS5pYm0uY29tIC8ganJlbXVzQGxpbnV4LmlibS5jb20KCklCTSBEZXV0c2NobGFuZCBS
ZXNlYXJjaCAmIERldmVsb3BtZW50IEdtYkg7IFZvcnNpdHplbmRlciBkZXMgQXVmc2ljaHRzcmF0
czogV29sZmdhbmcgV2VuZHQ7IEdlc2Now6RmdHNmw7xocnVuZzogRGF2aWQgRmFsbGVyOyBTaXR6
IGRlciBHZXNlbGxzY2hhZnQ6IEVobmluZ2VuOyBSZWdpc3RlcmdlcmljaHQ6IEFtdHNnZXJpY2h0
IFN0dXR0Z2FydCwgSFJCIDI0MzI5NApJQk0gRGF0YSBQcml2YWN5IFN0YXRlbWVudDogaHR0cHM6
Ly93d3cuaWJtLmNvbS9wcml2YWN5LwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
