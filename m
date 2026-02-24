Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83627EFB7E1
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Feb 2026 01:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sidhe5sYhSRpE7cXF46vYXxR6P7gSXfoenEEIbVFh7I=; b=cbp+vTq4QZBxRV
	vze2WlI7eex/eknsGKtWXBtN8I8Yte0ItouasBM3sfBJCJ+fH0zJ0cfKRXKTVLOYOJOq7UeTYiJY6
	Dw0tU/9nhQsBWmjCdBHBm3iXE5YRWhehuqXwzR4Ds9RxsYgj4G/LIR8kb0bFG8ey0a/tm0g9ASMcC
	aEsyfV+T0LxZq5HHx2pEH0cjDQID1V4xaVXsuFqF9BU46FLXLjKpCR+rqnOBTzi/DBf9coVjyvuJY
	EjoyzvuJf2EDcl8D6vpp/Rpuz6rQtyy4aULKEWyZ3DQrh0UnlSWwNVZ1agGXDnsk5OVcIaDL/KTLB
	RfHbanh8L4XyvtVY7lLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuhhx-00000001K9Q-2I7B;
	Tue, 24 Feb 2026 01:59:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuhhv-00000001K84-07SB
	for linux-riscv@lists.infradead.org;
	Tue, 24 Feb 2026 01:59:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D1CD544549
	for <linux-riscv@lists.infradead.org>; Tue, 24 Feb 2026 01:59:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7F94C2BC87
	for <linux-riscv@lists.infradead.org>; Tue, 24 Feb 2026 01:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771898365;
	bh=HUSNu0qCdup046cMKoUH8b6Lgd4CUue87zXyU4Qz5t8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QXz6fZKxw+h8NdK0FPv0o7u2Bq6/p1li3kUuFhFtIZY/L0QkK1Y+ZY5NyhmKRwp+T
	 U87tJPnbJCIpF6L0QWtaSCivPTz40kWk86F6tnouWqcCeItcEZZs9tZ0beu7RxZhsw
	 ANeviFXdu477c9blcCZSYUtlfsmxgJVHFxoYppbp93s4ieFNvVdviKwKHwEARFiG7U
	 plQT65mYRa1qSZuusMTVzo4iYv+3m1Mnu4vfqV/PBeeeiX5I7M3W6BKWXwnYsV1/xD
	 3cN4HUg+NSC6ueW9C1QnOr4wmqhrC+I81RAMYVehZkVh4BMOEkX0tme+XfRhbtj342
	 0383/BKzVYEKA==
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4377174e1ebso3808923f8f.3
        for <linux-riscv@lists.infradead.org>; Mon, 23 Feb 2026 17:59:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXcg9Rs0cYXa+XuKm+xWTYDyIiML1tveTm5nqeg9Uxf7aPCKpGcm1zvKusrATb45oisHipzwGji1HoLug==@lists.infradead.org
X-Gm-Message-State: AOJu0YzCSXweCo7xjQhsUTZExm+02ERfQ871IG2j919BP5HdIOB/eHdw
	O4VbiLLEAq5/8LF8UZeiUBJ4qPpagu59BfMqjtdEuJbR1I9EfaIp4WJqn2a/g8YKFxelMvNBbjF
	uo7zromugsnvEgWWLRP8uLSgcYVvbLN8=
X-Received: by 2002:a5d:5d0f:0:b0:432:dc1f:6982 with SMTP id
 ffacd0b85a97d-4396f166a56mr20299830f8f.16.1771898364140; Mon, 23 Feb 2026
 17:59:24 -0800 (PST)
MIME-Version: 1.0
References: <20260220090922.1506-1-jszhang@kernel.org> <20260220090922.1506-3-jszhang@kernel.org>
 <CAJF2gTTG849M7mmWo+sri0xoGYkKYxMwSEDhVr-OedMfMWC0Kw@mail.gmail.com>
