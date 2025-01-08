Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72E8CE77199
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jan 2025 13:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dtSA/eS36dtTxnI9Bk6KAuA/Tt3YiXX4ZxRNwR5Wu00=; b=wGllkjk66NlW31
	QG7cfplJzxqeZW+vHPB/sWlFEzKHmxrKmyA00C581pRhX3QTvlI3oMW/BwXet7R7qQdlN70aQAhK9
	N2SxCpNtejXfPWllyP5Ilq92qNUlZtko8p9d1rCnTgBEEGQx4TswAMxLVa4Lude4buHlQVKFk6Yl7
	EmEAlGUnlIb1D4K+RzPAqtcUOdPcz/K+sbzsSWC2A22wX8IDTC1HW6CKt+AgO0FaRrRnnNQ3x181l
	Be3v5CVmt2Wtz/obhwvhTol9w6BZXqYrmifSr0m6NdDvs/HJ/GaJeUCQBXIWgIIo0AWH/L2V2iDzF
	1Di33Rs4hsKfC32ZqeTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVVoU-00000008YNt-0vIM;
	Wed, 08 Jan 2025 13:09:34 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVV9V-00000008QNf-3jNS
	for linux-riscv@lists.infradead.org;
	Wed, 08 Jan 2025 12:27:15 +0000
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-3a8160382d4so52032085ab.0
        for <linux-riscv@lists.infradead.org>; Wed, 08 Jan 2025 04:27:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1736339233; x=1736944033; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yoSuYzfo8AehT5ufmZN9KZ1KjJSRQbYzJPXh4mLNtxI=;
        b=Lhhu0B8ydScETT6VkJNcpxUpFjA7ZwFg9raHJ9VTd7PAo0ZON7+j9gFHAIthcZiPUJ
         0FI/l9RjJpmxOiDYg7vn8SCNZIFoph4Y4f5ncI4KRLMYOBhDFedAzjnAJ4dKxb5UMxOs
         IiM/mshMQmANLYbEeSoMCxv9aeFSQa10Ro2cWeKBuwRDvMkfIbg+4hNzgDeFksbIuc41
         AUg8OP4mvIgXhRyGRWIvQ97+whf0kOGd76WZaAmYMod2RiiK4OCq50d24BJqAbXhoEoO
         HYIwblpTDx8rLa6Xed+0/fy4tC425YrGADrsboSeGHFBJm/mMbYmV1AAIw+VU9NTJhU+
         1Jjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736339233; x=1736944033;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yoSuYzfo8AehT5ufmZN9KZ1KjJSRQbYzJPXh4mLNtxI=;
        b=JBTk54/9YMXbHZzTeRmLveV9rM8/T6gsF0i+dganTCbCWs5a4wmJLd8AQF3nmU2sTl
         BVwtgAkxiC+jnaSHPZ1ZGjKJFm6jH1rZHggY0Aju/ve6jK+prI669qCtnIijx4rplVE9
         6+WheQuW0dyrbqbqs9lB5QAzxOcFGTdXOb5YmJ/tZXPJthBGnGJrAAx36dprRcTxYzhP
         aboqPHGtd/W1W7lF9bKSIC37Qw26zDnh19aD3BZb9wa20TKkchr+Kc4FjjSn1lxiMWty
         Fp4cwJv6lqc8hGkgBFmX898d3/rJKAKx83TTh/aFSt4LFLIa4dR4o77wCVSpK7UET4XN
         U0Rw==
X-Forwarded-Encrypted: i=1; AJvYcCX0cuLRGimrel2JFXzXxHYWNSqgiKgkJVTdmuIPrJN3Amd9yyU4Ra8OwDlDLUcPd3Yx6ZSVPlg71mXoiQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywi/XpG8eR2HOlcccK/W2sqmjxNfoIMfmYU30rpEtxv/F4BirpK
	ZfBL19Zw4Q7KtTmQUDKialv59B1tcEs3HCunILq1p4IW2u5DU3AZmvVwTxmWikf6kHlD70Wwg3C
	M/bIV+M5aR5A4x6BBn3bRMr6yqhn7Fpxht8oD+w==
X-Gm-Gg: ASbGncutYz9vvDEXzCOBGp6Hzj0oNat12ht19rDcH2WYcddy1JtDGAF0mAw8gvGGvO8
	+BsbPZB7yPyD0ltB+kGaNt8xKkrdDwdnz2bTEK3E=
