Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9524DF483D3
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Mar 2026 16:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=105GAon5+L3BeV6tyKizHSN0xqt0dZYdj9acbr4odek=; b=joewxGnAM+Kxma
	xQa38RcI2s4QMT5DBCHY3fxVtAXUSQ7iNz2Iw/7z5HupdzQzFrlYy0vMKRzNNvQ8+OFMeUAt/XB77
	GzuDAir0u8U8dxyfjbPV6Jl+Jn1d7ZLrR2+uJL2/ShfbCwRZPP9bzFzvGA7QoxT97wF8yEPBZJuhF
	OB+fydBMoMaV5nA7kk+926jIWT98+3rUTnhb111D2MUNsyhBOhUWjjpnpkduc6bRkGctxtYwQLeHL
	3ylZ9UmZDy4wnZz/xLp/MUUd9vubEidIOmGw2eMmjD4MPxFA0SGbdm0fbL8m4d2p9rb41oeIPAAAw
	3gE/3/2ISqsK4Hrm6w7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4iOQ-0000000H9vi-2P06;
	Mon, 23 Mar 2026 16:44:42 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4iON-0000000H9vG-1C08;
	Mon, 23 Mar 2026 16:44:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description;
	bh=u646cOHMJ/zTHL9+VZ4W7Ux0q5cDJeWhhX/W1yOam3I=; b=dlZIzt5YzevTl4QnSJxxDuhppU
	q2WiFtssembwHpot97e7p66yyqpF3dN8xA6eo3mU9Y5cs77fG/ib/E0pmR2yPSYUbOk1yB04ldCYA
	8ZSzKzhPXOJ2uxLAeNtLzVEnC72HyX/Da0COA18pwxZ18OR3/xTPzoczvd+eOfdbXU+oe4D6zXNln
	RL3AID6EDlGZkPD4dqQGcVL8hyyuo84fScfgh1+HpHr0th+N7IyqowEsgziGLLV0rZFhpAPGgdSUN
	uSgV3My9CRMDXuTe1oUCC4dNUN3U7nThOJTD+Dmv8QRP2jO2Jg1/VT/h7vj784PI985iF8yh77g2G
	eh4Qqoxg==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <leitao@debian.org>)
	id 1w4iMe-007fRI-16; Mon, 23 Mar 2026 16:42:50 +0000
Date: Mon, 23 Mar 2026 09:42:38 -0700
From: Breno Leitao <leitao@debian.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, catalin.marinas@arm.com, 
	will@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, maddy@linux.ibm.com, 
	mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, tglx@kernel.org, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
	robh@kernel.org, saravanak@kernel.org, akpm@linux-foundation.org, bhe@redhat.com, 
	vgoyal@redhat.com, dyoung@redhat.com, rdunlap@infradead.org, peterz@infradead.org, 
	feng.tang@linux.alibaba.com, pawan.kumar.gupta@linux.intel.com, dapeng1.mi@linux.intel.com, 
	kees@kernel.org, elver@google.com, paulmck@kernel.org, lirongqing@baidu.com, 
	safinaskar@gmail.com, rppt@kernel.org, ardb@kernel.org, jbohac@suse.cz, 
	cfsworks@gmail.com, osandov@fb.com, tangyouling@kylinos.cn, 
	sourabhjain@linux.ibm.com, ritesh.list@gmail.com, eajames@linux.ibm.com, 
	songshuaishuai@tinylab.org, kevin.brodsky@arm.com, samuel.holland@sifive.com, 
	vishal.moola@gmail.com, junhui.liu@pigmoral.tech, coxu@redhat.com, liaoyuanhong@vivo.com, 
	fuqiang.wang@easystack.cn, x86@kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	kexec@lists.infradead.org
Subject: Re: [PATCH v9 4/5] arm64: kexec: Add support for crashkernel CMA
 reservation
Message-ID: <acFtMLyCWbYOyFZT@gmail.com>
References: <20260323072745.2481719-1-ruanjinjie@huawei.com>
 <20260323072745.2481719-5-ruanjinjie@huawei.com>
 <acETyW3FYaWCShUc@gmail.com>
 <a5694ee0-7a95-4c15-6775-990d70c8d77b@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a5694ee0-7a95-4c15-6775-990d70c8d77b@huawei.com>
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_094439_328010_AB6D3961 
X-CRM114-Status: GOOD (  27.31  )
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

