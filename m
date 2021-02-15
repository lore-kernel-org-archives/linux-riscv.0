Return-Path: <SRS0=EWPw=HR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F6B9C433E0
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Feb 2021 19:21:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D5F564E13
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Feb 2021 19:21:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D5F564E13
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ChLk9eIFUX2CEZNh5X81Z+EcHH3FLA21y5c9AwCPqSY=; b=B2uVQjB+BDnbcubJ0Av5dw3II
	Bo5KrjcjYkpJm+fnVykqLEs3B4QMA2kRZeVZ/YBij+SHpN+rcZOdaGoNGSQtwX5eeQHWMyQkxR1jx
	Gc5mzAHYNv/ve0UDBV+ebPQLTIvKzhYODHJvJRYOwdlbXjuYPqmQo4dtAG/uJweWMf02ix8rfzd2I
	tLFQ5Vo/alM2EsQTd0UMHu2lSiP3YV2xn2vzwZbHPq2sKP19FMqiN/UxYMWk3eY8GfwV+t02+iupV
	5Vq0MJpHTmQAw0KQEpXzstZpWD8RJqQI5+FrC/SOTrWfQU5rfvwZBNlaKuE57EwW7tmB0U0vWXzaF
	Gz36j5dcA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lBjQV-0000Si-5G; Mon, 15 Feb 2021 19:20:55 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lBjQP-0000Qh-8p; Mon, 15 Feb 2021 19:20:50 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1613416848; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=35iSk0+5UfxNhbQoMoqK8Z0u+AvwuK5VeLDZ0BFtGgc=;
 b=LxudusPDnEIzx32bpsNd8eGk9aEHEp8nORbgbhfo9m/WaYQJNvskWIV49SwUk+3e+wUm6W
 bvkuJfdiurilR7t9l+AqCl48/0xWlWnh1jxDaWj32SfJk9fDbkh0PhlICshQRWBYaiM9H0
 Cssa+KhpPwQxypJN/O8+L/ThpHbYF+4=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C9B2BAC32;
 Mon, 15 Feb 2021 19:20:47 +0000 (UTC)
Date: Mon, 15 Feb 2021 20:20:45 +0100
From: Michal Hocko <mhocko@suse.com>
To: James Bottomley <jejb@linux.ibm.com>
Subject: Re: [PATCH v17 07/10] mm: introduce memfd_secret system call to
 create "secret" memory areas
Message-ID: <YCrJjYmr7A2nO6lA@dhcp22.suse.cz>
References: <20210214091954.GM242749@kernel.org>
 <052DACE9-986B-424C-AF8E-D6A4277DE635@redhat.com>
 <244f86cba227fa49ca30cd595c4e5538fe2f7c2b.camel@linux.ibm.com>
 <YCo7TqUnBdgJGkwN@dhcp22.suse.cz>
 <be1d821d3f0aec24ad13ca7126b4359822212eb0.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <be1d821d3f0aec24ad13ca7126b4359822212eb0.camel@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210215_142049_584887_5A0F8774 
X-CRM114-Status: GOOD (  43.48  )
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

