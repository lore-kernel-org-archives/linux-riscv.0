Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BE3EF531F8
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Apr 2026 07:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C9VOWdOyAHREHThWdb53dQz1elriyBSr2Kz+d6oh7Ys=; b=HrjRJGQeDmlAw8
	WjrNh4olZyhn4hoHB5q2gn+qjPEZISyWmZxgMB8EmedG8Dew05zJ466eu0IzyuWzN0HjJd4GTIYZ/
	VyNfdM4konA282jXgaSB7D/Vt7Qx85G8XJopd28Q9AcjhH8fT28nrRek5+65jyTVOeicsofqXMmpk
	NwarNbp8Y/CcKhR64hGqH2tA/C+iUUbPQ37mnIBlEwQZhmoJCxjPVS7toYEQ6oQegz/ct7UReXaaN
	yM7CQNUEqpv00WssqbdT4aHIuNk5CM5UGYMFUeFUeEqzy81rm1aTYQ5Bk25FRV4532rz37JOSk6nO
	4sWuYhLI0hrXDnsxL5wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCXwb-0000000GszI-2jUR;
	Tue, 14 Apr 2026 07:12:21 +0000
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCXwY-0000000Gsyw-2LmP
	for linux-riscv@lists.infradead.org;
	Tue, 14 Apr 2026 07:12:19 +0000
Received: by mail-yx1-xb131.google.com with SMTP id 956f58d0204a3-64d5a7926cfso4786007d50.2
        for <linux-riscv@lists.infradead.org>; Tue, 14 Apr 2026 00:12:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776150737; cv=none;
        d=google.com; s=arc-20240605;
        b=SNe4QWHwO5zpm4NOXzhv5dD8ZO7LRk291Y2vdEbXnrRbEZ4WekyhBAHOkUlfrc9fPB
         08gCpxNUvlslfFB4qTwwg63wEtgymsKGAk3eoMQ/IIZXemdO6blOfkiocJUhpFNw1Xkb
         NREd3Ry9HeBy1i77rhQcv5SXGr6kMH8lHqYje8tBFL1Az+3JIrQkhqANzTdLag5anrvt
         a/Her3RMDaW/8fuNuNbkPEAQcVahdP2ZqmV1M5ohAnR32SeuHf1zcKTfiu043vQe2c0j
         fwLezZRGCJOZr4bPsePzbRfK9aWp8xdPBz2GlfcMJ87HhYRIfCSz++JrADj58wW+aXic
         o03g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UEklUAX75lJKcC6L2ltl9qbkuGK/MzM9omGGWWVYxIk=;
        fh=BaUfGFuGge42Y13CoVOkKawcPsmrGSBLTHk9plIwj2k=;
        b=ivjvuTcMMkYmIOCdkdyeJINF6Z6BUFgiWT293HKbbBUQSloIxRMIbDk2NO7Awm2T+Z
         NreVbMcku9U018HUm/g9zSjJJ30m0rQE2Hsb8GjJJuQlq0ahhhr4kYkIbg74VpUbG07v
         bYxpaTx8Rqy9eH4PDA2UW0oQnWjH96ZBKkJBlDc8ESfcdWq2paJNCl5UDqjnMrIwur25
         tw3/CG4btVa1PU+UZn+/xP97iNqwPHrXaJrsw2c2LCWr4M92YMh/ay40gxgUMrZoyG9A
         8j/mEL+/bN1dloOd28EiN5tuLj3PFM1qf08u0D89tHoWu8D+/PkpzlYKv9P7EKTDNxUa
         934w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776150737; x=1776755537; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UEklUAX75lJKcC6L2ltl9qbkuGK/MzM9omGGWWVYxIk=;
        b=nTyptXyyMDruA6d8B2Fo19+kYS/dBQIyoIV+KF9Cvngntkn8Lp2HaW8cmi5ad4i5rM
         pY7k6dnLmXOkn+7GtNG870QUheh44dWPSm2BzU+r1/jBZ3vrBKtlo5lXBZkMr8l1zoVV
         r6yJkDbRCYoJ260nKAqpjidOQlpaIuZtZ61mIj27kKbH4pxDBXtdsyHD3FMpU2SnxmOx
         gefSezhTwQH4VPUoT51bJSYyXdC0bb8cEe+apMXExvuJLr6w0MftXpRNCywv6UgSUkKx
         /8FrZeBprUWP0wCXG+mO9vqg03f26z+tp0oxziLPwWeM8kQTM+oHFvxZ+eC9480PHc4C
         HxBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776150737; x=1776755537;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UEklUAX75lJKcC6L2ltl9qbkuGK/MzM9omGGWWVYxIk=;
        b=A0FuRqpGK3oLSvOtzDAaXIKBueP2NR8N9XEP93Ck5tOc7alysbjC8L4WxDR6Z7W+4h
         QJ9Ui0EX5BYC5b8GtwCK2dS3jQHt2zRHHQIqs30bgfowXDhFm5nbpIKt3SQYiqu9gXSB
         9zOgMHjwx9Yo9Ls+kahmXKiBf1jp5Q45q5d1YpVaE4HPTeJ689ptlcAg8+9MpBEJxr8L
         i9jKkNI66sk3g/FO2dpPR8VYj1rO4NzxNFnisnHtg0R7n7mzoKkCoVCPuRSAavmj4WMj
         7XErtmWZnTLeULDQIoycC7KtqFhm7sirODLXQXISkNrXkoFmSYpYZ48K+L/PFgWRyN/a
         DXSQ==
