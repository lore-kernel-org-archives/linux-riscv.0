Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FE66C4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Apr 2024 06:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/JtbCsPAOmECPvyPMnH4C2fV0Qh3CK8rMWtIiadgOWM=; b=Pk5Xp0ZojE/oT6
	7Y8aKbiP6DgADcLWXS2t0jVwupTH/L23OpSW8+HpCiqMKS5ioSZRazJRckM3bwhpbSGjhE3XHKJvS
	89Xcyuep5tet84tvCMOI4mgzqYeXG5jvba/DAPUGOU+2prI5NL9xPJnI/xqXG8rk5mnehg0xiY9TR
	E4LVgIodADT0XSNXhX4De500vQppSNKlNptp1Tmu6MnMNk4JvaPPDJPL6yyeuMDtXt0H/qWUCyCyE
	abuvGx17ovTA4bTb1lqQcxu8zQ81Xq00q6QXH2xJgmUB0y3IyzMKTA99t8luU+SFYf6N6e79N1OEz
	MJ01Shf9gDhZ9KEZdPJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwzCn-0000000EvbM-0IYH;
	Wed, 17 Apr 2024 06:55:41 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwzCj-0000000EvaX-0O5L
	for linux-riscv@lists.infradead.org;
	Wed, 17 Apr 2024 06:55:39 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2da08b06e0dso56762111fa.2
        for <linux-riscv@lists.infradead.org>; Tue, 16 Apr 2024 23:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1713336933; x=1713941733; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sZGbmlRk8OYQ6Kpz+Jg/xu+IlJYAq+3AXIsG/wFcBY0=;
        b=mfTgPhhtWLqjcMGs0Jba9xum6i9yzBVJ3fDoq+pjia+7mzOVUq0T+dqgXq9L8cvv0V
         N7M8JwsEE/gk9TDmAzg/IzFG0YQcuEuNpGR8ag9FeIgdYcSyC+q1UlhRNAHx6crl+IUn
         ow5QXQx54dWrPpZ+9XKrE0HLBdeSiEe8zw3KuOl4Evf8kmnEmqLi7eJf+Vg7W0x6k7qu
         Vvz9Z8NOc29XINxN3p/yXrdU6qyY+yWNgoDPTGXFTeKLiZgoY9Wo2lyUwCfmFy4VvM4S
         6XIpjhkb3NeRnFWJ7/UiiHffVb62cUvWSW/s809rzd1Z8k6U0Ri0BAYbV8bixQXBnQJq
         2n5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713336933; x=1713941733;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sZGbmlRk8OYQ6Kpz+Jg/xu+IlJYAq+3AXIsG/wFcBY0=;
        b=UvrpurJGfL2PfDgHQKRZJbDygwZMyH+eANbCaZmjT1vFVEZn9PbpCM4lqLwzwR/2H2
         40E3GOKmcEMjmfYOYY+7HKgeOOC1xL/DucxM0vurWi/9jtHzEscXcAm9h9+emYhng39u
         H2hFzt7ecteawgt5+Iz+NLSFxu/Mu/RF0fndLPXgubenDjccHSP4KdeTsdGKcWeuQDCI
         ym2l7xpNbM/kykAhF2GT6bmTPoXA8M689YJe91pLp7yOObuIJaHgiz2IP0ZXWAJ4I709
         7nzq+82mjCRhfxyrRm5p3NUn9kR2rGnU+5UsmYR+AmgBa9n1yEnlBQvBQStuYjyAT4yr
         tOeg==
X-Forwarded-Encrypted: i=1; AJvYcCWz+qNZ75/qHTZc1DLBD8oZdgAHugjMf9A1izZDJbTQCcyDpvxSdrsijzeh7Xr6v84a9/Xl+uQIIHex9DNQoMpSuOouwZUCxiRiLb2Jw8Gd
X-Gm-Message-State: AOJu0YwB9M2xdNRsour80XTPZIeGOAK3z1DwhzKZekMYe83c5RTR54Fx
	hoo1pQDgomzB/TjNjzvpHRKiMiQygONEfS0EBW9YDa7c2nip+3v5sTq/pqZB7h5PW15VXBqrLyo
	TsJc6hBK6YzFO2JYsTTn/IyyT8NSn0BUsDeAjhA==
