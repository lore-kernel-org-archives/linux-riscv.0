Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2927C54E5D
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Mar 2024 09:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WAZKZGN9gt7vo9/HiSbJWVkfZUfK34uv2ury1g3O0iU=; b=PtZmdOKNPmcGPd
	jKGnEGUiOMtiiU1YYQFEYj7912OD+6RrG3CGGMJPhDXAWMfpJVtw3vhA0huNCmwberZ264i4TMKE4
	n7FoTD7XC+6iGvUayhi0Gu5UwZzUQg4yTKQNoAHqRBCBv07JRTliaF0DwbmDIGHr2MrwoNTJaA00E
	Y5XipabU8Iz2OwcMMgOt257XS8aqTQf1sPy88pThSaF7S0PJAW+jKudSJwX3Yq4tiSMR5a3Pan7AK
	SOmSAS635nMbqTyjriqAXMmJFw8d2cPqAdLdJo9M56At1VVJs/bA2jYOamcnfa5N+ZTAgTHDLs4Sy
	7XqmRuQClLcJOaA5tAog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rm8ry-00000007qEc-3BWz;
	Mon, 18 Mar 2024 09:01:22 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rm8rt-00000007qDJ-2ez9
	for linux-riscv@lists.infradead.org;
	Mon, 18 Mar 2024 09:01:21 +0000
Date: Mon, 18 Mar 2024 10:01:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1710752469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r8EiV2gzXftggen6GL4Tj807WdurcECVI7Wmk1Mm55w=;
	b=Bk5ws+ZgAtsMmV/Bg61xGm2mYCJmRY1ttMRepbifFjRw2oBPFnjigwB9BMyTt1v13+r6GR
	i4eVBe6dZDPGIGv7sVGTx5zwrxqwKAoKKOzmUEnz3+AUG+5EntntcD52cgkuqb6yxg6pVD
	JWRo3UZvmSoao/JhGhxziakluoCDkKobdNXf546RjEzTRBij65hL4KzUTlPc43gohDiGEF
	4sfmHgdsNV9yNq2UA6ID0c1jDk6AKprxiA7Pg2hElMPTw5ZEaPkMTWPPn58hipDXUmqEun
	2whEubn+xf0z1U1NbIK5W2nM5K1jTwQFk/gu3/RbAsT15gVzyYv7av2DN+sE+Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1710752469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r8EiV2gzXftggen6GL4Tj807WdurcECVI7Wmk1Mm55w=;
	b=BN4mcNZW9LJt+7aw5DLrhZ/IG4G7TFzgzFAyO7MnMOJYNUH5J4LApJkR/eC35IYIKmeomT
	GZcT9f5k6/I/x6BA==
From: Nam Cao <namcao@linutronix.de>
To: Eva Kurchatova <nyandarknessgirl@gmail.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, bugs@lists.linux.dev,
 linux-i2c@vger.kernel.org, jikos@kernel.org, benjamin.tissoires@redhat.com,
 dianders@chromium.org, mripard@kernel.org, johan+linaro@kernel.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: Boot hang with SiFive PLIC when routing I2C-HID level-triggered
 interrupts
Message-ID: <20240318100108.4fafd72b@namcao>
In-Reply-To: <CA+eeCSMiqcvzrQcgRr7AZWJQTv-c9-uSX5jbPZPzmsDjy08z=A@mail.gmail.com>
References: <CA+eeCSPUDpUg76ZO8dszSbAGn+UHjcyv8F1J-CUPVARAzEtW9w@mail.gmail.com>
	<20240317222718.3e03edb1@namcao>
	<CA+eeCSMiqcvzrQcgRr7AZWJQTv-c9-uSX5jbPZPzmsDjy08z=A@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_020117_988178_2932185B 
