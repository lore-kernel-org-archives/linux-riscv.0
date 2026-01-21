Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC0AD262AD
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jan 2026 01:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Smbrno7iCBVmocx/9xmV1n36UGJT5S5yS1EeXDvKfao=; b=t8NOO+82MbBqlD
	hmo8S4oml09uhL37ovR4roNdkoMa2vUf/Yk0wHuJOoopd3Nu3zaDE+qrs0v5GBfVvdvPF6eQC7Nmu
	GwXBgOF0vI8qbLKMpfb8P07F2D/AW7IR1thNTptF3Fes9m+hMgEyxjczUtrsDVifR2zNmCBhCXUAb
	W7TSkTVfX9fPGl+XihfkSGEC8eb5fNUPZpxtDt/V5tCcbLqCo816VMHmtGnqrnDJi6Ot+6q1qH427
	ZMYwYCGvMSNTEnbearkm6los08vsc6OoQEdYE2z4jYqKUluQrdP3dy2hFxc9Dqi8pBtyJvgAZNxYH
	4AkiPubJGF2IWImPLD2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viN5I-00000004iJG-3dxw;
	Wed, 21 Jan 2026 01:32:36 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viN5G-00000004iIt-2SVR
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jan 2026 01:32:35 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-b87cc82fd85so507105266b.2
        for <linux-riscv@lists.infradead.org>; Tue, 20 Jan 2026 17:32:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768959152; cv=none;
        d=google.com; s=arc-20240605;
        b=eky+sxxcGrKhmX4Skp5EhI3iosNSqdFAFrMR0cu76fzGtoNZpv/L8NMWMqDngkGgDv
         nZzrobOlqp2jtpI4lRqc/4QHj5RqsomQNyG0cuDVoS88QsKTvaEhPgQJWtVECtytxffk
         E7jU0sRE1k1R278V/oWEPymj8wUGzTFTk/Ce4oyUXoUBen7cprNG6F5kiZ3KOEcITl2G
         084UbKOcQsmhJVrs+S6n6EmK3MDZk4v0HftACQpnlHB5LA+qZoEG0U7Z+wb11TVxw95B
         tPjvFWoxnecP9iVkdHULRaInlzGhE9HArUCCxL5pnjcMj0nif5t2t/jP7OmxXRwxJIqL
         yCtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=phhznUg1me3aMCDh6RtpPgdrBfYLQTkKfqDDafoKBZI=;
        fh=bi1+rVXYlYMlUw31XZJxilSts0gQKwDJ+0fX8IzBgvg=;
        b=leN5PvQLILoXhpDMRj/SAOSL75mjjT7r12Rdh7F3SoIaLeG1XTWi5pNJU6u0ywJVv/
         o45m05PxRFElew3yLrO0v/G3djxhQraFI1PshAKsjEaBdUgtdptHqVPvz9+BPD4fQjFX
         2nYEGEdGz3NoLp/ERhU6piNW0aO3Fvw0TUyyFJBygoKZlq+gxxnPdjcaT1Qx1x3vU7na
         y4I4Vn4MKl79M9iv01SpqZ4Y5+ryZHNfvfA/5jCrRnMGoRB78ZM8AErpOExYVup1EIan
         V/ZFV6jJWhg9LlQMI+fqLgmKMdFdqTJdfdD7uuKjibD0kvR+Q6GwttGecDbqgryvWp6U
         UTZg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1768959152; x=1769563952; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=phhznUg1me3aMCDh6RtpPgdrBfYLQTkKfqDDafoKBZI=;
        b=Hy7KaNHpcDYbHom5AjOfSf69pC7+UOBPsYNJI0LHTqTdhpzWXex3/UlPhtn7LjKzRJ
         pqv7sTLA/uCaMo6OzE6cZBvBNQ1jT8aXMnJRkHEtqeM4lLGBz2G4/lnXN4A3g7XkGsJM
         btCeBdXJ8qQwyTETEuit61FgKmuVsKVwyDLaVor2tu7ik5sY1qW8W8Ck4CttmgxBus9Q
         bgqqk4c+miCJaalRCAhrF+CYx9aj0MnqaVdU99zbCLHzHEXa2+P/lyo83JpvFAQKXzel
         mH/3FVZG0uNOz4ealX7hDcPdW0h6xDQRresRwAvlojbLwjaEM3x+d3bZr43N8tqUFK0u
         S51Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768959152; x=1769563952;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=phhznUg1me3aMCDh6RtpPgdrBfYLQTkKfqDDafoKBZI=;
        b=Jzr6KzF/qhC+5//y3CkfYqiUZI56ov7BQF/9bEf23oWLcNg79xJz1JwmcUpQGPYor/
         6DnCDFq/pIRSMAZ2SiFV+qwijnQQ5F5ZiL9pOx2r0JTwUMLMgy/cDeTNSXPJWGEJIcls
         KbuFlYQf93Pyujv4syfkwKIusu9ArwJnRiZTItEMUl+PGGHqE8dP2WpFgmd+kt8xSSyv
         Um+bzGKt+V+laRYlrsjsFdBikx5EGAFxGhf64qKxwwJorp1nRM0rTZcPxnYv37ftrokF
         DmaIywNvKrJb80NJepqLWC859XVlmG8nFBY6emehFjccC47PYcdjS9wUXFdiqFSIAIdM
         EAPg==
