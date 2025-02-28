Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8673C19776
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Feb 2025 09:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fSGH6KAyRVMr7DZIT3l61tVUjHYhOH6q/sNbubmHpqQ=; b=FVHeQ8Iu65p76M
	ZsJ5Gt+4R+A1FSgeHo9kFoAj51Ot1Sam9t+UiTvE8STo6UFk7WjRiAZM22Jq9zs6fqBbbVUffFgL2
	egC3g1/vnds2hqslTtdyUkE5Nqv8O3XABaV9h22ecK3sbPHeMtiAS/BuMJvpPwUGdysp/HcwUIl3N
	OJM3BNPmDuJNyyPxOVvPnw7yVEVERrApmVqNnNjGzJvd9Bhu2Cl1JXrvazSnJ+sxYZTQv/uZy1HtE
	fgxg5k3VWSK05yMkPsKK6MCy15akbyN/hdmeNJqfoSvkgNKzLtwAqEPtHSwIq8AXXTNc05fUXKPmY
	bpJiA7LlSav+ssEEGo2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnwPk-0000000AJBr-0Bqr;
	Fri, 28 Feb 2025 09:12:12 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnwPh-0000000AJAc-3Ddt
	for linux-riscv@lists.infradead.org;
	Fri, 28 Feb 2025 09:12:10 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-30615661f98so18836671fa.2
        for <linux-riscv@lists.infradead.org>; Fri, 28 Feb 2025 01:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740733928; x=1741338728; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b8NBOP2GQ2KlGT1kMn03prIoC3D0wUg1PxgjvTKjfnk=;
        b=pqcskmpLBnzWJeXDetlble8dnztOekkqBt+4PfcRZ9zK/4M2VpSf11BkhIO8FNKLAf
         ItJ2b+rlsw+I3zGSE0QwloK6prpe138Q6x5s5ej98uXW32n222u5MlPHcTHBnkefH9So
         0lwOn/URwLqWldnVpnHVaE1nNlAcVVxC+T22/oYiAtZiiRTRAxhHNiIBT5zFKl7hs8fq
         KxTyWJtmvvC8a32czjQ9l7qd+7lnL30aYFBR+7+pMqV5HIR436cYZeFZ6c61B6HvJep0
         JONCUFiLbQjS7eh5IDHTMtLfE5cmmXoSCXL6jcxygiR9NFsfIxgRIPp7axHo74QOgk0X
         bOpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740733928; x=1741338728;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b8NBOP2GQ2KlGT1kMn03prIoC3D0wUg1PxgjvTKjfnk=;
        b=rg1vPKGJStEbrEqMat+eRkRo3vNeJWdWpev2bZw9kEvfkQPH3gZI/LZybltug5auPp
         D56bk378WcAFAwjlQFs6Ow9/PScBbeCO6JoSl1XTiLoCQ/2Db5bXfUZM2A7EXbhVJWn+
         /n0R4cY0z/ELacTjDiy+pLtPTf9Bs7DlAoTY8PAAs+91BafTpdOyTFZJuoiXxHrIJbcV
         fPjkQS6nTxhbnB64XGaMuSGjmPuEnBNdHdhFUHrcphWXYrRypuV0z3O2Ez4ZWgJsk6NL
         EkdPxhe5ludz07OVmsmZx02bcPQlSnhyrRjXTcmfC3LSm7nOBT609h9BsRBf7XLvU7h6
         2Ezw==
X-Forwarded-Encrypted: i=1; AJvYcCXinHRrq0y9smxijgzMQFSM5UKfwbvEbUoNYCCiuefZTsMyTyjUY4itqUeJwY/8Kdr6vAglt+/+jZIkhA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2ANvdZKSAD4CWAbjcXbZqMuIf2oTSts0rsNHouUnUs0FqjQ0r
	cx6fE35JIeGM5F1yBwr4fYt4CSti+LHNbueTgU5UmfEo7n8zeHxWwg32PBHablnIz9/3YJgxW13
	MPR2DDgXCnhxfvbeatP9kancseO6vephjTrFyIg==
X-Gm-Gg: ASbGncsfH5QC8/DCOBG7unlV5Jww2y/gEut6NqNgKLRvGDlnQQEkUv858rYHrwcZ1Cv
	vxX3mOI7g8Pt5BBYnpMcGXXLOvE6pXNNgeCZ+hG/HY/mYNSXpIMheKrl/XTACqAjJkkFvm66f4T
	ZmpmHL6G4=
