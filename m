Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97B01D68BC8
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Nov 2024 15:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CDlzeMFB0hG7nFLpj2Q4ZQVW+2/vtVZZNBUo5JkGccE=; b=ZBFYJpJccBCwnj
	4XelqPG1/lN2vMNU06CEE8sJIVcFXKeDjws/X2NKA82KHStODKbDOTQrIYESbN3Z+cH6ZVjGs28bY
	osdMd1ahiWduasX+gCVlEbF7b8msTY2yCb388o0F8gLcLmbj6mBFf3w3Pn3p9CtdHaLL6n28qORN+
	ZODSVXCQENUqrziwq1UyT4ZUH3JZJIYJal7An+qXKd5zw73mTxh7OsLxBb2RH2Mky97CMmCMxVhkz
	/U6urXVS3iBsE/tafAW5pt7QZFn1KU3Sdmc2IYUU2tDh1RCHjok0W8bKMXXKeFG5a6Gh0FEzoaNiz
	/7s55g0BDu4uISgFQooA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tByUS-00000003Dgs-1YaX;
	Fri, 15 Nov 2024 15:44:08 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tByTY-00000003DUA-3hJP
	for linux-riscv@lists.infradead.org;
	Fri, 15 Nov 2024 15:43:14 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-539f8490856so854193e87.2
        for <linux-riscv@lists.infradead.org>; Fri, 15 Nov 2024 07:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1731685390; x=1732290190; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=puWIlMfcycA4zPDYvHHQRG8tUppNKYPJEXaGKwVLLjk=;
        b=lIQm3CY5IMa5SXr/dilR7O1CZniAqkF9aOCPUfAn/EQuMIIDxsq7Nq3wx5xPRgM5jB
         8EHMP+T8+Hzq6LYgAIMwFNUpSFLDDP+M4oKe1wjsSK+oeg8gYrCUsWlQ5hlbR9MwrwQq
         1akvKjhH+tBeXWTt3xXEu4E1UqECfo+tzWXJ59fpVsgOvaD2ufAL53ne5yKp8L5TwgwU
         BoOfC/gf8QfeRVQQpmk3oQ9RRZSwx/mfo751UqArunYdoOOPRJbiHx3Qho8rywBbPSyK
         h/uzRBJgxLDNgw7h8RHi7IBH5TOA5b3RLKG6FYMyduR7kfyHuN2sYRin9pGS6VsQU9W+
         aiUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731685390; x=1732290190;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=puWIlMfcycA4zPDYvHHQRG8tUppNKYPJEXaGKwVLLjk=;
        b=b6nObsy1huoXviOwY0QJy9NavJLnruRzsMZe5htQ1bkzcIyPQJ+YpmBvkUcymwj5hx
         aE1rT8pAkVkhad+XC9JOBBqf/pg3WUpHqObQqaTKkoJRRbUgY0LVBPHkTTeJlR4PHFzs
         QF7D0tK7JsL5wHJFfkmBifUTcw1eyU8tX3bBzWr1bxK3ATvIuAJkx6pPgddgBnxObEni
         n8rkeYsE3K5GAK5n7kqlK9RnpmJHZ638OMgpr3ch3qNasJmIFdml9iDQzG9L96tOPGq2
         NrHA9U+cPYoaGj0HZsb8LRceoyYZ3SbaNEdAMJ9GK2YPrG8ZRSEabC9wSiilVjNwHj3D
         ix6A==
X-Forwarded-Encrypted: i=1; AJvYcCVwRtVP4pJuNKcUV0xWMWLrhTCdv9McXYLBb8eRRV64eQTQgAdYl6Xjd/8gcqscxeVp0v3pAbmMkOJ13g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxflZtM9WI73vp9FRTekf2VeiXSUYDO2Zz/AF+9FOgNvwhJIIdJ
	TTj/WOVCeTFKSp0PAg/rHhi2gUMrTEuRDkr0PPVqlzJGcskid33ERftlDm4m8FO5GPobMR0aheV
	QvpXf6Vkvyad5QDEPxhrsfAkqGkiR+Uwkt6tetQ==
