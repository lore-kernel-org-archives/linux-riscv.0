Return-Path: <SRS0=EWPw=HR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 977DCC433DB
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Feb 2021 09:14:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 371B264E05
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Feb 2021 09:14:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 371B264E05
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FXUGJAGioUN8+vyzE++N5Srh8p1a/7sIMix8f1kdVOY=; b=sLRVs+/s995Oh2bD+FiyGI1BH
	6ntjYUSUX77Kh63D0tNKBEaffMB53GtHFQwq/wDQeUwc7j0Ph5XJPOkhkWoIMzwYTGpDxti5pHXu8
	XnNO9a1+BhliPP/m9Ra2eiSsoD5IXwJm2qscC4uOrZ/F03FzIOR+Faf27u37wCIReE1pex2FE1ZEe
	d1Aedr5uOMxvvl8cCoKOR3SG6NwWD0Humm03P1kwLVfeztrCiP1x8KvvlK+i0q8fR05BiBcgdYlvQ
	BFJwEe/OYwZ9t+CvfKjg/wrfxUYeGsMTpYWNulZoOZRnObbq+95/2eXobhdAOWAPFsfx/grKJBWQ4
	pVnIB5wpw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lBZxB-0006k8-9W; Mon, 15 Feb 2021 09:14:01 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lBZx6-0006iJ-Gd; Mon, 15 Feb 2021 09:13:57 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1613380431; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=miCNDkPWZZBRVJ8Jtr1LFzD24yWA9N0KNTV3BkO+MBs=;
 b=TETHPiEq8kl7uQEKm1Aff4L3NsQE0DM02/lfPkpKudaCI6/5lNvCven/uHuRT24qzIXWlb
 R5BxAqdLhSywOBM2nG5lWN1rFZRScNEvDlYO6zf3OlgEc7VuRTl3HqG4uIymDgc/8zHABu
 C6iAKZCoFVJI6hxssRHEbP17I8dvFo0=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9278BAD19;
 Mon, 15 Feb 2021 09:13:51 +0000 (UTC)
Date: Mon, 15 Feb 2021 10:13:50 +0100
From: Michal Hocko <mhocko@suse.com>
To: James Bottomley <jejb@linux.ibm.com>
Subject: Re: [PATCH v17 07/10] mm: introduce memfd_secret system call to
 create "secret" memory areas
Message-ID: <YCo7TqUnBdgJGkwN@dhcp22.suse.cz>
References: <20210214091954.GM242749@kernel.org>
 <052DACE9-986B-424C-AF8E-D6A4277DE635@redhat.com>
 <244f86cba227fa49ca30cd595c4e5538fe2f7c2b.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <244f86cba227fa49ca30cd595c4e5538fe2f7c2b.camel@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210215_041356_799938_9D3A6081 
X-CRM114-Status: GOOD (  25.28  )
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

