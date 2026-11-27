Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D94606A32C
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Nov 2026 15:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=J7vYGjdE;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sdEQ0NsA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EMiwZ4m6G5vAVS+LHRgHTWJU4GqcMbKdalg366mkxRc=; b=J7vYGjdEjF9fZ8Ni8yxz7VC/UK
	18vK16zb9k/48Jr7DW23EMGh6ZEwhrH6huZE5xf8m3Th1vxtGmnOpWQXFCYrKKdogulEwcMSW960W
	kgwG3Bkdlup8k6UMFZZX72qzasRcFGgrjXypT3j4kvidQ+LX/ABsisCMKx0u0u8q0rIq3ciccq1JV
	Z8cfX18SAYn7v5tivsurnZ1+NoOEizsiTT4e2VYNxY57ccuWVi6IGPd3LDAiuM6cVpneY8cchsNnO
	v2tACkGNE4lm/IVJ2MjGNtFfZEzY9G0WGZ9O6Qm8R8VYiE1katjqskHyVm4//wCR75xvZCbuILzl4
	l/SGjb9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWy9W-0000000Gtvr-1OkO;
	Fri, 27 Nov 2026 15:46:22 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWy9O-0000000Gtub-2b0u;
	Fri, 27 Nov 2026 15:46:20 +0000
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE4xWq1650913;
	Fri, 27 Nov 2026 15:45:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Ef79Sm
	+tXuuwj3ufmXm7GJ7x61OFnxYLGpboMdf9IBI=; b=sdEQ0NsA1Rp5M9ki4aIM4f
	7cZlgbBScopeC6p1ATCCEH+WXpatpRevj3IPaed0EcBpANh42lq2uuIXWlyy1qU7
	AkeFHkXLSpPKXcnkFJDFdSLOtI/VyBJfwHC7ZMtZTsNYDZ/brU3myrmKhfiUjWPy
	0fI8n1roGMw2d2nWhp0xrHWd4Pqao3FqfDG8U6CAbdzPwA3tXYpeymgXa8Q9aXTI
	/BAS04+efAngyb4Ciq8AIUvwu3Loung1K6tCkLRINQO28gp3wVNH5YxoVv8t+jDY
	eWi+1fVPMLICcXI0S937RiF/RVzMcibVDsTH60heWnzWLNRZxFvwet0mBj0ZpjfA
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j34g3pgxr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 27 Nov 2026 15:45:18 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE4HlC3245420;
	Fri, 27 Nov 2026 15:45:17 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4j5uxx9cpw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Nov 2026 15:45:17 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6ARFjFm540763836
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Nov 2026 15:45:15 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 08B6B2004E;
	Fri, 27 Nov 2026 15:45:15 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C3D1120040;
	Fri, 27 Nov 2026 15:45:12 +0000 (GMT)
Received: from [9.111.162.114] (unknown [9.111.162.114])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 27 Nov 2026 15:45:12 +0000 (GMT)
Message-ID: <b3e99b3a-7dd6-4e3a-97a8-3011a5f52569@linux.ibm.com>
Date: Fri, 27 Nov 2026 16:45:12 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 03/30] unwind_user: Support Minimal DWARF CFI
 user-space unwinding
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
 <20261125061523.1540234-4-irogers@google.com>
Content-Language: en-US
From: Jens Remus <jremus@linux.ibm.com>
Organization: IBM Deutschland Research & Development GmbH
In-Reply-To: <20261125061523.1540234-4-irogers@google.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=SoQFe/O0 c=1 sm=1 tr=0 ts=6b09a58f cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=uAbxVGIbfxUO_5tXvNgY:22 a=VnNF1IyMAAAA:8
 a=1XWaLZrsAAAA:8 a=SydnlHaeet_-pvNvn0IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA2MiBTYWx0ZWRfX//27zJLiQVYf
 xNjLa9qa44AULBZTtm4EESxzfRForMWNqSTmBaImA7YWQRwKK193TC19ItTlLVgilaXwZcnzcHe
 QICuhIDhMKp+bHoMoSt/uaiJRuECQxw=
