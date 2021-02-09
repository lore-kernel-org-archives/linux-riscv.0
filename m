Return-Path: <SRS0=3nDB=HL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F874C433DB
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Feb 2021 09:54:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D355564E77
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Feb 2021 09:54:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D355564E77
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3XLIH9Wzgxx8juM0WJ9CasG1xY+B0y48ZIYyvUCezGM=; b=VbcdLf+bAkGbMK7t1DPsoNobd
	cAlBmn0oi1O33c+Jimio2rQd1rfoGojyBHXZhaAgp5CcnzXmqWbTkQc9YBM0e8b2D3EPDKVQAASyP
	cBRC24hP0w9145No6J7o9eKNzb50ZX/8f3cG6CLT6qTUXdTDegtxDXl+LkSp0WNinW6xgUPEHdMzB
	+XvJ0RDKhDXbBPTegdKlcOQkaH1CpXrebsqHdnyp5CRhojYvNH6d0lj+hgCvBR4iHN3YCYt7o1/YL
	0UbVAvdYjP6KGV6KAHMK1VKHtZ9uu90+UcwzxsJQrhqgfPX40RG4ePOK8jm7ncB1EbVx4nlKQaiU7
	lbm57PU+w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9Pii-0000Bv-SZ; Tue, 09 Feb 2021 09:54:08 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9PiO-0008Tr-3g; Tue, 09 Feb 2021 09:53:53 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1612864426; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ys4lZa12PW2rFBR9uYb+XrRjecZKizZLu20iG5KOoeU=;
 b=qMkZ7XbqI1d8hRSD4sQuj8GloCeGKTkheB3rXPURIdHzln4FFQIx0n7YjCba0Bw7Yo+suG
 YVH6OFVka1kiTncyA9TPZgvqak3KFQTe+UD6eD7U0V5Q5FCqYqLZFu60NAxFSbvHXVFlM8
 PKcchFgHt4dmUy7k0ra5KqJyGsnIQ0A=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4727BAC43;
 Tue,  9 Feb 2021 09:53:46 +0000 (UTC)
Date: Tue, 9 Feb 2021 10:53:29 +0100
From: Michal Hocko <mhocko@suse.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v17 00/10] mm: introduce memfd_secret system call to
 create "secret" memory areas
Message-ID: <YCJbmR11ikrWKaU8@dhcp22.suse.cz>
References: <20210208211326.GV242749@kernel.org>
 <1F6A73CF-158A-4261-AA6C-1F5C77F4F326@redhat.com>
 <YCJO8zLq8YkXGy8B@dhcp22.suse.cz>
 <662b5871-b461-0896-697f-5e903c23d7b9@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <662b5871-b461-0896-697f-5e903c23d7b9@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_045348_504073_8578C86B 