X-Forwarded-Encrypted: i=1; AJvYcCXNQdlxgqwFjiv/ih/ZdKp40OqpxcTC4fhwOL09xbGqRXPsexE6NxcQJrsruEy9mC2isWq0+blsq8SNOQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyjPkOqduYR9ZPWaLcIMHWgoVb2AcBRoiSdOxJyZV3R+tROKxJU
	ncsAIO0e6gYRs7g7SIpP3fysZERbbKsVwIJiV96a4vQEbR1TjAQES/oWuIfx5WAUTIGoiHvf7Op
	RmRDqL3jHIH1IaEzK43H9STIlBlaXY2O5+c51IUwqgA==
X-Gm-Gg: AZuq6aL9eT5ynWvC1uC6I/XhGm3yvlltsP/XSqnXI08CqH9FpD+XDFjjd0G65x5YAbk
	VfPP74ETt1WUkgKF3KNDHfX7QGCVtiQHmz5/fC4BdZgMARtTJWmNnrD4COJwbqxyX+RnqwhCXkJ
	69RgYUEl09lTTyPb/E/3WyfvEgKjdtCehZEPMlIn1n+MOM7H4vueFe/y6GAnyYM1K98K//60KFS
	5jFMqsrWp1K6af9KW/l3wdjrYb1yATY2wCEorfKTGIKvgsEj4+hUGUlUbAJRincMDrdiQ9thg==
X-Received: by 2002:a17:907:9488:b0:b87:7634:b20c with SMTP id
 a640c23a62f3a-b8796b215a4mr1301363166b.38.1768959152268; Tue, 20 Jan 2026
 17:32:32 -0800 (PST)
MIME-Version: 1.0
References: <20251211-v5_user_cfi_series-v26-0-f0f419e81ac0@rivosinc.com>
 <e052745b-6bf0-c2a3-21b2-5ecd8b04ec70@kernel.org> <aTxf7IGlkGLgHgI2@debug.ba.rivosinc.com>
 <CAKC1njQ-hS+kUJ0C_v0oqZW1EZw2zAXMp-SnnA-ZXh_H-SoVdQ@mail.gmail.com>
In-Reply-To: <CAKC1njQ-hS+kUJ0C_v0oqZW1EZw2zAXMp-SnnA-ZXh_H-SoVdQ@mail.gmail.com>
From: Zong Li <zong.li@sifive.com>
Date: Wed, 21 Jan 2026 09:32:20 +0800
X-Gm-Features: AZwV_QgpJ38WsQTA-JLh1W5jk7su1plcAErfmIKl7ceT3yMsB0wZBJHvBBZ5Ujw
Message-ID: <CANXhq0rpjSvOThACrB6_MMc8S34--xJsUYZ+HtMu1GUNyk8zOg@mail.gmail.com>
Subject: Re: [PATCH v26 00/28] riscv control-flow integrity for usermode
To: Deepak Gupta <debug@rivosinc.com>
Cc: Paul Walmsley <pjw@kernel.org>, x86@kernel.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Christian Brauner <brauner@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Oleg Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, Jann Horn <jannh@google.com>, 
	Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Benno Lossin <lossin@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, alistair.francis@wdc.com, 
	richard.henderson@linaro.org, jim.shu@sifive.com, 
	Andy Chiu <andybnac@gmail.com>, kito.cheng@sifive.com, charlie@rivosinc.com, 
	atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
	alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
	rick.p.edgecombe@intel.com, rust-for-linux@vger.kernel.org, 
	Andreas Korb <andreas.korb@aisec.fraunhofer.de>, 
	Valentin Haudiquet <valentin.haudiquet@canonical.com>, Charles Mirabile <cmirabil@redhat.com>, 
	Jesse Huang <jesse.huang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_173234_657398_AFB1E749 
X-CRM114-Status: GOOD (  33.07  )
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

