Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADDAFCCF9E0
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 16:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DMxPwY0Hia9rtyzO3DQmmthyOBx9loUqIq4dL09eu1E=; b=RcLRw0sJvebBU9G/gJ5liSX3fl
	CSG/YFkB2n3+sput3aaJj2gt9zDX2/jZo4UClpkHt4I1VeFXtYrwwRYdcahvfG8YcDstYGvcMHcZP
	MOSFPEXvqJCJG8iEi4ldiTjmPztdf/4tKc2JFT3Gyo8tOZBKyFMEP7unh3N6mrcPmQWbh6cxwJmcy
	WH7LaWz2Tt5IXa7YUD+QtnCuW54YGpZlvlJ37tEkDjBWRcmvlbH0IvtK29hDCP7lbrHM9Kwm/B8UQ
	CYmCpsTYx0j3zqoVb2NC1EiJwsabwC2kToj+Nad/qJM1d54dykR5G4Ltarrzo4/MQRd5eS1xxOflB
	MSc/1qZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDmKO-0000000GHxP-3jFE;
	Tue, 28 Oct 2025 16:13:44 +0000
Received: from out-172.mta1.migadu.com ([2001:41d0:203:375::ac])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDmKM-0000000GHwb-1L9V
	for linux-riscv@lists.infradead.org;
	Tue, 28 Oct 2025 16:13:43 +0000
Message-ID: <91ebba8f-6960-46f7-854a-6bab3d0bbd5b@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1761668018;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k6hFEseP+AK2f/a81hSP487sZcnRCpMeyAI0dHmU+Gc=;
	b=fP8aN+1nMFWAupOIls4HnUnlF9HtUlZL0o8l+1djP+YfdNfdJ3J/Cia9HJk1DLE2MjIDXu
	NE9SrXnAlosd61D6n3fbZg3bmkoXv24Mz2Tn7binXtKafWMMVkPuU/93T27jM6N8KarUyo
	OPTFKjSShHeTIA1HBbBj+pksZsl3vEk=
Date: Tue, 28 Oct 2025 09:13:24 -0700
MIME-Version: 1.0
Subject: Re: [PATCH] RISC-V: Enable HOTPLUG_PARALLEL for secondary CPUs
To: Anup Patel <anup@brainfault.org>
References: <20250905122512.71684-1-apatel@ventanamicro.com>
 <0f7e6be5-f9ac-4019-93c6-295a068046a8@linux.dev>
 <CAAhSdy1uGQaPc2SkcX5oHF-aP4dOS1gu5iHor5O8zmz-XWUtBA@mail.gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
