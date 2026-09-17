Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED4DC982D0
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2026 19:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=EVdpjBoMsLQpaZB9X5EDNDVae08GkR7gdDeh1SAd/g8=; b=ktqTrr3mgcgpBrwHyXly49F+U+
	iAVChuKy8tH7GeGHROUmCR2PTDQJTy9URps4YUjX83sY7HrpEjUZtprOQM+Ve76A4J3B3jmgNYCJo
	CQwRxDZ/e8Ud9DQl08e0g7QtOdPmSwNmswtRWndQzWtobt8Frv31tBmLG4CfivqOby2D3hgHWsu+r
	nBIKvepwjmTqhS7RRV0BHGZPhx7kctpVlI/1+Z/NZt/E+SdS2vjZNuL9wR+z6Q+TeWH9nAlCbGRAZ
	W9R1SdpLey39CnRpFJOBeHSSQKJqd0Ne96kXMOa6PpPjMe2TH2ZbM/LBDNpT+be1XUxkmh6wbdEgL
	Dus9WlyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7HdQ-0000000CJvn-3P7d;
	Thu, 17 Sep 2026 19:19:04 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7HdN-0000000CJvO-0nwe
	for linux-riscv@lists.infradead.org;
	Thu, 17 Sep 2026 19:19:03 +0000
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc4aa0f1a94so916828a12.2
        for <linux-riscv@lists.infradead.org>; Thu, 17 Sep 2026 12:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20251104.gappssmtp.com; s=20251104; t=1789672740; x=1790277540; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:to
         :from:cc:in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JTpcF4933AuqjrXkic6TMoFwsxDS4r0Nwe4Mg2qA+JE=;
        b=bXFPO0B7OFXUQboaE3SL+cxxPSLuqP9I1HDOwPH9R49aly614nLs7iDM4c5JJ0392E
         xQU5NiG2F5Q4HD3c81fHweL/91EyD5OfIOz5LN0tbwQbxXQdFiq6fXTkCnJPsqZDb1O2
         GFmc+VNpRLcZ2awPwkbcm0sw3+Ny67+T3B43GyIEzeAdOLBQen7FZk7SdZoOa+DOzaQv
         uBajAvXPa901/q0cDc3bfauNuVN818xyOwDqWQBcM/JSNPitMGku6VZ/SIV235hbk4Qe
         vdz5s44IGmdfXVettmBqhpRCgqtUQMGw1ZI4Nk4QugHuDBWzxL4B48YzTeEsexEzPW1e
         KU6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789672740; x=1790277540;
        h=content-transfer-encoding:content-type:mime-version:message-id:to
         :from:cc:in-reply-to:subject:date:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=JTpcF4933AuqjrXkic6TMoFwsxDS4r0Nwe4Mg2qA+JE=;
        b=FPJhyGl5T0BzfDxsP0Yx89b8md0OGjYooRHVxWoLJQ9uWvTwwR0yOpTMPLaON75LPq
         RhEOtlup4H4Hu1PFvfQSjSSwva2VCW0KX13zxp28vxFKPJnCnKKIqaFkyPryRFr1a9nq
         dJhvp+5n6O7uiK/bqdkLQ4Q8OTTDkWCFWijg4rm7Kf1VmjBalm5Gxg0W8NU022dMEiS6
         outZ+jDpaodZCxvZt+iPqZqutIPz5xdBbrZowo4Dk6nGP6x7kqvtikfEGVYcC5vaAK3X
         lBZSzeMnR1XX0RugKu8Vz1wyPJYVIGwu37W7zaNQcFKYuI1zCO5NbXsrNYt7OfnXTVoP
         rg0A==
X-Forwarded-Encrypted: i=1; AKwUvByzFYi22tWwlYjjpR9uFA30XIT3npluVvXHDzK/1Cc5Ia93DPR75J+d2CvZZGKlU+xnoF5TNOdJoJnLbw==@lists.infradead.org
X-Gm-Message-State: AFuF++nEh7ttQ/oBYhQKeoE8Na88l/ffqamuxZ92YgfMmv5gkoXV2F2I
	XrQw5dfI54owN7kOXPdSPGGD6o6mXiqK9EewACYpbAzh+ZvWcnJdItZXNG6EpyEyhWg=
