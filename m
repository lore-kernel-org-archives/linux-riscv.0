Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F2DDE6748D
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Dec 2025 10:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nV9NLW8+mcpogYxFAf39B9LtwJLFD3fQQg3SQvN9L7I=; b=qS4gCgRWcfS+gR
	DA3cLcSI0JGswz+0oVlbQ1zBupSFQOO5e1s7SpB1Ic+mbNEXSPihmp81JdzIiCW+it+3lXx3r9R1O
	fCkAaRkbiw3jTDgvS3OkqmeViW3beukgzL2pDB3GUJvDCM1NhBSyzS4m9jIiVloAsg3Gj6fOq/nZS
	LddRSDT96fNW4v+84naQzJRkvq1qQIesX2EKPhkzUmkgGz1pTiBlUwMBPUobqtRQKTrd/IHS5R901
	jOFWDpZkk4yemSH04l6RA/9CGLdvf0eU+2K9bGA2cOaSP1pK8f1bg1b0PeCDP6Xre5NVxAs9ctJBq
	RyhLa8hHLadsFicBNG6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXdDv-0000000Dd1V-3cNb;
	Mon, 22 Dec 2025 10:33:07 +0000
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXdDs-0000000Dd15-2uQt
	for linux-riscv@lists.infradead.org;
	Mon, 22 Dec 2025 10:33:06 +0000
Received: by mail-yx1-xb135.google.com with SMTP id 956f58d0204a3-641e9422473so2997455d50.2
        for <linux-riscv@lists.infradead.org>; Mon, 22 Dec 2025 02:33:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766399583; x=1767004383; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HZ0SU/C2/oKhfWTKzkhs1nGoI5MFAeFhWmplQ9HQCxc=;
        b=m5UgyipLVq5XgXsF5wOwx+qaxJk4vblbRLKy8BlhRd70dZ0c+BYl8nY9ildKBJw4eJ
         CMfuObJB8FNgqf31zwbwcP80yhJyonq7d/9M9R+c3gM5OyWD4X/mbPmHKfByb0vzW75v
         vqTBe3jlgS6acEFL/TAvsAxA80M9XotnPSUJKvRpdpXXzO0WjmHrBimTuhc5qhQb+C/m
         7L4oFWWMNtwITVDmOtAJ2yht0gTJuaIXoVGqMp0TJ1fdv2AVDAiJ4DCXh/EPxuvFZUXL
         ELZvRctoRx9PNSaeT53cDOcoQce7pi+jaJ5dX/sJ4dEAcHjYz1PyOE89LJQOsB1kjgvq
         KQQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766399583; x=1767004383;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HZ0SU/C2/oKhfWTKzkhs1nGoI5MFAeFhWmplQ9HQCxc=;
        b=UVFsQLPC7zx5FCqtyqnrr9nPjYHYJnU/OfO9wV3YBvHhIFvBhbYQHwBjbV/5eGvsjS
         dbOuKQ7qIa0qvzkWOxrpD/+YjE1iobRTC9aJfWS4hzEaAh0XukMNvpoY2NrzqlLcabqe
         FhT1aZeDuuWopmwk0wBcR0X01JZtuw4VdGu3slsOVKI6QkC6WaE1dBvEzwhSgH6UBcsd
         jRKcrmy46AfEP++BeLgSSy5gW9j1Hl4h+/M3OxaZ2Q72AR0KR4Egm19p88VoGFSW+lRv
         Tgoxga5eNVaZu/y89JxmViiaxmszTWHbQnNsx+58xZtAlvAcWs5UMXQS3Md7st7SeW79
         vy5g==
X-Forwarded-Encrypted: i=1; AJvYcCXOkR/kn9H1Ilek20xJQhDPpsbNCtMfKZrJ3ymA3vt0DxZDfjKu/c/gMQBzsIyEO1O4yGko7MVBvMZb0w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8bZeXMVNok742gsRiWjQ5ujVtVsBeroy/W4lX8Ii4gUVHPRWg
	1KNUBRa+LZPTp/XcnnutHPy1bkPYzzraY2GCNFyeD+q88sKH+6ZZNJlKtezKju0SsWf5OgqNzHb
	LH7X8yAohC57bZrGj8qnI2VOoaPSSrR/9PNtnQHVe6g==
