Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 451ABC71153
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Aug 2023 06:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RIICPG3IhI7EMLDKBKt4thTK/6BnRqF3EUk07Xb7oZs=; b=AQTz6bF6zDULA3
	W+v/DTeSRiFjGYpESQO7rlPu+b5YIZ+GCYWEkmRgqYd1ZTwkt31pvbkFMMjGEunKXzht8IMbeDzpP
	XntghWF24QOY+I5bLIMb5p8HShd2tkjXxS9fHGl4SSGQ0tAh9reGNJtHsnfCdr7Zw5wusuYTasj/d
	pe27s7vz+8Pn61m751nvp3z32bSOFaHf1scT7meRMAfERtangNG4i12F9r+g/IarkTA6NpO7LCdK8
	HJf3MPinhJc4htuB+HcO2MWpB8H2lvzDDYp7TUnmibFA1rRbq3H6m0E85LI4f/sfNkTlUzDEvntFa
	++ULn8guGJnuQ4TQAaNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qas0J-00Ar6w-1h;
	Tue, 29 Aug 2023 06:15:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qas0G-00Ar6b-11
	for linux-riscv@lists.infradead.org;
	Tue, 29 Aug 2023 06:15:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 95E1C6136C;
	Tue, 29 Aug 2023 06:15:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EAA0C433C7;
	Tue, 29 Aug 2023 06:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693289703;
	bh=gIxemUSIKJzGZWcSfXn7/bdFzIZY6pI3I0pN2YzbB4c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=h+rqRw1+EoGuYV+vv4Cvq+nEP4PHWResOIPyy6NOkbKuhMjXuZUSFdpEqpbmbWPKR
	 ohie393l7Jzb46trWZELJ/TJ72tGDWBbNLqd8Ul81l3aNfqx9B2WB9SEXlAb1n+LD7
	 bcIqK5eyyxfOJTRwvCV5nKFOZp9C9X9NUIdRrZK51AwC1FHt7K9cZz4MhoFqvdPNQZ
	 wURwfQJJqhI/DF0CA7IzokgJ0lcpmtZYsaznrmZK6oUqJ0scnDUltOfIkkcXSURdUb
	 SA5WtnBarA4NNgdRasn++zv2UoCZCV/fzOXg5pL8YCeZ+h2S7UJxcQTwlj38Z+bJWd
	 /ybS8ZTI22wiQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Nam Cao <namcaov@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 guoren@kernel.org
Subject: Re: [PATCH] riscv: provide riscv-specific is_trap_insn()
In-Reply-To: <ZOymDqhE9STgx4Mm@nam-dell>
References: <20230827205641.46836-1-namcaov@gmail.com>
 <874jkjl4e1.fsf@all.your.base.are.belong.to.us>
 <ZOyhozSq3S36eRSq@nam-dell> <ZOymDqhE9STgx4Mm@nam-dell>
Date: Tue, 29 Aug 2023 08:14:59 +0200
Message-ID: <87edjmz864.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_231504_424040_FAF6848A 
X-CRM114-Status: GOOD (  23.89  )
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