X-Gm-Gg: AYBFou11eR5TIpGoy+GB6yb8yLXkwzqImP+ZmJw42zTuZ3iIwwwCv9Y67e1B7+q+JGH
	+LGHlTWqRF4GOKWggC6U4TeA/EN1FGed0JSRA+Hu5bbMJSOZsL9uEJT9V/5m94eXMMQbvfFfxfm
	f2EIF68p4/SG2rWSebQVpZGokl5iJTDjwAsLQaJrBm06KRYRgMTmR+Ld9zFKiLnVKpfEYDTG6oK
	uRyXVWq7lCM8gEY4En2eqQ2OwqkG34oiGcXtT7bM13FWkB7i9fCvw1/Ze2m5+4mKBmuhXVCmWiw
	gVM39S5G/m7ziDN5ipHAHMYexPcTl2EBh9D2fK7QIgmjMVXsq1f4uELySwdlVuSyKEtZpkxea3z
	um0qjVFxM7JAa9ZhZdlDlvySkVJ9p0PFLlmO23WFzqugBVlYq0Mx92QvH+4Lnag6duTDsUMJ+6b
	Rk7p3doe0qa7aUZlNayQOLwv0xDhqV6lcwmS2EU94RnxAexUNTSitW+xuVGILSkGRnNsWhN0yRg
	8Likp5U138XevavYHGov4YhTFQYmQ==
X-Received: by 2002:a05:6a20:4327:b0:3d3:ae40:51e6 with SMTP id adf61e73a8af0-3dd5f78606dmr17656746637.26.1789672739753;
        Thu, 17 Sep 2026 12:18:59 -0700 (PDT)
Received: from localhost ([2001:5a8:4687:d600:a432:5959:dbd9:36fd])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5b0520asm17913779eec.27.2026.09.17.12.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 12:18:59 -0700 (PDT)
Date: Thu, 17 Sep 2026 12:18:59 -0700 (PDT)
X-Google-Original-Date: Thu, 17 Sep 2026 12:18:57 PDT (-0700)
Subject: Re: Random corruption on SpacemiT K1 (and K3) with RVV
In-Reply-To: <aqm1Ik5202PyscK3@aurel32.net>
CC: spacemit@lists.linux.dev, linux-riscv@lists.infradead.org, tchiu@tenstorrent.com,
  kmehltretter@gmail.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: aurelien@aurel32.net
Message-ID: <mhng-6CE84C42-173E-4FAB-B163-A2AF2DC3D084@Palmers-Mini.rwc.dabbelt.com>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_121901_483691_960FD721 
X-CRM114-Status: GOOD (  46.41  )
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