X-Proofpoint-ORIG-GUID: cZ0MGuDQofjwbSOIcLLHaDoI3HDF3ZM6
X-Proofpoint-GUID: qPE-_zE0roniklQP5kQm896Xq2TUdaEX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA2MiBTYWx0ZWRfX4zkwEbYrR0Ub
 t0vOYaJYi0U5fCUQEvK7YRpLsUhXmMQXuiM36maaVxnFZXU1rrQUthFEbLYJHfQ8mCgalEmUz9e
 B7Mif8gfIPXAX3kO+XyYclvI0cKi9WMZ/7JlebSj2IAYBHr/ka7KsyN89Cdhrx4wT4PbAfWQBAT
 vaAk2DkMcgC44nO7KjdUz6R5rjsODltvTuqXXm5ALXPLp0H/ZO8Ct1digR3BRypj4Uc1sUtuPzF
 ZH5ChZOtmSI6NzV3W/BZjmJ0Q7pdKguTBaz/OmLbUQKxiK6RMKntlafD4sSPwuDe3SlxeWhjXJO
 Vqj6sUGeFx60W2WrESFJ1gQtM74EOPI8YX9qEdKmzlI+AznCNZl6L3cVAyBCU2FLCWaOPTohD6h
 8lDI6YxQCvH59CpgKFzbug+kiskWWh+Pqw1qEnxi9LnGRL4Ikg2RHebJTdd7adhpf3ze38WyP0K
 aXhNs6vkU6Uy4I0JVFA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_074615_727210_A85745F2 
X-CRM114-Status: GOOD (  20.04  )
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

