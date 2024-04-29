Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A717C04FFE
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Apr 2024 14:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Cp/eat7l+wL85DoUyaHBgtiL+027EW9c8jv7hJvfg0=; b=QC/GTP0uUbNhY8
	3YEdXZBed87p/N7rt6QrcL7/iLrHAOBi2rDRRyhENyNyB/Y4EhHjAMiu5EZOWYB5tUo3mwR4a66zu
	/bgzex4q98ifx1hA5JVxdSdwbwv/Megn2+chQtdgHqLwgSBSTBn8Hr/trkCfLUbFUdvu3gaiDF9zk
	jy5TlnQwTgGz4wbaIOPXM9UXKRfTE6wB1B0baVw3djwWQAajlD9Y0TBmFPL7TOMksqqInrrPRFVrv
	w333+XfMPqvDGoMR8OID3QLIDRQ3kylwD6RogIAozs2rCk0VVY2FcSohEoTOMabBwpjICGznwDHnh
	RXaSE6PrhK2Hy8VJ+Ulw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1RuE-000000036pp-1MbO;
	Mon, 29 Apr 2024 14:22:58 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1RuA-000000036pL-2ZQR
	for linux-riscv@lists.infradead.org;
	Mon, 29 Apr 2024 14:22:56 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2def8e58471so69878851fa.0
        for <linux-riscv@lists.infradead.org>; Mon, 29 Apr 2024 07:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714400571; x=1715005371; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q5QVpxga4N6/hqXrH0MOQKoldXcmMmAuvc1GZMoLFtI=;
        b=Jh4ovklNSFTH1ROSmG1r/8QSnT+q4/0I2pm1umFWi8i4yJ41/3+3guAYRneq8QR/2I
         CWNAOddYfX0V7gT68723DVCqEhC2wmUjkjQl5Dh41QXBatHYGptwtGUmWuBfbqcVw3lU
         uiCtktQl80Hx609evsiyALuc+QE9yYd7VsbhFgkOF3/mIiW7fI0yyAT5Cz+YVwTuhkBP
         UiY1HJ0ZD1Y4XR5Octth94njanJlN+mY2n1vd9UJ1zHzMikcaH5hZOdkGI8sgTEUSeYg
         iuL4HlxvrLbTgG2ezfves0Be3WULsJR/x4lJdTEIh+/UNop0OJa1Zf+/N976VbrLRQYy
         UYJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714400571; x=1715005371;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q5QVpxga4N6/hqXrH0MOQKoldXcmMmAuvc1GZMoLFtI=;
        b=lBacL+5fDMA5kdhR5L074Efq1k/u9aJNdisR7rPU650Z4sCk28jRzOG9EnBY79167C
         GXzCfkILG/MkGlseulJX0LuYBwCnU3OAwaAK1FceOsc7Aqb7WkFUpVbHJq4COZf1NWcY
         sLiL2d/nkFRzy8uNBKY+ZQljNrDRZ7fr4qOeKptEX7C7DJbRKd9khXr/WDob/doGo2Ok
         3pkfj7lXPcwdRbU1Wvt7IzWTVtRnQuH1yfR23x1ib7VZGVcrPv4JIk+XI8ool8AwA5EW
         hj174l8y0R5p7jDMubfYoLShH3e5P2VL+2CStr71d+CJsgbScMX/jAG6M0DtD5FWUhmo
         QHJw==
X-Forwarded-Encrypted: i=1; AJvYcCUJN+oOth8P88v5Do3awnJJnEJouZabzkev1DMGojWWerIeMCnpXVEpQN5FDZLLWoT7slA9ZVvqvD+aym7/9AIfYgakVgU+SFbxih9dFsI8
X-Gm-Message-State: AOJu0Yw/bIqzG+LYC7K2E0KSIbn8+gZC6BMBI9mDXkE8bSbM4PmFOmPp
	RAbkhABZW/ywBq/q9qOF9yBYwgNbUe7QRapntVjxFekySJ07HRhcc/29JJCJhU6qy9/i1uMRqww
	0BfLZJoySk56jeJQXmePEEimUwt8=
