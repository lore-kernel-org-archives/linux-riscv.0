Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 069A7CD3427
	for <linux-riscv@archiver.kernel.org>; Thu,  7 May 2026 09:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FL6ADjLs17r+LWuyS64LfLoTUbWhn1KQ6+0pySvkynQ=; b=Wrqjs/69yl5jmr
	T0gKgnhhVielY/WH6rcjqsNrg1uYc+a8c4k4RqxRPw81mXRfhDVLmO06ehQszNCeH3DwEBEbsZIYH
	W7YAefgSkdO7X16pT87KtrUxBUKJYxIRF+0A0Hpk5+mUDZ3VoXdsjgwB3HFI+tIoApyEvpxPoK5TR
	J3Obx6+jcWKyXzn7JYn43GE06W6cZ1/Vd87kHBtG4rPrB9gAIyuB5b/ZuCJ+FpHIBsYxCq7lhQT2/
	zoFesbwpynTSP5wZOPM4DX1z9Nedx6lE9RBkP+ExCPRJsq+R/o3RtSPlp3Y0FCytyu8LFcWA4qz/Y
	rpdbl3jjZx2lftqDJrJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKvQn-00000003PRR-1EK0;
	Thu, 07 May 2026 09:54:09 +0000
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKvQl-00000003PQW-1Gvk
	for linux-riscv@lists.infradead.org;
	Thu, 07 May 2026 09:54:08 +0000
Received: by mail-yx1-xb12e.google.com with SMTP id 956f58d0204a3-6579254f996so369056d50.1
        for <linux-riscv@lists.infradead.org>; Thu, 07 May 2026 02:54:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778147645; cv=none;
        d=google.com; s=arc-20240605;
        b=DWlcVh2QjN/j1OXDEXDn7J02reLMehVj1rpXEOQvV36QWJHaDHsr6OfFznhButL1OJ
         lx+dXPqzO8qbBVCSjVispdYfTqCfqxghwKo9cN0snfYApqXGeBI9EAfnMpxGJQ4nx559
         /wWoRfn1CyuTtnLgdz1X/CCLqrbmb2FNsszfBfezbLUuaC+Lc5fWYOsrjuRy7unD31Hh
         hCpDvUoVem8Xahpc1i1hGZyalVjNPo6IDlyFG6/NMC5j7yfm4f7W4N9+ouuO1Yzd8ANw
         paOgbFN9vU8FTWX6Z+uS1hFTw+7CmRO0YUtgCr8+gWftDlLPCOrwh/9lHC/XHwcCfIxF
         24Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wrndUsEYmqCY5OiromaQ3GnufO56h/c2hiAzI8scZ9A=;
        fh=2r1ETiB1zw8iLIrh0bkrNow6EQ9Yv5RKO4k5oESwXpo=;
        b=gROjOSli/M0s8X5S2FQXs2CXIdEmTW0zw+wkP94+PMjv0TZ7jIQGhFkG4UKTWjwjs2
         7udNAUCYt3GGDQftvlaNRKrdCCWkQ2Dv4cuT0+zJoDsg2oarmgYZE8mpiy0UfFMV06IE
         VOTQ2gwwjTHLMd7LrlFFPE5dfq1rnMQzdkz+tbr9R/S8jsYfqTyugRbQmeJeElQ3KPF3
         h7W6F5GMCJ1B4W3GP7RCYU4pMPFvO1x+K5RqSNMHtTKXqF+S+hs3/pXM/kPtR+BmcU8t
         6l7OAh6+3BFXl+TPYQw07hcgL/g/zFkmIgQGEyGot0VCUUhlnhXCjOdH/sPxGQS25u3e
         Z41g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778147645; x=1778752445; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wrndUsEYmqCY5OiromaQ3GnufO56h/c2hiAzI8scZ9A=;
        b=QbEGfhqnuV7+3MruQ0uvXo+I5RZ2VkcPk09ic04+iEC0SiGXdR2jiOqsR68D1CWTKx
         mBQyxuFWpWxSTMs8haNUT2lJHVDK9XRNGlvuLPqDrqhwuivqXn6RJMYub6wlyvl85OTe
         2W6/J7d7FPAUITKOdOyPBquRXm2Aa5nzZnop/52HEXX/8To6eVRqb+zZ8jHAjcL+6FxU
         gAJaqeTpPkkHho60XMqLQzgx+LXNPNKxK91RAZkCcY2MhkPC1nw7l0fyHDzk1dvBaqUO
         /W76H+ll7iNlmMPadw6N6pYuC6Tbj9l4+lPYnD+J1MTX/QASetM9DCxn/ogv3xvgC85H
         dT5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778147645; x=1778752445;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wrndUsEYmqCY5OiromaQ3GnufO56h/c2hiAzI8scZ9A=;
        b=h0J4MdlRzDIi+FQcvuCvck4bgmHI5zFem3YVHImpdLj6oITRnv1rZU5BTHCfmJdE+s
         6/fJFwGS4tKz2H7/hvGB2It9rut+u1IGesOhs56Fq+/ciuJgg85LvzrfVciCmBSGpoam
         qCv13ZsoQrhiAihvWxNSYcm1qxRJ7qregbw4u8gGuDs4050l26265EsxlbQDEUr5SvcS
         0/oaDuSut3OrzLAdmqdMmGaxJpfpn9sRb/YUVd6ChzboKybni2gdDF8GWmiuDvPrEyBa
         CEEns4IrHJzs/K68tSRkcJW/yAjDZs6tOl7vItmGU8mydu5r/oxfAEonEJKAUPrn4pNo
         JjUA==
