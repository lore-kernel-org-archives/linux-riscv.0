Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5BA1D778BF
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Jan 2026 01:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KZxUyyuapgS/gjco1Ams1diM1dLA5tlAwCqdESb/dOI=; b=zUPFNiBcR5vXsN
	N58CWVfo6ST7LsLpG2e0zGn22EIAD61tqCCS22Q0dQl/DvZuPbMxG5DCVWk0h8WUtRonyoOHcJgoi
	t4c0T/mD+Y5XCz8sEbzcE8ybeJKQubMy4gGbOW1W4+xzO5ypILsHgvwdZR4CVWDnNilQFa8sJKOFR
	pfCXel+SmX48FSe+pDQ48PLL96/qw1u6Wefms5OeJMuvkTTObJBspjBJUguWpGWM8TNU5GE0wRNcE
	KGPenMFr+MGomIgFCBXkCVjMOKVCYkvLyOzzGf+Scxc7PNUG92spXETFf9UD1qJ5paH5STT+E3N+C
	a0hYjFMjkRg3gWpuQGiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjSXp-00000009jLH-1Bc5;
	Sat, 24 Jan 2026 01:34:33 +0000
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjSXl-00000009jKS-2bSI
	for linux-riscv@lists.infradead.org;
	Sat, 24 Jan 2026 01:34:31 +0000
Received: by mail-yx1-xb12c.google.com with SMTP id 956f58d0204a3-649605d3664so1181917d50.3
        for <linux-riscv@lists.infradead.org>; Fri, 23 Jan 2026 17:34:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769218468; cv=none;
        d=google.com; s=arc-20240605;
        b=l3oxj3L0QwcZ/0EI02zXqN8ZcumiXEjW9WJJfVPggUVi4H+2KxvSUuVUkjnuqfsQQV
         Ys+tDXW13yPhcrTogNMEjtPmfSwvEHUYl6moj8yWy9RnBqPV9TAl9lcr4W/mNqfOn8px
         O+qq4lnL2JTDMoTFueZXIwewzandeWATWdheBismoJ1LVBFGa0hYQ/dxTccbCjxcVDrb
         0mv+w8dva0xatphYdALI+n1eQKwwhJBLqZKduptB8gVt8ebgjQAqCn2E6XbNDZ66G+Yy
         JFE6s91Xs7ZMHA0EjccDboIcWbkjFkN2EYEPzCcIOJfTTn+et87VNPBWfcyM7GgKlCSs
         fxRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=agEgREMLVDdazclEpRe8zfrv759DuR+/W32J9A7FeaE=;
        fh=seo1wW09uWvIv9YUd3m2ac/+6SeyqJeeHGE856cwssI=;
        b=UnQauKq9pEIjZ/0rWcnSPVlJG7urUj6TOD3TbP9EC+xhVIWdNgBhisw90BzuJ0yUou
         r9FiLn8qszfSUkz8xOwjZg+0JDnliu8wfuawMkFf4NyLNCqQGVcYzNS/BbOHrnhroKEy
         4h6EPRUpmeMV+l0OQ9dbEqtYm+j0HUdCSvwaoSLgFOdIg639GJV8/o0HC+0UiglRUs69
         lqOv0dHYF0HzV3EqGTUmYw1HmNjf7chyWyLi1ChzWYO4BABGNLOJ6oT6XSuWD7SuEOOX
         r+ByqVOUEi9ujU/jU8aASprguMORPaDj2MCUhVr1bdIEeWTxh3o5U/PMJlccv37K/uFc
         z3KQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1769218468; x=1769823268; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=agEgREMLVDdazclEpRe8zfrv759DuR+/W32J9A7FeaE=;
        b=eM5MfEpI/f5KVTUXGCz/ynygjiBs5yKP0Qk49VHslmwXkxItkWHTFpCOGz1kUaGx7e
         NnAGarLBD+/o8Q4iQCuNQeWVw0IA/LYWUn1Xu0jW1J1Q8hZXSs83ElYvt/yoSgJqyFIl
         lpzjHuCVAcRq/8egBVbaEO1BOhBpyDDfXEJVdkx4X3Z6iCbMBLZpy/+QEisx8spd3Wqe
         4+lRGycCxIookANeZzrdM0Z+frvO3FL49dLX60Cvk2uXcDHHMhtly+OjlgsVrd+DDCOb
         jhqh0+r5dC1/XOGMZHkzSUXFBwgKjuWm2xXhua07TiBO5x866m9s4F6f6FYlcEUotKUI
         fZRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769218468; x=1769823268;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=agEgREMLVDdazclEpRe8zfrv759DuR+/W32J9A7FeaE=;
        b=M1YVbLfJ35cr2GJibKUBSJpOrPay7I2V49HzHpi4qGRFiShSbTNv58vdMPQSOqhhAC
         rusldMaVImKa3wdZz5XzS1cCP0FglCjYRO1Nb2P+vIVaacy22fT5M7GidLBC/YPfMwVC
         49hsSXhH9Uk79hbxw12Z9bfibvVuIoPg8zLBN38Ah+XA+ciOdgkS6zR9z4nhatSRa2MH
         NeQc/nc469Bgc55iJQybF1FjZ9vlXhusT2InMSu/UHpOHsla3J/cTYtm/BaVq/yWOpd0
         9p7HvYxrZ+9QAEDCcLe1D5iG8haDpZSyZo6lf0xQ3l+X37ONRNKFSxUU/3efP9lMuwrq
         BorQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgZTqy8RNGteud5PkvUmZwZ2gS8kLPQtvQjMqgnWnfomSDGgHiC0ksKhVXS6uJynpIZaygq7VW9pO1HQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzdL+3ckV87m+BYxHZX2sl7URewj9UZP5TKg4CYuh4bCN2b3hTm
	O9vKcDot86jhElxcE5BxOxCf4YJqyOUexxPtJonjN1IiOZIFjL0Ci2C0Jd7JDF9b4O2mhaDJfP7
	z7Cu9gt41kjsAYeMjjbkEdhmVcfQ2tM3roSoyPlSEdQ==
