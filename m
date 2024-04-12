Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18A93C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 13:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xHJ6rrd10EGbtTjdNSbl59Y08BXFFzFxDrFDg/F0lsw=; b=L76ZyG4s+edkjp
	nusZJs5Dr06fHXEuWwhtYpeZa/tPSF4ceY8q/DiicT0csEkAv/YsDiYgCgaiI3azcS/Vk0evxNIbL
	rSjaOp5cWcwrG3z1uGvyS0+N98gz84YUZxFIizAH+Xjy6+lHD3pN8H0A09lxZHskoj82Od9lA9E8c
	Sjz/qALrQITWGuJ/51XB7ZyUt9tjy5vHyywg06KDK78j99ohK8b7/ZNm7NoESc1mUXd0U4qnp4lMu
	CMhntW9WDaRZS1AZOzOgGRZzHz8gmvxv+iEBW0QNwe3ECCcAaNJgADjk1IgflEp/UJh3zqXti/XUn
	Lm788EMSS6Mz7OmVJgew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvHJ5-0000000HQIn-216R;
	Fri, 12 Apr 2024 13:51:07 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvHJ2-0000000HQHG-2wiY
	for linux-riscv@lists.infradead.org;
	Fri, 12 Apr 2024 13:51:06 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2d4a8bddc21so9387541fa.0
        for <linux-riscv@lists.infradead.org>; Fri, 12 Apr 2024 06:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1712929862; x=1713534662; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g6ftp8YirSnx3Hs03pwZ0/loDPXIVialAS8QDpJUQK4=;
        b=AcwnYJkDT2OxX9MpvguUfdN8CnHoWrl5PZZHHdKu4J/L9rB79/PR93xrZZE4uR7vFm
         DDGb5o7MNR0zG0W4Zhhcb21XSvYaDwKn9p0ciU1m+yhWNeyWCGpCNr4ip2CybSb+cWO+
         lYnde4wxHnb42B1DVDt8/a89KrxQ9E1/+gyMDQCpy5kQU7F49IsgM6XTF6y2xLkTjsUA
         cjNEuICggm5CWkGUd1/GDeTK2H6lv3xHgga5xNOz0+V7j++Xus1POlynZXML8Vfl2Jx8
         qAfhhYJDRjqBuQ/Uxf9tc1YjmcSMKvkN9iZL6u2pxp7mNdNTzRMGujUCwJ1/jobdBMT6
         bgNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712929862; x=1713534662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g6ftp8YirSnx3Hs03pwZ0/loDPXIVialAS8QDpJUQK4=;
        b=YZJRnrE553yTJ2iiScDLxCMy/FtdSzO+BVQJ5O7sRICJzSA8VzkN6LzbBtw1Txe8kI
         s3jg4wbkS/DOmtfgfSc+3SKKF/0SYdZPpnUGfnZ7EixdGM3epkSKtRmqXNJcIFyyT6D6
         1x/rK/9Wtk4aoEdqNSvI/L/PNJjRrDzEN+TDE/IDdDBl3qWBaTsN05nEaQY0RdUornGJ
         jmJK7Z9Q7EQp0XUwOEAgYSkjsdIBwdKnWofyNlVxFx6NN6Co3mchR7nK3LFCggCr4q+d
         +xpCCFmqZlZov+lOB43fnp4Eg7Q41zhHpzc/tr4peWjS8yEIg0/wUj+7XWZ1hTc9zTkS
         zVsA==
X-Forwarded-Encrypted: i=1; AJvYcCWsJuist+4OB5GO8cy44AbXxgA2nNyxLXvbJiJbftgSyUAFs6r/v8v170k7lYBBQr9s3JD/K6NYPO3v5u55v9Y2oUyGXKy6ncUnpslaiIap
X-Gm-Message-State: AOJu0Ywpd6KbKM5RqwsM0OLzktYcMStp/yim9O3f+azFWuqc+p29XFPM
	7wKyIdx4x8fqIN+azZegkt+3e41UbDT+QPrSo8xtv3luzAoTg1Kq/cvtWXx8f9emUMp67Zjw/2o
	OTLh3AZO8qbPiHvt7BVCZhVD+lRg3355LJXWFsQ==
