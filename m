Return-Path: <SRS0=EWPw=HR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CE3CC433E0
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Feb 2021 18:15:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B01264E05
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Feb 2021 18:15:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B01264E05
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PtHbS42RmOf+m3pOOhldvnpT+JnqIsHXoAlancfzpcA=; b=taFxeufhoTMmUqO2EB7l3t4Lhv
	avlcQ5xkSqkI+ixYRXJX18GLOc1kBBM7NrHoxIt0MhBTbZspOKWbxcflSss4e2Qw5USF81U6Ne4jP
	Gns23Nv1HQk0yMJMtdddhhPO0vAX2S+L8eQnLmSITEHowf/d8cPIKHltqFVqI0wHerTLUPJgJvv5A
	z2rjoJ86Vte+GmLqcq9A4s+2YFY12PQLHxurSIYnrQ0BVl+XmtQZyRUDnRCGZ8sMYM/93/vl14hQe
	6Qe1W/ScYN4ctQgK1J4/0MCbhUC9jk/S6DFHIK+H5EdNwpEA+d0gHtXgjTKcpOrEGcL3O6tSjw2T0
	LuJS8fVQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lBiP8-0001rO-Bo; Mon, 15 Feb 2021 18:15:26 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lBiP3-0001ql-Vl; Mon, 15 Feb 2021 18:15:22 +0000
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 11FI3keQ089147; Mon, 15 Feb 2021 13:14:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=oGpfBMoJflzNtTxXhAAqknfbJZwwOWhWibJHXOD15mY=;
 b=B/bnia+10Cs1nS5Q/upnquv2ZqXghmk3a6oXvIJu1bYAT9fq48cugx6TbeiTQlsj7qZM
 r9narncQVfykPHEyJHuo45qRrCnDhJP4fLWXNTzh+wRkWX5CekXlUGk5CLJznaZt6huP
 QS1lVTZ4HiwSm6Zccy5axTKKb4qK9kdk4mVKgXfsgW4HArxGrxT1EA/Pn6mTps4Vjfvm
 m0YOQFc0aWwzXwNK3mVbIys228lxpSUTYg08cJcpzpHT4PcHyChXHf6by4iByZs77BV9
 yKmIzsatDpKh4JWGLHQGoDjjCqXOeQXIJU15C840vpqciQ/nRrzDNGV2nbGbjXU11G1r lA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36qww5gb83-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Feb 2021 13:14:55 -0500
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 11FI4Lrj090689;
 Mon, 15 Feb 2021 13:14:54 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36qww5gb7m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Feb 2021 13:14:54 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11FICq9U024338;
 Mon, 15 Feb 2021 18:14:53 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma02dal.us.ibm.com with ESMTP id 36p6d9d37g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Feb 2021 18:14:53 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11FIEph216515450
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Feb 2021 18:14:51 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C21B67806A;
 Mon, 15 Feb 2021 18:14:51 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CA8027805E;
 Mon, 15 Feb 2021 18:14:44 +0000 (GMT)
Received: from jarvis.int.hansenpartnership.com (unknown [9.85.199.127])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 15 Feb 2021 18:14:44 +0000 (GMT)
Message-ID: <be1d821d3f0aec24ad13ca7126b4359822212eb0.camel@linux.ibm.com>
Subject: Re: [PATCH v17 07/10] mm: introduce memfd_secret system call to
 create "secret" memory areas
From: James Bottomley <jejb@linux.ibm.com>
To: Michal Hocko <mhocko@suse.com>
Date: Mon, 15 Feb 2021 10:14:43 -0800
In-Reply-To: <YCo7TqUnBdgJGkwN@dhcp22.suse.cz>
References: <20210214091954.GM242749@kernel.org>
 <052DACE9-986B-424C-AF8E-D6A4277DE635@redhat.com>
 <244f86cba227fa49ca30cd595c4e5538fe2f7c2b.camel@linux.ibm.com>
 <YCo7TqUnBdgJGkwN@dhcp22.suse.cz>
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-15_14:2021-02-12,
 2021-02-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102150137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210215_131522_112273_F7C0B519 
