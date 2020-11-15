Return-Path: <SRS0=pUzR=EV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CEDDC2D0E4
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Nov 2020 08:26:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE20D223FB
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Nov 2020 08:26:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0xTlvepk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="OzCqWMqj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE20D223FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=d3i6wAYbBOrgqtBGDGEoZev4MwFV2efhj5qPxhiHxfk=; b=0xTlvepkhxuFktB7FlhvnHSzG
	F4BdMA9ysNics9PGPL+mc9tsJKnXYHeBX8jAZ70Ssgqoff2snHFJ4WQmmXmfyWqgpwQrTo0T0mOdo
	hLt7T9p4Bll2CubnMXlyEEJEdn3XmV3p3Z9gza5DxSuaBPi2ms1tKmwi4/KMUgmwB4rlFTYdas1Tk
	3xEsCx6puzi/vkyBgZXZMloRIEWPxkha9kk5tD7BnZBG5U1/UFM3FSFlvHsuP7wRi68FUb7HuT5yE
	gTCCz4isqeK7UYlvKLPt+3qSWMat33AXcSroAl2fvy3zqSn1L5rkvMJKHAOA1guB3rYHq3BBwzrjk
	xvX5FsBNg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keDMz-00083o-Bc; Sun, 15 Nov 2020 08:26:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keDMt-000829-EX; Sun, 15 Nov 2020 08:26:40 +0000