X-Google-Smtp-Source: AGHT+IEPzqZvgXNlPNFfPfdPCDHQQH7KsNuIwJP5APjhwXegdAHCCQ5pDZcyaR2ieeNk+oBKml3XYbCzkfXvO8Ab+3I=
X-Received: by 2002:a05:6e02:1fcb:b0:3ab:a274:d68 with SMTP id
 e9e14a558f8ab-3ce3a9b59b3mr19175785ab.8.1736339232819; Wed, 08 Jan 2025
 04:27:12 -0800 (PST)
MIME-Version: 1.0
References: <CAAhSdy0U3VXqKK-pReUSo5PYJhr0YGoO6pT194Me0Q18dHbE9g@mail.gmail.com>
 <20250107075835.1421602-1-vladimir.kondratiev@mobileye.com> <20250107075835.1421602-3-vladimir.kondratiev@mobileye.com>
In-Reply-To: <20250107075835.1421602-3-vladimir.kondratiev@mobileye.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 8 Jan 2025 17:57:02 +0530
X-Gm-Features: AbW1kvbOOJb2V54TT6u-5xIYSlgwbbObLC5CruSAui85TlGmljFZ23idnBgXAQY
Message-ID: <CAAhSdy0qA9ztMTX4Zm4CM-9pOsw0a-9=gTPKFWL5QntFbr8C5g@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] irqchip/riscv-aplic: add support for hart indexes
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Cc: aou@eecs.berkeley.edu, conor+dt@kernel.org, krzk+dt@kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, robh@kernel.org, 
	tglx@linutronix.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_042713_927260_A7ABCA03 
X-CRM114-Status: GOOD (  25.24  )
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