X-Google-Smtp-Source: AGHT+IFRoXV25WEa7TOCZ5iwFJ1etTgBdopt5lNjuPebhcmXiNyyBP2Ud9FNF6vLlGt/MZCZGxSbztYIte5P6b5QEfY=
X-Received: by 2002:a2e:88d2:0:b0:2d8:8633:ff70 with SMTP id
 a18-20020a2e88d2000000b002d88633ff70mr8656115ljk.30.1714400571081; Mon, 29
 Apr 2024 07:22:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240318020916.1299190-1-haibo1.xu@intel.com> <7d69fac0-4cd1-4db6-b19f-fb5a418549ab@rivosinc.com>
In-Reply-To: <7d69fac0-4cd1-4db6-b19f-fb5a418549ab@rivosinc.com>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Mon, 29 Apr 2024 22:22:39 +0800
Message-ID: <CAJve8omCXANwhQuvFnhzw_=Fx0fh1pHq+7UYMWS507-2cHVx9A@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: dmi: Add SMBIOS/DMI support
To: Atish Patra <atishp@rivosinc.com>
Cc: Haibo Xu <haibo1.xu@intel.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-efi@vger.kernel.org, 
	aou@eecs.berkeley.edu, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	ardb@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_072254_681735_41A2D096 
X-CRM114-Status: GOOD (  30.81  )
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

