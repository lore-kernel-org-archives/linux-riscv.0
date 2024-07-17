Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 882B0C3DA5D
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jul 2024 01:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jfuk6k+kMYtll/8Abukdyo86m/R6SlBJc9zce1nCdc0=; b=W+X6zDJtpmgwGE
	zK6M26QgeQeiIrtbOB8XTp8lGR1bM8gXB5rpJn65Wbztrcim7HBc7sF29EY36bqsvJKgonTN5JH5b
	rpj4T/y1Renmlpl0+bbot/V6ZMgw/P0UaBsf/wdwaetNKPnDTF9NaRweVmz5Y/7nRrq9lrsCvNHLm
	koc1dRwfBfvu9W+agEhI3+6NahvgpeQvFhjUNDJoqQH4GOs6BhY4ZhNzSWtQAdmWPH5kYIOd1do8B
	lt8wgsdShAyqq+6+Qx0XfcE3QXJSo6uxoZaJ0PgfCE+vjnK7wNYfMA226dh4JuxCqYIMkANiGrjif
	R7tXEy+9gx2k02vKQEvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUFjm-0000000FNNR-2Tdv;
	Thu, 18 Jul 2024 01:15:14 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU5Wm-0000000E10I-0dWP
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jul 2024 14:21:09 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7E88F20003;
	Wed, 17 Jul 2024 14:20:59 +0000 (UTC)
Message-ID: <442ee5ba-8826-4a0c-8205-31b12c7877c8@ghiti.fr>
Date: Wed, 17 Jul 2024 16:20:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] riscv: Allow to build only with LLVM >= 17.0.0
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
To: Conor Dooley <conor@kernel.org>, Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Nathan Chancellor <nathan@kernel.org>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, kernel test robot <lkp@intel.com>
References: <20240717111716.157149-1-alexghiti@rivosinc.com>
 <20240717-synapse-decade-a0d41bd7afce@spud>
 <203e8784-54f2-43ea-a442-833d7e4a06c8@ghiti.fr>