X-Gm-Gg: AZuq6aLUZ3Kc+Tqdf1ngBxdNMClHAPDT7VEHc1DS4Q2u2W8LyZdHDoC4LrKjA25EZrg
	nPuRtSpgbLwoUUDnSqOCNHUQ6iCxtYvXjYafoFcjRJLyVz4v0xklDnO/3lplnxRXobIIT3F7jpd
	dmJ1MWsQU8iukCfrPohOkveyTzqTle94ACyBXk0FSlL+sLukqyLKdgtAccGdgHjQIhVp0Uo/MIs
	PAxbJPYqi4LXui6ZTeBKfILVkyxoX5N+NkMfoITBu55jQ2njjuYVjB0lunYSXDNoglcfLYwv/Nn
	9jtmYYjXcmgw/0zYFmu53yoIWMBs95WYg+WgY9NBLZQrjlcKy239X/78W56m
X-Received: by 2002:a05:690e:188f:b0:645:5d39:2543 with SMTP id
 956f58d0204a3-6495bed2248mr4358820d50.19.1769218467721; Fri, 23 Jan 2026
 17:34:27 -0800 (PST)
MIME-Version: 1.0
References: <20260122-atlantis-clocks-v2-0-c66371639e66@oss.tenstorrent.com>
 <20260122-atlantis-clocks-v2-1-c66371639e66@oss.tenstorrent.com> <1bde71b1-1a7f-42d2-afce-c206269dee6f@kernel.org>
In-Reply-To: <1bde71b1-1a7f-42d2-afce-c206269dee6f@kernel.org>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Fri, 23 Jan 2026 19:34:16 -0600
X-Gm-Features: AZwV_Qh-aoeQQcUuaKT5O3JGbzcURLIxf1lZ82LX_R-DdXFUIZwX0O2uEAEQO8E
Message-ID: <CAEev2e-WqFJR5QpT6ObQCrQFaAnCGt7HyNM4Q7CaqQCtRJAcSQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: soc: tenstorrent: Add tenstorrent,atlantis-syscon
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>, Joel Stanley <jms@oss.tenstorrent.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, joel@jms.id.au, fustini@kernel.org, mpe@kernel.org, 
	mpe@oss.tenstorrent.com, npiggin@oss.tenstorrent.com, agross@kernel.org, 
	agross@oss.tenstorrent.com, bmasney@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_173429_803052_1CEDC548 
X-CRM114-Status: GOOD (  19.28  )
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

