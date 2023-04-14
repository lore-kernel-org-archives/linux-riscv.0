Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10AC3C77B61
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Apr 2023 01:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=WPdlcenwDayRTcoT0OztXLY9PJOfGeA0aRt5xQIjxWw=; b=w2wmfgcTuP22sy8HHL/TavzGoO
	6YnumbdQpD8HGq+KM+sRaTC8HSKWLJDxzf95XbMS6M18ZVz40tCPH7/eWTcCE2Na44GNfom2vSXmy
	QA+uY7Ny9ZiZfFy1EgrheJEdv9mQw7+FzMPP6RpRHcqwE7FvIcE2Q0z3eb0nBRTl1V6aJSJK7U+Mb
	i+5D1lmQ3/S2JGjXUw9azoab6rpfqLljYAyOyXep6LvhzALy0zDkxdYYVXSe/tXgxkqWPmAXpJoQu
	4yO5RvTJs84nTUAZDImTqnSiIY+ZpdAgxVC5NMzHFh5yIWfagNYWhNdPf0TuWIsV5pLQkjm4Bcwna
	VRQHskTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pn83r-0081Pd-2T;
	Fri, 14 Apr 2023 01:17:11 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pn83m-0081NL-2R
	for linux-riscv@lists.infradead.org;
	Fri, 14 Apr 2023 01:17:08 +0000
Received: by mail-pl1-x636.google.com with SMTP id p17so5747207pla.3
        for <linux-riscv@lists.infradead.org>; Thu, 13 Apr 2023 18:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1681435021; x=1684027021;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tFSlBIFfa4iYCx2BjtM1B+rQb8dlMLpuGpfiPxPnivc=;
        b=oOhubN5G3nXq7/4HNZpcWyoiaGVMQGb2CueCAuf+Z4WmVYDmTAZnNqAvrXg9n+fKp9
         RO4ReEAWeN4LuxhT6sFW/EK+472lKLis0KUfYHQbm5CLlFnyGbW+w6m69oOGK5Z57Lko
         GtmJnUjFh3EkNXRM0rdq60P8pT5jzFuh4vylcuK1P8W/kC14DYTPD/lg2i4BdwJ1+0Rj
         lHEU+pgdDXbPVI2qNMvGOGbPGWQWNVnneHKG11CV2vIBxcD/hVwk/T3A0S/cTGDUbVZ3
         nUT9ZjgmNpenprFfbjXMgOkcUlujgJHV4X1yw6iS1LMmLLh88xsg2SNH3M1dm35TWW6c
         2xZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681435021; x=1684027021;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tFSlBIFfa4iYCx2BjtM1B+rQb8dlMLpuGpfiPxPnivc=;
        b=I4MW8O3J0PxtS4m0LYL+NGK8jbTNg2HRFHO9Ijncxj3xB1XihVssBX9ClKsXqBR0hN
         Fe5v4CpOrsMXHnTif1KHVj+NE0TaDQrOAOFzJAUX4wgNmXpccm+Ha/mKmQjJZe/NcXu+
         AFLY63zKvqpWSIcVh9bMsn+ePXF6Dkv/kz+spme6xomcmKgWw25na28x4tUJ7WgqZ5A6
         Aq6cgDyfbnOKlNxgcqmZEtEKS7WcTHej4Zsr43ilq7MmcwFWSjypKNKSqrUahCD9O2yX
         rN3mLD8DhYhysVKzIQ8UQ86QqukTnQJE3K+h8qpKEb3N817sBD3DFwagAkOwkj4NOOyv
         MD/Q==
X-Gm-Message-State: AAQBX9dhAhMf0XFFklczzYHtoFzFnm2+V0MwHTiv8DhDS1OtIzT9PwU4
	ftlHhOv6C9awvAhnQxW3WtmE4g==
X-Google-Smtp-Source: AKy350ahdMJ8V2qg9PTbEbUXHzBvyltUI2FAlLoR02Up2BKeI13RKzQlt9/2izh+DtPygWWgOial/A==
X-Received: by 2002:a17:902:c949:b0:1a6:3d07:af32 with SMTP id i9-20020a170902c94900b001a63d07af32mr1090823pla.38.1681435021425;
        Thu, 13 Apr 2023 18:17:01 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id jd9-20020a170903260900b001a69b28f5c5sm290311plb.222.2023.04.13.18.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Apr 2023 18:17:00 -0700 (PDT)
Date: Thu, 13 Apr 2023 18:17:00 -0700 (PDT)
X-Google-Original-Date: Thu, 13 Apr 2023 18:16:27 PDT (-0700)
Subject: Re: [PATCH -fixes v2 3/3] riscv: No need to relocate the dtb as it lies in the fixmap region
In-Reply-To: <9c90f390-92d2-4dde-8cd7-b50e9c858787@spud>
CC: alexghiti@rivosinc.com, corbet@lwn.net, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, Conor Dooley <conor.dooley@microchip.com>, linux-doc@vger.kernel.org,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-4113481b-4c71-4b5c-ab7e-6896058f074b@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_181707_008827_1DB154BA 
X-CRM114-Status: GOOD (  20.10  )
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

