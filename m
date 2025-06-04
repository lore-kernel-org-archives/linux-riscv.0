Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C86F4C5B559
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jun 2025 12:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qixMHSmypdRt+FSJcp77MV5k8fw8L6o1WQvdpNHFe6s=; b=258v0yxjxPPE8U
	vppj4f09+NJ9vXvXSs/YxTd1a2dOu/baGxSNWL+E6cD2ZFU0HaWH4HrrupZaQgpKYnQXRtlyZyinN
	rtNysO7bK1YGLWRG6Js/WXvr9FvaYabxYeK7JO6FOSDCVyYWpdsntc0UNqMfJGN5DIOGCAgy9Rt57
	oRtH18G5fV82K1b+TKF3LZWKvlLVxjgPZoDIIVH0rCQjER6Q8/TumzCeGYqEKg/WjXbmxQAUwn1vq
	H/721hi8MdtpW1BBJy2VejjoomcEjk1fsuuZs8tDgazgvL5QelJNw26ncR7Y2ybx+NByO09L2spIR
	WINFOcWpoMd9hmf7JVCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMnIy-0000000DLEO-2WVA;
	Wed, 04 Jun 2025 12:33:16 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMnIv-0000000DLDX-40ef
	for linux-riscv@lists.infradead.org;
	Wed, 04 Jun 2025 12:33:15 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-553245cad29so6537396e87.1
        for <linux-riscv@lists.infradead.org>; Wed, 04 Jun 2025 05:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749040392; x=1749645192; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=40H+9TTXhZnTaMd2EZ6HBT4RNOeVTmMt2oQhHbe4EDQ=;
        b=Py6xTaX+r2yYungj9LX83h2ULK764V6R4HmwuGWfle4jKZ6OmIFyp7/OZ1hCXYd5k3
         Xa7q8k+eqDJNR+LBr7BTMzvl5oUatrOWgQr+wimUBhxNMybx0zx9CSZLFiUcjyG+zLAm
         qIzDmyGnAuCb12BCoaSKV3b8gXzQio3VwO3yZK4pud67mg80mNWVRGCGHOH8WXSQAPtt
         xUYy7hLxVzPp1+1H9ZVp4EuLhywdOJpjBt6An+N0CgT3NWPEau8hUp/7GaQuW+svGfH0
         DwKcjubIGplRpckVKA/tkXneZK6oBzkpFxuJpjzpXjhQ1shMwi0GdaNT6bwQkPwx7Ohd
         6Tcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749040392; x=1749645192;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=40H+9TTXhZnTaMd2EZ6HBT4RNOeVTmMt2oQhHbe4EDQ=;
        b=pJOSbfFgMGYEZWNx735nVIEjZi3+QZi9cw2FvWjabMwbwwkKgTbSnKH9UyKQwvYL+c
         enmBHQsDe4nZRhaEvp/J1BVNrGHYo0291QgxFTt+DUGFAGzUzAdvaOEpxNjvB0GrDVeo
         GBpILh3Opudk/UkRBhhMpxzzE1JAMBqZpYRvxEkzEX06sUhzvsjr4Tv/S/7yJPdF/lwD
         rbVfXD844jFJTRQZu8Qp3AfrxjVVhJEUXbxB7NYYXF7EKQTUk5z2lKRdNu0qxKOQ3qh1
         pVCY3cNf2LgdAK4UIXGnWhU/AyxxwuwNj9UgEMft3kZ2DWoiUpfDcFgGHiytL63+yM7y
         CDNA==
X-Forwarded-Encrypted: i=1; AJvYcCW1wwLQzwDxKklfieAs23cgbxOHPIVGPJGyQA52TXo3GPTAk1xdaMd006xEbWhebjEzkmwa9olv/5mcCw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwN4EP2KZbfvCcbXDRFOjeytux+zBwHnPZA1mY5KqG5OOdw3rBI
	ln7qqZWCS88HdSiQ7MBW8KrhU7AA9GswIeyUpktzJuZS6BZZN8ZaQ4aNFW6HvnRzWA4r4Y/ECl6
	ufKH/QGIstB7XEIE+cRwHKmjYAXRDZD3Dby9+fH/Wzg==
X-Gm-Gg: ASbGncsEAyeAHqxZ7quBym6WjqaI0qPJ2XY51LaWTZ/AXbnziuNsEAaU4yG9F2fgkdP
	xtv050KTLVtTfCgiUSykfG49W5OL7LK8yCGu3QD4ljSNmXmgLABpTkzgC9iE/X9nfnT3Z9wLg70
	STF97gPvWx+GdE4aARvoZTRKxUKyx35HCUIpD4JvbLB1ZVBbur0Sc0wamAlCjKQBR7