X-CRM114-Status: GOOD (  41.50  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Reply-To: jejb@linux.ibm.com
Cc: Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Christopher Lameter <cl@linux.com>, Shuah Khan <shuah@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Elena Reshetova <elena.reshetova@intel.com>, linux-arch@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, linux-nvdimm@lists.01.org,
 Will Deacon <will@kernel.org>, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Michael Kerrisk <mtk.manpages@gmail.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Arnd Bergmann <arnd@arndb.de>,
 Hagen Paul Pfeifer <hagen@jauu.net>, Borislav Petkov <bp@alien8.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-fsdevel@vger.kernel.org, Shakeel Butt <shakeelb@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Roman Gushchin <guro@fb.com>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAyMDIxLTAyLTE1IGF0IDEwOjEzICswMTAwLCBNaWNoYWwgSG9ja28gd3JvdGU6Cj4g
T24gU3VuIDE0LTAyLTIxIDExOjIxOjAyLCBKYW1lcyBCb3R0b21sZXkgd3JvdGU6Cj4gPiBPbiBT
dW4sIDIwMjEtMDItMTQgYXQgMTA6NTggKzAxMDAsIERhdmlkIEhpbGRlbmJyYW5kIHdyb3RlOgo+
ID4gWy4uLl0KPiA+ID4gPiBBbmQgaGVyZSB3ZSBjb21lIHRvIHRoZSBxdWVzdGlvbiAid2hhdCBh
cmUgdGhlIGRpZmZlcmVuY2VzIHRoYXQKPiA+ID4gPiBqdXN0aWZ5IGEgbmV3IHN5c3RlbSBjYWxs
PyIgYW5kIHRoZSBhbnN3ZXIgdG8gdGhpcyBpcyB2ZXJ5Cj4gPiA+ID4gc3ViamVjdGl2ZS4gQW5k
IGFzIHN1Y2ggd2UgY2FuIGNvbnRpbnVlIGJpa2VzaGVkZGluZyBmb3JldmVyLgo+ID4gPiAKPiA+
ID4gSSB0aGluayB0aGlzIGZpdHMgaW50byB0aGUgZXhpc3RpbmcgbWVtZmRfY3JlYXRlKCkgc3lz
Y2FsbCBqdXN0Cj4gPiA+IGZpbmUsIGFuZCBJIGhlYXJkIG5vIGNvbXBlbGxpbmcgYXJndW1lbnQg
d2h5IGl0IHNob3VsZG7igJh0LiBUaGF04oCYcwo+ID4gPiBhbGwgSSBjYW4gc2F5Lgo+ID4gCj4g
PiBPSywgc28gbGV0J3MgcmV2aWV3IGhpc3RvcnkuICBJbiB0aGUgZmlyc3QgdHdvIGluY2FybmF0
aW9ucyBvZiB0aGUKPiA+IHBhdGNoLCBpdCB3YXMgYW4gZXh0ZW5zaW9uIG9mIG1lbWZkX2NyZWF0
ZSgpLiAgVGhlIHNwZWNpZmljCj4gPiBvYmplY3Rpb24gYnkgS2lyaWxsIFNodXRlbW92IHdhcyB0
aGF0IGl0IGRvZXNuJ3Qgc2hhcmUgYW55IGNvZGUgaW4KPiA+IGNvbW1vbiB3aXRoIG1lbWZkIGFu
ZCBzbyBzaG91bGQgYmUgYSBzZXBhcmF0ZSBzeXN0ZW0gY2FsbDoKPiA+IAo+ID4gaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvbGludXgtYXBpLzIwMjAwNzEzMTA1ODEyLmRud3RkaHN1eWozeGJoNGZA
Ym94Lwo+IAo+IFRoYW5rcyBmb3IgdGhlIHBvaW50ZXIuIEJ1dCB0aGlzIGFyZ3VtZW50IGhhc24n
dCBiZWVuIGNoYWxsZW5nZWQgYXQKPiBhbGwuIEl0IGhhc24ndCBiZWVuIGJyb3VnaHQgdXAgdGhh
dCB0aGUgb3ZlcmxhcCB3b3VsZCBiZSBjb25zaWRlcmFibGUKPiBoaWdoZXIgYnkgdGhlIGh1Z2V0
bGIvc2VhbGluZyBzdXBwb3J0LiBBbmQgc28gZmFyIG5vYm9keSBoYXMgY2xhaW1lZAo+IHRob3Nl
IGNvbWJpbmF0aW9ucyBhcyB1bnZpYWJsZS4KCktpcmlsbCBpcyBhY3R1YWxseSBpbnRlcmVzdGVk
IGluIHRoZSBzZWFsaW5nIHBhdGggZm9yIGhpcyBLVk0gY29kZSBzbwp3ZSB0b29rIGEgbG9vay4g
IFRoZXJlIG1pZ2h0IGJlIGEgdHdvIGxpbmUgb3ZlcmxhcCBpbiBtZW1mZF9jcmVhdGUgZm9yCnRo
ZSBzZWFsIGNhc2UsIGJ1dCB0aGVyZSdzIG5vIHJlYWwgb3ZlcmxhcCBpbiBtZW1mZF9hZGRfc2Vh
bHMgd2hpY2ggaXMKdGhlIGJ1bGsgb2YgdGhlIGNvZGUuICBTbyB0aGUgYmVzdCB3YXkgd291bGQg
c2VlbSB0byBsaWZ0IHRoZSBpbm9kZSAuLi4KLT4gc2VhbHMgaGVscGVycyB0byBiZSBub24tc3Rh
dGljIHNvIHRoZXkgY2FuIGJlIHJldXNlZCBhbmQgcm9sbCBvdXIKb3duIGFkZF9zZWFscy4KCkkg
Y2FuJ3Qgc2VlIGEgdXNlIGNhc2UgYXQgYWxsIGZvciBodWdldGxiIHN1cHBvcnQsIHNvIGl0IHNl
ZW1zIHRvIGJlIGEKYml0IG9mIGFuIGFuZ2VscyBvbiBwaW4gaGVhZCBkaXNjdXNzaW9uLiAgSG93
ZXZlciwgaWYgb25lIHdlcmUgdG8gY29tZQphbG9uZyBoYW5kbGluZyBpdCBpbiB0aGUgc2FtZSB3
YXkgc2VlbXMgcmVhc29uYWJsZS4KCj4gPiBUaGUgb3RoZXIgb2JqZWN0aW9uIHJhaXNlZCBvZmZs
aXN0IGlzIHRoYXQgaWYgd2UgZG8gdXNlCj4gPiBtZW1mZF9jcmVhdGUsIHRoZW4gd2UgaGF2ZSB0
byBhZGQgYWxsIHRoZSBzZWNyZXQgbWVtb3J5IGZsYWdzIGFzIGFuCj4gPiBhZGRpdGlvbmFsIGlv
Y3RsLCB3aGVyZWFzIHRoZXkgY2FuIGJlIHNwZWNpZmllZCBvbiBvcGVuIGlmIHdlIGRvIGEKPiA+
IHNlcGFyYXRlIHN5c3RlbSBjYWxsLiAgVGhlIGNvbnRhaW5lciBwZW9wbGUgdmlvbGVudGx5IG9i
amVjdGVkIHRvCj4gPiB0aGUgaW9jdGwgYmVjYXVzZSBpdCBjYW4ndCBiZSBwcm9wZXJseSBhbmFs
eXNlZCBieSBzZWNjb21wIGFuZCBtdWNoCj4gPiBwcmVmZXJyZWQgdGhlIHN5c2NhbGwgdmVyc2lv
bi4KPiA+IAo+ID4gU2luY2Ugd2UncmUgZHVtcGluZyB0aGUgdW5jYWNoZWQgdmFyaWFudCwgdGhl
IGlvY3RsIHByb2JsZW0KPiA+IGRpc2FwcGVhcnMgYnV0IHNvIGRvZXMgdGhlIHBvc3NpYmlsaXR5
IG9mIGV2ZXIgYWRkaW5nIGl0IGJhY2sgaWYgd2UKPiA+IHRha2Ugb24gdGhlIGNvbnRhaW5lciBw
ZW9wbGVzJyBvYmplY3Rpb24uICBUaGlzIGFyZ3VlcyBmb3IgYQo+ID4gc2VwYXJhdGUgc3lzY2Fs
bCBiZWNhdXNlIHdlIGNhbiBhZGQgYWRkaXRpb25hbCBmZWF0dXJlcyBhbmQgZXh0ZW5kCj4gPiB0
aGUgQVBJIHdpdGggZmxhZ3Mgd2l0aG91dCBjYXVzaW5nIGFudGktaW9jdGwgcmlvdHMuCj4gCj4g
SSBhbSBzb3JyeSBidXQgSSBkbyBub3QgdW5kZXJzdGFuZCB0aGlzIGFyZ3VtZW50LgoKWW91IGRv
bid0IHVuZGVyc3RhbmQgd2h5IGNvbnRhaW5lciBndWFyZGluZyB0ZWNobm9sb2d5IGRvZXNuJ3Qg
bGlrZQppb2N0bHM/ICBUaGUgcHJvYmxlbSBpcyBlYWNoIGlvY3RsIGlzIHRoZSBtdWx0aXBsZXhv
ciBpcyBzcGVjaWZpYyB0bwp0aGUgcGFydGljdWxhciBmZCBpbXBsZW1lbnRhdGlvbiwgc28gdW5s
aWtlIGZjbnRsIHlvdSBkb24ndCBoYXZlIGdsb2JhbAppb2N0bCBudW1iZXJzIChhbHRob3VnaCB3
ZSBkbyB0cnkgdG8gc2VwYXJhdGUgdGhlIHNwYWNlIHNvbWV3aGF0IHdpdGgKdGhlIF9JTyBtYWNy
b3MpLiAgVGhpcyBtYWtlcyBhbmFseXNpcyBhbmQgYmxvY2tpbmcgYSBoYXJkIHByb2JsZW0gZm9y
CmNvbnRhaW5lciBzZWNjb21wLgoKPiAgV2hhdCBraW5kIG9mIGZsYWdzIGFyZSB3ZSB0YWxraW5n
IGFib3V0IGFuZCB3aHkgd291bGQgdGhhdCBiZSBhCj4gcHJvYmxlbSB3aXRoIG1lbWZkX2NyZWF0
ZSBpbnRlcmZhY2U/IENvdWxkIHlvdSBiZSBtb3JlIHNwZWNpZmljCj4gcGxlYXNlPwoKWW91IG1l
YW4gd2hhdCB3ZXJlIHRoZSBpb2N0bCBmbGFncyBpbiB0aGUgcGF0Y2ggc2VyaWVzIGxpbmtlZCBh
Ym92ZT8gClRoZXkgd2VyZSBTRUNSRVRNRU1fRVhDTFVTSVZFIGFuZCBTRUNSRVRNRU1fVU5DQUNI
RUQgaW4gcGF0Y2ggMy81LiAKVGhleSB3ZXJlIGV2ZW50dWFsbHkgZHJvcHBlZCBhZnRlciB2MTAs
IGJlY2F1c2Ugb2YgcHJvYmxlbXMgd2l0aAphcmNoaXRlY3R1cmFsIHNlbWFudGljcywgd2l0aCB0
aGUgaWRlYSB0aGF0IGl0IGNvdWxkIGJlIGFkZGVkIGJhY2sKYWdhaW4gaWYgYSBjb21wZWxsaW5n
IG5lZWQgYXJvc2U6CgpodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1hcGkvMjAyMDExMjMw
OTU0MzIuNTg2MC0xLXJwcHRAa2VybmVsLm9yZy8KCkluIHRoZW9yeSB0aGUgZXh0cmEgZmxhZ3Mg
Y291bGQgYmUgbXVsdGlwbGV4ZWQgaW50byB0aGUgbWVtZmRfY3JlYXRlCmZsYWdzIGxpa2UgaHVn
ZXRsYmZzIGlzIGJ1dCB3aXRoIDMyIGZsYWdzIGFuZCBhIGxvdCBhbHJlYWR5IHRha2VuIGl0Cmdl
dHMgbWVzc3kgZm9yIGV4cGFuc2lvbi4gIFdoZW4gd2UgcnVuIG91dCBvZiBmbGFncyB0aGUgZmly
c3QgcXVlc3Rpb24KcGVvcGxlIHdpbGwgYXNrIGlzICJ3aHkgZGlkbid0IHlvdSBkbyBzZXBhcmF0
ZSBzeXN0ZW0gY2FsbHM/Ii4KCkphbWVzCgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
