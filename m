Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB49ACD5BBF
	for <linux-riscv@archiver.kernel.org>; Mon, 25 May 2026 09:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tILz+koW2hnK8hS/tiJOa6k/XKYfvOLO4dNrQbssahs=; b=lAHn4OuklXNP4s
	riGg6Y6N9MJQDk1QS6Gr/5nLi9qXclOVYXdxz635TBF2yo6dMGGhN0kVSdhEA9EqfRWXleg3sK4iY
	glreNCX3DQeMka4u3DO6ItADNh2i34Cd5HWMpBywWxHoLh0iC5Q8suqrfe1Nu2n/X2E1nBzoJ1xgb
	DxTT6AbaybXVCYllpNeageeOuIoomNjxuF/RprryBhJ86eIakvDH0FAmkRf3zty/RVuXFZPds7cej
	ida1qi+8Ar/Zo56e7MvBnkzoMH90DQV2Xw6zDjqcL2Fet0mEOrqyyD1nXWAh9syXkquLlKyj7EHFm
	kqmLU1vDsNa6GQ7GQpQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRRk6-0000000Gpth-1HC1;
	Mon, 25 May 2026 09:37:02 +0000
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRRk4-0000000Gpt1-0Kj7
	for linux-riscv@lists.infradead.org;
	Mon, 25 May 2026 09:37:01 +0000
Received: by mail-yx1-xb134.google.com with SMTP id 956f58d0204a3-65eb1b25c77so3864312d50.0
        for <linux-riscv@lists.infradead.org>; Mon, 25 May 2026 02:36:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779701818; cv=none;
        d=google.com; s=arc-20240605;
        b=i7pNg4V6vW0Jt5fCXMl2r/VeFfKw3AwHeqa3zEvguu7BYGci175ytzeboyMlTM6P+H
         JY/LJXSULIEXYMUZRefP7oHls4k1s/LHba2Kglt2dIeoDxI4plHDZUug1OrBTI8FN0UC
         2aAQoI6XqaCJnX012D8P7jYOruMlzTbDDLxq5WYNKiNWvGnRGAvkMOHzkykIscgl9Hc2
         PRm+KWZb/pT8PbpQi5HRJG9bRSfoHQVmujHmH2VnKScBMDIlvRnkFtkv1ga/HRQYaz22
         8K+G1fy5+je+JHnOTLhlbW2M1aOa3Upl//XsPOd5Tqp3/BxnYDk/xW5fX6WnKzOoz2uw
         k57Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bG2lZTq0AlonyzQJsp3hruKHT4bKY6rEQmFhRZ/Om5Y=;
        fh=CB40QPzGtaAuQPz2ZIkBvkQZQ5X9QuIdA5r8IsfLqKk=;
        b=JRSnO2EdPhLMG1+yKnCe27is6P6HWkgdCKcEJ4sIOQ4RReK1AnOJoTc2DT80gZcZhh
         RZvmXhCYi6brw49lI01hDdrwN/bleM3IReIgS1qOu2YHjcZE+Ybak2a0O1XiUXvvtSjK
         HLJP5xqgMMXq7q6TMIhWsOLLqasQESxBpQJPpsldFLItanphoE03A1ysW57B1WXXT0ok
         fAnuQsU23vVUzugfo1EsiHKnTbU1Qavvr2pG0YOK76bKyFw2f09py3gS1sa5p8XPNf+u
         uXsWt3mBc0ylCQHDpD3U76HIhP3l3AlNvsm8JmkByui7h7SqYhzqKWmX8VLFhUEN8L0u
         keQQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779701818; x=1780306618; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bG2lZTq0AlonyzQJsp3hruKHT4bKY6rEQmFhRZ/Om5Y=;
        b=Y8GIdQWP3kiEj9uhM1zAThlEY5eXU9JZr7k+PaB6jSzx7oYQ3NHqbfJuhnBDKxi00n
         v3KnYzzTaOQQNQRHOKtxWu6Dpj6RycUPWOtz/j6/ujMhqAMokXM0YnR6833AwAajA/jU
         swb955JCdEXvB0BllO5/8dQEtSjZZOrOGQPsm/bOI4n5CBhmuFUje4p8SgHMmBY5BcZw
         Xm6xBVMspVjRRH5b6sDZ/qsJqzyQ22ZferHMOGBf7RV/tRd85p7Bje4VuxgE/RDIBVDz
         vPdCDNkZQwkbwzOfu9UHpZ/3rbcbgp4h8cWOnxTQbRIwMvpRvZjuSQZ6ejMr14E02Dkx
         8Wqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779701818; x=1780306618;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bG2lZTq0AlonyzQJsp3hruKHT4bKY6rEQmFhRZ/Om5Y=;
        b=W2uvQbygMGrPVSG9Z9qoxURAqbCwcBoM5fEhmqFXSTW+yhdM4ZCbC/EpSWKEABUuxD
         qoUWEFDxpupM9v7Zp0PuuGhf67V/9ubzda+09PSBwtTmKTf37mKoN0iEHUpxjuLszQTx
         BnG5Lw1Re3XaETiutWjG4GnUI5/KlsxwzBocl85caGs+aW559FMqi6gmO/VsVIPJ5+Fy
         4sIHj6nTmy6ofWGwU5a3BKD9pa4/IZkazeUpUS7/MQ2fYs5WFDlj7sWusCes5qu+/OEN
         fWn7o/KMEcAOL4xWp95w//A2i+n6BRSez8b8cVQ4KcOGhd+d5SZTFtgHhGFbZRJi8WX0
         HSgQ==