X-Google-Smtp-Source: AGHT+IFq6pmnr37tc/Op7F/Fey62yojVdrF7s5RRVTPIUfG0sHj3PJlgFBWhtvoFugeUVElYakwUgAd29fPyfsZ3DLg=
X-Received: by 2002:a05:6512:3e20:b0:553:252f:adf8 with SMTP id
 2adb3069b0e04-55356ae0e10mr766979e87.9.1749040391631; Wed, 04 Jun 2025
 05:33:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250530-apr_14_for_sending-v3-0-83d5744d997c@samsung.com>
 <CGME20250529222408eucas1p20f62cea4c9c64bb5dda6db1fd38fb333@eucas1p2.samsung.com>
 <20250530-apr_14_for_sending-v3-6-83d5744d997c@samsung.com>
 <20250603-gleaming-mammoth-of-kindness-538add@kuoka> <c49ae9f2-3c3c-4253-be85-8fe5bbb4b42e@samsung.com>
In-Reply-To: <c49ae9f2-3c3c-4253-be85-8fe5bbb4b42e@samsung.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 4 Jun 2025 14:33:00 +0200
X-Gm-Features: AX0GCFuJQtZdn8gggvUkoP6l-v_fzn9vXleutgIfablo4CyL1FqiXWHXgL-Yqpk
Message-ID: <CAMRc=Me75aGMic-GZuqCe+v=8MmmK8DCyfVZj=ELR4VuG-_qDQ@mail.gmail.com>
Subject: Re: [PATCH v3 6/8] riscv: dts: thead: Add GPU power sequencer node
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
	Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Frank Binns <frank.binns@imgtec.com>, 
	Matt Coster <matt.coster@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_053314_233307_91C363D2 
X-CRM114-Status: GOOD (  25.27  )
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