X-Forwarded-Encrypted: i=1; AFNElJ9JqfnmnNn0igVoqn+WGVYsrp17Elqjc91r850oBJHDQNjZJJlmXhrmI55FgTtgYbJrag7gvGLhqbqhJw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyoDEGYMGlABBvLt6sY/8aP+VfcT4H6s54pzJwqGb+4tx0nddYk
	5xauW9FLJv0fSxg5Q31nEIzjmOX/uwuqN2NzK5msB/7y9KE7b80OuRRzAzVXYG5U8vBS6R3mfdT
	rmymHBFDrsZoZk64ETPRdpX3zvxAAkSU=
X-Gm-Gg: AeBDietVwDnEAiN3uhXZgFU1dwGyDV7JugCWmywkyUIQGRKx5Iz4C9ZGv5rYdl9eP+t
	+fMKq10YIxHBRkPWXTTuBkmacHwdqXywo1RE8lg6OeOHdJYPNG+rOAQFSOv1hdqBc1xQ/LwUDao
	rzVFGRAKChzOsG8qvozyvFnzqcjIrITLDLnHwPCMnWG7nbRvKtuZAHeeupdgC0k65OZ40SYEUda
	cXS5HHOQRTQpZIeRdaMR14yLGkVPb5uqH66T7gzIi5J7+cO0c0SrvUhO91SUdgvveIgdVCdcMH0
	OZvEA0qF
X-Received: by 2002:a05:690e:168b:b0:651:b5ab:3357 with SMTP id
 956f58d0204a3-651b5ab391dmr9912157d50.49.1776150737202; Tue, 14 Apr 2026
 00:12:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260413-orangepi-sd-card-uhs-v8-0-c21c40ec16d0@gmail.com> <f58ec12c-3957-4d44-b823-6a1ae1a1dd94@kernel.org>
In-Reply-To: <f58ec12c-3957-4d44-b823-6a1ae1a1dd94@kernel.org>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Tue, 14 Apr 2026 09:12:06 +0200
X-Gm-Features: AQROBzCH_H9-7w6mImHbEDf_ELHtA5AMJp2lwX6Y8iAqLMql_XXAAzAws0UviM4
Message-ID: <CABdCQ=NhTkGJUh_fKnZoQMzdpyO-UbV5zrSfiNVUC7bkSBifTA@mail.gmail.com>
Subject: Re: [PATCH v8 0/9] riscv: spacemit: enable SD card support with UHS
 modes for OrangePi RV2
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, Troy Mitchell <troy.mitchell@linux.dev>, 
	Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Anand Moon <linux.amoon@gmail.com>, 
	Trevor Gamblin <tgamblin@baylibre.com>, Vincent Legoll <legoll@online.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_001218_630862_A8C5B833 
X-CRM114-Status: GOOD (  21.40  )
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