X-Forwarded-Encrypted: i=1; AFNElJ8LabZJOOHF1z3CddSouJ7KNqDZ/evsQCF3o13BY0E1QOtoImLDXZb1PhfFPvU4LkFLyUff9bd70V8KCg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3YERB4shzc1+XXFHPCw6bJi/YsXxnSXyH4Mk5VQiZro6+QBMn
	K71pQz+PFrtP5z9ixoN7npJGT1SflIHoYyCNKCYPukQHp87cIOtlILV156Xf8eaGrp08TlbyMaf
	AyaDm/uJ1cgufEISmsU7JQmkDd8slPfU=
X-Gm-Gg: AeBDieuMg4exuKPGWUGn2l3D7k4Hntap1TMy5edpxKxExPQshUbp+fhUMnTxBQ1Ajp4
	3ZbWK+QSDgrmP48KRTZv+pYge4PgMDxzlx7ZBJra0QH0LQrtZAEXFfq2AUg5me8CQfojPAiI3g7
	eAUkEwlpSHrbDQzCT3dOzTIs587+JMe/WskoxvCP4XkvKMmEkH2c1tG04u2FCeRHMOKeflLLj+2
	uz/tLfk4gjFidQ5Cjb3RI3LlobIqrXzCMTVULKA3cGhLUkOM+K/AjAy8GtnK7u4YbhSVYWs1XmK
	aySKfa9TegnfjBC+alQ00UoeNXKa2g==
X-Received: by 2002:a53:bf12:0:b0:65c:6220:5fcf with SMTP id
 956f58d0204a3-65c79e5a8a0mr5462411d50.62.1778147645342; Thu, 07 May 2026
 02:54:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260413-orangepi-sd-card-uhs-v8-0-c21c40ec16d0@gmail.com>
 <20260413-orangepi-sd-card-uhs-v8-8-c21c40ec16d0@gmail.com> <CA+Xcp4nY9GVMOmtMG-PNhY2vqP4Cc_amAMSa+M3vuDjWUkuCHw@mail.gmail.com>
In-Reply-To: <CA+Xcp4nY9GVMOmtMG-PNhY2vqP4Cc_amAMSa+M3vuDjWUkuCHw@mail.gmail.com>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Thu, 7 May 2026 11:53:53 +0200
X-Gm-Features: AVHnY4LT9e56Cweesam2LzF6uMchLh2zxP8j2JRmkUPbJrDgBoSBvkiVcFsuGIw
Message-ID: <CABdCQ=OsPva9=YPdBd=3HW1OO7=_zJtpXjvaiA0WLEDT5Scs_Q@mail.gmail.com>
Subject: Re: [PATCH v8 8/9] riscv: dts: spacemit: k1-bananapi-f3: add SD card
 support with UHS modes