T24gVHVlLCBKYW4gNywgMjAyNSBhdCAxOjI54oCvUE0gVmxhZGltaXIgS29uZHJhdGlldgo8dmxh
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
b25hbCBBUExJQyBwcm9wZXJ0eQo+ICJyaXNjdixoYXJ0LWluZGV4ZXMiIHRoYXQgc2hvdWxkIGJl
IGFycmF5IG9mIHUzMiBlbGVtZW50cywgb25lIHBlcgo+IGludGVycnVwdCB0YXJnZXQuIElmIHRo
aXMgcHJvcGVydHkgbm90IHNwZWNpZmllZCwgZmFsbGJhY2sgaXMgdG8gdXNlCj4gbG9naWNhbCBo
YXJ0IGluZGV4ZXMgd2l0aGluIHRoZSBkb21haW4uCj4KPiBbMV06IGh0dHBzOi8vZ2l0aHViLmNv
bS9yaXNjdi9yaXNjdi1haWEKPgo+IFNpZ25lZC1vZmYtYnk6IFZsYWRpbWlyIEtvbmRyYXRpZXYg
PHZsYWRpbWlyLmtvbmRyYXRpZXZAbW9iaWxleWUuY29tPgoKUGxlYXNlIGluY2x1ZGUgdGhlIFJl
dmlld2VkLWJ5IHRhZ3Mgb2J0YWluZWQgb24gcHJldmlvdXMgcGF0Y2ggcmV2aXNpb25zLgoKSW4g
YW55IGNhc2UsIHRoaXMgc3RpbGwgbG9va3MgdG8gbWUuCgpSZXZpZXdlZC1ieTogQW51cCBQYXRl
bCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClJlZ2FyZHMsCkFudXAKCj4gLS0tCj4gIGRyaXZlcnMv
aXJxY2hpcC9pcnEtcmlzY3YtYXBsaWMtZGlyZWN0LmMgfCAyNSArKysrKysrKysrKysrKysrKysr
KystLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0p
Cj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1hcGxpYy1kaXJlY3Qu
YyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtYXBsaWMtZGlyZWN0LmMKPiBpbmRleCA3Y2Q2
YjY0Njc3NGIuLmVhNjEzMjlkZWNiMiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2lycWNoaXAvaXJx
LXJpc2N2LWFwbGljLWRpcmVjdC5jCj4gKysrIGIvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1h
cGxpYy1kaXJlY3QuYwo+IEBAIC0zMSw3ICszMSw3IEBAIHN0cnVjdCBhcGxpY19kaXJlY3Qgewo+
ICB9Owo+Cj4gIHN0cnVjdCBhcGxpY19pZGMgewo+IC0gICAgICAgdW5zaWduZWQgaW50ICAgICAg
ICAgICAgaGFydF9pbmRleDsKPiArICAgICAgIHUzMiAgICAgICAgICAgICAgICAgICAgIGhhcnRf
aW5kZXg7Cj4gICAgICAgICB2b2lkIF9faW9tZW0gICAgICAgICAgICAqcmVnczsKPiAgICAgICAg
IHN0cnVjdCBhcGxpY19kaXJlY3QgICAgICpkaXJlY3Q7Cj4gIH07Cj4gQEAgLTIxOSw2ICsyMTks
MjEgQEAgc3RhdGljIGludCBhcGxpY19kaXJlY3RfcGFyc2VfcGFyZW50X2h3aXJxKHN0cnVjdCBk
ZXZpY2UgKmRldiwgdTMyIGluZGV4LAo+ICAgICAgICAgcmV0dXJuIDA7Cj4gIH0KPgo+ICtzdGF0
aWMgaW50IGFwbGljX2RpcmVjdF9nZXRfaGFydF9pbmRleChzdHJ1Y3QgZGV2aWNlICpkZXYsIHUz
MiBsb2dpY2FsX2luZGV4LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHUzMiAqaGFydF9pbmRleCkKPiArewo+ICsgICAgICAgc3RhdGljIGNvbnN0IGNoYXIgKnByb3Bf
aGFydF9pbmRleCA9ICJyaXNjdixoYXJ0LWluZGV4ZXMiOwo+ICsgICAgICAgc3RydWN0IGRldmlj
ZV9ub2RlICpucCA9IHRvX29mX25vZGUoZGV2LT5md25vZGUpOwo+ICsKPiArICAgICAgIGlmICgh
bnAgfHwgIW9mX3Byb3BlcnR5X3ByZXNlbnQobnAsIHByb3BfaGFydF9pbmRleCkpIHsKPiArICAg
ICAgICAgICAgICAgKmhhcnRfaW5kZXggPSBsb2dpY2FsX2luZGV4Owo+ICsgICAgICAgICAgICAg
ICByZXR1cm4gMDsKPiArICAgICAgIH0KPiArCj4gKyAgICAgICByZXR1cm4gb2ZfcHJvcGVydHlf
cmVhZF91MzJfaW5kZXgobnAsIHByb3BfaGFydF9pbmRleCwKPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBsb2dpY2FsX2luZGV4LCBoYXJ0X2luZGV4KTsKPiArfQo+
ICsKPiAgaW50IGFwbGljX2RpcmVjdF9zZXR1cChzdHJ1Y3QgZGV2aWNlICpkZXYsIHZvaWQgX19p
b21lbSAqcmVncykKPiAgewo+ICAgICAgICAgaW50IGksIGosIHJjLCBjcHUsIGN1cnJlbnRfY3B1
LCBzZXR1cF9jb3VudCA9IDA7Cj4gQEAgLTI2NSw4ICsyODAsMTIgQEAgaW50IGFwbGljX2RpcmVj
dF9zZXR1cChzdHJ1Y3QgZGV2aWNlICpkZXYsIHZvaWQgX19pb21lbSAqcmVncykKPiAgICAgICAg
ICAgICAgICAgY3B1bWFza19zZXRfY3B1KGNwdSwgJmRpcmVjdC0+bG1hc2spOwo+Cj4gICAgICAg
ICAgICAgICAgIGlkYyA9IHBlcl9jcHVfcHRyKCZhcGxpY19pZGNzLCBjcHUpOwo+IC0gICAgICAg
ICAgICAgICBpZGMtPmhhcnRfaW5kZXggPSBpOwo+IC0gICAgICAgICAgICAgICBpZGMtPnJlZ3Mg
PSBwcml2LT5yZWdzICsgQVBMSUNfSURDX0JBU0UgKyBpICogQVBMSUNfSURDX1NJWkU7Cj4gKyAg
ICAgICAgICAgICAgIHJjID0gYXBsaWNfZGlyZWN0X2dldF9oYXJ0X2luZGV4KGRldiwgaSwgJmlk
Yy0+aGFydF9pbmRleCk7Cj4gKyAgICAgICAgICAgICAgIGlmIChyYykgewo+ICsgICAgICAgICAg
ICAgICAgICAgICAgIGRldl93YXJuKGRldiwgImhhcnQgaW5kZXggbm90IGZvdW5kIGZvciBJREMl
ZFxuIiwgaSk7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4gKyAgICAgICAg
ICAgICAgIH0KPiArICAgICAgICAgICAgICAgaWRjLT5yZWdzID0gcHJpdi0+cmVncyArIEFQTElD
X0lEQ19CQVNFICsgaWRjLT5oYXJ0X2luZGV4ICogQVBMSUNfSURDX1NJWkU7Cj4gICAgICAgICAg
ICAgICAgIGlkYy0+ZGlyZWN0ID0gZGlyZWN0Owo+Cj4gICAgICAgICAgICAgICAgIGFwbGljX2lk
Y19zZXRfZGVsaXZlcnkoaWRjLCB0cnVlKTsKPiAtLQo+IDIuNDMuMAo+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