SGkgS3J6eXN6dG9mLAoKT24gRnJpLCBKYW4gMjMsIDIwMjYgYXQgMToxMOKAr0FNIEtyenlzenRv
ZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiAyMi8wMS8yMDI2IDIz
OjM2LCBBbmlydWRoIFNyaW5pdmFzYW4gd3JvdGU6Cj4gPiBEb2N1bWVudCBiaW5kaW5ncyBmb3Ig
VGVuc3RvcnJlbnQgQXRsYW50aXMgc3lzY29uIHRoYXQgbWFuYWdlcyBjbG9ja3MKPiA+IGFuZCBy
ZXNldHMuIFRoaXMgc3lzY29uIGJsb2NrIGlzIGluc3RhbnRpYXRlZCA0IHRpbWVzIGluIHRoZSBT
b0MuCj4gPiBUaGlzIGNvbW1pdCBkb2N1bWVudHMgdGhlIGNsb2NrcyBmcm9tIHRoZSBSQ1BVIHN5
c2NvbiBibG9jay4KCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3NvYy90ZW5zdG9ycmVudC90ZW5zdG9ycmVudCxhdGxhbnRpcy1zeXNjb24ueWFtbCBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb2MvdGVuc3RvcnJlbnQvdGVuc3Rv
cnJlbnQsYXRsYW50aXMtc3lzY29uLnlhbWwKPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBp
bmRleCAwMDAwMDAwMDAwMDAuLjQ5ZmJlMjQyM2JlMAo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysr
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvYy90ZW5zdG9ycmVudC90ZW5z
dG9ycmVudCxhdGxhbnRpcy1zeXNjb24ueWFtbAo+ID4gK2Rlc2NyaXB0aW9uOgo+ID4gKyAgTXVs
dGlmdW5jdGlvbmFsIHJlZ2lzdGVyIGJsb2NrIGZvdW5kIGluIFRlbnN0b3JyZW50IEF0bGFudGlz
IFNvQyB3aG9zZSBtYWluIGZ1bmN0aW9uCj4gPiArICBpcyB0byBjb250cm9sIGNsb2NrcyBhbmQg
cmVzZXRzLiBUaGlzIEJsb2NrIGlzIGluc3RhbnRpYXRlZCBtdWx0aXBsZSB0aW1lcyBpbiB0aGUg
U29DLAo+Cj4gUGxlYXNlIHdyYXAgY29kZSBhY2NvcmRpbmcgdG8gdGhlIHByZWZlcnJlZCBsaW1p
dCBleHByZXNzZWQgaW4gS2VybmVsCj4gY29kaW5nIHN0eWxlIChjaGVja3BhdGNoIGlzIG5vdCBh
IGNvZGluZyBzdHlsZSBkZXNjcmlwdGlvbiwgYnV0IG9ubHkgYQo+IHRvb2wpLiAgSG93ZXZlciBk
b24ndCB3cmFwIGJsaW5kbHkgKHNlZSBLZXJuZWwgY29kaW5nIHN0eWxlKS4KCkFjay4KCj4KPiA+
ICsgIGVhY2ggYmxvY2sgY29udHJvbHMgY2xvY2sgYW5kIHJlc2V0cyBmb3IgYSBkaWZmZXJlbnQg
c3Vic3lzdGVtLgo+ID4gKwo+ID4gKyAgUkNQVSBzeXNjb24gc2VydmVzIGxvdyBzcGVlZCBJTyBp
bnRlcmZhY2VzIG9uIGNoaXAKPiA+ICsgIFBDSWUgc3lzY29uIHNlcnZlcyBhbGwgUENJZSByZWxh
dGVkIGZ1bmN0aW9ucwo+ID4gKyAgSFNJTyBzeXNjb24gc2VydmVzIGhpZ2ggc3BlZWQgSU8gaW50
ZXJmYWNlcyAoRXRoZXJuZXQsIFVTQikKPiA+ICsgIE1NIHN5c2NvbiBzZXJ2ZXMgR1BVLCBkaXNw
bGF5IGFuZCB2aWRlbyBwcm9jZXNzaW5nIGZ1bmN0aW9ucwo+Cj4gU2FtZSBmZWVkYmFjayAtIGNs
b2NrIGNvbnRyb2xsZXJzIGdvIHRvIGNsb2NrLCBub3Qgc29jLgo+Cj4gPiArCj4gPiArcHJvcGVy
dGllczoKPiA+ICsgIGNvbXBhdGlibGU6Cj4gPiArICAgIGVudW06Cj4gPiArICAgICAgLSB0ZW5z
dG9ycmVudCxhdGxhbnRpcy1zeXNjb24tcmNwdQo+ID4gKyAgICAgIC0gdGVuc3RvcnJlbnQsYXRs
YW50aXMtc3lzY29uLXBjaWUKPiA+ICsgICAgICAtIHRlbnN0b3JyZW50LGF0bGFudGlzLXN5c2Nv
bi1tbQo+ID4gKyAgICAgIC0gdGVuc3RvcnJlbnQsYXRsYW50aXMtc3lzY29uLWhzaW8KPgo+IFdo
eSBkbyB5b3UgY2FsbCBldmVyeXRoaW5nIHN5c2Nvbj8gc3lzY29uIGlzIG5vdCBhIGhhcmR3YXJl
IG5hbWUuIEhvdyBpcwo+IHRoaXMgZXhhY3RseSBjYWxsZWQgaW4geW91ciBkYXRhc2hlZXQ/CgpJ
IHBpY2tlZCB0aGUgc3lzY29uIG5hbWUgc2luY2UgdGhlIGJsb2NrIGlzIGEgYnVuY2ggb2YgcmVn
aXN0ZXJzIHRoYXQKY29udHJvbCBkaWZmZXJlbnQgZnVuY3Rpb25zIGluIHRoZSBTb0MuIFRoZSBi
bG9jaydzIG5hbWUgaW4gdGhlCmRhdGFzaGVldCBpcyBQUkNNLCBzbyBJIHdpbGwgc3RpY2sgdG8g
dGhhdCBuYW1lIGFuZCB0cmVhdCB0aGlzIG5vZGUgYXMKYSBjbG9jayBjb250cm9sbGVyIGFzIGl0
cyBtYWluIGZ1bmN0aW9uYWxpdHkgaXMgdGhhdC4KCj4gPiArCj4gPiArYWxsT2Y6Cj4gPiArICAt
IGlmOgo+ID4gKyAgICAgIHByb3BlcnRpZXM6Cj4gPiArICAgICAgICBjb21wYXRpYmxlOgo+ID4g
KyAgICAgICAgICBjb250YWluczoKPiA+ICsgICAgICAgICAgICBlbnVtOgo+ID4gKyAgICAgICAg
ICAgICAgLSB0ZW5zdG9ycmVudCxhdGxhbnRpcy1zeXNjb24tcGNpZQo+ID4gKyAgICAgICAgICAg
ICAgLSB0ZW5zdG9ycmVudCxhdGxhbnRpcy1zeXNjb24tbW0KPiA+ICsgICAgICAgICAgICAgIC0g
dGVuc3RvcnJlbnQsYXRsYW50aXMtc3lzY29uLWhzaW8KPiA+ICsgICAgdGhlbjoKPiA+ICsgICAg
ICByZXF1aXJlZDoKPiA+ICsgICAgICAgIC0gdGVuc3RvcnJlbnQsc3lzY29uLXJjcHUKPgo+IGVs
c2UgLSBwcm9wZXJ0aWVzIGZhbHNlLCBzZWUgb3RoZXIgZXhhbXBsZXMgaG93IHRvIGRvIGl0Lgo+
Cj4gPiArCj4gPiArYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCj4gPiArCj4gPiArZXhhbXBs
ZXM6Cj4gPiArICAtIHwKPiA+ICsgICAgc3lzY29uX3JjcHU6IHN5c3RlbS1jb250cm9sbGVyQGE4
MDAwMDAwIHsKPgo+IERyb3AgZW50aXJlIGV4YW1wbGUsIG9uZSBpcyBlbm91Z2guCj4KPiA+ICsg
ICAgICBjb21wYXRpYmxlID0gInRlbnN0b3JyZW50LGF0bGFudGlzLXN5c2Nvbi1yY3B1IjsKPiA+
ICsgICAgICByZWcgPSA8MHhhODAwMDAwMCAweDEwMDAwPjsKPiA+ICsgICAgICBjbG9ja3MgPSA8
Jm9zY18yNG0+Owo+ID4gKyAgICAgICNjbG9jay1jZWxscyA9IDwxPjsKPiA+ICsgICAgICAjcmVz
ZXQtY2VsbHMgPSA8MT47Cj4gPiArICAgIH07Cj4gPiArICAtIHwKPiA+ICsgICAgc3lzY29uX2hz
aW86IHN5c3RlbS1jb250cm9sbGVyQGUwMGMwMDAwIHsKPgo+IERyb3AgdW51c2VkIGxhYmVsLgoK
QWNrLgoKPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL3RlbnN0b3Jy
ZW50LGF0bGFudGlzLXN5c2Nvbi5oIGIvaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay90ZW5zdG9y
cmVudCxhdGxhbnRpcy1zeXNjb24uaAo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4
IDAwMDAwMDAwMDAwMC4uMDUzY2VmMmI0M2M4Cj4gPiAtLS0gL2Rldi9udWxsCj4gPiArKysgYi9p
bmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL3RlbnN0b3JyZW50LGF0bGFudGlzLXN5c2Nvbi5oCj4K
PiBOYW1lIHdpbGwgZm9sbG93IGJpbmRpbmdzLgoKQWNrCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
