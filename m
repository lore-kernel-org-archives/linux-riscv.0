Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18CEDC27C77
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jun 2024 14:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=+0UgErl9Xd+s6r7zYKc4glN0uHexns0244IQo0g+m30=; b=0rAzqH6Tg+HMp6Kt5euzdAyqh6
	a1PS9BNWKK2se0A1pNxdadzPM8b/cLAOHXsaskVk0VlpYNQrGEKpb9GGTiunMxzxsvxcVpZhl5ge+
	w2y7VRw1178ckKlFSVZbx52D3Qa/dwR8RoHeaV0SwwSzL7g9nakizcm1lJTKz3QDDa79eG0UyGoae
	qGeEgM0uC+hPoynwnue3smL/PLlWyWTMvjuJOIBQotWVuMJrvYcujEJLZWsNX5gL0pyG2w8wHL4jl
	BtQCCTnc0pU4DHbdC67ZRXWev5w+Px/QyHVL9LViQ7U4FC2uO9nsrOXn8AhdPVPO733g6AFdEOjHr
	9h40u1wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHPQj-0000000D2yd-0AL8;
	Wed, 12 Jun 2024 14:58:29 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHPQf-0000000D2uU-08UN
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jun 2024 14:58:27 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1f7028196f2so29443205ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 12 Jun 2024 07:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1718204300; x=1718809100; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dYVQc7sbI7D0Oe7HLiFsYyb4EXhyajIKibLIV5on50g=;
        b=DlYb3e4pvJThJa3siwMmMBzedm4wJi6T/cLo0kSk6Fvh7tpOuihHSJTuShLadCks56
         phdSBjZwj6qqkAGubbYVMfZ2blw4CevGkQUjcNlXJCDgIdTb9NRXsFYtS4KX9zPrNx6K
         1OcigpfUA4h1WbrIcY5IxJC3Xz3vERUaP/Cf4YYRNHW32ZgwIhrEqXpQK0LHVKlSvaIb
         Q32HiqyisRplOH/c6eUoJH5x3fIhB+8Hx3m6crY2m3u9e9bPUzbt4hmrE74+vpl7UqfP
         Z2HdeZ0mQZhje4xvJwUoeLHRxob79UoA2K71CclLGSlPZlF8VqzUEnWe4YNSmS9fwBi9
         pYdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718204300; x=1718809100;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dYVQc7sbI7D0Oe7HLiFsYyb4EXhyajIKibLIV5on50g=;
        b=ZFO8Q2nGh49RSRlk9BHTxcaJnNIvbneacCz/XI4W18DjEUj9v9AmbTqaDRPS3X9mXa
         lG0OpOd92uRWFJjM+DWvtNNY0ptmIJVq0+vkTi4IqBd1PbFU3s6P/DQ5ICvhPoSbeAEM
         Ome/JqDM+jFaDHKP0pCvseopBZVMoM7uLk56z7/xfMcJbfSZR4GF371Otxlx5uXOyQVg
         n9jqxAPKVCJQcSnutc1aNl7jlDXFZvvN2KW+Jzz3sJmqpysD539pvc98z7RReHxVmgnl
         ntLy+++qH6J15HhyPLMjqM0+rflSBxadCnCEKuENvJBnr9v0XjV6y+/wUG+szc5THIo9
         K1PA==
X-Forwarded-Encrypted: i=1; AJvYcCV/KsjpiTL0r6Iw6LE5CX8XKSI7sDtPp+e0Ivd3oz0D4ryR2Afdc0H9hemExbUenijRrnmGNsj6NlX8P6kD498ZdFlabIWRvp3MWDVxuBu/
X-Gm-Message-State: AOJu0YwQH51Xydrs/05naF/ceJfsOeMvM4uOKr7AJo63B/o0EqpevD8T
	Za70SphOb5AuycknY4fEAtlt1ffOK+RnEACi2SHi2QKGVk5rgAgW9KlGh0T7at4=