X-Google-Smtp-Source: AGHT+IFtHDQUwtIkZEmn26SAZGpaLbJ0ZA70JYYMxkjqCpaxYAkU8WvU0gBdbKbqlduqxgwjid1hfQ77kVQK8Hlzc1Q=
X-Received: by 2002:a05:6512:108a:b0:545:2b20:5b21 with SMTP id
 2adb3069b0e04-5494c36869dmr947565e87.50.1740733927813; Fri, 28 Feb 2025
 01:12:07 -0800 (PST)
MIME-Version: 1.0
References: <20250227-04-gpio-irq-threecell-v1-0-4ae4d91baadc@gentoo.org> <20250227-04-gpio-irq-threecell-v1-2-4ae4d91baadc@gentoo.org>
In-Reply-To: <20250227-04-gpio-irq-threecell-v1-2-4ae4d91baadc@gentoo.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 Feb 2025 10:11:56 +0100
X-Gm-Features: AQ5f1JrL-KjS4W2cfXdgdW4fA0i_u-8CysEWcjvk-omutRUMfq6vTHu0adnO6VY
Message-ID: <CACRpkdZ1X5kF-AyRBg9BYMiJscv0v-SGzcdetS0XDK3oPSu9QQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpiolib: support parsing gpio three-cell interrupts scheme
To: Yixun Lan <dlan@gentoo.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>, Alex Elder <elder@riscstar.com>, 
	Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_011209_807243_16D48F81 
X-CRM114-Status: GOOD (  16.16  )
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

