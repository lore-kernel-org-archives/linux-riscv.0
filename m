Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3EFCCFD315
	for <linux-riscv@archiver.kernel.org>; Sun, 23 Nov 2025 02:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Aa2S/fqQmphoSKvJ474I+NDFO+yiCAYir8Ypq18atZw=; b=FyV7l+ya52KV+z
	oRZzsjcurhGmC4KZKJ9N9K/sAMybCcyNG1d/xpI2DPsjcizL+x7/GCH4kQHBoj+IGTPGEXBgzJLpZ
	MiBm/HBa6EfQ3AlOpnaG4yFPlx1V5A4WEoEdlzhHwLdAbnhWHzjpOF9p93CS7IQIbdW0ClcYthbVw
	IBjMumJ9HD6rILbj9xrF8ALEtnAC+RLSLhGDArGFwmIp/HmeYZHQgxE7CP3i/6rlGCfSF6MPxkq7a
	hYCZEL3zucTmJIdhCJ4Ch1y3JiEbV0Y78GowNLb1dzeNkWW0u/aH3OtNTziFtDts2VncqqUPBi3sB
	hi7gr5UH12EU7WCfP3Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMzqa-0000000A3tr-42r1;
	Sun, 23 Nov 2025 02:29:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMzqY-0000000A3te-3B24
	for linux-riscv@lists.infradead.org;
	Sun, 23 Nov 2025 02:29:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D1B056013C
	for <linux-riscv@lists.infradead.org>; Sun, 23 Nov 2025 02:29:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3878CC116C6
	for <linux-riscv@lists.infradead.org>; Sun, 23 Nov 2025 02:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763864941;
	bh=5/gE9+3vHOoB1f8yml6mnDnZO5OsQRxggIUPttmfMEI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lSkynLBVL7qbBWmP7VIrRx09zE8Ng0gBmoadl+PInPMq+4lFWJmeMmAgdjGxGV9Q4
	 nMmQsSLfPGz283G1TBASqmUaA0hSUvc7EuBSpcxU2UzLEW2mvUpAhkP26dcAcwu0C1
	 bFOYmIVd/0XCG4sQbdwGEywoIYs4WXHc6eHigLBK/MFXyBCSIhfmHU4SKMnb3PW03p
	 VC1UGiJ7B5n0YlLVsgWG6v3Wf5fSoRR0MvHnIKxmC+rxkO6N6LdLBck0MU0MuNzlJo
	 y2F0FO4XTTyBGU+G7dFmuiEOrFBgptYD0gG9hMFRjg93a/mlLse1zNSvIY0mYYjpDQ
	 B3+DHfCj797ww==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b735b89501fso366154366b.0
        for <linux-riscv@lists.infradead.org>; Sat, 22 Nov 2025 18:29:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX3B3lQcE24MM5horBEv9Qwz3852AL9ImlrxbHtKl+GcFyImn+NruvmX9WNL/ptOFKxGqln+bRMMDBlRQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxPZ0WbIupUcCqjyG1M3kirAWbEIf2bzq9STX0e42onGNtTI8GE
	3sNSOOrntPXuWrGySSLqgw10ZcMQ46wHdWxxL+pt0u/cyUSXKnwfKUowHJhoY7mAjkSYhnEoVm8
	z8tW9e70kQUolGzdP6D4NPMS6s+zxDCs=
X-Google-Smtp-Source: AGHT+IF2NG45CGhewRb+YxxwCpQ+Qs09Wv1Cd6UcCR2RSlep4aU6EwJEltWefiEmVuOu3WrO2PpFhIzvWqq/mYqO3k4=
X-Received: by 2002:a17:907:7f1e:b0:b70:b077:b957 with SMTP id
 a640c23a62f3a-b767158cd7amr622544566b.15.1763864939736; Sat, 22 Nov 2025
 18:28:59 -0800 (PST)
