Return-Path: <SRS0=pUzR=EV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4044DC55ABD
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Nov 2020 09:17:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBA6322450
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Nov 2020 09:17:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0NwC1jAE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="q0I4G8XB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EBA6322450
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xMKWnt4umUA0Oz4NkiQK987L7kVyK15xA/I5/Qn7JdU=; b=0NwC1jAErBRjcm1fT2Vns6mZT
	MNCsblCxiVu7gRNOb4PEr4p54uIet1ErLZMAGkxDp5pH2cn/NrGAGXV9MkNac773uLsv7hqwU4xUJ
	kPY7zKzY6T6igM40CirFZiOY9r3Vo8KeAzL85IDD+Im1FyCP6gDUyTN4oUc+2/oNKvgg9iAK/WZFl
	85mnuHXUZPGYKJzEYOM3hiAX2hCr1KITkxHD4Lo8kFS7m7S7m1wGV8tmHDIs9jFmMqQfutvOg7qFW
	3xQzwDbtglsSdQQn5fF8SPXGn8CxRkwU0eytra7TpS8ZKQJLKeBonYVtwxLcOEGmTZFmGOpP5MZBt
	930dd/tAA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keE9x-0002tW-Sg; Sun, 15 Nov 2020 09:17:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keE9s-0002s4-Tn; Sun, 15 Nov 2020 09:17:18 +0000
