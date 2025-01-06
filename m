Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C86B9E77188
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jan 2025 16:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a9GNIenMlvLR82casNOI4TPMwGgo8QOPQOQZa+JqVBE=; b=wsTY5mGQHYbMWm
	SQdQ6A/LlgFa2ECvAmG3V0kGwQaqmVuZ/n2WPRjTY3+Osy/WxWy++vJq6UudKPOXV5A4fJomFIWZa
	RFvH+X/Kbu83RhfjWdo3g4XE57MvB93+L3NPTDwtZA/zFYDEz0gojGpE8cTjD3+OFQ1OXYSoy8MHL
	9a5oMPGByGXvx/mlHb0Y4hcf+iM0DoQoDKfLEKmD9xM+t5/zkX/aOzURA+LvNHP9W8iypZijehgCS
	5QHngs+3cl28U93MLO+JtZAVSoVhyzNh3gXIKFqsuX7QTHGuLt+aIuOdYqvDDz1WjBUvBSY/SH0uO
	RAF3PlHs9eb3lFU5SUFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUptF-00000001wbg-0YYO;
	Mon, 06 Jan 2025 16:23:41 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUpsd-00000001wLQ-41Ws
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jan 2025 16:23:05 +0000
Received: by mail-io1-xd2f.google.com with SMTP id ca18e2360f4ac-844cd85f5ebso1209729239f.3
        for <linux-riscv@lists.infradead.org>; Mon, 06 Jan 2025 08:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1736180582; x=1736785382; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3vZ1mAj+fUixoLNPdD1UMSMopVH9CdJ/UEFautW9bp8=;
        b=G6dVu0W4gMw20IuVAy3F58KDRbzfNmRRgDRuSdxPze51frpziqEeVk4sI6ITLw2sQ9
         IRtXdj+IhcIRCmk+v0m8y8sKx8Qr7r1n4uCtO0BYrm8legKe41Q68kTe15HMDIuz3uCs
         2XihO/Yp1/+lQwIhW03X9QM10/FVwBwf1gT9aMwWzzroN75+RMI4jtXR+O2m3NRm4trI
         oNIR1ghdPqWIqC6Og5li0TU0C0lmeCW8hKNOsaGH2vdxfSQ4Xso11O0+0vFWJNR/Dxw3
         Jjm0gFBxwAnP6FJsu0OBnXcb1SIwmMtQz30stytih9vYsO8AnQUyJllnBpArYApG+z2P
         hCyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736180582; x=1736785382;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3vZ1mAj+fUixoLNPdD1UMSMopVH9CdJ/UEFautW9bp8=;
        b=f7ISLKAXg/jgvCszW3jEI3/qiMvPVRx4S63ABMg4q/xSoHBdk0z/bDjMegfMfIoYGY
         X2NC9o82F6MmeI448M55KmRpSOaF80ZjfxajsmMSdxzi83iumtyjNtqqpjC687glfsoX
         7k1BD66V50NCiscX9JddqIRmRFFUEO+aPPFd034Ji0J6VBGXQPGHLGWdRhE2q62ekGkf
         bfaV35+RTMhiLnteKSnujP7XSD9EyQR3yTOEsYd81rjafJcyIESKxNQBLtkTDd3qh+DO
         kgIisInpLpo5vbjocGntsA2G1jWDKAj7JmR4Tm1DoJ2VQx5qCyAJCKwAMtMRkA/QQNgv
         I2YQ==
X-Forwarded-Encrypted: i=1; AJvYcCVu3vwFlsfMIotVSLUKUurtxutcStYZ7RNvf5gY8hn0iCbUnOwS8fwiZnOVVv0QkaC40OSZz54PP6zfVw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywloo1huMJvZkQfmlRn+xyaJmtUl5uglbRlS2KCzIcKHFmbd3rW
	Is+2PNba0Q0TYZO7JeNOHW7nioBGqwQ8hcFSA6RZS2jYi2vVajI0d1k3IRl+diyQa4TthwmyrvE
	lgVH+pCfKwAKMjkY1BEBk7Mne6Air4UWljawPRg==