X-Forwarded-Encrypted: i=1; AFNElJ+vtU4HKx9NeIrwMHSYCuZ6qawKEOCfgHxbaolWJmWUwEKOCAJl6nTERKjhqR6D8ejMy40/HUTkFzMkzw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwW55emOZOa5NENcdf7cBpPXCz2Mt07dXASVdVlQ1d77j/vjmPK
	QLlR2C3ItoCSrD4zuzBy61zazIbJxrvXcWxqFee8Ipxb7cjxh3ZYclu6WD59yy/1XICvoFsiJZp
	YZLEZFZ3Nntyn37t8FtFNs+fK4puF+aWaPs+s
X-Gm-Gg: Acq92OF3/QE4xhCG5oyCQ6Il7OpVTJ1w0FfRWV9/xRADRNfU5GpmX3UKWrgCYhUGOPg
	mMlAg0mrcfWIXCDDqu2K7U2Rsb+kDOTmnZaap3ZwL8KILKYACaq6NLde0q/8NKFMIpgucDGZVg/
	I7OwhQ7/J6BXH7td5xv5EuftCR1xN5dLZ3cWpv/tQQ/Dxrp9AtxR71qgipyn8X2K169BaRwwnxy
	u0Y9Ri6I+FBPgeIGz7z5yxhr/tT8aYTtm+cQc+MkSrgddEGUvVLIfAGAqljFe3CxfKsLREWRspU
	ETg9mGK1tyk3ii5NWjQxGEnvYDI8OA==
X-Received: by 2002:a05:690e:4383:b0:654:54f2:9e50 with SMTP id
 956f58d0204a3-65ec9775082mr9988663d50.25.1779701818177; Mon, 25 May 2026
 02:36:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260515-orangepi-sd-card-uhs-v10-0-094af27e310d@gmail.com>
 <177889984452.2298656.1074391459031404894.b4-ty@b4> <7e68e745-0d70-46db-9475-38d3dd5b9cf4@baylibre.com>
 <6b945153-5a7b-415e-904a-1c350b7d52ee@gmail.com> <86ac46cd-b7bc-42cc-8c29-996ae21f3654@baylibre.com>
In-Reply-To: <86ac46cd-b7bc-42cc-8c29-996ae21f3654@baylibre.com>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 25 May 2026 11:36:46 +0200
X-Gm-Features: AVHnY4I_k1DJLPTVcDE4dQLLOOZPqA-S_Z9vI3VGZcAzyFnMwYf6XDaI2FWsQUo
Message-ID: <CABdCQ=M_E1uHU5WTXCn2mXaxf3-+7M9gXCL=tp1qBW50jf7d5Q@mail.gmail.com>
Subject: Re: (subset) [PATCH v10 0/4] riscv: spacemit: enable SD card support
 with UHS modes for OrangePi RV2
