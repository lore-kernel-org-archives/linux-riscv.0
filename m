Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90E1ED116F3
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Dec 2025 14:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NABCBg5nCngSbFh+BffADT3dkbveKcf3qfaivWrK3nU=; b=kJ/1vq8nPf01Cb
	k1Dvk0x07JJG+DtaZUgBiTmxoYXgl0aOw2d3q7RplFct3swC2B7MjzSVmAkFdRWeAZvWRwxlZhvTU
	H/jZEXlNGZs7vHljH/jt+Ue+Y/pvmRw9Cmw/Yx6vzSi02avL4NV8c0h+vVFFY4Ta8lHksewDnvhDC
	LJQ/Lezv0fj5os1Za4ij5Hm9naXdHpz72u6vVJXPC/7ZleoTszhSuIzAnysgGWTwypAC8rHWztYtH
	dvx6woHOzjA3Fw+pFXQ4OHxueMiCXPuyhQW774fTK3SHaEn/GvSpJ1KheSUfAUnVPgIECSCSPDRip
	e9nAaj8yuCLJ0efeHDEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ4zO-000000045f9-0oCr;
	Mon, 01 Dec 2025 14:34:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ4zL-000000045eb-1F75
	for linux-riscv@lists.infradead.org;
	Mon, 01 Dec 2025 14:34:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A47BF43C82
	for <linux-riscv@lists.infradead.org>; Mon,  1 Dec 2025 14:34:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83E63C4CEF1
	for <linux-riscv@lists.infradead.org>; Mon,  1 Dec 2025 14:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764599690;
	bh=o3Z6L0iRu7JBb6a+rLYFwtgDizArktN6c8/NKR6sbew=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=l976On9QQR85pAQl0obkl9Ctdj7dLR94Mzv/pMSxc/2Juqy4+ASzM/hFJgedWOTLJ
	 Ct2FQ6DLKw6Of/SVMHF4cvRJwqnoIxBanjgiChnjjkhsS27igj1GMBnHHF2oFGop/s
	 LD96vQGZZ9r7oNmG1hBorWlS3QX/FwT27jTGFySSC/9ps9o8b2IpCWExrI6BxNjll0
	 c7/z+nZ++naPZJBS/g1kbUfjWmah/Gq4vcQQHd8WMJXVkTZudLoRVSoiO6fOONVjx1
	 vGcwrFq3/jgT3yUJzoiJfC/1gtU1to+5bNkU6DIZTy7tV2AiiYXniBWk1FF+fY2W79
	 u7tIu5wxke9Uw==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-64175dfc338so8152104a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 01 Dec 2025 06:34:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUXzJ1MX9j+uUY7AWRsYarA6pe+woXXmcfViMqvRwyX3Q2pQnUjs1DwYd2uGRYUdTWD1HwlXYADVWmTFw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyG2lcT2TUH+CPuWykRTuEN7+i9o+/CB9XYufcNzZBGhVE45aVv
	xscTf4OheAGF0eei/AYJy4HuZOqbOv+Nv7QUdXGnyvFvY8Z4yVboxnvfoK2TUxfOug6jFmA79sN
	uJNOPQnpkK28zXixc9S1SHLelXBIZGA==
X-Google-Smtp-Source: AGHT+IGZh9DruSG0PEbPS75zrnc5WGkF/VK+YNeCQb80LR7bexhyB4OvRJ5DQoBp3aPrktG+XBwn8tcbNGl/H/0sW/8=
X-Received: by 2002:a17:907:94c9:b0:b72:9961:dc04 with SMTP id
 a640c23a62f3a-b7671703d94mr4713493666b.28.1764599689008; Mon, 01 Dec 2025
 06:34:49 -0800 (PST)
MIME-Version: 1.0
References: <fbe6fc3657070fe2df7f0529043542b52b827449.1763116833.git.geert+renesas@glider.be>
 <dyaqe3ssrn65r5xndlwe7tlbiw2lbwvu3q3lzusfgr5mgycp6h@gfzyxk7uyva7>
 <CAL_JsqJ4q2=UJbuhfbvsbr2T+SRGXsPSXCLk6iXZid_qwYrN4g@mail.gmail.com> <CAMuHMdXsZwDaT8L5z9KzyX0FF4WVbvZhsGAtSK7pJ=nCr4hE4Q@mail.gmail.com>
