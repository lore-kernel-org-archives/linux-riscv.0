Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 453F0C25B74
	for <linux-riscv@archiver.kernel.org>; Thu, 30 May 2024 07:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4jWzr1bvzOb3tDWOAgNNzf+iE/aTdyHuHptS6npI+Q4=; b=dPMTD2QSYHp+Sh
	EiwvRpzPZSas4Z/El36O0aVlau4m5CO7uhEBjVRi3mQ1Kn/wi0QJL4i+MN7H6Hhm11RiuNaVDgxrM
	Vd/W/dC1aiApl3cW+KoL7wCvm8G+YyYp/WMUbRJ0FiDb4s5ELOYEoFWe/mUqMFBE+JdOq/SJ1v8qN
	diF8rPOOA49IwSRVnGHd7q9GSnWtDkUUhKea7geeGbHWSaifg332kUuJdGP7Iim2Tz/DizxVfkDeN
	9yKfLRYR7Y0EkqS2OaTZnHVUStwtZ8GMb6FHH1Cjj36l7JRE2QtD0I34aM3QYXeUfGQxa0kSjwEJU
	SWBmVj9Eipnq0hdVBC0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCZse-00000006TKt-3f4g;
	Thu, 30 May 2024 07:07:20 +0000
Received: from mail-yw1-f177.google.com ([209.85.128.177])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCZsa-00000006TJt-1k5f;
	Thu, 30 May 2024 07:07:18 +0000
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-62a0809c805so6067597b3.0;
        Thu, 30 May 2024 00:07:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717052831; x=1717657631;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vAy8uLPyjowTa0vjGx1V4wDXEpWsDdyakMo2ioajcOI=;
        b=B8CreCusHRzctAZAxg5cMQ+YZ7OGs5tl9mFix60AStIOafrBS6yu6iw5f9FCf3SdO+
         3/0cye+FZhQLBr21bCXkbl+lKfVmflKLOdjUjpGGFoGjFOAybbhFTzavsxDAAX7IAdOw
         j0l7GqMnYxqifwQ5aqSaT6cWc1RsnoaixO3l1suu/Qs19eEYYDp+HZYC/P1MdbgSOodl
         1WASYGRIsVk+AwpqWjGIixRiP4brcQiNRMrODDzjtBWU2xVPMwItSWFKWJU3HkXQhgVH
         ldOvLDc6SVQBOZp6b0PtA2jhcphlucce7RCnaMFJdCois3qV4ixV5suffSIElyH+kFa+
         YlJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWy2JXoZLdwK+rNjcqDZ8lj0qg7DGFTe+Q17X4/yQu8Yei1Zpu8xxsayPJbuIevidzaNfiLM7EYxag9MLdJ5q4yrZ1zuT0ujZuWOxR/Hsc0eQaPX8vkVl+fIFr7E8PlhEqNmrYPLzZu8pTMf+mQH7WRZTYrpns=
X-Gm-Message-State: AOJu0YwPze8JryU4dEcDz6Xy56xvVRi/jBSF/VVESPC4HVDJK8rtkPtI
	jdegsp+0cMe6/cKyU9MQxx5qu6IenFCF2HY2vLrNNFL0/i2bltYY3QutTLWJ
X-Google-Smtp-Source: AGHT+IF9JysfvjFJM9rjizj7/xy+naHp4I/ceBsQfCBgljI7erYAt696FDQ81dePGDmNMKq0hMHphA==
X-Received: by 2002:a81:72c2:0:b0:61b:91e3:f971 with SMTP id 00721157ae682-62c6bd1fb04mr13711837b3.39.1717052829543;
        Thu, 30 May 2024 00:07:09 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-62a0a391a81sm26891477b3.24.2024.05.30.00.07.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 00:07:08 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-df4e7763603so446773276.1;
        Thu, 30 May 2024 00:07:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXry5lWYqMjpAtE0JMCR/2Ywx7fapqE1+RjujLBi1Fs5GFObF4Nc5H0aCDdq9YGI3JjZKqLeOKiAfPKg7Z8Z+B4AGl72qL5Zbx5g+/Y6lr8jJIRQnV6cdclZU5uw2eY4UMJm3HR9jO2yX2xk6mzlvAct3WGhjA=
