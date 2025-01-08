Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2926E77188
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jan 2025 14:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DgCo81x8LdQ5eYOS/JYKdp6bYg/mPxtZoB8utUkvEX0=; b=0OpqgrE/42zgUr
	aLt450bPjmo+ekqz/sKf1Le1r+uH6aqWu7g66YfmXkzECekwrEaLzPy73gcitt72J9eAoYwREL/w+
	CmigLqNxTD/BCnPGmdgcCnUfdroDK7dnfVfgWy47Kp4BHSCXZEy2Ifd9CfQETQEvRnsHH0jsyYLDH
	H6ast2/ewmvRPDxWxWNZdUCNXIKduIiS6ki4Zi/9F1ed5ovO5sDw00qSXtGUvnLN0wagxF4qZc2wG
	u4/SOpIox2QnCvr9A/i6Zdy5LZ5P9AITovzHzNHPYTrbFNhYdUATTvKSTGhneJGy4fQcCXpzcuJz/
	l6Mikimq0M1cGNX8ZLVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVWgN-00000008jfO-3vkr;
	Wed, 08 Jan 2025 14:05:15 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVWgL-00000008jdS-1tre
	for linux-riscv@lists.infradead.org;
	Wed, 08 Jan 2025 14:05:14 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5d3e9f60bf4so30008901a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 08 Jan 2025 06:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736345111; x=1736949911; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CS4fsmFRKwcQCOF/34xZEJfE9OrKJtzZnlgjYcJW0mQ=;
        b=aWgdVnNYdzyxC2Zp4cweDPW9/GmW+KckVKEau91X7fvrWYDNPQkUQSqKzTMhJk2AqZ
         xUTFQKiX9UTDBPZLeGFKcaSNvERKtjd0nO42i5WpOsGWK0U3LbuVo/inA85Dy/i+GGMi
         hpxkPndr4C7upVwILZDcNlyCkk1a2hCoWWT8xQtmYQ3ee5KJzOMjMMxsqAAAIwrZggow
         hbad59j1qGd2LvtppeqxF0EgFXBvNsuDHRE8mKGrPyjWJAK11v5CmHVViH5MXQz1HbyU
         zuBAzGFDNwlHO/gs/p0r1kcf3we1+NK3r+F18C3tTGX3ylbc+GMxNSM8vQa25VrBNiq5
         wybA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736345111; x=1736949911;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CS4fsmFRKwcQCOF/34xZEJfE9OrKJtzZnlgjYcJW0mQ=;
        b=AS6fKD0IHDb7PkG/mnhBDh5+dB7OwyuozzTSYi0jo8wucKrEcR/NIk02BuNZlT4cz9
         ht2iCKzzIEckUpCq92DZn7lJxNb0ggOA5CZYjuC9c5Rmrx5yV0ogy3yQbfJuPgInoHCO
         99r1LyFooApT4Yi12/ns7MsQAzL9OsBjvdIiDBBVQu8U/Il8UGe7ZnA+KzIDVr8qqqSh
         25fk4zFt8DzOmPg3jDUB1jADpz6nUSa6Rfno9BaHqu/zk2fOtaapnenZpgSUKB7iO6Or
         kXQm/1X6GVVajFraVt0V5DTB9wYEsHr14aYHrp8pQDTffRdn8YvetuPhmIgQKQwbiAuu
         xq6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXIeYAIO4BEpZ2XP4uYM23EJGUrBafm3Bea7vNbkXNwujirzLOzXFpzRCDY5FcSnQrW9ninb2+dDBlGdQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6y5OiOqzsbebh/5rQcJDT5hDRNEub0udb/kFYkbKEx1XlbTSg
	0DPezbD2oQpw72CN6gY7HJqPhqfxCdlQaEa99Gmh34sXYHntmXpCZ6xgTUexpP6D7MMK1GY0NKw
	eNEX8b3ppZ1UpvQr8KCA54IsPegehLpi8/IBoEQ==