TmFtIENhbyA8bmFtY2FvdkBnbWFpbC5jb20+IHdyaXRlczoKCj4gT24gTW9uLCBBdWcgMjgsIDIw
MjMgYXQgMDM6MzE6MTVQTSArMDIwMCwgTmFtIENhbyB3cm90ZToKPj4gT24gTW9uLCBBdWcgMjgs
IDIwMjMgYXQgMDI6NDg6MDZQTSArMDIwMCwgQmrDtnJuIFTDtnBlbCB3cm90ZToKPj4gPiBOYW0g
Q2FvIDxuYW1jYW92QGdtYWlsLmNvbT4gd3JpdGVzOgo+PiA+IAo+PiA+ID4gdXByb2JlcyBleHBl
Y3RzIGlzX3RyYXBfaW5zbigpIHRvIHJldHVybiB0cnVlIGZvciBhbnkgdHJhcCBpbnN0cnVjdGlv
bnMsCj4+ID4gPiBub3QganVzdCB0aGUgb25lIHVzZWQgZm9yIGluc3RhbGxpbmcgdXByb2JlLiBU
aGUgY3VycmVudCBkZWZhdWx0Cj4+ID4gPiBpbXBsZW1lbnRhdGlvbiBvbmx5IHJldHVybnMgdHJ1
ZSBmb3IgMTYtYml0IGMuZWJyZWFrIGlmIEMgZXh0ZW5zaW9uIGlzCj4+ID4gPiBlbmFibGVkLiBU
aGlzIGNhbiBjb25mdXNlIHVwcm9iZXMgaWYgYSAzMi1iaXQgZWJyZWFrIGdlbmVyYXRlcyBhIHRy
YXAKPj4gPiA+IGV4Y2VwdGlvbiBmcm9tIHVzZXJzcGFjZTogdXByb2JlcyBhc2tzIGlzX3RyYXBf
aW5zbigpIHdobyBzYXlzIHRoZXJlIGlzIG5vCj4+ID4gPiB0cmFwLCBzbyB1cHJvYmVzIGFzc3Vt
ZSBhIHByb2JlIHdhcyB0aGVyZSBiZWZvcmUgYnV0IGhhcyBiZWVuIHJlbW92ZWQsIGFuZAo+PiA+
ID4gcmV0dXJuIHRvIHRoZSB0cmFwIGluc3RydWN0aW9uLiBUaGlzIGNhdXNlIGFuIGluZmluaXRl
IGxvb3Agb2YgZW50ZXJpbmcKPj4gPiA+IGFuZCBleGl0aW5nIHRyYXAgaGFuZGxlci4KPj4gPiA+
Cj4+ID4gPiBJbnN0ZWFkIG9mIHVzaW5nIHRoZSBkZWZhdWx0IGltcGxlbWVudGF0aW9uLCBpbXBs
ZW1lbnQgdGhpcyBmdW5jdGlvbgo+PiA+ID4gc3BlZmljaWFsbHkgZm9yIHJpc2N2IHdoaWNoIGNo
ZWNrcyBmb3IgYm90aCBlYnJlYWsgYW5kIGMuZWJyZWFrLgo+PiA+IAo+PiA+IEkgdG9vayB0aGlz
IGZvciBhIHNwaW4sIGFuZCBpdCBpbmRlZWQgZml4ZXMgdGhpcyBuZXcgaGFuZyEgTmljZSEKPj4g
Cj4+IEdyZWF0ISBUaGFua3MgZm9yIHRlc3RpbmcgaXQuCj4+ICAKPj4gPiBIb3dldmVyLCB3aGVu
IEkgdHJpZWQgc2V0dGluZyBhbiB1cHJvYmUgb24gdGhlIGVicmVhayBpbnN0cnVjdGlvbgo+PiA+
IChvZmZzZXQgMHgxMTgpIGZyb20geW91ciBleGFtcGxlIFsxXSwgdGhlIHByb2JlIGRvZXMgbm90
IHNob3cgdXAgaW4gdGhlCj4+ID4gdHJhY2UgYnVmZmVyLgo+PiA+IAo+PiA+IEFueSBpZGVhcz8K
Pj4gCj4+ID5Gcm9tIG15IHVuZGVyc3RhbmRpbmcsIGJvdGggdXByb2JlcyBhbmQga3Byb2JlcyBy
ZWZ1c2UgdG8gaW5zdGFsbCBicmVhayBwb2ludHMKPj4gaW50byBleGlzdGluZyB0cmFwIGluc3Ry
dWN0aW9ucy4gT3RoZXJ3aXNlLCB3ZSBtYXkgY29uZmxpY3Qgd2l0aCBzb21ldGhpbmcgZWxzZQo+
PiB0aGF0IGlzIGFsc28gdXNpbmcgdHJhcCBpbnN0cnVjdGlvbnMuCj4KPiBJIGp1c3QgcmVhbGl6
ZSB5b3UgcHJvYmFibHkgYXNrIHRoaXMgYmVjYXVzZSB1cHJvYmUgY2FuIHN0aWxsIGJlIGluc3Rh
bGxlZCBiZWZvcmUKPiBhcHBseWluZyB0aGUgcGF0Y2guIEJ1dCBJIHRoaW5rIHRoYXQgaXMgYW5v
dGhlciBidWcgdGhhdCBteSBwYXRjaCBhbHNvCj4gYWNjaWRlbnRhbGx5IGZpeDogdXByb2JlcyBz
aG91bGQgbm90IGluc3RhbGwgYnJlYWtwb2ludCBpbnRvIGVicmVhayBpbnN0cnVjdGlvbnMsCj4g
YnV0IGl0IGluY29ycmVjdGx5IGRvZXMgc28gYmVjYXVzZSBpdCBkb2VzIG5vdCBldmVuIGtub3cg
YWJvdXQgdGhlIGV4aXN0ZW5jZSBvZgo+IDMyLWJpdCBlYnJlYWsuCgpGV0lXLCBJIGNhbiBzdGls
bCBpbnN0YWxsIHRoZSB1cHJvYmUgYXQgYW4gZWJyZWFrIHdpdGggeW91IHBhdGNoLiBJdCdzCm5v
dCBoaXQsIGJ1dCBzdWNjZWVkcyB0byBpbnN0YWxsLgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