T24gTW9uLCBNYXIgMjMsIDIwMjYgYXQgMDc6MTc6MjFQTSArMDgwMCwgSmluamllIFJ1YW4gd3Jv
dGU6Cj4gCj4gCj4gT24gMjAyNi8zLzIzIDE4OjIwLCBCcmVubyBMZWl0YW8gd3JvdGU6Cj4gPiBP
biBNb24sIE1hciAyMywgMjAyNiBhdCAwMzoyNzo0NFBNICswODAwLCBKaW5qaWUgUnVhbiB3cm90
ZToKPiA+PiBDb21taXQgMzVjMThmMjkzM2M1ICgiQWRkIGEgbmV3IG9wdGlvbmFsICIsY21hIiBz
dWZmaXggdG8gdGhlCj4gPj4gY3Jhc2hrZXJuZWw9IGNvbW1hbmQgbGluZSBvcHRpb24iKSBhbmQg
Y29tbWl0IGFiNDc1NTEwZTA0MiAoImtkdW1wOgo+ID4+IGltcGxlbWVudCByZXNlcnZlX2NyYXNo
a2VybmVsX2NtYSIpIGFkZGVkIENNQSBzdXBwb3J0IGZvciBrZHVtcAo+ID4+IGNyYXNoa2VybmVs
IHJlc2VydmF0aW9uLgo+ID4+Cj4gPj4gQ3Jhc2gga2VybmVsIG1lbW9yeSByZXNlcnZhdGlvbiB3
YXN0ZXMgcHJvZHVjdGlvbiByZXNvdXJjZXMgaWYgdG9vCj4gPj4gbGFyZ2UsIHJpc2tzIGtkdW1w
IGZhaWx1cmUgaWYgdG9vIHNtYWxsLCBhbmQgZmFjZXMgYWxsb2NhdGlvbiBkaWZmaWN1bHRpZXMK
PiA+PiBvbiBmcmFnbWVudGVkIHN5c3RlbXMgZHVlIHRvIGNvbnRpZ3VvdXMgYmxvY2sgY29uc3Ry
YWludHMuIFRoZSBuZXcKPiA+PiBDTUEtYmFzZWQgY3Jhc2hrZXJuZWwgcmVzZXJ2YXRpb24gc2No
ZW1lIHNwbGl0cyB0aGUgImxhcmdlIGZpeGVkCj4gPj4gcmVzZXJ2YXRpb24iIGludG8gYSAic21h
bGwgZml4ZWQgcmVnaW9uICsgbGFyZ2UgQ01BIGR5bmFtaWMgcmVnaW9uIjogdGhlCj4gPj4gQ01B
IG1lbW9yeSBpcyBhdmFpbGFibGUgdG8gdXNlcnNwYWNlIGR1cmluZyBub3JtYWwgb3BlcmF0aW9u
IHRvIGF2b2lkCj4gPj4gd2FzdGUsIGFuZCBpcyByZWNsYWltZWQgZm9yIGtkdW1wIHVwb24gY3Jh
c2jigJRzYXZpbmcgbWVtb3J5IHdoaWxlCj4gPj4gaW1wcm92aW5nIHJlbGlhYmlsaXR5Lgo+ID4+
Cj4gPj4gU28gZXh0ZW5kIGNyYXNoa2VybmVsIENNQSByZXNlcnZhdGlvbiBzdXBwb3J0IHRvIGFy
bTY0LiBUaGUgZm9sbG93aW5nCj4gPj4gY2hhbmdlcyBhcmUgbWFkZSB0byBlbmFibGUgQ01BIHJl
c2VydmF0aW9uOgo+ID4+Cj4gPj4gLSBQYXJzZSBhbmQgb2J0YWluIHRoZSBDTUEgcmVzZXJ2YXRp
b24gc2l6ZSBhbG9uZyB3aXRoIG90aGVyIGNyYXNoa2VybmVsCj4gPj4gICBwYXJhbWV0ZXJzLgo+
ID4+IC0gQ2FsbCByZXNlcnZlX2NyYXNoa2VybmVsX2NtYSgpIHRvIGFsbG9jYXRlIHRoZSBDTUEg
cmVnaW9uIGZvciBrZHVtcC4KPiA+PiAtIEluY2x1ZGUgdGhlIENNQS1yZXNlcnZlZCByYW5nZXMg
Zm9yIGtkdW1wIGtlcm5lbCB0byB1c2UuCj4gPj4gLSBFeGNsdWRlIHRoZSBDTUEtcmVzZXJ2ZWQg
cmFuZ2VzIGZyb20gdGhlIGNyYXNoIGtlcm5lbCBtZW1vcnkgdG8KPiA+PiAgIHByZXZlbnQgdGhl
bSBmcm9tIGJlaW5nIGV4cG9ydGVkIHRocm91Z2ggL3Byb2Mvdm1jb3JlLCB3aGljaCBpcyBhbHJl
YWR5Cj4gPj4gICBkb25lIGluIHRoZSBjcmFzaCBjb3JlLgo+ID4+Cj4gPj4gVXBkYXRlIGtlcm5l
bC1wYXJhbWV0ZXJzLnR4dCB0byBkb2N1bWVudCBDTUEgc3VwcG9ydCBmb3IgY3Jhc2hrZXJuZWwg
b24KPiA+PiBhcm02NCBhcmNoaXRlY3R1cmUuCj4gPj4KPiA+PiBBY2tlZC1ieTogUm9iIEhlcnJp
bmcgKEFybSkgPHJvYmhAa2VybmVsLm9yZz4KPiA+PiBBY2tlZC1ieTogQmFvcXVhbiBIZSA8Ymhl
QHJlZGhhdC5jb20+Cj4gPj4gQWNrZWQtYnk6IE1pa2UgUmFwb3BvcnQgKE1pY3Jvc29mdCkgPHJw
cHRAa2VybmVsLm9yZz4KPiA+PiBBY2tlZC1ieTogQXJkIEJpZXNoZXV2ZWwgPGFyZGJAa2VybmVs
Lm9yZz4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBKaW5qaWUgUnVhbiA8cnVhbmppbmppZUBodWF3ZWku
Y29tPgo+ID4+IC0tLQo+ID4+IHY3Ogo+ID4+IC0gQ29ycmVjdCB0aGUgaW5jbHVzaW9uIG9mIENN
QS1yZXNlcnZlZCByYW5nZXMgZm9yIGtkdW1wCj4gPj4gICBrZXJuZWwgaW4gb2Yva2V4ZWMuCj4g
Pj4gdjM6Cj4gPj4gLSBBZGQgQWNrZWQtYnkuCj4gPj4gdjI6Cj4gPj4gLSBGcmVlIGNtZW0gaW4g
cHJlcGFyZV9lbGZfaGVhZGVycygpCj4gPj4gLSBBZGQgdGhlIG10aXZhdGlvbi4KPiA+PiAtLS0K
PiA+PiAgRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9rZXJuZWwtcGFyYW1ldGVycy50eHQgfCAy
ICstCj4gPj4gIGFyY2gvYXJtNjQva2VybmVsL21hY2hpbmVfa2V4ZWNfZmlsZS5jICAgICAgICAg
IHwgMiArLQo+ID4+ICBhcmNoL2FybTY0L21tL2luaXQuYyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8IDUgKysrLS0KPiA+PiAgZHJpdmVycy9vZi9mZHQuYyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCA5ICsrKysrLS0tLQo+ID4+ICBkcml2ZXJzL29mL2tleGVjLmMgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8IDkgKysrKysrKysrCj4gPj4gIDUgZmlsZXMgY2hhbmdl
ZCwgMTkgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKPiA+Pgo+ID4+IGRpZmYgLS1naXQg
YS9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dCBiL0RvY3Vt
ZW50YXRpb24vYWRtaW4tZ3VpZGUva2VybmVsLXBhcmFtZXRlcnMudHh0Cj4gPj4gaW5kZXggY2I4
NTBlNTI5MGMyLi5hZmIzMTEyNTEwZjcgMTAwNjQ0Cj4gPj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9h
ZG1pbi1ndWlkZS9rZXJuZWwtcGFyYW1ldGVycy50eHQKPiA+PiArKysgYi9Eb2N1bWVudGF0aW9u
L2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dAo+ID4+IEBAIC0xMTIxLDcgKzExMjEs
NyBAQCBLZXJuZWwgcGFyYW1ldGVycwo+ID4+ICAJCQlJdCB3aWxsIGJlIGlnbm9yZWQgd2hlbiBj
cmFzaGtlcm5lbD1YLGhpZ2ggaXMgbm90IHVzZWQKPiA+PiAgCQkJb3IgbWVtb3J5IHJlc2VydmVk
IGlzIGJlbG93IDRHLgo+ID4+ICAJY3Jhc2hrZXJuZWw9c2l6ZVtLTUddLGNtYQo+ID4+IC0JCQlb
S05MLCBYODYsIHBwY10gUmVzZXJ2ZSBhZGRpdGlvbmFsIGNyYXNoIGtlcm5lbCBtZW1vcnkgZnJv
bQo+ID4+ICsJCQlbS05MLCBYODYsIEFSTTY0LCBQUENdIFJlc2VydmUgYWRkaXRpb25hbCBjcmFz
aCBrZXJuZWwgbWVtb3J5IGZyb20KPiA+PiAgCQkJQ01BLiBUaGlzIHJlc2VydmF0aW9uIGlzIHVz
YWJsZSBieSB0aGUgZmlyc3Qgc3lzdGVtJ3MKPiA+PiAgCQkJdXNlcnNwYWNlIG1lbW9yeSBhbmQg
a2VybmVsIG1vdmFibGUgYWxsb2NhdGlvbnMgKG1lbW9yeQo+ID4+ICAJCQliYWxsb29uLCB6c3dh
cCkuIFBhZ2VzIGFsbG9jYXRlZCBmcm9tIHRoaXMgbWVtb3J5IHJhbmdlCj4gPj4gZGlmZiAtLWdp
dCBhL2FyY2gvYXJtNjQva2VybmVsL21hY2hpbmVfa2V4ZWNfZmlsZS5jIGIvYXJjaC9hcm02NC9r
ZXJuZWwvbWFjaGluZV9rZXhlY19maWxlLmMKPiA+PiBpbmRleCBjMzM4NTA2YTU4MGIuLmNjNTc3
ZDc3ZGYwMCAxMDA2NDQKPiA+PiAtLS0gYS9hcmNoL2FybTY0L2tlcm5lbC9tYWNoaW5lX2tleGVj
X2ZpbGUuYwo+ID4+ICsrKyBiL2FyY2gvYXJtNjQva2VybmVsL21hY2hpbmVfa2V4ZWNfZmlsZS5j
Cj4gPj4gQEAgLTQyLDcgKzQyLDcgQEAgaW50IGFyY2hfa2ltYWdlX2ZpbGVfcG9zdF9sb2FkX2Ns
ZWFudXAoc3RydWN0IGtpbWFnZSAqaW1hZ2UpCj4gPj4gICNpZmRlZiBDT05GSUdfQ1JBU0hfRFVN
UAo+ID4+ICB1bnNpZ25lZCBpbnQgYXJjaF9nZXRfc3lzdGVtX25yX3Jhbmdlcyh2b2lkKQo+ID4+
ICB7Cj4gPj4gLQl1bnNpZ25lZCBpbnQgbnJfcmFuZ2VzID0gMjsgLyogZm9yIGV4Y2x1c2lvbiBv
ZiBjcmFzaGtlcm5lbCByZWdpb24gKi8KPiA+PiArCXVuc2lnbmVkIGludCBucl9yYW5nZXMgPSAy
ICsgY3Jhc2hrX2NtYV9jbnQ7IC8qIGZvciBleGNsdXNpb24gb2YgY3Jhc2hrZXJuZWwgcmVnaW9u
ICovCj4gPiAKPiA+IFlvdSB1cGRhdGUgYXJjaF9nZXRfc3lzdGVtX25yX3JhbmdlcygpIHRvIGFj
Y291bnQgZm9yIENNQSByYW5nZXMsIGJ1dAo+ID4gcHJlcGFyZV9lbGZfaGVhZGVycygpIGluIHRo
ZSBzYW1lIGZpbGUgKGxpbmUgNTEpIHN0aWxsIGhhcyB0aGUKPiA+IGhhcmRjb2RlZDoKPiA+IAo+
ID4gICAgICAgICBucl9yYW5nZXMgPSAyOyAvKiBmb3IgZXhjbHVzaW9uIG9mIGNyYXNoa2VybmVs
IHJlZ2lvbiAqLwo+IAo+IEkgZG9uJ3Qgc2VlIGFueSBsb2dpYyByZWxhdGVkIHRvIHByZXBhcmVf
ZWxmX2hlYWRlcnMoKSBvciBoYXJkY29kZWQKPiBucl9yYW5nZXMgPSAyIGluIHRoZSBhcm02NCBp
bXBsZW1lbnRhdGlvbi4KCkp1c3QgaWdub3JlIG1lIGhlcmUsIEkndmUgbWlzIGFwcGxpZWQgdGhl
IHBhdGNoLCBhbmQgdGhlbiBJIGdvdAphcmNoX2dldF9zeXN0ZW1fbnJfcmFuZ2VzKCkgYW5kIHBy
ZXBhcmVfZWxmX2hlYWRlcnMoKSwgYnV0LCB0aGV5IGFyZSB0aGUKc2FtZSB0aGluZyBhdCBpbiBo
ZXJlLgoKPiA+IAo+ID4gYW5kIGRvZXMgbm90IGV4Y2x1ZGUgQ01BIHJhbmdlcyBmcm9tIGNtZW0u
IElmIHRoZSBnZW5lcmljIGNyYXNoIGNvcmUKPiA+IGhhbmRsZXMgQ01BIGV4Y2x1c2lvbiBmcm9t
IHZtY29yZSwgdGhlbiBzaG91bGRuJ3QKPiA+IGFyY2hfZ2V0X3N5c3RlbV9ucl9yYW5nZXMoKSBh
bHNvIG5vdCBuZWVkIHRoaXMgY2hhbmdlPwo+ID4gCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