X-Google-Smtp-Source: AGHT+IGrq7jW8732rVd+qc8IpryGpylS9Fm49H6HNRQuvUwUSpYg0NbpacN44xXJc7BI5TdojnEihw==
X-Received: by 2002:a17:902:c404:b0:1f4:5dc0:5fe8 with SMTP id d9443c01a7336-1f83b6989b3mr20922595ad.15.1718204300054;
        Wed, 12 Jun 2024 07:58:20 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6d7091e5esm103751575ad.167.2024.06.12.07.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 07:58:19 -0700 (PDT)
Date: Wed, 12 Jun 2024 07:58:19 -0700 (PDT)
X-Google-Original-Date: Wed, 12 Jun 2024 07:58:17 PDT (-0700)
Subject: Re: [PATCH v0] RISC-V: Use Zkr to seed KASLR base address
In-Reply-To: <c1f5a958-1130-4bdb-a154-0c0eeb06c8f9@rivosinc.com>
CC: debug@rivosinc.com, Conor Dooley <conor@kernel.org>,
  Conor Dooley <conor.dooley@microchip.com>, alex@ghiti.fr, jesse@rivosinc.com, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, llvm@lists.linux.dev, alexghiti@rivosinc.com, aou@eecs.berkeley.edu,
  Bjorn Topel <bjorn@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, nathan@kernel.org,
  ndesaulniers@google.com, masahiroy@kernel.org, Atish Patra <atishp@rivosinc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: cleger@rivosinc.com
Message-ID: <mhng-e9618799-eb28-4e60-a321-41a786f2a332@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_075825_217393_1978207C 
X-CRM114-Status: GOOD (  42.59  )
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