X-Google-Smtp-Source: AGHT+IELmLzLoKV3AEX3BhZ0JXDV3totmY1DGPSToJQHF3khM/6jn4A/6uLdV7l7OmdjjJbUTX107xSW5Eh+Bfovt4c=
X-Received: by 2002:a05:651c:620:b0:2d9:f68a:d82c with SMTP id
 k32-20020a05651c062000b002d9f68ad82cmr1547619lje.41.1712929861426; Fri, 12
 Apr 2024 06:51:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240412112931.285507-1-apatel@ventanamicro.com> <CAL_JsqJBpN2qNgiKs_nL+JxM7qaaQkd4Gk06UNefp3gB1HQ7_w@mail.gmail.com>
In-Reply-To: <CAL_JsqJBpN2qNgiKs_nL+JxM7qaaQkd4Gk06UNefp3gB1HQ7_w@mail.gmail.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 12 Apr 2024 19:20:49 +0530
Message-ID: <CAK9=C2UMP3hAmn4-QruO90E1ZKY_nMP-yt5T6hife-9hC5H92A@mail.gmail.com>
Subject: Re: [PATCH] of: property: Add fw_devlink support for interrupt-map property
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_065104_770497_DF4F1EEA 
X-CRM114-Status: GOOD (  26.93  )
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

