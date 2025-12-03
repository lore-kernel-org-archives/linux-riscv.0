Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E59D12D74
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Dec 2025 14:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kw98+lMDYW2F8EJA3mA7Z8xAR+FK2f5piNXoehu85CA=; b=hXhlsxZ5apE1d5
	IaI3yBVjZEtuY2wjgQ+QbVlIbqjAXNiiZcSPCM2kijoCKYTBAW9yOx6LWTOd0GW1S0UBiZ9sEHLAq
	Yp+fueY9Zjjqfj3gIFuceiG5joNLepsylyZIlHLbQbvNUMfTS9rxSFvI8b4yf4cwFVl2T9StUw79V
	Xgb2uUeloknsYswa5pzHTrLJhCxJNn4jh3aXvXtlXIiFlYey22zOwqQswu2DKCnUCHtuaQN17ejaE
	MlPdzZ1mtq6/stj6gLReKOqvyju0RUMKvAKVh2oTbCzvAV0qkqEIud8JUfyjRxmmhvEvT9mBUskP6
	L5ppGSZAKu6OSro13BnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQoGf-00000006fmM-0PpV;
	Wed, 03 Dec 2025 14:55:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQoGd-00000006fm0-0991
	for linux-riscv@lists.infradead.org;
	Wed, 03 Dec 2025 14:55:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B5ABC44253
	for <linux-riscv@lists.infradead.org>; Wed,  3 Dec 2025 14:55:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98FD3C116C6
	for <linux-riscv@lists.infradead.org>; Wed,  3 Dec 2025 14:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764773741;
	bh=Ebi+MnCE/5t0U0PqzYc52NKluRypMQV5WMpgwfOYg44=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sHyow/kcHU9zi9/xm2DIveeWdL2rYnmQRcYbGGNz2G9/B+faW2D+JgEe3kL64S8Y3
	 pQ3XMtJdFa70v2a+sQOzkKuebrRiiq+LOEZUo70EGPkhC+Gk3oPmLgYcKWjquFjIgf
	 fOnDG5czwV8Gt144PmUMKfc2KlNvvFiTIHfd2ZxRJ20kzh5EzLtLs29orUNjnnmGWJ
	 /heSScJE+otS2PCX1lKun15iYY89Aq/UvM6TCnRW03fXmop5JOmStEYGSOgbDkfIEj
	 AirdnAKAHKAOXd8LuWKAPRwl0Ty+IOCM+m2WMmbZ20/IVM+OTLCpeTc4bLwuP0RdUx
	 f5GrlnBL0K2Kw==
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b73a9592fb8so54149066b.1
        for <linux-riscv@lists.infradead.org>; Wed, 03 Dec 2025 06:55:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWWCsd7JUxSVI5Uw2593GAUCLLhv7a3Tq8XnXf5zeYcBHxNNGFYik/87cldCsIStuLfLTiWawUFWkx9ng==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxe6MZCW68UzNXAo/6O/rg9UXtWWnLnQk7mXW8/DnZJxZVbDNGs
	1+euhi2LTlFBTuCNViCn/sZvVsDDvD/AYMCjE75djVcbBrCjKtq01CdSOMsCEY0pQ4fkNTp+E75
	vBYur3hbMdmiK7bMw3PDpRFss+7ro4w==
X-Google-Smtp-Source: AGHT+IHkCgrvRERrLrFDTeXy1B2qCgUBmqim5+wgRWAkYDlUZ89k6F9UbvOiW59P6qHYFbLLcpAABloypkj46Ps3o1U=
X-Received: by 2002:a17:906:794b:b0:b5c:6e0b:3706 with SMTP id
 a640c23a62f3a-b79d61d25aemr381452566b.13.1764773740087; Wed, 03 Dec 2025
 06:55:40 -0800 (PST)
MIME-Version: 1.0
References: <fbe6fc3657070fe2df7f0529043542b52b827449.1763116833.git.geert+renesas@glider.be>
 <dyaqe3ssrn65r5xndlwe7tlbiw2lbwvu3q3lzusfgr5mgycp6h@gfzyxk7uyva7>
 <CAL_JsqJ4q2=UJbuhfbvsbr2T+SRGXsPSXCLk6iXZid_qwYrN4g@mail.gmail.com>
 <bgieskezxsscyg65ihbzq45opwfjavcfut7bz7ywsvufeeaoqe@47hx5fvmsi22>
 <CAL_JsqJ9YUe6cy0YEMLvQhGTGmog6onTA9W5owQBP4q1viijug@mail.gmail.com>
 <5rzkayfk4o37v3xakexmjtkahb4wey2lsaiw2l3qobva5ajhr2@u3lrgkdjgk3x> <CAMuHMdWumcKQaU0hym7xdOzwYZWzhNRtH9RU45ZsLtShkkO53A@mail.gmail.com>
