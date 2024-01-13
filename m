Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABF7AC4706C
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Jan 2024 00:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BiWB3w2XKS4BkkyjKKrIEoravjy9S3hy/JMzvZAmR1c=; b=cmYrSb2Z6CVDjP
	LdUbADPv4/KMKKEoupIkk4XHGzlBTJRXvJxn/9aNX2dl8n52yI+gaaPo6Af/A+ezpJ6/BL+N3gqIi
	Gxqk/eyu/dMjytATvW6NmYbHKE+8WKOi50gVH5Y0fSnOoH77dyqgHOtJ6G/lJhA9c5Rm+IyLyWdIO
	fTT5AkM+ZgJ7DcFIwRMFt3Sq3sSM9Ihjt8LeNB6YmHrCGxA592KAk0AOqvhqyfbjlvYSKmeg0Xidm
	8IKvtfNALt0mfu0/5vjRrGUKB+qwJYlB9Jr2U2zXoGy83off6imZi1L29AhdCzvesdETEkqFbAHy3
	kSxXAiEd30KF1T0ekrSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rORwc-004Ktn-0E;
	Sat, 13 Jan 2024 00:32:14 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rORwX-004KrQ-2G
	for linux-riscv@lists.infradead.org;
	Sat, 13 Jan 2024 00:32:11 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2ccbbb5eb77so82649641fa.2
        for <linux-riscv@lists.infradead.org>; Fri, 12 Jan 2024 16:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1705105928; x=1705710728; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lzga2b4T8jG3LT+m5ymrl6IfG+dETUDO8ivjxyijZE0=;
        b=tTQUh9T6Y6fGKXSC8wXCEfZwt1IfOSjR0Gv6ytXJJmxB4iWLH9S59akJ5G8vYOeAre
         M57aUDOrW+NRfPFpMHZUxCRrYnpX87lc5ky5Yy1z2KdYgCJkqJ6npoA/LPD1S4ClZuiS
         zl2i24EPuHVe22K7ThTNkzPHLAdlKqePG60pE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705105928; x=1705710728;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lzga2b4T8jG3LT+m5ymrl6IfG+dETUDO8ivjxyijZE0=;
        b=GoN8KkYb+Q+tHwkoZ2ReRIWkvdUO+CCrQCkQ2H9q1ucq6vx0ZxKgM9NLj0JvPUYlXl
         ppCd0IIq9sobRtLIGInDKZqnxE1zPKl4pxHznQ4OT/qJJI5X6SEHtOVasJYX0/IarPEr
         +jWZw/nTEIGb87FuVP5FATdUH9eCFNnBaD/I2/xJAk9F1D3JM8M1YtcXl2wJtdq+ew0v
         XCbwKBmEvFEMkLT5cylxsZGJbRIkne6Ew9L2sqYHY0+UoMet7Iyf2UsnZCM08jzxxlSk
         7rILPhGaoRzK4bIhJxYGyIUWx5uUetZBe5mUrq6qFiFuz80IxwsUL8wHAg3yGQPQi0vh
         U5vw==
X-Gm-Message-State: AOJu0Yywy2H/cSwJ62GqQXCWmHUmjhuqNcQLdq9ZJKnx2sq4sefysJrv
	FvCroFh7ABWXUKDEr0xn1IGmgV+ugv2w1eE35u3KykzUHcBq
X-Google-Smtp-Source: AGHT+IFYVmL/8V0hnK36wD0F+Tj56+5iO0c+zitkdAxQYpkX5w2AMpz8U0JxqKR9numdiRkolOnOQ4vwuN8VuMQU6Xw=
X-Received: by 2002:a2e:b619:0:b0:2cc:68f0:c10d with SMTP id
 r25-20020a2eb619000000b002cc68f0c10dmr1029870ljn.34.1705105927728; Fri, 12
 Jan 2024 16:32:07 -0800 (PST)
MIME-Version: 1.0
References: <20240110073917.2398826-1-peterlin@andestech.com>
 <20240110073917.2398826-5-peterlin@andestech.com> <CAOnJCUJ0fN5=+b4jDx+NPqUwgwGKuBNYt7d86dXYNyjzUYFAWQ@mail.gmail.com>
 <20240113-sensuous-scraggly-dee35f3e213f@spud>
In-Reply-To: <20240113-sensuous-scraggly-dee35f3e213f@spud>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 12 Jan 2024 16:31:56 -0800
Message-ID: <CAOnJCU+JjcpH0t3kGcdM4hjj-di9UKWwtaEpMdwQmOQSnEtKJg@mail.gmail.com>
Subject: Re: [PATCH v7 04/16] dt-bindings: riscv: Add Andes interrupt
 controller compatible string