X-Gm-Gg: ASbGncsVsvRbeYoiazl40KXtE+KGzJ7c1vojZc5C9mH575xFy5rfkQNAxYdK7dImSLR
	dq1aTcrjd6/HYO3bEuF/WnnbS/GZGFnEZ
X-Google-Smtp-Source: AGHT+IGnke1sU5auTlvZf3KwUkJ4nhuGxwCr+BnqY7SRQ5pujzSSn4axsFeehQijklbw7Dd3UQnbFWcDbT9Rlw5gI/g=
X-Received: by 2002:a05:6402:268c:b0:5d2:d72a:77e4 with SMTP id
 4fb4d7f45d1cf-5d972e6c9b0mr2622948a12.28.1736345111176; Wed, 08 Jan 2025
 06:05:11 -0800 (PST)
MIME-Version: 1.0
References: <20250108135700.2614848-1-abrestic@rivosinc.com>
In-Reply-To: <20250108135700.2614848-1-abrestic@rivosinc.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Wed, 8 Jan 2025 15:04:59 +0100
X-Gm-Features: AbW1kvYz2Fuq15N8AUP6n0nYMSW9kH7kdmGMPzEWHT1nGY9qJfobnCKcqYawgZ8
Message-ID: <CAHVXubjw44raXLX568wcUc0AeUva6vSjwY710WPxGk4=5vpO7g@mail.gmail.com>
Subject: Re: [PATCH] riscv: Support huge pfnmaps
To: Andrew Bresticker <abrestic@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peter Xu <peterx@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_060513_489833_719021C5 
X-CRM114-Status: GOOD (  16.45  )
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