SGkgQFBhbG1lciwKCkNvdWxkIHlvdSBwbGVhc2UgbGV0IG1lIGtub3cgd2hldGhlciB0aGlzIHBh
dGNoIHdhcyBPSyBmb3IgdGhlIG5leHQgUklTQy1WIFBVTEw/CgpUaGFua3MsCkhhaWJvCgpPbiBX
ZWQsIE1hciAyMCwgMjAyNCBhdCAzOjQ24oCvQU0gQXRpc2ggUGF0cmEgPGF0aXNocEByaXZvc2lu
Yy5jb20+IHdyb3RlOgo+Cj4gT24gMy8xNy8yNCAxOTowOSwgSGFpYm8gWHUgd3JvdGU6Cj4gPiBF
bmFibGUgdGhlIGRtaSBkcml2ZXIgZm9yIHJpc2N2IHdoaWNoIHdvdWxkIGFsbG93IGFjY2VzcyB0
aGUKPiA+IFNNQklPUyBpbmZvIHRocm91Z2ggc29tZSB1c2Vyc3BhY2UgZmlsZSgvc3lzL2Zpcm13
YXJlL2RtaS8qKS4KPiA+Cj4gPiBUaGUgY2hhbmdlIHdhcyBiYXNlZCBvbiB0aGF0IG9mIGFybTY0
IGFuZCBoYXMgYmVlbiB2ZXJpZmllZAo+ID4gYnkgZG1pZGVjb2RlIHRvb2wuCj4gPgo+ID4gU2ln
bmVkLW9mZi1ieTogSGFpYm8gWHUgPGhhaWJvMS54dUBpbnRlbC5jb20+Cj4gPiAtLS0KPiA+IENo
YW5nZXMgc2luY2UgdjEKPiA+ICAgIC0gQ2hhbmdlIHRvIHVzZSBtZW1yZW1hcC9tZW11bm1hcCBm
b3IgZG1pXyhlYXJseSlfcmVtYXAvdW5tYXAKPiA+ICAgICAgZGVmaW5pdGlvbihzdWdnZXN0ZWQg
YnkgQXJkKQo+ID4gICAgLSBNaW5vciBjbGVhbiB1cCBmb3IgY29tbWVudHMgKEFyZCkKPiA+IC0t
LQo+ID4gICBhcmNoL3Jpc2N2L0tjb25maWcgICAgICAgICAgICAgICAgICAgfCAxMSArKysrKysr
KysrKwo+ID4gICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2RtaS5oICAgICAgICAgfCAyNCArKysr
KysrKysrKysrKysrKysrKysrKysKPiA+ICAgZHJpdmVycy9maXJtd2FyZS9lZmkvcmlzY3YtcnVu
dGltZS5jIHwgMTMgKysrKysrKysrKysrKwo+ID4gICAzIGZpbGVzIGNoYW5nZWQsIDQ4IGluc2Vy
dGlvbnMoKykKPiA+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20v
ZG1pLmgKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9LY29uZmlnIGIvYXJjaC9yaXNj
di9LY29uZmlnCj4gPiBpbmRleCA4ZWJhZmUzMzdlYWMuLjM2MzkxNTFjYjRlZiAxMDA2NDQKPiA+
IC0tLSBhL2FyY2gvcmlzY3YvS2NvbmZpZwo+ID4gKysrIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4g
PiBAQCAtOTUyLDYgKzk1MiwxNyBAQCBjb25maWcgRUZJCj4gPiAgICAgICAgIGFsbG93IHRoZSBr
ZXJuZWwgdG8gYmUgYm9vdGVkIGFzIGFuIEVGSSBhcHBsaWNhdGlvbi4gVGhpcwo+ID4gICAgICAg
ICBpcyBvbmx5IHVzZWZ1bCBvbiBzeXN0ZW1zIHRoYXQgaGF2ZSBVRUZJIGZpcm13YXJlLgo+ID4K
PiA+ICtjb25maWcgRE1JCj4gPiArICAgICBib29sICJFbmFibGUgc3VwcG9ydCBmb3IgU01CSU9T
IChETUkpIHRhYmxlcyIKPiA+ICsgICAgIGRlcGVuZHMgb24gRUZJCj4gPiArICAgICBkZWZhdWx0
IHkKPiA+ICsgICAgIGhlbHAKPiA+ICsgICAgICAgVGhpcyBlbmFibGVzIFNNQklPUy9ETUkgZmVh
dHVyZSBmb3Igc3lzdGVtcy4KPiA+ICsKPiA+ICsgICAgICAgVGhpcyBvcHRpb24gaXMgb25seSB1
c2VmdWwgb24gc3lzdGVtcyB0aGF0IGhhdmUgVUVGSSBmaXJtd2FyZS4KPiA+ICsgICAgICAgSG93
ZXZlciwgZXZlbiB3aXRoIHRoaXMgb3B0aW9uLCB0aGUgcmVzdWx0YW50IGtlcm5lbCBzaG91bGQK
PiA+ICsgICAgICAgY29udGludWUgdG8gYm9vdCBvbiBleGlzdGluZyBub24tVUVGSSBwbGF0Zm9y
bXMuCj4gPiArCj4gPiAgIGNvbmZpZyBDQ19IQVZFX1NUQUNLUFJPVEVDVE9SX1RMUwo+ID4gICAg
ICAgZGVmX2Jvb2wgJChjYy1vcHRpb24sLW1zdGFjay1wcm90ZWN0b3ItZ3VhcmQ9dGxzIC1tc3Rh
Y2stcHJvdGVjdG9yLWd1YXJkLXJlZz10cCAtbXN0YWNrLXByb3RlY3Rvci1ndWFyZC1vZmZzZXQ9
MCkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9kbWkuaCBiL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vZG1pLmgKPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBp
bmRleCAwMDAwMDAwMDAwMDAuLmNhN2NjZTU1N2VmNwo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysr
IGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9kbWkuaAo+ID4gQEAgLTAsMCArMSwyNCBAQAo+ID4g
Ky8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wICovCj4gPiArLyoKPiA+ICsgKiBD
b3B5cmlnaHQgKEMpIDIwMjQgSW50ZWwgQ29ycG9yYXRpb24KPiA+ICsgKgo+ID4gKyAqIGJhc2Vk
IG9uIGFyY2gvYXJtNjQvaW5jbHVkZS9hc20vZG1pLmgKPiA+ICsgKgo+ID4gKyAqIFRoaXMgZmls
ZSBpcyBzdWJqZWN0IHRvIHRoZSB0ZXJtcyBhbmQgY29uZGl0aW9ucyBvZiB0aGUgR05VIEdlbmVy
YWwgUHVibGljCj4gPiArICogTGljZW5zZS4gIFNlZSB0aGUgZmlsZSAiQ09QWUlORyIgaW4gdGhl
IG1haW4gZGlyZWN0b3J5IG9mIHRoaXMgYXJjaGl2ZQo+ID4gKyAqIGZvciBtb3JlIGRldGFpbHMu
Cj4gPiArICovCj4gPiArCj4gPiArI2lmbmRlZiBfX0FTTV9ETUlfSAo+ID4gKyNkZWZpbmUgX19B
U01fRE1JX0gKPiA+ICsKPiA+ICsjaW5jbHVkZSA8bGludXgvaW8uaD4KPiA+ICsjaW5jbHVkZSA8
bGludXgvc2xhYi5oPgo+ID4gKwo+ID4gKyNkZWZpbmUgZG1pX2Vhcmx5X3JlbWFwKHgsIGwpICAg
ICAgICAgICAgICAgIG1lbXJlbWFwKHgsIGwsIE1FTVJFTUFQX1dCKQo+ID4gKyNkZWZpbmUgZG1p
X2Vhcmx5X3VubWFwKHgsIGwpICAgICAgICAgICAgICAgIG1lbXVubWFwKHgpCj4gPiArI2RlZmlu
ZSBkbWlfcmVtYXAoeCwgbCkgICAgICAgICAgICAgICAgICAgICAgbWVtcmVtYXAoeCwgbCwgTUVN
UkVNQVBfV0IpCj4gPiArI2RlZmluZSBkbWlfdW5tYXAoeCkgICAgICAgICAgICAgICAgIG1lbXVu
bWFwKHgpCj4gPiArI2RlZmluZSBkbWlfYWxsb2MobCkgICAgICAgICAgICAgICAgIGt6YWxsb2Mo
bCwgR0ZQX0tFUk5FTCkKPiA+ICsKPiA+ICsjZW5kaWYKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2Zpcm13YXJlL2VmaS9yaXNjdi1ydW50aW1lLmMgYi9kcml2ZXJzL2Zpcm13YXJlL2VmaS9yaXNj
di1ydW50aW1lLmMKPiA+IGluZGV4IDA5NTI1ZmI1YzI0MC4uYzNiZmI5ZTc3ZTAyIDEwMDY0NAo+
ID4gLS0tIGEvZHJpdmVycy9maXJtd2FyZS9lZmkvcmlzY3YtcnVudGltZS5jCj4gPiArKysgYi9k
cml2ZXJzL2Zpcm13YXJlL2VmaS9yaXNjdi1ydW50aW1lLmMKPiA+IEBAIC0xNTIsMyArMTUyLDE2
IEBAIHZvaWQgYXJjaF9lZmlfY2FsbF92aXJ0X3RlYXJkb3duKHZvaWQpCj4gPiAgIHsKPiA+ICAg
ICAgIGVmaV92aXJ0bWFwX3VubG9hZCgpOwo+ID4gICB9Cj4gPiArCj4gPiArc3RhdGljIGludCBf
X2luaXQgcmlzY3ZfZG1pX2luaXQodm9pZCkKPiA+ICt7Cj4gPiArICAgICAvKgo+ID4gKyAgICAg
ICogT24gcmlzY3YsIERNSSBkZXBlbmRzIG9uIFVFRkksIGFuZCBkbWlfc2V0dXAoKSBuZWVkcyB0
bwo+ID4gKyAgICAgICogYmUgY2FsbGVkIGVhcmx5IGJlY2F1c2UgZG1pX2lkX2luaXQoKSwgd2hp
Y2ggaXMgYW4gYXJjaF9pbml0Y2FsbAo+ID4gKyAgICAgICogaXRzZWxmLCBkZXBlbmRzIG9uIGRt
aV9zY2FuX21hY2hpbmUoKSBoYXZpbmcgYmVlbiBjYWxsZWQgYWxyZWFkeS4KPiA+ICsgICAgICAq
Lwo+ID4gKyAgICAgZG1pX3NldHVwKCk7Cj4gPiArCj4gPiArICAgICByZXR1cm4gMDsKPiA+ICt9
Cj4gPiArY29yZV9pbml0Y2FsbChyaXNjdl9kbWlfaW5pdCk7Cj4KPiBSZXZpZXdlZC1ieTogQXRp
c2ggUGF0cmEgPGF0aXNocEByaXZvc2luYy5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