X-Received: by 2002:a25:ac8c:0:b0:de5:50a7:bc9a with SMTP id
 3f1490d57ef6-dfa5a595285mr1543101276.5.1717052828033; Thu, 30 May 2024
 00:07:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240222094006.1030709-1-apatel@ventanamicro.com>
 <20240222094006.1030709-2-apatel@ventanamicro.com> <CAMuHMdVYFFR7K5SbHBLY-JHhb7YpgGMS_hnRWm8H0KD-wBo+4A@mail.gmail.com>
 <11b3de44-522b-4638-987c-2ca132e84936@sifive.com>
In-Reply-To: <11b3de44-522b-4638-987c-2ca132e84936@sifive.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 May 2024 09:06:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV5jcbiHzYx=nqFHLLZ96u614zksSB5Vi9FVaOb_YMeiQ@mail.gmail.com>
Message-ID: <CAMuHMdV5jcbiHzYx=nqFHLLZ96u614zksSB5Vi9FVaOb_YMeiQ@mail.gmail.com>
Subject: Re: [PATCH v14 01/18] irqchip/sifive-plic: Convert PLIC driver into a
 platform driver
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, 
	Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Frank Rowand <frowand.list@gmail.com>, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_000716_481367_C26F8711 
X-CRM114-Status: GOOD (  30.90  )
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

