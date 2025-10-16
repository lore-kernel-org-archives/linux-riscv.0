Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32A2ACCD199
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Oct 2025 14:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q7/DrA563YoXxwIAVPNLXc48U9sTaXxNvLBgzp3cTIE=; b=UZb2panZzERI2I
	xqOFhH2M4wyOnzzw/UsHk8DhEmTRT/uure/u4S5qoX3zDn4YGRxokn9ZqAs80KefNAoK5MaqR8QzZ
	dWPlcm0OHOKeyKMwwlC/cBU/pknDfv8myXj97GonImvhVrqmDB3ZlLmDVQXtKXVRLSR138dEqRC3z
	Ygu0mkmnMdRYrj8LPk9Qm58p/rq4Tz2hokD8DSbVf99KeDXmVErgOSHJz/Lb9i1+t5x4oq1/MpANB
	l2xKYsLLJHsO8Aebt9t0U5mzaO+zJFGyLojJetmaro7DLlhtLtbRe3OiIjPZMLn9l56n1p/vZSBbX
	NkfWiSiJyiFGNtJUQ68w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9PLK-000000054iR-19jW;
	Thu, 16 Oct 2025 14:52:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9PLH-000000054gY-1GCX
	for linux-riscv@lists.infradead.org;
	Thu, 16 Oct 2025 14:52:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A00B84AA3C
	for <linux-riscv@lists.infradead.org>; Thu, 16 Oct 2025 14:52:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76F27C19422
	for <linux-riscv@lists.infradead.org>; Thu, 16 Oct 2025 14:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760626354;
	bh=voMrHrP+eiEHoK6WpJLPwqOvwVd3gpO2XDGHiGYz4fc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=n3uwfPCaa/w1vd11OjrfA6PC4kGDdFzTKBnn5qen7ETEDoSDzLOe4dL96VrMU3pci
	 M+ryr7peHybHNQhv9WNnBiaxXxH1zGudbRaZhmTIU8oOl0fm4sVK69mxJaca7hxog7
	 CtmCeiTeGN5t9SvqjQz1oWpeVix1HI1WwP5CKOLhKy+8XxjUr8RzockaMHPHysrQdh
	 0G1oIukrQaz0icDOKh2tHLang0qnn0O94Bv/EKjSuY6L5Pj74JdsE3v1iz/hkn/Gvw
	 G5W6CQguRRIR2fms/ppXsiFuRGgWOb68+r4kqC38jMpaz/A8B2roaPEjD4Xwl9iPcX
	 /W5MvIsfRRDeg==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-57bd04f2e84so1051987e87.1
        for <linux-riscv@lists.infradead.org>; Thu, 16 Oct 2025 07:52:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWYf+jR7yvsO2o4OrFaWd7p4Eyeeo0390TSCRlivxLSubDesIyCgItgt2dBxZBJNe7fGmM9IBh/1MfYKQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YweWz7YwvmJyOBl7ZjCX+YfzX1FeqCXV/iqdchqkTFHLu4JV58F
	qP93TCR4UdXDWZrlmnt5dwhkQhjKLhsFVZCY1W1vrEAwrnTvqSRSrOHkTBknA+YiMvToTb80qca
	geY36n+g8jQ8R645N6CUuEGsAPTLCLVg=
X-Google-Smtp-Source: AGHT+IExXYSyhYvIi8ji93wL4Ay4g8SIGKcbWu0lYZQJZ6G+i03LGkUOD03sda0e8uyyAoxsbSpe9f2IBUycSF0CisI=
X-Received: by 2002:a05:6512:1113:b0:585:48b2:95aa with SMTP id
 2adb3069b0e04-591d84feb7amr147281e87.15.1760626352708; Thu, 16 Oct 2025
 07:52:32 -0700 (PDT)