X-Google-Smtp-Source: AGHT+IEioRgn3J/gIQgGJ6OV7a95PpbKKQjOpe3lYUOLcWBAqxQqpmiBxRuuipgOwmaEqZd2NFkYzR85tc5xMM0UkRc=
X-Received: by 2002:a2e:8049:0:b0:2d9:f7f8:3e88 with SMTP id
 p9-20020a2e8049000000b002d9f7f83e88mr7913210ljg.33.1713336933078; Tue, 16 Apr
 2024 23:55:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240413091942.316054-1-apatel@ventanamicro.com> <20240416141049.GA2148267-robh@kernel.org>
In-Reply-To: <20240416141049.GA2148267-robh@kernel.org>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 17 Apr 2024 12:25:20 +0530
Message-ID: <CAK9=C2WXrgr21mLxynQZ51gfP+PUzFkNmz3VJ9ODVS+b-ecLwQ@mail.gmail.com>
Subject: Re: [PATCH v2] of: property: Add fw_devlink support for interrupt-map property
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_235537_167168_EBA26126 
X-CRM114-Status: GOOD (  29.13  )
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
Cc: devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBBcHIgMTYsIDIwMjQgYXQgNzo0MeKAr1BNIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gT24gU2F0LCBBcHIgMTMsIDIwMjQgYXQgMDI6NDk6NDJQTSArMDUz
MCwgQW51cCBQYXRlbCB3cm90ZToKPiA+IFNvbWUgb2YgdGhlIFBDSSBjb250cm9sbGVycyAoc3Vj
aCBhcyBnZW5lcmljIFBDSSBob3N0IGNvbnRyb2xsZXIpCj4gPiB1c2UgImludGVycnVwdC1tYXAi
IERUIHByb3BlcnR5IHRvIGRlc2NyaWJlIHRoZSBtYXBwaW5nIGJldHdlZW4KPiA+IFBDSSBlbmRw
b2ludHMgYW5kIFBDSSBpbnRlcnJ1cHQgcGlucy4gVGhpcyB0aGUgb25seSBjYXNlIHdoZXJlCj4g
PiB0aGUgaW50ZXJydXB0cyBhcmUgbm90IGRlc2NyaWJlZCBpbiBEVC4KPiA+Cj4gPiBDdXJyZW50
bHksIHRoZXJlIGlzIG5vIGZ3X2RldmxpbmsgY3JlYXRlZCBiYXNlZCBvbiAiaW50ZXJydXB0LW1h
cCIKPiA+IERUIHByb3BlcnR5IHNvIGludGVycnVwdCBjb250cm9sbGVyIGlzIG5vdCBndWFyYW50
ZWVkIHRvIGJlIHByb2JlZAo+ID4gYmVmb3JlIFBDSSBob3N0IGNvbnRyb2xsZXIuIFRoaXMgYWZm
ZWN0cyBldmVyeSBwbGF0Zm9ybSB3aGVyZSBib3RoCj4gPiBQQ0kgaG9zdCBjb250cm9sbGVyIGFu
ZCBpbnRlcnJ1cHQgY29udHJvbGxlcnMgYXJlIHByb2JlZCBhcyByZWd1bGFyCj4gPiBwbGF0Zm9y
bSBkZXZpY2VzLgo+ID4KPiA+IFRoaXMgY3JlYXRlcyBmd19kZXZsaW5rIGJldHdlZW4gY29uc3Vt
ZXJzIChQQ0kgaG9zdCBjb250cm9sbGVyKSBhbmQKPiA+IHN1cHBsaWVyIChpbnRlcnJ1cHQgY29u
dHJvbGxlcikgYmFzZWQgb24gImludGVycnVwdC1tYXAiIERUIHByb3BlcnR5Lgo+ID4KPiA+IFNp
Z25lZC1vZmYtYnk6IEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPgo+ID4gLS0t
Cj4gPiBDaGFuZ2VzIHNpbmNlIHYxOgo+ID4gLSBVcGRhdGVkIGNvbW1pdCBkZXNjcmlwdGlvbiBi
YXNlZCBvbiBSb2IncyBzdWdnZXN0aW9uCj4gPiAtIFVzZSBvZl9pcnFfcGFyc2VfcmF3KCkgZm9y
IHBhcnNpbmcgaW50ZXJydXB0LW1hcCBEVCBwcm9wZXJ0eQo+ID4gLS0tCj4gPiAgZHJpdmVycy9v
Zi9wcm9wZXJ0eS5jIHwgNTggKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA1OCBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvb2YvcHJvcGVydHkuYyBiL2RyaXZlcnMvb2YvcHJvcGVydHkuYwo+ID4g
aW5kZXggYTYzNThlZTk5Yjc0Li42N2JlNjYzODRkYWMgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJz
L29mL3Byb3BlcnR5LmMKPiA+ICsrKyBiL2RyaXZlcnMvb2YvcHJvcGVydHkuYwo+ID4gQEAgLTEz
MTEsNiArMTMxMSw2MyBAQCBzdGF0aWMgc3RydWN0IGRldmljZV9ub2RlICpwYXJzZV9pbnRlcnJ1
cHRzKHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAsCj4gPiAgICAgICByZXR1cm4gb2ZfaXJxX3BhcnNl
X29uZShucCwgaW5kZXgsICZzdXBfYXJncykgPyBOVUxMIDogc3VwX2FyZ3MubnA7Cj4gPiAgfQo+
ID4KPiA+ICtzdGF0aWMgc3RydWN0IGRldmljZV9ub2RlICpwYXJzZV9pbnRlcnJ1cHRfbWFwKHN0
cnVjdCBkZXZpY2Vfbm9kZSAqbnAsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBjb25zdCBjaGFyICpwcm9wX25hbWUsIGludCBpbmRleCkKPiA+ICt7Cj4g
PiArICAgICBjb25zdCBfX2JlMzIgKmltYXAsICppbWFwX2VuZCwgKmFkZHI7Cj4gPiArICAgICBz
dHJ1Y3Qgb2ZfcGhhbmRsZV9hcmdzIHN1cF9hcmdzOwo+ID4gKyAgICAgc3RydWN0IGRldmljZV9u
b2RlICp0biwgKmlwYXI7Cj4gPiArICAgICB1MzIgYWRkcmNlbGxzLCBpbnRjZWxsczsKPiA+ICsg
ICAgIGludCBpLCBqLCBpbWFwbGVuOwo+ID4gKwo+ID4gKyAgICAgaWYgKCFJU19FTkFCTEVEKENP
TkZJR19PRl9JUlEpKQo+ID4gKyAgICAgICAgICAgICByZXR1cm4gTlVMTDsKPiA+ICsKPiA+ICsg
ICAgIGlmIChzdHJjbXAocHJvcF9uYW1lLCAiaW50ZXJydXB0LW1hcCIpKQo+ID4gKyAgICAgICAg
ICAgICByZXR1cm4gTlVMTDsKPiA+ICsKPiA+ICsgICAgIGlwYXIgPSBvZl9ub2RlX2dldChucCk7
Cj4gPiArICAgICBkbyB7Cj4gPiArICAgICAgICAgICAgIGlmICghb2ZfcHJvcGVydHlfcmVhZF91
MzIoaXBhciwgIiNpbnRlcnJ1cHQtY2VsbHMiLCAmaW50Y2VsbHMpKQo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgIGJyZWFrOwo+ID4gKyAgICAgICAgICAgICB0biA9IGlwYXI7Cj4gPiArICAgICAg
ICAgICAgIGlwYXIgPSBvZl9pcnFfZmluZF9wYXJlbnQoaXBhcik7Cj4gPiArICAgICAgICAgICAg
IG9mX25vZGVfcHV0KHRuKTsKPiA+ICsgICAgIH0gd2hpbGUgKGlwYXIpOwo+Cj4gTm8gbmVlZCBm
b3IgdGhpcyBsb29wLiBXZSd2ZSBvbmx5IGdvdHRlbiBoZXJlIGlmICdpbnRlcnJ1cHQtbWFwJyBp
cwo+IHByZXNlbnQgaW4gdGhlIG5vZGUgYW5kICcjaW50ZXJydXB0LWNlbGxzJyBpcyByZXF1aXJl
ZCBpZgo+ICdpbnRlcnJ1cHQtbWFwJyBpcyBwcmVzZW50LgoKQWhoLCBva2F5LiBJIHdpbGwgdXBk
YXRlLgoKPgo+ID4gKyAgICAgaWYgKCFpcGFyKQo+ID4gKyAgICAgICAgICAgICByZXR1cm4gTlVM
TDsKPiA+ICsgICAgIGFkZHJjZWxscyA9IG9mX2J1c19uX2FkZHJfY2VsbHMoaXBhcik7Cj4gPiAr
ICAgICBvZl9ub2RlX3B1dChpcGFyKTsKPiA+ICsKPiA+ICsgICAgIGltYXAgPSBvZl9nZXRfcHJv
cGVydHkobnAsICJpbnRlcnJ1cHQtbWFwIiwgJmltYXBsZW4pOwo+ID4gKyAgICAgaWYgKCFpbWFw
IHx8IGltYXBsZW4gPD0gKGFkZHJjZWxscyArIGludGNlbGxzKSkKPiA+ICsgICAgICAgICAgICAg
cmV0dXJuIE5VTEw7Cj4gPiArICAgICBpbWFwX2VuZCA9IGltYXAgKyBpbWFwbGVuOwo+ID4gKwo+
ID4gKyAgICAgc3VwX2FyZ3MubnAgPSBOVUxMOwo+ID4gKyAgICAgZm9yIChpID0gMDsgaSA8PSBp
bmRleCAmJiBpbWFwIDwgaW1hcF9lbmQ7IGkrKykgewo+ID4gKyAgICAgICAgICAgICBpZiAoc3Vw
X2FyZ3MubnApIHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICBvZl9ub2RlX3B1dChzdXBfYXJn
cy5ucCk7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgc3VwX2FyZ3MubnAgPSBOVUxMOwo+ID4g
KyAgICAgICAgICAgICB9Cj4gPiArCj4gPiArICAgICAgICAgICAgIGFkZHIgPSBpbWFwOwo+ID4g
KyAgICAgICAgICAgICBpbWFwICs9IGFkZHJjZWxsczsKPiA+ICsKPiA+ICsgICAgICAgICAgICAg
c3VwX2FyZ3MubnAgPSBucDsKPiA+ICsgICAgICAgICAgICAgc3VwX2FyZ3MuYXJnc19jb3VudCA9
IGludGNlbGxzOwo+ID4gKyAgICAgICAgICAgICBmb3IgKGogPSAwOyBqIDwgaW50Y2VsbHM7IGor
KykKPiA+ICsgICAgICAgICAgICAgICAgICAgICBzdXBfYXJncy5hcmdzW2pdID0gYmUzMl90b19j
cHUoaW1hcFtqXSk7Cj4gPiArICAgICAgICAgICAgIGltYXAgKz0gaW50Y2VsbHM7Cj4gPiArCj4g
PiArICAgICAgICAgICAgIGlmIChvZl9pcnFfcGFyc2VfcmF3KGFkZHIsICZzdXBfYXJncykpCj4g
PiArICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIE5VTEw7Cj4gPiArICAgICAgICAgICAgIGlt
YXAgKz0gc3VwX2FyZ3MuYXJnc19jb3VudCArIDE7Cj4gPiArICAgICB9Cj4KPiBEb2Vzbid0IHRo
aXMgbGVhayBhIHJlZiBvbiB0aGUgbGFzdCB0aW1lIHRoZSBmdW5jdGlvbiBpcyBpbnZva2VkPyBG
b3IKPiBleGFtcGxlLCBpZiB3ZSBoYXZlIDIgZW50cmllcyBhbmQgaW5kZXggaXMgMi4gV2UnbGwg
Z2V0IGluZGV4PTEsIGJ1dAo+IHRoZW4gZXhpdCBiZWNhdXNlIGltYXA9PWltYXBfZW5kLiBXZSBu
ZWVkIGEgcHV0IG9uIGluZGV4PT0xIG5vZGUuCgpPa2F5LCBJIHdpbGwgdXBkYXRlLgoKPgo+IExv
b2sgYXQgbXkgbmV4dCBicmFuY2ggd2hlcmUgSSd2ZSBjb252ZXJ0ZWQgdGhpbmdzIHRvIHVzZSBf
X2ZyZWUoKQo+IGNsZWFudXBzLiBJIGRvbid0IHNlZSBpdCBoZWxwaW5nIGhlcmUgYXMtaXMsIGJ1
dCBtYXliZSB3aGVuIGl0IGlzCj4gY29ycmVjdC4KPgoKT2theSwgSSB3aWxsIGNoZWNrIHlvdXIg
bmV4dCBicmFuY2guCgpUaGFua3MsCkFudXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