T24gTW9uIDE1LTAyLTIxIDEwOjE0OjQzLCBKYW1lcyBCb3R0b21sZXkgd3JvdGU6Cj4gT24gTW9u
LCAyMDIxLTAyLTE1IGF0IDEwOjEzICswMTAwLCBNaWNoYWwgSG9ja28gd3JvdGU6Cj4gPiBPbiBT
dW4gMTQtMDItMjEgMTE6MjE6MDIsIEphbWVzIEJvdHRvbWxleSB3cm90ZToKPiA+ID4gT24gU3Vu
LCAyMDIxLTAyLTE0IGF0IDEwOjU4ICswMTAwLCBEYXZpZCBIaWxkZW5icmFuZCB3cm90ZToKPiA+
ID4gWy4uLl0KPiA+ID4gPiA+IEFuZCBoZXJlIHdlIGNvbWUgdG8gdGhlIHF1ZXN0aW9uICJ3aGF0
IGFyZSB0aGUgZGlmZmVyZW5jZXMgdGhhdAo+ID4gPiA+ID4ganVzdGlmeSBhIG5ldyBzeXN0ZW0g
Y2FsbD8iIGFuZCB0aGUgYW5zd2VyIHRvIHRoaXMgaXMgdmVyeQo+ID4gPiA+ID4gc3ViamVjdGl2
ZS4gQW5kIGFzIHN1Y2ggd2UgY2FuIGNvbnRpbnVlIGJpa2VzaGVkZGluZyBmb3JldmVyLgo+ID4g
PiA+IAo+ID4gPiA+IEkgdGhpbmsgdGhpcyBmaXRzIGludG8gdGhlIGV4aXN0aW5nIG1lbWZkX2Ny
ZWF0ZSgpIHN5c2NhbGwganVzdAo+ID4gPiA+IGZpbmUsIGFuZCBJIGhlYXJkIG5vIGNvbXBlbGxp
bmcgYXJndW1lbnQgd2h5IGl0IHNob3VsZG7igJh0LiBUaGF04oCYcwo+ID4gPiA+IGFsbCBJIGNh
biBzYXkuCj4gPiA+IAo+ID4gPiBPSywgc28gbGV0J3MgcmV2aWV3IGhpc3RvcnkuICBJbiB0aGUg
Zmlyc3QgdHdvIGluY2FybmF0aW9ucyBvZiB0aGUKPiA+ID4gcGF0Y2gsIGl0IHdhcyBhbiBleHRl
bnNpb24gb2YgbWVtZmRfY3JlYXRlKCkuICBUaGUgc3BlY2lmaWMKPiA+ID4gb2JqZWN0aW9uIGJ5
IEtpcmlsbCBTaHV0ZW1vdiB3YXMgdGhhdCBpdCBkb2Vzbid0IHNoYXJlIGFueSBjb2RlIGluCj4g
PiA+IGNvbW1vbiB3aXRoIG1lbWZkIGFuZCBzbyBzaG91bGQgYmUgYSBzZXBhcmF0ZSBzeXN0ZW0g
Y2FsbDoKPiA+ID4gCj4gPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWFwaS8yMDIw
MDcxMzEwNTgxMi5kbnd0ZGhzdXlqM3hiaDRmQGJveC8KPiA+IAo+ID4gVGhhbmtzIGZvciB0aGUg
cG9pbnRlci4gQnV0IHRoaXMgYXJndW1lbnQgaGFzbid0IGJlZW4gY2hhbGxlbmdlZCBhdAo+ID4g
YWxsLiBJdCBoYXNuJ3QgYmVlbiBicm91Z2h0IHVwIHRoYXQgdGhlIG92ZXJsYXAgd291bGQgYmUg
Y29uc2lkZXJhYmxlCj4gPiBoaWdoZXIgYnkgdGhlIGh1Z2V0bGIvc2VhbGluZyBzdXBwb3J0LiBB
bmQgc28gZmFyIG5vYm9keSBoYXMgY2xhaW1lZAo+ID4gdGhvc2UgY29tYmluYXRpb25zIGFzIHVu
dmlhYmxlLgo+IAo+IEtpcmlsbCBpcyBhY3R1YWxseSBpbnRlcmVzdGVkIGluIHRoZSBzZWFsaW5n
IHBhdGggZm9yIGhpcyBLVk0gY29kZSBzbwo+IHdlIHRvb2sgYSBsb29rLiAgVGhlcmUgbWlnaHQg
YmUgYSB0d28gbGluZSBvdmVybGFwIGluIG1lbWZkX2NyZWF0ZSBmb3IKPiB0aGUgc2VhbCBjYXNl
LCBidXQgdGhlcmUncyBubyByZWFsIG92ZXJsYXAgaW4gbWVtZmRfYWRkX3NlYWxzIHdoaWNoIGlz
Cj4gdGhlIGJ1bGsgb2YgdGhlIGNvZGUuICBTbyB0aGUgYmVzdCB3YXkgd291bGQgc2VlbSB0byBs
aWZ0IHRoZSBpbm9kZSAuLi4KPiAtPiBzZWFscyBoZWxwZXJzIHRvIGJlIG5vbi1zdGF0aWMgc28g
dGhleSBjYW4gYmUgcmV1c2VkIGFuZCByb2xsIG91cgo+IG93biBhZGRfc2VhbHMuCgpUaGVzZSBh
cmUgaW1wbGVtZW50YXRpb24gZGV0YWlscyB3aGljaCBhcmUgbm90IHJlYWxseSByZWxldmFudCB0
byB0aGUKQVBJIElNSE8uIAoKPiBJIGNhbid0IHNlZSBhIHVzZSBjYXNlIGF0IGFsbCBmb3IgaHVn
ZXRsYiBzdXBwb3J0LCBzbyBpdCBzZWVtcyB0byBiZSBhCj4gYml0IG9mIGFuIGFuZ2VscyBvbiBw
aW4gaGVhZCBkaXNjdXNzaW9uLiAgSG93ZXZlciwgaWYgb25lIHdlcmUgdG8gY29tZQo+IGFsb25n
IGhhbmRsaW5nIGl0IGluIHRoZSBzYW1lIHdheSBzZWVtcyByZWFzb25hYmxlLgoKVGhvc2UgYW5n
ZWxzIGhhdmUgbWFkZSB0aGVpciB3YXkgdG8gbW1hcCwgU3lzdGVtIFYgc2htLCBtZW1mZF9jcmVh
dGUgYW5kCm90aGVyIE1NIGludGVyZmFjZXMgd2hpY2ggaGF2ZSBuZXZlciBlbnZpc2lvbmVkIHdo
ZW4gaW50cm9kdWNlZC4gSHVnZXRsYgpwYWdlcyB0byBiYWNrIGd1ZXN0IG1lbW9yeSBpcyBxdWl0
ZSBhIGNvbW1vbiB1c2VjYXNlIHNvIHdoeSBkbyB5b3UgdGhpbmsKdGhvc2UgZ3Vlc3RzIHdvdWxk
bid0IGxpa2UgdG8gc2VlIHRoZWlyIG1lbW9yeSBiZSAic2VjcmV0Ij8KCkFzIEkndmUgc2FpZCBp
biBteSBsYXN0IHJlc3BvbnNlIChZQ1pFR3VMSzk0c3pLWkRmQGRoY3AyMi5zdXNlLmN6KSwgSSBh
bQpub3QgZ29pbmcgdG8gYXJndWUgYWxsIHRoZXNlIGFnYWluLiBJIGhhdmUgbWFkZSBteSBwb2lu
dCBhbmQgeW91IGFyZQpmcmVlIHRvIHRha2UgaXQgb3IgbGVhdmUgaXQuCgo+ID4gPiBUaGUgb3Ro
ZXIgb2JqZWN0aW9uIHJhaXNlZCBvZmZsaXN0IGlzIHRoYXQgaWYgd2UgZG8gdXNlCj4gPiA+IG1l
bWZkX2NyZWF0ZSwgdGhlbiB3ZSBoYXZlIHRvIGFkZCBhbGwgdGhlIHNlY3JldCBtZW1vcnkgZmxh
Z3MgYXMgYW4KPiA+ID4gYWRkaXRpb25hbCBpb2N0bCwgd2hlcmVhcyB0aGV5IGNhbiBiZSBzcGVj
aWZpZWQgb24gb3BlbiBpZiB3ZSBkbyBhCj4gPiA+IHNlcGFyYXRlIHN5c3RlbSBjYWxsLiAgVGhl
IGNvbnRhaW5lciBwZW9wbGUgdmlvbGVudGx5IG9iamVjdGVkIHRvCj4gPiA+IHRoZSBpb2N0bCBi
ZWNhdXNlIGl0IGNhbid0IGJlIHByb3Blcmx5IGFuYWx5c2VkIGJ5IHNlY2NvbXAgYW5kIG11Y2gK
PiA+ID4gcHJlZmVycmVkIHRoZSBzeXNjYWxsIHZlcnNpb24uCj4gPiA+IAo+ID4gPiBTaW5jZSB3
ZSdyZSBkdW1waW5nIHRoZSB1bmNhY2hlZCB2YXJpYW50LCB0aGUgaW9jdGwgcHJvYmxlbQo+ID4g
PiBkaXNhcHBlYXJzIGJ1dCBzbyBkb2VzIHRoZSBwb3NzaWJpbGl0eSBvZiBldmVyIGFkZGluZyBp
dCBiYWNrIGlmIHdlCj4gPiA+IHRha2Ugb24gdGhlIGNvbnRhaW5lciBwZW9wbGVzJyBvYmplY3Rp
b24uICBUaGlzIGFyZ3VlcyBmb3IgYQo+ID4gPiBzZXBhcmF0ZSBzeXNjYWxsIGJlY2F1c2Ugd2Ug
Y2FuIGFkZCBhZGRpdGlvbmFsIGZlYXR1cmVzIGFuZCBleHRlbmQKPiA+ID4gdGhlIEFQSSB3aXRo
IGZsYWdzIHdpdGhvdXQgY2F1c2luZyBhbnRpLWlvY3RsIHJpb3RzLgo+ID4gCj4gPiBJIGFtIHNv
cnJ5IGJ1dCBJIGRvIG5vdCB1bmRlcnN0YW5kIHRoaXMgYXJndW1lbnQuCj4gCj4gWW91IGRvbid0
IHVuZGVyc3RhbmQgd2h5IGNvbnRhaW5lciBndWFyZGluZyB0ZWNobm9sb2d5IGRvZXNuJ3QgbGlr
ZQo+IGlvY3Rscz8KCk5vLCBJIGRpZCBub3Qgc2VlIHdoZXJlIHRoZSBpb2N0bCBhcmd1bWVudCBj
YW1lIGZyb20uCgpbLi4uXQoKPiA+ICBXaGF0IGtpbmQgb2YgZmxhZ3MgYXJlIHdlIHRhbGtpbmcg
YWJvdXQgYW5kIHdoeSB3b3VsZCB0aGF0IGJlIGEKPiA+IHByb2JsZW0gd2l0aCBtZW1mZF9jcmVh
dGUgaW50ZXJmYWNlPyBDb3VsZCB5b3UgYmUgbW9yZSBzcGVjaWZpYwo+ID4gcGxlYXNlPwo+IAo+
IFlvdSBtZWFuIHdoYXQgd2VyZSB0aGUgaW9jdGwgZmxhZ3MgaW4gdGhlIHBhdGNoIHNlcmllcyBs
aW5rZWQgYWJvdmU/IAo+IFRoZXkgd2VyZSBTRUNSRVRNRU1fRVhDTFVTSVZFIGFuZCBTRUNSRVRN
RU1fVU5DQUNIRUQgaW4gcGF0Y2ggMy81LiAKCk9LIEkgc2VlLiBIb3cgbWFueSBwb3RlbnRpYWwg
bW9kZXMgYXJlIHdlIHRhbGtpbmcgYWJvdXQ/IEEgZmV3IG9yCnBvdGVudGlhbGx5IG1hbnk/Cgo+
IFRoZXkgd2VyZSBldmVudHVhbGx5IGRyb3BwZWQgYWZ0ZXIgdjEwLCBiZWNhdXNlIG9mIHByb2Js
ZW1zIHdpdGgKPiBhcmNoaXRlY3R1cmFsIHNlbWFudGljcywgd2l0aCB0aGUgaWRlYSB0aGF0IGl0
IGNvdWxkIGJlIGFkZGVkIGJhY2sKPiBhZ2FpbiBpZiBhIGNvbXBlbGxpbmcgbmVlZCBhcm9zZToK
PiAKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1hcGkvMjAyMDExMjMwOTU0MzIuNTg2
MC0xLXJwcHRAa2VybmVsLm9yZy8KPiAKPiBJbiB0aGVvcnkgdGhlIGV4dHJhIGZsYWdzIGNvdWxk
IGJlIG11bHRpcGxleGVkIGludG8gdGhlIG1lbWZkX2NyZWF0ZQo+IGZsYWdzIGxpa2UgaHVnZXRs
YmZzIGlzIGJ1dCB3aXRoIDMyIGZsYWdzIGFuZCBhIGxvdCBhbHJlYWR5IHRha2VuIGl0Cj4gZ2V0
cyBtZXNzeSBmb3IgZXhwYW5zaW9uLiAgV2hlbiB3ZSBydW4gb3V0IG9mIGZsYWdzIHRoZSBmaXJz
dCBxdWVzdGlvbgo+IHBlb3BsZSB3aWxsIGFzayBpcyAid2h5IGRpZG4ndCB5b3UgZG8gc2VwYXJh
dGUgc3lzdGVtIGNhbGxzPyIuCgpPSywgSSBkbyBub3QgbmVjZXNzYXJpbHkgc2VlIGEgbGFjayBv
ZiBmbGFnIHNwYWNlIGEgcHJvYmxlbS4gSSBjYW4gYmUKd3JvbmcgaGVyZSBidXQgSSBkbyBub3Qg
c2VlIGhvdyB0aGF0IHdvdWxkIGJlIHNvbHZlZCBieSBhIHNlcGFyYXRlCnN5c2NhbGwgd2hlbiBp
dCBzb3VuZHMgcmF0aGVyIGZvcnNlZWFibGUgdGhhdCBtYW55IG1vZGVzIHN1cHBvcnRlZCBieQpt
ZW1mZF9jcmVhdGUgd2lsbCBldmVudHVhbGx5IGZpbmQgdGhlaXIgd2F5IHRvIGEgc2VjcmV0IG1l
bW9yeSBhcyB3ZWxsLgpJZiBmb3Igbm8gb3RoZXIgcmVhc29uLCBzZWNyZXQgbWVtb3J5IGlzIG5v
dGhpbmcgcmVhbGx5IHNwZWNpYWwuIEl0IGlzCmp1c3QgYSBtZW1vcnkgd2hpY2ggaXMgbm90IG1h
cHBlZCB0byB0aGUga2VybmVsIHZpYSAxOjEgbWFwcGluZy4gVGhhdCdzCml0LiBBbmQgdGhhdCBj
YW4gYmUgYXBwbGllZCB0byBhbnkgbWVtb3J5IHByb3ZpZGVkIHRvIHRoZSB1c2Vyc3BhY2UuCgpC
dXQgSSBhbSByZXBlYXRpbmcgbXlzZWxmIGFnYWluIGhlcmUgc28gSSBiZXR0ZXIgc3RvcC4KLS0g
Ck1pY2hhbCBIb2NrbwpTVVNFIExhYnMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