Content-Language: en-US
In-Reply-To: <CAAhSdy1uGQaPc2SkcX5oHF-aP4dOS1gu5iHor5O8zmz-XWUtBA@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_091342_507428_9AD56194 
X-CRM114-Status: GOOD (  16.95  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Anup Patel <apatel@ventanamicro.com>, Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Ck9uIDEwLzI4LzI1IDE6NDggQU0sIEFudXAgUGF0ZWwgd3JvdGU6Cj4gT24gVHVlLCBPY3QgMjgs
IDIwMjUgYXQgMjowNeKAr1BNIEF0aXNoIFBhdHJhIDxhdGlzaC5wYXRyYUBsaW51eC5kZXY+IHdy
b3RlOgo+Pgo+PiBPbiA5LzUvMjUgNToyNSBBTSwgQW51cCBQYXRlbCB3cm90ZToKPj4+IFRoZSBj
b3JlIGtlcm5lbCBhbHJlYWR5IHN1cHBvcnRzIHBhcmFsbGVsIGJyaW5ndXAgb2Ygc2Vjb25kYXJ5
Cj4+PiBDUFVzIChha2EgSE9UUExVR19QQVJBTExFTCkuIFRoZSB4ODYgYW5kIE1JUFMgYXJjaGl0
ZWN0dXJlcwo+Pj4gYWxyZWFkeSB1c2UgSE9UUExVR19QQVJBTExFTCBhbmQgQVJNIGlzIGFsc28g
bW92aW5nIHRvd2FyZCBpdC4KPj4+Cj4+PiBPbiBSSVNDLVYsIHRoZXJlIGlzIG5vIGFyY2ggc3Bl
Y2lmaWMgZ2xvYmFsIGRhdGEgYWNjZXNzZWQgaW4gdGhlCj4+PiBSSVNDLVYgc2Vjb25kYXJ5IENQ
VSBicmluZ3VwIHBhdGggc28gZW5hYmxpbmcgSE9UUExVR19QQVJBTExFTCBmb3IKPj4+IFJJU0Mt
ViB3b3VsZCBvbmx5IHJlcXVpcmVzOgo+Pj4gMSkgUHJvdmlkaW5nIFJJU0MtViBzcGVjaWZpYyBh
cmNoX2NwdWhwX2tpY2tfYXBfYWxpdmUoKQo+Pj4gMikgQ2FsbGluZyBjcHVocF9hcF9zeW5jX2Fs
aXZlKCkgZnJvbSBzbXBfY2FsbGluKCkKPj4+Cj4+PiBUaGlzIHBhdGNoIGlzIHRlc3RlZCBuYXRp
dmVseSB3aXRoIE9wZW5TQkkgb24gUUVNVSBSVjY0IHZpcnQgbWFjaGluZQo+Pj4gd2l0aCA2NCBj
b3JlcyBhbmQgYWxzbyB0ZXN0ZWQgd2l0aCBLVk0gUklTQy1WIGd1ZXN0IHdpdGggMzIgVkNQVXMu
Cj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5j
b20+Cj4+PiAtLS0KPj4+ICAgIGFyY2gvcmlzY3YvS2NvbmZpZyAgICAgICAgICB8ICAyICstCj4+
PiAgICBhcmNoL3Jpc2N2L2tlcm5lbC9zbXBib290LmMgfCAxNSArKysrKysrKysrKysrKysKPj4+
ICAgIDIgZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pj4K
Pj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcgYi9hcmNoL3Jpc2N2L0tjb25maWcK
Pj4+IGluZGV4IGE0YjIzM2EwNjU5ZS4uZDU4MDBkNmY5YTE1IDEwMDY0NAo+Pj4gLS0tIGEvYXJj
aC9yaXNjdi9LY29uZmlnCj4+PiArKysgYi9hcmNoL3Jpc2N2L0tjb25maWcKPj4+IEBAIC0xOTYs
NyArMTk2LDcgQEAgY29uZmlnIFJJU0NWCj4+PiAgICAgICAgc2VsZWN0IEhBVkVfU0FNUExFX0ZU
UkFDRV9ESVJFQ1RfTVVMVEkKPj4+ICAgICAgICBzZWxlY3QgSEFWRV9TVEFDS1BST1RFQ1RPUgo+
Pj4gICAgICAgIHNlbGVjdCBIQVZFX1NZU0NBTExfVFJBQ0VQT0lOVFMKPj4+IC0gICAgIHNlbGVj
dCBIT1RQTFVHX0NPUkVfU1lOQ19ERUFEIGlmIEhPVFBMVUdfQ1BVCj4+PiArICAgICBzZWxlY3Qg
SE9UUExVR19QQVJBTExFTCBpZiBIT1RQTFVHX0NQVQo+Pj4gICAgICAgIHNlbGVjdCBJUlFfRE9N
QUlOCj4+PiAgICAgICAgc2VsZWN0IElSUV9GT1JDRURfVEhSRUFESU5HCj4+PiAgICAgICAgc2Vs
ZWN0IEtBU0FOX1ZNQUxMT0MgaWYgS0FTQU4KPj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tl
cm5lbC9zbXBib290LmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zbXBib290LmMKPj4+IGluZGV4IDYw
MWEzMjFlMGYxNy4uZDg1OTE2YTM2NjBjIDEwMDY0NAo+Pj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJu
ZWwvc21wYm9vdC5jCj4+PiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zbXBib290LmMKPj4+IEBA
IC0zOSw3ICszOSw5IEBACj4+Pgo+Pj4gICAgI2luY2x1ZGUgImhlYWQuaCIKPj4+Cj4+PiArI2lm
bmRlZiBDT05GSUdfSE9UUExVR19QQVJBTExFTAo+Pj4gICAgc3RhdGljIERFQ0xBUkVfQ09NUExF
VElPTihjcHVfcnVubmluZyk7Cj4+PiArI2VuZGlmCj4+Pgo+Pj4gICAgdm9pZCBfX2luaXQgc21w
X3ByZXBhcmVfY3B1cyh1bnNpZ25lZCBpbnQgbWF4X2NwdXMpCj4+PiAgICB7Cj4+PiBAQCAtMTc5
LDYgKzE4MSwxMiBAQCBzdGF0aWMgaW50IHN0YXJ0X3NlY29uZGFyeV9jcHUoaW50IGNwdSwgc3Ry
dWN0IHRhc2tfc3RydWN0ICp0aWRsZSkKPj4+ICAgICAgICByZXR1cm4gLUVPUE5PVFNVUFA7Cj4+
PiAgICB9Cj4+Pgo+Pj4gKyNpZmRlZiBDT05GSUdfSE9UUExVR19QQVJBTExFTAo+Pj4gK2ludCBh
cmNoX2NwdWhwX2tpY2tfYXBfYWxpdmUodW5zaWduZWQgaW50IGNwdSwgc3RydWN0IHRhc2tfc3Ry
dWN0ICp0aWRsZSkKPj4+ICt7Cj4+PiArICAgICByZXR1cm4gc3RhcnRfc2Vjb25kYXJ5X2NwdShj
cHUsIHRpZGxlKTsKPj4+ICt9Cj4+PiArI2Vsc2UKPj4+ICAgIGludCBfX2NwdV91cCh1bnNpZ25l
ZCBpbnQgY3B1LCBzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRpZGxlKQo+Pj4gICAgewo+Pj4gICAgICAg
IGludCByZXQgPSAwOwo+Pj4gQEAgLTE5OSw2ICsyMDcsNyBAQCBpbnQgX19jcHVfdXAodW5zaWdu
ZWQgaW50IGNwdSwgc3RydWN0IHRhc2tfc3RydWN0ICp0aWRsZSkKPj4+Cj4+PiAgICAgICAgcmV0
dXJuIHJldDsKPj4+ICAgIH0KPj4+ICsjZW5kaWYKPj4+Cj4+PiAgICB2b2lkIF9faW5pdCBzbXBf
Y3B1c19kb25lKHVuc2lnbmVkIGludCBtYXhfY3B1cykKPj4+ICAgIHsKPj4+IEBAIC0yMjUsNiAr
MjM0LDEwIEBAIGFzbWxpbmthZ2UgX192aXNpYmxlIHZvaWQgc21wX2NhbGxpbih2b2lkKQo+Pj4g
ICAgICAgIG1tZ3JhYihtbSk7Cj4+PiAgICAgICAgY3VycmVudC0+YWN0aXZlX21tID0gbW07Cj4+
Pgo+Pj4gKyNpZmRlZiBDT05GSUdfSE9UUExVR19QQVJBTExFTAo+Pj4gKyAgICAgY3B1aHBfYXBf
c3luY19hbGl2ZSgpOwo+Pj4gKyNlbmRpZgo+Pj4gKwo+Pj4gICAgICAgIHN0b3JlX2NwdV90b3Bv
bG9neShjdXJyX2NwdWlkKTsKPj4+ICAgICAgICBub3RpZnlfY3B1X3N0YXJ0aW5nKGN1cnJfY3B1
aWQpOwo+Pj4KPj4+IEBAIC0yNDMsNyArMjU2LDkgQEAgYXNtbGlua2FnZSBfX3Zpc2libGUgdm9p
ZCBzbXBfY2FsbGluKHZvaWQpCj4+PiAgICAgICAgICovCj4+PiAgICAgICAgbG9jYWxfZmx1c2hf
aWNhY2hlX2FsbCgpOwo+Pj4gICAgICAgIGxvY2FsX2ZsdXNoX3RsYl9hbGwoKTsKPj4+ICsjaWZu
ZGVmIENPTkZJR19IT1RQTFVHX1BBUkFMTEVMCj4+PiAgICAgICAgY29tcGxldGUoJmNwdV9ydW5u
aW5nKTsKPj4+ICsjZW5kaWYKPj4gTEdUTS4KPj4KPj4gUmV2aWV3ZWQtYnk6IEF0aXNoIFBhdHJh
IDxhdGlzaHBAcml2b3NpbmMuY29tPgo+Pgo+PiBIYXZlIHlvdSB0cmllZCB3aXRoIDEyOCBoYXJ0
cyA/IEkgd2FzIG5vdCBhYmxlIHRvIGJvb3QgMTI4IGhhcnRzIGluIFFlbXUKPj4gd2l0aCBOUl9D
UFVTPTI1Ni4KPj4gVGhpcyBpcyB1bnJlbGF0ZWQgdG8gdGhpcyBwYXRjaCB0aG91Z2guIEkgY2Fu
IHJlcHJvZHVjZSB0aGUgaXNzdWUgb24KPj4gdXBzdHJlYW0gd2l0aCA2LjE4LXJjMy4KPiBJIGhh
dmUgdHJpZWQgdXB0byA5NiBoYXJ0cyBhbmQgdGhhdCB3b3JrcyBmaW5lLgoKWWVhaC4gSSBoYWQg
dHJpZWQgdXB0byA5MiBhcyB3ZWxsLgoKPiBGb3IgMTI4IGhhcnRzLCB0aGUgbWVtb3J5IHVzZWQg
YnkgT3BlblNCSSBnb2VzIGJleW9uZCAyTUIgc28KPiBPcGVuU0JJIGNhbid0IHJ1biBmcm9tIHRo
ZSBmaXJzdCAyTUIgb2YgRFJBTSAoMHg4MDAwMDAwMCkgYXMgdGhlCj4gZmlyc3QgYm9vdGluZyBz
dGFnZS4gVHJ5IHdpdGggVS1Cb290IFNQTCBsb2FkaW5nIE9wZW5TQkkgZnJvbSBGSVQgaW1hZ2Uu
CgpBaGggeWVzLiBUaGF0IG1ha2VzIHNlbnNlLiBJIHdpbGwgdHJ5IHdpdGggVS1Cb290IFNQTC4K
Cj4gUmVnYXJkcywKPiBBbnVwCj4KPj4KPj4+ICAgICAgICAvKgo+Pj4gICAgICAgICAqIERpc2Fi
bGUgcHJlZW1wdGlvbiBiZWZvcmUgZW5hYmxpbmcgaW50ZXJydXB0cywgc28gd2UgZG9uJ3QgdHJ5
IHRvCj4+PiAgICAgICAgICogc2NoZWR1bGUgYSBDUFUgdGhhdCBoYXNuJ3QgYWN0dWFsbHkgc3Rh
cnRlZCB5ZXQuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
