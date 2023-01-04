Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51533C4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jan 2023 15:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z75OP7LCH9J8S3UmQij7IuMFom17t9fjIyifG+1FdBA=; b=BaqAulyx7oQx4U
	FyoKtjLz0lbf4MYBj7HVh93sJUDpDoDB9/bV0l8r+Bh8AqzhStl3wpReOnfXfRKWS7ZG6s5YRA4xe
	gwX4bjUyxfZreqAKtLB8tjnWXju62Tt5Nme68GdVPOT8acvQ9O2XiTMAqg+Qvmw6H9iKZDPORF8Fk
	ZCbxn22br8CGz+3x4tGC8p3uxqGjT6cco17MX4s7qzBDSrmxzf0TAG9Yb+6RnFXu3grrwsH5qkLNp
	AkDYMJmZ5yDkW005CaJ3e5N1N8x+PKKcz0ystBWY3Yn66711m6bAa0H6qfBbINFqqf8GnXFtNGc26
	vbchvhmDcqEvFMjltjMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD5QY-009yyj-Hi; Wed, 04 Jan 2023 15:11:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD2Uc-008x3R-VV
	for linux-riscv@lists.infradead.org; Wed, 04 Jan 2023 12:03:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A9D031042;
	Wed,  4 Jan 2023 04:04:15 -0800 (PST)
Received: from FVFF77S0Q05N (unknown [10.57.37.146])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C581C3F587;
	Wed,  4 Jan 2023 04:03:30 -0800 (PST)
Date: Wed, 4 Jan 2023 12:03:28 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Guo Ren <guoren@kernel.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>, arnd@arndb.de, palmer@rivosinc.com,
	tglx@linutronix.de, peterz@infradead.org, luto@kernel.org,
	conor.dooley@microchip.com, heiko@sntech.de, jszhang@kernel.org,
	lazyparser@gmail.com, falcon@tinylab.org, chenhuacai@kernel.org,
	apatel@ventanamicro.com, atishp@atishpatra.org, ben@decadent.org.uk,
	bjorn@kernel.org, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>
Subject: Re: [PATCH -next V12 3/7] riscv: entry: Add noinstr to prevent
 instrumentation inserted
Message-ID: <Y7VrEMJtwC7v7oNy@FVFF77S0Q05N>
References: <20230103033531.2011112-1-guoren@kernel.org>
 <20230103033531.2011112-4-guoren@kernel.org>
 <36314eb6-e41d-30b9-9ac4-12b88a108b7b@ghiti.fr>
 <CAJF2gTTSretKkJGNV7Y6iJboPuAWUQ=to=RPA8_-Nz8dnufGAg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTTSretKkJGNV7Y6iJboPuAWUQ=to=RPA8_-Nz8dnufGAg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_040339_213761_CFB732EF 
X-CRM114-Status: GOOD (  32.38  )
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