MIME-Version: 1.0
References: <CAAhV-H6m5vszCyiF3qi94cpHBPVuqM2xH93D=gfsQqOSYvC-sA@mail.gmail.com>
 <33612d85-e70b-26da-8460-ea6b9064ce08@loongson.cn> <CAAhV-H5ZSTFDxvm-W1CrgEoQ5d_jw5yVsfetQ_J_qL5pqLtzgg@mail.gmail.com>
 <CAMj1kXGk0udgM67wrWqahqK8H0uE8emQj51SmJey+7fE-FTjdA@mail.gmail.com>
 <CAAhV-H4c=vdNWO0v_mYL2xZ9FYjDyRDvt6f_kV4d8Bh=CRJniQ@mail.gmail.com>
 <CAMj1kXEaxxcWTTANWeEMNjYDymdL5Fxy2B=XBF4RGtteEkfinw@mail.gmail.com>
 <421c08e1-255b-447b-b5e3-ee6544fbefd2@loongson.cn> <CAAhV-H5KsFShDJ_Cxu+1_ces8oojn8+S-7PLmE7aUj8gX5_GEw@mail.gmail.com>
 <32s3lvzfu6jkyho7qenrqbsm5wkgjnzn2imdp6tfwycmyxpzgu@kg5367uxmxii>
 <CAAhV-H47fzaKcMhgLWWOTxB+srBsg85-eK0LW1vQXQnvq32-+w@mail.gmail.com>
 <aRsH7RTpAah4g5Xr@willie-the-truck> <CAAhV-H4AasfFet_Gi_mVyte3RPMH3qBS73dBfF-=Gd7HJ6ZPEw@mail.gmail.com>
 <39617a3e-c476-abac-8425-bbcece769cdb@loongson.cn>
In-Reply-To: <39617a3e-c476-abac-8425-bbcece769cdb@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 23 Nov 2025 10:29:02 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4fHBuRpDEDQrExApgnREJaT8JWUJ2700bEPFxDqToi2w@mail.gmail.com>
X-Gm-Features: AWmQ_bmAZrJIPzwBoGQGazI9CFQ9PH-O_LgSCm_k_cIQ90BdG2Wz9hDhqi3Uewg
Message-ID: <CAAhV-H4fHBuRpDEDQrExApgnREJaT8JWUJ2700bEPFxDqToi2w@mail.gmail.com>
Subject: Re: [PATCH v2] efistub: Only link libstub to final vmlinux
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Will Deacon <will@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	"Madhavan T. Venkataraman" <madvenka@linux.microsoft.com>, Ard Biesheuvel <ardb@kernel.org>, 
	loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-efi@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>
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

