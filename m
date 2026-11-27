Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7177606A32D
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Nov 2026 15:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=t2UNSbzu;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nn/hj00N
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=69xSCUKnI90Q4ZAM5oSjR5PUgGjjPmTDPSbBUBBAj6U=; b=t2UNSbzuEPltpPA1c36d5VjuIL
	QKPQS1XbTdV870iIG34l/vw8JzOIDu/doD7fCBelssw19RGJiQUFj0YSQKJBf/kbgSLw7P5TyJZ/L
	dK2gU8+6l3iOzaMPXwtG7cZ4YUAAtP8TD1+Ndq2LHQiHr1hbGX00QxooPQ09alB42yeMMCz+VO2aS
	eYKe0O5+WKdT4argn3oSXUUec2RwgGt4r83T4q7bQJbbXK7vlxDK7aKIUddvtJGU5ZUXW5hdqUhn9
	rCvlKuNpURhebvq8I9SCHtBddSKkJPmhxewwnXJFG7U6PTv666eUydq3u6dlX1VjAh6szg/PiqPXY
	SDlQfksQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWy1Y-0000000Gs7j-433g;
	Fri, 27 Nov 2026 15:38:08 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWy1V-0000000Gs5i-11dB;
	Fri, 27 Nov 2026 15:38:07 +0000
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE4sZS3266007;
	Fri, 27 Nov 2026 15:37:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=wSDkFl
	m4jY6UNA0o3Zt5f5H/V94IK7NSFsorwTBkxTg=; b=nn/hj00NgZJYb5SXVZhx2Z
	kNkF85lXdR5x+V+fqdDyxJ5qYh+Gqipxe0MXks2I/k/un6fKwJ3RJaiTxctQaP3z
	nCMk1w00QNknlcaL+IOfEC7OeTi8YZ0MRCNvCUsHFIsIoo2c9niAfPaklcJTFebi
	qkJGjLSH4y4xq/eFyQ1U5fWtVLz7iulTZYM+peO9uvVRKsefY4CRYRSxQc+DaKCn
	lGJi0Jwl+FH3u48VV2G3+qhvTDQk1AnZhUUL+VXF5QXvZEDDGj4oIQwJIvS7hrbY
	5qJpcAuXFjFaWRPge4t52PMZGfS4F+OreQ8l8CHyb2ZpBdA7WTO85cQAzXNB62ag
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j34g1nns7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 27 Nov 2026 15:37:14 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE4Hec2819251;
	Fri, 27 Nov 2026 15:37:13 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4j5kfaarn6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Nov 2026 15:37:13 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6ARFb8ha49676778
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Nov 2026 15:37:11 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 915132004F;
	Fri, 27 Nov 2026 15:37:08 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0CC8F2004E;
	Fri, 27 Nov 2026 15:37:05 +0000 (GMT)
Received: from [9.111.162.114] (unknown [9.111.162.114])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 27 Nov 2026 15:37:04 +0000 (GMT)
Message-ID: <a98fab70-48fa-4640-88d2-a7a08f523128@linux.ibm.com>
Date: Fri, 27 Nov 2026 16:37:04 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jens Remus <jremus@linux.ibm.com>
Subject: Re: [RFC PATCH v2 01/30] unwind: Add Minimal DWARF CFI bytecode
 interpreter
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
 <20261125061523.1540234-2-irogers@google.com>
Content-Language: en-US
Organization: IBM Deutschland Research & Development GmbH
In-Reply-To: <20261125061523.1540234-2-irogers@google.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: brvXg_RJUZTQu5mAUmnatHUtcWzdDrrf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA2MiBTYWx0ZWRfX+qzyyuyu1B+R
 /ruRXWo/zu5u+2/Z0LaCtY3N+BUb8znffYTTtu+NHKiNIaooKN3ELdx20GOt2uvxx7P5wXL+1+A
 cpcYOaHmrjyz1MF/V7sVGbOPBX+fEdk=