X-Gm-Gg: ASbGnctQDkckPAPsu4HpNz7kUgj9gDPNipRDoqeqthhIg6e616j75umaBQyxxHjUyPh
	rmHpdtg49qJnvahr79OtDss27Qdmiboy3gziUt3SK
X-Google-Smtp-Source: AGHT+IGy0yRDFwJcm6+9NikM+UOmYtt5anUTB6UK8NzyUujulmVKinsVXCTLTZJ4pD/alOA5VQZD3OiwXi0bcH4Bltc=
X-Received: by 2002:a05:6e02:3891:b0:3a7:dfe4:bd33 with SMTP id
 e9e14a558f8ab-3c2d2561dacmr580677935ab.6.1736180582183; Mon, 06 Jan 2025
 08:23:02 -0800 (PST)
MIME-Version: 1.0
References: <CAAhSdy3RaJEnUJEB+W+7iTJ46c8r8vWUh5HBNe5utpxFv-zr0Q@mail.gmail.com>
 <20250105083922.3563784-1-vladimir.kondratiev@mobileye.com>
In-Reply-To: <20250105083922.3563784-1-vladimir.kondratiev@mobileye.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 6 Jan 2025 21:52:51 +0530
X-Gm-Features: AbW1kvYGwn2G2T8aRzIN13es1mKGhCxMEWRgdApFA36NWYEomEe5wPepqFFtS8I
Message-ID: <CAAhSdy0U3VXqKK-pReUSo5PYJhr0YGoO6pT194Me0Q18dHbE9g@mail.gmail.com>
Subject: Re: [PATCH v2] irqchip/riscv-aplic: add support for hart indexes
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_082304_260784_91502D44 
X-CRM114-Status: GOOD (  26.98  )
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