MIME-Version: 1.0
References: <8091e8fa-3483-af39-2f7a-e4eb62b0944f@loongson.cn>
 <CAAhV-H4+UGLSkbjHbq9MerWfxnq0a13x+uzNfTsCoe1UxjbWsg@mail.gmail.com>
 <CAMj1kXH-rK0bRyHXdJ-crAyMyvJHApH0WR7_8Qd8vrSPBLK+yg@mail.gmail.com>
 <0c9b8e6a-96a6-91d4-946f-2109f48a529b@loongson.cn> <CAAhV-H41m96fvEWG5NqAE=tykPjyzt=50CseJDeCqdG-c_WMrQ@mail.gmail.com>
 <CAMj1kXEs5=VRi_rJwgHUrQWos-27PBbr3c4fYnmkV8Ahi8HZgw@mail.gmail.com>
 <CAAhV-H7HN128du-b1Rk_9qbYBq7gMSwo0s31909N4pTou6wzew@mail.gmail.com>
 <CAMj1kXGvSnCMRVCW7eAxgLRWMEV3QRj3Dqg3PmZchZJNpnLK9w@mail.gmail.com>
 <CAAhV-H4UKdso0BokAqvjYeBLr-jbjFAaQX4z=1ztpBamqrOEEg@mail.gmail.com>
 <CAMj1kXEXDC_oq4aWbkR5dqYBix2d1xJEdaj-v747e1nOA0Q_Yg@mail.gmail.com> <rhnei6wovxmoqs36wdysomfsul3faxtmgde73wrrqdt3qo3b2j@akd7vzne76rq>
In-Reply-To: <rhnei6wovxmoqs36wdysomfsul3faxtmgde73wrrqdt3qo3b2j@akd7vzne76rq>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 16 Oct 2025 16:52:20 +0200
X-Gmail-Original-Message-ID: <CAMj1kXF+hDJy0vRWNgwoijHxvA-scvhGODMj9A3dv19v3jf2yw@mail.gmail.com>
X-Gm-Features: AS18NWA_66xpVdmKirMeIgw03wHK87OPCcvcMoX2mNDeb8mX8YKeO5fzBX6f5tc
Message-ID: <CAMj1kXF+hDJy0vRWNgwoijHxvA-scvhGODMj9A3dv19v3jf2yw@mail.gmail.com>
Subject: Re: [PATCH v2] efistub: Only link libstub to final vmlinux
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>, Tiezhu Yang <yangtiezhu@loongson.cn>, 
	loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-efi@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_075235_377715_FE7B9D20 
X-CRM114-Status: GOOD (  39.99  )
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