T24gV2VkLCBKYW4gMDQsIDIwMjMgYXQgMDk6NDA6MzhBTSArMDgwMCwgR3VvIFJlbiB3cm90ZToK
PiBPbiBUdWUsIEphbiAzLCAyMDIzIGF0IDU6MTIgUE0gQWxleGFuZHJlIEdoaXRpIDxhbGV4QGdo
aXRpLmZyPiB3cm90ZToKPiA+Cj4gPiBIaSBHdW8sCj4gPgo+ID4gT24gMS8zLzIzIDA0OjM1LCBn
dW9yZW5Aa2VybmVsLm9yZyB3cm90ZToKPiA+ID4gRnJvbTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4
LmFsaWJhYmEuY29tPgo+ID4gPgo+ID4gPiBXaXRob3V0IG5vaW5zdHIgdGhlIGNvbXBpbGVyIGlz
IGZyZWUgdG8gaW5zZXJ0IGluc3RydW1lbnRhdGlvbiAodGhpbmsKPiA+ID4gYWxsIHRoZSBrKlNB
TiwgS0NvdiwgR0NvdiwgZnRyYWNlIGV0Yy4uKSB3aGljaCBjYW4gY2FsbCBjb2RlIHdlJ3JlIG5v
dAo+ID4gPiB5ZXQgcmVhZHkgdG8gcnVuIHRoaXMgZWFybHkgaW4gdGhlIGVudHJ5IHBhdGgsIGZv
ciBpbnN0YW5jZSBpdCBjb3VsZAo+ID4gPiByZWx5IG9uIFJDVSB3aGljaCBpc24ndCBvbiB5ZXQs
IG9yIGV4cGVjdCBsb2NrZGVwIHN0YXRlLiAoYnkgcGV0ZXJ6KQo+ID4gPgo+ID4gPiBMaW5rOiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi9ZeGNRNk5vUGYzQUgwRVhlQGhpcmV6
LnByb2dyYW1taW5nLmtpY2tzLWFzcy5uZXQvCj4gPiA+IFJldmlld2VkLWJ5OiBCasO2cm4gVMO2
cGVsIDxiam9ybkByaXZvc2luYy5jb20+Cj4gPiA+IFN1Z2dlc3RlZC1ieTogUGV0ZXIgWmlqbHN0
cmEgPHBldGVyekBpbmZyYWRlYWQub3JnPgo+ID4gPiBUZXN0ZWQtYnk6IEppc2hlbmcgWmhhbmcg
PGpzemhhbmdAa2VybmVsLm9yZz4KPiA+ID4gU2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVu
QGxpbnV4LmFsaWJhYmEuY29tPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5A
a2VybmVsLm9yZz4KPiA+ID4gLS0tCj4gPiA+ICAgYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYyB8
IDQgKystLQo+ID4gPiAgIGFyY2gvcmlzY3YvbW0vZmF1bHQuYyAgICAgfCAyICstCj4gPiA+ICAg
MiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gPiA+Cj4g
PiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jIGIvYXJjaC9yaXNjdi9r
ZXJuZWwvdHJhcHMuYwo+ID4gPiBpbmRleCA1NDliZGU1Yzk3MGEuLjk2ZWM3NmM1NGZmMiAxMDA2
NDQKPiA+ID4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYwo+ID4gPiArKysgYi9hcmNo
L3Jpc2N2L2tlcm5lbC90cmFwcy5jCj4gPiA+IEBAIC05NSw5ICs5NSw5IEBAIHN0YXRpYyB2b2lk
IGRvX3RyYXBfZXJyb3Ioc3RydWN0IHB0X3JlZ3MgKnJlZ3MsIGludCBzaWdubywgaW50IGNvZGUs
Cj4gPiA+ICAgfQo+ID4gPgo+ID4gPiAgICNpZiBkZWZpbmVkKENPTkZJR19YSVBfS0VSTkVMKSAm
JiBkZWZpbmVkKENPTkZJR19SSVNDVl9BTFRFUk5BVElWRSkKPiA+ID4gLSNkZWZpbmUgX190cmFw
X3NlY3Rpb24gICAgICAgICAgICAgICBfX3NlY3Rpb24oIi54aXAudHJhcHMiKQo+ID4gPiArI2Rl
ZmluZSBfX3RyYXBfc2VjdGlvbiBfX25vaW5zdHJfc2VjdGlvbigiLnhpcC50cmFwcyIpCj4gPiA+
ICAgI2Vsc2UKPiA+ID4gLSNkZWZpbmUgX190cmFwX3NlY3Rpb24KPiA+ID4gKyNkZWZpbmUgX190
cmFwX3NlY3Rpb24gbm9pbnN0cgo+ID4gPiAgICNlbmRpZgo+ID4gPiAgICNkZWZpbmUgRE9fRVJS
T1JfSU5GTyhuYW1lLCBzaWdubywgY29kZSwgc3RyKSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBcCj4gPiA+ICAgYXNtbGlua2FnZSBfX3Zpc2libGUgX190cmFwX3NlY3Rpb24gdm9pZCBu
YW1lKHN0cnVjdCBwdF9yZWdzICpyZWdzKSBcCj4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L21tL2ZhdWx0LmMgYi9hcmNoL3Jpc2N2L21tL2ZhdWx0LmMKPiA+ID4gaW5kZXggZDg2ZjdjZWJk
NGE3Li5iMjZmNjhlYWM2MWMgMTAwNjQ0Cj4gPiA+IC0tLSBhL2FyY2gvcmlzY3YvbW0vZmF1bHQu
Ywo+ID4gPiArKysgYi9hcmNoL3Jpc2N2L21tL2ZhdWx0LmMKPiA+ID4gQEAgLTIwNCw3ICsyMDQs
NyBAQCBzdGF0aWMgaW5saW5lIGJvb2wgYWNjZXNzX2Vycm9yKHVuc2lnbmVkIGxvbmcgY2F1c2Us
IHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQo+ID4gPiAgICAqIFRoaXMgcm91dGluZSBoYW5k
bGVzIHBhZ2UgZmF1bHRzLiAgSXQgZGV0ZXJtaW5lcyB0aGUgYWRkcmVzcyBhbmQgdGhlCj4gPiA+
ICAgICogcHJvYmxlbSwgYW5kIHRoZW4gcGFzc2VzIGl0IG9mZiB0byBvbmUgb2YgdGhlIGFwcHJv
cHJpYXRlIHJvdXRpbmVzLgo+ID4gPiAgICAqLwo+ID4gPiAtYXNtbGlua2FnZSB2b2lkIGRvX3Bh
Z2VfZmF1bHQoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4gPiA+ICthc21saW5rYWdlIHZvaWQgbm9p
bnN0ciBkb19wYWdlX2ZhdWx0KHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+ID4KPiA+Cj4gPiAoSSBk
dWcgdGhlIGFyY2hpdmUgYnV0IGNhbid0IGZpbmQgdGhlIHNlcmllcyBiZWZvcmUgdjQsIHNvIHNv
cnJ5IGlmIGl0Cj4gPiB3YXMgYWxyZWFkeSBhbnN3ZXJlZCkKPiA+Cj4gPiBJIHRoaW5rIHdlIHNo
b3VsZCBub3QgZGlzYWJsZSB0aGUgaW5zdHJ1bWVudGF0aW9uIG9mIHRob3NlIHRyYXAgaGFuZGxl
cnMKPiA+IGFzIGF0IGxlYXN0IHByb2ZpbGluZyB0aGVtIHdpdGggZnRyYWNlIHdvdWxkIHByb3Zp
ZGUgdmFsdWFibGUKPiA+IGluZm9ybWF0aW9uIChhbmQgZ2NvdiB3b3VsZCBiZSBuaWNlIHRvbyk6
IHdoeSBkbyB3ZSBuZWVkIHRvIGRvIHRoYXQ/IEEKPiA+IHRyYXAgdmVyeSBlYXJseSBpbiB0aGUg
Ym9vdCBwcm9jZXNzIGlzIG5vdCByZWNvdmVyYWJsZSBhbnl3YXkuCj4gRXZlcnl0aGluZyB0aGF0
IGNhbGxzIGlycWVudHJ5X2VudGVyKCkgc2hvdWxkIGJlIG5vaW5zdHIsIGFuZCB0aGlzCj4gcGF0
Y2ggcHJlcGFyZXMgZm9yIHRoZSBuZXh0IGdlbmVyaWNfZW50cnkgY29udmVydC4KPiAKPiBlZzoK
PiBhc21saW5rYWdlIHZvaWQgbm9pbnN0ciBkb19wYWdlX2ZhdWx0KHN0cnVjdCBwdF9yZWdzICpy
ZWdzKQo+IHsKPiAgICAgICAgIGlycWVudHJ5X3N0YXRlX3Qgc3RhdGUgPSBpcnFlbnRyeV9lbnRl
cihyZWdzKTsKPiAKPiAgICAgICAgIF9fZG9fcGFnZV9mYXVsdChyZWdzKTsKPiAKPiAgICAgICAg
IGxvY2FsX2lycV9kaXNhYmxlKCk7Cj4gCj4gICAgICAgICBpcnFlbnRyeV9leGl0KHJlZ3MsIHN0
YXRlKTsKPiB9Cj4gTk9LUFJPQkVfU1lNQk9MKGRvX3BhZ2VfZmF1bHQpOwo+IAo+IFlvdSBzdGls
bCBjb3VsZCBwcm9maWxlIF9fZG9fcGFnZV9mYXVsdC4KPiAKPiA+Cj4gPiBBbmQgSSB0b29rIGEg
bG9vayBhdCBvdGhlciBhcmNoaXRlY3R1cmVzLCBub25lIG9mIHRoZW0gZGlzYWJsZXMgdGhlCj4g
PiBpbnN0cnVtZW50YXRpb24gb24gZG9fcGFnZV9mYXVsdC4KPiBUaGF0J3Mgbm90IHRydWUsIGhh
dmUgYSBsb29rIGF0IHBvd2VyICYgYXJtNjQuIEFsbCBvZiB0aGVtIGhhdmUgc29tZQo+IGxpbWl0
YXRpb25zIGF0IHRoZSBlbnRyeSBvZiBwYWdlX2ZhdWx0LgoKV2VsbCwgYXJtNjQncyBjYW4ndCBi
ZSBrcHJvYmVkLCBidXQgaXMgKmNhbiogYmUgdHJhY2VkIHdpdGggZnRyYWNlLCBhbmQgKmNhbioK
YmUgaW5zdHJ1bWVudGVkIHdpdGggS0FTQU4gYW5kIGZyaWVuZHMuIEknbSBub3Qgc3VyZSB0aGF0
IHdlIGFjdHVhbGx5IG5lZWQgdG8KaW5oaWJpdCBrcHJvYmVzIGZvciBkb19wYWdlX2ZhdWx0LCBh
bmQgd2UgbWlnaHQgYmUgYWJsZSB0byByZWxheCB0aGF0LgoKQXMgYSBnZW5lcmFsIHRoaW5nLCB3
ZSd2ZSB0cmllZCB0byBjZW50cmFsaXplIGFsbCB0aGUgbmVjZXNhcmlseS1ub2luc3RyIGJpdHMK
aW4gYXJjaC9hcm02NC9rZXJuZWwvZW50cnktY29tbW9uLmMsIGFuZCBrZWVwIGV2ZXJ5dGhpbmcg
ZWxzZSBhcyBpbnN0cnVtZW50YWJsZQphcyBwb3NzaWJsZS4KCkknZCByZWNvbW1lbmQgZG9pbmcg
c2ltaWxhciwgYW5kIGhhdmUgYSBjZW50cmFsIGZpbGUgZm9yIGFueSBlbnRyeSBiaXRzIHdoaWNo
CmNhbid0IGxpdmUgaW4gdGhlIGdlbmVyaWMgZW50cnkgY29kZSwgYW5kIGtlZXAgdGhlIHJlc3Qg
aW5zdHJ1bWVudGFibGUuIFRoYXQKd2lsbCBtYWtlIGl0IGVhc2llciB0byBtYWludGFpbiBhbmQg
dmVyaWZ5LgoKVGhhbmtzLApNYXJrLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
