Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DA40C30653
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jul 2024 11:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=I9nFFQHn+gtceXuG51CWkhPGRdZDtdqlpICJUkrqrNQ=; b=LoCBJ/x+VuBXfo/trI38r7GbQ5
	2QBFl+ygXWYMnj09sUsDVcZbaxjZrc5CX6EEKucQmyxXlv7dbXTzFigXJ+0QV2Y18yJyy+9Xldje6
	bRDtVc+KFYYnWWlVOFFpr0p3X3GZXa2pUHSqONCVm8/5dgT8i9lyKjsQjWiX468giugEe3IwgXMoG
	H4bTZLjh34hwqfLKeGvpGZyUbEFgXYRQf2yAFhLJaAuo5MKarDx8m13mPlBETDvsnPzDIWuI4sGVd
	B8RvVkwS5uyQwnbTqqSOGbSo9WLe7QssOqshc+wWpwPrULeaEjqTcGOfQPo3Fni2AOYbb2eCEDV9L
	scKdKyjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOy40-00000009zu0-0qts;
	Wed, 03 Jul 2024 11:22:16 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOy3v-00000009ztT-23Vh
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jul 2024 11:22:13 +0000
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E98403FD49
	for <linux-riscv@lists.infradead.org>; Wed,  3 Jul 2024 11:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1720005726;
	bh=1qFVnINiw1OmtrqIdL6Ri9JaQ6L530vAhDFXUjoyBpE=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=fGKMLFkrmuhQQrYe/BWFJEP6GOzk3C4feeDUCE3lwk/PDdaUo4LDp4IXmeNnUzwWq
	 +IEr2b+YMJpF2KRsJgCV9iY+ILZV5SkBrGJV6PQe7Mh9Lil9oTPJlSXEaT/RByVxfh
	 0nbMlBJFqrzBIZohNaLc1F4Z6GkxpzCPA58MfE3QNMj+BDfyNMUm/ZKpiYZJAwKLFn
	 F75MeHMsEGum7O341Kd/lWULXwcGP84DitPveHplpRYWsO4sbT9AgbYh0gXMPJ1nOv
	 0fA6PjmWAkmhYGgEAGgI9nONn1FzRyIreeYF6bb+FErHK1vke0awybw8euvfRwjr2e
	 keql42ajTZITg==
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-44634cda251so77117531cf.2
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jul 2024 04:22:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720005725; x=1720610525;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1qFVnINiw1OmtrqIdL6Ri9JaQ6L530vAhDFXUjoyBpE=;
        b=w7y0C0B9oj5O03OPe5qvIrJxss56Z0KcmzFgAJPLNoGxCYJGuLnml1virM6hV6Y24a
         WgleKfJMK5MXrwRmHRFBeT9UeFQSY1POv7rQivabwxEUt1YRNvSkn4GNsGQ9+SszMTOQ
         zwtjvVwDi3iC+HARNFXDclSAMrpFSFxIuccBSf48FMXXJl6pp3hdZy7eU7l8+IHhEYyG
         FgD4cO5XYrlb1dNDCcrGqzLpxGtbB0AiLUT/im1IHJon67/BQohmNGl/A4hvAOYnOrfA
         h11TGiXmRegmy/QUG9lQbgaCYESY+XAHlDZdrkECS1nuKIDeQ7GE4KEMgFUWgne0UzkN
         dgHA==
X-Forwarded-Encrypted: i=1; AJvYcCXpvK6mM/8jEZV4DLxpabsMgR/d73TmZ2G7CFRCG7GfSzcOWsimy1kJSy3Jtrayi4g4AURbjR7PMSAzPTypwlfQZNRyCtzb4lQOKIdjLsvq
X-Gm-Message-State: AOJu0YxaWWsdpMLCDYd6L97n0gRhf1Zf4rSpCXRxv0pS7hrgW0FeKLN6
	E41Bh0VveQlzrZq7VQmzF0hsPRfig5Yvt7sNjofZG41k7nlnI4eUVIbOakZS6FDKWt/yietXTtt
	WlS+VEPK0v95WfRNt8F/vV6W4LPgHmVUuEWp3h82rNYzowaNxGGypVrfLsalxkY5cNlbHFHeivo
	FzOIuF6pns23Xh5FxeroDfMaYh+2oyPQFslKo/Fb899V8JnwQlkLr3pp6m