T24gV2VkLCAxMiBKdW4gMjAyNCAwMDoxNToyNiBQRFQgKC0wNzAwKSwgY2xlZ2VyQHJpdm9zaW5j
LmNvbSB3cm90ZToKPgo+Cj4gT24gMTEvMDYvMjAyNCAxNzozMiwgRGVlcGFrIEd1cHRhIHdyb3Rl
Ogo+PiBPbiBNb24sIEp1biAxMCwgMjAyNCBhdCAxMDo1NjozNVBNICswMTAwLCBDb25vciBEb29s
ZXkgd3JvdGU6Cj4+PiBPbiBNb24sIEp1biAxMCwgMjAyNCBhdCAwMjowNjo1MFBNIC0wNzAwLCBE
ZWVwYWsgR3VwdGEgd3JvdGU6Cj4+Pj4gT24gTW9uLCBKdW4gMTAsIDIwMjQgYXQgMTE6MTY6NDJB
TSArMDIwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+Pj4+ID4gT24gMTAvMDYvMjAyNCAxMTow
MiwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+Pj4+ID4gPiBPbiBNb24sIEp1biAxMCwgMjAyNCBhdCAx
MDozMzozNEFNICswMjAwLCBDbMOpbWVudCBMw6lnZXIgd3JvdGU6Cj4+Pj4gPiA+ID4gT24gMDcv
MDYvMjAyNCAyMDo1MSwgRGVlcGFrIEd1cHRhIHdyb3RlOgo+Pj4+ID4gPiA+ID4gT24gTW9uLCBK
dW4gMDMsIDIwMjQgYXQgMDE6NDc6NDBQTSArMDEwMCwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+Pj4+
ID4gPiA+ID4gPiBPbiBNb24sIEp1biAwMywgMjAyNCBhdCAxMToxNDo0OUFNICswMjAwLCBBbGV4
YW5kcmUgR2hpdGkKPj4+PiB3cm90ZToKPj4+PiA+ID4gPiA+IEkgZG9uJ3Qga25vdyBhbGwgdGhl
IGRldGFpbHMgYnV0IG9uIGZpcnN0IGdsYW5jZSBpdCBzZWVtcwo+Pj4+IGxpa2UgaW5zdGVhZAo+
Pj4+ID4gPiA+ID4gb2YgQUNQSSwKPj4+PiA+ID4gPiA+IG1heSBiZSBGV0ZUIGlzIGEgYmV0dGVy
IHBsYWNlIGZvciBkaXNjb3ZlcnkgPwo+Pj4+ID4gPiA+ID4KPj4+PiBodHRwczovL2xpc3RzLnJp
c2N2Lm9yZy9nL3RlY2gtcHJzL3RvcGljL3BhdGNoX3YxMl9hZGRfZmlybXdhcmUvMTA2NDc5NTcx
Cj4+Pj4gPiA+ID4KPj4+PiA+ID4gPiBJTUhPLCBkb2luZyBkaXNjb3ZlcnkgaW4gRldGVCBpcyBu
b3QgdGhlIGdvYWwgb2YgdGhpcwo+Pj4+IGV4dGVuc2lvbi4gSSB0aGluawo+Pj4+ID4gPiA+IHRo
ZSAicmVhbCIgc29sdXRpb24gd291bGQgYmUgdG8gd2FpdCBmb3IgdGhlIHVuaWZpZWQgZGlzY292
ZXJ5Cj4+Pj4gdGFzawo+Pj4+ID4gPiA+IGdyb3VwIHRvIGNvbWUgdXAgd2l0aCBzb21ldGhpbmcg
Zm9yIHRoYXQgKHdoaWNoIGlzIHRoZWlyIGdvYWwgSQo+Pj4+IHRoaW5rKSBbMV0KPj4+Pgo+Pj4+
IFllYWggSSB1bmRlcnN0YW5kIHRoZSBjb251bmRydW0gaGVyZS4KPj4+Pgo+Pj4+ID4gPgo+Pj4+
ID4gPiBJJ20gY3VyaW91cyB0byBzZWUgaG93IHRoYXQgd29ya3Mgb3V0LiBUaGUgcHJvcG9zYWwg
ZG9jdW1lbnRzIGFuCj4+Pj4gbS1tb2RlCj4+Pj4gPiA+IGNzciwgc28gd2UnZCBoYXZlIHRvIHNt
dWdnbGUgdGhlIGluZm9ybWF0aW9uIHRvIHMtbW9kZSBzb21laG93Li4uCj4+Pj4gPgo+Pj4+ID4g
QWhlbSwgeWVhaCwgSSBzcG9rZSBhIGJpdCB0b28gZmFzdC4gTG9va2VkIGF0IHRoZSBwcm9wb3Nh
bCBhbmQgdGhlCj4+Pj4gPiBtY29uZmlncHRyIENTUiB3aWxsIGJlIGFjY2Vzc2libGUgYnkgTS1t
b2RlIG9ubHkgc28gSSBndWVzcyB3ZSB3aWxsCj4+Pj4gaGF2ZQo+Pj4+ID4gdG8gZmluZCBhbm90
aGVyIHdheS4uLgo+Pj4+Cj4+Pj4gVGhhdCdzIG5vdCB0aGUgb25seSBwcm9ibGVtLiBFdmVuIGlm
IHlvdSBnZXQgbWNvbmZpZ3B0ciBhY2Nlc3MsCj4+Pj4gcGFyc2luZyB0aGUgZm9ybWF0Cj4+Pj4g
aXMgYW5vdGhlciB0aGluZyB0aGF0IGhhcyB0byBiZSBkb25lLiBUaGlzIGlzIGVhcmx5IGluIGJv
b3QuIEFsdGhvdWdoCj4+Pj4gaXRzIHN0cmljdGx5IChwdW4KPj4+PiBpbnRlbmRlZCkgbm90IGEg
ZmlybXdhcmUgZmVhdHVyZSBleHRlbnNpb24sIEkgdGhpbmsgaXQncyBtdWNoIGVhc2llcgo+Pj4+
IHRvIGFzayB1bmRlcmx5aW5nCj4+Pj4gZmlybXdhcmUgaWYgcGxhdGZvcm0gaXMgYFNzdHJpY3Rg
LiBvciBtYXkgYmUgZXhwb3NlIHNvbWV0aGluZyBsaWtlIGJlbG93Cj4+Pj4KPj4+PiBgRU5BQkxF
X1NTVFJJQ1RgLgo+Pj4+IFBsYXRmb3JtcyB3aGljaCBzdXBwb3J0IGBTc3RyaWN0YCBjYW4gcmV0
dXJuIHN1Y2Nlc3MgZm9yIHRoaXMgd2hpbGUKPj4+PiBwbGF0Zm9ybXMgd2hpY2ggZG9uJ3QKPj4+
PiBoYXZlIGBTc3RyaWN0YCBjYW4gcmV0dXJuIGVycm9yIGNvZGUgKG5vdCBzdXBwb3J0ZWQgb3Ig
bm90IGltcGxlbWVudGVkKS4KPj4+PiBUaGlzIHdheSBpdHMgbm90IGZlYXR1cmUgZGlzY292ZXJ5
Lgo+Pj4KPj4+IEkgbWVhbiwgaXQncyBmZWF0dXJlIGRpc2NvdmVyeSBpbiBhbGwgYnV0IG5hbWUu
IFlvdSdyZSBjYWxsaW5nIGl0Cj4+PiBlbmFibGUsIGJ1dCB0aGUgYmVoYXZpb3VyIHlvdSBkZXNj
cmliZSBpcyBmZWF0dXJlIGRpc2NvdmVyeSAtIG5vdCB0aGF0IEkKPj4+IGFtIGFnYWluc3QgdGhp
cyBiZWluZyBmZWF0dXJlIGRpc2NvdmVyeSBzaW5jZSBpdCBnZXRzIHVzIG91dCBvZiBhbgo+Pj4g
YW5ub3lpbmcgYmluZC4KPj4KPj4gWWVzIEkga25vdyBpdCdzIGNoZWF0aW5nIGJ1dCBhdCBsZWFz
dCBmb3IgdGhpcyBjYXNlLCBpdCBzZWVtcyBsaWtlIGVhc3kKPj4gc29sdXRpb24gd2hpY2gKPj4g
ZG9lc24ndCBicmVhayBhbnl0aGluZy4gTmVpdGhlciBJIHNlZSBpdCBjcmVhdGluZyBhbnkgZnV0
dXJlIHByb2JsZW1zCj4+IChleGNlcHQgRldGVCBiZWNvbWluZwo+PiB0byBsb29rIGxpa2UgZGlz
Y292ZXJ5IG1lY2hhbmlzbSA6LSkgYW5kIENsZW1lbnQvQXRpc2ggaGF0aW5nIG1lIGZvciB0aGF0
KQo+Cj4gQWhhaCBubyB3b3JyaWVzOykgVGhpbmtpbmcgYSBiaXQgbW9yZSBhYm91dCBpdCwgaWYg
d2UgbmVlZCBvbmx5IGEgZmV3Cj4gZXh0ZW5zaW9ucyB0byBiZSBkaXNjb3ZlcmFibGUsIGl0IHNl
ZW1zIG1hbmFnZWFibGUgKGllIGFkZCBhICJsb2NrZWQiCj4gZmVhdHVyZSB0aGF0IHJlcG9ydCB0
aGUgZXh0ZW5zaW9uIGF2YWlsYWJpbGl0eSBpdHNlbGYsIGdldCBvbmx5IHdpbGwKPiB3b3JrLCBz
ZXQgd2lsbCByZXR1cm4gU0JJX0VERU5JRUQpLiBCdXQgaWYgbmVlZCBtb3JlIG9mIHRoZW0sIHRo
ZW4gYQo+IGRlZGljYXRlZCBtZWNoYW5pc20gc2hvdWxkIHByb2JhYmx5IGJlIGRlc2lnbmVkLgo+
Cj4gQ2zDqW1lbnQKPgo+Pgo+PiBBbm90aGVyIHNvbHV0aW9uIHRvIHRoaXMgY291bGQgYmUgaW50
cm9kdWNpbmcgYSByaXNjdiBjb25maWcKPj4gYENPTkZJR19SSVNDVl9TU1RSSUNUYC4KPj4gQnkg
ZGVmYXVsdCBhbHdheXMgc2VsZWN0IGBDT05GSUdfUklTQ1ZfU1NUUklDVGAgYW5kIGFueSBwbGF0
Zm9ybSBvd25lcgo+PiB3aG8gYXJlIG5vdAo+PiBzc3RyaWN0LCB0aGV5IGNhbiBidWlsZCB0aGVp
ciBvd24uCj4+IEkgZXhwZWN0IGRpc3RybyAodWJ1bnR1LCByZWQgaGF0LCBldGMpIHdvdWxkIHdh
bnQgYnkgZGVmYXVsdAo+PiBgQ09ORklHX1JJU0NWX1NTVFJJQ1RgLgoKSU1PIHRoaW5ncyBsaWtl
IFNzdHJpY3QgaXMgZ29pbmcgdG8gZW5kIHVwIGJlaW5nIHVzZWxlc3MuICBJdCdzIGp1c3QgCmFu
b3RoZXIgd2F5IHRvIGtpY2sgdGhlIGNhbiBkb3duIHRoZSByb2FkIG9uIGFjdHVhbGx5IGhhdmlu
ZyAKY29tcGF0aWJpbGl0eS4gIFdlJ3ZlIGFscmVhZHkgc2VlbiB0aGlzIHdpdGggdGhlIGV4dGVu
c2lvbnMgYW5kIHRoZSAKcHJvZmlsZXMsIEkgZG9uJ3Qgc2VlIGhvdyBTc3RyaWN0IGlzIGFueSBk
aWZmZXJlbnQuCgpUaGUgUklTQy1WIGZvdW5kYXRpb24gbmVlZHMgdG8ganVzdCBhY3R1YWxseSBk
byBjb21wYXRpYmlsaXR5LCBtYWtpbmcgdXAgCm1vcmUgbmFtZXMgaXNuJ3QgZ29pbmcgdG8gY2hh
bmdlIGFueXRoaW5nLgoKPj4+IEkgZm9yZ2V0IHdoaWNoIGV4dGVuc2lvbiBBbGV4IGFuZCBJIGRp
c2N1c3NlZCBwcmV2aW91c2x5LCBidXQgdGhlcmUncwo+Pj4gc29tZSBtbS1yZWxhdGVkIHRoaW5n
cyB0aGF0IHlvdSdyZSBnb25uYSBoYXZlIHRvIHByb2JlIHN1cGVyIGVhcmx5IGFuZAo+Pj4gd2Ug
bmVlZCB0byBmaWd1cmUgb3V0IGlmIHdlIGNhbiBnZXQgdGhhdCBpbmZvIGZyb20gQUNQSSBvciBu
b3QuIEkga25vdwo+Pj4gd2UgZGlzY3Vzc2VkIGl0IHcuci50LiBvbmUgb2YgdGhlIFQtSGVhZCB2
ZW5kb3IgZXh0ZW5zaW9ucywgYnV0IEkgdGhpbmsKPj4+IGFub3RoZXIgc3RhbmRhcmQgb25lIGdv
dCBtZW50aW9uZWQgdG9vLgo+Pj4KPj4+PiBJdCBzZWVtcyBsaWtlIGFybTY0IHBhcnNlcyBmZHQg
YW5kIGl0IHJlYWRzIGNlcnRhaW4gQ1NScyB0b28KPj4+PiAoYGFyY2gvYXJtNjQva2VybmVsL3Bp
L2thc2xyX2Vhcmx5LmNgKS4gQWx0aG91Z2ggaXQgZG9lc24ndCBsb29rIGxpa2UKPj4+PiBpdCBo
YXMgdG8gZG8gYW55Cj4+Pj4gZGlzY292ZXJ5IGZvciB0aGVtLgo+Pj4KPj4+IEEgZGVjcmVlIGZy
b20gdGhlIFBhbG1lciB0aGF0IHdlIGRvbid0IHN1cHBvcnQgdGhpbmdzIHRoYXQgZG8gbm90IGNv
bmZvcm0KPj4+IGluIHRoaXMgbWFubmVyIHdvdWxkIGFsbG93IHVzIHRvIGRvIHdoYXQgYXJtNjQg
ZG9lcy4gSSBicm91Z2h0IHRoaXMgdXAKPj4+IG9yaWdpbmFsbHkgYmVjYXVzZSBpdCdzIGJlZW4g
ZGlzY3Vzc2VkIGJlZm9yZSB0aGF0IHdlIGNhbm5vdCByZWx5IG9uCj4+PiBjb25mb3JtYW5jZSBi
ZWNhdXNlIHdlIHdhbnQgdG8gc3VwcG9ydCBwZW9wbGUncyBwbGF0Zm9ybXMsIHdoZXRoZXIgdGhl
eQo+Pj4gY29tcGx5IG9yIG5vdC4gSSdkIGJlIHdhcnkgb2YgbWFraW5nIHRoaXMgYW4gZXhjZXB0
aW9uIG5vdywgYW5kIHRoZW4KPj4+IGxhdGVyIG9uIHNvbWVvbmUgbWFrZXMgYSBwbGF0Zm9ybSB3
ZSB3YW50IHRvIHN1cHBvcnQgdGhhdCBkb2Vzbid0Cj4+PiBjb25mb3JtIGFuZCBoZXkgcHJlc3Rv
LCB3ZSByZWdyZXNzIEtBU0xSIHN1cHBvcnQgLSBldmVuIGlmIEkgdGhpbmsgaXQgaXMKPj4+IHBy
ZXR0eSB1bmxpa2VseSB0aGF0IHNvbWVvbmUgaXMgZ29pbmcgdG8gcmVwdXJwb3NlIHRoZSBaa3Ig
Q1NScy4KCllhLCBJIHRoaW5rIHRoYXQncyBmaW5lLiAgTGV0J3MganVzdCBibGluZGx5IHJlYWQg
dGhlIENTUiB3aXRob3V0IApwcm9iaW5nLCBpZiBzb21lIGhhcmR3YXJlIGhhcyBkZXN0cnVjdGl2
ZSBzaWRlIGVmZmVjdHMgb24gdGhlIENTUiByZWFkIAp0aGVuIHdlIGNhbiBmaWd1cmUgb3V0IHdo
YXQgdG8gZG8gd2l0aCBpdCBsYXRlci4KCj4+PiBPbmUgb2YgdGhlIHByb2JsZW1zIHdpdGggb25s
eSBzdXBwb3J0aW5nIGNvbmZvcm1pbmcgcGxhdGZvcm1zIGlzIHRoYXQKPj4+IHRoZSBkZWZpbml0
aW9uIG9mIGNvbmZvcm1pbmcgY2hhbmdlcyBvdmVyIHRpbWUhIFRoaXMgaGFzIGhhcHBlbmVkIHdp
dGgKPj4+IHRoZSBBbmRlcyBQTVUgZm9yIGV4YW1wbGUsIHdoaWNoIEkgYmVsaWV2ZSB1c2VzIGFu
IGludGVycnVwdCBudW1iZXIgdGhhdAo+Pj4gd2FzIGxhdGVyIGNvLW9wdGVkIGJ5IEFJQSBzcGVj
LiBUaGF0IGNvbmZvcm1lZCBhdCB0aGUgdGltZSwgYnV0IGRvZXNuJ3QKPj4+IGFueW1vcmUgLSBk
byB0aGV5IGdldCB0byBtYXJrIHRoZW1zZWx2ZXMgYXMgU3N0cmljdD8KPj4+Cj4+PiBNYXliZSB3
ZSBjYW4gZG8gdGhpcyBvbiBhIGNhc2UtYnktY2FzZSBiYXNpcywgYnV0IGl0J3MgdXAgdG8gUGFs
bWVyCj4+PiB3aGV0aGVyIG9yIG5vdCB3ZSBjYW4gZG8gdGhhdC4KClllcC4gIFRyeWluZyB0byBz
dGljayB0byBvbmx5IHN1cHBvcnRpbmcgd2hhdCBjb3VudHMgYXMgY29uZm9ybWluZyB0b2RheSAK
aXNuJ3QgZ29pbmcgdG8gd29yaywgUklTQy1WIGp1c3QgaXNuJ3QgbWFuYWdlZCB0aGF0IHdheS4g
IFRoYXQncyB3aHkgd2UgCmhhdmUgYWxsIHRoZXNlIHN0cmljdCBydWxlcyBhYm91dCBhdm9pZGlu
ZyBicmVha2luZyB3aGF0IHVzZWQgdG8gd29yayBpbiAKc29mdHdhcmUgbGFuZCwgaWYgd2UgZGlk
bid0IGhhdmUgdGhvc2UgdGhlbiB3ZSBiZSBicmVha2luZyB1c2VycyBldmVyeSAKcmVsZWFzZS4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