In-Reply-To: <CAJF2gTTG849M7mmWo+sri0xoGYkKYxMwSEDhVr-OedMfMWC0Kw@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 24 Feb 2026 09:59:11 +0800
X-Gmail-Original-Message-ID: <CAJF2gTS=K5xGC4-QmfkeDqUm9NnPeW+W1iXygtbdyyue6mE4cA@mail.gmail.com>
X-Gm-Features: AaiRm53aHGtNOtCoyPrAzHoJqBMoFTvGVjdue5H2QAZd3FSX-1Ad_VdzKLg1NNg
Message-ID: <CAJF2gTS=K5xGC4-QmfkeDqUm9NnPeW+W1iXygtbdyyue6mE4cA@mail.gmail.com>
Subject: Re: [PATCH 2/3] genirq: use runtime constant to optimize
 handle_arch_irq access
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-csky@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_175927_115117_B3A6AFDA 
X-CRM114-Status: GOOD (  25.79  )
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

T24gVHVlLCBGZWIgMjQsIDIwMjYgYXQgOTo0MOKAr0FNIEd1byBSZW4gPGd1b3JlbkBrZXJuZWwu
b3JnPiB3cm90ZToKPgo+IE9uIEZyaSwgRmViIDIwLCAyMDI2IGF0IDU6MjjigK9QTSBKaXNoZW5n
IFpoYW5nIDxqc3poYW5nQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IEN1cnJlbnRseSwgb24g
R0VORVJJQ19JUlFfTVVMVElfSEFORExFUiBwbGF0Zm9ybXMsIHRoZSBoYW5kbGVfYXJjaF9pcnEK
PiA+IGlzIGEgcG9pbnRlciB3aGljaCBpcyBzZXQgZHVyaW5nIGJvb3RpbmcsIGFuZCBldmVyeSBp
cnEgcHJvY2Vzc2luZyBuZWVkcwo+ID4gdG8gYWNjZXNzIGl0LCBzbyBpdCBzaXRzIGluIGhvdCBj
b2RlIHBhdGguIFdlIGNhbiB1c2UgdGhlCj4gPiBydW50aW1lIGNvbnN0YW50IG1lY2hhbmlzbSB3
aGljaCB3YXMgaW50cm9kdWNlZCBieSBMaW51cyB0byBzcGVlZCB1cAo+ID4gaXRzIGFjY2Vzc2lu
Zy4KPiA+Cj4gPiBUZXN0ZWQgb24gU2lwZWVkIExpY2hlZSBQaSA0QSAocmlzY3Y2NCkgYm9hcmQs
IHRoZSBwZXJmIHNjaGVkIGJlbmNobWFyayBpcwo+ID4gaW1wcm92ZWQgYnkgfjUuOCUKPiBUaHgg
Zm9yIHRoZSB3b3JrLiBJdCdzIGEgdmlzaWJsZSBpbXByb3ZlbWVudC4KPgo+IENvbXBhcmVkIHRv
IHRoZSBvcmlnaW5hbCBoYW5kbGVyIHBvaW50ZXIgYXBwcm9hY2gsIHRoaXMgc29sdXRpb24KPiBp
bnRyb2R1Y2VzIG5vIG9ic2VydmFibGUgZHJhd2JhY2tzLiBTaW5jZSB0aGUgc3RhdGljX2NhbGwg
YWx0ZXJuYXRpdmUKPiByZXF1aXJlcyBmdXJ0aGVyIGFuYWx5c2lzIGFuZCBjb25zZW5zdXMsIGFk
b3B0aW5nIHRoaXMgaW1wbGVtZW50YXRpb24KPiBzZXJ2ZXMgYXMgYSBwcmFnbWF0aWMgaW50ZXJp
bSBzdGVwLgo+Cj4gU28sIEkgZ2l2ZToKPiBSZXZpZXdlZC1ieTogR3VvIFJlbiAoQWxpYmFiYSBE
YW1vIEFjYWRlbXkpIDxndW9yZW5Aa2VybmVsLm9yZz4KCk9oLCBkb24ndCBmb3JnZXQgTWFyaydz
IHN1Z2dlc3Rpb24gZm9yIHRoZSB1bmluaXRpYWxpemVkIGhhbmRsZXIsCndoaWNoIGlzIGFsc28g
c3VpdGFibGUgZm9yIGdlbmlycToKCiJUaGF0IG1lYW5zIHRoYXQgaWYgc2V0X2hhbmRsZV9pcnEo
KSBpc24ndCBjYWxsZWQsIGFuIElSUSB3aWxsIHJlc3VsdCBpbgphIGNhbGwgdG8gdGhhdCBib2d1
cyBhZGRyZXNzIHJhdGhlciB0aGFuIGRlZmF1bHRfaGFuZGxlX2lycSgpLCAuLi4iCgpNYXliZSB3
ZSBuZWVkIGFuIGVtcHR5IF9oYW5kbGVfYXJjaF9pcnEgaW5zdGFuY2UgYXMgYSBkZWZhdWx0IGZv
ciB0aGUKZWFybHkgc3RhZ2UuCgo+Cj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogSmlzaGVuZyBaaGFu
ZyA8anN6aGFuZ0BrZXJuZWwub3JnPgo+ID4gLS0tCj4gPiAgaW5jbHVkZS9saW51eC9pcnEuaCB8
IDQgKysrLQo+ID4gIGtlcm5lbC9pcnEvaGFuZGxlLmMgfCA4ICsrKysrLS0tCj4gPiAgMiBmaWxl
cyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAt
LWdpdCBhL2luY2x1ZGUvbGludXgvaXJxLmggYi9pbmNsdWRlL2xpbnV4L2lycS5oCj4gPiBpbmRl
eCA5NTFhY2JkYjlmODQuLjJiYTRhOGFmYjcxZSAxMDA2NDQKPiA+IC0tLSBhL2luY2x1ZGUvbGlu
dXgvaXJxLmgKPiA+ICsrKyBiL2luY2x1ZGUvbGludXgvaXJxLmgKPiA+IEBAIC0xMjc0LDYgKzEy
NzQsNyBAQCB2b2lkIGlwaV9tdXhfcHJvY2Vzcyh2b2lkKTsKPiA+ICBpbnQgaXBpX211eF9jcmVh
dGUodW5zaWduZWQgaW50IG5yX2lwaSwgdm9pZCAoKm11eF9zZW5kKSh1bnNpZ25lZCBpbnQgY3B1
KSk7Cj4gPgo+ID4gICNpZmRlZiBDT05GSUdfR0VORVJJQ19JUlFfTVVMVElfSEFORExFUgo+ID4g
KyNpbmNsdWRlIDxhc20vcnVudGltZS1jb25zdC5oPgo+ID4gIC8qCj4gPiAgICogUmVnaXN0ZXJz
IGEgZ2VuZXJpYyBJUlEgaGFuZGxpbmcgZnVuY3Rpb24gYXMgdGhlIHRvcC1sZXZlbCBJUlEgaGFu
ZGxlciBpbgo+ID4gICAqIHRoZSBzeXN0ZW0sIHdoaWNoIGlzIGdlbmVyYWxseSB0aGUgZmlyc3Qg
QyBjb2RlIGNhbGxlZCBmcm9tIGFuIGFzc2VtYmx5Cj4gPiBAQCAtMTI4OCw3ICsxMjg5LDggQEAg
aW50IF9faW5pdCBzZXRfaGFuZGxlX2lycSh2b2lkICgqaGFuZGxlX2lycSkoc3RydWN0IHB0X3Jl
Z3MgKikpOwo+ID4gICAqIEFsbG93cyBpbnRlcnJ1cHQgaGFuZGxlcnMgdG8gZmluZCB0aGUgaXJx
Y2hpcCB0aGF0J3MgYmVlbiByZWdpc3RlcmVkIGFzIHRoZQo+ID4gICAqIHRvcC1sZXZlbCBJUlEg
aGFuZGxlci4KPiA+ICAgKi8KPiA+IC1leHRlcm4gdm9pZCAoKmhhbmRsZV9hcmNoX2lycSkoc3Ry
dWN0IHB0X3JlZ3MgKikgX19yb19hZnRlcl9pbml0Owo+ID4gK2V4dGVybiB2b2lkICgqX2hhbmRs
ZV9hcmNoX2lycSkoc3RydWN0IHB0X3JlZ3MgKikgX19yb19hZnRlcl9pbml0Owo+ID4gKyNkZWZp
bmUgaGFuZGxlX2FyY2hfaXJxIHJ1bnRpbWVfY29uc3RfcHRyKF9oYW5kbGVfYXJjaF9pcnEpCj4g
PiAgYXNtbGlua2FnZSB2b2lkIGdlbmVyaWNfaGFuZGxlX2FyY2hfaXJxKHN0cnVjdCBwdF9yZWdz
ICpyZWdzKTsKPiA+ICAjZWxzZQo+ID4gICNpZm5kZWYgc2V0X2hhbmRsZV9pcnEKPiA+IGRpZmYg
LS1naXQgYS9rZXJuZWwvaXJxL2hhbmRsZS5jIGIva2VybmVsL2lycS9oYW5kbGUuYwo+ID4gaW5k
ZXggYjdkNTI4MjE4MzdiLi5hYWM5ZTdiMTMwMWUgMTAwNjQ0Cj4gPiAtLS0gYS9rZXJuZWwvaXJx
L2hhbmRsZS5jCj4gPiArKysgYi9rZXJuZWwvaXJxL2hhbmRsZS5jCj4gPiBAQCAtMTUsMTMgKzE1
LDE0IEBACj4gPiAgI2luY2x1ZGUgPGxpbnV4L2tlcm5lbF9zdGF0Lmg+Cj4gPgo+ID4gICNpbmNs
dWRlIDxhc20vaXJxX3JlZ3MuaD4KPiA+ICsjaW5jbHVkZSA8YXNtL3J1bnRpbWUtY29uc3QuaD4K
PiA+Cj4gPiAgI2luY2x1ZGUgPHRyYWNlL2V2ZW50cy9pcnEuaD4KPiA+Cj4gPiAgI2luY2x1ZGUg
ImludGVybmFscy5oIgo+ID4KPiA+ICAjaWZkZWYgQ09ORklHX0dFTkVSSUNfSVJRX01VTFRJX0hB
TkRMRVIKPiA+IC12b2lkICgqaGFuZGxlX2FyY2hfaXJxKShzdHJ1Y3QgcHRfcmVncyAqKSBfX3Jv
X2FmdGVyX2luaXQ7Cj4gPiArdm9pZCAoKl9oYW5kbGVfYXJjaF9pcnEpKHN0cnVjdCBwdF9yZWdz
ICopIF9fcm9fYWZ0ZXJfaW5pdDsKPiA+ICAjZW5kaWYKPiA+Cj4gPiAgLyoqCj4gPiBAQCAtMjcw
LDEwICsyNzEsMTEgQEAgaXJxcmV0dXJuX3QgaGFuZGxlX2lycV9ldmVudChzdHJ1Y3QgaXJxX2Rl
c2MgKmRlc2MpCj4gPiAgI2lmZGVmIENPTkZJR19HRU5FUklDX0lSUV9NVUxUSV9IQU5ETEVSCj4g
PiAgaW50IF9faW5pdCBzZXRfaGFuZGxlX2lycSh2b2lkICgqaGFuZGxlX2lycSkoc3RydWN0IHB0
X3JlZ3MgKikpCj4gPiAgewo+ID4gLSAgICAgICBpZiAoaGFuZGxlX2FyY2hfaXJxKQo+ID4gKyAg
ICAgICBpZiAoX2hhbmRsZV9hcmNoX2lycSkKPiA+ICAgICAgICAgICAgICAgICByZXR1cm4gLUVC
VVNZOwo+ID4KPiA+IC0gICAgICAgaGFuZGxlX2FyY2hfaXJxID0gaGFuZGxlX2lycTsKPiA+ICsg
ICAgICAgX2hhbmRsZV9hcmNoX2lycSA9IGhhbmRsZV9pcnE7Cj4gPiArICAgICAgIHJ1bnRpbWVf
Y29uc3RfaW5pdChwdHIsIF9oYW5kbGVfYXJjaF9pcnEpOwo+ID4gICAgICAgICByZXR1cm4gMDsK
PiA+ICB9Cj4gPgo+ID4gLS0KPiA+IDIuNTEuMAo+ID4KPgo+Cj4gLS0KPiBCZXN0IFJlZ2FyZHMK
PiAgR3VvIFJlbgoKCgotLSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