T24gU2F0LCBOb3YgMjIsIDIwMjUgYXQgNzowNOKAr1BNIFRpZXpodSBZYW5nIDx5YW5ndGllemh1
QGxvb25nc29uLmNuPiB3cm90ZToKPgo+IENjOiBOYXRoYW4gQ2hhbmNlbGxvciA8bmF0aGFuQGtl
cm5lbC5vcmc+Cj4KPiBIaSBhbGwsCj4KPiBPbiAxMS8yMS8yNSAyMjozNiwgSHVhY2FpIENoZW4g
d3JvdGU6Cj4gPiBPbiBNb24sIE5vdiAxNywgMjAyNSBhdCA3OjMz4oCvUE0gV2lsbCBEZWFjb24g
PHdpbGxAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPj4KPiA+PiBPbiBTYXQsIE5vdiAxNSwgMjAyNSBh
dCAxMToxNjo0MkFNICswODAwLCBIdWFjYWkgQ2hlbiB3cm90ZToKPiA+Pj4gT24gV2VkLCBOb3Yg
MTIsIDIwMjUgYXQgMjowMOKAr0FNIEpvc2ggUG9pbWJvZXVmIDxqcG9pbWJvZUBrZXJuZWwub3Jn
PiB3cm90ZToKPiA+Pj4+Cj4gPj4+PiBPbiBNb24sIE5vdiAxMCwgMjAyNSBhdCAwMzowMDowMFBN
ICswODAwLCBIdWFjYWkgQ2hlbiB3cm90ZToKPiA+Pj4+PiBPbiBNb24sIE5vdiAxMCwgMjAyNSBh
dCA5OjE54oCvQU0gVGllemh1IFlhbmcgPHlhbmd0aWV6aHVAbG9vbmdzb24uY24+IHdyb3RlOgo+
ID4+Pj4+PiBJZiBJIHVuZGVyc3RhbmQgY29ycmVjdGx5LCBJIHNob3VsZCBtb2RpZnkgdGhpcyBw
YXRjaCB0byByZW1vdmUgdGhlCj4gPj4+Pj4+IGNoYW5nZXMgb2YgYXJtIGFuZCByaXNjdiBmb3Ig
bm93LCBkbyB0aGUgY2hhbmdlcyBvbmx5IHdoZW4gdGhlcmUgaXMKPiA+Pj4+Pj4gYSByZWFsIHBy
b2JsZW0gb3IgcmVxdWlyZW1lbnQgc29tZSBkYXksIHJpZ2h0PyBJZiBubyBtb3JlIGNvbW1lbnRz
LAo+ID4+Pj4+PiBJIHdpbGwgc2VuZCB2MyBsYXRlci4KPiA+Pj4+Pgo+ID4+Pj4+IE5vdyBldmVy
eW9uZSBpbnZvbHZlZCBhZ3JlZXMgdGhhdCB0aGUgZWZpc3R1YiBjb2RlIGlzIGNvcnJlY3QsIHNv
IHRoZQo+ID4+Pj4+IHByb3BlciBzb2x1dGlvbiBpcyB0byBmaXggdGhlIGNvbXBpbGVyLgo+ID4+
Pj4KPiA+Pj4+IEhtPyAgSSBkb24ndCBzZWUgaG93IGl0J3MgYSBjb21waWxlciBidWcuICBJdCdz
IHJlYWxseSBqdXN0IGFuIG9ianRvb2wKPiA+Pj4+IGxpbWl0YXRpb24uCj4gPj4+Pgo+ID4+Pj4+
IENoYW5naW5nIGVmaXN0dWIgY29kZSBhbmQgY2hhbmdpbmcgb2JqdG9vbCAoaWdub3JlIF9fZWZp
c3R1YiBwcmVmaXgpCj4gPj4+Pj4gYXJlIGJvdGggd29ya2Fyb3VuZHMsIGJ1dCBJIHRoaW5rIGNo
YW5naW5nIG9ianRvb2wgaXMgYSBsaXR0bGUgbW9yZQo+ID4+Pj4+IHJlYXNvbmFibGUuIE1heWJl
IEpvc2ggaGFzIGRpZmZlcmVudCBpZGVhcz8KPiA+Pj4+Cj4gPj4+PiBJIHRob3VnaHQgdGhlIGNv
bnZlcnNhdGlvbiBoYWQgY29udmVyZ2VkIG9uIHdoYXQgVGllemh1IG1lbnRpb25lZCBhYm92ZSwK
PiA+Pj4+IHdoaWNoIGlzIHRvIHNraXAgb2JqdG9vbCBvbiBsaWJzdHViIGZvciBsb29uZ2FyY2gs
IGJ1dCBsZWF2ZSB0aGUgb3RoZXIKPiA+Pj4+IGFyY2hlcyBhbG9uZS4gIFRoYXQgd2F5IG9ianRv
b2wgYmVoYXZpb3IgaXMgY29uc2lzdGVudCBiZXR3ZWVuIGxvb25nYXJjaAo+ID4+Pj4gYW5kIHg4
NiwgYW5kIG9ianRvb2wgZG9lc24ndCBuZWVkIHRvIGlnbm9yZSBhbnkgcHJlZml4ZXMuCj4gPj4+
Pgo+ID4+Pj4gU28gYmFzaWNhbGx5LCB0aGUgdjIgcGF0Y2ggbWludXMgdGhlIGFybTY0L3Jpc2N2
IGNoYW5nZXMuCj4gPj4+Cj4gPj4+IEhpLCBBUk02NCBhbmQgUklTQy1WIG1haW50YWluZXJzLAo+
ID4+Pgo+ID4+PiBXb3VsZCB5b3UgbWluZCB0aGF0IHRoaXMgcGF0Y2ggbW9kaWZpZXMgdGhlIHRo
cmVlIGFyY2hpdGVjdHVyZXMKPiA+Pj4gdG9nZXRoZXIgKHRoZXkgYXJlIGV4YWN0bHkgdGhlIHNh
bWUgc3R5bGUgbm93KT8KPiA+Pj4KPiA+Pj4gTWFkaGF2YW4gaXMgdGhlIGF1dGhvciBvZiBBUk02
NCdzIG9ianRvb2wsIEkgdGhpbmsgeW91ciBvcGluaW9uIGlzCj4gPj4+IGFsc28gdmVyeSBpbXBv
cnRhbnQuCj4gPj4KPiA+PiBhcm02NCBkb2Vzbid0ICh5ZXQpIHVzZSBvYmp0b29sLgo+ID4+Cj4g
Pj4gSSBkZWZlciB0byBBcmQgb24gYW55dGhpbmcgcmVsYXRpbmcgdG8gdGhlIGFybTY0IGVmaXN0
dWIuIFJlYWRpbmcgdGhlCj4gPj4gc3RhcnQgb2YgdGhpcyB0aHJlYWQsIGl0IGRvZXNuJ3QgbG9v
ayBsaWtlIGhlJ3MgY29udmluY2VkIGFuZCBJJ20gbm90Cj4gPj4gc3VycHJpc2VkIGlmIGl0J3Mg
cHVyZWx5IGFuIGlzc3VlIHdpdGggb2JqdG9vbC4KPiA+IE9LLCBJIGtub3csIGJ1dCBJIGhhdmUg
YSBjb25jZXJuLgo+ID4KPiA+IEFyZCBzYWlkIHRoYXQgaGUgaXMgcmVsdWN0YW50IHRvIG1ha2Ug
Y2hhbmdlcyB0byBhY2NvbW1vZGF0ZSBhIGZsYXdlZAo+ID4gYnVpbGQgdGltZSB0b29sIGFuZCB0
aGVyZSBtYXkgYmUgcmVncmVzc2lvbiByaXNrLgo+ID4KPiA+IFNvLCBJJ20gYWxzbyByZWx1Y3Rh
bnQgYW5kIGRvbid0IHdhbnQgTG9vbmdBcmNoIHRvIG1lZXQgcmVncmVzc2lvbgo+ID4gcmlzay4g
SWYgb25lIGRheSBMb29uZ0FyY2ggaGFzIGEgcmVncmVzc2lvbiwgd2UgcHJvYmFibHkgbmVlZCBh
bm90aGVyCj4gPiB3b3JrYXJvdW5kIHRvICJmaXgiIHRoaXMgd29ya2Fyb3VuZC4gQnV0IGlmIHRo
ZXNlIHRocmVlIGFyY2hpdGVjdHVyZXMKPiA+IGNoYW5nZSBpbiB0aGUgc2FtZSB3YXksIHdlIG1h
eSBoYXZlIGEgY2hhbmNlIHRvIHNvbHZlIHNvbWUgZnVuZGFtZW50YWwKPiA+IHByb2JsZW1zLi4u
Cj4KPiBJSVVDLCBKb3NoIGRvIG5vdCBsaWtlIHRvIGlnbm9yZSB0aGVzZSBFRklTVFVCIGZ1bmN0
aW9ucyBpbgo+IHZhbGlkYXRlX2JyYW5jaCgpIG9mIG9ianRvb2wsIEh1YWNhaSBkbyBub3QgbGlr
ZSB0byBvbmx5IGxpbmsKPiBsaWJzdHViIHRvIHZtbGludXggb25seSBmb3IgTG9vbmdBcmNoLgo+
Cj4gSXQgc2VlbXMgdGhhdCB0aGVyZSBpcyBvbmx5IG9uZSB3YXkgdG8gZml4IG9yIHdvcmthcm91
bmQgdGhpcwo+IHByb2JsZW0sIHJlbW92ZSB0aGUgYXR0cmlidXRlIF9fbm9yZXR1cm4gZm9yIHJl
YWxfa2VybmVsX2VudHJ5KCkKPiBhbmQgdGhlbiBtYWtlIGVmaV9ib290X2tlcm5lbCgpIGVuZHMg
d2l0aCBhIHJldHVybiBpbnN0cnVjdGlvbiBbMV0KPiBvciBhbiB1bmNvbmRpdGlvbmFsIGp1bXAg
aW5zdHJ1Y3Rpb24gWzJdIHRoYXQgb25seSB0b3VjaGVzCj4gZHJpdmVycy9maXJtd2FyZS9lZmkv
bGlic3R1Yi9sb29uZ2FyY2guYy4KPgo+IFNpbmNlIHRoaXMgaXMgYSBpc3N1ZSBvbmx5IGZvciBM
b29uZ0FyY2ggYnkgbm93LCB3aGF0IGRvIHlvdQo+IHRoaW5rIG9mIHRoaXMgbWluaW1hbCBjaGFu
Z2Ugb25seSBmb3IgTG9vbmdBcmNoIGxpYnN0dWIgY29kZT8KPiBVc2luZyAicmV0dXJuIEVGSV9M
T0FEX0VSUk9SIiBbMV0gb3IgIndoaWxlICgxKSIgWzJdPwo+Cj4gTWF5YmUgdGhpcyBpcyB0aGUg
c2ltcGxlIGFuZCBkaXJlY3Qgd2F5IGZvciB0aGlzIHNwZWNpYWwgaXNzdWUKPiBvbmx5IG9uIExv
b25nQXJjaCBzbyBmYXIuIElmIG5vdCwgYW55IG90aGVyIHN1Z2dlc3Rpb25zPwo+Cj4gT24gdGhl
IG90aGVyIGhhbmQsIGlzIGl0IHBvc3NpYmxlIHRvIGFkZCBLQlVJTERfVk1MSU5VWF9MSUJTX0ZJ
TkFMCj4gYW5kIHRoZW4gdXNlIGl0IG9ubHkgZm9yIExvb25nQXJjaCBmaXJzdCBbM10/IEFueSBw
b3RlbnRpYWwgcmlza3M/Cj4KPiBXaGF0IGlzIHRoZSBuZXh0IHN0ZXA/CklzIGl0IHBvc3NpYmxl
IHRvIGltcHJvdmUgb2JqdG9vbCB0aGF0IGNhbiBoYW5kbGUgaW5kaXJlY3QgX19ub3JldHVybiBm
dW5jdGlvbnM/CklzIGl0IHBvc3NpYmxlIHRvIGltcHJvdmUgb2JqdG9vbCB0aGF0IGNhbiBoYW5k
bGUKT0JKRUNUX0ZJTEVTX05PTl9TVEFOREFSRCBldmVudCBMVE8gaXMgZW5hYmxlZD8KSXMgaXQg
cG9zc2libGUgdG8gaW1wcm92ZSBvYmp0b29sIHRoYXQgb25seSBpZ25vcmUgX19lZmlzdHViIHBy
ZWZpeApmb3IgTG9vbmdBcmNoPwoKCkh1YWNhaQoKPgo+IFsxXQo+IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2xvb25nYXJjaC9DQU1qMWtYSC1ySzBiUnlIWGRKLWNyQXlNeXZKSEFwSDBXUjdfOFFk
OHZyU1BCTEsreWdAbWFpbC5nbWFpbC5jb20vCj4gWzJdCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvbG9vbmdhcmNoLzIwMjUwODI2MDY0NjMxLjk2MTctMi15YW5ndGllemh1QGxvb25nc29uLmNu
Lwo+IFszXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9sb29uZ2FyY2gvMjAyNTExMjIwMDAxMDEu
R0ExOTk2MzkxQGF4MTYyLwo+Cj4gVGhhbmtzLAo+IFRpZXpodQo+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