In-Reply-To: <203e8784-54f2-43ea-a442-833d7e4a06c8@ghiti.fr>
X-GND-Spam-Score: 400
X-GND-Status: SPAM
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_072108_499511_14555418 
X-CRM114-Status: GOOD (  26.37  )
X-Mailman-Approved-At: Wed, 17 Jul 2024 18:15:08 -0700
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMTcvMDcvMjAyNCAxMzo0MSwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+IEhpIENvbm9yLAo+
Cj4gT24gMTcvMDcvMjAyNCAxMzozMiwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+PiBPbiBXZWQsIEp1
bCAxNywgMjAyNCBhdCAwMToxNzoxNlBNICswMjAwLCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4+
PiBUaGUgZm9sbG93aW5nIGJ1aWxkIGZhaWx1cmUgaGFwcGVucyB3aGVuIHVzaW5nIExMVk0gPCAx
Ny4wLjA6Cj4+Pgo+Pj4ga2VybmVsL3NjaGVkL2NvcmUuYzoxMTg3Mzo3OiBlcnJvcjogY2Fubm90
IGp1bXAgZnJvbSB0aGlzIGFzbSBnb3RvIAo+Pj4gc3RhdGVtZW50IHRvIG9uZSBvZiBpdHMgcG9z
c2libGUgdGFyZ2V0cwo+Pj4KPj4+IFRoaXMgaXMgYSBrbm93biBpc3N1ZSBbMV0gc28gbGV0J3Mg
dXBncmFkZSB0aGUgbWluaW1hbCByZXF1aXJlbWVudCBmb3IKPj4+IExMVk0gdG8gdGhlIHZlcnNp
b24gMTcuMC4wLCB3aGljaCBpcyB0aGUgZmlyc3QgdmVyc2lvbiB0byBjb250YWluIHRoZQo+Pj4g
Zml4Lgo+PiBJIHRoaW5rIGRvaW5nIHRoaXMgdW5pbGF0ZXJhbGx5IGlzIGtpbmRhIGluc2FuZSwg
TExWTSAxNyBpc24ndCBldmVuIGEKPj4geWVhciBvbGQuIERlYmlhbiB0ZXN0aW5nIGRvZXNuJ3Qg
aGF2ZSBhbnl0aGluZyBsYXRlciB0aGFuIDE2Lgo+Cj4KPiBEZWJpYW4gd2lsbCB2ZXJ5IGxpa2Vs
eSBzZWxlY3QgdGhlIHFzcGlubG9ja3Mgd2hlbiBhdmFpbGFibGUgYW55d2F5LCAKPiBzbyB0aGV5
J2xsIG5lZWQgbGx2bSA+PSAxNy4gQW5kIERlYmlhbiB3b24ndCBzaGlwIGEga2VybmVsID49IDYu
MTEgCj4gdW50aWwgc29tZSB0aW1lIHJpZ2h0PyBTbyB0aGV5J2xsIHByb2JhYmx5IHVwZGF0ZSB0
aGVpciBpbmZyYSB0byBsbHZtIAo+ID49IDE3IChhbmQgdGhleSdsbCBwcm9iYWJseSBkbyB0byB0
YWtlIGFkdmFudGFnZXMgb2YgdGhlIG5ldyBleHRlbnNpb25zKS4KPgo+Cj4+IFdoeSBkb2VzCj4+
IGl0IG5lZWQgdG8gYmUgZG9uZSB1bmlsYXRlcmFsbHkgcmF0aGVyIHRoYW4ganVzdCB3aGVuIHRo
ZSBxc3BpbmxvY2sKPj4gc3R1ZmYgaXMgYnVpbHQ/Cj4KPgo+IFdlIGNhbiBkbyB0aGF0IGluZGVl
ZCwgaXQgbWF5IGhhcHBlbiBhZ2FpbiBhbmQgd2UgY2FuIGtlZXAgcmVxdWlyaW5nIAo+IGxsdm0g
MTcgb24gYSBwZXItY29uZmlnIGJhc2lzLgo+Cj4KPj4+IExpbms6IAo+Pj4gaHR0cHM6Ly9naXRo
dWIuY29tL0NsYW5nQnVpbHRMaW51eC9saW51eC9pc3N1ZXMvMTg4NiNpc3N1ZWNvbW1lbnQtMTY0
NTk3OTk5MiAKPj4+IFsxXQo+Pj4gUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BA
aW50ZWwuY29tPgo+Pj4gQ2xvc2VzOiAKPj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL29lLWti
dWlsZC1hbGwvMjAyNDA3MDQxMTU3Lm9kVFpBWVo2LWxrcEBpbnRlbC5jb20vCj4+PiBTaWduZWQt
b2ZmLWJ5OiBOYXRoYW4gQ2hhbmNlbGxvciA8bmF0aGFuQGtlcm5lbC5vcmc+Cj4+IElmIE5hdGhh
biB3cm90ZSB0aGUgcGF0Y2gsIHlvdSBuZWVkIHRvIHNldCBoaW0gYXMgdGhlIGF1dGhvciBvZiB0
aGUKPj4gcGF0Y2ggOikKPgo+Cj4gSSB0aG91Z2h0IEkgZGlkLCBob3cgc2hvdWxkIEkgZG8gdGhh
dCB0aGVuPwo+Cj4KPj4KPj4+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdo
aXRpQHJpdm9zaW5jLmNvbT4KPj4+IC0tLQo+Pj4KPj4+IFRoaXMgcGF0Y2ggd2FzIGRvbmUgYnkg
TmF0aGFuLCBJJ20ganVzdCBzZW5kaW5nIGl0IGFzIGFuIFJGQyB0byBnZXQgCj4+PiBxdWlja2Vy
Cj4+PiBmZWVkYmFja3MuCj4+Pgo+Pj4gSSB0ZXN0ZWQgaXQgc3VjY2Vzc2Z1bGx5Lgo+Pj4KPj4+
IE5vdGUgdGhhdCB0aGUgYnVpbGQgZmFpbHVyZSBoYXBwZW5zIG9uIHRoZSBub3QteWV0IG1lcmdl
ZCBxc3BpbmxvY2sKPj4+IHBhdGNoc2V0Lgo+Pj4KPj4+IMKgIHNjcmlwdHMvbWluLXRvb2wtdmVy
c2lvbi5zaCB8IDIgKysKPj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPj4+
Cj4+PiBkaWZmIC0tZ2l0IGEvc2NyaXB0cy9taW4tdG9vbC12ZXJzaW9uLnNoIGIvc2NyaXB0cy9t
aW4tdG9vbC12ZXJzaW9uLnNoCj4+PiBpbmRleCA5MWM5MTIwMTIxMmMuLmU4MWViN2VkMjU3ZCAx
MDA3NTUKPj4+IC0tLSBhL3NjcmlwdHMvbWluLXRvb2wtdmVyc2lvbi5zaAo+Pj4gKysrIGIvc2Ny
aXB0cy9taW4tdG9vbC12ZXJzaW9uLnNoCj4+PiBAQCAtMjgsNiArMjgsOCBAQCBsbHZtKQo+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgIGVjaG8gMTUuMC4wCj4+PiDCoMKgwqDCoMKgIGVsaWYgWyAiJFNS
Q0FSQ0giID0gbG9vbmdhcmNoIF07IHRoZW4KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBlY2hvIDE4
LjAuMAo+Pj4gK8KgwqDCoCBlbGlmIFsgIiRTUkNBUkNIIiA9IHJpc2N2IF07IHRoZW4KPj4+ICvC
oMKgwqDCoMKgwqDCoCBlY2hvIDE3LjAuMAo+Pj4gwqDCoMKgwqDCoCBlbHNlCj4+PiDCoMKgwqDC
oMKgwqDCoMKgwqAgZWNobyAxMy4wLjEKPj4+IMKgwqDCoMKgwqAgZmkKPj4+IC0tIAo+Pj4gMi4z
OS4yCj4+Pgo+Pj4KPj4+Cj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+Pj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4+PiBsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCj4+PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2CgoKU28gd2UgZGlzY3Vzc2VkIHRoYXQgZHVyaW5nIHRoZSBw
YXRjaHdvcmsgbWVldGluZyBhbmQgdGhpcyBwYXRjaCBpcyBub3QgCndhbnRlZCwgdGhlIGlkZWEg
aXMgcmF0aGVyIHRvIGdldCByaWQgb2YgdGhlIGJ1aWxkIGVycm9yLgoKSSB3YXMgZ2l2ZW4gYSBm
ZXcgaWRlYXMgc28gSSdsbCB0cnkgdGhvc2UgYW5kIHdlJ2xsIHNlZSB3aGF0IHRoZSAKcmVzdWx0
aW5nIGNvZGUgbG9va3MgbGlrZSwgaG9wZWZ1bGx5IG5vdCB1Z2x5IG90aGVyd2lzZSBJJ2xsIHJl
LW9wZW4gdGhlIApkaXNjdXNzaW9uIDopCgpUaGFua3MgTmF0aGFuIGZvciB0aGUgcGF0Y2gsCgpB
bGV4CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
