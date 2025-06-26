Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 292FAC7EE31
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jun 2025 16:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QG2VRVh/nNJpRqXfiBQ+C8snWBi1cEyQ1OZ2YmSNUFI=; b=EV4wFTKPPQJhlr
	ZrNGmW276YVdxDRFRbd7GP0cAH216HRI3LFhVmPGSTvT6dPOLGiEzCvpZPq0A2cZ9XR8xNCQltTKj
	LZaLC8eBjuF9NmdD5Nbm7gW5ACti6bEMknH2+sMqE28X6uaQjPM4nV8d29RbJBVOtDDKhRqsjsM0d
	sbYtLDoSL8QJ0rsj3TlgF+Wrpvyyqji7rQFIT9JSTxN/TK3KI4t2sTxkLGY1ROvHAgll+vwLrHusE
	nG94BLsI1X/0gCJ7EpifZuoUW+zlmFIeD9tl4i0iPGVNIoQ2erUa0/mrD0uyJmQbnWZ9cy+JR2xkp
	j+N0FhEMrm+LJRZihhug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUpNX-0000000CGN6-0Krt;
	Thu, 26 Jun 2025 16:23:11 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUp0k-0000000CCqT-1S2g
	for linux-riscv@lists.infradead.org;
	Thu, 26 Jun 2025 15:59:39 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-237f18108d2so194465ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 26 Jun 2025 08:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750953577; x=1751558377; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WC/3R+pcAWBtvUeAyLoDHu4B6QWb/+D2sN3LBJqBV5s=;
        b=Mqjk7r3ViMHDfKP5lI01orLdwWJxo314zXs5E40ziif3AHA80ef1OgQcrvrcU11dKz
         MZWE05D0Ifn8k2S/43bdsn6TCSJdSU5eG7txsOCqrwS+j/gHEBp0m/+O4AbrHFdfNaqd
         JuVrtgQERlXX6jFJ+Dpt/4Ta5n+6NJxjElLhM9Jp8s58VKAiSnN1iOL1DJIJ4jtj/OSC
         ZbKnexgjjo5z86VNpluw8S1Nldc/91C19GJG+o49Wi7dkJ/PORUyelJkL5KPPo6og51a
         GHiNrBpex6qNlz2VcY83gG1FY6opgAnDvEjfFSwfK9kOMJb6nS3yZSpJnHAjmPaZP2LK
         9H5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750953577; x=1751558377;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WC/3R+pcAWBtvUeAyLoDHu4B6QWb/+D2sN3LBJqBV5s=;
        b=G/vlUCBQyY49jpKA5G/lL3Vrc1Ea1PbR9HLYFHHTMx7z4wzDckv8+Kmi0Y6DEvTDP8
         l5BFO1PhvMCjGH/4FqAbzA8sGAOypTUaOZVs5jyIkX9q6VraAsOge2NnpzUUmaf50qsK
         dcsj8h8oLvC8+XT8CDKxjZj+WOO/s172Po+IXFlidoaNzt6PDTeAl/CKuFdi6Qz7KA4f
         JkcuwZ04OnESdSMbGoFz4ftrs65kzssme+cft/Yn/+8rwg7bB4aNDP/r/8Kott83GIIE
         4AWDN1pnL7iuxCqbpYca8kmUN0MueHAhC5ZnJfIzlhzx5QbLOgRNDFEHNejCBjnTCHrV
         kEhA==
X-Forwarded-Encrypted: i=1; AJvYcCVQ+ZFzZ4EHabFhrJfuWs9bPb6xr3kpu373iWqulqDrvBZ0YIze1POSdfmtHxcr3slq9cN6rLe3g1iVEA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9d3mN23bPGRbWyqKlfzNNqoU0i7IBjFsLfE26aK7O5Tk1I9mA
	BooVSYzIeKwDVRYH5yMx3yVC7wVA+KQa/XGG7dBrphDl5o+af6BDJJ3Cc78o9vB0rycMEj0cN8g
	7jKYMnV9A9/eCkZ9LAQP97bgg/rI8DwqW9YR+mgss
X-Gm-Gg: ASbGncv5SZAEyZBFl0EjJIxZOFgbyOleappMoCFGDebaPfX43vg2r0z+GIVGkwYrxqy
	mqT0pTdUHCAYMvO1Ed6XUohfwSWgXL5uyWq/uPlmRjguQTjGBzj8d4Xw3eQjKW88nrO2GnNPx6m
	lpLcQqT8vZHretsWn3+qyiU7FGDTGxzjB7rwASiG0W