RWwgbHVuLCAxMyBhYnIgMjAyNiBhIGxhcyAxMDowNywgS3J6eXN6dG9mIEtvemxvd3NraQooPGty
emtAa2VybmVsLm9yZz4pIGVzY3JpYmnDszoKPgo+IE9uIDEzLzA0LzIwMjYgMTA6MDIsIElrZXIg
UGVkcm9zYSB3cm90ZToKPiA+IFRoaXMgc2VyaWVzIGVuYWJsZXMgY29tcGxldGUgU0QgY2FyZCBz
dXBwb3J0IGZvciB0aGUgU3BhY2VtaXQgSzEtYmFzZWQKPiA+IE9yYW5nZVBpIFJWMiBib2FyZCwg
aW5jbHVkaW5nIFVIUyAoVWx0cmEgSGlnaCBTcGVlZCkgbW9kZXMgZm9yCj4gPiBoaWdoLXBlcmZv
cm1hbmNlIFNEIGNhcmQgb3BlcmF0aW9uLgo+ID4KPiA+IEJhY2tncm91bmQKPiA+Cj4gPiBUaGUg
U3BhY2VtaXQgSzEgU29DIGluY2x1ZGVzIGFuIFNESENJIGNvbnRyb2xsZXIgY2FwYWJsZSBvZiBz
dXBwb3J0aW5nCj4gPiBTRCBjYXJkcyB1cCB0byBVSFMtSSBzcGVlZHMgKFNEUjEwNCBhdCAyMDhN
SHopLiBIb3dldmVyLCBtYWlubGluZQo+ID4gY3VycmVudGx5IGxhY2tzIGJhc2ljIFNEIGNvbnRy
b2xsZXIgY29uZmlndXJhdGlvbiwgU0RIQ0kgZHJpdmVyCj4gPiBlbmhhbmNlbWVudHMgZm9yIHZv
bHRhZ2Ugc3dpdGNoaW5nIGFuZCB0dW5pbmcsIGFuZCBwb3dlciBtYW5hZ2VtZW50Cj4gPiBpbmZy
YXN0cnVjdHVyZS4KPiA+Cj4gPiBJbXBsZW1lbnRhdGlvbgo+ID4KPiA+IFRoZSBzZXJpZXMgZW5h
YmxlcyBTRCBjYXJkIHN1cHBvcnQgdGhyb3VnaCBjb29yZGluYXRlZCBsYXllcnM6Cj4gPgo+ID4g
LSBIYXJkd2FyZSBpbmZyYXN0cnVjdHVyZSAocGF0Y2hlcyAxLTIpOiBEZXZpY2UgdHJlZSBiaW5k
aW5ncyBmb3Igdm9sdGFnZQo+ID4gc3dpdGNoaW5nIGhhcmR3YXJlIGFuZCBlc3NlbnRpYWwgY2xv
Y2sgaW5mcmFzdHJ1Y3R1cmUuCj4gPiAtIFNESENJIGRyaXZlciBlbmhhbmNlbWVudHMgKHBhdGNo
ZXMgMy03KTogUmVndWxhdG9yIGZyYW1ld29yawo+ID4gaW50ZWdyYXRpb24sIHBpbmN0cmwgc3Rh
dGUgc3dpdGNoaW5nIGZvciB2b2x0YWdlIGRvbWFpbnMsIEFJQiByZWdpc3Rlcgo+ID4gcHJvZ3Jh
bW1pbmcsIGFuZCBjb21wcmVoZW5zaXZlIFNEUiB0dW5pbmcgc3VwcG9ydCBmb3IgcmVsaWFibGUg
VUhTCj4gPiBvcGVyYXRpb24uCj4gPiAtIFNvQyBhbmQgYm9hcmQgaW50ZWdyYXRpb24gKHBhdGNo
ZXMgOC0xMCk6IENvbXBsZXRlIEsxIFNvQyBjb250cm9sbGVyCj4gPiBkZWZpbml0aW9ucywgUE1J
QyBwb3dlciBpbmZyYXN0cnVjdHVyZSwgYW5kIE9yYW5nZVBpIFJWMiBib2FyZCBlbmFibGVtZW50
Cj4gPiB3aXRoIGZ1bGwgVUhTIHN1cHBvcnQuCj4gPgo+ID4gVGhpcyB0cmFuc2Zvcm1zIHRoZSBP
cmFuZ2VQaSBSVjIgZnJvbSBoYXZpbmcgbm8gU0QgY2FyZCBzdXBwb3J0IHRvIGZ1bGwKPiA+IFVI
Uy1JIGNhcGFiaWxpdHksIGVuYWJsaW5nIGhpZ2gtcGVyZm9ybWFuY2Ugc3RvcmFnZSB1cCB0byAy
MDhNSHouCj4gPgo+ID4gVGVzdGVkLWJ5OiBNaWNoYWVsIE9wZGVuYWNrZXIgPG1pY2hhZWwub3Bk
ZW5hY2tlckByb290Y29tbWl0LmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IElrZXIgUGVkcm9zYSA8
aWtlcnBlZHJvc2FtQGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4gQ2hhbmdlcyBpbiB2ODoKPiA+IC0g
UmVzZW5kaW5nIHRoZSBzZXJpZXMgYXMgdjguIFRoZSB2NyBzdWJtaXNzaW9uIGZhaWxlZCBkdWUg
dG8gYW4gU01UUAo+ID4gICBlcnJvciBkdXJpbmcgdHJhbnNpdCwgd2hpY2ggcmVzdWx0ZWQgaW4g
YSBicm9rZW4gdGhyZWFkIG9uIHRoZSBtYWlsaW5nCj4gPiAgIGxpc3QuCj4KPiBIbT8gRXZlcnl0
aGluZyBpcyBoZXJlOgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2MDQxMy1vcmFu
Z2VwaS1zZC1jYXJkLXVocy12Ny0xLTE2NjUwZjQ5YzAyMkBnbWFpbC5jb20vCj4KPiBZb3UgY2Fu
IHNlbmQgaW5kaXZpZHVhbCBwYXRjaGVzIHRvIGZpeCB1cCB0aHJlYWRpbmcsIHVzZSAtLWluLXJl
cGx5LXRvLgoKTXkgYXBvbG9naWVzIGZvciB0aGUgbm9pc2UgYW5kIHRoZSByYXBpZCByZXNlbmQu
CgpUaGUgcmVhc29uIGZvciB2OCB3YXMgdGhhdCB0aGUgdjcgY292ZXIgbGV0dGVyICgwLzkpIGZh
aWxlZCB0byByZWFjaAp0aGUgbWFpbGluZyBsaXN0IGR1ZSB0byBhbiBTTVRQIGVycm9yIG9uIG15
IGVuZC4gVGhpcyBsZWZ0IHRoZSB2Nwp0aHJlYWQgImhlYWRsZXNzIiBpbiB0aGUgYXJjaGl2ZXMg
d2l0aG91dCB0aGUgY2hhbmdlbG9nIG9yIHRoZSBmdWxsCmNvbnRleHQgb2YgdGhlIHNlcmllcy4g
SSB3YXMgYXR0ZW1wdGluZyB0byBmaXggdGhlIHRocmVhZGluZwppbW1lZGlhdGVseSBzbyB0aGF0
IHJldmlld2VycyB3b3VsZCBoYXZlIGEgY29tcGxldGUgc2V0IG9mIHBhdGNoZXMgdG8KbG9vayBh
dCwgYnV0IEkgcmVhbGl6ZSBub3cgdGhhdCByZXNlbmRpbmcgdGhlIGVudGlyZSBzZXJpZXMgb24g
dGhlCnNhbWUgZGF5IHdhcyBwcmVtYXR1cmUuCgo+Cj4gPiAtIE5vIGZ1bmN0aW9uYWwgY2hhbmdl
cyBmcm9tIHY3Lgo+ID4gLSBMaW5rIHRvIHY3OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIw
MjYwNDEzLW9yYW5nZXBpLXNkLWNhcmQtdWhzLXY3LTEtMTY2NTBmNDljMDIyQGdtYWlsLmNvbQo+
ID4KPgo+IFlvdSBhbHJlYWR5IHNlbnQgaXQgb24gMTN0aCBvZiBBcHJpbC4gQW5kIG5vdyB2OCB0
aGUgc2FtZSBkYXkuIFdhaXQgYQo+IGZldyBkYXlzIHRvIGFsbG93IHBlb3BsZSB0byBhY3R1YWxs
eSByZXZpZXcgeW91ciBjb2RlLgo+Cj4gSXQncyBCVFcgbWVyZ2Ugd2luZG93LCBzbyBiaWcgc2Vy
aWVzIHNob3VsZCBzbG93IGRvd24uCgpJIHRha2UgeW91ciBwb2ludCByZWdhcmRpbmcgdGhlIG1l
cmdlIHdpbmRvdy4gSSB3aWxsIHN0ZXAgYmFjayBhbmQKd2FpdCBmb3IgZmVlZGJhY2sgb24gdjgg
b25jZSB0aGUgd2luZG93IGNsb3NlcyBhbmQgeW91IGhhdmUgbW9yZSByb29tCmZvciByZXZpZXdz
LgoKPgo+IEJlc3QgcmVnYXJkcywKPiBLcnp5c3p0b2YKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
