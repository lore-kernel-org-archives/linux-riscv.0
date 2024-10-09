Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A20B6CEE349
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Oct 2024 20:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Vev8elCo1M9hrCmZb6c+v0rl37K9qk1vKjrRC2uJrk=; b=Fn5GUZYsUEcSTu
	8ChlzvPqTuByj/WKl20ZCqiAWHQqs1IQk9huSr80tZ5oSmhJzs6LY83IpWmuZsyLHY7bCBPr9Mrau
	Vqa6mTzFiQae9fYW4Zf9PFZdOENdK6q6KJ/XuWJeQMqpMvdwsr50eIiqrWt0XpCq84Krdq5Gp7bht
	R3ZCcj8Wo+Dq77h6uCc/kjoXb+gTKqmuQkj22uw09duxZZQtB+yBI0hhOrCPKaYY1/FasQXj28VOm
	jiU8t1EdBGTbZGCW7GjMzNZ6ZiGi6ZdzkOBaE767JlHs9ztHLWCmCCf7RRKWRzWwgseIKTQhhqx07
	EZV2D5mZa5jYXyD3Kpnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sydTu-0000000Aec9-1gRf;
	Wed, 09 Oct 2024 20:40:26 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sydSY-0000000AeRR-0kip
	for linux-riscv@lists.infradead.org;
	Wed, 09 Oct 2024 20:39:03 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-42f6995dab8so67635e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 09 Oct 2024 13:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728506339; x=1729111139; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=24Xd853aY+jZmDOmHNFCjh+uRbzjFYJ47FGiLvmCXR8=;
        b=gxZTUVLuPC/BaBZLzFrQr1vNzTrEvwKJMebMw71IxUS7zokymaRCka3k4nNcAWcxTf
         8HtCbqad+v5uEw9kkrJu4DZS5YlitKjzB1ufR1e2qV4UdpQR3IINBurX+74rTB3PbtxN
         F8Y1emI1haLCdOx/6gxm7zK9NVyOq/v4L/kQovxAA8rbL5VNGp8KJReR8uf5sn97ggpe
         ReE8MStwvdZ3rWg+CUJewlw/zf/mkyyT84HVnYSeeyHbTS5dW/DObxbqnLIZsMtzGp4Q
         ilearAmsCkSoL9Ls/FC+eIy7fkinXSLK1hG6BXQh4u/HqW6GdkfTJHdXXP2oHQ9CCApt
         ROUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728506339; x=1729111139;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=24Xd853aY+jZmDOmHNFCjh+uRbzjFYJ47FGiLvmCXR8=;
        b=DafjsLjRoWVdCe2fR06+F7t6lxu8k5iGwmyJgcWjN9AtwqUseaY+yj+tWmkSw/dybO
         W4EZ6Y/5p6Z9kTFWFdQkgT0YkUz0NHnwY3GjYowT/qGXjGcGJoszjMTyHNIGucJdDNrS
         UJ33xCSz2xAszUcaYIs+hY7smYnqvylOmsOXhP4ZG4Dmp9Gdlxh3T3MGhlTEE9DOOpf1
         OwjfX1GSE4R1gHKVkn6Yg+C4wvOvGhlhvdHZUkp75F2meUJh9CMXNFtx/K/TbfuXprSh
         ts9HoBxcAJcweZYeKJ16LV5tCmDVoOE1PCHS2MlEAcUGafZMf3bE0/UmAJtsEm50reg2
         RNRA==
X-Forwarded-Encrypted: i=1; AJvYcCVuC3Z3BK5fAwYAgFqPkhdRKDNg+7/l1mWslgk1FUK7YRnPUe8tx7VnteeIZDUiunmifTS27Kf7IhcMlg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzDwFRi59AA8BNqfjrdosZ61qea5LEijzEOTqaO6qLrmEUSLryf
	du+Rvf2t8GXXe9Yw/oHpoPVCBrd6CAywjuovhRNt9roeXpG0JI3kr9B85y0prpQo8XOivyM5TrA
	eW1SKvWIQ5Su8e5ZRoKLtQsafg8+evXVly3Jh
X-Google-Smtp-Source: AGHT+IFiRd5NPa6dhEU9INiaG4WU73asf6yDY1jtn0ePw13BGT5/hDMDuiIJqIgot6nffuJ3u+aDVN478IHVTZPKgBg=
X-Received: by 2002:a05:600c:4e56:b0:428:e6eb:1340 with SMTP id
 5b1f17b1804b1-431161a075bmr994475e9.4.1728506339017; Wed, 09 Oct 2024
 13:38:59 -0700 (PDT)
