Return-Path: <SRS0=+hEn=HQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13D2FC433E0
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Feb 2021 19:22:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FC7164E2C
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Feb 2021 19:22:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6FC7164E2C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8SzFnyLGrAVhbvjFFBmABR+L0laJl+kDWfpPTwNcAc0=; b=FYaNgBSDLOSh77wuns2w4b4GtD
	f/B7toJHhTkgJhu9jw9HSwPtq2/JhT1KQ7GGHebsvp0yf0CRn1x1aTjQpDYYoWzPZctxAzBGkolKx
	8qwURaqFV+S5lWsbh5aDY80/eYsM2rtvQrBwoXlog9H313+Klm0eaNndahsUxQRwN5mL/L+U6Xzuo
	7hKx9UhEt75d7vYa35gU8UDbhzwzQzwA3vb0gBXKkWRaxKc66fKX20oE/1uurmxUuFj4g8gZif0aA
	6PLUL5xEFwQhbgOayCRka6AeXcVNVbcoDxgRw73S6RJg8Q9TN8EH0ceLasBuZ5kcTBaIsVpAS3oCk
	an6GZ+Yg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lBMy2-0002mx-Gi; Sun, 14 Feb 2021 19:22:02 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lBMxx-0002mI-R3; Sun, 14 Feb 2021 19:21:59 +0000
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 11EJ2Rjv004234; Sun, 14 Feb 2021 14:21:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=2HSfs+PHnEoAspVggOn3BgvrrXw9WRy1/NNpdkKxiCQ=;
 b=AZF0XAteS7BybRomRYX1JsIb2ozox9iZcsuANYL0RXt1DOGpH5dDZncHkhOo1MmCqO6N
 bN9wDwYuysQC6qwZbZvf0iJ5XmeNG1OR+xeJIVS2mYsLLxHM6iTaq0y08eK4tADF0CEA
 fkKoOtagmhJTVKNKvvgmVoCVGUffCCrVq0F4GQp/Z4xrqebHU1nVIEsLWO+HWe+bCS6r
 bxMHJhhpU5/ixYri+C6GmE6c9iFjLYxsnQtsC23Dv5jV6sm/gZX8ewVelDj99njvNoVd
 /xsREIEyrQHhgvKq8L1FVYyY6/sCJqI4CmD3ZR5qi97i+5qF8aX1c+uVIqwzH+Ok2HJK Dw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36q9nk09b6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 14 Feb 2021 14:21:13 -0500
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 11EJ2LTu003594;
 Sun, 14 Feb 2021 14:21:12 -0500
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36q9nk09ar-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 14 Feb 2021 14:21:12 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11EJHkRa014564;
 Sun, 14 Feb 2021 19:21:11 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma04wdc.us.ibm.com with ESMTP id 36p6d8j9rj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 14 Feb 2021 19:21:11 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11EJLAVZ11862324
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 14 Feb 2021 19:21:10 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B369B7805E;
 Sun, 14 Feb 2021 19:21:10 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 372EB7805C;
 Sun, 14 Feb 2021 19:21:04 +0000 (GMT)
Received: from jarvis.int.hansenpartnership.com (unknown [9.85.199.127])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Sun, 14 Feb 2021 19:21:03 +0000 (GMT)
Message-ID: <244f86cba227fa49ca30cd595c4e5538fe2f7c2b.camel@linux.ibm.com>
Subject: Re: [PATCH v17 07/10] mm: introduce memfd_secret system call to
 create "secret" memory areas