X-Received: by 2002:ac8:58c8:0:b0:446:5d98:bbb1 with SMTP id d75a77b69052e-44662e5b600mr160719521cf.32.1720005725498;
        Wed, 03 Jul 2024 04:22:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKJRX5E4PZN5AIkzZDqalz4GIxVyhLTZcy2t5CI2qf3j37GtaHnJJ1/0FVMsH63722yIHL+BLfMdPGdU70kDQ=
X-Received: by 2002:ac8:58c8:0:b0:446:5d98:bbb1 with SMTP id
 d75a77b69052e-44662e5b600mr160719281cf.32.1720005725057; Wed, 03 Jul 2024
 04:22:05 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 3 Jul 2024 04:22:04 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20240703094049.GB2676251@ofsar>
References: <20240627-k1-01-basic-dt-v2-0-cc06c7555f07@gentoo.org>
 <20240627-k1-01-basic-dt-v2-8-cc06c7555f07@gentoo.org> <CAJM55Z9jeAQTsVjRiLeofDm1RyMWCuHXC0a-pdKtpUiTkSjJCA@mail.gmail.com>
 <20240702012847.GA2447193@ofsar> <IA1PR20MB4953C031CB453AA0E51657B3BBDC2@IA1PR20MB4953.namprd20.prod.outlook.com>
 <20240702-appease-attire-6afbe758bf0f@spud> <20240703094049.GB2676251@ofsar>
Mime-Version: 1.0
Date: Wed, 3 Jul 2024 04:22:04 -0700
Message-ID: <CAJM55Z9AdOq_yd7sK_VhkutokK+-QKscdq9i759H3N1UKVwJkQ@mail.gmail.com>
Subject: Re: [PATCH v2 08/10] riscv: dts: add initial SpacemiT K1 SoC device tree
To: Yixun Lan <dlan@gentoo.org>, Conor Dooley <conor@kernel.org>
Cc: Inochi Amaoto <inochiama@outlook.com>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Samuel Holland <samuel.holland@sifive.com>, 
	Anup Patel <anup@brainfault.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-serial@vger.kernel.org, Meng Zhang <zhangmeng.kevin@spacemit.com>, 
	Yangyu Chen <cyy@cyyself.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_042212_072084_F2D0EDF2 
X-CRM114-Status: GOOD (  30.95  )
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