X-CRM114-Status: GOOD (  30.14  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMTgvTWFyLzIwMjQgRXZhIEt1cmNoYXRvdmEgd3JvdGU6Cj4gT24gU3VuLCBNYXIgMTcsIDIw
MjQgYXQgMTE6MjfigK9QTSBOYW0gQ2FvIDxuYW1jYW9AbGludXRyb25peC5kZT4gd3JvdGU6Cj4g
PiBJdCBzZWVtcyBJMkMgSElEJ3MgaW50ZXJydXB0IGhhbmRsZXIgKGkyY19oaWRfaXJxKSByZXR1
cm5zIGltbWVkaWF0ZWx5IGlmCj4gPiBJMkNfSElEX1JFQURfUEVORElORyBpcyBzZXQuIFRoaXMg
ZmxhZyBpcyBzdXBwb3NlZCB0byBiZSBjbGVhcmVkIGluCj4gPiBpMmNfaGlkX3hmZXIoKSwgYnV0
IHNpbmNlIHRoZSAodGhyZWFkZWQpIGludGVycnVwdCBoYW5kbGVyIHJ1bnMgYXQgaGlnaGVyCj4g
PiBwcmlvcml0eSwgdGhlIGZsYWcgaXMgbmV2ZXIgY2xlYXJlZC4gU28gd2UgaGF2ZSBhIGxvY2st
dXA6IGludGVycnVwdAo+ID4gaGFuZGxlciB3b24ndCBkbyBhbnl0aGluZyB1bmxlc3MgdGhlIGZs
YWcgaXMgY2xlYXJlZCwgYnV0IHRoZSBjbGVhcmluZyBvZgo+ID4gdGhpcyBmbGFnIGlzIGRvbmUg
aW4gYSBsb3dlciBwcmlvcml0eSB0YXNrIHdoaWNoIG5ldmVyIGdldHMgc2NoZWR1bGVkIHdoaWxl
Cj4gPiB0aGUgaW50ZXJydXB0IGhhbmRsZXIgaXMgYWN0aXZlLgo+ID4KPiA+IFRoZXJlIGlzIFJU
IHRocm90dGxpbmcgdG8gcHJldmVudCBSVCB0YXNrcyBmcm9tIGxvY2tpbmcgdXAgdGhlIHN5c3Rl
bSBsaWtlCj4gPiB0aGlzLiBJIGRvbid0IGtub3cgbXVjaCBhYm91dCBzY2hlZHVsaW5nIHN0dWZm
cywgc28gSSBhbSBub3QgcmVhbGx5IHN1cmUKPiA+IHdoeSBSVCB0aHJvdHRsaW5nIGRvZXMgbm90
IHdvcmsuIEkgdGhpbmsgYmVjYXVzZSBSVCB0aHJvdHRsaW5nIHRyaWdnZXJzCj4gPiB3aGVuIFJU
IHRhc2tzIHRha2UgdG9vIG11Y2ggQ1BVIHRpbWUsIGJ1dCBpbiB0aGlzIGNhc2UgaGFyZCBpbnRl
cnJ1cHQKPiA+IGhhbmRsZXJzIHRha2UgbG90cyBvZiBDUFUgdGltZSB0b28gKH41MCUgYWNjb3Jk
aW5nIHRvIG15IG1lYXN1cmVtZW50KSwgc28KPiA+IFJUIHRocm90dGxpbmcgZG9lc24ndCB0cmln
Z2VyIG9mdGVuIGVub3VnaCAoaW4gdGhpcyBjYXNlLCBpdCB0cmlnZ2VycyBvbmNlCj4gPiBhbmQg
bmV2ZXIgYWdhaW4pLiBBZ2FpbiwgSSBkb24ndCBrbm93IG11Y2ggYWJvdXQgc2NoZWR1bGVyIHNv
IEkgbWF5IGJlCj4gPiB0YWxraW5nIG5vbnNlbnNlIGhlcmUuCj4gPgo+ID4gVGhlIGZsYWcgSTJD
X0hJRF9SRUFEX1BFTkRJTkcgc2VlbXMgdG8gYmUgdXNlZCB0byBtYWtlIHN1cmUgdGhhdCBvbmx5
IDEKPiA+IEkyQyBvcGVyYXRpb24gY2FuIGhhcHBlbiBhdCBhIHRpbWUuIEJ1dCB0aGlzIHNlZW1z
IHBvaW50bGVzcywgYmVjYXVzZSBJMkMKPiA+IHN1YnN5c3RlbSBhbHJlYWR5IHRha2VzIGNhcmUg
b2YgdGhpcy4gU28gSSB0aGluayB3ZSBjYW4ganVzdCByZW1vdmUgaXQuCj4gPgo+ID4gQ2FuIHlv
dSBnaXZlIHRoZSBiZWxvdyBwYXRjaCBhIHRyeT8KPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9oaWQvaTJjLWhpZC9pMmMtaGlkLWNvcmUuYyBiL2RyaXZlcnMvaGlkL2kyYy1oaWQvaTJjLWhp
ZC1jb3JlLmMKPiA+IGluZGV4IDI3MzVjZDU4NWFmMC4uNzk5YWQwZWY5YzRhIDEwMDY0NAo+ID4g
LS0tIGEvZHJpdmVycy9oaWQvaTJjLWhpZC9pMmMtaGlkLWNvcmUuYwo+ID4gKysrIGIvZHJpdmVy
cy9oaWQvaTJjLWhpZC9pMmMtaGlkLWNvcmUuYwo+ID4gQEAgLTY0LDcgKzY0LDYgQEAKPiA+ICAv
KiBmbGFncyAqLwo+ID4gICNkZWZpbmUgSTJDX0hJRF9TVEFSVEVEICAgICAgICAgICAgICAgIDAK
PiA+ICAjZGVmaW5lIEkyQ19ISURfUkVTRVRfUEVORElORyAgMQo+ID4gLSNkZWZpbmUgSTJDX0hJ
RF9SRUFEX1BFTkRJTkcgICAyCj4gPgo+ID4gICNkZWZpbmUgSTJDX0hJRF9QV1JfT04gICAgICAg
ICAweDAwCj4gPiAgI2RlZmluZSBJMkNfSElEX1BXUl9TTEVFUCAgICAgIDB4MDEKPiA+IEBAIC0x
OTAsMTUgKzE4OSwxMCBAQCBzdGF0aWMgaW50IGkyY19oaWRfeGZlcihzdHJ1Y3QgaTJjX2hpZCAq
aWhpZCwKPiA+ICAgICAgICAgICAgICAgICBtc2dzW25dLmxlbiA9IHJlY3ZfbGVuOwo+ID4gICAg
ICAgICAgICAgICAgIG1zZ3Nbbl0uYnVmID0gcmVjdl9idWY7Cj4gPiAgICAgICAgICAgICAgICAg
bisrOwo+ID4gLQo+ID4gLSAgICAgICAgICAgICAgIHNldF9iaXQoSTJDX0hJRF9SRUFEX1BFTkRJ
TkcsICZpaGlkLT5mbGFncyk7Cj4gPiAgICAgICAgIH0KPiA+Cj4gPiAgICAgICAgIHJldCA9IGky
Y190cmFuc2ZlcihjbGllbnQtPmFkYXB0ZXIsIG1zZ3MsIG4pOwo+ID4KPiA+IC0gICAgICAgaWYg
KHJlY3ZfbGVuKQo+ID4gLSAgICAgICAgICAgICAgIGNsZWFyX2JpdChJMkNfSElEX1JFQURfUEVO
RElORywgJmloaWQtPmZsYWdzKTsKPiA+IC0KPiA+ICAgICAgICAgaWYgKHJldCAhPSBuKQo+ID4g
ICAgICAgICAgICAgICAgIHJldHVybiByZXQgPCAwID8gcmV0IDogLUVJTzsKPiA+Cj4gPiBAQCAt
NTY2LDkgKzU2MCw2IEBAIHN0YXRpYyBpcnFyZXR1cm5fdCBpMmNfaGlkX2lycShpbnQgaXJxLCB2
b2lkICpkZXZfaWQpCj4gPiAgewo+ID4gICAgICAgICBzdHJ1Y3QgaTJjX2hpZCAqaWhpZCA9IGRl
dl9pZDsKPiA+Cj4gPiAtICAgICAgIGlmICh0ZXN0X2JpdChJMkNfSElEX1JFQURfUEVORElORywg
JmloaWQtPmZsYWdzKSkKPiA+IC0gICAgICAgICAgICAgICByZXR1cm4gSVJRX0hBTkRMRUQ7Cj4g
PiAtCj4gPiAgICAgICAgIGkyY19oaWRfZ2V0X2lucHV0KGloaWQpOwo+ID4KPiA+ICAgICAgICAg
cmV0dXJuIElSUV9IQU5ETEVEOyAgCj4gCj4gUGF0Y2ggYXBwbGllZCBjbGVhbmx5IG9uIHRvcCBv
ZiA2LjcuOSwgYnVpbGRzIE9LIChObyB3YXJucywgZXRjKS4KPiAKPiBUaGlzIGluZGVlZCBmaXhl
cyB0aGUgaGFuZyBjb21wbGV0ZWx5LgoKTmljZSEgSSBhc3N1bWUgSSBjYW4gYWRkCiAgICBSZXBv
cnRlZC1hbmQtdGVzdGVkLWJ5OiBFdmEgS3VyY2hhdG92YSA8bnlhbmRhcmtuZXNzZ2lybEBnbWFp
bC5jb20+CnRvIHRoZSBwYXRjaD8KCj4gSSBtb2RpZmllZCBSVlZNIHRvIHNlbmQgbWlsbGlvbnMg
b2Yga2V5c3Ryb2tlIGV2ZW50cyBwZXIgc2Vjb25kLAo+IGFuZCBwdXQgYHJlYm9vdGAgYXMgYSBz
ZXJ2aWNlIGhvb2sgaW4gdGhlIGd1ZXN0LiBJdCBoYXMgYmVlbiBjb250aW51b3VzbHkKPiByZWJv
b3Rpbmcgd2l0aG91dCBhIGhpdGNoIGZvciB0aGUgbGFzdCAzMCBtaW51dGVzIG9yIHNvIChGdWxs
IGJvb3QgdGFrZXMKPiBhcm91bmQgMiBzZWNvbmRzKSwgd2hlcmVhcyB1bnBhdGNoZWQgNi43Ljkg
aGFuZ3MgYWxtb3N0IGltbWVkaWF0ZWx5Cj4gaW4gc3VjaCBjb25kaXRpb25zIChSZXZlcnRlZCB5
b3VyIHBhdGNoICYgcmVidWlsdCB0byBiZSBzdXJlKS4KPiAKPiBUaGFuayB5b3UgdmVyeSBtdWNo
IGZvciB0aGlzISBIb3BlIHRvIHNlZSBpdCB1cHN0cmVhbWVkIHNvb24KClRoYW5rIHlvdSBmb3Ig
dGhlIHJlcG9ydCwgeW91ciBpbnZlc3RpZ2F0aW9uIGhlbHBlZCBhIGxvdC4KCkkgYW0gc3RpbGwg
Y29uZnVzZWQgd2h5IFJUIHRocm90dGxpbmcgZG9lc24ndCB1bnN0dWNrIHRoZSBrZXJuZWwgaW4g
dGhpcwpjYXNlLiBJIHdpbGwgY29uc3VsdCBzb21lIHBlb3BsZSBhbmQgaW52ZXN0aWdhdGUgbW9y
ZSBvbiB0aGlzLiBCdXQgSSB0aGluawp0aGlzIHBhdGNoIGlzIGdvb2Qgb24gaXRzIG93biwgc28g
SSB3aWxsIHNlbmQgYSBwcm9wZXIgcGF0Y2ggc2hvcnRseS4KCkJlc3QgcmVnYXJkcywKTmFtCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