X-Gm-Gg: AY/fxX6BEd+l07MkhDyX76El9ynDy1nQOyXXUnSODs+L7Rb/2a0dvLF7yRstNtAcEmq
	EaVhA+QAEhQcQiZSYyP6bNTXft0ByS4YbGTM049+PCWUZJ9GsoVa+4BPdD1feaHhMDK2v7ApxTA
	A+Zbnk9RJOZq/gZ/WMlhWVfRyaSahYw23uVF8Qp2/59dkRCYh6SqwZieoXRON3dZuhu22Ko4b77
	XieYd4OWLBEPb9YJowtZ3aPvE3/OQLNSScfYlCszCYxfHd0I4Rc00bP+htOMAXvefpVDVLkwMfJ
	y9z1YWKA4DiYrfSbZFdjzVLUjBtbcB6dB+y8hYKEoA/m2lyLTH3JvMs=
X-Google-Smtp-Source: AGHT+IHqSiya5Umbgv2VxGxG9x9i1trhsH7NUVZ065ciZZb3qy1mhHOdemYINnIm8Q+mAKDGyPq9nLimncteuIce7dM=
X-Received: by 2002:a05:690c:2601:b0:78c:697e:738 with SMTP id
 00721157ae682-78fb3f37a5amr188030327b3.18.1766399583277; Mon, 22 Dec 2025
 02:33:03 -0800 (PST)
MIME-Version: 1.0
References: <20251216-k3-basic-dt-v1-0-a0d256c9dc92@riscstar.com>
 <20251216-k3-basic-dt-v1-7-a0d256c9dc92@riscstar.com> <60948ca2-ed3d-485b-9b11-15df7ef8791d@canonical.com>
 <CAH1PCMb=+TvB1w+G6a2ANDp05HUwC4r6CFBDHXFwSmoP3Mm8xw@mail.gmail.com>
 <f9b6b5e2-ec9e-4208-8267-77020e0a9411@canonical.com> <20251218-basil-quantum-225ce16e4699@spud>
 <CAH1PCMZ3KM9-D3NJ1N2LUHTHFSDVKmGKT5fU8knAL7NnV9E-gw@mail.gmail.com>
 <20251220-repacking-football-c79e660e788a@spud> <4e4c9e7b-d95c-4157-94c3-b06002f94a48@canonical.com>
In-Reply-To: <4e4c9e7b-d95c-4157-94c3-b06002f94a48@canonical.com>
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 22 Dec 2025 18:32:51 +0800
X-Gm-Features: AQt7F2oSFOE7ZFGZpkCtU3yoYwoQ_PEUIGqA90_XBkS-5NyyoL-mIJR7aV4jufs
Message-ID: <CAH1PCMZ=-ONwVuOFLPLOXvW7GfiUsFDxXX8P+mSSvhgDrWTHUA@mail.gmail.com>
Subject: Re: [PATCH 7/8] riscv: dts: spacemit: add initial device tree of
 SpacemiT K3 SoC
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@sifive.com>, Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
	linux-serial@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Samuel Holland <samuel.holland@sifive.com>, Anup Patel <anup@brainfault.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Lubomir Rintel <lkundrak@v3.sk>, Yangyu Chen <cyy@cyyself.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_023305_056162_10664140 
X-CRM114-Status: GOOD (  38.02  )
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

