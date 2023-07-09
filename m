Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D72FEB64DC
	for <linux-riscv@archiver.kernel.org>; Sun,  9 Jul 2023 03:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j4Y244mjbLgfPjuoc9B7YDathLXeWpXJZO7hz/OxIIo=; b=tqCIOZSmkeIamS
	JEuPVABouqzeAa+JJdiJlBWkMLPXWMk5w1PDiw9njTpw8mcKjeDD7+fkvW+BPKd0dLlWWvYz4IV96
	WaNR2SIpVY9nJiky/4r0SST6sR02RkUYq+4Cwd8Xqm6sG1qf6x41rM2uzqMRfROEe0u7hgJoWJQ+e
	kRE0q/SneahGiGGYEpQ+nq/2GJYQnfPxt2RoeMbTM2ureUM+0ZvPNYE5au44clN2w7Jf2KOsrKqPk
	1GHh7isK4pkU1yl2Pr8IL95P6Dv6/0QnPiicD0JNXOoG4KvJEBEllPECkzm0eYHBR4L2uRW7mYqNF
	7uThxqo8pwDha6qXoowg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIKzf-008EZw-30;
	Sun, 09 Jul 2023 03:21:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIKzc-008EZW-2Z
	for linux-riscv@lists.infradead.org;
	Sun, 09 Jul 2023 03:21:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 00E8460B33
	for <linux-riscv@lists.infradead.org>; Sun,  9 Jul 2023 03:21:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A52EC433CA
	for <linux-riscv@lists.infradead.org>; Sun,  9 Jul 2023 03:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688872907;
	bh=qjR/jXX8MqpG49OA/XDsBKW3/Ev4Mx0DXjVfXhUYrP0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=G5/EZHFCLW6DnFXtWe8L5JvfOQOjCDp9inJfV0O1UCK+lrjQJmroOekBu2OwDB2AR
	 ngefRZlFkJcv6f2DPv27V9HaV5maECdiKTQIYMGUAXYbt41QM6WXWe2sszWtigk/MB
	 P2wcTCW6ZcqdwRj2kFsLpZqtmMjNzXuiPnhZKWUcBDG3wJSiGpgg+VM4yNKzCbl6d8
	 BpyAsxoGseguE7G/ZLU5HyFv7gVGZ0aqR/nA8Ke4XhJQEG+AWppGvUgE3xxw1AtmXq
	 6VWbdArCQqyrrSMgA3I9Ims+DIh0+kDYDDue+YQ3vVKZTnbQoFZgz6LwCRQ+2AHOdd
	 tXunmBtAGgCNg==
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-51bece5d935so4546767a12.1
        for <linux-riscv@lists.infradead.org>; Sat, 08 Jul 2023 20:21:47 -0700 (PDT)
X-Gm-Message-State: ABy/qLY0+8SFPktvMvIz/DKPm2ZMzCly2IJ5h6jMfXDzgIccSlAZ89Kb
	SE1goHOBzelUhucwryj/5X6QKw3puWFCv4d18eY=
X-Google-Smtp-Source: APBJJlFnBjgXu9x9zj/cZEav6mdOxN/o7fPW3o29AXgxj5cdsHLpDNvjsCHqlOlceGcfcwyDdoMa3kVBjlNzAwXbSM8=
X-Received: by 2002:aa7:ccca:0:b0:51e:36b8:34f1 with SMTP id
 y10-20020aa7ccca000000b0051e36b834f1mr5651107edt.34.1688872905508; Sat, 08
 Jul 2023 20:21:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230625155416.18629-1-andy.chiu@sifive.com> <CAJF2gTR8NxRBq011e=JeS30ajDzQPLM5RxmX4Xt3_SOCOZ73ag@mail.gmail.com>
 <CAJF2gTSvM9uBNBn+HGWrNct+q5OAP4cOTuU6zrTV8o8+fZ+6Lw@mail.gmail.com> <CABgGipXLNDO_HN0SSDw4Q2d1UN98uphD2ys_9_n3TSDw0xLboQ@mail.gmail.com>
In-Reply-To: <CABgGipXLNDO_HN0SSDw4Q2d1UN98uphD2ys_9_n3TSDw0xLboQ@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 9 Jul 2023 11:21:33 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQTAcgLyc2eh6abtVb+LYkKNAfR4BTxFt05NJH6Qr8OmQ@mail.gmail.com>
Message-ID: <CAJF2gTQTAcgLyc2eh6abtVb+LYkKNAfR4BTxFt05NJH6Qr8OmQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: vector: only enable interrupts in the first-use trap
To: Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, 
	greentime.hu@sifive.com, guoren@linux.alibaba.com, bjorn@kernel.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor.dooley@microchip.com>, Jisheng Zhang <jszhang@kernel.org>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Xianting Tian <xianting.tian@linux.alibaba.com>, Mattias Nissler <mnissler@rivosinc.com>, 
	Richard Henderson <richard.henderson@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230708_202148_944874_6E7C100B 