T24gV2VkLCAyOSBNYXIgMjAyMyAwODozMzo0NSBQRFQgKC0wNzAwKSwgQ29ub3IgRG9vbGV5IHdy
b3RlOgo+IE9uIFdlZCwgTWFyIDI5LCAyMDIzIGF0IDA0OjQwOjE4UE0gKzAyMDAsIEFsZXhhbmRy
ZSBHaGl0aSB3cm90ZToKPj4gT24gV2VkLCBNYXIgMjksIDIwMjMgYXQgMzo1NuKAr1BNIENvbm9y
IERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4gd3JvdGU6Cj4+ID4KPj4gPiBPbiBXZWQsIE1hciAy
OSwgMjAyMyBhdCAxMDoxOTozMkFNICswMjAwLCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4+ID4g
PiBXZSB1c2VkIHRvIGFjY2VzcyB0aGUgZHRiIHZpYSBpdHMgbGluZWFyIG1hcHBpbmcgYWRkcmVz
cyBidXQgbm93IHRoYXQgdGhlCj4+ID4gPiBkdGIgZWFybHkgbWFwcGluZyB3YXMgbW92ZWQgaW4g
dGhlIGZpeG1hcCByZWdpb24sIHdlIGNhbiBrZWVwIHVzaW5nIHRoaXMKPj4gPiA+IGFkZHJlc3Mg
c2luY2UgaXQgaXMgcHJlc2VudCBpbiBzd2FwcGVyX3BnX2RpciwgYW5kIHJlbW92ZSB0aGUgZHRi
Cj4+ID4gPiByZWxvY2F0aW9uLgo+PiA+ID4KPj4gPiA+IE5vdGUgdGhhdCB0aGUgcmVsb2NhdGlv
biB3YXMgd3JvbmcgYW55d2F5IHNpbmNlIGVhcmx5X21lbXJlbWFwKCkgaXMKPj4gPiA+IHJlc3Ry
aWN0ZWQgdG8gMjU2SyB3aGVyZWFzIHRoZSBtYXhpbXVtIGZkdCBzaXplIGlzIDJNQi4KPj4gPgo+
PiA+IFNvLCBzaG91bGQgdGhpcyBiZSBtYXJrZWQgYXMgYSBmaXgsIGFuZCBiYWNrcG9ydGVkIGFs
b25nIHdpdGggMS8zPwo+PiAKPj4gSG1tbSB0aGUgd2hvbGUgc2VyaWVzIHNob3VsZCBiZSBiYWNr
cG9ydGVkLCBpdCBkb2VzIG5vdCBtYWtlIHNlbnNlIHRvCj4+IG1vdmUgdGhlIGR0YiBtYXBwaW5n
IGFuZCBrZWVwIGFjY2Vzc2luZyBpdCB1c2luZyBpdHMgbGluZWFyIG1hcHBpbmcKPj4gYWRkcmVz
cyBzaW5jZSBpdCBjb3VsZCBmYWlsIGZvciB0aGUgZXhhY3QgcmVhc29uIHRoZSByZWxvY2F0aW9u
IHdhcwo+PiBpbXBsZW1lbnRlZCBpbiB0aGUgZmlyc3QgcGxhY2UgYW5kIHRoZSByZWxvY2F0aW9u
IGlzIHdyb25nLgo+PiAKPj4gTWF5YmUgd2Ugc2hvdWxkIHNpbXBseSBhZGQgYSAiQ2M6IHN0YWJs
ZUB2Z2VyLmtlcm5lbC5vcmciIG9uIGFsbCB0aGUgcGF0Y2hlcz8KPgo+IFl1cCwgYWx0aG91Z2gg
aG9wZWZ1bGx5IFBhbG1lciBjYW4gaGFuZGxlIHRoYXQgaWYgbm90aGluZyBlbHNlIG5lZWRzCj4g
Y2hhbmdpbmcuCgpUaGUgYm90cyB1c3VhbGx5IHBpY2sgaXQgdXAgYW55d2F5LCBidXQgaW4gZ2Vu
ZXJhbCBJIHRyeSBhbmQgcHV0IHRoZSAKc3RhYmxlIENDIG9uIHRoZXJlIHdoZW4gSSBzZWUgc3R1
ZmYgZ28gYnkuICBJIGFjdHVhbGx5IG1pc3NlZCBpdCB0aGlzIAp0aW1lIHVudGlsIHNlZWluZyB0
aGUgY29tbWVudCwgdGhvdWdoLi4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