X-Google-Smtp-Source: AGHT+IF2p1WE73jKvkXVXZWjWgFxpPCR6rlrCBZMmFy7FYCzSLm2RG/NI//tfCBmD/SuJcLL7aEhsEqWJ1Is9nWqPM4=
X-Received: by 2002:a17:902:f707:b0:237:e45b:4f45 with SMTP id
 d9443c01a7336-23ac11da2a2mr120275ad.1.1750953576332; Thu, 26 Jun 2025
 08:59:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250611033150.396172-2-zhihang.shao.iscas@gmail.com>
 <20250624035057.GD7127@sol> <48de9a74-58e8-49c2-8d8a-fa9c71bf0092@cryptogams.org>
 <20250625035446.GC8962@sol>
In-Reply-To: <20250625035446.GC8962@sol>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 26 Jun 2025 08:58:58 -0700
X-Gm-Features: Ac12FXwsU4Wn8eArYOkWWdc99aXTmSYYqionP-IFhI0v3zXA_4B74OkFhGvuLvE
Message-ID: <CABCJKudbdWThfL71L-ccCpCeVZBW7Yhf3JXo9FvaPboRVaXOyg@mail.gmail.com>
Subject: Re: [PATCH v4] crypto: riscv/poly1305 - import OpenSSL/CRYPTOGAMS implementation
To: Eric Biggers <ebiggers@kernel.org>
Cc: Andy Polyakov <appro@cryptogams.org>, Zhihang Shao <zhihang.shao.iscas@gmail.com>, 
	linux-crypto@vger.kernel.org, linux-riscv@lists.infradead.org, 
	herbert@gondor.apana.org.au, paul.walmsley@sifive.com, alex@ghiti.fr, 
	zhang.lyra@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_085938_383020_1D386214 
X-CRM114-Status: GOOD (  20.94  )
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