To: Conor Dooley <conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_163209_752562_04C71AA4 
X-CRM114-Status: GOOD (  26.20  )
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
Cc: mark.rutland@arm.com, irogers@google.com, heiko@sntech.de, geert+renesas@glider.be, alexander.shishkin@linux.intel.com, linux-kernel@vger.kernel.org, conor.dooley@microchip.com, guoren@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org, will@kernel.org, linux-renesas-soc@vger.kernel.org, tim609@andestech.com, Yu Chien Peter Lin <peterlin@andestech.com>, samuel@sholland.org, anup@brainfault.org, dminus@andestech.com, magnus.damm@gmail.com, jernej.skrabec@gmail.com, peterz@infradead.org, wens@csie.org, mingo@redhat.com, jszhang@kernel.org, inochiama@outlook.com, linux-sunxi@lists.linux.dev, ajones@ventanamicro.com, devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, andre.przywara@arm.com, locus84@andestech.com, acme@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh+dt@kernel.org, paul.walmsley@sifive.com, namhyung@kernel.org, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, ycliang@andestech.com, n.shubin@yadro.com, rdunlap@infradead.org, chao.wei@sophgo.com, adrian.hunter@intel.com, linux-perf-users@vger.kernel.org, evan@rivosinc.com, palmer@dabbelt.com, jolsa@kernel.org, unicorn_wang@outlook.com, wefu@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBKYW4gMTIsIDIwMjQgYXQgNDoxOeKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBGcmksIEphbiAxMiwgMjAyNCBhdCAwMzo1MDoxNVBNIC0w
ODAwLCBBdGlzaCBQYXRyYSB3cm90ZToKPiA+IE9uIFR1ZSwgSmFuIDksIDIwMjQgYXQgMTE6NDDi
gK9QTSBZdSBDaGllbiBQZXRlciBMaW4KPiA+IDxwZXRlcmxpbkBhbmRlc3RlY2guY29tPiB3cm90
ZToKPiA+ID4KPiA+ID4gQWRkICJhbmRlc3RlY2gsY3B1LWludGMiIGNvbXBhdGlibGUgc3RyaW5n
IHRvIGluZGljYXRlIHRoYXQKPiA+ID4gQW5kZXMgc3BlY2lmaWMgbG9jYWwgaW50ZXJydXB0IGlz
IHN1cHBvcnRlZCBvbiB0aGUgY29yZSwKPiA+ID4gZS5nLiBBWDQ1TVAgY29yZXMgaGF2ZSAzIHR5
cGVzIG9mIG5vbi1zdGFuZGFyZCBsb2NhbCBpbnRlcnJ1cHQKPiA+ID4gd2hpY2ggY2FuIGJlIGhh
bmRsZWQgaW4gc3VwZXJ2aXNvciBtb2RlOgo+ID4gPgo+ID4KPiA+IFBBVENIMSBpbiB0aGlzIHNl
cmllcyByZW5hbWVzIGV2ZXJ5dGhpbmcgZnJvbSBBTkRFU1RFQ0ggdG8gQU5ERVMgdG8gYmUKPiA+
IGNvbnNpc3RlbnQuCj4gPiBIZXJlIHlvdSBhcmUgYWRkaW5nIERUIGJpbmRpbmcgd2l0aCAiYW5k
ZXN0ZWNoIi4gSXMgdGhlcmUgYW55Cj4gPiBmdW5kYW1lbnRhbCBkaWZmZXJlbmNlIGJldHdlZW4g
dGhlc2UgdHdvIHRvIGRlbWFuZAo+ID4gdGhpcyBjaGFuZ2UgPwo+Cj4gVGhpcyBvbmUgaXMgdGhl
IHZlbmRvciBwcmVmaXggYW5kIHRoZSBjb21wYW55IGhhcyBiZWVuIGFzc2lnbmVkCj4gImFuZGVz
dGVjaCIgYW5kIHRoZXkncmUgbm90IGdldHRpbmcgYSBzZWNvbmQgb25lLiBUaGUgcmVuYW1lIG9m
IHRoZQoKVGhhbmtzIGZvciB0aGUgY2xhcmlmaWNhdGlvbi4KCj4gdmFyaWFibGVzIGlzIGEgYml0
IGdyYXR1aXRvdXMgdGJmLgo+CgpJIGZlbHQgdGhlIHNhbWUuCgo+IENoZWVycywKPiBDb25vci4K
Pgo+ID4gRllJOiBJIGRvbid0IG1pbmQgZWl0aGVyIHdheSBhcyBJIGRvbid0IGhhdmUgc2tpbiBp
biB0aGUgZ2FtZS4gSnVzdAo+ID4gc29tZXRoaW5nIEkgbm90aWNlZCB3aGlsZSByZXZpZXdpbmcg
dGhlIHNlcmllcy4KPiA+Cj4gPiA+IC0gU2xhdmUgcG9ydCBFQ0MgZXJyb3IgaW50ZXJydXB0Cj4g
PiA+IC0gQnVzIHdyaXRlIHRyYW5zYWN0aW9uIGVycm9yIGludGVycnVwdAo+ID4gPiAtIFBlcmZv
cm1hbmNlIG1vbml0b3Igb3ZlcmZsb3cgaW50ZXJydXB0Cj4gPiA+Cj4gPiA+IFRoZXNlIGludGVy
cnVwdHMgYXJlIGVuYWJsZWQvZGlzYWJsZWQgdmlhIGEgY3VzdG9tIHJlZ2lzdGVyCj4gPiA+IFNM
SUUgaW5zdGVhZCBvZiB0aGUgc3RhbmRhcmQgaW50ZXJydXB0IGVuYWJsZSByZWdpc3RlciBTSUUu
Cj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IFl1IENoaWVuIFBldGVyIExpbiA8cGV0ZXJsaW5A
YW5kZXN0ZWNoLmNvbT4KPiA+ID4gQWNrZWQtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5
QG1pY3JvY2hpcC5jb20+Cj4gPiA+IFJldmlld2VkLWJ5OiBMYWQgUHJhYmhha2FyIDxwcmFiaGFr
YXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+Cj4gPiA+IC0tLQo+ID4gPiBDaGFuZ2Vz
IHYxIC0+IHYyOgo+ID4gPiAgIC0gTmV3IHBhdGNoCj4gPiA+IENoYW5nZXMgdjIgLT4gdjM6Cj4g
PiA+ICAgLSBVcGRhdGVkIGNvbW1pdCBtZXNzYWdlCj4gPiA+ICAgLSBGaXhlZCBwb3NzaWJsZSBj
b21wYXRpYmxlcyBmb3IgQW5kZXMgSU5UQwo+ID4gPiBDaGFuZ2VzIHYzIC0+IHY0Ogo+ID4gPiAg
IC0gQWRkIGNvbnN0IGVudHJ5IGluc3RlYWQgb2YgZW51bSAoU3VnZ2VzdGVkIGJ5IENvbm9yKQo+
ID4gPiBDaGFuZ2VzIHY0IC0+IHY1Ogo+ID4gPiAgIC0gSW5jbHVkZSBDb25vcidzIEFja2VkLWJ5
Cj4gPiA+ICAgLSBJbmNsdWRlIFByYWJoYWthcidzIFJldmlld2VkLWJ5Cj4gPiA+IENoYW5nZXMg
djUgLT4gdjY6Cj4gPiA+ICAgLSBObyBjaGFuZ2UKPiA+ID4gQ2hhbmdlcyB2NiAtPiB2NzoKPiA+
ID4gICAtIE5vIGNoYW5nZQo+ID4gPiAtLS0KPiA+ID4gIERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9yaXNjdi9jcHVzLnlhbWwgfCA2ICsrKysrLQo+ID4gPiAgMSBmaWxlIGNoYW5n
ZWQsIDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2NwdXMueWFtbCBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9jcHVzLnlhbWwKPiA+ID4gaW5k
ZXggMjM2NDZiNjg0ZWEyLi4zM2MyYjYyMGE1OWYgMTAwNjQ0Cj4gPiA+IC0tLSBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9jcHVzLnlhbWwKPiA+ID4gKysrIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2NwdXMueWFtbAo+ID4gPiBAQCAt
MTAxLDcgKzEwMSwxMSBAQCBwcm9wZXJ0aWVzOgo+ID4gPiAgICAgICAgICBjb25zdDogMQo+ID4g
Pgo+ID4gPiAgICAgICAgY29tcGF0aWJsZToKPiA+ID4gLSAgICAgICAgY29uc3Q6IHJpc2N2LGNw
dS1pbnRjCj4gPiA+ICsgICAgICAgIG9uZU9mOgo+ID4gPiArICAgICAgICAgIC0gaXRlbXM6Cj4g
PiA+ICsgICAgICAgICAgICAgIC0gY29uc3Q6IGFuZGVzdGVjaCxjcHUtaW50Ywo+ID4gPiArICAg
ICAgICAgICAgICAtIGNvbnN0OiByaXNjdixjcHUtaW50Ywo+ID4gPiArICAgICAgICAgIC0gY29u
c3Q6IHJpc2N2LGNwdS1pbnRjCj4gPiA+Cj4gPiA+ICAgICAgICBpbnRlcnJ1cHQtY29udHJvbGxl
cjogdHJ1ZQo+ID4gPgo+ID4gPiAtLQo+ID4gPiAyLjM0LjEKPiA+ID4KPiA+Cj4gPgo+ID4gLS0K
PiA+IFJlZ2FyZHMsCj4gPiBBdGlzaAoKCgotLSAKUmVnYXJkcywKQXRpc2gKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
