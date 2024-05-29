Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D1CCC25B75
	for <linux-riscv@archiver.kernel.org>; Wed, 29 May 2024 05:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JVWPFc5H/m+b/mS9Gcu71WJs63kZNS/A/YcO9031FZM=; b=qfDrcY+Qoydojc
	Z4mvp+qHmeulyXJOSyPCaExTIkqS0IyrSxindAglwc2YozPEXD4uFQV7YyEJHk323g7U8H/fDw07M
	wOUiFNnE7dD/JAuiRGtC0Jbue9xI8jSbzUuyfxAw6zZyjlPpU1RJFRVGJnbavwNtdHDpAkeWY6WNq
	6KAwuvYnfLAnAaHfi94+YOifkrAB+W+DNibUkrPSUJvHN2k8w4Bxc3eHYwEbgOITerwFRNp17RFhl
	JrySfFjIN/f4noKYgkgdCAnJ7MPpVeEwUyue/TT/F8QPqldcyJGZLYtB1H+ZB3EBGxWWYuXYoFbqb
	PaKxamQRUkHgytQbHPvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCBfY-00000002rWv-3FxE;
	Wed, 29 May 2024 05:16:13 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCBfU-00000002rVr-3bsI
	for linux-riscv@lists.infradead.org;
	Wed, 29 May 2024 05:16:10 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2e95abc7259so17397521fa.3
        for <linux-riscv@lists.infradead.org>; Tue, 28 May 2024 22:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1716959764; x=1717564564; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y9ZQ9DZWQvzLjVwLl3ADCun2JEpKNxcZ7yv0Pu1NHRw=;
        b=dUf3hI5Ysjgyxzz3a9IlSjmTR55B+QYvI4Dn8Hnc3UEuKm2Vaxf08xl0NdeULLi2Sa
         KItRoMcuXSxBlDC4sPX4vXAGHJSaucD4iTGzyxDBHlFhWHGpOEerKFt4q+Arv43BQoLN
         YCdO6cf87cGE56gGZbqy8esFodYVDVshXxWuOEg9tCzWFC9ZvKCQEBSfTRNZSALlIXRv
         7SB42yf5/NUAcssIvLQkWrbH1us+3Jusgvhp/DHktSQyWDGXTRqu32GvOm1NrYmrAfWy
         aTicujExMDfb78oeikxWdFJJiJTsYwWJSR7TbM9Il7vv0FASz21m4GTHEauBBCrBhU35
         OiDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716959764; x=1717564564;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y9ZQ9DZWQvzLjVwLl3ADCun2JEpKNxcZ7yv0Pu1NHRw=;
        b=vDE//Dky+g3N01Agf9OHjxjQonfqXBPSNLlT7hn3LXXttLaGbHNwXn+MAugDSGoybD
         M0ebf0jPoRCvAu541kbOTXO4fu6IwdP6Fx7CO0nGWpz2AEOdanVj4ByZVddBBPl3Es/U
         KA1YncxvklwmW1ZS1ZzI4I4ytXjTfGG2GWMoryzhNKxWMLUoIvnirQU1vTRUbOQHMlDz
         DMeFGQFx76Ba7eTflz+dsKgDXnMArvJFVc5WZGPEtjRYBI5xbWnAlOp5VwJaS6JBSga+
         3t5DQJ9KGO8UCqFbiEfEbwLaK2jXJq/b3PO0DlJKlq7mz86eSCG76Kw/p3bpo9eBEads
         8KPg==
X-Forwarded-Encrypted: i=1; AJvYcCXuX1FvvVqvzcnz71Pe1C9Gk90VydR72zjPtXVmzmeH96chgNcCpP2RKdnMGxKEsyQs4hfe+kd8BNPLAzJcaFhnAJM727zINOFygNvdxvCm
X-Gm-Message-State: AOJu0YxSuHDplcy8bk/6jsuFv0wmeh1SiRdhkU9/CZ5gk75piPSQsmvS
	0WFshLT2i4TxAM3Zr36qWSRN6R1VOnkzorUS5lVgDZ7IAy67OMxXy6RvZhzkBCtmPttefTYd43y
	71bxtGjGfhRFNhGNFn0W9v/8o0eFWnEqWwUQWfA==