SGVsbG8gSWFuLAoKc29tZSBlYXJseSBmZWVkYmFjay4KCk9uIDExLzI1LzIwMjYgNzoxNCBBTSwg
SWFuIFJvZ2VycyB3cm90ZToKPiBFeHRlbmQgdGhlIGdlbmVyaWMgdXNlci1zcGFjZSB1bndpbmRl
ciAoa2VybmVsL3Vud2luZC91c2VyLmMpIHdpdGgKPiBVTldJTkRfVVNFUl9UWVBFX0NGSSAoQ09O
RklHX0hBVkVfVU5XSU5EX1VTRVJfQ0ZJKSwgcmVzb2x2aW5nIEVMRgo+IFBUX0dOVV9FSF9GUkFN
RSBoZWFkZXJzIGFjcm9zcyBleGVjdXRhYmxlIFZNQXMgaW4ga2VybmVsL3Vud2luZC91c2VyX2Nm
aS5jLgo+IAo+IEtleSBkZXNpZ24gZGV0YWlsczoKPiAgLSBGaW5kIHRoZSBleGVjdXRhYmxlIFZN
QSBhbmQgaXRzIGJhc2UgRUxGIG1hcHBpbmcgKHZtX3Bnb2ZmID09IDApCj4gICAgdW5kZXIgbW1h
cF9yZWFkX2xvY2tfa2lsbGFibGUoKSwgdGhlbiBkcm9wIG1tYXBfcmVhZF9sb2NrKCkgYmVmb3Jl
Cj4gICAgaXNzdWluZyBhbnkgZmF1bHRhYmxlIGNvcHlfZnJvbV91c2VyKCkgcmVhZHMuCj4gIC0g
Q2FjaGUgVk1BIC0+IFBUX0dOVV9FSF9GUkFNRSBsb29rdXBzIChpbmNsdWRpbmcgbmVnYXRpdmUg
bG9va3VwcyBmb3IKPiAgICBhbm9ueW1vdXMvSklUIFZNQXMgc28gdW53aW5kX3VzZXJfbmV4dCgp
IGZhbGxzIGJhY2sgcGVyIGZyYW1lIHRvIEZQKQo+ICAgIGluIGEgNC1zbG90IHBlci13YWxrIGNh
Y2hlIG9uIHN0cnVjdCB1bndpbmRfdXNlcl9zdGF0ZS4KPiAgLSBUcmFjayBzdGFjay1wb2ludGVy
IHZhbGlkaXR5IChzdGF0ZS0+c3BfdmFsaWQgYW5kCj4gICAgdW53aW5kX3VzZXJfZnBfc2V0c19z
cCgpKSBhY3Jvc3MgbWl4ZWQgQ0ZJIC0+IEZQIC0+IENGSSB3YWxrcyBzbwo+ICAgIGFyY2hpdGVj
dHVyZXMgd2hvc2UgRlAgc3RlcCBkb2VzIG5vdCByZWNvdmVyIGV4YWN0IGNhbGxlciBTUCByZWpl
Y3QKPiAgICBTUC1iYXNlZCBydWxlcyB1bnRpbCBhbiBvdXRlciBGUC1iYXNlZCBGREUgb3Igc2ln
cmV0dXJuIHJlc3RvcmVzIFNQLAo+ICAgIGFuZCBzdXBwb3J0IHNpZ25hbC1mcmFtZSBTUCByZWNv
dmVyeSBmcm9tICooQ0ZBICsgc3Bfb2ZmKS4KPiAgLSBQcm92aWRlIG92ZXJyaWRhYmxlIHVud2lu
ZF91c2VyX2ZyYW1lX3BvaW50ZXIoKSAoZ3VhcmRlZCBieQo+ICAgIENPTkZJR19IQVZFX1VOV0lO
RF9VU0VSX0ZQKSwgdW53aW5kX3VzZXJfZnBfc2V0c19zcCgpLCBhbmQKPiAgICB1bndpbmRfdXNl
cl9zaWdyZXR1cm4oKSBob29rcyBhbG9uZ3NpZGUgdW53aW5kX3VzZXJfbGlua19yZWdpc3Rlcigp
Cj4gICAgYW5kIHVud2luZF91c2VyX3N0cmlwX3BhYygpLCBhbmQgYWxsb3cgdXAgdG8gVU5XSU5E
X1VTRVJfTUFYX1NJR05BTFMKPiAgICBzaWduYWwgZnJhbWVzIHBlciB3YWxrIHRvIHN3aXRjaCBz
dGFja3MgKFNBX09OU1RBQ0spLgo+ICAtIFN1cHBvcnQgbGluay1yZWdpc3RlciBsZWFmIGZyYW1l
cywgRFJBUC9zaWdmcmFtZSBpbmRpcmVjdCBDRkEgcnVsZXMsCj4gICAgYW5kIGNsZWFuIGJvdHRv
bS1vZi1zdGFjayB0ZXJtaW5hdGlvbiBvbiBEV19DRkFfdW5kZWZpbmVkIG9yIHplcm8gUkEuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogSWFuIFJvZ2VycyA8aXJvZ2Vyc0Bnb29nbGUuY29tPgoKPiBkaWZm
IC0tZ2l0IGEvaW5jbHVkZS9saW51eC91bndpbmRfdXNlcl90eXBlcy5oIGIvaW5jbHVkZS9saW51
eC91bndpbmRfdXNlcl90eXBlcy5oCgo+ICsvKioKPiArICogc3RydWN0IHVud2luZF91c2VyX2Zy
YW1lIC0gRXZhbHVhdGVkIHVud2luZCBydWxlIGZvciBzdGVwcGluZyBvbmUgdXNlciBmcmFtZQo+
ICsgKiBAY2ZhX29mZjogQnl0ZSBvZmZzZXQgYWRkZWQgdG8gRlAgKHdoZW4gQHVzZV9mcCBpcyB0
cnVlKSBvciBTUCB0byBmb3JtIENGQS4KCiAqIEBjZmFfb2ZmOiBCeXRlIG9mZnNldCBhZGRlZCB0
byBDRkEgYmFzZSByZWdpc3RlciAoU1Agb3IgRlApIHRvIGZvcm0gQ0ZBLgoKPiArICogQHNwX29m
ZjogQnl0ZSBvZmZzZXQgZnJvbSBDRkEgdG8gc2F2ZWQgY2FsbGVyIFNQIHdoZW4gQHNwX2Zyb21f
Y2ZhIGlzIHRydWUuCj4gKyAqIEByYV9vZmY6IEJ5dGUgb2Zmc2V0IGZyb20gQ0ZBIChvciBTUCB3
aGVuIEByYV9mcm9tX3NwIGlzIHRydWUpIHRvIHNhdmVkIFJBLgo+ICsgKiBAZnBfb2ZmOiBCeXRl
IG9mZnNldCBmcm9tIENGQSwgRlAsIG9yIFNQIHRvIHNhdmVkIGNhbGxlciBGUCAoMCBpZiB1bmNo
YW5nZWQsCj4gKyAqICAgICAgICAgIHVubGVzcyBAZnBfZnJvbV9mcCBvciBAZnBfZnJvbV9zcCBp
cyBzZXQpLgo+ICsgKiBAdXNlX2ZwOiBUcnVlIGlmIHRoZSBDRkEgYmFzZSByZWdpc3RlciBpcyBG
UCByYXRoZXIgdGhhbiBTUC4KPiArICogQGNmYV9pbmRpcmVjdDogVHJ1ZSBpZiB0aGUgY29tcHV0
ZWQgQ0ZBIGFkZHJlc3MgbXVzdCBiZSBkZXJlZmVyZW5jZWQgb25jZSBpbgo+ICsgKiAgICAgICAg
ICAgICAgICB1c2VyIG1lbW9yeSAoRFJBUCBvciBzaWduYWwgdHJhbXBvbGluZSBmcmFtZSkuCj4g
KyAqIEBzcF9mcm9tX2NmYTogVHJ1ZSBpZiBzYXZlZCBTUCBpcyBsb2NhdGVkIGF0ICooY2ZhICsg
QHNwX29mZikgKGUuZy4gdmRzbzMyCj4gKyAqICAgICAgICAgICAgICAgc2lncmV0dXJuIGZyYW1l
IHdoZXJlIENGQSBwb2ludHMgYXQgc2lnY29udGV4dCkuCj4gKyAqIEBmcF9mcm9tX2ZwOiBUcnVl
IGlmIHNhdmVkIEZQIGlzIGxvY2F0ZWQgYXQgKihzdGF0ZS0+ZnAgKyBAZnBfb2ZmKS4KPiArICog
QGZwX2Zyb21fc3A6IFRydWUgaWYgc2F2ZWQgRlAgaXMgbG9jYXRlZCBhdCAqKG9sZF9zcCArIEBm
cF9vZmYpLgo+ICsgKiBAcmFfZnJvbV9zcDogVHJ1ZSBpZiBzYXZlZCBSQSBpcyBsb2NhdGVkIGF0
ICoob2xkX3NwICsgQHJhX29mZikuCj4gKyAqIEByYV9mcm9tX3JlZzogVHJ1ZSBpZiBSQSBpcyBz
dGlsbCBpbiBAc3RhdGUtPnJhIHJhdGhlciB0aGFuIG9uIHRoZSBzdGFjay4KClRoaXMgZmxhZyBz
b3VwIGlzIGNvbmZ1c2luZy4gIEZvciBzMzkwIHN1cHBvcnQgSSB3b3VsZCBuZWVkIHRvIGFkZCB0
aGUKZm9sbG93aW5nIHRvIHN1cHBvcnQgRFdfQ0ZBX3JlZ2lzdGVyLCB3aGljaCB3b3VsZCBtYWtl
IGl0IGV2ZW4gd29yc2U6CgogKiBAc3BfcmVnOiBEV0FSRiByZWdpc3RlciBudW1iZXIgY29udGFp
bmluZyB0aGUgc2F2ZWQgU1Agd2hlbiBpZiBAc3BfZnJvbV9yZWcKICAgICAgICAgICAgaXMgdHJ1
ZS4KICogQGZwX3JlZzogRFdBUkYgcmVnaXN0ZXIgbnVtYmVyIGNvbnRhaW5pbmcgdGhlIHNhdmVk
IEZQIHdoZW4gaWYgQGZwX2Zyb21fcmVnCiAgICAgICAgICAgIGlzIHRydWUuCiAqIEByYV9yZWc6
IERXQVJGIHJlZ2lzdGVyIG51bWJlciBjb250YWluaW5nIHRoZSBzYXZlZCBSQSB3aGVuIGlmIEBy
YV9mcm9tX3JlZwogICAgICAgICAgICBpcyB0cnVlLgogKiBAc3BfZnJvbV9yZWc6IFRydWUgaWYg
c2F2ZWQgU1AgaXMgbG9jYXRlZCBpbiBAc3BfcmVnLgogKiBAZnBfZnJvbV9yZWc6IFRydWUgaWYg
c2F2ZWQgRlAgaXMgbG9jYXRlZCBpbiBAZnBfcmVnLgogKiBAcmFfZnJvbV9yZWc6IFRydWUgaWYg
c2F2ZWQgUkEgaXMgbG9jYXRlZCBpbiBAcmFfcmVnLgoKV291bGRuJ3QgaXQgYmUgcHJlZmVyYWJs
ZSB0byB1c2Ugc29tZXRoaW5nIG1vcmUgc2ltaWxhciB0byBzdHJ1Y3QKZHdhcmZfY2ZpX3Jvdz8K
CiAgY2ZhX3J1bGU6IFVOREVGSU5FRCwgU1AsIEZQLCBTUF9JTkRJUkVDVCwgRlBfSU5ESVJFQ1Qs
IFJFR0lTVEVSCiAgY2ZhX3JlZwogIGNmYV9vZmYKCiAge3NwfGZwfHJhfV9ydWxlOiBTQU1FLCBP
RkZTRVQsIFNQX09GRlNFVCwgRlBfT0ZGU0VULCBWQUxfT0ZGU0VULAogICAgICAgICAgICAgICAg
ICAgUkVHSVNURVIsIFVOREVGSU5FRAogIHtzcHxmcHxyYX1fcmVnCiAge3NwfGZwfHJhfV9vZmYK
Cj4gKyAqIEByYV9zaWduZWQ6IFRydWUgaWYgdGhlIHJlY292ZXJlZCBSQSBjYXJyaWVzIGFuIEFB
cmNoNjQgUEFDIHNpZ25hdHVyZS4KPiArICovCj4gIHN0cnVjdCB1bndpbmRfdXNlcl9mcmFtZSB7
Cj4gIAlzMzIgY2ZhX29mZjsKPiArCXMzMiBzcF9vZmY7Cj4gIAlzMzIgcmFfb2ZmOwo+ICAJczMy
IGZwX29mZjsKPiAgCWJvb2wgdXNlX2ZwOwo+ICsJYm9vbCBjZmFfaW5kaXJlY3Q7Cj4gKwlib29s
IHNwX2Zyb21fY2ZhOwo+ICsJYm9vbCBmcF9mcm9tX2ZwOwo+ICsJYm9vbCBmcF9mcm9tX3NwOwo+
ICsJYm9vbCByYV9mcm9tX3NwOwo+ICsJYm9vbCByYV9mcm9tX3JlZzsKPiArCWJvb2wgcmFfc2ln
bmVkOwo+ICt9OwpSZWdhcmRzLApKZW5zCi0tIApKZW5zIFJlbXVzCkxpbnV4IG9uIFogRGV2ZWxv
cG1lbnQgKEQzMzAzKQpqcmVtdXNAZGUuaWJtLmNvbSAvIGpyZW11c0BsaW51eC5pYm0uY29tCgpJ
Qk0gRGV1dHNjaGxhbmQgUmVzZWFyY2ggJiBEZXZlbG9wbWVudCBHbWJIOyBWb3JzaXR6ZW5kZXIg
ZGVzIEF1ZnNpY2h0c3JhdHM6IFdvbGZnYW5nIFdlbmR0OyBHZXNjaMOkZnRzZsO8aHJ1bmc6IERh
dmlkIEZhbGxlcjsgU2l0eiBkZXIgR2VzZWxsc2NoYWZ0OiBFaG5pbmdlbjsgUmVnaXN0ZXJnZXJp
Y2h0OiBBbXRzZ2VyaWNodCBTdHV0dGdhcnQsIEhSQiAyNDMyOTQKSUJNIERhdGEgUHJpdmFjeSBT
dGF0ZW1lbnQ6IGh0dHBzOi8vd3d3LmlibS5jb20vcHJpdmFjeS8KCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
