Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 619F1C4706C
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Jan 2024 20:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qx2SzbDqfItcbIa7JLe2LXL/CDXtbaErIYmB5XcKWbw=; b=s9zro+yy9a48XO
	NOGfdd0YbdKquIbS5h+KO3/I34o9UfuKvHQ207uj5uY03Mp+Qq4AAvY929h9p/1zfYZucwiPP/WvD
	CNuwgSTyBzOe0Q5Bkym/kiWSTZ+MVewPsVhHdaeO6/jEpj6PMWw0abaAXlQlvNw+h49boxNep2cYJ
	lzrl+BwqT0KG7UPRwfSFGSgb+KihiSz75h5jClP41zh+RFVE3xdxTbhJ89sk6GhdVtePdqre1qSdn
	Gj0xAyk8iJkUkGcHB29oR28KS/m72uAt6JoeMk8vXuu32QPBGBXSnjk9IPlfl3BVnAjqnfAbt/qT3
	UWnBpEtPySJviM0wuxkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rONmD-003tRP-01;
	Fri, 12 Jan 2024 20:05:13 +0000
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rONmA-003tQg-20
	for linux-riscv@lists.infradead.org;
	Fri, 12 Jan 2024 20:05:12 +0000
Received: by mail-ua1-x935.google.com with SMTP id a1e0cc1a2514c-7cc94f8756aso2028847241.0
        for <linux-riscv@lists.infradead.org>; Fri, 12 Jan 2024 12:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705089907; x=1705694707; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uuLRRzmhyCB5S5syYuP1bbcU/o6jqbOBryVBT44mivY=;
        b=c12CwQYzvvPG/hLh2cDx89+WjNiIhGAxAcqaVRp3V+lFhYYe7sllyBCAHOh0F3zjG/
         H5CT0/4FBAmkX/VETAF7xn+0wTDlwRjcMHhSslwObSFEBWpkLL0HxqPixbK3jj4sy//W
         x9UHaiqDvs3FuWbTXSDVerb9fSuGrh/Keo7jAhiZJE8fWavgjtr60IxHKlSN1XmcmA9B
         Ld3RS2WgEF//o7O9j4DkUhhyFJmG0ZbTXKscpov7f29iYP12yCKBBYLsp/0qwVPaEgPz
         17UUfF7Q0aYsD8PLHtHDFbEGZLwOvJNFVZufCPU/DMx43WarcowJ7Qa9z5Azfvu4v4hO
         TB6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705089907; x=1705694707;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uuLRRzmhyCB5S5syYuP1bbcU/o6jqbOBryVBT44mivY=;
        b=QnUhkqXjOp3hpPDFgZOsHJws3rh1TYLdhYeyCfKcd8UYx0A8NJ2NDQGlR5PyllQsCT
         HCKWwzad7+z7GA5yhxQMHVdZChbAD36rBaVfOsW8KwIwE/OpanR0Z5MJG2mxc5mBYCSp
         bAqdlg43DAwQOgOb0QIBBBdGrrOVGVskTyk7pOLRzxmAcWv6JVfkbjnIVWwAcCYCv3MN
         YceiMLOsDjXVTSfHQrnCWI8Mhyf1Nm4TlcpJz+jj0YWC3Z6B4Xc+8JfMZDncG5slkJYl
         bN/bpAHLk2Eb5BWoL216AuwMpkTrcFCpnPTlm6g46cH6hJBCPcSklssFeWjg67F37y1A
         9yvg==
X-Gm-Message-State: AOJu0Yz4x/aGFlJvFaUOK49fCJgQMIuMoRaz0VFLgPJ8YPbSqg8dS1SE
	eEEZqAe/qhw5awhbbnLX16iMALi9O7Y/5VCEhFM=
X-Google-Smtp-Source: AGHT+IHQfItjvy9UKPKgg5Y6uHlXqt0dwsUDDUdPwaxqBg8sepOSfAvFl2LNqdG0GjbptMtgtPIQeL4u61ESk9ChSgE=
X-Received: by 2002:a05:6122:4b8b:b0:4b6:d551:d4e9 with SMTP id
 fd11-20020a0561224b8b00b004b6d551d4e9mr1720101vkb.2.1705089906814; Fri, 12
 Jan 2024 12:05:06 -0800 (PST)