X-Google-Smtp-Source: AGHT+IE4Ixyyb9dBIC7b/LMvEyISULydyhrMO3jCXkTNja3SosYDAO4Cj0e7ftfvuomR4+6kRgh5fxUQRNLL0+8ak0I=
X-Received: by 2002:a2e:87c7:0:b0:2e9:794c:19ae with SMTP id
 38308e7fff4ca-2e9794c1b09mr40977011fa.23.1716959763885; Tue, 28 May 2024
 22:16:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240528164132.2451685-1-maz@kernel.org>
In-Reply-To: <20240528164132.2451685-1-maz@kernel.org>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 29 May 2024 10:45:52 +0530
Message-ID: <CAK9=C2XNPJP0X=pg5TSrQbsuouDD3jP-gy2Sm4BXNJp0ZiWp+A@mail.gmail.com>
Subject: Re: [PATCH] of: property: Fix fw_devlink handling of interrupt-map
To: Marc Zyngier <maz@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	Saravana Kannan <saravanak@google.com>, Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_221609_036051_19961D37 
X-CRM114-Status: GOOD (  27.34  )
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

T24gVHVlLCBNYXkgMjgsIDIwMjQgYXQgMTA6MTHigK9QTSBNYXJjIFp5bmdpZXIgPG1hekBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IENvbW1pdCBkOTc2YzZmNGIzMmMgKCJvZjogcHJvcGVydHk6IEFk
ZCBmd19kZXZsaW5rIHN1cHBvcnQgZm9yCj4gaW50ZXJydXB0LW1hcCBwcm9wZXJ0eSIpIHRyaWVk
IHRvIGRvIHdoYXQgaXQgc2F5cyBvbiB0aGUgdGluLAo+IGJ1dCBmYWlsZWQgb24gYSBjb3VwbGUg
b2YgcG9pbnRzOgo+Cj4gLSBpdCBjb25mdXNlcyBieXRlcyBhbmQgY2VsbHMuIE5vdCBhIGh1Z2Ug
ZGVhbCwgZXhjZXB0IHdoZW4gaXQKPiAgIGNvbWVzIHRvIHBvaW50ZXIgYXJpdGhtZXRpYwo+Cj4g
LSBpdCBkb2Vzbid0IHJlYWxseSBoYW5kbGUgYW55dGhpbmcgYnV0IGludGVycnVwdC1tYXBzIHRo
YXQgaGF2ZQo+ICAgdGhlaXIgcGFyZW50ICNhZGRyZXNzLWNlbGxzIHNldCB0byAwCj4KPiBUaGUg
Y29tYmluYXRpb25zIG9mIHRoZSB0d28gbGVhZHMgdG8gc29tZSBzZXJpb3VzIGZ1biBvbiBteSBN
MQo+IGJveCwgd2l0aCBwbGVudHkgb2YgV0FSTi1PTigpIGZpcmluZyBhbGwgb3ZlciB0aGUgc2hv
cCwgYW5kCj4gYW11c2luZyB2YWx1ZXMgYmVpbmcgZ2VuZXJhdGVkIGZvciBpbnRlcnJ1cHQgc3Bl
Y2lmaWVycy4KPgo+IEFkZHJlc3MgYm90aCBpc3N1ZXMgc28gdGhhdCBJIGNhbiBib290IG15IG1h
Y2hpbmVzIGFnYWluLgo+Cj4gRml4ZXM6IGQ5NzZjNmY0YjMyYyAoIm9mOiBwcm9wZXJ0eTogQWRk
IGZ3X2Rldmxpbmsgc3VwcG9ydCBmb3IgaW50ZXJydXB0LW1hcCBwcm9wZXJ0eSIpCj4gU2lnbmVk
LW9mZi1ieTogTWFyYyBaeW5naWVyIDxtYXpAa2VybmVsLm9yZz4KPiBDYzogQW51cCBQYXRlbCA8
YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+Cj4gQ2M6IFNhcmF2YW5hIEthbm5hbiA8c2FyYXZhbmFr
QGdvb2dsZS5jb20+Cj4gQ2M6IFJvYiBIZXJyaW5nIChBcm0pIDxyb2JoQGtlcm5lbC5vcmc+CgpU
aGFua3MgZm9yIHRoZSBmaXggcGF0Y2ggYnV0IHVuZm9ydHVuYXRlbHkgaXQgYnJlYWtzIGZvciBS
SVNDLVYuCgo+IC0tLQo+ICBkcml2ZXJzL29mL3Byb3BlcnR5LmMgfCAxNiArKysrKysrKysrKysr
Ky0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvb2YvcHJvcGVydHkuYyBiL2RyaXZlcnMvb2YvcHJvcGVy
dHkuYwo+IGluZGV4IDFjODNlNjhmODA1Yi4uOWFkZWJjNjNiZWE5IDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvb2YvcHJvcGVydHkuYwo+ICsrKyBiL2RyaXZlcnMvb2YvcHJvcGVydHkuYwo+IEBAIC0x
MzIyLDcgKzEzMjIsMTMgQEAgc3RhdGljIHN0cnVjdCBkZXZpY2Vfbm9kZSAqcGFyc2VfaW50ZXJy
dXB0X21hcChzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wLAo+ICAgICAgICAgYWRkcmNlbGxzID0gb2Zf
YnVzX25fYWRkcl9jZWxscyhucCk7Cj4KPiAgICAgICAgIGltYXAgPSBvZl9nZXRfcHJvcGVydHko
bnAsICJpbnRlcnJ1cHQtbWFwIiwgJmltYXBsZW4pOwo+IC0gICAgICAgaWYgKCFpbWFwIHx8IGlt
YXBsZW4gPD0gKGFkZHJjZWxscyArIGludGNlbGxzKSkKPiArICAgICAgIGltYXBsZW4gLz0gc2l6
ZW9mKCppbWFwKTsKPiArCj4gKyAgICAgICAvKgo+ICsgICAgICAgICogQ2hlY2sgdGhhdCB3ZSBo
YXZlIGVub3VnaCBydW53YXkgZm9yIHRoZSBjaGlsZCB1bml0IGludGVycnVwdAo+ICsgICAgICAg
ICogc3BlY2lmaWVyIGFuZCBhIHBoYW5kbGUuIFRoYXQncyB0aGUgYmFyZSBtaW5pbXVtIHdlIGNh
biBleHBlY3QuCj4gKyAgICAgICAgKi8KPiArICAgICAgIGlmICghaW1hcCB8fCBpbWFwbGVuIDw9
IChhZGRyY2VsbHMgKyBpbnRjZWxscyArIDEpKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gTlVM
TDsKPiAgICAgICAgIGltYXBfZW5kID0gaW1hcCArIGltYXBsZW47Cj4KPiBAQCAtMTM0Niw4ICsx
MzUyLDE0IEBAIHN0YXRpYyBzdHJ1Y3QgZGV2aWNlX25vZGUgKnBhcnNlX2ludGVycnVwdF9tYXAo
c3RydWN0IGRldmljZV9ub2RlICpucCwKPiAgICAgICAgICAgICAgICAgaWYgKCFpbmRleCkKPiAg
ICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gc3VwX2FyZ3MubnA7Cj4KPiAtICAgICAgICAg
ICAgICAgb2Zfbm9kZV9wdXQoc3VwX2FyZ3MubnApOwo+ICsgICAgICAgICAgICAgICAvKgo+ICsg
ICAgICAgICAgICAgICAgKiBBY2NvdW50IGZvciB0aGUgZnVsbCBwYXJlbnQgdW5pdCBpbnRlcnJ1
cHQgc3BlY2lmaWVyCj4gKyAgICAgICAgICAgICAgICAqIChhZGRyZXNzIGNlbGxzLCBpbnRlcnJ1
cHQgY2VsbHMsIGFuZCBwaGFuZGxlKS4KPiArICAgICAgICAgICAgICAgICovCj4gKyAgICAgICAg
ICAgICAgIGltYXAgKz0gb2ZfYnVzX25fYWRkcl9jZWxscyhzdXBfYXJncy5ucCk7CgpUaGlzIGJy
ZWFrcyBmb3IgUklTQy1WIGJlY2F1c2Ugd2UgZG9uJ3QgaGF2ZSAiI2FkZHJlc3MtY2VsbHMiCnBy
b3BlcnR5IGluIGludGVycnVwdCBjb250cm9sbGVyIERUIG5vZGUgYW5kIG9mX2J1c19uX2FkZHJf
Y2VsbHMoKQpyZXRyaWV2ZXMgIiNhZGRyZXNzLWNlbGxzIiBmcm9tIHRoZSBwYXJlbnQgb2YgaW50
ZXJydXB0IGNvbnRyb2xsZXIuCgpUaGUgb2ZfaXJxX3BhcnNlX3JhdygpIGxvb2tzIGZvciAiI2Fk
ZHJlc3MtY2VsbHMiIHByb3BlcnR5CmluIHRoZSBpbnRlcnJ1cHQgY29udHJvbGxlciBEVCBub2Rl
IG9ubHkgc28gd2Ugc2hvdWxkIGRvIGEKc2ltaWxhciB0aGluZyBoZXJlIGFzIHdlbGwuCgpUaGUg
YmVsb3cgY2hhbmdlIG9uIHRvcCBvZiB0aGlzIHBhdGNoIHdvcmtlZCBmb3IgbWUuCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9vZi9wcm9wZXJ0eS5jIGIvZHJpdmVycy9vZi9wcm9wZXJ0eS5jCmluZGV4
IDlhZGViYzYzYmVhOS4uZjU0ZGEyOTg5ZWE5IDEwMDY0NAotLS0gYS9kcml2ZXJzL29mL3Byb3Bl
cnR5LmMKKysrIGIvZHJpdmVycy9vZi9wcm9wZXJ0eS5jCkBAIC0xMzA4LDcgKzEzMDgsNyBAQCBz
dGF0aWMgc3RydWN0IGRldmljZV9ub2RlCipwYXJzZV9pbnRlcnJ1cHRfbWFwKHN0cnVjdCBkZXZp
Y2Vfbm9kZSAqbnAsCiB7CiAgICAgY29uc3QgX19iZTMyICppbWFwLCAqaW1hcF9lbmQsICphZGRy
OwogICAgIHN0cnVjdCBvZl9waGFuZGxlX2FyZ3Mgc3VwX2FyZ3M7Ci0gICAgdTMyIGFkZHJjZWxs
cywgaW50Y2VsbHM7CisgICAgdTMyIGFkZHJjZWxscywgaW50Y2VsbHMsIHBhZGRyY2VsbHM7CiAg
ICAgaW50IGksIGltYXBsZW47CgogICAgIGlmICghSVNfRU5BQkxFRChDT05GSUdfT0ZfSVJRKSkK
QEAgLTEzNTYsNyArMTM1Niw4IEBAIHN0YXRpYyBzdHJ1Y3QgZGV2aWNlX25vZGUKKnBhcnNlX2lu
dGVycnVwdF9tYXAoc3RydWN0IGRldmljZV9ub2RlICpucCwKICAgICAgICAgICogQWNjb3VudCBm
b3IgdGhlIGZ1bGwgcGFyZW50IHVuaXQgaW50ZXJydXB0IHNwZWNpZmllcgogICAgICAgICAgKiAo
YWRkcmVzcyBjZWxscywgaW50ZXJydXB0IGNlbGxzLCBhbmQgcGhhbmRsZSkuCiAgICAgICAgICAq
LwotICAgICAgICBpbWFwICs9IG9mX2J1c19uX2FkZHJfY2VsbHMoc3VwX2FyZ3MubnApOworICAg
ICAgICBpZiAoIW9mX3Byb3BlcnR5X3JlYWRfdTMyKHN1cF9hcmdzLm5wLCAiI2FkZHJlc3MtY2Vs
bHMiLCAmcGFkZHJjZWxscykpCisgICAgICAgICAgICBpbWFwICs9IHBhZGRyY2VsbHM7CiAgICAg
ICAgIGltYXAgKz0gc3VwX2FyZ3MuYXJnc19jb3VudCArIDE7CgogICAgICAgICBvZl9ub2RlX3B1
dChzdXBfYXJncy5ucCk7Cgo8c25pcD4KClJlZ2FyZHMsCkFudXAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