MIME-Version: 1.0
References: <20241008-cfi-patchable-all-v1-1-512481fd731d@google.com>
 <ZwbAvEnrzu6UUgGl@J2N7QTR9R3> <CAH5fLgipBfd5pNKqniXqFudruyGaJG=LDc5MEf3Yxq1yRMmQcw@mail.gmail.com>
In-Reply-To: <CAH5fLgipBfd5pNKqniXqFudruyGaJG=LDc5MEf3Yxq1yRMmQcw@mail.gmail.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Wed, 9 Oct 2024 13:38:47 -0700
Message-ID: <CAGSQo03eez8pFOu54a5tW=VcL+e5VW1OVyceoh5kqQ_JBAK9Pw@mail.gmail.com>
Subject: Re: [PATCH] cfi: rust: pass -Zpatchable-function-entry on all architectures
To: Alice Ryhl <aliceryhl@google.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Kees Cook <kees@kernel.org>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org, rust-for-linux@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_133902_228225_B25BBFB1 
X-CRM114-Status: GOOD (  40.36  )
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

T24gV2VkLCBPY3QgOSwgMjAyNCBhdCAxOjE14oCvUE0gQWxpY2UgUnlobCA8YWxpY2VyeWhsQGdv
b2dsZS5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBPY3QgOSwgMjAyNCBhdCA3OjQz4oCvUE0gTWFy
ayBSdXRsYW5kIDxtYXJrLnJ1dGxhbmRAYXJtLmNvbT4gd3JvdGU6Cj4gPgo+ID4gSGkgQWxpY2Us
Cj4gPgo+ID4gT24gVHVlLCBPY3QgMDgsIDIwMjQgYXQgMDU6Mzc6MTZQTSArMDAwMCwgQWxpY2Ug
UnlobCB3cm90ZToKPiA+ID4gVGhlIEtDRkkgc2FuaXRpemVyIHN0b3JlcyB0aGUgQ0ZJIHRhZyBv
ZiBhIGZ1bmN0aW9uIGp1c3QgYmVmb3JlIGl0cwo+ID4gPiBtYWNoaW5lIGNvZGUuIEhvd2V2ZXIs
IHRoZSBwYXRjaGFibGUtZnVuY3Rpb24tZW50cnkgZmxhZyBjYW4gYmUgdXNlZCB0bwo+ID4gPiBp
bnRyb2R1Y2UgYWRkaXRpb25hbCBub3AgaW5zdHJ1Y3Rpb25zIGJlZm9yZSB0aGUgbWFjaGluZSBj
b2RlLCB0YWtpbmcgdXAKPiA+ID4gdGhlIHNwYWNlIHRoYXQgbm9ybWFsbHkgaG9sZHMgdGhlIENG
SSB0YWcuCj4gPgo+ID4gVG8gY2xhcmlmeSwgd2hlbiB5b3Ugc2F5ICJiZWZvcmUgdGhlIG1hY2hp
bmUgY29kZSIsIGRvIHlvdSBtZWFuIHdoZW4KPiA+IE5PUHMgYXJlIHBsYWNlZCBiZWZvcmUgdGhl
IGZ1bmN0aW9uIGVudHJ5IHBvaW50PyBlLmcuIGlmIHdlIGNvbXBpbGVkCj4gPiB3aXRoIC1mcGF0
Y2hhYmxlLWZ1bmN0aW9uLWVudHJ5PU0sTiB3aGVyZSBOID4gMD8gSSdsbCByZWZlciB0aG8gdGhp
cyBhcwo+ID4gInByZS1mdW5jdGlvbiBOT1BzIiBiZWxvdy4KPiA+Cj4gPiBUaGVyZSdzIGFuIGV4
aXN0aW5nIGluY29tcGF0aWJpbGl0eSBiZXR3ZWVuIENGSSBhbmQgcHJlLWZ1bmN0aW9uIE5PUHMK
PiA+IGZvciBDIGNvZGUsIGJlY2F1c2Ugd2Ugb3ZlcnJpZGUgLWZwYXRjaGFibGUtZnVuY3Rpb24t
ZW50cnkgb24gYQo+ID4gcGVyLWZ1bmN0aW9uIGJhc2lzIChlLmcuIGZvciBub2luc3RyIGFuZCBu
b3RyYWNlKSwgYW5kIHdlIGRvbid0Cj4gPiBjdXJyZW50bHkgaGF2ZSBhIG1lY2hhbmlzbSB0byBl
bnN1cmUgdGhlIENGSSB0YWcgaXMgaW4gdGhlIHNhbWUgcGxhY2UKPiA+IHJlZ2FyZGxlc3MuIFRo
aXMgaXMgd2h5IGFybTY0IGhhcyBDT05GSUdfRFlOQU1JQ19GVFJBQ0VfV0lUSF9DQUxMX09QUwo+
ID4gZGVwZW5kIG9uICFDRkkuCj4gPgo+ID4gRm9yIEMgY29kZSBhdCBsZWFzdCwganVzdCB1c2lu
ZyByZWd1bGFyIC1mcGF0Y2hhYmxlLWZ1bmN0aW9uLWVudHJ5PU0gb3IKPiA+IC1mcGF0Y2hhYmxl
LWZ1bmN0aW9uLWVudHJ5PU0sMCBzaG91bGRuJ3QgY2hhbmdlIHRoZSBsb2NhdGlvbiBvZiB0aGUg
Q0ZJCj4gPiB0YWcgcmVsYXRpdmUgdG8gdGhlIGZ1bmN0aW9uIGVudHJ5cG9pbnQsIGFuZCBzbyBz
aG91bGQgaGF2ZSBubyBhZHZlcnNlCj4gPiBlZmZlY3Qgb24gQ0ZJLgo+ID4KPiA+IElzIFJ1c3Qg
YW55IGRpZmZlcmVudCBoZXJlPwo+Cj4gQWgsIG5vIGl0IHNob3VsZG4ndCBiZS4gU2FtaSBjYW4g
eW91IGNvbmZpcm0/Cj4KPiA+ID4gSW4gdGhpcyBjYXNlLCBhIGJhY2t3YXJkcyBvZmZzZXQgaXMg
YXBwbGllZCB0byB0aGUgQ0ZJIHRhZyB0byBtb3ZlCj4gPiA+IHRoZW0gb3V0IG9mIHRoZSB3YXkg
b2YgdGhlIG5vcCBpbnN0cnVjdGlvbnMuIFRvIGVuc3VyZSB0aGF0IEMgYW5kIFJ1c3QKPiA+ID4g
YWdyZWUgb24gdGhlIG9mZnNldCB1c2VkIGJ5IENGSSB0YWdzLCBwYXNzIHRoZQo+ID4gPiAtWnBh
dGNoYWJsZS1mdW5jdGlvbi1lbnRyeSB0byBydXN0YyB3aGVuZXZlciBpdCBpcyBwYXNzZWQgdG8g
dGhlIEMKPiA+ID4gY29tcGlsZXIuCj4gPgo+ID4gQXMgYWJvdmUsIEkgc3VzcGVjdCB0aGlzIGlz
bid0IG5lY2Vzc2FyeSB0byBtYWtlIENGSSB3b3JrLCBmb3IgYW55IGNhc2UKPiA+IHRoYXQgd29y
a3Mgd2l0aCBDIHRvZGF5LCBkdWUgdG8gLWZwYXRjaGFibGUtZnVudGlvbi1lbnRyeSBiZWluZwo+
ID4gb3ZlcnJpZGRlbiBvbiBhIHBlci1mdW5jdGlvbiBiYXNpcy4gQXJlIHlvdSBzZWVpbmcgYSBw
cm9ibGVtIGluCj4gPiBwcmFjdGljZSwgb3Igd2FzIHRoaXMgZm91bmQgYnkgaW5zcGVjdGlvbj8K
PiA+Cj4gPiBIb3dldmVyIElJVUMgdGhpcyB3aWxsIGFsbG93IHJ1c3QgdG8gYmUgdHJhY2VkIHZp
YSBmdHJhY2UgKGFzc3VtaW5nIHJ1c3QKPiA+IHJlY29yZHMgdGhlIGluc3RydW1lbnRlZCBsb2Nh
dGlvbnMgYXMgZ2NjIGFuZCBjbGFuZyBkbyk7IGlzIHRoYXQgdGhlCj4gPiBjYXNlPyBBc3N1bWlu
ZyBzbywgaXMgdGhlcmUgYW55IEFCSSBkaWZmZXJlbmNlIHRoYXQgbWlnaHQgYml0ZSB1cz8gT24K
PiA+IGFybTY0IHdlIHJlcXVpcmUgdGhhdCBhbnl0aGluZyBtYXJrZWQgaW5zdHJ1bWVudGVkIHdp
dGgKPiA+IHBhdGNoYWJsZS1mdW5jdGlvbi1lbnRyeSBzdHJpY3RseSBmb2xsb3dzIHRoZSBBQVBD
UzY0IGNhbGxpbmcgY29udmVudGlvbgo+ID4gYW5kIG91ciBmdHJhY2UgdHJhbXBvbGluZXMgc2F2
ZS9yZXN0b3JlIHRoZSBtaW5pbWFsIHNldCBvZiBuZWNlc3NhcnkKPiA+IHJlZ2lzdGVycywgYW5k
IEkgZG9uJ3Qga25vdyBob3cgcnVzdCB3aGV0aGVyIHJ1c3Qgd2lsbCBiZWhhdmUgdGhlIHNhbWUK
PiA+IG9yIGUuZy4gdXNlIHNwZWNpYWxpemVkIGNhbGxpbmcgY29udmVudGlvbnMgaW50ZXJuYWxs
eS4KPgo+IFdlbGwsIEkgd2FzIHRvbGQgdGhhdCBpdCdzIGEgcHJvYmxlbSBhbmQgd2FzIGFibGUg
dG8gdHJpZ2dlciBhIGZhaWx1cmUKPiBvbiB4ODYuIEkgZGlkbid0IG1hbmFnZSB0byB0cmlnZ2Vy
IG9uZSBvbiBhcm02NCwgYnV0IEkgd2Fzbid0IHN1cmUKPiB3aGV0aGVyIHRoYXQgd2FzIG1lIGRv
aW5nIHNvbWV0aGluZyB3cm9uZywgb3Igd2hldGhlciB0aGUgcHJvYmxlbSBvbmx5Cj4gZXhpc3Rz
IG9uIHg4Ni4gV2UgYWxyZWFkeSBoYXZlIHRoZSBmbGFnIG9uIHg4NiBmb3IgRklORUlCVCwgYnV0
IEkKPiB0aG91Z2h0IG9uIHRoZSBvZmYgY2hhbmNlIHRoYXQgaXQncyBub3QgYSBwcm9ibGVtIGlu
IHByYWN0aWNlIG9uIGFybSwKPiBpdCBzdGlsbCBkb2Vzbid0IGh1cnQgdG8gYWRkIHRoZSBmbGFn
Lgo+Cj4gUmVnYXJkaW5nIHRoZSBBQVBDUzY0IGNhbGxpbmcgY29udmVudGlvbiB0aGluZyAuLi4g
cnVzdGMgdXNlcyB0aGUgUnVzdAo+IGNhbGxpbmcgY29udmVudGlvbiBmb3IgZnVuY3Rpb25zIGlu
dGVybmFsbHkgaW4gUnVzdCBjb2RlIGFuZCBJIGRvbid0Cj4ga25vdyB3aGV0aGVyIHRoYXQgY2hh
bmdlcyBhbnl0aGluZyByZWxldmFudCBmb3Igd2hhdCB5b3UgbWVudGlvbi4KPiBNYXR0aGV3L1Nh
bWkgZG8geW91IGtub3c/Cgp0bDtkcjogUnVzdCB1c2VzIEFBUENTNjQgb24gYWFyY2g2NC4gSXQn
cyBub3QgbGlrZWx5IHRvIGNoYW5nZS4KClRoZSAicnVzdCIgY2FsbGluZyBjb252ZW50aW9uIG9u
bHkgbW9kaWZpZXMgdHlwZWQgYXJndW1lbnQgbG93ZXJpbmcKdG9kYXksIG5vdCB3aGljaCByZWdp
c3RlcnMgYXJlIGF2YWlsYWJsZS4gSG93IHR5cGVkIHZhbHVlcyBhcmUgbG93ZXJlZApvbnRvIHRo
ZXNlIHJlZ2lzdGVycyBtYXkgY2hhbmdlIChoYXMgaW4gdGhlIHBhc3QgYW5kIGxpa2VseSB3aWxs
IGluCnRoZSBuZWFyIGZ1dHVyZSksIGJ1dCB0aGUgYWN0dWFsIHJlZ2lzdGVyLXNldCBoYXMgbm90
LiBJdCB3aWxsIHVzZSB0aGUKcmVnaXN0ZXIgY2FsbGluZyBjb252ZW50aW9uIHRoYXQgaXMgZGVm
YXVsdCBmb3IgdGhlIGFyY2hpdGVjdHVyZSwKd2hpY2ggZm9yIGFhcmNoNjQgaXMgQUFQQ1M2NC4g
VGVjaG5pY2FsbHksIHVwc3RyZWFtIGRvZXMgbm90IG1ha2UgYQpoYXJkIHByb21pc2UgdGhhdCAi
cnVzdCIgY2FsbGluZyBjb252ZW50aW9uIGZ1bmN0aW9ucyB3aWxsIGFkaGVyZSB0bwp0aGlzLCBi
dXQgaW4gcHJhY3RpY2UgdGhlIGNvbXBpbGVyIHN0cnVjdHVyZSwgZGVzaXJlIHRvIHdvcmsgd2l0
aAp0aGlyZCBwYXJ0eSB0b29scyAoZGVidWdnZXJzL3Vud2luZGVycyksIGFuZCBhIGhpc3Rvcnkg
b2YgbmV2ZXIKY2hhbmdpbmcgdGhpcyBtYWtlcyBpdCB2ZXJ5IHVubGlrZWx5IHRoYXQgdGhleSB3
b3VsZCBjaGFuZ2UgdGhpcy4KCj4KPiBBbGljZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