X-CRM114-Status: GOOD (  29.54  )
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

T24gV2VkLCBKdWwgNSwgMjAyMyBhdCAxMTozOeKAr0FNIEFuZHkgQ2hpdSA8YW5keS5jaGl1QHNp
Zml2ZS5jb20+IHdyb3RlOgo+Cj4gSGkgR3VvLAo+Cj4gT24gVGh1LCBKdW4gMjksIDIwMjMgYXQg
MjoxMuKAr1BNIEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBBbm90
aGVyIG9uZToKPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC92ZWN0b3IuYyBiL2Fy
Y2gvcmlzY3Yva2VybmVsL3ZlY3Rvci5jCj4gPiBpbmRleCBmOWM4ZTE5YWIzMDEuLjc2NGI3YzA5
ODE2NSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3ZlY3Rvci5jCj4gPiArKysg
Yi9hcmNoL3Jpc2N2L2tlcm5lbC92ZWN0b3IuYwo+ID4gQEAgLTg0LDcgKzg0LDcgQEAgc3RhdGlj
IGludCByaXNjdl92X3RocmVhZF96YWxsb2Modm9pZCkKPiA+ICB7Cj4gPiAgICAgICAgIHZvaWQg
KmRhdGFwOwo+ID4KPiA+ICAgICAgICAgZGF0YXAgPSBremFsbG9jKHJpc2N2X3ZfdnNpemUsIEdG
UF9LRVJORUwpOwo+ID4gICAgICAgICBpZiAoIWRhdGFwKQo+ID4gICAgICAgICAgICAgICAgIHJl
dHVybiAtRU5PTUVNOwo+ID4KPiA+IEBAIC0xNjIsMTAgKzE2Miw5IEBAIGJvb2wgcmlzY3Zfdl9m
aXJzdF91c2VfaGFuZGxlcihzdHJ1Y3QgcHRfcmVncyAqcmVncykKPiA+ICAgICAgICAgICogY29u
dGV4dCB3aGVyZSBWUyBoYXMgYmVlbiBvZmYuIFNvLCB0cnkgdG8gYWxsb2NhdGUgdGhlIHVzZXIn
cyBWCj4gPiAgICAgICAgICAqIGNvbnRleHQgYW5kIHJlc3VtZSBleGVjdXRpb24uCj4gPiAgICAg
ICAgICAqLwo+ID4gLSAgICAgICBpZiAocmlzY3Zfdl90aHJlYWRfemFsbG9jKCkpIHsKPiA+IC0g
ICAgICAgICAgICAgICBmb3JjZV9zaWcoU0lHQlVTKTsKPiA+IC0gICAgICAgICAgICAgICByZXR1
cm4gdHJ1ZTsKPiA+IC0gICAgICAgfQo+ID4gKyAgICAgICBpZiAocmlzY3Zfdl90aHJlYWRfemFs
bG9jKCkpCj4gPiArICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+ID4gKwo+ID4gICAgICAg
ICByaXNjdl92X3ZzdGF0ZV9vbihyZWdzKTsKPiA+ICAgICAgICAgcmV0dXJuIHRydWU7Cj4gPiAg
fQo+ID4gLS0tLS0tLS0KPiA+Cj4gPiBZb3VyIGZvcmNlX3NpZyB0aHJvd3MgdGhlIGRlYnVnIGlu
Zm8gYXdheSwgYW5kIHRoZSBzdGFuZGFyZCBvbmUgaXMKPiA+IGVub3VnaCBmb3IgdXMuCj4KPiBD
b3VsZCB5b3UgaGVscCBtZSB0byB1bmRlcnN0YW5kIG1vcmUgb24gaG93IHRoaXMgdGhyb3dzIGRl
YnVnIGluZm8KPiBhd2F5PyBEbyB5b3UgbWVhbiB0aGUgcHJfaW5mbygpIHByaW50IGluIHRoZSBk
b190cmFwKCkgZnVuY3Rpb24/IElmClllcywgeW91IGNvZGUganVzdCBzZW5kIGEgc2lnLCBidXQg
bm8gZGVidWcgaW5mby4KCj4gd2UnZCB3YW50IHRvIHVzZSB0aGUgc3RhbmRhcmQgb25lIHRoZW4g
d2Ugc2hvdWxkIGluc3RlYWQgcmV0dXJuIGEKPiBzaWduYWwgbnVtYmVyIGluIHJpc2N2X3ZfZmly
c3RfdXNlX2hhbmRsZXIoKS4gQmVjYXVzZSB3ZSB3YW50IHRvIHNlbmQKPiBTSUdCVVMgaW5zdGVh
ZCBvZiBTSUdJTEwuCgpEbyB3ZSByZWFsbHkgbmVlZCBhIFNJR0JVUyBoZXJlPwpXaGVuIHdlIGNh
bid0IGhhbmRsZSB0aGlzIGluc3RydWN0aW9uLCB0cmVhdCBpdCBhcyBhIGludmFsaWQgb25lLgpT
SUdJTEwgIC0gaW52YWxpZCBwcm9ncmFtIGltYWdlLCBzdWNoIGFzIGludmFsaWQgaW5zdHJ1Y3Rp
b24KU0lHQlVTIC0gYWJicmV2aWF0aW9uIGZvciDigJxCdXMgRXJyb3LigJ0uCgoKPgo+ID4KPiA+
IE9uIFRodSwgSnVuIDI5LCAyMDIzIGF0IDI6MDTigK9BTSBHdW8gUmVuIDxndW9yZW5Aa2VybmVs
Lm9yZz4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIFN1biwgSnVuIDI1LCAyMDIzIGF0IDExOjU04oCv
QU0gQW5keSBDaGl1IDxhbmR5LmNoaXVAc2lmaXZlLmNvbT4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4g
PiBUaGUgZnVuY3Rpb24gaXJxZW50cnlfZXhpdF90b191c2VyX21vZGUoKSBtdXN0IGJlIGNhbGxl
ZCB3aXRoIGludGVycnVwdAo+ID4gPiA+IGRpc2FibGVkLiBUaGUgY2FsbGVyIG9mIGRvX3RyYXBf
aW5zbl9pbGxlZ2FsKCkgYWxzbyBhc3N1bWVzIHJ1bm5pbmcKPiA+ID4gPiB3aXRob3V0IGludGVy
cnVwdHMuIFNvLCB3ZSBzaG91bGQgdHVybiBvZmYgaW50ZXJydXB0cyBhZnRlcgo+ID4gPiA+IHJp
c2N2X3ZfZmlyc3RfdXNlX2hhbmRsZXIoKSByZXR1cm5zLgo+ID4gPiA+Cj4gPiA+ID4gRml4ZXM6
IGNkMDU0ODM3MjQzYiAoInJpc2N2OiBBbGxvY2F0ZSB1c2VyJ3MgdmVjdG9yIGNvbnRleHQgaW4g
dGhlIGZpcnN0LXVzZSB0cmFwIikKPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBbmR5IENoaXUgPGFu
ZHkuY2hpdUBzaWZpdmUuY29tPgo+ID4gPiA+IC0tLQo+ID4gPiA+ICBhcmNoL3Jpc2N2L2tlcm5l
bC90cmFwcy5jIHwgOCArKysrKysrLQo+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPiA+ID4KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9rZXJuZWwvdHJhcHMuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKPiA+ID4gPiBp
bmRleCAwNWZmZGNkMTQyNGUuLjE1OTVlMjQ2YmRhMSAxMDA2NDQKPiA+ID4gPiAtLS0gYS9hcmNo
L3Jpc2N2L2tlcm5lbC90cmFwcy5jCj4gPiA+ID4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJh
cHMuYwo+ID4gPiA+IEBAIC0xNDksMTIgKzE0OSwxOCBAQCBET19FUlJPUl9JTkZPKGRvX3RyYXBf
aW5zbl9mYXVsdCwKPiA+ID4gPgo+ID4gPiA+ICBhc21saW5rYWdlIF9fdmlzaWJsZSBfX3RyYXBf
c2VjdGlvbiB2b2lkIGRvX3RyYXBfaW5zbl9pbGxlZ2FsKHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+
ID4gPiA+ICB7Cj4gPiA+ID4gKyAgICAgICBib29sIGhhbmRsZWQ7Cj4gPiA+ID4gKwo+ID4gPiA+
ICAgICAgICAgaWYgKHVzZXJfbW9kZShyZWdzKSkgewo+ID4gPiA+ICAgICAgICAgICAgICAgICBp
cnFlbnRyeV9lbnRlcl9mcm9tX3VzZXJfbW9kZShyZWdzKTsKPiA+ID4gPgo+ID4gPiA+ICAgICAg
ICAgICAgICAgICBsb2NhbF9pcnFfZW5hYmxlKCk7Cj4gPiA+ID4KPiA+ID4gPiAtICAgICAgICAg
ICAgICAgaWYgKCFyaXNjdl92X2ZpcnN0X3VzZV9oYW5kbGVyKHJlZ3MpKQo+ID4gPiA+ICsgICAg
ICAgICAgICAgICBoYW5kbGVkID0gcmlzY3Zfdl9maXJzdF91c2VfaGFuZGxlcihyZWdzKTsKPiA+
ID4gSG93IGFib3V0IG1ha2luZyByaXNjdl92X2ZpcnN0X3VzZV9oYW5kbGVyIGlycV9kaXNhYmxl
IHNhZmU/Cj4gPiA+IC0tLS0tLS0tCj4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5l
bC90cmFwcy5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYwo+ID4gPiBpbmRleCA1MTU4OTYx
ZWE5NzcuLjU0NTI5NTA0NTcwNSAxMDA2NDQKPiA+ID4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwv
dHJhcHMuYwo+ID4gPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCj4gPiA+IEBAIC0x
NTMsOCArMTUzLDYgQEAgYXNtbGlua2FnZSBfX3Zpc2libGUgX190cmFwX3NlY3Rpb24gdm9pZAo+
ID4gPiBkb190cmFwX2luc25faWxsZWdhbChzdHJ1Y3QgcHRfcmVncyAqcmUKPiA+ID4gICAgICAg
ICBpZiAodXNlcl9tb2RlKHJlZ3MpKSB7Cj4gPiA+ICAgICAgICAgICAgICAgICBpcnFlbnRyeV9l
bnRlcl9mcm9tX3VzZXJfbW9kZShyZWdzKTsKPiA+ID4KPiA+ID4gLSAgICAgICAgICAgICAgIGxv
Y2FsX2lycV9lbmFibGUoKTsKPiA+ID4gLQo+ID4gPiAgICAgICAgICAgICAgICAgaWYgKCFyaXNj
dl92X2ZpcnN0X3VzZV9oYW5kbGVyKHJlZ3MpKQo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICBkb190cmFwX2Vycm9yKHJlZ3MsIFNJR0lMTCwgSUxMX0lMTE9QQywgcmVncy0+ZXBjLAo+ID4g
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJPb3BzIC0gaWxsZWdhbCBp
bnN0cnVjdGlvbiIpOwo+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdmVjdG9y
LmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC92ZWN0b3IuYwo+ID4gPiBpbmRleCBmOWM4ZTE5YWIzMDEu
Ljc2MTZjMDI3ZWU2NCAxMDA2NDQKPiA+ID4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvdmVjdG9y
LmMKPiA+ID4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvdmVjdG9yLmMKPiA+ID4gQEAgLTg0LDcg
Kzg0LDcgQEAgc3RhdGljIGludCByaXNjdl92X3RocmVhZF96YWxsb2Modm9pZCkKPiA+ID4gIHsK
PiA+ID4gICAgICAgICB2b2lkICpkYXRhcDsKPiA+ID4KPiA+ID4gLSAgICAgICBkYXRhcCA9IGt6
YWxsb2MocmlzY3Zfdl92c2l6ZSwgR0ZQX0tFUk5FTCk7Cj4gPiA+ICsgICAgICAgZGF0YXAgPSBr
emFsbG9jKHJpc2N2X3ZfdnNpemUsIEdGUF9LRVJORUwgfCBHRlBfQVRPTUlDKTsKPiA+ID4gICAg
ICAgICBpZiAoIWRhdGFwKQo+ID4gPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07Cj4g
PiA+IC0tLS0tLS0tLQo+ID4gPgo+ID4gPiA+ICsKPiA+ID4gPiArICAgICAgICAgICAgICAgbG9j
YWxfaXJxX2Rpc2FibGUoKTsKPiA+ID4gPiArCj4gPiA+ID4gKyAgICAgICAgICAgICAgIGlmICgh
aGFuZGxlZCkKPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICBkb190cmFwX2Vycm9yKHJl
Z3MsIFNJR0lMTCwgSUxMX0lMTE9QQywgcmVncy0+ZXBjLAo+ID4gPiA+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIk9vcHMgLSBpbGxlZ2FsIGluc3RydWN0aW9uIik7Cj4g
PiA+ID4KPiA+ID4gPiAtLQo+ID4gPiA+IDIuMTcuMQo+ID4gPiA+Cj4gPiA+Cj4gPiA+Cj4gPiA+
IC0tCj4gPiA+IEJlc3QgUmVnYXJkcwo+ID4gPiAgR3VvIFJlbgo+ID4KPiA+Cj4gPgo+ID4gLS0K
PiA+IEJlc3QgUmVnYXJkcwo+ID4gIEd1byBSZW4KPgo+IFRoYW5rcywKPiBBbmR5CgoKCi0tCkJl
c3QgUmVnYXJkcwogR3VvIFJlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