T24gVGh1LCBKYW4gOCwgMjAyNiBhdCAxMToxMOKAr1BNIERlZXBhayBHdXB0YSA8ZGVidWdAcml2
b3NpbmMuY29tPiB3cm90ZToKPgo+IEhpIFBhdWwsCj4KPiBJIGhhdmUgYSBidWdmaXggZm9yIGEg
YnVnIHJlcG9ydGVkIGJ5IEplc3NlIEh1YW5nICh0aGFua3MgSmVzc2UpIGluIHJpc2N2Cj4gaW1w
bGVtZW50YXRpb24gb2YgYG1hcF9zaGFkb3dfc3RhY2tgLgo+Cj4gU2hvdWxkIEkgc2VuZCBhIG5l
dyBzZXJpZXMgb3Igb25seSB0aGUgYnVnZml4LXBhdGNoIGZvciBpbXBsZW1lbnRhdGlvbgo+IG9m
IGBtYXBfc2hhZG93X3N0YWNrYAo+CgpIaSBEZWVwYWssCk5vdCBzdXJlIGlmIEkgbWlzc2VkIHRo
ZSBidWdmaXggcGF0Y2gsIEkgY291bGRuJ3QgZmluZCBpdCBvbiB0aGUKbWFpbGluZyBsaXN0LiBD
b3VsZCBJIGtub3cgaGF2ZSB5b3Ugc3VibWl0dGVkIGl0PyBJZiBzbywgY291bGQgeW91CnBsZWFz
ZSBwb2ludCBtZSB3aGVyZSB0aGUgcGF0Y2ggaXM/ClRoYW5rcwoKPiBMZXQgbWUga25vdy4gVGhh
bmtzLgo+Cj4gLURlZXBhawo+Cj4gLURlZXBhawo+Cj4KPgo+IE9uIEZyaSwgRGVjIDEyLCAyMDI1
IGF0IDEwOjMz4oCvQU0gRGVlcGFrIEd1cHRhIDxkZWJ1Z0ByaXZvc2luYy5jb20+IHdyb3RlOgo+
ID4KPiA+IE9uIEZyaSwgRGVjIDEyLCAyMDI1IGF0IDAxOjMwOjI5QU0gLTA3MDAsIFBhdWwgV2Fs
bXNsZXkgd3JvdGU6Cj4gPiA+T24gVGh1LCAxMSBEZWMgMjAyNSwgRGVlcGFrIEd1cHRhIHZpYSBC
NCBSZWxheSB3cm90ZToKPiA+ID4KPiA+ID4+IHYyNjogQ09ORklHX1JJU0NWX1VTRVJfQ0ZJIGRl
cGVuZHMgb24gQ09ORklHX01NVSAoZGVwZW5kZW5jeSBvZiBzaGFkb3cgc3RhY2sKPiA+ID4+IG9u
IE1NVSkuIFVzZWQgYjQgdG8gcGljayB0YWdzLCBhcHBhcmFudGx5IGl0IG1lc3NlZCB1cCBzb21l
IHRhZyBwaWNrcy4gRml4aW5nIGl0Cj4gPiA+Cj4gPiA+RGVlcGFrOiBJJ20gbm93IChhdCBsZWFz
dCkgdGhlIHRoaXJkIHBlcnNvbiB0byB0ZWxsIHlvdSB0byBzdG9wIHJlc2VuZGluZwo+ID4gPnRo
aXMgZW50aXJlIHNlcmllcyBvdmVyIGFuZCBvdmVyIGFnYWluLgo+ID4KPiA+IFRvIGJlIHZlcnkg
aG9uZXN0IEkgYWxzbyBmZWVsIHZlcnkgYmFkIGRvaW5nIGFuZCBET1NpbmcgdGhlIGxpc3RzLiBT
b3JyeSB0byB5b3UKPiA+IGFuZCBldmVyeW9uZSBlbHNlLgo+ID4KPiA+IEJ1dCBJIGhhdmUgYmVl
biBzaXR0aW5nIG9uIHRoaXMgcGF0Y2ggc2VyaWVzIGZvciBsYXN0IDMtNCBtZXJnZSB3aW5kb3dz
IHdpdGgKPiA+IHBhdGNoZXMgYmVpbmcgZXhhY3RseSBzYW1lL3NpbWlsYXIuIFNvIEkgaGF2ZSBi
ZWVuIGEgbGl0dGxlIG1vcmUgdGhhbiBkZXNwZXJhdGUKPiA+IHRvIGdldCBpdCBpbi4KPiA+Cj4g
PiBJIHJlYWxseSBoYXZlbid0IGhhZCBhbnkgbWVhbmluZ2Z1bCBmZWVkYmFjayBvbiBwYXRjaCBz
ZXJpZXMgZXhjZXB0IHN0YWxsaW5nCj4gPiBqdXN0IGJlZm9yZSBlYWNoIG1lcmdlIHdpbmRvdyBm
b3IgcmVhc29ucyB3aGljaCByZWFsbHkgc2hvdWxkbid0IHN0YWxsIGl0cwo+ID4gbWVyZ2UuIFN1
cmUgdGhhdCdzIHRoZSBuYXR1cmUgb2Ygb3BlbiBzb3VyY2UgZGV2ZWxvcG1lbnQgYW5kIGl0J3Mg
bWFpbnRhaW5lcidzCj4gPiBjYWxsIGF0IHRoZSBlbmQgb2YgdGhlIGRheS4gQW5kIEkgYW0gbmV3
IHRvIHRoaXMuIEknbGwgaW1wcm92ZS4KPiA+Cj4gPiA+Cj4gPiA+Rmlyc3QsIGEgbW9kaWZpZWQg
dmVyc2lvbiBvZiB0aGUgQ0ZJIHYyMyBzZXJpZXMgd2FzIEFMUkVBRFkgU0lUVElORyBJTgo+ID4g
PkxJTlVYLU5FWFQuICBTbyB0aGVyZSdzIG5vIHJlYXNvbiB5b3Ugc2hvdWxkIGJlIHJlc2VuZGlu
ZyB0aGUgZW50aXJlCj4gPiA+c2VyaWVzLCBVTkxFU1MgeW91ciBpbnRlbnRpb24gZm9yIG1lIGlz
IHRvIGRyb3AgdGhlIGVudGlyZSBleGlzdGluZyBzZXJpZXMKPiA+ID5hbmQgd2FpdCBmb3IgYW5v
dGhlciBtZXJnZSB3aW5kb3cuCj4gPiA+Cj4gPiA+U2Vjb25kOiB3aGVuIHNvbWVvbmUgYXNrcyB5
b3UgcXVlc3Rpb25zIGFib3V0IGFuIGluZGl2aWR1YWwgcGF0Y2gsIGFuZCB5b3UKPiA+ID53YW50
IHRvIGFuc3dlciB0aG9zZSBxdWVzdGlvbnMsIGl0J3MgTk9UIEdPT0QgZm9yIHlvdSB0byByZXNl
bmQgdGhlIGVudGlyZQo+ID4gPjI4IHNlcmllcyBhcyB0aGUgcmVzcG9uc2UhICBZb3UgYXJlIERE
T1NpbmcgYSBidW5jaCBvZiBsaXN0cyBhbmQgRS1tYWlsCj4gPiA+aW5ib3hlcy4gIEp1c3QgYW5z
d2VyIHRoZSBxdWVzdGlvbiBpbiBhIHNpbmdsZSBFLW1haWwuICBJZiB5b3Ugd2FudCB0bwo+ID4g
PnVwZGF0ZSBhIHNpbmdsZSBwYXRjaCwganVzdCBzZW5kIHRoYXQgb25lIHBhdGNoLgo+ID4KPiA+
IE5vdGVkLiBJIHdhc24ndCBzdXJlIGFib3V0IGl0LiBJJ2xsIGV4cGxpY2l0bHkgYXNrIG5leHQg
dGltZSBpZiB5b3Ugd2FudCBtZSB0bwo+ID4gc2VuZCBhbm90aGVyIG9uZS4KPiA+Cj4gPiA+Cj4g
PiA+SWYgeW91IGRvbid0IHN0YXJ0IHBheWluZyBhdHRlbnRpb24gdG8gdGhlc2UgcnVsZXMgdGhl
biBwZW9wbGUgYXJlIGdvaW5nCj4gPiA+dG8gc3RhcnQgaWdub3JpbmcgeW91IC0tIGF0IGJlc3Qh
IC0tIGFuZCBpdCdzIGdvaW5nIHRvIGdpdmUgdGhlIGVudGlyZQo+ID4gPmNvbW11bml0eSBhIGJh
ZCByZXB1dGF0aW9uLgo+ID4KPiA+IEV2ZW4gYmVmb3JlIHRoaXMsIHRoaXMgcGF0Y2ggc2VyaWVz
IGhhcyBiZWVuIGlnbm9yZWQgbGFyZ2VseS4gSSBkb24ndCBrbm93Cj4gPiBob3cgdG8gZ2V0IGF0
dGVudGlvbi4gQWxsIEkgd2FudGVkIHdhcyBlaXRoZXIgZmVlZGJhY2sgb3IgZ2V0IGl0IGluLiBB
bmQgYXMgSQo+ID4gc2FpZCBJJ3ZlIGJlZW4gZGVzcGFyYXRlIHRvIGdldCBpdCBpbi4gQWxzbyBh
cyBJIHNhaWQsIEknbGwgaW1wcm92ZS4KPiA+Cj4gPiA+Cj4gPiA+UGxlYXNlIGFja25vd2xlZGdl
IHRoYXQgeW91IHVuZGVyc3RhbmQgdGhpcywKPiA+Cj4gPiBBQ0tlZC4KPiA+Cj4gPiA+Cj4gPiA+
Cj4gPiA+LSBQYXVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