SGkgU2FtdWVsLAoKT24gVGh1LCBNYXkgMzAsIDIwMjQgYXQgMTI6MDTigK9BTSBTYW11ZWwgSG9s
bGFuZAo8c2FtdWVsLmhvbGxhbmRAc2lmaXZlLmNvbT4gd3JvdGU6Cj4gT24gMjAyNC0wNS0yOSA5
OjIyIEFNLCBHZWVydCBVeXR0ZXJob2V2ZW4gd3JvdGU6Cj4gPiBPbiBUaHUsIEZlYiAyMiwgMjAy
NCBhdCAxMDo0MeKAr0FNIEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPiB3cm90
ZToKPiA+PiBUaGUgUExJQyBkcml2ZXIgZG9lcyBub3QgcmVxdWlyZSB2ZXJ5IGVhcmx5IGluaXRp
YWxpemF0aW9uIHNvIGNvbnZlcnQKPiA+PiBpdCBpbnRvIGEgcGxhdGZvcm0gZHJpdmVyLgo+ID4+
Cj4gPj4gQWZ0ZXIgY29udmVyc2lvbiwgdGhlIFBMSUMgZHJpdmVyIGlzIHByb2JlZCBhZnRlciBD
UFVzIGFyZSBicm91Z2h0LXVwCj4gPj4gc28gc2V0dXAgY3B1aHAgc3RhdGUgYWZ0ZXIgY29udGV4
dCBoYW5kbGVyIG9mIGFsbCBvbmxpbmUgQ1BVcyBhcmUKPiA+PiBpbml0aWFsaXplZCBvdGhlcndp
c2UgUExJQyBkcml2ZXIgY3Jhc2hlcyBmb3IgcGxhdGZvcm1zIHdpdGggbXVsdGlwbGUKPiA+PiBQ
TElDIGluc3RhbmNlcy4KPiA+Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IEFudXAgUGF0ZWwgPGFwYXRl
bEB2ZW50YW5hbWljcm8uY29tPgo+ID4KPiA+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCwgd2hpY2gg
aXMgbm93IGNvbW1pdCA4ZWM5OWIwMzMxNDdlZjNiCj4gPiAoImlycWNoaXAvc2lmaXZlLXBsaWM6
IENvbnZlcnQgUExJQyBkcml2ZXIgaW50byBhIHBsYXRmb3JtCj4gPiBkcml2ZXIiKSBpbiB2Ni45
Lgo+ID4KPiA+IEl0IGxvb2tzIGxpa2UgdGhpcyBjb252ZXJzaW9uIGlzIGNhdXNpbmcgaXNzdWVz
IG9uIEJlYWdsZVYgU3RhcmxpZ2h0Cj4gPiBCZXRhLiAgQWZ0ZXIgdXBkYXRpbmcgZXNtaWwvdmlz
aW9uZml2ZSB0byB2Ni4xMC1yYzEsIHRoZSBrZXJuZWwgdXN1YWxseQo+ID4gZmFpbHMgdG8gYm9v
dC4gQWRkaW5nICJlYXJseWNvbiBrZWVwX2Jvb3Rjb24iIHJldmVhbHMgdGhlc2UgZGlmZmVyZW5j
ZXM6Cj4gPgo+ID4gLXJpc2N2LXBsaWMgYzAwMDAwMC5pbnRlcnJ1cHQtY29udHJvbGxlcjogbWFw
cGVkIDEzMyBpbnRlcnJ1cHRzIHdpdGggMgo+ID4gaGFuZGxlcnMgZm9yIDQgY29udGV4dHMuCj4g
PiArLS0tLS0tLS0tLS0tWyBjdXQgaGVyZSBdLS0tLS0tLS0tLS0tCj4gPiArV0FSTklORzogQ1BV
OiAwIFBJRDogMSBhdCBkcml2ZXJzL2lycWNoaXAvaXJxLXNpZml2ZS1wbGljLmM6MzczCgo+ID4g
K1VuYWJsZSB0byBoYW5kbGUga2VybmVsIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSBhdCB2aXJ0
dWFsIGFkZHJlc3MKCj4gVGhlIGZhY3QgdGhhdCB5b3UgaGl0IHRoZSB3YXJuaW5nIGluZGljYXRl
cyB0aGF0IHBsaWNfaGFuZGxlX2lycSgpIHdhcyBjYWxsZWQKPiBiZWZvcmUgaGFuZGxlci0+cHJl
c2VudCB3YXMgc2V0LiBQcmV2aW91c2x5IHRoZSBQTElDIGRyaXZlciB3YXMgcHJvYmVkIHZlcnkK
PiBlYXJseSwgc28gaXQgaXMgdW5saWtlbHkgdGhhdCBzb21lIHBlcmlwaGVyYWwgYWxyZWFkeSBo
YWQgYSBwZW5kaW5nIGludGVycnVwdC4KPiBOb3csIHdoaWxlIHBsYXRmb3JtIGRldmljZSBkcml2
ZXJzIHdvdWxkIG5vdCB5ZXQgYmUgYWJsZSB0byByZXF1ZXN0IGludGVycnVwdHMKPiAoYmVjYXVz
ZSB0aGUgaXJxZG9tYWluIGlzIG5vdCByZWdpc3RlcmVkIHlldCksIHRoZXkgY291bGQgaGF2ZSBw
cm9ncmFtbWVkIHRoZQo+IGhhcmR3YXJlIGluIGEgd2F5IHRoYXQgZ2VuZXJhdGVzIGFuIGludGVy
cnVwdC4gSWYgdGhhdCBpbnRlcnJ1cHQgd2FzIGVuYWJsZWQgYXQKPiB0aGUgUExJQyAoZS5nLiBi
eSB0aGUgYm9vdGxvYWRlciksIHRoZW4gd2UgY291bGQgZXhwZWN0IHBsaWNfaGFuZGxlX2lycSgp
IHRvIGJlCj4gY2FsbGVkIGFzIHNvb24gYXMgaXJxX3NldF9jaGFpbmVkX2hhbmRsZXIoKSBpcyBj
YWxsZWQuCj4KPiBTbyB0aGUgZml4IGlzIHRvIG5vdCBjYWxsIGlycV9zZXRfY2hhaW5lZF9oYW5k
bGVyKCkgdW50aWwgYWZ0ZXIgdGhlIGhhbmRsZXJzIGFyZQo+IGNvbXBsZXRlbHkgc2V0IHVwLgo+
Cj4gSSd2ZSBzZW50IGEgcGF0Y2ggZG9pbmcgdGhpczoKPiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9saW51eC1yaXNjdi8yMDI0MDUyOTIxNTQ1OC45Mzc4MTctMS1zYW11ZWwuaG9sbGFuZEBzaWZp
dmUuY29tLwoKVGhhbmtzLCB0aGF0IGZpeGVkIHRoZSBpc3N1ZSEKCkdye29ldGplLGVldGluZ31z
LAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0ZXJob2V2ZW4g
LS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsu
b3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBj
YWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMg
SSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