T24gVHVlLCBKdW4gMjQsIDIwMjUgYXQgODo1NuKAr1BNIEVyaWMgQmlnZ2VycyA8ZWJpZ2dlcnNA
a2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUdWUsIEp1biAyNCwgMjAyNSBhdCAxMToxMzo0OUFN
ICswMjAwLCBBbmR5IFBvbHlha292IHdyb3RlOgo+ID4gPiA+ICsuZ2xvYmwgICBwb2x5MTMwNV9p
bml0Cj4gPiA+ID4gKy50eXBlICAgIHBvbHkxMzA1X2luaXQsXEBmdW5jdGlvbgo+ID4gPiA+ICtw
b2x5MTMwNV9pbml0Ogo+ID4gPiA+ICsjaWZkZWYgICBfX3Jpc2N2X3ppY2ZpbHAKPiA+ID4gPiAr
IGxwYWQgICAgMAo+ID4gPiA+ICsjZW5kaWYKPiA+ID4KPiA+ID4gVGhlICdscGFkJyBpbnN0cnVj
dGlvbnMgYXJlbid0IHByZXNlbnQgaW4gdGhlIHVwc3RyZWFtIENSWVBUT0dBTVMgc291cmNlLgo+
ID4KPiA+IFRoZXkgYXJlLgo+Cj4gSSBub3cgc2VlIHRoZSBsYXRlc3QgdmVyc2lvbiBkb2VzIGhh
dmUgdGhlbS4gIEhvd2V2ZXIsIHRoZSBkZXNjcmlwdGlvbiBvZiB0aGlzCj4gcGF0Y2ggZXhwbGlj
aXRseSBzdGF0ZXMgaXQgd2FzIHRha2VuIGZyb20gQ1JZUFRPR0FNUyBjb21taXQKPiAzM2ZlODRi
YzIxMjE5YTE2ODI1NDU5YjM3YzgyNWJmNDU4MGEwYTdiLiAgV2hpY2ggaXMgb2YgY291cnNlIHRo
ZSBvbmUgSSBsb29rZWQKPiBhdCwgYW5kIGl0IGRpZCBub3QgaGF2ZSB0aGVtLiAgU28gdGhlIHBh
dGNoIGRlc2NyaXB0aW9uIGlzIHdyb25nLgo+Cj4gPiA+IElmIHRoZXkgYXJlIG5lY2Vzc2FyeSwg
dGhpcyBhZGRpdGlvbiBuZWVkcyB0byBiZSBkb2N1bWVudGVkLgo+ID4gPgo+ID4gPiBCdXQgdGhl
eSBhcHBlYXIgdG8gYmUgdW5uZWNlc3NhcnkuCj4gPgo+ID4gVGhleSBhcmUgYmV0dGVyIGJlIHRo
ZXJlIGlmIENvbnRyb2wgRmxvdyBJbnRlZ3JpdHkgaXMgb24uIEl0J3MgdGhlIHNhbWUgZGVhbAo+
ID4gYXMgd2l0aCBlbmRicmFuY2ggaW5zdHJ1Y3Rpb24gb24gSW50ZWwgYW5kIGhpbnQgIzM0IG9u
IEFSTS4gSXQncyBwb3NzaWJsZQo+ID4gdGhhdCB0aGUga2VybmVsIG5ldmVyIGVuZ2FnZXMgQ0ZJ
IGZvciBpdHNlbGYsIGluIHdoaWNoIGNhc2UgYWxsIHRoZQo+ID4gbWVudGlvbmVkIGluc3RydWN0
aW9ucyBhcmUgZXhlY3V0ZWQgYXMgbm9wLXMuIEJ1dCBub3RlIHRoYXQgaGVyZSB0aGV5IGFyZQo+
ID4gY29tcGlsZWQgY29uZGl0aW9uYWxseSwgc28gdGhhdCBpZiB5b3UgZG9uJ3QgY29tcGlsZSB0
aGUga2VybmVsIHdpdGgKPiA+IC1tYXJjaD0uLi5femljZmlscF8uLi4sIHRoZW4gdGhleSB3b24n
dCBiZSB0aGVyZS4KPgo+IFRoZXJlIGFwcGVhcnMgdG8gYmUgbm8ga2VybmVsLW1vZGUgc3VwcG9y
dCBmb3IgWmljZmlscCB5ZXQuICBUaGlzIHdvdWxkIGJlIHRoZQo+IHZlcnkgZmlyc3Qgb2NjdXJy
ZW5jZSBvZiB0aGUgbHBhZCBpbnN0cnVjdGlvbiBpbiB0aGUga2VybmVsIHNvdXJjZS4KCk9mIGNv
dXJzZSwgaWYgdGhlIGtlcm5lbCBhY3R1YWxseSBlbmRzIHVwIGNhbGxpbmcgdGhlc2UgZnVuY3Rp
b25zCmluZGlyZWN0bHkgYXQgc29tZSBwb2ludCwgbHBhZCBhbG9uZSBpc24ndCBzdWZmaWNpZW50
LCB3ZSB3b3VsZCBuZWVkCnRvIHVzZSBTWU1fVFlQRURfRlVOQ19TVEFSVCB0byBlbWl0IENGSSB0
eXBlIGluZm9ybWF0aW9uIGZvciB0aGVtLiBJCmFzc3VtZSBpZiBSSVNDLVYgZ2FpbnMga2VybmVs
LW1vZGUgWmljZmlscCBzdXBwb3J0IGxhdGVyLCB3ZSB3b3VsZApoYXZlIGFuIGFyY2gtc3BlY2lm
aWMgb3ZlcnJpZGUgZm9yIHRoZSBTWU1fVFlQRURfRlVOQ19TVEFSVCBtYWNybyB0aGF0CmluY2x1
ZGVzIHRoZSBscGFkIGluc3RydWN0aW9uLCBzaW1pbGFybHkgdG8gYXJtNjQgYW5kIEJUSS4KCkFs
c28sIGlmIHRoZSBrZXJuZWwgZGVjaWRlcyB0byB1c2UgdHlwZS1iYXNlZCBsYW5kaW5nIHBhZCBs
YWJlbHMgZm9yCmZpbmVyLWdyYWluZWQgQ0ZJLCAibHBhZCAwIiBpc24ndCBnb2luZyB0byB3b3Jr
IGFueXdheS4gUGVyaGFwcyBpdAp3b3VsZCBtYWtlIHNlbnNlIHRvIGp1c3QgZHJvcCB0aGUgbHBh
ZCBpbnN0cnVjdGlvbiBpbiBrZXJuZWwgYnVpbGRzCmZvciBub3cgdG8gYXZvaWQgY29uZnVzaW9u
PwoKU2FtaQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