To: Trevor Gamblin <tgamblin@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_023700_134744_4A812E1C 
X-CRM114-Status: GOOD (  21.84  )
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
Cc: Troy Mitchell <troy.mitchell@linux.dev>, Adrian Hunter <adrian.hunter@intel.com>, linux-riscv@lists.infradead.org, Rob Herring <robh@kernel.org>, Michael Opdenacker <michael.opdenacker@rootcommit.com>, Javier Martinez Canillas <javierm@redhat.com>, Yixun Lan <dlan@kernel.org>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Andre Heider <a.heider@gmail.com>, spacemit@lists.linux.dev, Paul Walmsley <pjw@kernel.org>, Margherita Milani <margherita.milani@amarulasolutions.com>, Alexandre Ghiti <alex@ghiti.fr>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>, Vincent Legoll <legoll@online.fr>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGksCgpTb3JyeSwgSSd2ZSBiZWVuIG9uIHZhY2F0aW9uIGFuZCBJIGhhdmVuJ3QgY2hlY2tlZCBt
eSBlbWFpbHMuCgpFbCBtacOpLCAyMCBtYXkgMjAyNiBhIGxhcyAxMzoxMSwgVHJldm9yIEdhbWJs
aW4KKDx0Z2FtYmxpbkBiYXlsaWJyZS5jb20+KSBlc2NyaWJpw7M6Cj4KPgo+IE9uIDIwMjYtMDUt
MjAgMDM6NTMsIEFuZHJlIEhlaWRlciB3cm90ZToKPiA+IEhpIFRyZXZvciwKPiA+Cj4gPiBPbiAx
Ni4wNS4yNiAyOjM1IFBNLCBUcmV2b3IgR2FtYmxpbiB3cm90ZToKPiA+Pgo+ID4+IE9uIDIwMjYt
MDUtMTUgMjI6NTcsIFlpeHVuIExhbiB3cm90ZToKPiA+Pj4gT24gRnJpLCAxNSBNYXkgMjAyNiAx
Mjo0ODo1OCArMDIwMCwgSWtlciBQZWRyb3NhIHdyb3RlOgo+ID4+Pj4gVGhpcyBzZXJpZXMgZW5h
YmxlcyBjb21wbGV0ZSBTRCBjYXJkIHN1cHBvcnQgZm9yIHRoZSBTcGFjZW1pdCBLMS1iYXNlZAo+
ID4+Pj4gT3JhbmdlUGkgUlYyIGJvYXJkLCBpbmNsdWRpbmcgVUhTIChVbHRyYSBIaWdoIFNwZWVk
KSBtb2RlcyBmb3IKPiA+Pj4+IGhpZ2gtcGVyZm9ybWFuY2UgU0QgY2FyZCBvcGVyYXRpb24uCj4g
Pj4+Pgo+ID4+Pj4gQmFja2dyb3VuZAo+ID4+Pj4KPiA+Pj4+IFRoZSBTcGFjZW1pdCBLMSBTb0Mg
aW5jbHVkZXMgYW4gU0RIQ0kgY29udHJvbGxlciBjYXBhYmxlIG9mIHN1cHBvcnRpbmcKPiA+Pj4+
IFNEIGNhcmRzIHVwIHRvIFVIUy1JIHNwZWVkcyAoU0RSMTA0IGF0IDIwOE1IeikuIEhvd2V2ZXIs
IG1haW5saW5lCj4gPj4+PiBjdXJyZW50bHkgbGFja3MgYmFzaWMgU0QgY29udHJvbGxlciBjb25m
aWd1cmF0aW9uLCBTREhDSSBkcml2ZXIKPiA+Pj4+IGVuaGFuY2VtZW50cyBmb3Igdm9sdGFnZSBz
d2l0Y2hpbmcgYW5kIHR1bmluZywgYW5kIHBvd2VyIG1hbmFnZW1lbnQKPiA+Pj4+IGluZnJhc3Ry
dWN0dXJlLgo+ID4+Pj4KPiA+Pj4+IFsuLi5dCj4gPj4+IEhpIElrZXIsCj4gPj4+IEkndmUgcGlj
a2VkIHBhdGNoIDEtMywgZm9yIFs0LzRdIEkgdGhpbmsgaXQgc2hvdWxkIGJlIG1lcmdlZCBhZnRl
cgo+ID4+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNjA1MTMwNzE5NTguMjk1NzQt
MS1hLmhlaWRlckBnbWFpbC5jb20vCj4gPj4KPiA+PiBIaSBZaXh1biwKPiA+Pgo+ID4+IFRoYXQg
bWFrZXMgc2Vuc2UuIEluIHJlc3BvbnNlIHRvIHlvdXIgZWFybGllciBmZWVkYmFjayBJIGhhZCBk
cmFmdGVkCj4gPj4gYSBtb3JlCj4gPj4gY29tcGxldGUgZHRzIGFmdGVyIGFub3RoZXIgc2NoZW1h
dGljIGNvbXBhcmlzb24sIGJ1dCBJa2VyIGFuZCBJCj4gPj4gZGlzY3Vzc2VkIGl0Cj4gPj4gYW5k
IG9wdGVkIHRvIGF2b2lkIGNoYW5naW5nIHNjb3BlIHRvbyBtdWNoLiBBbmRyZSdzIHNlcmllcyBp
bmNsdWRlcwo+ID4+IHRoZSBiaXRzIEkKPiA+PiB3YW50ZWQgdG8gYWRkIGFuZCBtb3JlLCBzbyB0
aGF0IHdvcmtzIG91dC4KPiA+Cj4gPiBJIGhhdmUgNC80IHJlYmFzZWQgb24gbXkgc2VyaWVzIGFu
eXdheSwgZG8geW91IHdhbnQgbWUgdG8gc2VuZCBpdD8KPgo+IElmIHlvdSBoYXZlIGFuIHVwZGF0
ZSB0byBtYWtlLCBwbGVhc2UgZG8hCgpTbywgaG93IGhhcyB0aGlzIHR1cm5lZCBvdXQgaW4gdGhl
IGVuZD8gQW5kcmUsIHdpbGwgeW91IHRha2UgY2FyZSBvZgpzZW5kaW5nIHRoZSBsYXRlc3QgdmVy
c2lvbiBmb3IgdGhlIE1VU0UgUGkgUHJvPwoKPgo+IFRyZXZvcgo+Cj4gPgo+ID4gVGhhbmtzLAo+
ID4gQW5kcmUKPiA+Cj4gPj4KPiA+PiBUaGFua3MhCj4gPj4KPiA+PiBUcmV2b3IKPiA+Pgo+ID4+
Pgo+ID4+PiBBcHBsaWVkLCB0aGFua3MhCj4gPj4+Cj4gPj4+IFsxLzRdIHJpc2N2OiBkdHM6IHNw
YWNlbWl0OiBrMTogYWRkIFNEIGNhcmQgY29udHJvbGxlciBhbmQgcGluY3RybAo+ID4+PiBzdXBw
b3J0Cj4gPj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9zcGFjZW1pdC1jb20vbGludXgvY29tbWl0LzJk
NzdlNTc3MTA5OTY3ZWY2NWYyNjljMWZjMWQ2YTY1OWQ0MjYwZmIKPiA+Pj4gWzIvNF0gcmlzY3Y6
IGR0czogc3BhY2VtaXQ6IGsxLW9yYW5nZXBpLXJ2MjogYWRkIFNEIGNhcmQgc3VwcG9ydAo+ID4+
PiB3aXRoIFVIUyBtb2Rlcwo+ID4+PiBodHRwczovL2dpdGh1Yi5jb20vc3BhY2VtaXQtY29tL2xp
bnV4L2NvbW1pdC8yNTg1YzYwY2UyZjk3N2IxM2YxNGE2N2QxZTNlZDljNzNmZDdmMzgxCj4gPj4+
IFszLzRdIHJpc2N2OiBkdHM6IHNwYWNlbWl0OiBrMS1iYW5hbmFwaS1mMzogYWRkIFNEIGNhcmQg
c3VwcG9ydCB3aXRoCj4gPj4+IFVIUyBtb2Rlcwo+ID4+PiBodHRwczovL2dpdGh1Yi5jb20vc3Bh
Y2VtaXQtY29tL2xpbnV4L2NvbW1pdC9jNzZlMmYwNThjYmNhYjg0ZTRhNzAzZjI2ODU3YTU4YmRm
NmEwMDQyCj4gPj4+Cj4gPj4+IEJlc3QgcmVnYXJkcywKPiA+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