Received: from kernel.org (unknown [77.125.7.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2B40D20825;
 Sun, 15 Nov 2020 08:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605428798;
 bh=N8nX4EItu7ygJosleHRb6Se+RCkeKeuBhze7L0pxdoc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OzCqWMqjydzAb9tsTc50ml1otm0W+jgR45ewsq/G5RaHSABMkhoMFFhu9KCzP5EgM
 H4hHM4CWx5jTJGIkXhhIkkUUbJjjG0LCaHvvN1Sygkt5FEaoKMH2vyKuxCD0ZXI6ak
 TE0ypAnInCIfqSa2/EaG3mDDyN0He79bGRMwfBCI=
Date: Sun, 15 Nov 2020 10:26:25 +0200
From: Mike Rapoport <rppt@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v8 2/9] mmap: make mlock_future_check() global
Message-ID: <20201115082625.GT4758@kernel.org>
References: <20201112190827.GP4758@kernel.org>
 <7A16CA44-782D-4ABA-8D93-76BDD0A90F94@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7A16CA44-782D-4ABA-8D93-76BDD0A90F94@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201115_032639_723687_E5650642 
X-CRM114-Status: GOOD (  37.07  )
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
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBOb3YgMTIsIDIwMjAgYXQgMDk6MTU6MThQTSArMDEwMCwgRGF2aWQgSGlsZGVuYnJh
bmQgd3JvdGU6Cj4gCj4gPiBBbSAxMi4xMS4yMDIwIHVtIDIwOjA4IHNjaHJpZWIgTWlrZSBSYXBv
cG9ydCA8cnBwdEBrZXJuZWwub3JnPjoKPiA+IAo+ID4g77u/T24gVGh1LCBOb3YgMTIsIDIwMjAg
YXQgMDU6MjI6MDBQTSArMDEwMCwgRGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6Cj4gPj4+IE9uIDEw
LjExLjIwIDE5OjA2LCBNaWtlIFJhcG9wb3J0IHdyb3RlOgo+ID4+PiBPbiBUdWUsIE5vdiAxMCwg
MjAyMCBhdCAwNjoxNzoyNlBNICswMTAwLCBEYXZpZCBIaWxkZW5icmFuZCB3cm90ZToKPiA+Pj4+
IE9uIDEwLjExLjIwIDE2OjE0LCBNaWtlIFJhcG9wb3J0IHdyb3RlOgo+ID4+Pj4+IEZyb206IE1p
a2UgUmFwb3BvcnQgPHJwcHRAbGludXguaWJtLmNvbT4KPiA+Pj4+PiAKPiA+Pj4+PiBJdCB3aWxs
IGJlIHVzZWQgYnkgdGhlIHVwY29taW5nIHNlY3JldCBtZW1vcnkgaW1wbGVtZW50YXRpb24uCj4g
Pj4+Pj4gCj4gPj4+Pj4gU2lnbmVkLW9mZi1ieTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5p
Ym0uY29tPgo+ID4+Pj4+IC0tLQo+ID4+Pj4+ICAgbW0vaW50ZXJuYWwuaCB8IDMgKysrCj4gPj4+
Pj4gICBtbS9tbWFwLmMgICAgIHwgNSArKy0tLQo+ID4+Pj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCA1
IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gPj4+Pj4gCj4gPj4+Pj4gZGlmZiAtLWdp
dCBhL21tL2ludGVybmFsLmggYi9tbS9pbnRlcm5hbC5oCj4gPj4+Pj4gaW5kZXggYzQzY2NkZGRi
MGY2Li5hZTE0NmEyNjBiMTQgMTAwNjQ0Cj4gPj4+Pj4gLS0tIGEvbW0vaW50ZXJuYWwuaAo+ID4+
Pj4+ICsrKyBiL21tL2ludGVybmFsLmgKPiA+Pj4+PiBAQCAtMzQ4LDYgKzM0OCw5IEBAIHN0YXRp
YyBpbmxpbmUgdm9pZCBtdW5sb2NrX3ZtYV9wYWdlc19hbGwoc3RydWN0IHZtX2FyZWFfc3RydWN0
ICp2bWEpCj4gPj4+Pj4gICBleHRlcm4gdm9pZCBtbG9ja192bWFfcGFnZShzdHJ1Y3QgcGFnZSAq
cGFnZSk7Cj4gPj4+Pj4gICBleHRlcm4gdW5zaWduZWQgaW50IG11bmxvY2tfdm1hX3BhZ2Uoc3Ry
dWN0IHBhZ2UgKnBhZ2UpOwo+ID4+Pj4+ICtleHRlcm4gaW50IG1sb2NrX2Z1dHVyZV9jaGVjayhz
dHJ1Y3QgbW1fc3RydWN0ICptbSwgdW5zaWduZWQgbG9uZyBmbGFncywKPiA+Pj4+PiArICAgICAg
ICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBsZW4pOwo+ID4+Pj4+ICsKPiA+Pj4+PiAgIC8qCj4g
Pj4+Pj4gICAgKiBDbGVhciB0aGUgcGFnZSdzIFBhZ2VNbG9ja2VkKCkuICBUaGlzIGNhbiBiZSB1
c2VmdWwgaW4gYSBzaXR1YXRpb24gd2hlcmUKPiA+Pj4+PiAgICAqIHdlIHdhbnQgdG8gdW5jb25k
aXRpb25hbGx5IHJlbW92ZSBhIHBhZ2UgZnJvbSB0aGUgcGFnZWNhY2hlIC0tIGUuZy4sCj4gPj4+
Pj4gZGlmZiAtLWdpdCBhL21tL21tYXAuYyBiL21tL21tYXAuYwo+ID4+Pj4+IGluZGV4IDYxZjcy
YjA5ZDk5MC4uYzQ4MWYwODhiZDUwIDEwMDY0NAo+ID4+Pj4+IC0tLSBhL21tL21tYXAuYwo+ID4+
Pj4+ICsrKyBiL21tL21tYXAuYwo+ID4+Pj4+IEBAIC0xMzQ4LDkgKzEzNDgsOCBAQCBzdGF0aWMg
aW5saW5lIHVuc2lnbmVkIGxvbmcgcm91bmRfaGludF90b19taW4odW5zaWduZWQgbG9uZyBoaW50
KQo+ID4+Pj4+ICAgICAgIHJldHVybiBoaW50Owo+ID4+Pj4+ICAgfQo+ID4+Pj4+IC1zdGF0aWMg
aW5saW5lIGludCBtbG9ja19mdXR1cmVfY2hlY2soc3RydWN0IG1tX3N0cnVjdCAqbW0sCj4gPj4+
Pj4gLSAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3MsCj4gPj4+Pj4gLSAg
ICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgbGVuKQo+ID4+Pj4+ICtpbnQgbWxvY2tf
ZnV0dXJlX2NoZWNrKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCB1bnNpZ25lZCBsb25nIGZsYWdzLAo+
ID4+Pj4+ICsgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGxlbikKPiA+Pj4+PiAgIHsKPiA+
Pj4+PiAgICAgICB1bnNpZ25lZCBsb25nIGxvY2tlZCwgbG9ja19saW1pdDsKPiA+Pj4+PiAKPiA+
Pj4+IAo+ID4+Pj4gU28sIGFuIGludGVyZXN0aW5nIHF1ZXN0aW9uIGlzIGlmIHlvdSBhY3R1YWxs
eSB3YW50IHRvIGNoYXJnZSBzZWNyZXRtZW0KPiA+Pj4+IHBhZ2VzIGFnYWluc3QgbWxvY2sgbm93
LCBvciBpZiB5b3Ugd2FudCBhIGRlZGljYXRlZCBzZWNyZXRtZW0gY2dyb3VwCj4gPj4+PiBjb250
cm9sbGVyIGluc3RlYWQ/Cj4gPj4+IAo+ID4+PiBXZWxsLCB3aXRoIHRoZSBjdXJyZW50IGltcGxl
bWVudGF0aW9uIHRoZXJlIGFyZSB0aHJlZSBsaW1pdHMgYW4KPiA+Pj4gYWRtaW5pc3RyYXRvciBj
YW4gdXNlIHRvIGNvbnRyb2wgc2VjcmV0bWVtIGxpbWl0czogbWxvY2ssIG1lbWNnIGFuZAo+ID4+
PiBrZXJuZWwgcGFyYW1ldGVyLgo+ID4+PiAKPiA+Pj4gVGhlIGtlcm5lbCBwYXJhbWV0ZXIgcHV0
cyBhIGdsb2JhbCB1cHBlciBsaW1pdCBmb3Igc2VjcmV0bWVtIHVzYWdlLAo+ID4+PiBtZW1jZyBh
Y2NvdW50cyBhbGwgc2VjcmV0bWVtIGFsbG9jYXRpb25zLCBpbmNsdWRpbmcgdGhlIHVudXNlZCBt
ZW1vcnkgaW4KPiA+Pj4gbGFyZ2UgcGFnZXMgY2FjaGluZyBhbmQgbWxvY2sgYWxsb3dzIHBlciB0
YXNrIGxpbWl0IGZvciBzZWNyZXRtZW0KPiA+Pj4gbWFwcGluZ3MsIHdlbGwsIGxpa2UgbWxvY2sg
ZG9lcy4KPiA+Pj4gCj4gPj4+IEkgZGlkbid0IGNvbnNpZGVyIGEgZGVkaWNhdGVkIGNncm91cCwg
YXMgaXQgc2VlbXMgd2UgYWxyZWFkeSBoYXZlIGVub3VnaAo+ID4+PiBleGlzdGluZyBrbm9icyBh
bmQgYSBuZXcgb25lIHdvdWxkIGJlIHVubmVjZXNzYXJ5Lgo+ID4+IAo+ID4+IFRvIG1lIGl0IGZl
ZWxzIGxpa2UgdGhlIG1sb2NrKCkgbGltaXQgaXMgYSB3cm9uZyBmaXQgZm9yIHNlY3JldG1lbS4g
QnV0Cj4gPj4gbWF5YmUgdGhlcmUgYXJlIG90aGVyIGNhc2VzIG9mIHVzaW5nIHRoZSBtbG9jaygp
IGxpbWl0IHdpdGhvdXQgYWN0dWFsbHkKPiA+PiBkb2luZyBtbG9jaygpIHRoYXQgSSBhbSBub3Qg
YXdhcmUgb2YgKG1vc3QgcHJvYmFibHkgOikgKT8KPiA+IAo+ID4gU2VjcmV0bWVtIGRvZXMgbm90
IGV4cGxpY2l0bHkgY2FsbHMgdG8gbWxvY2soKSBidXQgaXQgZG9lcyB3aGF0IG1sb2NrKCkKPiA+
IGRvZXMgYW5kIGEgYml0IG1vcmUuIENpdGluZyBtbG9jaygyKToKPiA+IAo+ID4gIG1sb2NrKCks
ICBtbG9jazIoKSwgIGFuZCAgbWxvY2thbGwoKSAgbG9jayAgcGFydCAgb3IgYWxsIG9mIHRoZSBj
YWxsaW5nCj4gPiAgcHJvY2VzcydzIHZpcnR1YWwgYWRkcmVzcyBzcGFjZSBpbnRvIFJBTSwgcHJl
dmVudGluZyB0aGF0ICBtZW1vcnkgIGZyb20KPiA+ICBiZWluZyBwYWdlZCB0byB0aGUgc3dhcCBh
cmVhLgo+ID4gCj4gPiBTbywgYmFzZWQgb24gdGhhdCBzZWNyZXRtZW0gcGFnZXMgYXJlIG5vdCBz
d2FwcGFibGUsIEkgdGhpbmsgdGhhdAo+ID4gUkxJTUlUX01FTUxPQ0sgaXMgYXBwcm9wcmlhdGUg
aGVyZS4KPiA+IAo+IAo+IFRoZSBwYWdlIGV4cGxpY2l0bHkgbGlzdHMgbWxvY2soKSBzeXN0ZW0g
Y2FsbHMuCgpXZWxsLCBpdCdzIG1sb2NrKCkgbWFuIHBhZ2UsIGlzbid0IGl0PyA7LSkKCk15IHRo
aW5raW5nIHdhcyB0aGF0IHNpbmNlIHNlY3JldG1lbSBkb2VzIHdoYXQgbWxvY2soKSBkb2VzIHdy
dApzd2FwYWJpbGl0eSwgaXQgc2hvdWxkIGF0IGxlYXN0IG9iZXkgdGhlIHNhbWUgbGltaXQsIGku
ZS4KUkxJTUlUX01FTUxPQ0suCgo+IEUuZy4sIHdlIGFsc28gZG9u4oCYdAo+IGFjY291bnQgZm9y
IGdpZ2FudGljIHBhZ2VzIC0gd2hpY2ggbWlnaHQgYmUgYWxsb2NhdGVkIGZyb20gQ01BIGFuZCBh
cmUKPiBub3Qgc3dhcHBhYmxlLgogCkRvIHlvdSBtZWFuIGdpZ2FudGljIHBhZ2VzIGluIGh1Z2V0
bGJmcz8KSXQgc2VlbXMgdG8gbWUgdGhhdCBodWdldGxiZnMgYWNjb3VudGluZyBpcyBhIGNvbXBs
ZXRlbHkgZGlmZmVyZW50CnN0b3J5LgoKPiA+PiBJIG1lYW4sIG15IGNvbmNlcm4gaXMgbm90IGVh
cnRoIHNoYXR0ZXJpbmcsIHRoaXMgY2FuIGJlIHJld29ya2VkIGxhdGVyLiBBcyBJCj4gPj4gc2Fp
ZCwgaXQganVzdCBmZWVscyB3cm9uZy4KPiA+PiAKPiA+PiAtLSAKPiA+PiBUaGFua3MsCj4gPj4g
Cj4gPj4gRGF2aWQgLyBkaGlsZGVuYgo+ID4+IAo+ID4gCj4gPiAtLSAKPiA+IFNpbmNlcmVseSB5
b3VycywKPiA+IE1pa2UuCj4gPiAKPiAKCi0tIApTaW5jZXJlbHkgeW91cnMsCk1pa2UuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