T24gU3VuIDE0LTAyLTIxIDExOjIxOjAyLCBKYW1lcyBCb3R0b21sZXkgd3JvdGU6Cj4gT24gU3Vu
LCAyMDIxLTAyLTE0IGF0IDEwOjU4ICswMTAwLCBEYXZpZCBIaWxkZW5icmFuZCB3cm90ZToKPiBb
Li4uXQo+ID4gPiBBbmQgaGVyZSB3ZSBjb21lIHRvIHRoZSBxdWVzdGlvbiAid2hhdCBhcmUgdGhl
IGRpZmZlcmVuY2VzIHRoYXQKPiA+ID4ganVzdGlmeSBhIG5ldyBzeXN0ZW0gY2FsbD8iIGFuZCB0
aGUgYW5zd2VyIHRvIHRoaXMgaXMgdmVyeQo+ID4gPiBzdWJqZWN0aXZlLiBBbmQgYXMgc3VjaCB3
ZSBjYW4gY29udGludWUgYmlrZXNoZWRkaW5nIGZvcmV2ZXIuCj4gPiAKPiA+IEkgdGhpbmsgdGhp
cyBmaXRzIGludG8gdGhlIGV4aXN0aW5nIG1lbWZkX2NyZWF0ZSgpIHN5c2NhbGwganVzdCBmaW5l
LAo+ID4gYW5kIEkgaGVhcmQgbm8gY29tcGVsbGluZyBhcmd1bWVudCB3aHkgaXQgc2hvdWxkbuKA
mHQuIFRoYXTigJhzIGFsbCBJIGNhbgo+ID4gc2F5Lgo+IAo+IE9LLCBzbyBsZXQncyByZXZpZXcg
aGlzdG9yeS4gIEluIHRoZSBmaXJzdCB0d28gaW5jYXJuYXRpb25zIG9mIHRoZQo+IHBhdGNoLCBp
dCB3YXMgYW4gZXh0ZW5zaW9uIG9mIG1lbWZkX2NyZWF0ZSgpLiAgVGhlIHNwZWNpZmljIG9iamVj
dGlvbgo+IGJ5IEtpcmlsbCBTaHV0ZW1vdiB3YXMgdGhhdCBpdCBkb2Vzbid0IHNoYXJlIGFueSBj
b2RlIGluIGNvbW1vbiB3aXRoCj4gbWVtZmQgYW5kIHNvIHNob3VsZCBiZSBhIHNlcGFyYXRlIHN5
c3RlbSBjYWxsOgo+IAo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWFwaS8yMDIwMDcx
MzEwNTgxMi5kbnd0ZGhzdXlqM3hiaDRmQGJveC8KClRoYW5rcyBmb3IgdGhlIHBvaW50ZXIuIEJ1
dCB0aGlzIGFyZ3VtZW50IGhhc24ndCBiZWVuIGNoYWxsZW5nZWQgYXQgYWxsLgpJdCBoYXNuJ3Qg
YmVlbiBicm91Z2h0IHVwIHRoYXQgdGhlIG92ZXJsYXAgd291bGQgYmUgY29uc2lkZXJhYmxlIGhp
Z2hlcgpieSB0aGUgaHVnZXRsYi9zZWFsaW5nIHN1cHBvcnQuIEFuZCBzbyBmYXIgbm9ib2R5IGhh
cyBjbGFpbWVkIHRob3NlCmNvbWJpbmF0aW9ucyBhcyB1bnZpYWJsZS4KCj4gVGhlIG90aGVyIG9i
amVjdGlvbiByYWlzZWQgb2ZmbGlzdCBpcyB0aGF0IGlmIHdlIGRvIHVzZSBtZW1mZF9jcmVhdGUs
Cj4gdGhlbiB3ZSBoYXZlIHRvIGFkZCBhbGwgdGhlIHNlY3JldCBtZW1vcnkgZmxhZ3MgYXMgYW4g
YWRkaXRpb25hbCBpb2N0bCwKPiB3aGVyZWFzIHRoZXkgY2FuIGJlIHNwZWNpZmllZCBvbiBvcGVu
IGlmIHdlIGRvIGEgc2VwYXJhdGUgc3lzdGVtIGNhbGwuIAo+IFRoZSBjb250YWluZXIgcGVvcGxl
IHZpb2xlbnRseSBvYmplY3RlZCB0byB0aGUgaW9jdGwgYmVjYXVzZSBpdCBjYW4ndAo+IGJlIHBy
b3Blcmx5IGFuYWx5c2VkIGJ5IHNlY2NvbXAgYW5kIG11Y2ggcHJlZmVycmVkIHRoZSBzeXNjYWxs
IHZlcnNpb24uCj4gCj4gU2luY2Ugd2UncmUgZHVtcGluZyB0aGUgdW5jYWNoZWQgdmFyaWFudCwg
dGhlIGlvY3RsIHByb2JsZW0gZGlzYXBwZWFycwo+IGJ1dCBzbyBkb2VzIHRoZSBwb3NzaWJpbGl0
eSBvZiBldmVyIGFkZGluZyBpdCBiYWNrIGlmIHdlIHRha2Ugb24gdGhlCj4gY29udGFpbmVyIHBl
b3BsZXMnIG9iamVjdGlvbi4gIFRoaXMgYXJndWVzIGZvciBhIHNlcGFyYXRlIHN5c2NhbGwKPiBi
ZWNhdXNlIHdlIGNhbiBhZGQgYWRkaXRpb25hbCBmZWF0dXJlcyBhbmQgZXh0ZW5kIHRoZSBBUEkg
d2l0aCBmbGFncwo+IHdpdGhvdXQgY2F1c2luZyBhbnRpLWlvY3RsIHJpb3RzLgoKSSBhbSBzb3Jy
eSBidXQgSSBkbyBub3QgdW5kZXJzdGFuZCB0aGlzIGFyZ3VtZW50LiBXaGF0IGtpbmQgb2YgZmxh
Z3MgYXJlCndlIHRhbGtpbmcgYWJvdXQgYW5kIHdoeSB3b3VsZCB0aGF0IGJlIGEgcHJvYmxlbSB3
aXRoIG1lbWZkX2NyZWF0ZQppbnRlcmZhY2U/IENvdWxkIHlvdSBiZSBtb3JlIHNwZWNpZmljIHBs
ZWFzZT8KLS0gCk1pY2hhbCBIb2NrbwpTVVNFIExhYnMKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