T24gVHVlLCBKdW4gMywgMjAyNSBhdCA4OjQ14oCvUE0gTWljaGFsIFdpbGN6eW5za2kKPG0ud2ls
Y3p5bnNraUBzYW1zdW5nLmNvbT4gd3JvdGU6Cj4KPgo+Cj4gT24gNi8zLzI1IDE1OjIyLCBLcnp5
c3p0b2YgS296bG93c2tpIHdyb3RlOgo+ID4gT24gRnJpLCBNYXkgMzAsIDIwMjUgYXQgMTI6MjM6
NTNBTSBHTVQsIE1pY2hhbCBXaWxjenluc2tpIHdyb3RlOgo+ID4+IEFkZCB0aGUgZGV2aWNlIHRy
ZWUgbm9kZSBmb3IgdGhlIFQtSEVBRCBUSDE1MjAgR1BVIHBvd2VyIHNlcXVlbmNlcgo+ID4+IChn
cHVfcHdyc2VxKSB0byB0aGUgdGgxNTIwLmR0c2kgZmlsZS4KPiA+Pgo+ID4+IFRoaXMgbm9kZSBp
bnN0YW50aWF0ZXMgdGhlIHRoZWFkLHRoMTUyMC1ncHUtcHdyc2VxIGRyaXZlciwgd2hpY2gKPiA+
Cj4gPiBFeHBsYWluIHRoZSBoYXJkd2FyZSwgbm90IHdoYXQgZHJpdmVycyBkby4KPiA+Cj4gPj4g
aXMgcmVzcG9uc2libGUgZm9yIG1hbmFnaW5nIHRoZSBHUFUncyBwb3dlci1vbi9vZmYgc2VxdWVu
Y2UuIFRoZSBub2RlCj4gPj4gc3BlY2lmaWVzIHRoZSBncHUtY2xrZ2VuIHJlc2V0LCB3aGljaCBp
cyBvbmUgb2YgdGhlIHJlc291cmNlcwo+ID4+IGNvbnRyb2xsZWQgYnkgdGhpcyBzZXF1ZW5jZXIu
Cj4gPj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWwgV2lsY3p5bnNraSA8bS53aWxjenluc2tp
QHNhbXN1bmcuY29tPgo+ID4+IC0tLQo+ID4+ICBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3RoZWFkL3Ro
MTUyMC5kdHNpIHwgNiArKysrKysKPiA+PiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygr
KQo+ID4+Cj4gPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvdGhlYWQvdGgxNTIw
LmR0c2kgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3RoZWFkL3RoMTUyMC5kdHNpCj4gPj4gaW5kZXgg
YmRiYjFiOTg1YjBiNzZjZjY2OWE5YmY0MGM2ZWMzNzI1ODMyOTA1Ni4uNjE3MGVlYzc5ZTkxOWI2
MDZhMjA0NmFjOGY1MmRiMDdlNDdlZjQ0MSAxMDA2NDQKPiA+PiAtLS0gYS9hcmNoL3Jpc2N2L2Jv
b3QvZHRzL3RoZWFkL3RoMTUyMC5kdHNpCj4gPj4gKysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy90
aGVhZC90aDE1MjAuZHRzaQo+ID4+IEBAIC0yMzgsNiArMjM4LDEyIEBAIGFvbjogYW9uIHsKPiA+
PiAgICAgICAgICAgICAgI3Bvd2VyLWRvbWFpbi1jZWxscyA9IDwxPjsKPiA+PiAgICAgIH07Cj4g
Pj4KPiA+PiArICAgIGdwdV9wd3JzZXE6IHB3cnNlcSB7Cj4gPgo+ID4gTm9kZSBuYW1lcyBzaG91
bGQgYmUgZ2VuZXJpYy4gU2VlIGFsc28gYW4gZXhwbGFuYXRpb24gYW5kIGxpc3Qgb2YKPiA+IGV4
YW1wbGVzIChub3QgZXhoYXVzdGl2ZSkgaW4gRFQgc3BlY2lmaWNhdGlvbjoKPiA+IGh0dHBzOi8v
cHJvdGVjdDIuZmlyZWV5ZS5jb20vdjEvdXJsP2s9YTUzZWE1ZDMtYzQ0MzRmNTAtYTUzZjJlOWMt
NzRmZTQ4NjAwMTU4LWM4MTA5MjQ3NWVmNDE2YjMmcT0xJmU9ZDMzM2QwNmItMGIwNi00OTNlLWEz
NTgtZTI5Y2E1NDJkZmU3JnU9aHR0cHMlM0ElMkYlMkZkZXZpY2V0cmVlLXNwZWNpZmljYXRpb24u
cmVhZHRoZWRvY3MuaW8lMkZlbiUyRmxhdGVzdCUyRmNoYXB0ZXIyLWRldmljZXRyZWUtYmFzaWNz
Lmh0bWwlMjNnZW5lcmljLW5hbWVzLXJlY29tbWVuZGF0aW9uCj4gPgo+ID4+ICsgICAgICAgICAg
ICBjb21wYXRpYmxlID0gInRoZWFkLHRoMTUyMC1ncHUtcHdyc2VxIjsKPiA+PiArICAgICAgICAg
ICAgcmVzZXRzID0gPCZyc3QgVEgxNTIwX1JFU0VUX0lEX0dQVV9DTEtHRU4+Owo+ID4+ICsgICAg
ICAgICAgICByZXNldC1uYW1lcyA9ICJncHUtY2xrZ2VuIjsKPiA+Cj4gPiBXaGF0IGlzIHRoZSBw
b2ludCBvZiBwd3JzZXEgaWYgdGhlcmUgaXMgbm8gY29uc3VtZXIvdXNlciBvZiBpdD8gTG9va3MK
PiA+IGxpa2Ugc2ltcGxlIHBsYWNlaG9sZGVyIGFuZCBhbnl3YXkgbWF5YmUgdGhlIGZ1dHVyZSBj
b25zdW1lciBzaG91bGQganVzdAo+ID4gdXNlIHJlc2V0IGRpcmVjdGx5Lgo+Cj4gWWVhaCBJIHRo
aW5rIHlvdSdyZSByaWdodCwgSSB3YW50ZWQgdG8gZXhwbG9yZSBhZGRpbmcgdGhlIHB3cnNlcQo+
IHByb3ZpZGVyIGluIHNlcGFyYXRlIG5vZGUgcGVyIGRpc2N1c3Npb24gaW4gdjIgWzFdLiBCdXQg
Zm9yIHRoZSB2NCBJCj4gdGhpbmsgSSdsbCByZXZlcnQgdG8gdGhlIHYyIHdheSBvZiBoYW5kbGlu
ZyB0aGlzIHJlc2V0IFsyXS4KPgo+IFsxXSAtIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9D
QVBEeUtGcGk2X0NEKythOXNiR0J2SkN1QlNRUzZZY3BOdHRrUlFoUU1UV3kxeXlyUmdAbWFpbC5n
bWFpbC5jb20vCj4gWzJdIC0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjUwNDE0LWFw
cl8xNF9mb3Jfc2VuZGluZy12Mi0yLTcwYzVhZjJhZjk2Y0BzYW1zdW5nLmNvbS8KPgoKSSB0aGlu
ayB5b3Ugc3RpbGwgbmVlZCB0byBjb25uZWN0IHRoZSBHUFUgbm9kZSB3aXRoIGl0cyBwd3JzZXEK
cHJvdmlkZXIgKHdoaWNoIHdpbGwgYmUgdGhlIGFvbiBub2RlIGluIHRoaXMgY2FzZSkuIEJ1dCB5
b3UgYWxyZWFkeQpoYXZlIHRoaXMgbGluayAtIHRoZSBhb24gcG93ZXIgZG9tYWluLiBZb3UgY2Fu
IHBhcnNlIGl0IGluIHRoZSBwd3JzZXEKbWF0Y2ggY2FsbGJhY2sgdG8gZGV0ZXJtaW5lIHdoaWNo
IEdQVSBpcyBwb3dlcmVkIGJ5IHdoaWNoIEFPTiBtb2R1bGUuCgpCYXJ0CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