SGkgWWl4dW4sCgp0aGFua3MgZm9yIHdvcmtpbmcgc28gaGFyZCBvbiB0aGlzIQoKSSdtIHJlYWxs
eSBoYXBweSB0byBzZWUgdGhlIHRocmVlY2VsbCBzdXBwb3J0IGludGVncmF0ZWQgaW50byBncGlv
bGliLgoKT24gVGh1LCBGZWIgMjcsIDIwMjUgYXQgMTI6MjXigK9QTSBZaXh1biBMYW4gPGRsYW5A
Z2VudG9vLm9yZz4gd3JvdGU6Cgo+IGdwaW8gaXJxIHdoaWNoIHVzaW5nIHRocmVlLWNlbGwgc2No
ZW1lIHNob3VsZCBhbHdheXMgY2FsbAo+IGluc3RhbmNlX21hdGNoKCkgZnVuY3Rpb24gdG8gZmlu
ZCB0aGUgY29ycmVjdCBpcnFkb21haW4uCj4KPiBTaWduZWQtb2ZmLWJ5OiBZaXh1biBMYW4gPGRs
YW5AZ2VudG9vLm9yZz4KPiAtLS0KPiBUaGUgc2VsZWN0KCkgZnVuY3Rpb24gd2lsbCBiZSBjYWxs
ZWQgd2l0aCAhRE9NQUlOX0JVU19BTlksCj4ga2VybmVsL2lycS9pcnFkb21haW4uYzo1NTY6IGlm
IChoLT5vcHMtPnNlbGVjdCAmJiBidXNfdG9rZW4gIT0gRE9NQUlOX0JVU19BTlkpCj4KPiBzbyB2
ZW5kb3IgZ3BpbyBkcml2ZXIgbmVlZCB0byBleHBsaWNpdGx5IHNldCBidXNfdG9rZW4sIHNvbWV0
aGluZyBsaWtlOgo+Cj4gZHJpdmVycy9ncGlvL2dwaW8tc3BhY2VtaXQtazEuYwo+ICAgaXJxX2Rv
bWFpbl91cGRhdGVfYnVzX3Rva2VuKGdpcnEtPmRvbWFpbiwgRE9NQUlOX0JVU19XSVJFRCk7Cj4K
PiBJIGhvcGUgdGhpcyBpcyBhIGZlYXNpYmxlIHdheS4uCgpZZXMgdGhpcyBsb29rcyBmYWlyLCBJ
IHRoaW5rIHlvdSBjYW4gcHV0IHRoZSBkZXNjcmlwdGlvbiBpbnRvIHRoZQpjb21taXQgbWVzc2Fn
ZS4KCj4gICAgICAgICAvKiBXZSBzdXBwb3J0IHN0YW5kYXJkIERUIHRyYW5zbGF0aW9uICovCj4g
LSAgICAgICBpZiAoaXNfb2Zfbm9kZShmd3NwZWMtPmZ3bm9kZSkgJiYgZndzcGVjLT5wYXJhbV9j
b3VudCA9PSAyKSB7Cj4gKyAgICAgICBpZiAoaXNfb2Zfbm9kZShmd3NwZWMtPmZ3bm9kZSkgJiYg
ZndzcGVjLT5wYXJhbV9jb3VudCA8PSAzKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gaXJxX2Rv
bWFpbl90cmFuc2xhdGVfdHdvY2VsbChkLCBmd3NwZWMsIGh3aXJxLCB0eXBlKTsKPiAtICAgICAg
IH0KClRoaXMgbG9va3MgZ29vZC4KCj4gK3N0YXRpYyBpbnQgZ3Bpb2NoaXBfaXJxX3NlbGVjdChz
dHJ1Y3QgaXJxX2RvbWFpbiAqZCwgc3RydWN0IGlycV9md3NwZWMgKmZ3c3BlYywKPiArICAgICAg
ICAgICAgICAgICAgICAgICBlbnVtIGlycV9kb21haW5fYnVzX3Rva2VuIGJ1c190b2tlbikKPiAr
ewo+ICsgICAgICAgc3RydWN0IGZ3bm9kZV9oYW5kbGUgKmZ3bm9kZSA9IGZ3c3BlYy0+Zndub2Rl
Owo+ICsgICAgICAgc3RydWN0IGdwaW9fY2hpcCAqZ2MgPSBkLT5ob3N0X2RhdGE7Cj4gKyAgICAg
ICB1bnNpZ25lZCBpbnQgaW5kZXggPSBmd3NwZWMtPnBhcmFtWzBdOwo+ICsKPiArICAgICAgIGlm
ICgoZ2MtPm9mX2dwaW9fbl9jZWxscyA9PSAzKSAmJiBnYy0+b2Zfbm9kZV9pbnN0YW5jZV9tYXRj
aCkKPiArICAgICAgICAgICAgICAgcmV0dXJuIGdjLT5vZl9ub2RlX2luc3RhbmNlX21hdGNoKGdj
LCBpbmRleCk7CgpXZSBuZWVkIHRvIGhpZGUgdGhlIE9GLXNwZWNpZmljIHRoaW5ncyBpbnRvIGdw
aW9saWItb2YuY3xoIHNvIHN5c3RlbXMKbm90IHVzaW5nIE9GIGRvZXMgbm90IG5lZWQgdG8gc2Vl
IGl0LgoKU29tZXRoaW5nIGxpa2U6CgppZiAoZndzcGVjLT5wYXJhbV9jb3VudCA9PSAzKSB7CiAg
ICAgaWYgKGlzX29mX25vZGUoZndub2RlKSkKICAgICAgICAgcmV0dXJuIG9mX2dwaW9jaGlwX2lu
c3RhbmNlX21hdGNoKGdjLCBpbmRleCk7CiAgICAvKiBBZGQgb3RoZXIgdGhyZWVwYXJhbSBoYW5k
bGVycyBoZXJlICovCn0KClRoZW4gYWRkIG9mX2dwaW9jaGlwX2luc3RhbmNlX21hdGNoKCkgaW50
byBncGlvbGliLW9mLmggYXMgYQpzdGF0aWMgaW5saW5lIChubyBuZWVkIHRvIGFuIGVudGlyZSBl
eHRlcm4gZnVuY3Rpb24uLi4pCgpzdGF0aWMgaW5saW5lIGJvb2wgb2ZfZ3Bpb2NoaXBfaW5zdGFu
Y2VfbWF0Y2goc3RydWN0IGdwaW9fY2hpcCAqZ2MsIGludCBpbmRleCkKewogICAgaWYgKChnYy0+
b2ZfZ3Bpb19uX2NlbGxzID09IDMpICYmIGdjLT5vZl9ub2RlX2luc3RhbmNlX21hdGNoKQogICAg
ICAgICAgICAgIHJldHVybiBnYy0+b2Zfbm9kZV9pbnN0YW5jZV9tYXRjaChnYywgaW5kZXgpOwp9
CgpBbmQgYWxzbyBhbiBlbXB0eSBzdHViIGZvciAhQ09ORklHX09GX0dQSU8gc28gd2UgZ2V0IHRo
aXMgY29tcGlsZWQKb3V0IGlmIE9GIGlzIG5vdCBjb25maWd1cmVkIGluLgoKWW91cnMsCkxpbnVz
IFdhbGxlaWoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