SGksIENvbm9yLCBIZWlucmljaAoKT24gU3VuLCBEZWMgMjEsIDIwMjUgYXQgODoxMOKAr0FNIEhl
aW5yaWNoIFNjaHVjaGFyZHQKPGhlaW5yaWNoLnNjaHVjaGFyZHRAY2Fub25pY2FsLmNvbT4gd3Jv
dGU6Cj4KPiBPbiAxMi8yMS8yNSAwMDoyMywgQ29ub3IgRG9vbGV5IHdyb3RlOgo+ID4gT24gRnJp
LCBEZWMgMTksIDIwMjUgYXQgMTA6MDM6MjRBTSArMDgwMCwgR3VvZG9uZyBYdSB3cm90ZToKPiA+
PiBIaSwgQ29ub3IgYW5kIEhlaW5yaWNoCj4gPj4KPiA+PiBPbiBUaHUsIERlYyAxOCwgMjAyNSBh
dCA4OjU24oCvQU0gQ29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3JnPiB3cm90ZToKPiA+Pj4K
PiA+Pj4gT24gV2VkLCBEZWMgMTcsIDIwMjUgYXQgMDk6MDc6MTRBTSArMDEwMCwgSGVpbnJpY2gg
U2NodWNoYXJkdCB3cm90ZToKPiA+Pj4+IE9uIDEyLzE3LzI1IDA4OjExLCBHdW9kb25nIFh1IHdy
b3RlOgo+ID4+Pgo+ID4+Pj4+IFNwZWNpZmljYWxseSwgSSBtdXN0IGFkaGVyZSB0bwo+ID4+Pj4+
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwg
KGFuZCBjcHVzLnlhbWwgZm9yCj4gPj4+Pj4gcHJvcGVydGllcyBsaWtlICdyaXNjdixzdjM5JyB3
aGljaCBzdGFuZHMgZm9yIHRoZSBleHRlbnNpb24gU3YzOSkuIElmIEkKPiA+Pj4+PiBhZGQgZXh0
ZW5zaW9uIHN0cmluZ3MgdGhhdCBhcmUgbm90IHlldCBkZWZpbmVkIGluIHRoZXNlIHNjaGVtYXMs
IHN1Y2ggYXMKPiA+Pj4+PiBzdXBtLCBydW5uaW5nICdtYWtlIGR0YnNfY2hlY2sgVz0zJyBmYWls
cyB3aXRoOiAnc3VwbScgaXMgbm90IG9uZSBvZgo+ID4+Pj4+IFsnaScsICdtJywgJ2EnLCAuLi5d
LCBmb2xsb3dlZCBieSAiVW5ldmFsdWF0ZWQgcHJvcGVydGllcyBhcmUgbm90IGFsbG93ZWQuIgo+
ID4+Pj4KPiA+Pj4+IElmIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9l
eHRlbnNpb25zLnlhbWwgaXMgaW5jb21wbGV0ZQo+ID4+Pj4gd2l0aCByZXNwZWN0IHRvIHJhdGlm
aWVkIGV4dGVuc2lvbnMsIEkgZ3Vlc3MgdGhlIHJpZ2h0IGFwcHJvYWNoIGlzIHRvIGFtZW5kCj4g
Pj4+PiBpdCBhbmQgbm90IHRvIGN1cnRhaWwgdGhlIENQVSBkZXNjcmlwdGlvbi4KPiA+Pj4KPiA+
Pj4gQWJzb2x1dGVseS4gSWYgdGhlIGNwdSBzdXBwb3J0cyBzb21ldGhpbmcgdGhhdCBpcyBub3Qg
ZG9jdW1lbnRlZCwgdGhlbgo+ID4+PiBwbGVhc2UgZG9jdW1lbnQgaXQgcmF0aGVyIHRoYW4gb21p
dCBmcm9tIHRoZSBkZXZpY2V0cmVlLgo+ID4+Cj4gPj4gVGhhbmtzIGZvciB0aGUgcmV2aWV3LiBN
YXkgSSBjbGFyaWZ5IG9uZSB0aGluZz8gQm90aCBvZiB5b3UgbWVudGlvbmVkCj4gPj4gZG9jdW1l
bnQgdGhlbSwgZ2l2ZW4gdGhlIGFtb3VudCBvZiBtaXNzaW5nIGV4dGVuc2lvbnMsIGlzIGl0IGFj
Y2VwdGFibGUgaWYKPiA+PiBJIHN1Ym1pdCBhIHByZXJlcXVpc2l0ZSBwYXRjaCB0aGF0IG9ubHkg
ZG9jdW1lbnRzIHRoZXNlIHN0cmluZ3MgaW4KPiA+PiByaXNjdi9leHRlbnNpb25zLnlhbWwgcGx1
cyB0aGUgbmVjZXNzYXJ5IGh3cHJvYmUgZXhwb3J0PyBMZWF2aW5nIHRoZSBhY3R1YWwKPiA+PiB1
c2FnZSBvZiB0aGVzZSBleHRlbnNpb25zIChuYW1lZCBmZWF0dXJlcykgdG8gdGhlIGZ1dHVyZSBw
YXRjaGVzLgo+ID4+Cj4gPj4gVG8gcHJvdmlkZSBzb21lIGNvbnRleHQgb24gd2h5IEkgYXNrOiBJ
J3ZlIGludmVzdGlnYXRlZCB0aGUgY29tbWl0cyAmIGxrbWwKPiA+PiBoaXN0b3J5IG9mIFJJU0Mt
ViBleHRlbnNpb25zIHNpbmNlIHY2LjUsIGFuZCBJIHN1bW1hcml6ZWQgdGhlIGN1cnJlbnQgc3Rh
dHVzCj4gPj4gcmVnYXJkaW5nIHRoZSBSVkEyMyBwcm9maWxlIGhlcmU6Cj4gPj4gWzFdIHN0YXR1
cyBpbiB2Ni4xOCAoaW5jLiB2Ni4xOS1yYzEpOgo+ID4+IGh0dHBzOi8vZG9jdWxhcnh1LmdpdGh1
Yi5pby9ydmEyMy9saW51eC1rZXJuZWwtY292ZXJhZ2UuaHRtbAo+ID4+IFsyXSBzdXBwb3J0IGV2
b2x1dGlvbiBzaW5jZSB2Ni41Ogo+ID4+IGh0dHBzOi8vZG9jdWxhcnh1LmdpdGh1Yi5pby9ydmEy
My9ydmEyMy1rZXJuZWwtc3VwcG9ydC1ldm9sdXRpb24uaHRtbAo+ID4+Cj4gPj4gU3RyaWN0bHkg
ZGVzY3JpYmluZyB0aGUgU3BhY2VtaVQgWDEwMC9LMyAob3IgYW55IGNvcmUpIGFzIFJWQTIzLWNv
bXBsaWFudAo+ID4+IHJlcXVpcmVzIGFkZGluZyB0aGVzZSBleHRlbnNpb25zIHRoYXQgYXJlIGN1
cnJlbnRseSBtaXNzaW5nIGZyb20KPiA+PiB0aGUga2VybmVsIGJpbmRpbmdzOgo+ID4+IFJWQTIz
VTY0OiBaaWNjaWYsIFppY2NhbW9hLCBaaWNjbHNtLCBaYTY0cnMKPiA+PiBSVkEyM1M2NDogU3Mx
cDEzLCBTc2NjcHRyLCBTc3R2ZWNkLCBTc3R2YWxhLCBTc2NvdW50ZXJlbncsIFNzdTY0eGwsCj4g
Pj4gICAgICAgICAgICBTaGEsIFNoY291bnRlcmVudywgU2h2c3R2YWxhLCBTaHR2YWxhLCBTaHZz
dHZlY2QsIFNodnNhdHBhLCBTaGdhdHBhCj4gPgo+ID4KPiA+PiBQbHVzICdTdXBtJywgJ1ppYzY0
YicsICdTc3N0YXRlZW4nLCAnQicgd2hlcmUgdGhlIGtlcm5lbCBzdXBwb3J0cyB0aGVtIGJ1dAo+
ID4+IHRoZXkgYXJlIG5vdCBsaXRlcmFsbHkgZG9jdW1lbnRlZCBpbiB5YW1sLgo+ID4KPiA+IEkg
ZG9uJ3QgdGhpbmsgU3VwbSBpcyBzdWl0YWJsZSBmb3IgZGV2aWNldHJlZSwgZG9lc24ndCBpdCBk
ZXNjcmliZQo+ID4gd2hhdCB0aGUga2VybmVsL3VzZXJzcGFjZSBhcmUgY2FwYWJsZSBvZiByYXRo
ZXIgdGhhbiBoYXJkd2FyZT8KCkkgc2VlIHlvdXIgcG9pbnQuIFdoaWxlIHRoZSBQb2ludGVyIE1h
c2tpbmcgc3BlYyAodjEuMCkgZG9lcyBkaXN0aW5ndWlzaGVzClN1cG0gKGFuZCBTc3BtKSBhcyBl
eHRlbnNpb25zIGRlc2NyaWJpbmcgYW4gZXhlY3V0aW9uIGVudmlyb25tZW50LCBpdCBhbHNvCnN0
YXRlcyB0aGVzZSBhcmUgaW50ZW5kZWQgdG8gYmUgdXNlZCBpbiBwcm9maWxlIHNwZWNzLgoKV2l0
aCBSVkEyMyByYXRpZmljYXRpb24sIFN1cG0gaXMgZm9ybWFsbHkgaW5jbHVkZWQgYXMgYSBtYW5k
YXRvcnkgZXh0ZW5zaW9uCmluIHRoZSBSVkEyM1M2NCBwcm9maWxlLgoKSWYgcmlzY3YsaXNhLWV4
dGVuc2lvbnMgcHJvcGVydHkgaXMgdGhlIHN0YW5kYXJkIHdheSAoYW5kIEkgYmVsaWV2ZSBpdCBp
cykKdG8gZGVzY3JpYmUgYSBSSVNDLVYgQ1BVIGFib3V0IGl0cyBjb21wbGlhbmNlIHdpdGggcmF0
aWZpZWQgcHJvZmlsZSwgdGhlbiBJCmJlbGlldmUgU3VwbSBzaG91bGQgYmUgaW5jbHVkZWQgaW4g
dGhlIFlBTUwgYmluZGluZywgYWxvbmdzaWRlIG90aGVyCmV4dGVuc2lvbnMuCgo+ID4gWmljNjRi
IGRvZXNuJ3Qgc291bmQgbGlrZSBoYXJkd2FyZSBkZXNjcmlwdGlvbiAoc28gbm90IHJlYWxseSBz
dWl0YWJsZQo+ID4gZm9yIGRldmljZXRyZWUgZWl0aGVyKSBidXQgYmxvY2sgc2l6ZSBpbmZvcm1h
dGlvbiBpcyBhbHJlYWR5IHJlcHJlc2VudGVkCj4gPiBieSBzb21lIGV4aXN0aW5nIHByb3BlcnRp
ZXMgKHNlZSByaXNjdixjYm8qLWJsb2NrLXNpemUgaW4gcmlzY3YvY3B1cy55YW1sKQo+ID4gYW5k
IGR1cGxpY2F0aW5nIHRoYXQgaW5mb3JtYXRpb24gaXMgbm90IHJlYWxseSBhIGdyZWF0IGlkZWEu
CgpZZXMuIFRoYW5rcyBmb3IgY2xhcmlmeWluZyB0aGlzLgoKRXZlbiBaaWM2NGIgY2FuIGJlIGFk
ZCwgdGhlbiBzb21lIGtpbmQgb2Ygc2NoZW1hIGNoZWNrIHNob3VsZCBiZSBpbXBsZW1lbnRlZAp0
byBhdm9pZCB0aGUgcG90ZW50aWFsIGFuZCBwb3NzaWJsZSBtaXNtYXRjaCwgYW5kIGVuc3VyZQpy
aXNjdixjb2IqLWJsb2NrLXNpemUgaW4gY3B1cy55YW1sIGFyZSA2NCBieXRlcy4gRHVwbGljYXRp
b24gaXMgbm90IGdvb2QuCgo+ID4KPiA+IEknbGwgYWRtaXQgdGhhdCBJIGRvIG5vdCByZWFsbHkg
dW5kZXJzdGFuZCBTeHN0YXRlZW4gYW5kIGhvdyB0aGV5IHdvcmssCj4gPiBidXQgbXkgdW5kZXJz
dGFuZGluZyB3YXMgdGhhdCBrbm93aW5nIGFib3V0IFNtc3RhdGVlbiBpcyBzdWZmaWNpZW50IGFu
ZAo+ID4gaW1wbGllZCBTc3RhdGVlbiwgYnV0IGhhdmluZyBTc3N0YXRlZW4gZGVmaW5lZCBzZWVt
cyBoYXJtbGVzcyBhbmQKPiA+IHBvc3NpYmxlLiBJIHRoaW5rIGt2bSBpcyB0aGUgb25seSB1c2Vy
IG9mIHRoaXMgYXQgdGhlIG1vbWVudCwgc28KPiA+IHByb2JhYmx5IHdvcnRoIENDaW5nIEFudXAg
YW5kIG1heWJlIERyZXcgSm9uZXMgb24gdGhlIHBhdGNoIGFkZGluZwo+ID4gU3NzdGF0ZWVuIHRv
IG1ha2Ugc3VyZSBpdCBtYWtlcyBzZW5zZS4KCkkgd2lsbCBDYyB0aGVtLiBUaGFua3MgZm9yIHlv
dXIgYWR2aWNlLgoKPgo+IFN1cG0gaXMgZGVzY3JpYmVkIGluCj4KPiBSSVNDLVYgUG9pbnRlciBN
YXNraW5nCj4gVmVyc2lvbiAxLjAsIDEwLzIwMjQ6IFJhdGlmaWVkCj4gaHR0cHM6Ly9yYXcuZ2l0
aHVidXNlcmNvbnRlbnQuY29tL3Jpc2N2L3Jpc2N2LWotZXh0ZW5zaW9uL21hc3Rlci96anBtLXNw
ZWMucGRmCj4KPiBUaGUgaW50ZXJwcmV0YXRpb24gdGFrZW4gYnkgUUVNVSBoYXMgYmVlbjoKPgo+
ICogU3VwbSBpbXBsaWVzIFNzbnBtIGFuZCBTbW5wbQo+ICogUlZBMjMgY2FwYWJsZSBtYWNoaW5l
IG1vZGVscyBkaXNwbGF5IGl0IGluIHRoZSBkZXZpY2UtdHJlZQo+Cj4gSWYgU3VwbSBpcyBub3Qg
c2hvd24gaW4gdGhlIGRldmljZS10cmVlLCBzb2Z0d2FyZSBtaWdodCBhc3N1bWUgdGhhdCB0aGUK
PiBzeXN0ZW0gZG9lcyBub3Qgc3VwcG9ydCBwb2ludGVyIG1hc2tpbmcgaW4gdXNlciBtb2RlIGFu
ZCBpcyBub3QgUlZBMjMKPiBjb21wbGlhbnQuCj4KPiBIZW5jZSBJIHdvdWxkIHN1Z2dlc3Q6Cj4K
PiBJZiB0aGUgWDEwMCBjb3JlcyBoYXZlIFNzbnBtIGFuZCBTbW5wbSwgYWRkIFN1cG0gdG8gdGhl
IGRldmljZS10cmVlLgoKVGhhbmtzLiBIZWlucmljaC4KTGV0IG1lIGFkZCBTdXBtIGluIG15IG5l
eHQgdmVyc2lvbi4KCkJSLApHdW9kb25nCgo+Cj4gSWYgdGhlIGtlcm5lbCBkb2VzIG5vdCBzdXBw
b3J0IHVzZXIgc3BhY2UgcG9pbnRlciBtYXNraW5nLCB0aGUga2VybmVsCj4gc2hvdWxkIGZpbHRl
ciBvdXQgU3VwbSBhbmQgbm90IGFubm91bmNlIGl0LCBuZWl0aGVyIGluIC9wcm9jL2NwdWluZm8g
bm9yCj4gdmlhIGh3cHJvYmUuCj4KPiBCZXN0IHJlZ2FyZHMKPgo+IEhlaW5yaWNoCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