MIME-Version: 1.0
References: <20240111131558.31211-1-andy.chiu@sifive.com> <170504103075.17535.16233182023874920613.git-patchwork-notify@kernel.org>
In-Reply-To: <170504103075.17535.16233182023874920613.git-patchwork-notify@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 12 Jan 2024 20:04:40 +0000
Message-ID: <CA+V-a8v8X0idpo89ZViVJK-7WwKnCojJ7B9449t3v4Y5Rfvh7w@mail.gmail.com>
Subject: Re: [v10, 00/10] riscv: support kernel-mode Vector
To: patchwork-bot+linux-riscv@kernel.org
Cc: Andy Chiu <andy.chiu@sifive.com>, linux-riscv@lists.infradead.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, greentime.hu@sifive.com, 
	guoren@linux.alibaba.com, bjorn@kernel.org, charlie@rivosinc.com, 
	ardb@kernel.org, arnd@arndb.de, peterz@infradead.org, tglx@linutronix.de, 
	ebiggers@kernel.org, aou@eecs.berkeley.edu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_120510_657713_D181F41E 
X-CRM114-Status: GOOD (  18.34  )
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

T24gRnJpLCBKYW4gMTIsIDIwMjQgYXQgNjozMuKAr0FNIDxwYXRjaHdvcmstYm90K2xpbnV4LXJp
c2N2QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gSGVsbG86Cj4KPiBUaGlzIHNlcmllcyB3YXMgYXBw
bGllZCB0byByaXNjdi9saW51eC5naXQgKGZvci1uZXh0KQo+IGJ5IFBhbG1lciBEYWJiZWx0IDxw
YWxtZXJAcml2b3NpbmMuY29tPjoKPgo+IE9uIFRodSwgMTEgSmFuIDIwMjQgMTM6MTU6NDggKzAw
MDAgeW91IHdyb3RlOgo+ID4gVGhpcyBzZXJpZXMgcHJvdmlkZXMgc3VwcG9ydCBydW5uaW5nIFZl
Y3RvciBpbiBrZXJuZWwgbW9kZS4KPiA+IEFkZGl0aW9uYWxseSwga2VybmVsLW1vZGUgVmVjdG9y
IGNhbiBiZSBjb25maWd1cmVkIHRvIHJ1biB3aXRob3V0Cj4gPiB0dXJubmluZyBvZmYgcHJlZW1w
dGlvbiBvbiBhIENPTkZJR19QUkVFTVBUIGtlcm5lbC4gQWxvbmcgd2l0aCB0aGUKPiA+IHN1cG9y
dCwgd2UgYWRkIFZlY3RvciBvcHRpbWl6ZWQgY29weV97dG8sZnJvbX1fdXNlci4gQW5kIHByb3Zp
ZGUgYQo+ID4gc2ltcGxlIHRocmVzaG9sZCB0byBkZWNpZGUgd2hlbiB0byBydW4gdGhlIHZlY3Rv
cml6ZWQgZnVuY3Rpb25zLgo+ID4KPiA+IFdlIGRlY2lkZWQgdG8gZHJvcCB2ZWN0b3JpemVkIG1l
bWNweS9tZW1zZXQvbWVtbW92ZSBmb3IgdGhlIG1vbWVudCBkdWUKPiA+IHRvIHRoZSBjb25jZXJu
IG9mIG1lbW9yeSBzaWRlLWVmZmVjdCBpbiBrZXJuZWxfdmVjdG9yX2JlZ2luKCkuIFRoZQo+ID4g
ZGV0YWlsZWQgZGVzY3JpcHRpb24gY2FuIGJlIGZvdW5kIGF0IHY5WzFdCj4gPgo+ID4gWy4uLl0K
Pgo+IEhlcmUgaXMgdGhlIHN1bW1hcnkgd2l0aCBsaW5rczoKPiAgIC0gW3YxMCwwMS8xMF0gcmlz
Y3Y6IEFkZCBzdXBwb3J0IGZvciBrZXJuZWwgbW9kZSB2ZWN0b3IKPiAgICAgaHR0cHM6Ly9naXQu
a2VybmVsLm9yZy9yaXNjdi9jL2MwYWUzNTBmNzE0Zgo+ICAgLSBbdjEwLDAyLzEwXSByaXNjdjog
dmVjdG9yOiBtYWtlIFZlY3RvciBhbHdheXMgYXZhaWxhYmxlIGZvciBzb2Z0aXJxIGNvbnRleHQK
PiAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9yaXNjdi9jL2ViZjUyYWMzMGU0Zgo+ICAgLSBb
djEwLDAzLzEwXSByaXNjdjogQWRkIHZlY3RvciBleHRlbnNpb24gWE9SIGltcGxlbWVudGF0aW9u
Cj4gICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcmlzY3YvYy85ZmY5NzIxMWE2MjMKPiAgIC0g
W3YxMCwwNC8xMF0gcmlzY3Y6IHNjaGVkOiBkZWZlciByZXN0b3JpbmcgVmVjdG9yIGNvbnRleHQg
Zm9yIHVzZXIKPiAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9yaXNjdi9jL2Y0NDcxMjUyZjNi
OQo+ICAgLSBbdjEwLDA1LzEwXSByaXNjdjogbGliOiB2ZWN0b3JpemUgY29weV90b191c2VyL2Nv
cHlfZnJvbV91c2VyCj4gICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcmlzY3YvYy8xNDVjYTZl
ZGRkNzAKPiAgIC0gW3YxMCwwNi8xMF0gcmlzY3Y6IGZwdTogZHJvcCBTUl9TRCBiaXQgY2hlY2tp
bmcKPiAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9yaXNjdi9jLzI1YTgzMDk0NDc3Mwo+ICAg
LSBbdjEwLDA3LzEwXSByaXNjdjogdmVjdG9yOiBkbyBub3QgcGFzcyB0YXNrX3N0cnVjdCBpbnRv
IHJpc2N2X3ZfdnN0YXRlX3tzYXZlLHJlc3RvcmV9KCkKPiAgICAgaHR0cHM6Ly9naXQua2VybmVs
Lm9yZy9yaXNjdi9jLzlkZWNlOGJmMDM0Mwo+ICAgLSBbdjEwLDA4LzEwXSByaXNjdjogdmVjdG9y
OiB1c2UgYSBtYXNrIHRvIHdyaXRlIHZzdGF0ZV9jdHJsCj4gICAgIGh0dHBzOi8vZ2l0Lmtlcm5l
bC5vcmcvcmlzY3YvYy9jMDU5OTI3NDdjOTYKPiAgIC0gW3YxMCwwOS8xMF0gcmlzY3Y6IHZlY3Rv
cjogdXNlIGttZW1fY2FjaGUgdG8gbWFuYWdlIHZlY3RvciBjb250ZXh0Cj4gICAgIGh0dHBzOi8v
Z2l0Lmtlcm5lbC5vcmcvcmlzY3YvYy82NjAyMTc0Mjk2MTQKPiAgIC0gW3YxMCwxMC8xMF0gcmlz
Y3Y6IHZlY3RvcjogYWxsb3cga2VybmVsLW1vZGUgVmVjdG9yIHdpdGggcHJlZW1wdGlvbgo+ICAg
ICBodHRwczovL2dpdC5rZXJuZWwub3JnL3Jpc2N2L2MvYWEyM2M2MTcyZDMzCj4KV2l0aCB0aGlz
IHNlcmllcyBtZXJnZWQgaW4gUlovRml2ZSBzdG9wcyBib290aW5nIFswXSwgSSBkb250IGdldCBh
bnkKcGFuaWMgYXMgc3VjaCBidXQgaXQncyBhIGtlcm5lbCBmcmVlemUuIFJldmVydGluZyB0aGlz
IHNlcmllcyBhbGwKYm9vdHMgdXAgT0suCgpbMF0gaHR0cHM6Ly9wYXN0ZS5kZWJpYW4ubmV0L2hp
ZGRlbi9hODI5MzI0MC8KCkNoZWVycywKUHJhYmhha2FyCgo+IFlvdSBhcmUgYXdlc29tZSwgdGhh
bmsgeW91IQo+IC0tCj4gRGVldC1kb290LWRvdCwgSSBhbSBhIGJvdC4KPiBodHRwczovL2tvcmcu
ZG9jcy5rZXJuZWwub3JnL3BhdGNod29yay9wd2JvdC5odG1sCj4KPgo+Cj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