T24gVHVlLCAxNCBPY3QgMjAyNSBhdCAxODo0NywgSm9zaCBQb2ltYm9ldWYgPGpwb2ltYm9lQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gTW9uLCBPY3QgMTMsIDIwMjUgYXQgMDQ6MzY6NDlQTSAr
MDIwMCwgQXJkIEJpZXNoZXV2ZWwgd3JvdGU6Cj4gPiBPbiBNb24sIDEzIE9jdCAyMDI1IGF0IDE2
OjA5LCBIdWFjYWkgQ2hlbiA8Y2hlbmh1YWNhaUBrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4gT24g
U2F0LCBPY3QgMTEsIDIwMjUgYXQgMTE6NTnigK9QTSBBcmQgQmllc2hldXZlbCA8YXJkYkBrZXJu
ZWwub3JnPiB3cm90ZToKPiA+ID4gPiBJdCBpcyBhbiBvYmp0b29sIGlzc3VlIGluIGVzc2VuY2Uu
Cj4gPiA+ID4KPiA+ID4gPiBUaGUgZ2VuZXJhdGVkIGNvZGUgbG9va3MgbGlrZSB0aGlzCj4gPiA+
ID4KPiA+ID4gPiA5MDAwMDAwMDAxNzQzMDgwOiBmZiBiNyBmZSA1NyAgIGJsICAgICAgLTMzMiA8
X19lZmlzdHViX2tlcm5lbF9lbnRyeV9hZGRyZXNzPgo+ID4gPiA+IDkwMDAwMDAwMDE3NDMwODQ6
IDI2IDAzIGMwIDI4ICAgbGQuZCAgICAkYTIsICRzMiwgMAo+ID4gPiA+IDkwMDAwMDAwMDE3NDMw
ODg6IDg3IDAwIDE1IDAwICAgbW92ZSAgICAkYTMsICRhMAo+ID4gPiA+IDkwMDAwMDAwMDE3NDMw
OGM6IDA0IDA0IDgwIDAzICAgb3JpICAgICAkYTAsICR6ZXJvLCAxCj4gPiA+ID4gOTAwMDAwMDAw
MTc0MzA5MDogYzUgMDIgMTUgMDAgICBtb3ZlICAgICRhMSwgJGZwCj4gPiA+ID4gOTAwMDAwMDAw
MTc0MzA5NDogZTEgMDAgMDAgNGMgICBqaXJsICAgICRyYSwgJGEzLCAwCj4gPiA+ID4KPiA+ID4g
PiA5MDAwMDAwMDAxNzQzMDk4IDxfX2VmaXN0dWJfZXhpdF9ib290X2Z1bmM+Ogo+ID4gPiA+IDkw
MDAwMDAwMDE3NDMwOTg6IDYzIGMwIGZmIDAyICAgYWRkaS5kICAkc3AsICRzcCwgLTE2Cj4gPiA+
ID4KPiA+ID4gPiBUaGVyZSBpcyBub3RoaW5nIHdyb25nIHdpdGggdGhpcyBjb2RlLCBnaXZlbiB0
aGF0IHRoZSBpbmRpcmVjdCBjYWxsIGlzCj4gPiA+ID4gdG8gYSBfX25vcmV0dXJuIGZ1bmN0aW9u
LCBhbmQgc28gdGhlIGZhY3QgdGhhdCBpdCBmYWxscyB0aHJvdWdoIGludG8KPiA+ID4gPiBfX2Vm
aXN0dWJfZXhpdF9ib290X2Z1bmMoKSBpcyBub3QgYSBwcm9ibGVtLgo+ID4gPiA+Cj4gPiA+ID4g
RXZlbiB0aG91Z2ggdGhlIGNvbXBpbGVyIGRvZXMgbm90aGluZyB3cm9uZyBoZXJlLCBpdCB3b3Vs
ZCBiZSBuaWNlIGlmCj4gPiA+ID4gaXQgd291bGQgZW1pdCBzb21lIGtpbmQgb2YgVUQgb3IgQlJL
IGluc3RydWN0aW9uIGFmdGVyIHN1Y2ggYSBjYWxsLCBpZgo+ID4gPiA+IG9ubHkgdG8gbWFrZSB0
aGUgYmFja3RyYWNlIG1vcmUgcmVsaWFibGUuIEJ1dCB0aGUgY29kZSBpcyBmaW5lLCBhbmQKPiA+
ID4gPiBvYmp0b29sIHNpbXBseSBkb2VzIG5vdCBoYXZlIHRoZSBpbmZvcm1hdGlvbiBpdCBuZWVk
cyB0byBkZXRlcm1pbmUKPiA+ID4gPiB0aGF0IHRoZSBpbmRpcmVjdCBjYWxsIGlzIG9mIGEgdmFy
aWV0eSB0aGF0IG5ldmVyIHJldHVybnMuCj4gPiA+IFNvIHRoZSBiZXN0IHdheSBpcyB0byBmaXgg
dGhlIG9ianRvb2w/Cj4gPiA+Cj4gPgo+ID4gSSB0aGluayB0aGUgYmVzdCBzb2x1dGlvbiBpcyB0
byBmaXggdGhlIGNvbXBpbGVyLCBhbmQgZW5zdXJlIHRoYXQgY2FsbAo+ID4gaW5zdHJ1Y3Rpb25z
IGFyZSBhbHdheXMgZm9sbG93ZWQgYnkgc29tZSB1bmRlZmluZWQgb3IgZGVidWcvYnJlYWsKPiA+
IG9wY29kZS4gVGhpcyB3b3JrcyBhcm91bmQgdGhpcyBwcm9ibGVtLCBidXQgaXQgYWxzbyBlbnN1
cmVzIHRoYXQgdGhlCj4gPiByZXR1cm4gYWRkcmVzcyBkb2VzIG5vdCBwb2ludCB0byB0aGUgd3Jv
bmcgZnVuY3Rpb24sIHdoaWNoIG1heSBjYXVzZQo+ID4gY29uZnVzaW9uIGluIGJhY2t0cmFjZXMu
Cj4KPiBJIHRoaW5rIHRoZSBjb21waWxlciBmb2xrcyB3aWxsIHNheSB0aGF0J3Mgd29ya2luZyBh
cyBkZXNpZ25lZC4gIFRoZQo+IHdob2xlIHBvaW50IG9mIF9fbm9yZXR1cm4gaXMgdG8gZWxpbWlu
YXRlIHVuZWNlc3NhcnkgY29kZSBhZnRlciB0aGUKPiBjYWxsLgo+Cj4gVW53aW5kZXJzIGFyZSBh
bHJlYWR5IGRlc2lnbmVkIHRvIGhhbmRsZSB0aGF0IGNhc2UgYW55d2F5Lgo+Cj4gSWYgeW91IGRv
bid0IHdhbnQgdG8gb3B0aW1pemUgb3V0IHRoZSBjb2RlIGFmdGVyIHRoZSBjYWxsIHRoZW4ganVz
dAo+IHJlbW92ZSB0aGUgX19ub3JldHVybiBhbm5vdGF0aW9uIGZyb20gdGhlIGZ1bmN0aW9uIHBv
aW50ZXIuCj4KPiA+ID4gPiBTbyBJIGRvbid0IG1pbmQgZml4aW5nIGl0IGluIHRoZSBjb2RlLCBi
dXQgb25seSBmb3IgTG9vbmdBcmNoLCBnaXZlbgo+ID4gPiA+IHRoYXQgdGhlIHByb2JsZW0gZG9l
cyBub3QgZXhpc3Qgb24gYXJtNjQgb3IgUklTQy1WLgo+ID4gPiBZb3UgYmVsaWV2ZSB0aGlzIHBy
b2JsZW0gd29uJ3QgZXhpc3QgZXZlbiBpZiB0aGV5IGFkZCBvYmp0b29sIHN1cHBvcnQKPiA+ID4g
KGJlY2F1c2UgdGhlaXIgb2JqdG9vbCB3aWxsIGJlIHNhbmUpPwo+ID4gPgo+ID4KPiA+IEl0IGRl
cGVuZHMgb24gdGhlIGNvbXBpbGVyLgo+Cj4gSSBkb24ndCB0aGluayBzbywgYWxsIGNvbXBpbGVy
cyBkbyB0aGlzLi4uCj4KPiBNeSBzdWdnZXN0aW9uICh3aGljaCBwcm9tcHRlZCB0aGlzIHYyIHBh
dGNoKSB3YXMgdG8gbW92ZSB0aGUgbGlic3R1Ygo+IGNvZGUgb3V0IG9mIHZtbGludXgubyAoYnV0
IHN0aWxsIGtlZXAgaXQgaW4gdm1saW51eCksIHRvIG1ha2UgaXQKPiBjb25zaXN0ZW50IHdpdGgg
d2hhdCB4ODYgYWxyZWFkeSBkb2VzLgo+CgpUaGlzIGlzIGJlY2F1c2UgeDg2IGxpbmtzIHRoZSBF
Rkkgc3R1YiBpbnRvIHRoZSBkZWNvbXByZXNzb3IsIG5vdCBpbnRvIHZtbGludXguCgo+IFRoZSBp
ZGVhIGlzIHRoYXQgbGlic3R1YiBjb2RlIGRvZXNuJ3QgYmVsb25nIGluIHZtbGludXgubyBiZWNh
dXNlIGl0J3MKPiBub3QgYSBwYXJ0IG9mIHRoZSBrZXJuZWwgcHJvcGVyLCBhbmQgZG9lc24ndCBu
ZWVkIHRvIGJlIHZhbGlkYXRlZCBvcgo+IG1vZGlmaWVkIGJ5IG9ianRvb2wgZm9yIGFueSByZWFz
b24uCj4KCkkgZG9uJ3Qgc2VlIGEgcmVhc29uIHRvIGNoYW5nZSB0aGlzIG9uIGFyY2hpdGVjdHVy
ZXMgdGhhdCBhKSBkbyBub3QKdXNlIG9ianRvb2wgYW5kIGIpIGxpbmsgdGhlIEVGSSBzdHViIGlu
dG8gdm1saW51eC4gSWYgTG9vbmdBcmNoIHdhbnRzCnRvIGNoYW5nZSB0aGlzLCB0aGF0IGlzIGZp
bmUsIGJ1dCB0aGF0IHN0aWxsIGRvZXMgbm90IG1lYW4gaXQgbmVlZHMgdG8KY2hhbmdlIG9uIG90
aGVyIGFyY2hpdGVjdHVyZXMgdG9vLgoKRUZJIHJlbGF0ZWQgYm9vdCBlcnJvcnMgYXJlIGEgbmln
aHRtYXJlIHRvIGRlYnVnLCBhbmQgSSB3aWxsIGJlIHRoZQpvbmUgZ2V0dGluZyB0aGUgcmVwb3J0
cyB3aGVuIHRoaXMgcmVncmVzc2VzIGFybTY0IG9uIGhhcmR3YXJlIHRoYXQgMgpwZW9wbGUgb24g
dGhlIHBsYW5ldCBoYXZlIGFjY2VzcyB0by4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