In-Reply-To: <CAMuHMdXsZwDaT8L5z9KzyX0FF4WVbvZhsGAtSK7pJ=nCr4hE4Q@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 1 Dec 2025 08:34:37 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKYzWQr7AJFSHj4gJPDtxogFrPk=7NS0HKa-ay00fpV_w@mail.gmail.com>
X-Gm-Features: AWmQ_blyKVkMKCugvCh0EMBfIrbVAJgwbaORavR9EyO3QVbtZQXo5zZRXe74wm0
Message-ID: <CAL_JsqKYzWQr7AJFSHj4gJPDtxogFrPk=7NS0HKa-ay00fpV_w@mail.gmail.com>
Subject: Re: [PATCH v2] of/irq: Ignore interrupt parent for nodes without interrupts
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Ioana Ciornei <ioana.ciornei@nxp.com>, Saravana Kannan <saravanak@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel@sholland.org>, Marc Zyngier <maz@kernel.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_063451_462107_37D7A590 
X-CRM114-Status: GOOD (  34.18  )
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

T24gTW9uLCBEZWMgMSwgMjAyNSBhdCA2OjUy4oCvQU0gR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVy
dEBsaW51eC1tNjhrLm9yZz4gd3JvdGU6Cj4KPiBIaSBSb2IsCj4KPiBUaGFua3MsIEkgd2FzIGp1
c3QgbG9va2luZyBpbnRvIHRoaXMuLi4KPgo+IE9uIE1vbiwgMSBEZWMgMjAyNSBhdCAxMzowOSwg
Um9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiBPbiBGcmksIE5vdiAyOCwg
MjAyNSBhdCAxMDo0M+KAr0FNIElvYW5hIENpb3JuZWkgPGlvYW5hLmNpb3JuZWlAbnhwLmNvbT4g
d3JvdGU6Cj4gPiA+IE9uIEZyaSwgTm92IDE0LCAyMDI1IGF0IDExOjQ3OjU0QU0gKzAxMDAsIEdl
ZXJ0IFV5dHRlcmhvZXZlbiB3cm90ZToKPiA+ID4gPiBUaGUgRGV2aWNldHJlZSBTcGVjaWZpY2F0
aW9uIHN0YXRlczoKPiA+ID4gPgo+ID4gPiA+ICAgICBUaGUgcm9vdCBvZiB0aGUgaW50ZXJydXB0
IHRyZWUgaXMgZGV0ZXJtaW5lZCB3aGVuIHRyYXZlcnNhbCBvZiB0aGUKPiA+ID4gPiAgICAgaW50
ZXJydXB0IHRyZWUgcmVhY2hlcyBhbiBpbnRlcnJ1cHQgY29udHJvbGxlciBub2RlIHdpdGhvdXQg
YW4KPiA+ID4gPiAgICAgaW50ZXJydXB0cyBwcm9wZXJ0eSBhbmQgdGh1cyBubyBleHBsaWNpdCBp
bnRlcnJ1cHQgcGFyZW50Lgo+ID4gPiA+Cj4gPiA+ID4gSG93ZXZlciwgb2ZfaXJxX2luaXQoKSBn
cmF0dWl0b3VzbHkgYXNzdW1lcyB0aGF0IGEgbm9kZSB3aXRob3V0Cj4gPiA+ID4gaW50ZXJydXB0
cyBoYXMgYW4gYWN0dWFsIGludGVycnVwdCBwYXJlbnQgaWYgaXQgZmluZHMgYW4KPiA+ID4gPiBp
bnRlcnJ1cHQtcGFyZW50IHByb3BlcnR5IGhpZ2hlciB1cCBpbiB0aGUgZGV2aWNlIHRyZWUuICBI
ZW5jZSB3aGVuIHN1Y2gKPiA+ID4gPiBhIHByb3BlcnR5IGlzIHByZXNlbnQgKGUuZy4gaW4gdGhl
IHJvb3Qgbm9kZSksIHRoZSByb290IGludGVycnVwdAo+ID4gPiA+IGNvbnRyb2xsZXIgbWF5IG5v
dCBiZSBkZXRlY3RlZCBhcyBzdWNoLCBjYXVzaW5nIGEgcGFuaWM6Cj4gPiA+ID4KPiA+ID4gPiAg
ICAgT0Y6IG9mX2lycV9pbml0OiBjaGlsZHJlbiByZW1haW4sIGJ1dCBubyBwYXJlbnRzCj4gPiA+
ID4gICAgIEtlcm5lbCBwYW5pYyAtIG5vdCBzeW5jaW5nOiBObyBpbnRlcnJ1cHQgY29udHJvbGxl
ciBmb3VuZC4KPiA+ID4gPgo+ID4gPiA+IENvbW1pdCBlOTEwMzM2MjFkNTZlMDU1ICgib2YvaXJx
OiBVc2UgaW50ZXJydXB0cy1leHRlbmRlZCB0byBmaW5kCj4gPiA+ID4gcGFyZW50IikgYWxyZWFk
eSBmaXhlZCBhIGZpcnN0IHBhcnQsIGJ5IGNoZWNraW5nIGZvciB0aGUgcHJlc2VuY2Ugb2YgYW4K
PiA+ID4gPiBpbnRlcnJ1cHRzLWV4dGVuZGVkIHByb3BlcnR5LiAgRml4IHRoZSBzZWNvbmQgcGFy
dCBieSBvbmx5IGNhbGxpbmcKPiA+ID4gPiBvZl9pcnFfZmluZF9wYXJlbnQoKSB3aGVuIGFuIGlu
dGVycnVwdHMgcHJvcGVydHkgaXMgcHJlc2VudC4KPiA+ID4gPgo+ID4gPiA+IFNpZ25lZC1vZmYt
Ynk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+Cj4KPiA+ID4g
PiAtLS0gYS9kcml2ZXJzL29mL2lycS5jCj4gPiA+ID4gKysrIGIvZHJpdmVycy9vZi9pcnEuYwo+
ID4gPiA+IEBAIC02MTMsNyArNjEzLDcgQEAgdm9pZCBfX2luaXQgb2ZfaXJxX2luaXQoY29uc3Qg
c3RydWN0IG9mX2RldmljZV9pZCAqbWF0Y2hlcykKPiA+ID4gPiAgICAgICAgICAgICAgICAqIGFy
ZSB0aGUgc2FtZSBkaXN0YW5jZSBhd2F5IGZyb20gdGhlIHJvb3QgaXJxIGNvbnRyb2xsZXIuCj4g
PiA+ID4gICAgICAgICAgICAgICAgKi8KPiA+ID4gPiAgICAgICAgICAgICAgIGRlc2MtPmludGVy
cnVwdF9wYXJlbnQgPSBvZl9wYXJzZV9waGFuZGxlKG5wLCAiaW50ZXJydXB0cy1leHRlbmRlZCIs
IDApOwo+ID4gPiA+IC0gICAgICAgICAgICAgaWYgKCFkZXNjLT5pbnRlcnJ1cHRfcGFyZW50KQo+
ID4gPiA+ICsgICAgICAgICAgICAgaWYgKCFkZXNjLT5pbnRlcnJ1cHRfcGFyZW50ICYmIG9mX3By
b3BlcnR5X3ByZXNlbnQobnAsICJpbnRlcnJ1cHRzIikpCj4gPiA+ID4gICAgICAgICAgICAgICAg
ICAgICAgIGRlc2MtPmludGVycnVwdF9wYXJlbnQgPSBvZl9pcnFfZmluZF9wYXJlbnQobnApOwo+
ID4gPiA+ICAgICAgICAgICAgICAgaWYgKGRlc2MtPmludGVycnVwdF9wYXJlbnQgPT0gbnApIHsK
PiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgb2Zfbm9kZV9wdXQoZGVzYy0+aW50ZXJydXB0
X3BhcmVudCk7Cj4KPiA+ID4gVGhpcyBjaGFuZ2UgaXJxLWxzLWV4dGlycSBhbmQgY29tbWl0IDZi
YTUxYjdiMzRjYSAoIm9mL2lycTogSGFuZGxlCj4gPiA+IGV4cGxpY2l0IGludGVycnVwdCBwYXJl
bnQiKSBkb2VzIG5vdCBoZWxwIHdpdGggdGhlIGlzc3VlLgo+ID4gPgo+ID4gPiBUaGlzIGlzIGhv
dyB0aGUgRFQgbm9kZSBpbiBseDIxNjBhLmR0c2kgbG9va3MgbGlrZToKPiA+Cj4gPiBscy1leHRp
cnEgc3RyaWtlcyBhZ2FpbiEKPiA+Cj4gPiBJIHRoaW5rIHNvbWV0aGluZyBsaWtlIHRoaXMgc2hv
dWxkIGZpeCBpdDoKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9vZi9pcnEuYyBiL2RyaXZl
cnMvb2YvaXJxLmMKPiA+IGluZGV4IDIyNzExMTBiNWY3Yy4uYzA2Yzc0YWVmODAxIDEwMDY0NAo+
ID4gLS0tIGEvZHJpdmVycy9vZi9pcnEuYwo+ID4gKysrIGIvZHJpdmVycy9vZi9pcnEuYwo+ID4g
QEAgLTU5Myw3ICs1OTMsOCBAQCB2b2lkIF9faW5pdCBvZl9pcnFfaW5pdChjb25zdCBzdHJ1Y3Qg
b2ZfZGV2aWNlX2lkICptYXRjaGVzKQo+ID4gICAgICAgICAgICAgICAgICAqIGFyZSB0aGUgc2Ft
ZSBkaXN0YW5jZSBhd2F5IGZyb20gdGhlIHJvb3QgaXJxIGNvbnRyb2xsZXIuCj4gPiAgICAgICAg
ICAgICAgICAgICovCj4gPiAgICAgICAgICAgICAgICAgZGVzYy0+aW50ZXJydXB0X3BhcmVudCA9
IG9mX3BhcnNlX3BoYW5kbGUobnAsICJpbnRlcnJ1cHRzLWV4dGVuZGVkIiwgMCk7Cj4gPiAtICAg
ICAgICAgICAgICAgaWYgKCFkZXNjLT5pbnRlcnJ1cHRfcGFyZW50ICYmIG9mX3Byb3BlcnR5X3By
ZXNlbnQobnAsICJpbnRlcnJ1cHRzIikpCj4gPiArICAgICAgICAgICAgICAgaWYgKCFkZXNjLT5p
bnRlcnJ1cHRfcGFyZW50ICYmCj4gPiArICAgICAgICAgICAgICAgICAgIChvZl9wcm9wZXJ0eV9w
cmVzZW50KG5wLCAiaW50ZXJydXB0cyIpIHx8IG9mX3Byb3BlcnR5X3ByZXNlbnQobnAsICJpbnRl
cnJ1cHQtbWFwIikpCj4KPiBUaGF0IHNob3VsZCBpbmRlZWQgcmVzdG9yZSB0aGUgcHJldmlvdXMg
YmVoYXZpb3IsIGFuZCBmaW5kIGFnYWluCj4gImludGVycnVwdC1wYXJlbnQgPSAmZ2ljIiBpbiB0
aGUgcm9vdCBub2RlLiAgSG93ZXZlciwgd291bGRuJ3QgaXQKPiBiZSBtb3JlIGNvcnJlY3QgdG8g
Zm9sbG93IHRoZSBhcHByb2FjaCB1c2VkIGZvciBpbnRlcnJ1cHRzLWV4dGVuZGVkLAo+IGFuZCB1
c2UgdGhlIGZpcnN0IGludGVycnVwdCBwYXJlbnQgZnJvbSB0aGUgaW50ZXJydXB0LW1hcCAod2hp
Y2ggaXMKPiBjb2luY2lkZW50YWxseSAmZ2ljLCB0b28pPwoKWW91IG1pZ2h0IG5vdGljZSB0aGlz
IGJpbmRpbmcgaXMgaW4gdGhlIGludGVycnVwdC1tYXAgYWJ1c2VycyBsaXN0CndoaWNoIGlzIGJh
c2ljYWxseSB0aGUgbGlzdCBvZiBjYXNlcyB0aGF0IHRoZSBpbnRlcnJ1cHQgcGFyc2luZyBjb2Rl
CnNob3VsZCBpZ25vcmUgJ2ludGVycnVwdC1tYXAnLiBTbyBJIHRoaW5rIHRoZSBsZXNzIHdlIGxv
b2sgaW50byBpdCwKdGhlIGJldHRlci4KCkkgdGhpbmsgd2Ugc2hvdWxkIGRvIHRoZSBhYm92ZSBm
b3Igbm93IGFuZCB0aGVuIHJldmVydCBpdCB3aGVuIHRoZQpscy1leHRpcnEgaXMgY29udmVydGVk
IHRvIGEgcHJvcGVyIGRyaXZlci4KClJvYgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