T24gU3VuLCBKYW4gNSwgMjAyNSBhdCAyOjA54oCvUE0gVmxhZGltaXIgS29uZHJhdGlldgo8dmxh
ZGltaXIua29uZHJhdGlldkBtb2JpbGV5ZS5jb20+IHdyb3RlOgo+Cj4gUmlzYy1WIEFQTElDIHNw
ZWNpZmljYXRpb24gZGVmaW5lcyAiaGFydCBpbmRleCIgaW4gWzFdOgo+Cj4gV2l0aGluIGEgZ2l2
ZW4gaW50ZXJydXB0IGRvbWFpbiwgZWFjaCBvZiB0aGUgZG9tYWlu4oCZcyBoYXJ0cyBoYXMgYQo+
IHVuaXF1ZSBpbmRleCBudW1iZXIgaW4gdGhlIHJhbmdlIDAgdG8gMl4xNCDiiJIgMSAoPSAxNiwz
ODMpLiBUaGUgaW5kZXgKPiBudW1iZXIgYSBkb21haW4gYXNzb2NpYXRlcyB3aXRoIGEgaGFydCBt
YXkgb3IgbWF5IG5vdCBoYXZlIGFueQo+IHJlbGF0aW9uc2hpcCB0byB0aGUgdW5pcXVlIGhhcnQg
aWRlbnRpZmllciAo4oCcaGFydCBJROKAnSkgdGhhdCB0aGUKPiBSSVNDLVYgUHJpdmlsZWdlZCBB
cmNoaXRlY3R1cmUgYXNzaWducyB0byB0aGUgaGFydC4gVHdvIGRpZmZlcmVudAo+IGludGVycnVw
dCBkb21haW5zIG1heSBlbXBsb3kgZW50aXJlbHkgZGlmZmVyZW50IGluZGV4IG51bWJlcnMgZm9y
Cj4gdGhlIHNhbWUgc2V0IG9mIGhhcnRzLgo+Cj4gRnVydGhlciwgdGhpcyBkb2N1bWVudCBzYXlz
IGluICI0LjUgTWVtb3J5LW1hcHBlZCBjb250cm9sCj4gcmVnaW9uIGZvciBhbiBpbnRlcnJ1cHQg
ZG9tYWluIjoKPgo+IFRoZSBhcnJheSBvZiBJREMgc3RydWN0dXJlcyBtYXkgaW5jbHVkZSBzb21l
IGZvciBwb3RlbnRpYWwgaGFydCBpbmRleAo+IG51bWJlcnMgdGhhdCBhcmUgbm90IGFjdHVhbCBo
YXJ0IGluZGV4IG51bWJlcnMgaW4gdGhlIGRvbWFpbi4gRm9yCj4gZXhhbXBsZSwgdGhlIGZpcnN0
IElEQyBzdHJ1Y3R1cmUgaXMgYWx3YXlzIGZvciBoYXJ0IGluZGV4IDAsIGJ1dCAwIGlzCj4gbm90
IG5lY2Vzc2FyaWx5IGEgdmFsaWQgaW5kZXggbnVtYmVyIGZvciBhbnkgaGFydCBpbiB0aGUgZG9t
YWluLgo+Cj4gU3VwcG9ydCBhcmJpdHJhcnkgaGFydCBpbmRleGVzIHNwZWNpZmllZCBpbiBvcHRp
b25hbCBBUExJQyBwcm9wZXJ0eQo+ICJyaXNjdixoYXJ0LWluZGV4IiB0aGF0IHNob3VsZCBiZSBh
cnJheSBvZiB1MzIgZWxlbWVudHMsIG9uZSBwZXIKCkkgaGFkIGNvbW1lbnRlZCBvbiB2MSB0aGF0
IGl0J3MgYmV0dGVyIHRvIHJlbmFtZSB0aGlzIHByb3BlcnR5IHRvCiJyaXNjdixoYXJ0LWluZGV4
ZXMiIChwbHVyYWwpLgoKPiBpbnRlcnJ1cHQgdGFyZ2V0LiBJZiB0aGlzIHByb3BlcnR5IG5vdCBz
cGVjaWZpZWQsIGZhbGxiYWNrIGlzIHRvIHVzZQo+IGxvZ2ljYWwgaGFydCBpbmRleGVzIHdpdGhp
biB0aGUgZG9tYWluLgo+Cj4gWzFdOiBodHRwczovL2dpdGh1Yi5jb20vcmlzY3YvcmlzY3YtYWlh
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBWbGFkaW1pciBLb25kcmF0aWV2IDx2bGFkaW1pci5rb25kcmF0
aWV2QG1vYmlsZXllLmNvbT4KCk90aGVyd2lzZSwgdGhpcyBsb29rcyBnb29kIHRvIG1lLgoKUmV2
aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+Cgo+IC0tLQo+ICBkcml2
ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWFwbGljLWRpcmVjdC5jIHwgMjUgKysrKysrKysrKysrKysr
KysrKysrLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9u
cygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtYXBsaWMtZGly
ZWN0LmMgYi9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWFwbGljLWRpcmVjdC5jCj4gaW5kZXgg
N2NkNmI2NDY3NzRiLi5jODBhNjVjMTczMmEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9pcnFjaGlw
L2lycS1yaXNjdi1hcGxpYy1kaXJlY3QuYwo+ICsrKyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlz
Y3YtYXBsaWMtZGlyZWN0LmMKPiBAQCAtMzEsNyArMzEsNyBAQCBzdHJ1Y3QgYXBsaWNfZGlyZWN0
IHsKPiAgfTsKPgo+ICBzdHJ1Y3QgYXBsaWNfaWRjIHsKPiAtICAgICAgIHVuc2lnbmVkIGludCAg
ICAgICAgICAgIGhhcnRfaW5kZXg7Cj4gKyAgICAgICB1MzIgICAgICAgICAgICAgICAgICAgICBo
YXJ0X2luZGV4Owo+ICAgICAgICAgdm9pZCBfX2lvbWVtICAgICAgICAgICAgKnJlZ3M7Cj4gICAg
ICAgICBzdHJ1Y3QgYXBsaWNfZGlyZWN0ICAgICAqZGlyZWN0Owo+ICB9Owo+IEBAIC0yMTksNiAr
MjE5LDIxIEBAIHN0YXRpYyBpbnQgYXBsaWNfZGlyZWN0X3BhcnNlX3BhcmVudF9od2lycShzdHJ1
Y3QgZGV2aWNlICpkZXYsIHUzMiBpbmRleCwKPiAgICAgICAgIHJldHVybiAwOwo+ICB9Cj4KPiAr
c3RhdGljIGludCBhcGxpY19kaXJlY3RfZ2V0X2hhcnRfaW5kZXgoc3RydWN0IGRldmljZSAqZGV2
LCB1MzIgbG9naWNhbF9pbmRleCwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB1MzIgKmhhcnRfaW5kZXgpCj4gK3sKPiArICAgICAgIHN0YXRpYyBjb25zdCBjaGFyICpw
cm9wX2hhcnRfaW5kZXggPSAicmlzY3YsaGFydC1pbmRleCI7Cj4gKyAgICAgICBzdHJ1Y3QgZGV2
aWNlX25vZGUgKm5wID0gdG9fb2Zfbm9kZShkZXYtPmZ3bm9kZSk7Cj4gKwo+ICsgICAgICAgaWYg
KCFucCB8fCAhb2ZfcHJvcGVydHlfcHJlc2VudChucCwgcHJvcF9oYXJ0X2luZGV4KSkgewo+ICsg
ICAgICAgICAgICAgICAqaGFydF9pbmRleCA9IGxvZ2ljYWxfaW5kZXg7Cj4gKyAgICAgICAgICAg
ICAgIHJldHVybiAwOwo+ICsgICAgICAgfQo+ICsKPiArICAgICAgIHJldHVybiBvZl9wcm9wZXJ0
eV9yZWFkX3UzMl9pbmRleChucCwgcHJvcF9oYXJ0X2luZGV4LAo+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGxvZ2ljYWxfaW5kZXgsIGhhcnRfaW5kZXgpOwo+ICt9
Cj4gKwo+ICBpbnQgYXBsaWNfZGlyZWN0X3NldHVwKHN0cnVjdCBkZXZpY2UgKmRldiwgdm9pZCBf
X2lvbWVtICpyZWdzKQo+ICB7Cj4gICAgICAgICBpbnQgaSwgaiwgcmMsIGNwdSwgY3VycmVudF9j
cHUsIHNldHVwX2NvdW50ID0gMDsKPiBAQCAtMjY1LDggKzI4MCwxMiBAQCBpbnQgYXBsaWNfZGly
ZWN0X3NldHVwKHN0cnVjdCBkZXZpY2UgKmRldiwgdm9pZCBfX2lvbWVtICpyZWdzKQo+ICAgICAg
ICAgICAgICAgICBjcHVtYXNrX3NldF9jcHUoY3B1LCAmZGlyZWN0LT5sbWFzayk7Cj4KPiAgICAg
ICAgICAgICAgICAgaWRjID0gcGVyX2NwdV9wdHIoJmFwbGljX2lkY3MsIGNwdSk7Cj4gLSAgICAg
ICAgICAgICAgIGlkYy0+aGFydF9pbmRleCA9IGk7Cj4gLSAgICAgICAgICAgICAgIGlkYy0+cmVn
cyA9IHByaXYtPnJlZ3MgKyBBUExJQ19JRENfQkFTRSArIGkgKiBBUExJQ19JRENfU0laRTsKPiAr
ICAgICAgICAgICAgICAgcmMgPSBhcGxpY19kaXJlY3RfZ2V0X2hhcnRfaW5kZXgoZGV2LCBpLCAm
aWRjLT5oYXJ0X2luZGV4KTsKPiArICAgICAgICAgICAgICAgaWYgKHJjKSB7Cj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgZGV2X3dhcm4oZGV2LCAiaGFydCBpbmRleCBub3QgZm91bmQgZm9yIElE
QyVkXG4iLCBpKTsKPiArICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPiArICAgICAg
ICAgICAgICAgfQo+ICsgICAgICAgICAgICAgICBpZGMtPnJlZ3MgPSBwcml2LT5yZWdzICsgQVBM
SUNfSURDX0JBU0UgKyBpZGMtPmhhcnRfaW5kZXggKiBBUExJQ19JRENfU0laRTsKPiAgICAgICAg
ICAgICAgICAgaWRjLT5kaXJlY3QgPSBkaXJlY3Q7Cj4KPiAgICAgICAgICAgICAgICAgYXBsaWNf
aWRjX3NldF9kZWxpdmVyeShpZGMsIHRydWUpOwo+IC0tCj4gMi40My4wCj4KClJlZ2FyZHMsCkFu
dXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