X-Google-Smtp-Source: AGHT+IGh6mrAa6jyGwF34tEwKQHXYbfcXfXM2tI9rQsPmNWrKq6I6ma5gBd835+q9M2zm5lVI5W52ISSAAlPrvmUzLc=
X-Received: by 2002:a05:6512:128d:b0:53d:a077:1d0b with SMTP id
 2adb3069b0e04-53dab3bc61cmr1714211e87.44.1731685390293; Fri, 15 Nov 2024
 07:43:10 -0800 (PST)
MIME-Version: 1.0
References: <20241114200133.3069460-1-samuel.holland@sifive.com>
In-Reply-To: <20241114200133.3069460-1-samuel.holland@sifive.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 15 Nov 2024 21:12:58 +0530
Message-ID: <CAK9=C2UyfmHqtYYK-WeSRk3=6bjs5nzDmw9ntudbCnPOYxLtXg@mail.gmail.com>
Subject: Re: [PATCH] irqchip/riscv-aplic: Fix crash when MSI domain is missing
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Albert Ou <aou@eecs.berkeley.edu>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_074312_918860_251F3FF8 
X-CRM114-Status: GOOD (  21.44  )
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

T24gRnJpLCBOb3YgMTUsIDIwMjQgYXQgMTozMeKAr0FNIFNhbXVlbCBIb2xsYW5kCjxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IElmIHRoZSBBUExJQyBkcml2ZXIgaXMgcHJv
YmVkIGJlZm9yZSB0aGUgSU1TSUMgZHJpdmVyLCB0aGUgcGFyZW50IE1TSQo+IGRvbWFpbiB3aWxs
IGJlIG1pc3NpbmcsIHdoaWNoIGNhdXNlcyBhIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSBpbgo+
IG1zaV9jcmVhdGVfZGV2aWNlX2lycV9kb21haW4oKS4gQXZvaWQgdGhpcyBieSBkZWZlcnJpbmcg
cHJvYmUgdW50aWwgdGhlCj4gcGFyZW50IE1TSSBkb21haW4gaXMgYXZhaWxhYmxlLiBVc2UgZGV2
X2Vycl9wcm9iZSgpIHRvIGF2b2lkIHByaW50aW5nIGFuCj4gZXJyb3IgbWVzc2FnZSB3aGVuIHJl
dHVybmluZyAtRVBST0JFX0RFRkVSLgoKVGhlIC1FUFJPQkVfREVGRVIgaXMgbm90IG5lZWRlZCBi
ZWNhdXNlIHdlIGV4cGVjdCB0aGF0IHBsYXRmb3JtcyB0bwp1c2UgIm1zaS1wYXJlbnQiIERUIHBy
b3BlcnR5IGluIEFQTElDIERUIG5vZGUgd2hpY2ggaW4tdHVybiBhbGxvd3MgTGludXgKREQgZnJh
bWV3b3JrIHRvIHJlLW9yZGVyIHByb2JpbmcgYmFzZWQgb24gZndfZGV2bGluayBkZXBlbmRlbmNp
ZXMuIFRoZQpBUExJQyBEVCBiaW5kaW5ncyBtYW5kYXRlcyB0aGF0IGFueSBvZiAiaW50ZXJydXB0
LWV4dGVuZGVkIiBvciAibXNpLXBhcmVudCIKRFQgcHJvcGVydGllcyBNVVNUIGJlIHByZXNlbnQu
CgpDYW4geW91IGVsYWJvcmF0ZSBhIGJpdCBtb3JlIG9uIGhvdyB5b3UgYXJlIGhpdHRpbmcgdGhp
cyBpc3N1ZSA/CgpSZWdhcmRzLApBbnVwCgo+Cj4gRml4ZXM6IGNhOGRmOTdmZTY3OSAoImlycWNo
aXAvcmlzY3YtYXBsaWM6IEFkZCBzdXBwb3J0IGZvciBNU0ktbW9kZSIpCj4gU2lnbmVkLW9mZi1i
eTogU2FtdWVsIEhvbGxhbmQgPHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+Cj4gLS0tCj4KPiAg
ZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1hcGxpYy1tYWluLmMgfCAzICsrLQo+ICBkcml2ZXJz
L2lycWNoaXAvaXJxLXJpc2N2LWFwbGljLW1zaS5jICB8IDMgKysrCj4gIDIgZmlsZXMgY2hhbmdl
ZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9pcnFjaGlwL2lycS1yaXNjdi1hcGxpYy1tYWluLmMgYi9kcml2ZXJzL2lycWNoaXAvaXJxLXJp
c2N2LWFwbGljLW1haW4uYwo+IGluZGV4IDkwMGU3MjU0MWRiOS4uOTNlN2M1MWY5NDRhIDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtYXBsaWMtbWFpbi5jCj4gKysrIGIv
ZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1hcGxpYy1tYWluLmMKPiBAQCAtMjA3LDcgKzIwNyw4
IEBAIHN0YXRpYyBpbnQgYXBsaWNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikK
PiAgICAgICAgIGVsc2UKPiAgICAgICAgICAgICAgICAgcmMgPSBhcGxpY19kaXJlY3Rfc2V0dXAo
ZGV2LCByZWdzKTsKPiAgICAgICAgIGlmIChyYykKPiAtICAgICAgICAgICAgICAgZGV2X2Vycihk
ZXYsICJmYWlsZWQgdG8gc2V0dXAgQVBMSUMgaW4gJXMgbW9kZVxuIiwgbXNpX21vZGUgPyAiTVNJ
IiA6ICJkaXJlY3QiKTsKPiArICAgICAgICAgICAgICAgZGV2X2Vycl9wcm9iZShkZXYsIHJjLCAi
ZmFpbGVkIHRvIHNldHVwIEFQTElDIGluICVzIG1vZGVcbiIsCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgbXNpX21vZGUgPyAiTVNJIiA6ICJkaXJlY3QiKTsKPgo+ICAjaWZkZWYgQ09O
RklHX0FDUEkKPiAgICAgICAgIGlmICghYWNwaV9kaXNhYmxlZCkKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9pcnFjaGlwL2lycS1yaXNjdi1hcGxpYy1tc2kuYyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEt
cmlzY3YtYXBsaWMtbXNpLmMKPiBpbmRleCA5NDViZmYyODI2NWMuLmZiOGQxODM4NjA5ZiAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWFwbGljLW1zaS5jCj4gKysrIGIv
ZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1hcGxpYy1tc2kuYwo+IEBAIC0yNjYsNiArMjY2LDkg
QEAgaW50IGFwbGljX21zaV9zZXR1cChzdHJ1Y3QgZGV2aWNlICpkZXYsIHZvaWQgX19pb21lbSAq
cmVncykKPiAgICAgICAgICAgICAgICAgICAgICAgICBpZiAobXNpX2RvbWFpbikKPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGRldl9zZXRfbXNpX2RvbWFpbihkZXYsIG1zaV9kb21h
aW4pOwo+ICAgICAgICAgICAgICAgICB9Cj4gKwo+ICsgICAgICAgICAgICAgICBpZiAoIWRldl9n
ZXRfbXNpX2RvbWFpbihkZXYpKQo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRVBS
T0JFX0RFRkVSOwo+ICAgICAgICAgfQo+Cj4gICAgICAgICBpZiAoIW1zaV9jcmVhdGVfZGV2aWNl
X2lycV9kb21haW4oZGV2LCBNU0lfREVGQVVMVF9ET01BSU4sICZhcGxpY19tc2lfdGVtcGxhdGUs
Cj4gLS0KPiAyLjQ1LjEKPgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiBsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