To: Margherita Milani <margherita.milani@amarulasolutions.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_025407_368736_99C478F4 
X-CRM114-Status: GOOD (  21.90  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Michael Opdenacker <michael.opdenacker@rootcommit.com>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Troy Mitchell <troy.mitchell@linux.dev>, linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, linux-riscv@lists.infradead.org, Adrian Hunter <adrian.hunter@intel.com>, Palmer Dabbelt <palmer@dabbelt.com>, Yixun Lan <dlan@kernel.org>, Javier Martinez Canillas <javierm@redhat.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, spacemit@lists.linux.dev, Paul Walmsley <pjw@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGksCgpFbCBqdWUsIDcgbWF5IDIwMjYgYSBsYXMgMTA6MjAsIE1hcmdoZXJpdGEgTWlsYW5pCig8
bWFyZ2hlcml0YS5taWxhbmlAYW1hcnVsYXNvbHV0aW9ucy5jb20+KSBlc2NyaWJpw7M6Cj4KPiBH
b29kIG1vcm5pbmcgSWtlciwKPgo+ID4gQWRkIGNvbXBsZXRlIFNEIGNhcmQgY29udHJvbGxlciBz
dXBwb3J0IHdpdGggVUhTIGhpZ2gtc3BlZWQgbW9kZXMuCj4gPgo+ID4gLSBFbmFibGUgc2RoY2kw
IGNvbnRyb2xsZXIgd2l0aCA0LWJpdCBidXMgd2lkdGgKPiA+IC0gQ29uZmlndXJlIGNhcmQgZGV0
ZWN0IEdQSU8gd2l0aCBpbnZlcnNpb24KPiA+IC0gQ29ubmVjdCB2bW1jLXN1cHBseSB0byBidWNr
NCBmb3IgMy4zViBjYXJkIHBvd2VyCj4gPiAtIENvbm5lY3QgdnFtbWMtc3VwcGx5IHRvIGFsZG8x
IGZvciAxLjhWLzMuM1YgSS9PIHN3aXRjaGluZwo+ID4gLSBBZGQgZHVhbCBwaW5jdHJsIHN0YXRl
cyBmb3Igdm9sdGFnZS1kZXBlbmRlbnQgcGluIGNvbmZpZ3VyYXRpb24KPiA+IC0gU3VwcG9ydCBV
SFMtSSBTRFIyNSwgU0RSNTAsIGFuZCBTRFIxMDQgbW9kZXMKPgo+Cj4gVGVzdGVkLWJ5OiBNYXJn
aGVyaXRhIE1pbGFuaSA8bWFyZ2hlcml0YS5taWxhbmlAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4K
PiBIb3dldmVyIEkgbm90aWNlZCBpdCBvbmx5IHdvcmtzIHdoZW4gQ09ORklHX0kyQ19LMSBpcyBl
bmFibGVkLgo+IE1pY2hhZWwgT3BkZW5hY2tlciB0b2xkIG1lIGl0J3MgbmVjZXNzYXJ5IHRvIGVu
YWJsZSB0aGUgcmVndWxhdG9ycwo+IHVzZWQgYnkgdGhlIG1tYyBjb250cm9sbGVyLgo+IFNob3Vs
ZCB3ZSBhZGQgdGhlIGRlcGVuZGVuY3kgYmV0d2VlbiBDT05GSUdfTU1DX1NESENJX09GX0sxIGFu
ZAo+IENPTkZJR19JMkNfSzE/IChVbmxlc3Mgc29tZSBib2FyZHMgZG9uJ3QgaGF2ZSB0aGVzZSBk
ZXBlbmRlbmN5PykKPiBUaGFuayB5b3UgZm9yIHlvdXIgcGF0Y2hzZXQgd2hpY2ggd2FzIHJlYWxs
eSBuaWNlIQoKVGhhbmsgeW91IGZvciBjYXRjaGluZyB0aGlzISBZb3UncmUgYWJzb2x1dGVseSBy
aWdodCBhYm91dCB0aGUgZGVwZW5kZW5jeS4KCkZyb20gd2hhdCBJIGNhbiBzZWUsIGFsbCBjdXJy
ZW50IFNwYWNlbWlUIEsxIGJvYXJkcyBmb2xsb3cgdGhpcyBkZXNpZ24KcGF0dGVybiB3aGVyZSB0
aGUgU0QgY2FyZCBwb3dlciBpcyBwcm92aWRlZCBieSBhbiBJMkMtY29udHJvbGxlZCBQTUlDLgpI
b3dldmVyLCBiZWZvcmUgYWRkaW5nIGEgaGFyZCBkZXBlbmRlbmN5LCBJJ2QgbGlrZSB0byBnZXQg
aW5wdXQgZnJvbQp0aGUgY29tbXVuaXR5LCBkb2VzIGFueW9uZSBrbm93IG9mIEsxLWJhc2VkIGJv
YXJkcyB0aGF0IHByb3ZpZGUgU0QKY2FyZCBwb3dlciB0aHJvdWdoIGZpeGVkIHJlZ3VsYXRvcnMg
b3Igb3RoZXIgbWVhbnMgdGhhdCBkb24ndCByZXF1aXJlCkkyQz8KCj4KPiAtLQo+IE1hcmdoZXJp
dGEgTWlsYW5pCj4gRW1iZWRkZWQgU29mdHdhcmUgRW5naW5lZXIKPiBNLiArMzkgMzM0IDc1OCA5
MTExCj4gbWFyZ2hlcml0YS5taWxhbmlAYW1hcnVsYXNvbHV0aW9ucy5jb20KPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4KPiBBbWFydWxhIFNvbHV0aW9ucyBTUkwKPiBWaWEg
bGUgQ2FuZXZhcmUgMzAsIDMxMTAwLCBUcmV2aXNvLCBWZW5ldG8sIElUCj4gVC4gKzM5ICgwKTQy
IDI0MyA1MzEwCj4gaW5mb0BhbWFydWxhc29sdXRpb25zLmNvbQo+IHd3dy5hbWFydWxhc29sdXRp
b25zLmNvbQo+Cj4gT24gTW9uLCBBcHIgMTMsIDIwMjYgYXQgMTA6MDXigK9BTSBJa2VyIFBlZHJv
c2EgPGlrZXJwZWRyb3NhbUBnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+IEFkZCBjb21wbGV0ZSBT
RCBjYXJkIGNvbnRyb2xsZXIgc3VwcG9ydCB3aXRoIFVIUyBoaWdoLXNwZWVkIG1vZGVzLgo+ID4K
PiA+IC0gRW5hYmxlIHNkaGNpMCBjb250cm9sbGVyIHdpdGggNC1iaXQgYnVzIHdpZHRoCj4gPiAt
IENvbmZpZ3VyZSBjYXJkIGRldGVjdCBHUElPIHdpdGggaW52ZXJzaW9uCj4gPiAtIENvbm5lY3Qg
dm1tYy1zdXBwbHkgdG8gYnVjazQgZm9yIDMuM1YgY2FyZCBwb3dlcgo+ID4gLSBDb25uZWN0IHZx
bW1jLXN1cHBseSB0byBhbGRvMSBmb3IgMS44Vi8zLjNWIEkvTyBzd2l0Y2hpbmcKPiA+IC0gQWRk
IGR1YWwgcGluY3RybCBzdGF0ZXMgZm9yIHZvbHRhZ2UtZGVwZW5kZW50IHBpbiBjb25maWd1cmF0
aW9uCj4gPiAtIFN1cHBvcnQgVUhTLUkgU0RSMjUsIFNEUjUwLCBhbmQgU0RSMTA0IG1vZGVzCj4g
Pgo+ID4gVGhpcyBlbmFibGVzIGZ1bGwgU0QgY2FyZCBmdW5jdGlvbmFsaXR5IGluY2x1ZGluZyBo
aWdoLXNwZWVkIFVIUyBtb2Rlcwo+ID4gZm9yIGltcHJvdmVkIHBlcmZvcm1hbmNlLgo+ID4KPiA+
IFN1Z2dlc3RlZC1ieTogQW5hbmQgTW9vbiA8bGludXguYW1vb25AZ21haWwuY29tPgo+ID4gVGVz
dGVkLWJ5OiBBbmFuZCBNb29uIDxsaW51eC5hbW9vbkBnbWFpbC5jb20+Cj4gPiBTaWduZWQtb2Zm
LWJ5OiBJa2VyIFBlZHJvc2EgPGlrZXJwZWRyb3NhbUBnbWFpbC5jb20+Cj4gPiAtLS0KPiA+ICBh
cmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2sxLWJhbmFuYXBpLWYzLmR0cyB8IDI0ICsrKysr
KysrKysrKysrKysrKysrKystLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRz
L3NwYWNlbWl0L2sxLWJhbmFuYXBpLWYzLmR0cyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2Vt
aXQvazEtYmFuYW5hcGktZjMuZHRzCj4gPiBpbmRleCA1NzkwZDkyN2I5M2QuLmE3ZDg4NTY0NjMw
ZiAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazEtYmFuYW5h
cGktZjMuZHRzCj4gPiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2sxLWJhbmFu
YXBpLWYzLmR0cwo+ID4gQEAgLTIyMCw3ICsyMjAsNyBAQCBidWNrM18xdjg6IGJ1Y2szIHsKPiA+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVndWxhdG9yLWFsd2F5cy1vbjsKPiA+
ICAgICAgICAgICAgICAgICAgICAgICAgIH07Cj4gPgo+ID4gLSAgICAgICAgICAgICAgICAgICAg
ICAgYnVjazQgewo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgYnVjazQ6IGJ1Y2s0IHsKPiA+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVndWxhdG9yLW1pbi1taWNyb3ZvbHQg
PSA8NTAwMDAwPjsKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVndWxhdG9y
LW1heC1taWNyb3ZvbHQgPSA8MzMwMDAwMD47Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHJlZ3VsYXRvci1yYW1wLWRlbGF5ID0gPDUwMDA+Owo+ID4gQEAgLTI0MSw3ICsyNDEs
NyBAQCBidWNrNiB7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlZ3VsYXRv
ci1hbHdheXMtb247Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICB9Owo+ID4KPiA+IC0gICAg
ICAgICAgICAgICAgICAgICAgIGFsZG8xIHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGFs
ZG8xOiBhbGRvMSB7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlZ3VsYXRv
ci1taW4tbWljcm92b2x0ID0gPDUwMDAwMD47Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHJlZ3VsYXRvci1tYXgtbWljcm92b2x0ID0gPDM0MDAwMDA+Owo+ID4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICByZWd1bGF0b3ItYm9vdC1vbjsKPiA+IEBAIC0zNjcsMyAr
MzY3LDIzIEBAIGh1Yl8zXzA6IGh1YkAyIHsKPiA+ICAgICAgICAgICAgICAgICByZXNldC1ncGlv
cyA9IDwmZ3BpbyBLMV9HUElPKDEyNCkgR1BJT19BQ1RJVkVfTE9XPjsKPiA+ICAgICAgICAgfTsK
PiA+ICB9Owo+ID4gKwo+ID4gKyZzZGhjaTAgewo+ID4gKyAgICAgICBwaW5jdHJsLW5hbWVzID0g
ImRlZmF1bHQiLCAidWhzIjsKPiA+ICsgICAgICAgcGluY3RybC0wID0gPCZtbWMxX2NmZz47Cj4g
PiArICAgICAgIHBpbmN0cmwtMSA9IDwmbW1jMV91aHNfY2ZnPjsKPiA+ICsgICAgICAgYnVzLXdp
ZHRoID0gPDQ+Owo+ID4gKyAgICAgICBjZC1ncGlvcyA9IDwmZ3BpbyBLMV9HUElPKDgwKSBHUElP
X0FDVElWRV9ISUdIPjsKPiA+ICsgICAgICAgY2QtaW52ZXJ0ZWQ7Cj4gPiArICAgICAgIGJyb2tl
bi1jZDsKPiA+ICsgICAgICAgbm8tbW1jOwo+ID4gKyAgICAgICBuby1zZGlvOwo+ID4gKyAgICAg
ICBkaXNhYmxlLXdwOwo+ID4gKyAgICAgICBjYXAtc2QtaGlnaHNwZWVkOwo+ID4gKyAgICAgICB2
bW1jLXN1cHBseSA9IDwmYnVjazQ+Owo+ID4gKyAgICAgICB2cW1tYy1zdXBwbHkgPSA8JmFsZG8x
PjsKPiA+ICsgICAgICAgc2QtdWhzLXNkcjI1Owo+ID4gKyAgICAgICBzZC11aHMtc2RyNTA7Cj4g
PiArICAgICAgIHNkLXVocy1zZHIxMDQ7Cj4gPiArICAgICAgIHN0YXR1cyA9ICJva2F5IjsKPiA+
ICt9Owo+ID4KPiA+IC0tCj4gPiAyLjUzLjAKPiA+Cj4gPgo+Cj4KPiAtLQo+IE1hcmdoZXJpdGEg
TWlsYW5pCj4gRW1iZWRkZWQgU29mdHdhcmUgRW5naW5lZXIKPiBNLiArMzkgMzM0IDc1OCA5MTEx
Cj4gbWFyZ2hlcml0YS5taWxhbmlAYW1hcnVsYXNvbHV0aW9ucy5jb20KPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4KPiBBbWFydWxhIFNvbHV0aW9ucyBTUkwKPiBWaWEgbGUg
Q2FuZXZhcmUgMzAsIDMxMTAwLCBUcmV2aXNvLCBWZW5ldG8sIElUCj4gVC4gKzM5ICgwKTQyIDI0
MyA1MzEwCj4gaW5mb0BhbWFydWxhc29sdXRpb25zLmNvbQo+IHd3dy5hbWFydWxhc29sdXRpb25z
LmNvbQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