From: James Bottomley <jejb@linux.ibm.com>
To: David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>
Date: Sun, 14 Feb 2021 11:21:02 -0800
In-Reply-To: <052DACE9-986B-424C-AF8E-D6A4277DE635@redhat.com>
References: <20210214091954.GM242749@kernel.org>
 <052DACE9-986B-424C-AF8E-D6A4277DE635@redhat.com>
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-14_06:2021-02-12,
 2021-02-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=828 clxscore=1015
 mlxscore=0 bulkscore=0 spamscore=0 suspectscore=0 impostorscore=0
 phishscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102140159
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210214_142158_343920_0FDA9351 
X-CRM114-Status: GOOD (  23.33  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Michal Hocko <mhocko@suse.com>,
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
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Roman Gushchin <guro@fb.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gU3VuLCAyMDIxLTAyLTE0IGF0IDEwOjU4ICswMTAwLCBEYXZpZCBIaWxkZW5icmFuZCB3cm90
ZToKWy4uLl0KPiA+IEFuZCBoZXJlIHdlIGNvbWUgdG8gdGhlIHF1ZXN0aW9uICJ3aGF0IGFyZSB0
aGUgZGlmZmVyZW5jZXMgdGhhdAo+ID4ganVzdGlmeSBhIG5ldyBzeXN0ZW0gY2FsbD8iIGFuZCB0
aGUgYW5zd2VyIHRvIHRoaXMgaXMgdmVyeQo+ID4gc3ViamVjdGl2ZS4gQW5kIGFzIHN1Y2ggd2Ug
Y2FuIGNvbnRpbnVlIGJpa2VzaGVkZGluZyBmb3JldmVyLgo+IAo+IEkgdGhpbmsgdGhpcyBmaXRz
IGludG8gdGhlIGV4aXN0aW5nIG1lbWZkX2NyZWF0ZSgpIHN5c2NhbGwganVzdCBmaW5lLAo+IGFu
ZCBJIGhlYXJkIG5vIGNvbXBlbGxpbmcgYXJndW1lbnQgd2h5IGl0IHNob3VsZG7igJh0LiBUaGF0
4oCYcyBhbGwgSSBjYW4KPiBzYXkuCgpPSywgc28gbGV0J3MgcmV2aWV3IGhpc3RvcnkuICBJbiB0
aGUgZmlyc3QgdHdvIGluY2FybmF0aW9ucyBvZiB0aGUKcGF0Y2gsIGl0IHdhcyBhbiBleHRlbnNp
b24gb2YgbWVtZmRfY3JlYXRlKCkuICBUaGUgc3BlY2lmaWMgb2JqZWN0aW9uCmJ5IEtpcmlsbCBT
aHV0ZW1vdiB3YXMgdGhhdCBpdCBkb2Vzbid0IHNoYXJlIGFueSBjb2RlIGluIGNvbW1vbiB3aXRo
Cm1lbWZkIGFuZCBzbyBzaG91bGQgYmUgYSBzZXBhcmF0ZSBzeXN0ZW0gY2FsbDoKCmh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2xpbnV4LWFwaS8yMDIwMDcxMzEwNTgxMi5kbnd0ZGhzdXlqM3hiaDRm
QGJveC8KClRoZSBvdGhlciBvYmplY3Rpb24gcmFpc2VkIG9mZmxpc3QgaXMgdGhhdCBpZiB3ZSBk
byB1c2UgbWVtZmRfY3JlYXRlLAp0aGVuIHdlIGhhdmUgdG8gYWRkIGFsbCB0aGUgc2VjcmV0IG1l
bW9yeSBmbGFncyBhcyBhbiBhZGRpdGlvbmFsIGlvY3RsLAp3aGVyZWFzIHRoZXkgY2FuIGJlIHNw
ZWNpZmllZCBvbiBvcGVuIGlmIHdlIGRvIGEgc2VwYXJhdGUgc3lzdGVtIGNhbGwuIApUaGUgY29u
dGFpbmVyIHBlb3BsZSB2aW9sZW50bHkgb2JqZWN0ZWQgdG8gdGhlIGlvY3RsIGJlY2F1c2UgaXQg
Y2FuJ3QKYmUgcHJvcGVybHkgYW5hbHlzZWQgYnkgc2VjY29tcCBhbmQgbXVjaCBwcmVmZXJyZWQg
dGhlIHN5c2NhbGwgdmVyc2lvbi4KClNpbmNlIHdlJ3JlIGR1bXBpbmcgdGhlIHVuY2FjaGVkIHZh
cmlhbnQsIHRoZSBpb2N0bCBwcm9ibGVtIGRpc2FwcGVhcnMKYnV0IHNvIGRvZXMgdGhlIHBvc3Np
YmlsaXR5IG9mIGV2ZXIgYWRkaW5nIGl0IGJhY2sgaWYgd2UgdGFrZSBvbiB0aGUKY29udGFpbmVy
IHBlb3BsZXMnIG9iamVjdGlvbi4gIFRoaXMgYXJndWVzIGZvciBhIHNlcGFyYXRlIHN5c2NhbGwK
YmVjYXVzZSB3ZSBjYW4gYWRkIGFkZGl0aW9uYWwgZmVhdHVyZXMgYW5kIGV4dGVuZCB0aGUgQVBJ
IHdpdGggZmxhZ3MKd2l0aG91dCBjYXVzaW5nIGFudGktaW9jdGwgcmlvdHMuCgpKYW1lcwoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