WWl4dW4gTGFuIHdyb3RlOgo+IEhpIENvbm9yOgo+Cj4gT24gMTY6MjUgVHVlIDAyIEp1bCAgICAg
LCBDb25vciBEb29sZXkgd3JvdGU6Cj4gPiBPbiBUdWUsIEp1bCAwMiwgMjAyNCBhdCAwOTozNTo0
NUFNICswODAwLCBJbm9jaGkgQW1hb3RvIHdyb3RlOgo+ID4gPiBPbiBUdWUsIEp1bCAwMiwgMjAy
NCBhdCAwMToyODo0N0FNIEdNVCwgWWl4dW4gTGFuIHdyb3RlOgo+ID4gPiA+IE9uIDEyOjQ5IE1v
biAwMSBKdWwgICAgICwgRW1pbCBSZW5uZXIgQmVydGhpbmcgd3JvdGU6Cj4gPiA+ID4gPiBZaXh1
biBMYW4gd3JvdGU6Cj4gPiA+ID4gPiA+IEZyb206IFlhbmd5dSBDaGVuIDxjeXlAY3l5c2VsZi5u
YW1lPgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBCYW5hbmEgUGkgQlBJLUYzIG1vdGhlcmJvYXJk
IGlzIHBvd2VyZWQgYnkgU3BhY2VtaVQgSzFbMV0uCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IEtl
eSBmZWF0dXJlczoKPiA+ID4gPiA+ID4gLSA0IGNvcmVzIHBlciBjbHVzdGVyLCAyIGNsdXN0ZXJz
IG9uIGNoaXAKPiA+ID4gPiA+ID4gLSBVQVJUIElQIGlzIEludGVsIFhTY2FsZSBVQVJUCj4gPiA+
ID4gPiA+Cj4gPiA+ID4gPiA+IFNvbWUga2V5IGNvbnNpZGVyYXRpb25zOgo+ID4gPiA+ID4gPiAt
IElTQSBzdHJpbmcgaXMgaW5mZXJyZWQgZnJvbSB2ZW5kb3IgZG9jdW1lbnRhdGlvblsyXQo+ID4g
PiA+ID4gPiAtIENsdXN0ZXIgdG9wb2xvZ3kgaXMgaW5mZXJyZWQgZnJvbSBkYXRhc2hlZXRbMV0g
YW5kIEwyIGluIHZlbmRvciBkdHNbM10KPiA+ID4gPiA+ID4gLSBObyBjb2hlcmVudCBETUEgb24g
dGhpcyBib2FyZAo+ID4gPiA+ID4gPiAgICAgSW5mZXJyZWQgYnkgdGFraW5nIHZlbmRvciBldGhl
cm5ldCBhbmQgTU1DIGRyaXZlcnMgdG8gdGhlIG1haW5saW5lCj4gPiA+ID4gPiA+ICAgICBrZXJu
ZWwuIFdpdGhvdXQgZG1hLW5vbmNvaGVyZW50IGluIHNvYyBub2RlLCB0aGUgZHJpdmVyIGZhaWxz
Lgo+ID4gPiA+ID4gPiAtIE5vIGNhY2hlIG5vZGVzIG5vdwo+ID4gPiA+ID4gPiAgICAgVGhlIHBh
cmFtZXRlcnMgZnJvbSB2ZW5kb3IgZHRzIGFyZSBsaWtlbHkgdG8gYmUgd3JvbmcuIEl0IGhhcyA1
MTIKPiA+ID4gPiA+ID4gICAgIHNldHMgZm9yIGEgMzJLaUIgTDEgQ2FjaGUuIEluIHRoaXMgY2Fz
ZSwgZWFjaCBzZXQgaXMgNjRCIGluIHNpemUuCj4gPiA+ID4gPiA+ICAgICBXaGVuIHRoZSBzaXpl
IG9mIHRoZSBjYWNoZSBsaW5lIGlzIDY0QiwgaXQgaXMgYSBkaXJlY3RseSBtYXBwZWQKPiA+ID4g
PiA+ID4gICAgIGNhY2hlIHJhdGhlciB0aGFuIGEgc2V0LWFzc29jaWF0aXZlIGNhY2hlLCB0aGUg
bGF0dGVyIGlzIGNvbW1vbmx5Cj4gPiA+ID4gPiA+ICAgICB1c2VkLiBUaHVzLCBJIGRpZG4ndCB1
c2UgdGhlIHBhcmFtZXRlcnMgZnJvbSB2ZW5kb3IgZHRzLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4g
PiBDdXJyZW50bHkgb25seSBzdXBwb3J0IGJvb3RpbmcgaW50byBjb25zb2xlIHdpdGggb25seSB1
YXJ0LCBvdGhlcgo+ID4gPiA+ID4gPiBmZWF0dXJlcyB3aWxsIGJlIGFkZGVkIHNvb24gbGF0ZXIu
Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gLi4uCj4gPiA+ID4KPiA+ID4gPiA+ID4gKwkJY2xpbnQ6IHRp
bWVyQGU0MDAwMDAwIHsKPiA+ID4gPiA+ID4gKwkJCWNvbXBhdGlibGUgPSAic3BhY2VtaXQsazEt
Y2xpbnQiLCAic2lmaXZlLGNsaW50MCI7Cj4gPiA+ID4gPiA+ICsJCQlyZWcgPSA8MHgwIDB4ZTQw
MDAwMDAgMHgwIDB4MTAwMDA+Owo+ID4gPiA+ID4gPiArCQkJaW50ZXJydXB0cy1leHRlbmRlZCA9
IDwmY3B1MF9pbnRjIDM+LCA8JmNwdTBfaW50YyA3PiwKPiA+ID4gPiA+ID4gKwkJCQkJICAgICAg
PCZjcHUxX2ludGMgMz4sIDwmY3B1MV9pbnRjIDc+LAo+ID4gPiA+ID4gPiArCQkJCQkgICAgICA8
JmNwdTJfaW50YyAzPiwgPCZjcHUyX2ludGMgNz4sCj4gPiA+ID4gPiA+ICsJCQkJCSAgICAgIDwm
Y3B1M19pbnRjIDM+LCA8JmNwdTNfaW50YyA3PiwKPiA+ID4gPiA+ID4gKwkJCQkJICAgICAgPCZj
cHU0X2ludGMgMz4sIDwmY3B1NF9pbnRjIDc+LAo+ID4gPiA+ID4gPiArCQkJCQkgICAgICA8JmNw
dTVfaW50YyAzPiwgPCZjcHU1X2ludGMgNz4sCj4gPiA+ID4gPiA+ICsJCQkJCSAgICAgIDwmY3B1
Nl9pbnRjIDM+LCA8JmNwdTZfaW50YyA3PiwKPiA+ID4gPiA+ID4gKwkJCQkJICAgICAgPCZjcHU3
X2ludGMgMz4sIDwmY3B1N19pbnRjIDc+Owo+ID4gPiA+ID4gPiArCQl9Owo+ID4gPiA+ID4gPiAr
Cj4gPiA+ID4gPiA+ICsJCXVhcnQwOiBzZXJpYWxAZDQwMTcwMDAgewo+ID4gPiA+ID4gPiArCQkJ
Y29tcGF0aWJsZSA9ICJzcGFjZW1pdCxrMS11YXJ0IiwgImludGVsLHhzY2FsZS11YXJ0IjsKPiA+
ID4gPiA+ID4gKwkJCXJlZyA9IDwweDAgMHhkNDAxNzAwMCAweDAgMHgxMDA+Owo+ID4gPiA+ID4g
PiArCQkJaW50ZXJydXB0cyA9IDw0Mj47Cj4gPiA+ID4gPiA+ICsJCQljbG9jay1mcmVxdWVuY3kg
PSA8MTQ4NTcwMDA+Owo+ID4gPiA+ID4gPiArCQkJcmVnLXNoaWZ0ID0gPDI+Owo+ID4gPiA+ID4g
PiArCQkJcmVnLWlvLXdpZHRoID0gPDQ+Owo+ID4gPiA+ID4gPiArCQkJc3RhdHVzID0gImRpc2Fi
bGVkIjsKPiA+ID4gPiA+ID4gKwkJfTsKPiA+ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiArCQkvKiBu
b3RlOiB1YXJ0MSBza2lwcGVkICovCj4gPiA+ID4gPgo+ID4gPiA+ID4gVGhlIGRhdGFzaGVldCBw
YWdlIHlvdSBsaW5rIHRvIGFib3ZlIHNheXMgIi1VQVJUICjDlzEwKSIsIGJ1dCBoZXJlIHlvdSdy
ZQo+ID4gPiA+ID4gc2tpcHBpbmcgb25lIG9mIHRoZW0uIFdoeT8gSSBjYW4gc2VlIHRoZSB2ZW5k
b3IgdHJlZSBkb2VzIHRoZSBzYW1lLCBidXQgaXQKPiA+ID4gPiA+IHdvdWxkIGJlIG5pY2Ugd2l0
aCBhbiBleHBsYW5hdGlvbiBvZiB3aGF0J3MgZ29pbmcgb24uCj4gPiA+ID4gPgo+ID4gPiA+IC8q
IG5vdGU6IHVhcnQxIGluIDB4ZjA2MTIwMDAsIHJlc2VydmVkIGZvciBURUUgdXNhZ2UgKi8KPiA+
ID4gPiBJIHdvdWxkIHB1dCBzb21ldGhpbmcgbGlrZSB0aGlzLCBkb2VzIHRoaXMgc291bmQgb2sg
dG8geW91Pwo+ID4gPiA+Cj4gPiA+ID4gbW9yZSBkZXRhaWwsIGlvbWVtIHJhbmdlIGZyb20gMHhm
MDAwLDAwMDAgLSAweGYwODAsMDAwMCBhcmUgZGVkaWNhdGVkIGZvciBURUUgcHVycG9zZSwKPiA+
ID4gPiBJdCB3b24ndCBiZSBleHBvc2VkIHRvIExpbnV4IG9uY2UgVEVFIGZlYXR1cmUgaXMgZW5h
YmxlZC4uCj4gPiA+ID4KPiA+ID4gPiBza2lwcGluZyB1YXJ0MSBtYXkgbWFrZSBwZW9wbGUgY29u
ZnVzZWQgYnV0IHdlIGFyZSB0cnlpbmcgdG8gZm9sbG93IGRhdGFzaGVldC4uCj4gPiA+Cj4gPiA+
IEluc3RlYWQgb2Ygc2tpcHBpbmcgaXQsIEkgc3VnZ2VzdCBhZGRpbmcgdGhpcyB0byByZXNlcnZl
ZC1tZW1vcnkgYXJlYSwKPiA+ID4gd2hpY2ggbWFrZSBhbGwgbm9kZSB2aXNpYmxlIGFuZCBhdm9p
ZCB1YXJ0MSBiZWluZyB0b3VjaGVkIGJ5IG1pc3Rha2UuCj4gPgo+ID4gTm8sIGRvbid0IG1ha2Ug
aXQgcmVzZXJ2ZWQtbWVtb3J5IC0gaW5zdGVhZCBhZGQgaXQgYXMKPiA+IHN0YXR1cyA9ICJyZXNl
cnZlZCI7IC8qIGV4cGxhbmF0aW9uIGZvciB3aHkgKi8KPiBPaywgZ290Cj4KPiA+IEFsc28sIEkn
ZCBhcHByZWNpYXRlIGlmIHRoZSBub2RlcyB3ZXJlIHNvcnRlZCBieSB1bml0IGFkZHJlc3MgaW4g
dGhlCj4gPiBkdHNpLgo+IHNvIEkgd291bGQgbW92ZSAicGxpYywgY2xpbnQiIGFmdGVyIG5vZGUg
b2YgdWFydDkgYXMgdGhpcyBzdWdnZXN0aW9uCj4KPiBmb3IgdWFydDEsIGl0cyB1bml0LWFkZHJl
c3MgaXMgMHhmMDYxMDAwMCwgaXQgc2hvdWxkIGJlIG1vdmVkIHRvIGFmdGVyIGNsaW50Cj4gKG9u
Y2UgdW5pdC1hZGRyZXNzIHNvcnRlZCksIGlmIHdlIGZvbGxvdyB0aGlzIHJ1bGUgc3RyaWN0bHku
Cj4gYnV0IGl0IG9jY3VyIHRvIG1lIHRoaXMgaXMgbm90IHZlcnkgaW50dWl0aXZlLCBpZiBubyBv
YmplY3Rpb24sIEkgd291bGQgcHV0Cj4gaXQgYmV0d2VlbiB1YXJ0MCBhbmQgdWFydDIgKHRodXMg
c2xpZ2h0bHkgYnJlYWsgdGhlIHJ1bGUuLikKCk5vLCBwbGVhc2Ugb3JkZXIgbm9kZXMgYnkgdGhl
aXIgYWRkcmVzcyBhcyBDb25vciBzYWlkLiBJdCBhY3R1YWxseSBzYXlzIHNvIGluCnRoZSBEVFMg
Y29kaW5nIHN0eWxlOgoKaHR0cHM6Ly9kb2NzLmtlcm5lbC5vcmcvZGV2aWNldHJlZS9iaW5kaW5n
cy9kdHMtY29kaW5nLXN0eWxlLmh0bWwKCi9FbWlsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