SGkgQW5kcmV3LAoKT24gV2VkLCBKYW4gOCwgMjAyNSBhdCAyOjU34oCvUE0gQW5kcmV3IEJyZXN0
aWNrZXIgPGFicmVzdGljQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBVc2UgUlNXMCBhcyB0aGUg
c3BlY2lhbCBiaXQgZm9yIHBtZHMgYW5kIHB1ZHMsIGp1c3QgbGlrZSBmb3IgcHRlcy4KPiBBbHNv
IGRlZmluZSB0aGUge3B0ZSxwbWQscHVkfV9wZ3Byb3QgaGVscGVycyB3aGljaCB3ZXJlIHByZXZp
b3VzbHkKPiBtaXNzaW5nIGFuZCBhcmUgbmVlZGVkIGZvciB0aGUgZm9sbG93X3Bmbm1hcCBBUElz
Lgo+Cj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IEJyZXN0aWNrZXIgPGFicmVzdGljQHJpdm9zaW5j
LmNvbT4KPiAtLS0KPiAgYXJjaC9yaXNjdi9LY29uZmlnICAgICAgICAgICAgICAgfCAgMSArCj4g
IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oIHwgNDkgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCA1MCBpbnNlcnRpb25zKCspCj4KPiBk
aWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9LY29uZmlnIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4gaW5k
ZXggZDRhN2NhMDM4OGMwLi5mZjQ4NDllMzU1NDUgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9L
Y29uZmlnCj4gKysrIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4gQEAgLTYxLDYgKzYxLDcgQEAgY29u
ZmlnIFJJU0NWCj4gICAgICAgICBzZWxlY3QgQVJDSF9TVVBQT1JUU19BVE9NSUNfUk1XCj4gICAg
ICAgICBzZWxlY3QgQVJDSF9TVVBQT1JUU19DRklfQ0xBTkcKPiAgICAgICAgIHNlbGVjdCBBUkNI
X1NVUFBPUlRTX0RFQlVHX1BBR0VBTExPQyBpZiBNTVUKPiArICAgICAgIHNlbGVjdCBBUkNIX1NV
UFBPUlRTX0hVR0VfUEZOTUFQIGlmIFRSQU5TUEFSRU5UX0hVR0VQQUdFCj4gICAgICAgICBzZWxl
Y3QgQVJDSF9TVVBQT1JUU19IVUdFVExCRlMgaWYgTU1VCj4gICAgICAgICAjIExMRCA+PSAxNDog
aHR0cHM6Ly9naXRodWIuY29tL2xsdm0vbGx2bS1wcm9qZWN0L2lzc3Vlcy81MDUwNQo+ICAgICAg
ICAgc2VsZWN0IEFSQ0hfU1VQUE9SVFNfTFRPX0NMQU5HIGlmIExMRF9WRVJTSU9OID49IDE0MDAw
MAo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaCBiL2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oCj4gaW5kZXggZDRlOTllZWY5MGFjLi45NWVlNzQ1
ZTNlZjcgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKPiAr
KysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaAo+IEBAIC0zNDEsNiArMzQxLDE0
IEBAIHN0YXRpYyBpbmxpbmUgcHRlX3QgcGZuX3B0ZSh1bnNpZ25lZCBsb25nIHBmbiwgcGdwcm90
X3QgcHJvdCkKPgo+ICAjZGVmaW5lIG1rX3B0ZShwYWdlLCBwcm90KSAgICAgICBwZm5fcHRlKHBh
Z2VfdG9fcGZuKHBhZ2UpLCBwcm90KQo+Cj4gKyNkZWZpbmUgcHRlX3BncHJvdCBwdGVfcGdwcm90
Cj4gK3N0YXRpYyBpbmxpbmUgcGdwcm90X3QgcHRlX3BncHJvdChwdGVfdCBwdGUpCj4gK3sKPiAr
ICAgICAgIHVuc2lnbmVkIGxvbmcgcGZuID0gcHRlX3BmbihwdGUpOwo+ICsKPiArICAgICAgIHJl
dHVybiBfX3BncHJvdChwdGVfdmFsKHBmbl9wdGUocGZuLCBfX3BncHJvdCgwKSkpIF4gcHRlX3Zh
bChwdGUpKTsKPiArfQo+ICsKPiAgc3RhdGljIGlubGluZSBpbnQgcHRlX3ByZXNlbnQocHRlX3Qg
cHRlKQo+ICB7Cj4gICAgICAgICByZXR1cm4gKHB0ZV92YWwocHRlKSAmIChfUEFHRV9QUkVTRU5U
IHwgX1BBR0VfUFJPVF9OT05FKSk7Cj4gQEAgLTY3NCw2ICs2ODIsMTEgQEAgc3RhdGljIGlubGlu
ZSBwbWRfdCBwdGVfcG1kKHB0ZV90IHB0ZSkKPiAgICAgICAgIHJldHVybiBfX3BtZChwdGVfdmFs
KHB0ZSkpOwo+ICB9Cj4KPiArc3RhdGljIGlubGluZSBwdWRfdCBwdGVfcHVkKHB0ZV90IHB0ZSkK
PiArewo+ICsgICAgICAgcmV0dXJuIF9fcHVkKHB0ZV92YWwocHRlKSk7Cj4gK30KPiArCj4gIHN0
YXRpYyBpbmxpbmUgcG1kX3QgcG1kX21raHVnZShwbWRfdCBwbWQpCj4gIHsKPiAgICAgICAgIHJl
dHVybiBwbWQ7Cj4gQEAgLTY5OSw2ICs3MTIsMTggQEAgc3RhdGljIGlubGluZSB1bnNpZ25lZCBs
b25nIHB1ZF9wZm4ocHVkX3QgcHVkKQo+ICAgICAgICAgcmV0dXJuICgoX19wdWRfdG9fcGh5cyhw
dWQpICYgUFVEX01BU0spID4+IFBBR0VfU0hJRlQpOwo+ICB9Cj4KPiArI2RlZmluZSBwbWRfcGdw
cm90IHBtZF9wZ3Byb3QKPiArc3RhdGljIGlubGluZSBwZ3Byb3RfdCBwbWRfcGdwcm90KHBtZF90
IHBtZCkKPiArewo+ICsgICAgICAgcmV0dXJuIHB0ZV9wZ3Byb3QocG1kX3B0ZShwbWQpKTsKPiAr
fQo+ICsKPiArI2RlZmluZSBwdWRfcGdwcm90IHB1ZF9wZ3Byb3QKPiArc3RhdGljIGlubGluZSBw
Z3Byb3RfdCBwdWRfcGdwcm90KHB1ZF90IHB1ZCkKPiArewo+ICsgICAgICAgcmV0dXJuIHB0ZV9w
Z3Byb3QocHVkX3B0ZShwdWQpKTsKPiArfQo+ICsKPiAgc3RhdGljIGlubGluZSBwbWRfdCBwbWRf
bW9kaWZ5KHBtZF90IHBtZCwgcGdwcm90X3QgbmV3cHJvdCkKPiAgewo+ICAgICAgICAgcmV0dXJu
IHB0ZV9wbWQocHRlX21vZGlmeShwbWRfcHRlKHBtZCksIG5ld3Byb3QpKTsKPiBAQCAtNzY4LDYg
Kzc5MywzMCBAQCBzdGF0aWMgaW5saW5lIHBtZF90IHBtZF9ta2Rldm1hcChwbWRfdCBwbWQpCj4g
ICAgICAgICByZXR1cm4gcHRlX3BtZChwdGVfbWtkZXZtYXAocG1kX3B0ZShwbWQpKSk7Cj4gIH0K
Pgo+ICsjaWZkZWYgQ09ORklHX0FSQ0hfU1VQUE9SVFNfUE1EX1BGTk1BUAo+ICtzdGF0aWMgaW5s
aW5lIGJvb2wgcG1kX3NwZWNpYWwocG1kX3QgcG1kKQo+ICt7Cj4gKyAgICAgICByZXR1cm4gcHRl
X3NwZWNpYWwocG1kX3B0ZShwbWQpKTsKPiArfQo+ICsKPiArc3RhdGljIGlubGluZSBwbWRfdCBw
bWRfbWtzcGVjaWFsKHBtZF90IHBtZCkKPiArewo+ICsgICAgICAgcmV0dXJuIHB0ZV9wbWQocHRl
X21rc3BlY2lhbChwbWRfcHRlKHBtZCkpKTsKPiArfQo+ICsjZW5kaWYKPiArCj4gKyNpZmRlZiBD
T05GSUdfQVJDSF9TVVBQT1JUU19QVURfUEZOTUFQCj4gK3N0YXRpYyBpbmxpbmUgYm9vbCBwdWRf
c3BlY2lhbChwdWRfdCBwdWQpCj4gK3sKPiArICAgICAgIHJldHVybiBwdGVfc3BlY2lhbChwdWRf
cHRlKHB1ZCkpOwo+ICt9Cj4gKwo+ICtzdGF0aWMgaW5saW5lIHB1ZF90IHB1ZF9ta3NwZWNpYWwo
cHVkX3QgcHVkKQo+ICt7Cj4gKyAgICAgICByZXR1cm4gcHRlX3B1ZChwdGVfbWtzcGVjaWFsKHB1
ZF9wdGUocHVkKSkpOwo+ICt9Cj4gKyNlbmRpZgo+ICsKPiAgc3RhdGljIGlubGluZSB2b2lkIHNl
dF9wbWRfYXQoc3RydWN0IG1tX3N0cnVjdCAqbW0sIHVuc2lnbmVkIGxvbmcgYWRkciwKPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBtZF90ICpwbWRwLCBwbWRfdCBwbWQpCj4gIHsK
PiAtLQo+IDIuMzQuMQo+CgpSZXZpZXdlZC1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlA
cml2b3NpbmMuY29tPgoKVGhhbmtzLAoKQWxleAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