T24gVHVlLCAxNSBTZXAgMjAyNiAxNDoxNDoxMCBQRFQgKC0wNzAwKSwgYXVyZWxpZW5AYXVyZWwz
Mi5uZXQgd3JvdGU6Cj4gSGksCj4KPiBTb21lIG1vcmUgdXBkYXRlLCBldmVuIGlmIHRoZSBwcm9n
cmVzcyBpcyBxdWl0ZSBsb3cuCgpXZWxsLCB0aGFua3MgZm9yIGRpZ2dpbmcgaW50byB0aGlzLgoK
Pgo+IE9uIDIwMjYtMDktMDkgMTg6NDUsIEF1cmVsaWVuIEphcm5vIHdyb3RlOgo+PiBbQWRkZWQg
QW5keSBhbmQgS2FybCBpbiBDYzogYXMgdGhleSBoYXZlIGJlZW4gaW52b2x2ZWQgaW4gdGhlIHZl
Y3RvcmVkIAo+PiB1c2VyIGNvcHkgY29kZSBhbmQgZmlnaHRpbmcgc2ltaWxhciBpc3N1ZXNdCj4+
IAo+PiBIaSwKPj4gCj4+IFNvbWUgbW9yZSBwcm9ncmVzcyBvbiB0aGF0IHRvcGljLgo+PiAKPj4g
T24gMjAyNi0wOS0wOCAwNjo0MiwgQXVyZWxpZW4gSmFybm8gd3JvdGU6Cj4+ID4gRGVhciBhbGws
Cj4+ID4gCj4+ID4gSSBoYXZlIGRvbmUgc29tZSBzbWFsbCBwcm9ncmVzcyBvbiB0aGF0IGlzc3Vl
LiBIZWxwIGlzIHN0aWxsIHdhbnRlZCBhbmQgCj4+ID4gd291bGQgYmUgYXBwcmVjaWF0ZWQuCj4+
ID4gCj4+ID4gT24gMjAyNi0wOC0zMCAyMjo1MiwgQXVyZWxpZW4gSmFybm8gd3JvdGU6Cj4+ID4g
PiBEZWFyIGFsbCwKPj4gPiA+IAo+PiA+ID4gRm9yIHRoZSBsYXN0IHdlZWtzLCBJIGhhdmUgYmVl
biB0cmFja2luZyBhIHJhbmRvbSBtZW1vcnkgY29ycnVwdGlvbiBhbmQKPj4gPiA+IHJlbGF0aXZl
bHkgcmFyZSBvbiBTcGFjZW1pVCBLMSAoQmFuYW5hIFBpIEYzIGFuZCBNaWxrLVYgSnVwaXRlciku
IEl0IAo+PiA+ID4gc3RhcnRlZCB1cGdyYWRpbmcgdG8gZ2xpYmMgMi40Mywgd2hpY2ggZG9lcyBt
ZW1zZXQoKSB0aHJvdWdoIHZlY3RvciAKPj4gPiA+IGluc3RydWN0aW9ucy4gIEl0IGlzIHJlcHJv
ZHVjaWJsZSB1c2luZyB0aGUgRGViaWFuIDcuMS43LTF+YnBvMTMrMSAKPj4gPiA+IGtlcm5lbCwg
YnV0IEkgaGF2ZSBhbHNvIGJlZW4gYWJsZSB0byByZXByb2R1Y2UgaXQgd2l0aCBhIHZhbmlsbGEg
Ny4yLjIgCj4+ID4gPiBrZXJuZWwsIHVzaW5nIGEgc2ltaWxhciBjb25maWd1cmF0aW9uIHRvIHRo
ZSBEZWJpYW4ga2VybmVsLiBUaGUgYm9hcmQgCj4+ID4gPiB1c2VzIE9wZW5TQkkgMS45IGFuZCB0
aGUgdmVuZG9yIFUtQm9vdC4KPgo+IEkgaGF2ZSBiZWVuIGFibGUgdG8gYWxzbyByZXByb2R1Y2Ug
dGhlIGlzc3VlIHdpdGggdGhlIHZlbmRvciBPcGVuU0JJLiBJdCAKPiBpcyBhbHNvIHJlcHJvZHVj
aWJsZSB3aXRoIGxpbnV4IDcuMi42Lgo+Cj4+ID4gSSBoYXZlIGJlZW4gYWJsZSB0byBydWxlIG91
dCBPcGVuU0JJIGZyb20gdGhlIGlzc3VlLCBJIGhhdmUgY2hlY2tlZCAKPj4gPiB0aGVyZSBpcyBu
b3QgdHJhcCB0byBPcGVuU0JJIHdoZW4gdGhlIHByb2JsZW0gaGFwcGVucy4KPj4gPiAKPj4gPiA+
IFR5cGljYWxseSBpdCBtYW5pZmVzdHMgaXRzZWxmIHdpdGggdGhlIGZvbGxvd2luZyBraW5kIG9m
IGVycm9yLCB3aGVuIAo+PiA+ID4gcnVubmluZyBnKysgZnJvbSBHQ0MgMTYgYXMgcGFydCBvZiBi
dWlsZGluZyBzb2Z0d2FyZSAoZS5nLiBPcGVuSkRLLCAKPj4gPiA+IEJsZW5kZXIsIERvbGZpbiwg
UXQ2KTogICAKPj4gPiA+IAo+PiA+ID4gQXNzZW1ibGVyIG1lc3NhZ2VzOgo+PiA+ID4ge3N0YW5k
YXJkIGlucHV0fToyODQ1ODg6IEVycm9yOiB1bmtub3duIHBzZXVkby1vcDogYC51bGViMScKPj4g
PiA+IHtzdGFuZGFyZCBpbnB1dH06Mjg0NTg4OiBFcnJvcjogdW5yZWNvZ25pemVkIG9wY29kZSBg
w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/D
v8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/
w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/D
v8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/
w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv3ZsODc0Jwo+PiA+ID4gCj4+
ID4gPiBUaGUgYnJva2VuIGNoYXJzIGFyZSAweGZmIGFuZCBpdCBzZWVtcyB0aGVyZSBhcmUgYWx3
YXlzIDI0MCAoYnV0IHdpdGggCj4+ID4gPiBwb29yIHN0YXRpc3RpY3MpLiBTb21ldGltZXMgaXQg
aW5zdGVhZCBjYXVzZXMgYSBHQ0MgSUNFIGluc3RlYWQuCj4+ID4gCj4+ID4gSSBoYXZlIGlkZW50
aWZpZWQgdGhhdCB0aGUgMHhmZiBjb21lcyBmcm9tIHRoZSBwb2lzb25pbmcgZG9uZSBmb3IgdjAg
aW4KPj4gPiBfX3Jpc2N2X3ZfdnN0YXRlX2Rpc2NhcmQoKSwgd2hpY2ggc2hvdWxkIG9ubHkgaGFw
cGVuIGZvciBhIHN5c2NhbGwuIAo+PiA+IEluZGVlZCBjaGFuZ2luZyB0aGUgdmFsdWUgdG8gZGlm
ZmVyZW50IG9uZXMgcHJvcGFnYXRlcyB0byB0aGUgYWJvdmUgCj4+ID4gZXJyb3IgbWVzc2FnZS4K
Pj4gPiAKPj4gPiBGdXJ0aGVybW9yZSBJIGhhdmUgZm91bmQgdGhhdCBjaGFuZ2luZyBDT05GSUdf
UklTQ1ZfSVNBX1ZfUFJFRU1QVElWRSAKPj4gPiBkb2Vzbid0IGNoYW5nZSBhbnl0aGluZywgYW5k
IHRoYXQgY2hhbmdpbmcgUklTQ1ZfSVNBX1ZfVUNPUFlfVEhSRVNIT0xEIAo+PiA+IGNoYW5nZXMg
dGhlIG51bWJlciBvZiBicm9rZW4gYnl0ZXMuCj4+IAo+PiBUaGUgdmFsdWVzIGZyb20gX19yaXNj
dl92X3ZzdGF0ZV9kaXNjYXJkKCkgZW5kLXVwIHRoZXJlIGJlY2F1c2UgdGhleSBhcmUgCj4+IHRo
ZSBsYXN0IHZhbHVlcyB3cml0dGVuIHRvIHRoZSB2ZWN0b3IgcmVnaXN0ZXJzLiBJIGhhdmUgYWRk
ZWQgc29tZSAKPj4gcG9pc29uaW5nIGluIF9fYXNtX3ZlY3Rvcl91c2VyY29weV9zdW1fZW5hYmxl
ZCBiZWZvcmUgdGhlIGxvb3AsIGFuZCAKPj4gdGhvc2UgdmFsdWVzIGFwcGVhciBpbnN0ZWFkLiBV
c2luZyBkaWZmZXJlbnQgdmFsdWVzIHBlciB2ZWN0b3IgcmVnaXN0ZXIsIAo+PiBJIGhhdmUgZm91
bmQgdGhhdCB0aGUgY29ycnVwdGlvbiBjb21lcyBmcm9tIGEgcGFydGlhbCBsb2FkIG9mIHRoZSB2
bGU4LnYgCj4+IGluc3RydWN0aW9uLCB3aGlsZSB0aGUgcmVzdWx0IG9mIHRoZSBwb2lzb25pbmcg
YW5kIHRoZSBwYXJ0aWFsIGxvYWQgYXJlCj4+IHRoZW4gYm90aCB3cml0dGVuIGJ5IHRoZSB2c2U4
LnY6Cj4+IAo+PiAgbG9vcDoKPj4gICAgICAgICB2c2V0dmxpIGlWTCwgaU51bSwgZTgsIEVMRU1f
TE1VTF9TRVRUSU5HLCB0YSwgbWEKPj4gICAgICAgICBmaXh1cCB2bGU4LnYgdkRhdGEsIChwU3Jj
KSwgMTBmCj4+ICAgICAgICAgc3ViIGlOdW0sIGlOdW0sIGlWTAo+PiAgICAgICAgIGFkZCBwU3Jj
LCBwU3JjLCBpVkwKPj4gICAgICAgICBmaXh1cCB2c2U4LnYgdkRhdGEsIChwRHN0KSwgMTFmCj4+
ICAgICAgICAgYWRkIHBEc3QsIHBEc3QsIGlWTAo+PiAgICAgICAgIGJuZXogaU51bSwgbG9vcAo+
Cj4gSSBoYXZlIGluc3RydW1lbnRlZCB0aGF0IGNvZGUsIGJhc2ljYWxseSBhZGRpbmcgYSBmdW5j
dGlvbiB0byBjaGVjayB0aGUgCj4gY29weSBhZnRlcndhcmRzIChvbmx5IHVzaW5nIHNjYWxhciBp
bnN0cnVjdGlvbnMpLCBhbmQgcmVwb3J0IHZhbHVlcyBpbiAKPiBjYXNlIG9mIGVycm9ycy4gU28g
ZmFyIEkgaGF2ZSBiZWVuIGFibGUgdG8gY2F0Y2ggdGhlIGlzc3VlIDQgdGltZXMgdGhhdCAKPiB3
YXkgKGluY2x1ZGluZyBvbmUgd2hlcmUgSSBoYXZlbid0IHNlZW4gYW55IHZpc2libGUgY29uc2Vx
dWVuY2Ugb24gdGhlIAo+IHVzZXJsYW5kKS4gCj4KPiBUaGlzIGlzIHdoYXQgSSBvYnNlcnZlZDoK
PiAtIFRoZSBpc3N1ZSBhbHdheXMgaGFwcGVucyBmb3IgdGhlIGZpcnN0IGJ5dGVzIG9mIHRoZSB1
c2VyIGNvcHksIHdoaWNoIAo+ICAgaW4gYWxsIGNhc2VzIHdlcmUgc3VwcG9zZWQgdG8gYmUgdXAg
dG8gNDA5NiBieXRlcyBsb25nLgo+IC0gT24gdGhlIGZpcnN0IGl0ZXJhdGlvbiBvZiB0aGUgbG9v
cCBvbmx5IHRoZSBmaXJzdCAxNiBieXRlcyBhcmUgbG9hZGVkIAo+ICAgYnkgdGhlIHZsZTgudiBp
bnN0cnVjdGlvbiBidXQgdGhlIGZ1bGwgMjU2IGJ5dGVzIGFyZSB3cml0dGVuIHRvIHRoZSAKPiAg
IGRlc3RpbmF0aW9uIGJ5IHRoZSB2c2U4LnYgaW5zdHJ1dGlvbi4KClRoYXQgc291bmRzIGxpa2Ug
c29tZSBzb3J0IG9mIHRyYXAgaGFuZGxpbmcgaXNzdWU6IHNvbWV0aGluZydzIGZpbGxpbmcgCm91
dCB0aGUgZmlyc3Qgd29yZCBvZiB0aGUgdmVjdG9yLCBidXQgdGhlbiBub3QgdGhlIHJlc3QsIGJ1
dCB0aGVuIG5vdCAKdHJpZ2dlcmluZyBhIHJlc3RhcnQgb2YgdGhlIGluc3RydWN0aW9uLiAgV2Ug
dGFsa2VkIHNvbWUgb24gSVJDIGFuZCBpdCAKc291bmRzIGxpa2UgdGhhdCB0cmFwIGlzbid0IGdl
dHRpbmcgaW50byBMaW51eCwgc28gaXQncyBwb3NzaWJsZSAKc29tZXRoaW5nIGluIE0tbW9kZSBp
cyBtYW5nbGluZyBpdCAtLSB0aGlzIGlzIHdoZXJlIHdlIHN0YXJ0IHRvIGdldCBpbnRvIAp2c3Rh
cnQvaWRlbXBvdGVudCBpbnN0cnVjdGlvbiB0ZXJyaXRvcnkgYW5kIHRoYXQncyBub3Qgd2VsbCB0
ZXN0ZWQgYnkgCnJ1bm5pbmcgb24gUUVNVSwgc28gaXQgd291bGRuJ3QgYmUgc3VwZXIgc3VycHJp
c2luZyB3ZSdyZSBqdXN0IHN0dW1ibGluZyAKaW50byBhIGJ1ZyB0aGVyZS4KCkkgaGF2ZSBhIEsz
IHRoYXQgSSd2ZSBiZWVuIG1lYW5pbmcgdG8gcGxheSBhcm91bmQgd2l0aCwgSSdtIGdvaW5nIHRv
IGdvIAp0cnkgdG8gc2VlIGlmIEkgY2FuIGdldCBpdCBydW5uaW5nIGFuZCByZXByb2R1Y2UgdGhp
cyBvbmUuCgo+IC0gT24gdGhlIHNlY29uZCBpdGVyYXRpb24gb2YgdGhlIGxvb3AsIHRoZSB2bGU4
LnYgY2F1c2VzIGEgdHJhcCwgd2hpY2ggCj4gICBlbmRzIHVwIGluIHRoZSAxMGYgZml4dXAuIEF0
IGZpeHVwIGxldmVsLCB2bD0weDEwMCwgdmxlbmI9MHgyMCwgCj4gICB2c3RhcnQ9MHgwIGFuZCB2
dHlwZT0weGMzLgo+IC0gQ29uc2lkZXJpbmcgdGhlIDIgZmlyc3QgaXRlcmF0aW9ucyBvZiB0aGUg
bG9vcCAoaS5lLiA1MTIgYnl0ZXMpLCAKPiAgIG5laXRoZXIgdGhlIHNvdXJjZSBub3IgZGVzdGlu
YXRpb24gYWRkcmVzc2VzIGNyb3NzIGEgcGFnZS4KPgo+IEFsbCB0aGF0IHNhaWQsIGl0IGlzIHdo
YXQgSSBjYW4gKm9ic2VydmUqLiBJIGhhdmUgbm8gaWRlYSBpZiB0aGUgZmlyc3QgCj4gaXRlcmF0
aW9uIG9mIHRoZSBsb29wIGFsc28gZ29lcyB0aHJvdWdoIGZpeHVwIG9yIG5vdC4gQWxzbyBpbiBh
ZGRpdGlvbiAKPiB0byBwcmVjaXNlIHRyYXBzICh3aGljaCBkZWZpbml0ZWx5IGhhcHBlbiBmb3Ig
dGhlIHNlY29uZCBpdGVyYXRpb24pLCBJUlEgCj4gY291bGQgaGFwcGVuIGF0IGFueSBtb21lbnQu
IEkgdXNlIENPTkZJR19SSVNDVl9JU0FfVl9QUkVFTVBUSVZFPW4gZm9yIG15IAo+IHRlc3QsIGlu
IG9yZGVyIHRvIGxpbWl0IHRoZSBjb2RlIHBhdGhzIHRvIHJldmlldywgc28gZHVyaW5nIHRoYXQg
Y29weSAKPiBwcmVlbXB0IGlzIGRpc2FibGVkLCBidXQgSVJRIGlzIG5vdC4KPgo+IFJlZ2FyZHMK
PiBBdXJlbGllbgo+Cj4gLS0gCj4gQXVyZWxpZW4gSmFybm8gICAgICAgICAgICAgICAgICAgICAg
ICAgIEdQRzogNDA5NlIvMURERDhDOUIKPiBhdXJlbGllbkBhdXJlbDMyLm5ldCAgICAgICAgICAg
ICAgICAgICAgIGh0dHA6Ly9hdXJlbDMyLm5ldAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
