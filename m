Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5CC1C25B10
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 12:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BCL6F+PmK4DrrmFGPiSlN3f/Hdhe9Eis5gZNGrapyz0=; b=keFIQi1gR4Dl81
	3S3ClgHb8HnC8wzvcFLLbviWaP5S4uKE/sJbU1XhX/uK8S3+rXh5s3O8QhhjeHJ/0fCeVYoQl0E2e
	v7Nv1hpKTuqc/SFIz18M5qQrX5mJMnddcbLC7dIq44aQhyqrSR0VyZVrMi/c60P3BcakzMkvYLi2W
	u4XOj/Jscp8qqNqyq6KwrZORbUbgBok/C0lIg1R4ArqmJ9NVq4sT3II8rjsYFIZ4C+99KDZHhyXDd
	b5cibGpMlLKxkbWjYnWZN242hj2jEAleEBxcET0BKAEycVgEwpXSXKCGXS3B+wIB//b2vX1DRnPJi
	8KuzZsw5l0O35EoOYCeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s52Za-00000001Mvo-0utQ;
	Thu, 09 May 2024 12:08:30 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s52ZM-00000001MjQ-2amC
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 12:08:25 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-36c8bdc30f7so3221615ab.1
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 05:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1715256493; x=1715861293; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N0/sHEsU5Iuak7LrbKVuAGkVdZseEUXuu3gE0C3VzY4=;
        b=ohX8sja0UK/bdtK1AVIWW541ahZBjk3y84Vsc2c4blZp5v0Y1aPIl97PXy0Tu1QTNL
         4dFNVlfbryHQVu45rfTxeEzjWQ2pcpyYUbt0R58lpr5b+4etAomW+1gFx9pR3yrxxuQR
         E1q+/mO14Ibq6s3dND9yrXWe2Qjj/KaQxAiYevuZHrAd4KEdxDZO5NqSUxd+dOVgjAeK
         KA+ylYuruc0OkNjhO/B9Tr2YzSmMJOX+Yu6YqA3jiE4KyoM5QpXU6ho2scicE/jeNu6o
         tSJMXkKByKOcUQLyyurSxSeOU2h4TEbi4gKosvYJeg65pv3FrkseWCTnVfSRznVkEE0D
         otiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715256493; x=1715861293;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N0/sHEsU5Iuak7LrbKVuAGkVdZseEUXuu3gE0C3VzY4=;
        b=DlUHiVbuQWOzs+MImo1JjYbhT6J9k/lTG7HYWj7E8aoYBMgK6ledv05iMJOOdGcpxT
         Y0bHwJ/hBUy3GPvwJyIv720CbsGgS/GPhUsAwGg8jT6o1wdAKeHxIfFNKQgOvwaclZav
         l/FxoZemioKm1a3OPVgJ68ET4YGZnRqdk0I/LX8lsZ7FwILxc7SIdXW+5Za4j3V/W0G8
         KoeAf6aFaNiK9lBz3W5MhnMsYUq/in0w6NJOcBzvTfiMhGE65FsniL/5g0J1F5ZxPWAT
         Z20pSrqcRmFjyBJNY7PFdEHSoeymlGuS9smV+AtUBueJ0KeM0i7YEb13jwd12HTYMap3
         bRVg==
X-Forwarded-Encrypted: i=1; AJvYcCUImJluHID/vqAzVjSBHLW/W5PvkpnVPlFxIJmFLUT1wBRhaqRdGfbe8+41q2gXimdMzVacDSZlF3aMgv0qYVrQugVQ7RDBjh8xhXPz1H2b
X-Gm-Message-State: AOJu0YwlI2AJrjphuQSl3af2ok8Ek19fAoEUsdpLLiSEQ2b1c2YNassd
	iGcpuWys03OcouhiLsMvlcCWT5GR2NL77qruflMjXzX5vUVQPmusC7AvBImr7Uh64CSoQEYMJt/
	RGNGdoeu6NFXfrQyQ17SmWjW6dDNAX+rCsPixAg==
X-Google-Smtp-Source: AGHT+IFxngAXt8R2TVgbhQdKQz0TYJYNPoSykwlNOk9jjQmT5XnJ91XOvqcUmMyg4SOw6a0EP4txAyNz02ST9bCGXwM=
X-Received: by 2002:a92:c242:0:b0:36c:a2c:ceaf with SMTP id
 e9e14a558f8ab-36caecc863fmr59112085ab.6.1715256492972; Thu, 09 May 2024
 05:08:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240430040822.1133339-1-apatel@ventanamicro.com> <CAGETcx8C81OAfpTVBqk1yRdcwFG5v7v0PWVF6Udg2gPK0vH9dQ@mail.gmail.com>