X-Proofpoint-GUID: wK7aymzh3GdSqbeQ85e9O3Dhs5dNAbYJ
X-Authority-Analysis: v=2.4 cv=c8M+0h9l c=1 sm=1 tr=0 ts=6b09a3ab cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=VnNF1IyMAAAA:8
 a=1XWaLZrsAAAA:8 a=M8zXbRpaHz8_b2Mss2oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=O8hF6Hzn-FEA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA2MiBTYWx0ZWRfX4HPNbmoz03PS
 bjSpWwHbVDc6A2l18C+xFCEmA5d1gCfAti1AE4Q1SzAW+XWH1dJfaPQdyS4stAn2G+cg/1aAUvf
 uRdgrMyWaeQO3VhqDkxGUuZ2cKaGcV1OBrcozmGInTBrfeDXb6RQrK4KxWwkAtf42OotKBIWdHe
 BceGetoE/nBLl99++V5H3LEeU1J4HIw9TYbDgVEuk9GuJR2pdZKKa9D/CsYi8ZDqJARO/x5ufyD
 2Jpgbhn/gZMqp0o8TMTsgQaOMNwvalX4PYiAfWhyhXyVAi/esM70kJBhZWD9wMlkR/aiDWPBf4i
 xwqUtmTmLdRda/+RZJvu1W41t85aw+igiTDUK8MpVNp9G1dcUK9mU62x9+jkJKQaVc9srXlgnZB
 Ih3tcpQ1UlqbOBvPf5aIAVXxJ3jGYc131ZTQb9l7oa6JZzH2VjFqr7PCIm5nNDsFOCNVU4nM1HJ
 FsYR8R2QvfZiN/PT/7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1011 malwarescore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_073805_451423_4E30C75D 
X-CRM114-Status: GOOD (  23.60  )
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