In-Reply-To: <CAMuHMdWumcKQaU0hym7xdOzwYZWzhNRtH9RU45ZsLtShkkO53A@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 3 Dec 2025 08:55:28 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL3kON+0p8PeYeAJO2GdW053aYFo2C20SWQSGQTGV5hag@mail.gmail.com>
X-Gm-Features: AWmQ_bmGax5MgQIaT8SmCAenzOsXCBxckgOQYmwDiMak5ftysFm6cL9v1v1yxGU
Message-ID: <CAL_JsqL3kON+0p8PeYeAJO2GdW053aYFo2C20SWQSGQTGV5hag@mail.gmail.com>
Subject: Re: [PATCH v2] of/irq: Ignore interrupt parent for nodes without interrupts
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Ioana Ciornei <ioana.ciornei@nxp.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Saravana Kannan <saravanak@google.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel@sholland.org>, Marc Zyngier <maz@kernel.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_065543_137241_5703C3F8 
X-CRM114-Status: GOOD (  37.88  )
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

T24gV2VkLCBEZWMgMywgMjAyNSBhdCAzOjU44oCvQU0gR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVy
dEBsaW51eC1tNjhrLm9yZz4gd3JvdGU6Cj4KPiBIaSBJb25hbmEsCj4KPiBPbiBXZWQsIDMgRGVj
IDIwMjUgYXQgMTA6NDgsIElvYW5hIENpb3JuZWkgPGlvYW5hLmNpb3JuZWlAbnhwLmNvbT4gd3Jv
dGU6Cj4gPiBPbiBUdWUsIERlYyAwMiwgMjAyNSBhdCAwMzoxOToxN1BNIC0wNjAwLCBSb2IgSGVy
cmluZyB3cm90ZToKPiA+ID4gT24gVHVlLCBEZWMgMiwgMjAyNSBhdCAxMDozNuKAr0FNIElvYW5h
IENpb3JuZWkgPGlvYW5hLmNpb3JuZWlAbnhwLmNvbT4gd3JvdGU6Cj4gPiA+ID4gT24gTW9uLCBE
ZWMgMDEsIDIwMjUgYXQgMDY6MDk6MTlBTSAtMDYwMCwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gPiA+
ID4gPiBPbiBGcmksIE5vdiAyOCwgMjAyNSBhdCAxMDo0M+KAr0FNIElvYW5hIENpb3JuZWkgPGlv
YW5hLmNpb3JuZWlAbnhwLmNvbT4gd3JvdGU6Cj4gPiA+ID4gPiA+IE9uIEZyaSwgTm92IDE0LCAy
MDI1IGF0IDExOjQ3OjU0QU0gKzAxMDAsIEdlZXJ0IFV5dHRlcmhvZXZlbiB3cm90ZToKPiA+ID4g
PiA+ID4gPiBUaGUgRGV2aWNldHJlZSBTcGVjaWZpY2F0aW9uIHN0YXRlczoKPiA+ID4gPiA+ID4g
Pgo+ID4gPiA+ID4gPiA+ICAgICBUaGUgcm9vdCBvZiB0aGUgaW50ZXJydXB0IHRyZWUgaXMgZGV0
ZXJtaW5lZCB3aGVuIHRyYXZlcnNhbCBvZiB0aGUKPiA+ID4gPiA+ID4gPiAgICAgaW50ZXJydXB0
IHRyZWUgcmVhY2hlcyBhbiBpbnRlcnJ1cHQgY29udHJvbGxlciBub2RlIHdpdGhvdXQgYW4KPiA+
ID4gPiA+ID4gPiAgICAgaW50ZXJydXB0cyBwcm9wZXJ0eSBhbmQgdGh1cyBubyBleHBsaWNpdCBp
bnRlcnJ1cHQgcGFyZW50Lgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gSG93ZXZlciwgb2Zf
aXJxX2luaXQoKSBncmF0dWl0b3VzbHkgYXNzdW1lcyB0aGF0IGEgbm9kZSB3aXRob3V0Cj4gPiA+
ID4gPiA+ID4gaW50ZXJydXB0cyBoYXMgYW4gYWN0dWFsIGludGVycnVwdCBwYXJlbnQgaWYgaXQg
ZmluZHMgYW4KPiA+ID4gPiA+ID4gPiBpbnRlcnJ1cHQtcGFyZW50IHByb3BlcnR5IGhpZ2hlciB1
cCBpbiB0aGUgZGV2aWNlIHRyZWUuICBIZW5jZSB3aGVuIHN1Y2gKPiA+ID4gPiA+ID4gPiBhIHBy
b3BlcnR5IGlzIHByZXNlbnQgKGUuZy4gaW4gdGhlIHJvb3Qgbm9kZSksIHRoZSByb290IGludGVy
cnVwdAo+ID4gPiA+ID4gPiA+IGNvbnRyb2xsZXIgbWF5IG5vdCBiZSBkZXRlY3RlZCBhcyBzdWNo
LCBjYXVzaW5nIGEgcGFuaWM6Cj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiAgICAgT0Y6IG9m
X2lycV9pbml0OiBjaGlsZHJlbiByZW1haW4sIGJ1dCBubyBwYXJlbnRzCj4gPiA+ID4gPiA+ID4g
ICAgIEtlcm5lbCBwYW5pYyAtIG5vdCBzeW5jaW5nOiBObyBpbnRlcnJ1cHQgY29udHJvbGxlciBm
b3VuZC4KPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IENvbW1pdCBlOTEwMzM2MjFkNTZlMDU1
ICgib2YvaXJxOiBVc2UgaW50ZXJydXB0cy1leHRlbmRlZCB0byBmaW5kCj4gPiA+ID4gPiA+ID4g
cGFyZW50IikgYWxyZWFkeSBmaXhlZCBhIGZpcnN0IHBhcnQsIGJ5IGNoZWNraW5nIGZvciB0aGUg
cHJlc2VuY2Ugb2YgYW4KPiA+ID4gPiA+ID4gPiBpbnRlcnJ1cHRzLWV4dGVuZGVkIHByb3BlcnR5
LiAgRml4IHRoZSBzZWNvbmQgcGFydCBieSBvbmx5IGNhbGxpbmcKPiA+ID4gPiA+ID4gPiBvZl9p
cnFfZmluZF9wYXJlbnQoKSB3aGVuIGFuIGludGVycnVwdHMgcHJvcGVydHkgaXMgcHJlc2VudC4K
PiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEdlZXJ0IFV5dHRlcmhv
ZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+Cj4KPiA+ID4gPiA+ID4gVGhpcyBjaGFuZ2Ug
aXJxLWxzLWV4dGlycSBhbmQgY29tbWl0IDZiYTUxYjdiMzRjYSAoIm9mL2lycTogSGFuZGxlCj4g
PiA+ID4gPiA+IGV4cGxpY2l0IGludGVycnVwdCBwYXJlbnQiKSBkb2VzIG5vdCBoZWxwIHdpdGgg
dGhlIGlzc3VlLgo+Cj4gPiA+ID4gSSBqdXN0IHRyaWVkIGNvbnZlcnRpbmcgbHMtZXh0aXJxIHRv
IGEgcHJvcGVyIHBsYXRmb3JtIGRyaXZlciBhbmQgaXQncwo+ID4gPiA+IHByZXR0eSBzdHJhaWdo
dGZvcndhcmQuIFRoZSBwcm9ibGVtIGlzIGdldHRpbmcgdGhhdCBkcml2ZXIgdG8gcHJvYmUgb24K
PiA+ID4gPiB0aGUgbHMtZXh0aXJxIGR0IG5vZGUgc2luY2Ugb2ZfcGxhdGZvcm1fcG9wdWxhdGUo
KSBpcyBub3QgY2FsbGVkIG9uIGl0cwo+ID4gPiA+IHBhcmVudCBub2RlLgo+ID4gPiA+Cj4gPiA+
ID4gSSB3b3VsZCBhdm9pZCBjaGFuZ2luZyB0aGUgRFQgYW5kIGFkZGluZyBhICJzaW1wbGUtYnVz
IiBjb21wYXRpYmxlIHRvCj4gPiA+ID4gdGhlIHBhcmVudCBub2Rlcy4gVGhlIG90aGVyIG9wdGlv
biBpcyB0byBhZGQgYW5vdGhlciBzaW1wbGUgZHJpdmVyIHdoaWNoCj4gPiA+ID4ganVzdCBjYWxs
cyBvZl9wbGF0Zm9ybV9wb3B1bGF0ZSgpIGZvciBhbGwgY29tcGF0aWJsZSBzdHJpbmdzIGRlZmlu
ZWQgaW4KPiA+ID4gPiBmc2wsbGF5ZXJzY2FwZS1zY2ZnLnlhbWwuCj4gPiA+Cj4gPiA+IFRoZSBz
aW1wbGVzdCBzb2x1dGlvbiBtaWdodCBiZSBhZGRpbmcgJ3N5c2NvbicgdG8gdGhlIGRlZmF1bHQg
bWF0Y2gKPiA+ID4gbGlzdCBmb3Igb2ZfcGxhdGZvcm1fcG9wdWxhdGUoKS4gVGhhdCdzIGtpbmQg
b2YgYSBiaWcgaGFtbWVyIHRob3VnaAo+ID4gPiBhbmQgY291bGQgYnJlYWsgc29tZXRoaW5nLiBO
b3Qgc3VyZSwgYnV0IEknbSB3aWxsaW5nIHRvIHN0aWNrIHRoYXQgaW4KPiA+ID4gbGludXgtbmV4
dCBhbmQgc2VlLgo+ID4gPgo+ID4gPiBBbm90aGVyIG9wdGlvbiBpcyBoaWphY2sgdGhlIHNpbXBs
ZS1wbS1idXMgZHJpdmVyIHdoaWNoIGFscmVhZHkgZG9lcwo+ID4gPiBqdXN0IHdoYXQgeW91IHNh
aWQuCj4gPgo+ID4gSSB3b3VsZCBwcmVmZXIgdGhlIHNlY29uZCBvcHRpb24gc2luY2UgdGhhdCBk
b2Vzbid0IGltcGFjdCBvdGhlcgo+ID4gcGxhdGZvcm1zLgo+ID4KPiA+IEdlZXJ0LCBzaW5jZSB5
b3UgYXJlIHRoZSBtb2R1bGUgYXV0aG9yLCBhcmUgeW91IG9rIHdpdGggdGhlIGZvbGxvd2luZwo+
ID4gZGlmZj8KPiA+Cj4gPiAtLS0gYS9kcml2ZXJzL2J1cy9zaW1wbGUtcG0tYnVzLmMKPiA+ICsr
KyBiL2RyaXZlcnMvYnVzL3NpbXBsZS1wbS1idXMuYwo+ID4gQEAgLTE0Miw2ICsxNDIsMTIgQEAg
c3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgc2ltcGxlX3BtX2J1c19vZl9tYXRjaFtd
ID0gewo+ID4gICAgICAgICB7IC5jb21wYXRpYmxlID0gInNpbXBsZS1tZmQiLCAgIC5kYXRhID0g
T05MWV9CVVMgfSwKPiA+ICAgICAgICAgeyAuY29tcGF0aWJsZSA9ICJpc2EiLCAgICAgICAgICAu
ZGF0YSA9IE9OTFlfQlVTIH0sCj4gPiAgICAgICAgIHsgLmNvbXBhdGlibGUgPSAiYXJtLGFtYmEt
YnVzIiwgLmRhdGEgPSBPTkxZX0JVUyB9LAo+ID4gKyAgICAgICB7IC5jb21wYXRpYmxlID0gImZz
bCxsczEwMjFhLXNjZmciLCB9LAo+ID4gKyAgICAgICB7IC5jb21wYXRpYmxlID0gImZzbCxsczEw
NDNhLXNjZmciLCB9LAo+ID4gKyAgICAgICB7IC5jb21wYXRpYmxlID0gImZzbCxsczEwNDZhLXNj
ZmciLCB9LAo+ID4gKyAgICAgICB7IC5jb21wYXRpYmxlID0gImZzbCxsczEwODhhLWlzYyIsIH0s
Cj4gPiArICAgICAgIHsgLmNvbXBhdGlibGUgPSAiZnNsLGxzMjA4MGEtaXNjIiwgfSwKPiA+ICsg
ICAgICAgeyAuY29tcGF0aWJsZSA9ICJmc2wsbHgyMTYwYS1pc2MiLCB9LAo+ID4gICAgICAgICB7
IC8qIHNlbnRpbmVsICovIH0KPiA+ICB9Owo+ID4gIE1PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIHNp
bXBsZV9wbV9idXNfb2ZfbWF0Y2gpOwo+Cj4gRmluZSBmb3IgbWUuCj4KPiBBbHRlcm5hdGl2ZWx5
LCB0aGVzZSBjb3VsZCBiZSBhZGRlZCB0byB0aGUgbWF0Y2hfdGFibGVbXSBpbgo+IGRyaXZlcnMv
b2YvcGxhdGZvcm0uYzpvZl9wbGF0Zm9ybV9kZWZhdWx0X3BvcHVsYXRlKCk/CgpUaGF0IHdvdWxk
IHdvcmsgdG9vLCBidXQgSSB0aGluayB0aGUgZGlyZWN0aW9uIHdlIHNob3VsZCBnbyBpcyB1c2lu
ZyBhCmRyaXZlciBhcyB3ZSd2ZSBhbHNvIGJlZW4gZGlzY3Vzc2luZyBvbiBIZXJ2ZSdzIHNlcmll
cy4KClJvYgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