In-Reply-To: <CAGETcx8C81OAfpTVBqk1yRdcwFG5v7v0PWVF6Udg2gPK0vH9dQ@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 9 May 2024 17:37:59 +0530
Message-ID: <CAAhSdy0g_2xeuox3yn=dwtk8aZmozO_ctVAfubNRvQVh=C4MpA@mail.gmail.com>
Subject: Re: [PATCH v3] of: property: Add fw_devlink support for interrupt-map property
To: Saravana Kannan <saravanak@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_050817_306735_EE8FA23D 
X-CRM114-Status: GOOD (  31.88  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBNYXkgOSwgMjAyNCBhdCAyOjI14oCvQU0gU2FyYXZhbmEgS2FubmFuIDxzYXJhdmFu
YWtAZ29vZ2xlLmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIEFwciAyOSwgMjAyNCBhdCA5OjA44oCv
UE0gQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+ID4KPiA+IFNv
bWUgb2YgdGhlIFBDSSBjb250cm9sbGVycyAoc3VjaCBhcyBnZW5lcmljIFBDSSBob3N0IGNvbnRy
b2xsZXIpCj4gPiB1c2UgImludGVycnVwdC1tYXAiIERUIHByb3BlcnR5IHRvIGRlc2NyaWJlIHRo
ZSBtYXBwaW5nIGJldHdlZW4KPiA+IFBDSSBlbmRwb2ludHMgYW5kIFBDSSBpbnRlcnJ1cHQgcGlu
cy4gVGhpcyB0aGUgb25seSBjYXNlIHdoZXJlCj4gPiB0aGUgaW50ZXJydXB0cyBhcmUgbm90IGRl
c2NyaWJlZCBpbiBEVC4KPiA+Cj4gPiBDdXJyZW50bHksIHRoZXJlIGlzIG5vIGZ3X2Rldmxpbmsg
Y3JlYXRlZCBiYXNlZCBvbiAiaW50ZXJydXB0LW1hcCIKPiA+IERUIHByb3BlcnR5IHNvIGludGVy
cnVwdCBjb250cm9sbGVyIGlzIG5vdCBndWFyYW50ZWVkIHRvIGJlIHByb2JlZAo+ID4gYmVmb3Jl
IFBDSSBob3N0IGNvbnRyb2xsZXIuIFRoaXMgYWZmZWN0cyBldmVyeSBwbGF0Zm9ybSB3aGVyZSBi
b3RoCj4gPiBQQ0kgaG9zdCBjb250cm9sbGVyIGFuZCBpbnRlcnJ1cHQgY29udHJvbGxlcnMgYXJl
IHByb2JlZCBhcyByZWd1bGFyCj4gPiBwbGF0Zm9ybSBkZXZpY2VzLgo+ID4KPiA+IFRoaXMgY3Jl
YXRlcyBmd19kZXZsaW5rIGJldHdlZW4gY29uc3VtZXJzIChQQ0kgaG9zdCBjb250cm9sbGVyKSBh
bmQKPiA+IHN1cHBsaWVyIChpbnRlcnJ1cHQgY29udHJvbGxlcikgYmFzZWQgb24gImludGVycnVw
dC1tYXAiIERUIHByb3BlcnR5Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEFudXAgUGF0ZWwgPGFw
YXRlbEB2ZW50YW5hbWljcm8uY29tPgo+ID4gLS0tCj4gPiBDaGFuZ2VzIHNpbmNlIHYyOgo+ID4g
LSBObyBuZWVkIGZvciBhIGxvb3AgdG8gZmluZCAjaW50ZXJydXB0LWNlbGxzIHByb3BlcnR5IHZh
bHVlCj4gPiAtIEZpeCBub2RlIGRlLXJlZmVyZW5jZSBsZWFrIHdoZW4gaW5kZXggaXMgZ3JlYXRl
ciB0aGFuIG51bWJlcgo+ID4gICBvZiBlbnRyaWVzIGluIGludGVycnVwdC1tYXAgcHJvcGVydHkK
PiA+IENoYW5nZXMgc2luY2UgdjE6Cj4gPiAtIFVwZGF0ZWQgY29tbWl0IGRlc2NyaXB0aW9uIGJh
c2VkIG9uIFJvYidzIHN1Z2dlc3Rpb24KPiA+IC0gVXNlIG9mX2lycV9wYXJzZV9yYXcoKSBmb3Ig
cGFyc2luZyBpbnRlcnJ1cHQtbWFwIERUIHByb3BlcnR5Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL29m
L3Byb3BlcnR5LmMgfCA1MCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDUwIGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9vZi9wcm9wZXJ0eS5jIGIvZHJpdmVycy9vZi9wcm9wZXJ0eS5jCj4gPiBp
bmRleCBhNjM1OGVlOTliNzQuLjczMjZjYTA3YWRmZSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMv
b2YvcHJvcGVydHkuYwo+ID4gKysrIGIvZHJpdmVycy9vZi9wcm9wZXJ0eS5jCj4gPiBAQCAtMTMx
MSw2ICsxMzExLDU1IEBAIHN0YXRpYyBzdHJ1Y3QgZGV2aWNlX25vZGUgKnBhcnNlX2ludGVycnVw
dHMoc3RydWN0IGRldmljZV9ub2RlICpucCwKPiA+ICAgICAgICAgcmV0dXJuIG9mX2lycV9wYXJz
ZV9vbmUobnAsIGluZGV4LCAmc3VwX2FyZ3MpID8gTlVMTCA6IHN1cF9hcmdzLm5wOwo+ID4gIH0K
PiA+Cj4gPiArc3RhdGljIHN0cnVjdCBkZXZpY2Vfbm9kZSAqcGFyc2VfaW50ZXJydXB0X21hcChz
dHJ1Y3QgZGV2aWNlX25vZGUgKm5wLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBjb25zdCBjaGFyICpwcm9wX25hbWUsIGludCBpbmRleCkKPiA+ICt7
Cj4gPiArICAgICAgIGNvbnN0IF9fYmUzMiAqaW1hcCwgKmltYXBfZW5kLCAqYWRkcjsKPiA+ICsg
ICAgICAgc3RydWN0IG9mX3BoYW5kbGVfYXJncyBzdXBfYXJnczsKPiA+ICsgICAgICAgdTMyIGFk
ZHJjZWxscywgaW50Y2VsbHM7Cj4gPiArICAgICAgIGludCBpLCBpbWFwbGVuOwo+ID4gKwo+ID4g
KyAgICAgICBpZiAoIUlTX0VOQUJMRUQoQ09ORklHX09GX0lSUSkpCj4gPiArICAgICAgICAgICAg
ICAgcmV0dXJuIE5VTEw7Cj4gPiArCj4gPiArICAgICAgIGlmIChzdHJjbXAocHJvcF9uYW1lLCAi
aW50ZXJydXB0LW1hcCIpKQo+ID4gKyAgICAgICAgICAgICAgIHJldHVybiBOVUxMOwo+ID4gKwo+
ID4gKyAgICAgICBpZiAob2ZfcHJvcGVydHlfcmVhZF91MzIobnAsICIjaW50ZXJydXB0LWNlbGxz
IiwgJmludGNlbGxzKSkKPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gTlVMTDsKPiA+ICsgICAg
ICAgYWRkcmNlbGxzID0gb2ZfYnVzX25fYWRkcl9jZWxscyhucCk7Cj4gPiArCj4gPiArICAgICAg
IGltYXAgPSBvZl9nZXRfcHJvcGVydHkobnAsICJpbnRlcnJ1cHQtbWFwIiwgJmltYXBsZW4pOwo+
ID4gKyAgICAgICBpZiAoIWltYXAgfHwgaW1hcGxlbiA8PSAoYWRkcmNlbGxzICsgaW50Y2VsbHMp
KQo+ID4gKyAgICAgICAgICAgICAgIHJldHVybiBOVUxMOwo+ID4gKyAgICAgICBpbWFwX2VuZCA9
IGltYXAgKyBpbWFwbGVuOwo+ID4gKwo+ID4gKyAgICAgICBzdXBfYXJncy5ucCA9IE5VTEw7Cj4g
PiArICAgICAgIHdoaWxlIChpbWFwIDwgaW1hcF9lbmQpIHsKPiA+ICsgICAgICAgICAgICAgICBh
ZGRyID0gaW1hcDsKPiA+ICsgICAgICAgICAgICAgICBpbWFwICs9IGFkZHJjZWxsczsKPiA+ICsK
PiA+ICsgICAgICAgICAgICAgICBzdXBfYXJncy5ucCA9IG5wOwo+ID4gKyAgICAgICAgICAgICAg
IHN1cF9hcmdzLmFyZ3NfY291bnQgPSBpbnRjZWxsczsKPiA+ICsgICAgICAgICAgICAgICBmb3Ig
KGkgPSAwOyBpIDwgaW50Y2VsbHM7IGkrKykKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHN1
cF9hcmdzLmFyZ3NbaV0gPSBiZTMyX3RvX2NwdShpbWFwW2ldKTsKPiA+ICsgICAgICAgICAgICAg
ICBpbWFwICs9IGludGNlbGxzOwo+ID4gKwo+ID4gKyAgICAgICAgICAgICAgIGlmIChvZl9pcnFf
cGFyc2VfcmF3KGFkZHIsICZzdXBfYXJncykpCj4gQ2FuIHlvdSBsZWF2ZSBhIGNvbW1lbnQgYWJv
dmUgdGhpcyBjYWxsIHNheWluZyBvZl9pcnFfcGFyc2VfcmF3KCkKPiB1cGRhdGVzIHN1cF9hcmdz
Lm5wPyBJdCdzIHJlYWxseSBhIHByb2JsZW0gd2l0aCB0aGUgZnVuY3Rpb24gSU1PLCBidXQKPiBh
IGNvbW1lbnQgaGVyZSB3b3VsZCBiZSBoZWxwZnVsLgoKU3VyZSwgSSB3aWxsIGFkZCBhIGNvbW1l
bnQgYWJvdXQgdGhpcy4KCj4KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBOVUxM
Owo+ID4gKwo+ID4gKyAgICAgICAgICAgICAgIGlmICghaW5kZXgpCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICByZXR1cm4gc3VwX2FyZ3MubnA7Cj4gPiArCj4gPiArICAgICAgICAgICAgICAg
b2Zfbm9kZV9wdXQoc3VwX2FyZ3MubnApOwo+ID4gKyAgICAgICAgICAgICAgIHN1cF9hcmdzLm5w
ID0gTlVMTDsKPgo+IFdoeSBkbyB5b3UgbmVlZCB0byBzZXQgaXQgdG8gTlVMTD8gQ2FuIHdlIGp1
c3QgZGVsZXRlIHRoaXMgbGluZT8KClRoZXNlIE5VTEwgYXNzaWdubWVudHMgYXJlIHJlc2lkdWUg
ZnJvbSBwcmV2aW91cyByZXZpc2lvbi4gSSB3aWxsCnJlbW92ZSB0aGVzZSBhc3NpZ25tZW50cy4K
Cj4KPiBJZiB5b3UgdGFrZSBjYXJlIG9mIHRoZXNlIG1pbm9yIGNvbW1lbnRzLCB0aGVuCj4KPiBS
ZXZpZXdlZC1ieTogU2FyYXZhbmEgS2FubmFuIDxzYXJhdmFuYWtAZ29vZ2xlLmNvbT4KPgo+IC1T
YXJhdmFuYQo+Cj4gPiArICAgICAgICAgICAgICAgaW1hcCArPSBzdXBfYXJncy5hcmdzX2NvdW50
ICsgMTsKPiA+ICsgICAgICAgICAgICAgICBpbmRleC0tOwo+ID4gKyAgICAgICB9Cj4gPiArCj4g
PiArICAgICAgIHJldHVybiBOVUxMOwo+ID4gK30KPiA+ICsKPiA+ICBzdGF0aWMgc3RydWN0IGRl
dmljZV9ub2RlICpwYXJzZV9yZW1vdGVfZW5kcG9pbnQoc3RydWN0IGRldmljZV9ub2RlICpucCwK
PiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25z
dCBjaGFyICpwcm9wX25hbWUsCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgaW50IGluZGV4KQo+ID4gQEAgLTEzNTksNiArMTQwOCw3IEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3Qgc3VwcGxpZXJfYmluZGluZ3Mgb2Zfc3VwcGxpZXJfYmluZGluZ3NbXSA9
IHsKPiA+ICAgICAgICAgeyAucGFyc2VfcHJvcCA9IHBhcnNlX21zaV9wYXJlbnQsIH0sCj4gPiAg
ICAgICAgIHsgLnBhcnNlX3Byb3AgPSBwYXJzZV9ncGlvX2NvbXBhdCwgfSwKPiA+ICAgICAgICAg
eyAucGFyc2VfcHJvcCA9IHBhcnNlX2ludGVycnVwdHMsIH0sCj4gPiArICAgICAgIHsgLnBhcnNl
X3Byb3AgPSBwYXJzZV9pbnRlcnJ1cHRfbWFwLCB9LAo+ID4gICAgICAgICB7IC5wYXJzZV9wcm9w
ID0gcGFyc2VfcmVndWxhdG9ycywgfSwKPiA+ICAgICAgICAgeyAucGFyc2VfcHJvcCA9IHBhcnNl
X2dwaW8sIH0sCj4gPiAgICAgICAgIHsgLnBhcnNlX3Byb3AgPSBwYXJzZV9ncGlvcywgfSwKPiA+
IC0tCj4gPiAyLjM0LjEKPiA+CgpUaGFua3MsCkFudXAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