SGVsbG8gSWFuLAoKZ3JlYXQgd29yaywgSSBsaWtlIGl0ISAgSSBhbSB3b3JraW5nIG9uIGFkZGlu
ZyBzMzkwIHN1cHBvcnQgb24gdG9wIG9mCnlvdXIgc2VyaWVzLiAgU29tZSBlYXJseSBmZWVkYmFj
ay4KCk9uIDExLzI1LzIwMjYgNzoxNCBBTSwgSWFuIFJvZ2VycyB3cm90ZToKPiBBZGQgYSBzdHJp
Y3RseSBib3VuZGVkIERXQVJGIENhbGwgRnJhbWUgSW5mb3JtYXRpb24gKC5laF9mcmFtZSAvCj4g
LmVoX2ZyYW1lX2hkcikgaW50ZXJwcmV0ZXIgKENPTkZJR19VTldJTkRfRFdBUkZfQ0ZJKSBtYXRj
aGluZyBTRnJhbWUncwo+IHN0YWNrLXVud2luZGluZyBzdGF0ZSBtb2RlbCBhbmQgc2VjdXJpdHkg
cHJvcGVydGllcywgd2l0aG91dCByZXF1aXJpbmcKPiBuZXcgdG9vbGNoYWluIHNlY3Rpb25zIG9y
IGR1cGxpY2F0aW5nIHVzZXItc3BhY2UgdW53aW5kIG1ldGFkYXRhLgo+IAo+IEluc3RlYWQgb2Yg
aW1wbGVtZW50aW5nIGEgZ2VuZXJhbCBEV0FSRiBleHByZXNzaW9uIHZpcnR1YWwgbWFjaGluZSBv
cgo+IHRyYWNraW5nIGFyYml0cmFyeSBhcmNoaXRlY3R1cmFsIHJlZ2lzdGVyIGFycmF5cywgc3Ry
dWN0IGR3YXJmX2NmaV9yb3cKPiB0cmFja3Mgb25seToKPiAgLSBDRkEgPSAoU1AgfCBGUCB8IHBy
b2xvZ3VlIHNjcmF0Y2ggcmVnKSArIGNmYV9vZmYsIG9yIGZpeGVkLXBhdHRlcm4KPiAgICBpbmRp
cmVjdCBDRkEgKihGUCArIG9mZikgKERSQVAgc3RhY2sgcmVhbGlnbm1lbnQpIC8gKihTUCArIG9m
ZikKPiAgICAoc2lnbmFsIHRyYW1wb2xpbmVzKQo+ICAtIFN0YWNrIHBvaW50ZXIgc2F2ZSBydWxl
IChTQU1FIG9yICooQ0ZBICsgb2ZmKSkgZm9yIHNpZ25hbCBmcmFtZXMgdGhhdAo+ICAgIHNhdmUg
U1AgaW4gc2lnY29udGV4dCAoc3VjaCBhcyAzMi1iaXQgeDg2IHZkc28zMiBfX2tlcm5lbF9ydF9z
aWdyZXR1cm4pCj4gIC0gRnJhbWUgcG9pbnRlciBzYXZlIHJ1bGUgKFNBTUUsICooQ0ZBICsgb2Zm
KSwgKihGUCArIG9mZiksICooU1AgKyBvZmYpKQo+ICAtIFJldHVybiBhZGRyZXNzIHNhdmUgcnVs
ZSAoU0FNRSBpbiBsaW5rIHJlZ2lzdGVyLCAqKENGQSArIG9mZiksCj4gICAgKihTUCArIG9mZiks
IG9yIFVOREVGSU5FRCBmb3IgYm90dG9tLW9mLXN0YWNrIHRlcm1pbmF0aW9uKSwgcGx1cwo+ICAg
IEFBcmNoNjQgUEFDLVJFVCBzaWduaW5nIHN0YXRlIChEV19DRkFfQUFSQ0g2NF9uZWdhdGVfcmFf
c3RhdGUpCj4gCj4gQ2FsbGVlLXNhdmVkIGdlbmVyYWwtcHVycG9zZSByZWdpc3RlciBzcGlsbC9y
ZXN0b3JlIG9wY29kZXMgYXJlIGRlY29kZWQKPiBhbmQgaWdub3JlZCBpbiBPKDEpIHNwYWNlLiBH
ZW5lcmFsIERXX09QXyogZXhwcmVzc2lvbnMsIERXX0NGQV9zZXRfbG9jCj4gYmFja3dhcmQgUEMg
anVtcHMsIGFuZCBEV19DRkFfcmVnaXN0ZXIgcnVsZXMgb24ge1NQLCBGUCwgUkF9IGFyZQo+IHJl
amVjdGVkIHdpdGggLUVJTlZBTDsgRFdfRUhfUEVfaW5kaXJlY3QgZW5jb2RpbmdzIGFyZSByZWpl
Y3RlZCB3aGVuZXZlcgo+IGFuIGVuY29kZWQgYWRkcmVzcyBpcyBldmFsdWF0ZWQgKHdoaWxlIHVu
dXNlZCAnUCcvJ0wnIENJRSBhdWdtZW50YXRpb24KPiBmaWVsZHMgYXJlIHNraXBwZWQgYnkgZW5j
b2RlZCB3aWR0aCB3aXRob3V0IGRlcmVmZXJlbmNpbmcpLiBDSUVzCj4gKDw9IDEyOCBCKSwgRkRF
cyAoPD0gNDA5NiBCKSwgTEVCMTI4IG9wZXJhbmRzICg8PSA1IEIpLCBhbmQKPiBEV19DRkFfcmVt
ZW1iZXJfc3RhdGUgbmVzdGluZyAoPD0gNCBlbnRyaWVzKSBleGVjdXRlIGluIGEgc2luZ2xlIGZv
cndhcmQKPiBwYXNzIHdpdGggemVybyBkeW5hbWljIG1lbW9yeSBhbGxvY2F0aW9ucywgemVybyBs
b2NrcywgS01TQU4gb3V0cHV0Cj4gdW5wb2lzb25pbmcsIG5vaW5zdHIga2VybmVsLW1lbW9yeSBl
bnRyeSBwb2ludHMsIGFuZCBTcGVjdHJlIHYxIC8gdjEuMQo+IG5vc3BlYyBoYXJkZW5pbmcgKGFy
cmF5X2luZGV4X25vc3BlYygpIGFuZCBiYXJyaWVyX25vc3BlYygpKS4KPiAKPiBBbHNvIHByb3Zp
ZGUgc2hhcmVkIFJDVS1zYWZlIGxvYWRhYmxlLW1vZHVsZSAuZWhfZnJhbWUgaW5kZXhpbmcgaGVs
cGVycwo+IHVzaW5nIGt2bWFsbG9jKCkva3ZmcmVlX3JjdV9taWdodHNsZWVwKCkgKGR3YXJmX2Nm
aV9tb2RfYWxsb2MoKSwKPiBkd2FyZl9jZmlfbW9kX2ZyZWVfcmN1KCksIGR3YXJmX2NmaV9tb2Rf
ZXZhbCgpKS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBJYW4gUm9nZXJzIDxpcm9nZXJzQGdvb2dsZS5j
b20+Cgo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3Vud2luZF9kd2FyZl9jZmkuaCBiL2lu
Y2x1ZGUvbGludXgvdW53aW5kX2R3YXJmX2NmaS5oCgo+ICsvKioKPiArICogZW51bSBkd2FyZl9j
ZmlfcnVsZSAtIFJlY292ZXJ5IHJ1bGUgZm9yIGNhbGxlcidzIFNQLCBGUCwgb3IgcmV0dXJuIGFk
ZHJlc3MKPiArICogQERXQVJGX0NGSV9SVUxFX1NBTUU6IFJlZ2lzdGVyIHJldGFpbnMgaXRzIHZh
bHVlIGZyb20gdGhlIGN1cnJlbnQgZnJhbWUKPiArICogICAgICAgICAgICAgICAgICAgICAgIChv
ciBkZWZhdWx0cyB0byBDRkEgZm9yIFNQKS4KPiArICogQERXQVJGX0NGSV9SVUxFX09GRlNFVDog
U2F2ZWQgb24gdGhlIHN0YWNrIGF0ICooQ0ZBICsgb2ZmKS4KPiArICogQERXQVJGX0NGSV9SVUxF
X0ZQX09GRlNFVDogU2F2ZWQgcmVsYXRpdmUgdG8gRlAgYXQgKihGUCArIG9mZikgKERSQVAgZnJh
bWUpLgo+ICsgKiBARFdBUkZfQ0ZJX1JVTEVfU1BfT0ZGU0VUOiBTYXZlZCByZWxhdGl2ZSB0byBT
UCBhdCAqKFNQICsgb2ZmKSAoc2lnZnJhbWUpLgoKRm9yIHMzOTAgc3VwcG9ydCBJIHBsYW4gdG8g
YWRkIHRoZSBmb2xsb3dpbmc6CgpGb3IgdGhlIGltcGxpY2l0IERXX0NGQV92YWxfb2Zmc2V0KFNQ
LCAtMTYwKSBydWxlLCBhcyB0aGUgQ0ZBIGlzIGRlZmluZWQKYXMgU1AgYXQgY2FsbCBzaXRlICsg
MTYwOgoKICogQERXQVJGX0NGSV9SVUxFX1ZBTF9PRkZTRVQ6IFZhbHVlIGlzIENGQSArIG9mZjsg
b25seSB1c2VkIGZvciBTUC4KCkZvciBEV19DRkFfcmVnaXN0ZXIgKG1vc3RseSB1c2VkIGluIGxl
YWQgZnVuY3Rpb25zIHRvIHNhdmUgRlAgYW5kIFJBIGFzCndlbGwgYXMgU1ApOgoKICogQERXQVJG
X0NGSV9SVUxFX1JFR1tJU1RFUl06IFNhdmVkIGluIGFub3RoZXIgcmVnaXN0ZXIuCgo+ICsgKiBA
RFdBUkZfQ0ZJX1JVTEVfVU5ERUZJTkVEOiBFeHBsaWNpdGx5IHVuZGVmaW5lZCAoRFdfQ0ZBX3Vu
ZGVmaW5lZCk7IG1hcmtzCj4gKyAqICAgICAgICAgICAgICAgICAgICAgICAgICAgIHRoZSBib3R0
b20gb2YgYSBzdGFjayAoZS5nLiBfc3RhcnQgb3IgY2xvbmUpLgo+ICsgKi8KPiArZW51bSBkd2Fy
Zl9jZmlfcnVsZSB7Cj4gKwlEV0FSRl9DRklfUlVMRV9TQU1FID0gMCwKPiArCURXQVJGX0NGSV9S
VUxFX09GRlNFVCwKPiArCURXQVJGX0NGSV9SVUxFX0ZQX09GRlNFVCwKPiArCURXQVJGX0NGSV9S
VUxFX1NQX09GRlNFVCwKPiArCURXQVJGX0NGSV9SVUxFX1VOREVGSU5FRCwKPiArfTsKPiArCj4g
Ky8qKgo+ICsgKiBzdHJ1Y3QgZHdhcmZfY2ZpX2FyY2ggLSBBcmNoaXRlY3R1cmUgRFdBUkYgcmVn
aXN0ZXIgbnVtYmVycyBhbmQgd29yZCBzaXplCgpGb3IgczM5MCBzdXBwb3J0IEkgcGxhbiB0byBh
ZGQ6CgogKiBAc3Bfb2ZmOiBJbml0aWFsIFNQIG9mZnNldCBmcm9tIHRoZSBDRkEgdW5sZXNzIGEg
Q0lFIGluc3RydWN0aW9uIHNheXMKICogICAgICAgICAgb3RoZXJ3aXNlLCBjYWxsZXIgU1AgPSBD
RkEgKyBAc3Bfb2ZmLgogKiAgICAgICAgICAwIG9uIG1vc3QgQUJJczsgLTE2MCBvbiBzMzkwLCB3
aGVyZSBDRkEgPSBjYWxsZXIgU1AgKyAxNjAuCgpUaGF0IHdvdWxkIGJlIHVzZWQgaW4gZHdhcmZf
Y2ZpX3BhcnNlX2NpZSgpIHRvIGluaXRpYWxpemUgdGhlIFNQIHJ1bGUKYW5kIG9mZnNldC4KCj4g
KyAqIEB3czogVGFyZ2V0IGFkZHJlc3Mvd29yZCBzaXplIGluIGJ5dGVzICg0IG9yIDgpLgo+ICsg
KiBAc3BfcmVnOiBEV0FSRiByZWdpc3RlciBudW1iZXIgZm9yIHRoZSBzdGFjayBwb2ludGVyLgo+
ICsgKiBAZnBfcmVnOiBEV0FSRiByZWdpc3RlciBudW1iZXIgZm9yIHRoZSBmcmFtZSBwb2ludGVy
Lgo+ICsgKiBAcmFfcmVnOiBEZWZhdWx0IERXQVJGIHJldHVybi1hZGRyZXNzIGNvbHVtbiBudW1i
ZXIuCj4gKyAqLwo+ICtzdHJ1Y3QgZHdhcmZfY2ZpX2FyY2ggewo+ICsJdTggd3M7Cj4gKwl1OCBz
cF9yZWc7Cj4gKwl1OCBmcF9yZWc7Cj4gKwl1OCByYV9yZWc7Cj4gK307Cj4gKwo+ICsvKioKPiAr
ICogc3RydWN0IGR3YXJmX2NmaV9yb3cgLSBFdmFsdWF0ZWQgTWluaW1hbCBEV0FSRiB1bndpbmQg
c3RhdGUgYXQgYSB0YXJnZXQgUEMKPiArICogQGNmYV9vZmY6IEJ5dGUgb2Zmc2V0IGFkZGVkIHRv
IHRoZSBDRkEgYmFzZSByZWdpc3RlciBiZWZvcmUgb3IgYXMgdGhlIENGQS4KCkFzIGEgbm9uLW5h
dGl2ZSBzcGVha2VyIEkgaGF2ZSBhIGhhcmQgdGltZSB0byB1bmRlcnN0YW5kIHRoYXQgY29tbWVu
dC4KV291bGRuJ3QgdGhlIGZvbGxvd2luZyBzdWZmaWNlPwoKICogQGNmYV9vZmY6IEJ5dGUgb2Zm
c2V0IGFkZGVkIHRvIHRoZSBDRkEgYmFzZSByZWdpc3Rlci4KCj4gKyAqIEBzcF9vZmY6IEJ5dGUg
b2Zmc2V0IHVzZWQgdG8gbG9hZCB0aGUgc2F2ZWQgU1Agd2hlbiBAc3BfcnVsZSBpcyBhbiBvZmZz
ZXQuCj4gKyAqIEBmcF9vZmY6IEJ5dGUgb2Zmc2V0IHVzZWQgdG8gbG9hZCB0aGUgc2F2ZWQgRlAg
d2hlbiBAZnBfcnVsZSBpcyBhbiBvZmZzZXQuCj4gKyAqIEByYV9vZmY6IEJ5dGUgb2Zmc2V0IHVz
ZWQgdG8gbG9hZCB0aGUgc2F2ZWQgUkEgd2hlbiBAcmFfcnVsZSBpcyBhbiBvZmZzZXQuCj4gKyAq
IEBjZmFfYmFzZTogQ0ZBIGNvbXB1dGF0aW9uIG1vZGUgKCZlbnVtIGR3YXJmX2NmaV9iYXNlKS4K
CldoYXQgYWJvdXQgcmVuYW1pbmcgdG8gY2ZhX3J1bGU/ICBUaGF0IHdvdWxkIG5pY2VseSBhbGln
biB3aXRoIHRoZQp7c3B8ZnB8cmF9X3J1bGUgYW5kICpfcmVnLgoKPiArICogQGNmYV9yZWc6IERX
QVJGIHJlZ2lzdGVyIG51bWJlciB3aGVuIEBjZmFfYmFzZSBpcyAlRFdBUkZfQ0ZJX0JBU0VfUkVH
LgoKRm9yIHMzOTAgc3VwcG9ydCBJIHBsYW4gdG8gYWRkIHRoZSBmb2xsb3dpbmcgdG8gc3VwcG9y
dCBEV19DRkFfcmVnaXN0ZXI6CgogKiBAc3BfcmVnOiBEV0FSRiByZWdpc3RlciBudW1iZXIgY29u
dGFpbmluZyB0aGUgc2F2ZWQgU1Agd2hlbiBAc3BfcnVsZSBpcyBhIHJlZ2lzdGVyLgogKiBAZnBf
cmVnOiBEV0FSRiByZWdpc3RlciBudW1iZXIgY29udGFpbmluZyB0aGUgc2F2ZWQgRlAgd2hlbiBA
ZnBfcnVsZSBpcyBhIHJlZ2lzdGVyLgogKiBAcmFfcmVnOiBEV0FSRiByZWdpc3RlciBudW1iZXIg
Y29udGFpbmluZyB0aGUgc2F2ZWQgUkEgd2hlbiBAcmFfcnVsZSBpcyBhIHJlZ2lzdGVyLgoKPiAr
ICogQHNwX3J1bGU6IFJlY292ZXJ5IHJ1bGUgZm9yIHRoZSBzdGFjayBwb2ludGVyICgmZW51bSBk
d2FyZl9jZmlfcnVsZTsKPiArICogICAgICAgICAgICVEV0FSRl9DRklfUlVMRV9TQU1FIGluZGlj
YXRlcyBjYWxsZXIgU1AgZXF1YWxzIENGQSkuCj4gKyAqIEBmcF9ydWxlOiBSZWNvdmVyeSBydWxl
IGZvciB0aGUgZnJhbWUgcG9pbnRlciAoJmVudW0gZHdhcmZfY2ZpX3J1bGUpLgo+ICsgKiBAcmFf
cnVsZTogUmVjb3ZlcnkgcnVsZSBmb3IgdGhlIHJldHVybiBhZGRyZXNzICgmZW51bSBkd2FyZl9j
ZmlfcnVsZSkuCj4gKyAqIEBzaWduYWw6IFRydWUgaWYgdGhlIENJRSBjYXJyaWVzIHRoZSAnUycg
c2lnbmFsL2ludGVycnVwdCBmcmFtZSBhdWdtZW50YXRpb24sCj4gKyAqICAgICAgICAgIGluZGlj
YXRpbmcgdGhhdCB0aGUgc2F2ZWQgUEMgcG9pbnRzIGRpcmVjdGx5IHRvIHRoZSBpbnRlcnJ1cHRl
ZAo+ICsgKiAgICAgICAgICBpbnN0cnVjdGlvbiByYXRoZXIgdGhhbiBhZnRlciBhIGNhbGwgaW5z
dHJ1Y3Rpb24uCj4gKyAqIEByYV9zaWduZWQ6IFRydWUgb24gQUFyY2g2NCB3aGVuIERXX0NGQV9B
QVJDSDY0X25lZ2F0ZV9yYV9zdGF0ZSBpbmRpY2F0ZXMKPiArICogICAgICAgICAgICAgdGhhdCB0
aGUgc2F2ZWQgcmV0dXJuIGFkZHJlc3MgY2FycmllcyBhIFBBQyBzaWduYXR1cmUuCj4gKyAqLwo+
ICtzdHJ1Y3QgZHdhcmZfY2ZpX3JvdyB7Cj4gKwlzMzIgY2ZhX29mZjsKPiArCXMzMiBzcF9vZmY7
Cj4gKwlzMzIgZnBfb2ZmOwo+ICsJczMyIHJhX29mZjsKPiArCXU4IGNmYV9iYXNlOwo+ICsJdTgg
Y2ZhX3JlZzsKPiArCXU4IHNwX3J1bGU7Cj4gKwl1OCBmcF9ydWxlOwo+ICsJdTggcmFfcnVsZTsK
PiArCWJvb2wgc2lnbmFsOwo+ICsJYm9vbCByYV9zaWduZWQ7Cj4gK307ClJlZ2FyZHMsCkplbnMK
LS0gCkplbnMgUmVtdXMKTGludXggb24gWiBEZXZlbG9wbWVudCAoRDMzMDMpCmpyZW11c0BkZS5p
Ym0uY29tIC8ganJlbXVzQGxpbnV4LmlibS5jb20KCklCTSBEZXV0c2NobGFuZCBSZXNlYXJjaCAm
IERldmVsb3BtZW50IEdtYkg7IFZvcnNpdHplbmRlciBkZXMgQXVmc2ljaHRzcmF0czogV29sZmdh
bmcgV2VuZHQ7IEdlc2Now6RmdHNmw7xocnVuZzogRGF2aWQgRmFsbGVyOyBTaXR6IGRlciBHZXNl
bGxzY2hhZnQ6IEVobmluZ2VuOyBSZWdpc3RlcmdlcmljaHQ6IEFtdHNnZXJpY2h0IFN0dXR0Z2Fy
dCwgSFJCIDI0MzI5NApJQk0gRGF0YSBQcml2YWN5IFN0YXRlbWVudDogaHR0cHM6Ly93d3cuaWJt
LmNvbS9wcml2YWN5LwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