Received: from kernel.org (unknown [77.125.7.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 01B8422450;
 Sun, 15 Nov 2020 09:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605431835;
 bh=XrsLu3AgfKf/yhCqreqSLPfO0QbxjM5u1nh2OTK+i7M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q0I4G8XBAWR7g47zvvLF17b4q7dpa65b9wkXecvSGjBwSxVcsrFJ8ESXu8JFAv6n6
 sdRm52xntWf8ZCcumTh9FSor5j2JPuQESup2yC2R21JKmZx1500hzTDazlR+vjkiGB
 IVdV6hSWm3dBik27GJTFfn5JfaFip6aaLkmt9qWY=
Date: Sun, 15 Nov 2020 11:17:00 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Roman Gushchin <guroan@gmail.com>
Subject: Re: [PATCH v8 6/9] secretmem: add memcg accounting
Message-ID: <20201115091700.GY4758@kernel.org>
References: <20201110151444.20662-1-rppt@kernel.org>
 <20201110151444.20662-7-rppt@kernel.org>
 <CALo0P13aq3GsONnZrksZNU9RtfhMsZXGWhK1n=xYJWQizCd4Zw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALo0P13aq3GsONnZrksZNU9RtfhMsZXGWhK1n=xYJWQizCd4Zw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201115_041717_157474_BD5B99B0 
X-CRM114-Status: GOOD (  32.36  )
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
 Arnd Bergmann <arnd@arndb.de>, James Bottomley <jejb@linux.ibm.com>,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBOb3YgMTMsIDIwMjAgYXQgMDM6NDI6MjVQTSAtMDgwMCwgUm9tYW4gR3VzaGNoaW4g
d3JvdGU6Cj4g0LLRgiwgMTAg0L3QvtGP0LEuIDIwMjAg0LMuINCyIDA3OjE2LCBNaWtlIFJhcG9w
b3J0IDxycHB0QGtlcm5lbC5vcmc+Ogo+ID4KPiA+IEZyb206IE1pa2UgUmFwb3BvcnQgPHJwcHRA
bGludXguaWJtLmNvbT4KPiA+Cj4gPiBBY2NvdW50IG1lbW9yeSBjb25zdW1lZCBieSBzZWNyZXRt
ZW0gdG8gbWVtY2cuIFRoZSBhY2NvdW50aW5nIGlzIHVwZGF0ZWQKPiA+IHdoZW4gdGhlIG1lbW9y
eSBpcyBhY3R1YWxseSBhbGxvY2F0ZWQgYW5kIGZyZWVkLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6
IE1pa2UgUmFwb3BvcnQgPHJwcHRAbGludXguaWJtLmNvbT4KPiA+IC0tLQo+ID4gIG1tL2ZpbGVt
YXAuYyAgIHwgIDIgKy0KPiA+ICBtbS9zZWNyZXRtZW0uYyB8IDQyICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrLQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgNDIgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvbW0vZmlsZW1hcC5j
IGIvbW0vZmlsZW1hcC5jCj4gPiBpbmRleCAyNDljZjQ4OWY1ZGYuLjExMzg3YTA3NzM3MyAxMDA2
NDQKPiA+IC0tLSBhL21tL2ZpbGVtYXAuYwo+ID4gKysrIGIvbW0vZmlsZW1hcC5jCj4gPiBAQCAt
ODQ0LDcgKzg0NCw3IEBAIHN0YXRpYyBub2lubGluZSBpbnQgX19hZGRfdG9fcGFnZV9jYWNoZV9s
b2NrZWQoc3RydWN0IHBhZ2UgKnBhZ2UsCj4gPiAgICAgICAgIHBhZ2UtPm1hcHBpbmcgPSBtYXBw
aW5nOwo+ID4gICAgICAgICBwYWdlLT5pbmRleCA9IG9mZnNldDsKPiA+Cj4gPiAtICAgICAgIGlm
ICghaHVnZSkgewo+ID4gKyAgICAgICBpZiAoIWh1Z2UgJiYgIXBhZ2UtPm1lbWNnX2RhdGEpIHsK
PiA+ICAgICAgICAgICAgICAgICBlcnJvciA9IG1lbV9jZ3JvdXBfY2hhcmdlKHBhZ2UsIGN1cnJl
bnQtPm1tLCBnZnApOwo+ID4gICAgICAgICAgICAgICAgIGlmIChlcnJvcikKPiA+ICAgICAgICAg
ICAgICAgICAgICAgICAgIGdvdG8gZXJyb3I7Cj4gPiBkaWZmIC0tZ2l0IGEvbW0vc2VjcmV0bWVt
LmMgYi9tbS9zZWNyZXRtZW0uYwo+ID4gaW5kZXggMWFhMmI3Y2ZmZTBkLi4xZWI3NjY3MDE2ZmEg
MTAwNjQ0Cj4gPiAtLS0gYS9tbS9zZWNyZXRtZW0uYwo+ID4gKysrIGIvbW0vc2VjcmV0bWVtLmMK
PiA+IEBAIC0xNyw2ICsxNyw3IEBACj4gPiAgI2luY2x1ZGUgPGxpbnV4L3N5c2NhbGxzLmg+Cj4g
PiAgI2luY2x1ZGUgPGxpbnV4L21lbWJsb2NrLmg+Cj4gPiAgI2luY2x1ZGUgPGxpbnV4L3BzZXVk
b19mcy5oPgo+ID4gKyNpbmNsdWRlIDxsaW51eC9tZW1jb250cm9sLmg+Cj4gPiAgI2luY2x1ZGUg
PGxpbnV4L3NldF9tZW1vcnkuaD4KPiA+ICAjaW5jbHVkZSA8bGludXgvc2NoZWQvc2lnbmFsLmg+
Cj4gPgo+ID4gQEAgLTQ5LDYgKzUwLDM4IEBAIHN0cnVjdCBzZWNyZXRtZW1fY3R4IHsKPiA+Cj4g
PiAgc3RhdGljIHN0cnVjdCBjbWEgKnNlY3JldG1lbV9jbWE7Cj4gPgo+IAo+IEhpIE1pa2UhCj4g
Cj4gPiArc3RhdGljIGludCBzZWNyZXRtZW1fbWVtY2dfY2hhcmdlKHN0cnVjdCBwYWdlICpwYWdl
LCBnZnBfdCBnZnAsIGludCBvcmRlcikKPiA+ICt7Cj4gPiArICAgICAgIHVuc2lnbmVkIGxvbmcg
bnJfcGFnZXMgPSAoMSA8PCBvcmRlcik7Cj4gPiArICAgICAgIGludCBpLCBlcnI7Cj4gPiArCj4g
PiArICAgICAgIGVyciA9IG1lbWNnX2ttZW1fY2hhcmdlX3BhZ2UocGFnZSwgZ2ZwLCBvcmRlcik7
Cj4gPiArICAgICAgIGlmIChlcnIpCj4gPiArICAgICAgICAgICAgICAgcmV0dXJuIGVycjsKPiA+
ICsKPiA+ICsgICAgICAgZm9yIChpID0gMTsgaSA8IG5yX3BhZ2VzOyBpKyspIHsKPiA+ICsgICAg
ICAgICAgICAgICBzdHJ1Y3QgcGFnZSAqcCA9IHBhZ2UgKyBpOwo+ID4gKwo+ID4gKyAgICAgICAg
ICAgICAgIHAtPm1lbWNnX2RhdGEgPSBwYWdlLT5tZW1jZ19kYXRhOwo+ID4gKyAgICAgICB9Cj4g
Cj4gSG0sIGl0IGxvb2tzIHZlcnkgc3RyYW5nZSB0byBtZS4gV2h5IGRvIHdlIG5lZWQgdG8gY29w
eSBtZW1jZ19kYXRhPwo+IFdoYXQgYWJvdXQgY3NzIHJlZmVyZW5jZSBjb3VudGluZz8KCkkgbmVl
ZCB0byBjb3B5IG1lbWNnX2RhdGEgdG8gbWFyayBhIHBhZ2UgYXMgYmVpbmcgYWNjb3VudGVkIHNv
IGl0IHdvbid0CmJlIGNoYXJnZWQgYWdhaW4gd2hlbiBpdCBpcyBhZGRlZCB0byBwYWdlIGNhY2hl
LgoKV2hhdCBoYXBwZW5zIGhlcmUgaXMgdGhhdCBJIGFsbG9jYXRlIGEgbGFyZ2UgcGFnZSBhbmQg
dGhlbiB1c2UgaXQgYXMgYQpsb2NhbCBjYWNoZSBmb3IgYWxsb2NhdGlvbnMgaW4gc2VjcmV0bWVt
X2ZhdWx0KCkuIEkgY2hhcmdlIHRoZSBsYXJnZQpwYWdlIGFzIGttZW0uIAoKRHVyaW5nIHNlY3Jl
dG1lbV9mYXVsdCgpIGEgc21hbGwgc3ViLXBhZ2UgZnJvbSB0aGF0IGxhcmdlIHBhZ2UgZ29lcyBp
bnRvCnBhZ2UgY2FjaGUgYW5kIHRoZXJlIEkgc2tpcCBpdHMgbWVtY2cgYWNjb3VudGluZy4KCklu
IHRoZSBlbmQsIHdoZW4gdGhlIGxhcmdlIHBhZ2UgaXMgZnJlZWQsIHRoZSBtZW1jZ19kYXRhIGZv
ciBhbGwgaXRzCnN1Yi1wYWdlcyBpcyBjbGVhcmVkIGFuZCBJIHVuY2hhcmdlIG1lbWNnIHdpdGgg
dGhlIG9yZGVyIG9mIGxhcmdlIHBhZ2UuCgpBbiBhbHRlcm5hdGl2ZSB3b3VsZCBiZSB0byB1bmNo
YXJnZSBhIHNtYWxsIHBhZ2UgZnJvbSBrbWVtIGluCnNlY3JldG1lbV9mYXVsdCgpIGFuZCBtYWtl
IHRoaXMgcGFnZSBjaGFyZ2VkIGluIGFkZF90b19wYWdlX2NhY2hlKCksIGJ1dAp0aGF0IHdvdWxk
IGNvbXBsaWNhdGUgdGhlIHJlbGVhc2UgcGF0aCBhcyBJIHdvdWxkIG5lZWQgdG8gcmUtY2hhcmdl
IHRoZQpzbWFsbCBwYWdlIGJhY2sgdG8ga21lbSBhdCBzZWNyZXRtZW1fZnJlZXBhZ2UoKSBhbmQg
dHJhY2sgYWxsIHRoZQpwYXJ0aWNpcGF0aW5nIG1lbWNncyB0aWxsIHRoZSBsYXJnZSBwYWdlIGlz
IGZyZWVkLgoKPiBBbmQgd2hhdCBhYm91dCBzdGF0aXN0aWNzPwoKSG1tLCB0aGF0J3MgcHJvYmFi
bHkgd29uJ3QgYmUgYWNjdXJhdGUgOi0vCgo+IEknbSBzb3JyeSBmb3IgYmVpbmcgbGF0ZS4KPiAK
PiBUaGFuayB5b3UhCj4gCj4gPiArCj4gPiArICAgICAgIHJldHVybiAwOwo+ID4gK30KPiA+ICsK
PiA+ICtzdGF0aWMgdm9pZCBzZWNyZXRtZW1fbWVtY2dfdW5jaGFyZ2Uoc3RydWN0IHBhZ2UgKnBh
Z2UsIGludCBvcmRlcikKPiA+ICt7Cj4gPiArICAgICAgIHVuc2lnbmVkIGxvbmcgbnJfcGFnZXMg
PSAoMSA8PCBvcmRlcik7Cj4gPiArICAgICAgIGludCBpOwo+ID4gKwo+ID4gKyAgICAgICBmb3Ig
KGkgPSAxOyBpIDwgbnJfcGFnZXM7IGkrKykgewo+ID4gKyAgICAgICAgICAgICAgIHN0cnVjdCBw
YWdlICpwID0gcGFnZSArIGk7Cj4gPiArCj4gPiArICAgICAgICAgICAgICAgcC0+bWVtY2dfZGF0
YSA9IDA7Cj4gPiArICAgICAgIH0KPiA+ICsKPiA+ICsgICAgICAgbWVtY2dfa21lbV91bmNoYXJn
ZV9wYWdlKHBhZ2UsIFBNRF9QQUdFX09SREVSKTsKPiA+ICt9Cj4gPiArCj4gPiAgc3RhdGljIGlu
dCBzZWNyZXRtZW1fcG9vbF9pbmNyZWFzZShzdHJ1Y3Qgc2VjcmV0bWVtX2N0eCAqY3R4LCBnZnBf
dCBnZnApCj4gPiAgewo+ID4gICAgICAgICB1bnNpZ25lZCBsb25nIG5yX3BhZ2VzID0gKDEgPDwg
UE1EX1BBR0VfT1JERVIpOwo+ID4gQEAgLTYxLDEwICs5NCwxNCBAQCBzdGF0aWMgaW50IHNlY3Jl
dG1lbV9wb29sX2luY3JlYXNlKHN0cnVjdCBzZWNyZXRtZW1fY3R4ICpjdHgsIGdmcF90IGdmcCkK
PiA+ICAgICAgICAgaWYgKCFwYWdlKQo+ID4gICAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVN
Owo+ID4KPiA+IC0gICAgICAgZXJyID0gc2V0X2RpcmVjdF9tYXBfaW52YWxpZF9ub2ZsdXNoKHBh
Z2UsIG5yX3BhZ2VzKTsKPiA+ICsgICAgICAgZXJyID0gc2VjcmV0bWVtX21lbWNnX2NoYXJnZShw
YWdlLCBnZnAsIFBNRF9QQUdFX09SREVSKTsKPiA+ICAgICAgICAgaWYgKGVycikKPiA+ICAgICAg
ICAgICAgICAgICBnb3RvIGVycl9jbWFfcmVsZWFzZTsKPiA+Cj4gPiArICAgICAgIGVyciA9IHNl
dF9kaXJlY3RfbWFwX2ludmFsaWRfbm9mbHVzaChwYWdlLCBucl9wYWdlcyk7Cj4gPiArICAgICAg
IGlmIChlcnIpCj4gPiArICAgICAgICAgICAgICAgZ290byBlcnJfbWVtY2dfdW5jaGFyZ2U7Cj4g
PiArCj4gPiAgICAgICAgIGFkZHIgPSAodW5zaWduZWQgbG9uZylwYWdlX2FkZHJlc3MocGFnZSk7
Cj4gPiAgICAgICAgIGVyciA9IGdlbl9wb29sX2FkZChwb29sLCBhZGRyLCBQTURfU0laRSwgTlVN
QV9OT19OT0RFKTsKPiA+ICAgICAgICAgaWYgKGVycikKPiA+IEBAIC04MSw2ICsxMTgsOCBAQCBz
dGF0aWMgaW50IHNlY3JldG1lbV9wb29sX2luY3JlYXNlKHN0cnVjdCBzZWNyZXRtZW1fY3R4ICpj
dHgsIGdmcF90IGdmcCkKPiA+ICAgICAgICAgICogd29uJ3QgZmFpbAo+ID4gICAgICAgICAgKi8K
PiA+ICAgICAgICAgc2V0X2RpcmVjdF9tYXBfZGVmYXVsdF9ub2ZsdXNoKHBhZ2UsIG5yX3BhZ2Vz
KTsKPiA+ICtlcnJfbWVtY2dfdW5jaGFyZ2U6Cj4gPiArICAgICAgIHNlY3JldG1lbV9tZW1jZ191
bmNoYXJnZShwYWdlLCBQTURfUEFHRV9PUkRFUik7Cj4gPiAgZXJyX2NtYV9yZWxlYXNlOgo+ID4g
ICAgICAgICBjbWFfcmVsZWFzZShzZWNyZXRtZW1fY21hLCBwYWdlLCBucl9wYWdlcyk7Cj4gPiAg
ICAgICAgIHJldHVybiBlcnI7Cj4gPiBAQCAtMzEwLDYgKzM0OSw3IEBAIHN0YXRpYyB2b2lkIHNl
Y3JldG1lbV9jbGVhbnVwX2NodW5rKHN0cnVjdCBnZW5fcG9vbCAqcG9vbCwKPiA+ICAgICAgICAg
aW50IGk7Cj4gPgo+ID4gICAgICAgICBzZXRfZGlyZWN0X21hcF9kZWZhdWx0X25vZmx1c2gocGFn
ZSwgbnJfcGFnZXMpOwo+ID4gKyAgICAgICBzZWNyZXRtZW1fbWVtY2dfdW5jaGFyZ2UocGFnZSwg
UE1EX1BBR0VfT1JERVIpOwo+ID4KPiA+ICAgICAgICAgZm9yIChpID0gMDsgaSA8IG5yX3BhZ2Vz
OyBpKyspCj4gPiAgICAgICAgICAgICAgICAgY2xlYXJfaGlnaHBhZ2UocGFnZSArIGkpOwo+ID4g
LS0KPiA+IDIuMjguMAo+ID4KPiA+CgotLSAKU2luY2VyZWx5IHlvdXJzLApNaWtlLgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