X-CRM114-Status: GOOD (  38.70  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>,
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
 Arnd Bergmann <arnd@arndb.de>, James Bottomley <jejb@linux.ibm.com>,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
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

T24gVHVlIDA5LTAyLTIxIDEwOjE1OjE3LCBEYXZpZCBIaWxkZW5icmFuZCB3cm90ZToKPiBPbiAw
OS4wMi4yMSAwOTo1OSwgTWljaGFsIEhvY2tvIHdyb3RlOgo+ID4gT24gTW9uIDA4LTAyLTIxIDIy
OjM4OjAzLCBEYXZpZCBIaWxkZW5icmFuZCB3cm90ZToKPiA+ID4gCj4gPiA+ID4gQW0gMDguMDIu
MjAyMSB1bSAyMjoxMyBzY2hyaWViIE1pa2UgUmFwb3BvcnQgPHJwcHRAa2VybmVsLm9yZz46Cj4g
PiA+ID4gCj4gPiA+ID4g77u/T24gTW9uLCBGZWIgMDgsIDIwMjEgYXQgMTA6Mjc6MThBTSArMDEw
MCwgRGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6Cj4gPiA+ID4gPiBPbiAwOC4wMi4yMSAwOTo0OSwg
TWlrZSBSYXBvcG9ydCB3cm90ZToKPiA+ID4gPiA+IAo+ID4gPiA+ID4gU29tZSBxdWVzdGlvbnMg
KGFuZCByZXF1ZXN0IHRvIGRvY3VtZW50IHRoZSBhbnN3ZXJzKSBhcyB3ZSBub3cgYWxsb3cgdG8g
aGF2ZQo+ID4gPiA+ID4gdW5tb3ZhYmxlIGFsbG9jYXRpb25zIGFsbCBvdmVyIHRoZSBwbGFjZSBh
bmQgSSBkb24ndCBzZWUgYSBzaW5nbGUgY29tbWVudAo+ID4gPiA+ID4gcmVnYXJkaW5nIHRoYXQg
aW4gdGhlIGNvdmVyIGxldHRlcjoKPiA+ID4gPiA+IAo+ID4gPiA+ID4gMS4gSG93IHdpbGwgdGhl
IGlzc3VlIG9mIHBsZW50eSBvZiB1bm1vdmFibGUgYWxsb2NhdGlvbnMgZm9yIHVzZXIgc3BhY2Ug
YmUKPiA+ID4gPiA+IHRhY2tsZWQgaW4gdGhlIGZ1dHVyZT8KPiA+ID4gPiA+IAo+ID4gPiA+ID4g
Mi4gSG93IGhhcyB0aGlzIGlzc3VlIGJlZW4gZG9jdW1lbnRlZD8gRS5nLiwgaW50ZXJhY3Rpb24g
d2l0aCBaT05FX01PVkFCTEUKPiA+ID4gPiA+IGFuZCBDTUEsIGFsbG9jX2NvbmlnX3JhbmdlKCkv
YWxsb2NfY29udGlnX3BhZ2VzPy4KPiA+ID4gPiAKPiA+ID4gPiBTZWNyZXRtZW0gc2V0cyB0aGUg
bWFwcGluZ3MgZ2ZwIG1hc2sgdG8gR0ZQX0hJR0hVU0VSLCBzbyBpdCBkb2VzIG5vdAo+ID4gPiA+
IGFsbG9jYXRlIG1vdmFibGUgcGFnZXMgYXQgdGhlIGZpcnN0IHBsYWNlLgo+ID4gPiAKPiA+ID4g
VGhhdCBpcyBub3QgdGhlIHBvaW50LiBTZWNyZXRtZW0gY2Fubm90IGdvIG9uIENNQSAvIFpPTkVf
TU9WQUJMRQo+ID4gPiBtZW1vcnkgYW5kIGJlaGF2ZXMgbGlrZSBsb25nLXRlcm0gcGlubmluZ3Mg
aW4gdGhhdCBzZW5zZS4gVGhpcyBpcyBhCj4gPiA+IHJlYWwgaXNzdWUgd2hlbiB1c2luZyBhIGxv
dCBvZiBzZWN0cmVtZW0uCj4gPiAKPiA+IEEgbG90IG9mIHVuZXZpY3RhYmxlIG1lbW9yeSBpcyBh
IGNvbmNlcm4gcmVnYXJkbGVzcyBvZiBDTUEvWk9ORV9NT1ZBQkxFLgo+ID4gQXMgSSd2ZSBzYWlk
IGl0IGlzIHF1aXRlIGVhc3kgdG8gbGFuZCBhdCB0aGUgc2ltaWxhciBzaXR1YXRpb24gZXZlbiB3
aXRoCj4gPiB0bXBmcy9NQVBfQU5PTnxNQVBfU0hBUkVEIG9uIHN3YXBsZXNzIHN5c3RlbS4gTmVp
dGhlciBvZiB0aGUgdHdvIGlzCj4gPiByZWFsbHkgdW5jb21tb24uIEl0IHdvdWxkIGJlIGV2ZW4g
d29yc2UgdGhhdCB0aG9zZSB3b3VsZCBiZSBhbGxvd2VkIHRvCj4gPiBjb25zdW1lIGJvdGggQ01B
L1pPTkVfTU9WQUJMRS4KPiAKPiBJSVJDLCB0bXBmcy9NQVBfQU5PTnxNQVBfU0hBUkVEIG1lbW9y
eQo+IGEpIElzIG1vdmFibGUsIGNhbiBsYW5kIGluIFpPTkVfTU9WQUJMRS9DTUEKPiBiKSBDYW4g
YmUgbGltaXRlZCBieSBzaXppbmcgdG1wZnMgYXBwcm9wcmlhdGVseQo+IAo+IEFGQUlLLCB3aGF0
IHlvdSBkZXNjcmliZSBpcyBhIHByb2JsZW0gd2l0aCBtZW1vcnkgb3ZlcmNvbW1pdCwgbm90IHdp
dGggem9uZQo+IGltYmFsYW5jZXMgKGJlbG93KS4gT3Igd2hhdCBhbSBJIG1pc3Npbmc/CgpJdCBj
YW4gYmUgcHJvYmxlbSBmb3IgYm90aC4gSWYgeW91IGhhdmUganVzdCB0b28gbXVjaCBvZiBzaG0g
KGRvIG5vdApmb3JnZXQgYWJvdXQgTUFQX1NIQVJFRHxNQVBfQU5PTiB3aGljaCBpcyBtdWNoIGhh
cmRlciB0byBzaXplIGZyb20gYW4KYWRtaW4gUE9WKSB0aGVuIG1pZ3JhdGVhYmlsaXR5IGRvZXNu
J3QgcmVhbGx5IGhlbHAgYmVjYXVzZSB5b3UgbmVlZCBhCmZyZWUgbWVtb3J5IHRvIG1pZ3JhdGUu
IFdpdGhvdXQgcmVjbGFpbWFiaWxpdHkgdGhpcyBjYW4gZWFzaWx5IGJlY29tZSBhCnByb2JsZW0u
IFRoYXQgaXMgd2h5IEkgYW0gc2F5aW5nIHRoaXMgaXMgbm90IHJlYWxseSBhIG5ldyBwcm9ibGVt
LgpTd2FwbGVzcyBzeXN0ZW1zIGFyZSBub3QgYWxsIHRoYXQgdW5jb21tb24uCiAKPiA+IE9uZSBo
YXMgdG8gYmUgdmVyeSBjYXJlZnVsIHdoZW4gcmVseWluZyBvbiBDTUEgb3IgbW92YWJsZSB6b25l
cy4gVGhpcyBpcwo+ID4gZGVmaW5pdGVseSB3b3J0aCBhIGNvbW1lbnQgaW4gdGhlIGtlcm5lbCBj
b21tYW5kIGxpbmUgcGFyYW1ldGVyCj4gPiBkb2N1bWVudGF0aW9uLiBCdXQgdGhpcyBpcyBub3Qg
YSBuZXcgcHJvYmxlbS4KPiAKPiBJIHNlZSB0aGUgZm9sbG93aW5nIHRoaW5nIHdvcnRoIGRvY3Vt
ZW50aW5nOgo+IAo+IEFzc3VtZSB5b3UgaGF2ZSBhIHN5c3RlbSB3aXRoIDJHQiBvZiBaT05FX05P
Uk1BTC9aT05FX0RNQSBhbmQgNEdCIG9mCj4gWk9ORV9NT1ZBQkxFL0NNQS4KPiAKPiBBc3N1bWUg
eW91IG1ha2UgdXNlIG9mIDEuNUdCIG9mIHNlY3JldG1lbS4gWW91ciBzeXN0ZW0gbWlnaHQgcnVu
IGludG8gT09NCj4gYW55IHRpbWUgYWx0aG91Z2ggeW91IHN0aWxsIGhhdmUgcGxlbnR5IG9mIG1l
bW9yeSBvbiBaT05FX01PVkFWTEUgKGFuZCBldmVuCj4gc3dhcCEpLCBzaW1wbHkgYmVjYXVzZSB5
b3UgYXJlIG1ha2luZyBleGNlc3NpdmUgdXNlIG9mIHVubW92YWJsZSBhbGxvY2F0aW9ucwo+IChm
b3IgdXNlciBzcGFjZSEpIGluIGFuIGVudmlyb25tZW50IHdoZXJlIHlvdSBzaG91bGQgbm90IG1h
a2UgZXhjZXNzaXZlIHVzZQo+IG9mIHVubW92YWJsZSBhbGxvY2F0aW9ucyAoZS5nLiwgd2hlcmUg
c2hvdWxkIHBhZ2UgdGFibGVzIGdvPykuCgp5ZXMsIHlvdSBhcmUgcmlnaHQgb2YgY291cnNlIGFu
ZCBJIGFtIG5vdCByZWFsbHkgZGlzcHV0aW5nIHRoaXMuIEJ1dCBJCndvdWxkIGFyZ3VlIHRoYXQg
MjoxIE1vdmFibGUvTm9ybWFsIGlzIHNvbWV0aGluZyB0byBleHBlY3QgcHJvYmxlbXMKYWxyZWFk
eS4gIkxvd21lbSIgYWxsb2NhdGlvbnMgY2FuIGVhc2lseSB0cmlnZ2VyIE9PTSBldmVuIHdpdGhv
dXQgc2VjcmV0Cm1lbSBpbiB0aGUgcGljdHVyZS4gSXQgYWxsIGp1c3QgdGFrZXMgdG8gYWxsb2Nh
dGUgYSBsb3Qgb2YgR0ZQX0tFUk5FTCBvcgpldmVuIEdGUF97SElHSH1VU0VSLiBSZWFsbHksIGl0
IGlzIENNQS9NT1ZBQkxFIHRoYXQgYXJlIGVsZXBoYW50IGluIHRoZQpyb29tIGFuZCBvbmUgaGFz
IHRvIGJlIHJlYWxseSBjYXJlZnVsIHdoZW4gcmVseWluZyBvbiB0aGVtLgogCj4gVGhlIGV4aXN0
aW5nIGNvbnRyb2xzIChtbG9jayBsaW1pdCkgZG9uJ3QgcmVhbGx5IG1hdGNoIHRoZSBjdXJyZW50
IHNlbWFudGljcwo+IG9mIHRoYXQgbWVtb3J5LiBJIHJlcGVhdCBpdCBvbmNlIGFnYWluOiBzZWNy
ZXRtZW0gKmN1cnJlbnRseSogcmVzZW1ibGVzCj4gbG9uZy10ZXJtIHBpbm5lZCBtZW1vcnksIG5v
dCBtbG9ja2VkIG1lbW9yeS4KCldlbGwsIGlmIHdlIGhhZCBhIHByb3BlciB1c2VyIHNwYWNlIHBp
bm5pbmcgYWNjb3VudGluZyB0aGVuIEkgd291bGQKYWdyZWUgdGhhdCB0aGVyZSBpcyBhIGJldHRl
ciBtb2RlbCB0byB1c2UuIEJ1dCB3ZSBkb24ndC4gQW5kIHByZXZpb3VzCmF0dGVtcHRzIHRvIGFj
aGlldmUgdGhhdCBoYXZlIGZhaWxlZC4gU28gSSBhbSBhZnJhaWQgdGhhdCB3ZSBkbyBub3QgaGF2
ZQptdWNoIGNob2ljZSBsZWZ0IHRoYW4gdXNpbmcgbWxvY2sgYXMgYSBtb2RlbC4KCj4gVGhpbmdz
IHdpbGwgY2hhbmdlIHdoZW4KPiBpbXBsZW1lbnRpbmcgbWlncmF0aW9uIHN1cHBvcnQgZm9yIHNl
Y3JldG1lbSBwYWdlcy4gVW50aWwgdGhlbiwgdGhlCj4gc2VtYW50aWNzIGFyZSBkaWZmZXJlbnQg
YW5kIHRoaXMgc2hvdWxkIGJlIHNwZWxsZWQgb3V0Lgo+IAo+IEZvciBsb25nLXRlcm0gcGlubmlu
Z3MgdGhpcyBpcyBraW5kIG9mIG9idmlvdXMsIHN0aWxsIHdlJ3JlIG5vdyBkb2N1bWVudGluZwo+
IGl0IGJlY2F1c2UgaXQncyBkYW5nZXJvdXMgdG8gbm90IGJlIGF3YXJlIG9mLiBTZWNyZXRtZW0g
YmVoYXZlcyBleGFjdGx5IHRoZQo+IHNhbWUgYW5kIEkgdGhpbmsgdGhpcyBpcyB3b3J0aCBzcGVs
bGluZyBvdXQ6IHNlY3JldG1lbSBoYXMgdGhlIHBvdGVudGlhbCBvZgo+IGJlaW5nIHVzZWQgbXVj
aCBtb3JlIG9mdGVuIHRoYW4gZmFpcmx5IHNwZWNpYWwgdmZpby9yZG1hLyAuLi4KCnllYWggSSBk
byBhZ3JlZSB0aGF0IHBpbm5pbmcgaXMgYSBwcm9ibGVtIGZvciBtb3ZhYmxlL0NNQSBidXQgbW9z
dApwZW9wbGUgc2ltcGx5IGRvIG5vdCBjYXJlIGFib3V0IHRob3NlLiBNb3ZhYmxlIGlzIHRoZSB0
aGluZyBmb3IgaG9wdGx1ZwphbmQgYSByZWFsbHkgd2VpcmQgZnJhZ21lbnRhdGlvbiBhdm9pZGFu
Y2UgSUlSQyBhbmQgQ01BIGlzIG1vc3RseSB0bwpoYW5kbGUgY3JhcCBIVy4gSWYgdGhvc2UgYXJl
IHRvIGJlIHVzZWQgYWxvbmcgd2l0aCBzZWNyZXQgbWVtIG9yCmxvbmd0ZXJtIEdVUCB0aGVuIHRo
ZXkgd2lsbCBjb25zdGFudGx5IGJ1bXAgaW50byBjb3JuZXIgY2FzZXMuIERvIG5vdAp0YWtlIG1l
IHdyb25nLCB3ZSBzaG91bGQgYmUgbG9va2luZyBhdCB0aG9zZSBwcm9ibGVtcywgd2Ugc2hvdWxk
IGV2ZW4KZG9jdW1lbnQgdGhlbSBidXQgSSBkbyBub3Qgc2VlIHRoaXMgYXMgYW55dGhpbmcgbmV3
LiBXZSBzaG91bGQgcHJvYmFibHkKaGF2ZSBhIGNlbnRyYWwgcGxhY2UgaW4gRG9jdW1lbnRhdGlv
biBleHBsYWluaW5nIGFsbCB0aG9zZSBwcm9ibGVtcy4gSQp3b3VsZCBiZSBldmVuIGhhcHB5IHRv
IHNlZSBhbiBleHBsaWNpdCBub3RlIGluIHRoZSB0dW5hYmxlcyAtIGUuZy4KY29uZmlndXJpbmcg
bW92YWJsZS9ub3JtYWwgaW4gMjoxIHdpbGwgZ2V0IHlvdSBiYWNrIHRvIDMyYiB0aW1lcyB3cnQu
CmxvdyBtZW0gcHJvYmxlbXMuCi0tIApNaWNoYWwgSG9ja28KU1VTRSBMYWJzCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