T24gRnJpLCBBcHIgMTIsIDIwMjQgYXQgNjowN+KAr1BNIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gT24gRnJpLCBBcHIgMTIsIDIwMjQgYXQgNjoyOeKAr0FNIEFudXAg
UGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+Cj4gPiBTb21lIG9mIHRo
ZSBQQ0kgY29udHJvbGxlcnMgKHN1Y2ggYXMgZ2VuZXJpYyBQQ0kgaG9zdCBjb250cm9sbGVyKQo+
ID4gdXNlICJpbnRlcnJ1cHQtbWFwIiBEVCBwcm9wZXJ0eSB0byBkZXNjcmliZSB0aGUgbWFwcGlu
ZyBiZXR3ZWVuCj4gPiBQQ0kgZW5kcG9pbnRzIGFuZCBQQ0kgaW50ZXJydXB0IHBpbnMuCj4KPiBJ
IHdvdWxkIGdvIGFzIGZhciBhcyBzYXlpbmcgdGhhdCdzIHRoZSBvbmx5IGNhc2UgYXMgdGhhdCdz
IHRoZSBvbmx5Cj4gY2FzZSB3aGVyZSB0aGUgaW50ZXJydXB0cyBhcmUgbm90IGRlc2NyaWJlZCBp
biBEVC4KClN1cmUsIEkgd2lsbCB1cGRhdGUgdGhlIHRleHQuCgo+Cj4gPiBDdXJyZW50bHksIHRo
ZXJlIGlzIG5vIGZ3X2RldmxpbmsgY3JlYXRlZCBiYXNlZCBvbiAiaW50ZXJydXB0LW1hcCIKPiA+
IERUIHByb3BlcnR5IHNvIGludGVycnVwdCBjb250cm9sbGVyIGlzIG5vdCBndWFyYW50ZWVkIHRv
IGJlIHByb2JlZAo+ID4gYmVmb3JlIFBDSSBob3N0IGNvbnRyb2xsZXIuIFRoaXMgbWFpbmx5IGFm
ZmVjdHMgUklTQy1WIHBsYXRmb3Jtcwo+ID4gd2hlcmUgYm90aCBQQ0kgaG9zdCBjb250cm9sbGVy
IGFuZCBpbnRlcnJ1cHQgY29udHJvbGxlcnMgYXJlIHByb2JlZAo+ID4gYXMgcmVndWxhciBwbGF0
Zm9ybSBkZXZpY2VzLgo+Cj4gVGhhdCdzICpldmVyeSogc3lzdGVtIHdpdGggUENJIHJlYWxseS4K
Ck9rYXksIEkgd2lsbCByZS13b3JkLgoKPgo+ID4gVGhpcyBjcmVhdGVzIGZ3X2RldmxpbmsgYmV0
d2VlbiBjb25zdW1lcnMgKFBDSSBob3N0IGNvbnRyb2xsZXIpIGFuZAo+ID4gc3VwcGxpZXIgKGlu
dGVycnVwdCBjb250cm9sbGVyKSBiYXNlZCBvbiAiaW50ZXJydXB0LW1hcCIgRFQgcHJvcGVydHku
Cj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5j
b20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL29mL3Byb3BlcnR5LmMgfCA1MyArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDUzIGlu
c2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9vZi9wcm9wZXJ0eS5jIGIv
ZHJpdmVycy9vZi9wcm9wZXJ0eS5jCj4gPiBpbmRleCBhNjM1OGVlOTliNzQuLmNjYmJiNjUxYTg5
YSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvb2YvcHJvcGVydHkuYwo+ID4gKysrIGIvZHJpdmVy
cy9vZi9wcm9wZXJ0eS5jCj4gPiBAQCAtMTMxMSw2ICsxMzExLDU4IEBAIHN0YXRpYyBzdHJ1Y3Qg
ZGV2aWNlX25vZGUgKnBhcnNlX2ludGVycnVwdHMoc3RydWN0IGRldmljZV9ub2RlICpucCwKPiA+
ICAgICAgICAgcmV0dXJuIG9mX2lycV9wYXJzZV9vbmUobnAsIGluZGV4LCAmc3VwX2FyZ3MpID8g
TlVMTCA6IHN1cF9hcmdzLm5wOwo+ID4gIH0KPiA+Cj4gPiArc3RhdGljIHN0cnVjdCBkZXZpY2Vf
bm9kZSAqcGFyc2VfaW50ZXJydXB0X21hcChzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wLAo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBjaGFyICpw
cm9wX25hbWUsIGludCBpbmRleCkKPiA+ICt7Cj4gPiArICAgICAgIHN0cnVjdCBkZXZpY2Vfbm9k
ZSAqdG4sICppcGFyLCAqc3VwbnAgPSBOVUxMOwo+ID4gKyAgICAgICB1MzIgYWRkcmNlbGxzLCBp
bnRjZWxscywgY2VsbHM7Cj4gPiArICAgICAgIGNvbnN0IF9fYmUzMiAqaW1hcCwgKmltYXBfZW5k
Owo+ID4gKyAgICAgICBpbnQgaSwgaW1hcGxlbjsKPiA+ICsKPiA+ICsgICAgICAgaWYgKCFJU19F
TkFCTEVEKENPTkZJR19PRl9JUlEpKQo+ID4gKyAgICAgICAgICAgICAgIHJldHVybiBOVUxMOwo+
ID4gKwo+ID4gKyAgICAgICBpZiAoc3RyY21wKHByb3BfbmFtZSwgImludGVycnVwdC1tYXAiKSkK
PiA+ICsgICAgICAgICAgICAgICByZXR1cm4gTlVMTDsKPiA+ICsKPiA+ICsgICAgICAgaXBhciA9
IG9mX25vZGVfZ2V0KG5wKTsKPiA+ICsgICAgICAgZG8gewo+ID4gKyAgICAgICAgICAgICAgIGlm
ICghb2ZfcHJvcGVydHlfcmVhZF91MzIoaXBhciwgIiNpbnRlcnJ1cHQtY2VsbHMiLCAmaW50Y2Vs
bHMpKQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gPiArICAgICAgICAgICAg
ICAgdG4gPSBpcGFyOwo+ID4gKyAgICAgICAgICAgICAgIGlwYXIgPSBvZl9pcnFfZmluZF9wYXJl
bnQoaXBhcik7Cj4gPiArICAgICAgICAgICAgICAgb2Zfbm9kZV9wdXQodG4pOwo+ID4gKyAgICAg
ICB9IHdoaWxlIChpcGFyKTsKPiA+ICsgICAgICAgaWYgKCFpcGFyKQo+ID4gKyAgICAgICAgICAg
ICAgIHJldHVybiBOVUxMOwo+ID4gKyAgICAgICBhZGRyY2VsbHMgPSBvZl9idXNfbl9hZGRyX2Nl
bGxzKGlwYXIpOwo+ID4gKyAgICAgICBvZl9ub2RlX3B1dChpcGFyKTsKPiA+ICsKPiA+ICsgICAg
ICAgaW1hcCA9IG9mX2dldF9wcm9wZXJ0eShucCwgImludGVycnVwdC1tYXAiLCAmaW1hcGxlbik7
Cj4gPiArICAgICAgIGlmICghaW1hcCB8fCBpbWFwbGVuIDw9IChhZGRyY2VsbHMgKyBpbnRjZWxs
cykpCj4gPiArICAgICAgICAgICAgICAgcmV0dXJuIE5VTEw7Cj4gPiArICAgICAgIGltYXBfZW5k
ID0gaW1hcCArIGltYXBsZW47Cj4gPiArCj4gPiArICAgICAgIGZvciAoaSA9IDA7IGkgPD0gaW5k
ZXggJiYgaW1hcCA8IGltYXBfZW5kOyBpKyspIHsKPiA+ICsgICAgICAgICAgICAgICBpZiAoc3Vw
bnApCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBvZl9ub2RlX3B1dChzdXBucCk7Cj4gPiAr
Cj4gPiArICAgICAgICAgICAgICAgaW1hcCArPSBhZGRyY2VsbHM7Cj4gPiArICAgICAgICAgICAg
ICAgaW1hcCArPSBpbnRjZWxsczsKPiA+ICsKPiA+ICsgICAgICAgICAgICAgICBzdXBucCA9IG9m
X2ZpbmRfbm9kZV9ieV9waGFuZGxlKGJlMzJfdG9fY3B1KGltYXBbMF0pKTsKPiA+ICsgICAgICAg
ICAgICAgICBpZiAoIXN1cG5wKQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIE5V
TEw7Cj4gPiArICAgICAgICAgICAgICAgaW1hcCArPSAxOwo+ID4gKwo+ID4gKyAgICAgICAgICAg
ICAgIGlmIChvZl9wcm9wZXJ0eV9yZWFkX3UzMihzdXBucCwgIiNpbnRlcnJ1cHQtY2VsbHMiLCAm
Y2VsbHMpKQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIE5VTEw7Cj4gPiArICAg
ICAgICAgICAgICAgaW1hcCArPSBjZWxsczsKPgo+IFRoaXMgaXMgd3JvbmcuIFRlY2huaWNhbGx5
LCB5b3UgY2FuIGhhdmUgI2FkZHJlc3MtY2VsbHMgdG9vLgo+Cj4gVGhlIGJpZ2dlciBwcm9ibGVt
IEkgaGF2ZSBpcyB0aGlzIGNyZWF0ZXMgMiBzZXRzIG9mICdpbnRlcnJ1cHQtbWFwJwo+IHBhcnNp
bmcgY29kZS4gWW91ciB2ZXJzaW9uIHNraXBzIGEgbG90IG9mIHRoaW5ncyBsaWtlIHdoZXRoZXIg
dGhlCj4gaW50ZXJydXB0IGNvbnRyb2xsZXIgaXMgYXZhaWxhYmxlIGFuZCB0aGVyZSdzIHRoZSBs
aXN0IG9mCj4gJ2ludGVycnVwdC1tYXAnIGFidXNlcnMgdG8gdGhpbmsgYWJvdXQuCj4KCkluIG15
IGZpcnN0IGF0dGVtcHQsIEkgd2FzIHRyeWluZyB0byBrZWVwIGl0IHNpbXBsZSBidXQgSSBndWVz
cyBJCm92ZXItc2ltcGxpZmllZCBpdC4KCkkgaGF2ZSBhbiBhbHRlcm5hdGUgYXBwcm9hY2ggdG8g
dXNlIG9mX2lycV9wYXJzZV9yYXcoKSBvdmVyCmhlcmUgKHNpbWlsYXIgdG8gb2ZfaXJxX3BhcnNl
X3BjaSgpIGluIGRyaXZlcnMvcGNpL29mLmMpLiBBcmUgeW91Cm9rYXkgd2l0aCB0aGlzIGFwcHJv
YWNoID8KClJlZ2FyZHMsCkFudXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
