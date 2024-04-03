Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DEDCC6FD1F
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 05:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TIPvrO3QEnzTV0mI+DH59/cJ9mGYWVTIA64aQI2nTSo=; b=heOhC9XAs7zEDf
	giCHLYP7O4avVIyvDLfojD8EK6m5rPQqoRITGGGl+zUqjKYeUeJojAO/H676oSByE2SbtSA4uvxz0
	l1P+4l5UZLsKrfNjLkf5COp5wwiTH9TteNNJKs/xmSE+wsHNEJmbmZZPCiy8AvtTnAWUyzAhokDjM
	JMwKr/6tmgdNCgM02JR7O4+2z7r3QK3hg3+QbBzloa/qqxphwb4fn1NWhbfbMfYXfsx/Gpwik8bPS
	ihbVSp7fAEU5coUFm+3XGdvJXzOz3W0WXw6ltJToUz5JkJTmkbGRhuWHxXP+KPKIabdAxJ+4w1ePe
	hQTUAIC2mopKeiBqWazQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrsv7-0000000E33C-0ne1;
	Wed, 03 Apr 2024 05:12:21 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrsv4-0000000E310-1YgH
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 05:12:19 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-dcc80d6004bso5464301276.0
        for <linux-riscv@lists.infradead.org>; Tue, 02 Apr 2024 22:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712121131; x=1712725931; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CxRG9lv5n8fexIxo+XXVWIBRdafbxcACyQss08DTFqc=;
        b=2DmaBeT1OX3SDwEFbTsOOZz7m69wjHPm0MWUtWCG6Hs2JCrFuZtbaU6+zKEgJcWVAh
         u/KdQ7XQ3NZCjtk8yMWo9Wu+P8sf89zj4Z1s/gNvla1wRyp43ZkEnWI5l46uqQnAPK0g
         fcBnqZUht0A3HE+7I3HJxXekKFuR2+vZyyiIR7TRj/X0nWWGpeTXHhmTg7a46lHyvHNN
         o96NttuXjYBr7Cfdn/ro5Xiv3L+mwZwBUaW2hfeTYhegNIEb4ICk6otYm6NqwFlulkJ6
         dzYvXQ/Ba06+ACIURHTwXgmCWgjVt8Ms+cWRiYBWia0FSyoqEtO2IJA7s171XmLla0aP
         wBtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712121131; x=1712725931;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CxRG9lv5n8fexIxo+XXVWIBRdafbxcACyQss08DTFqc=;
        b=RefgMXWY0afbSOow69sUlg8SVsc8uHSgTJ6Xdh2ZDQggsYRoYfbqIAsnvxZkY3jyiE
         xnFbRkKhC9d6HFbKpYw6W3p5G0beEeau0wj0lyaRSEIZNvw0VB13pDY75flYYGKHjKGI
         SClDXKJVs4IZOS4pGuZ32QJUfG4AmMRsMjgmAHiA2sbsj+BAf156O/f9W67urKWXfXn+
         y3OWzqfOjAkK73m21WafxGJYVdJa/cTa5gS6pcmguNTH/3a5potnx97VwleTlADRlhYG
         YQAuvrmQ2HMKJqcIQdCzwiGF3mDRkSBgcWr5293u0UzUV0oDu5eRiUnPolfwTWp9JNgr
         21Ew==
X-Forwarded-Encrypted: i=1; AJvYcCWEtiCu8OxSbXwLfyijdimQ9o53UC2S4M4uxmp/kS/q8U5l/Shu7xnhEt/IoKMwteDfSzDAiQnfQmt/XBhDAaUOfnuBSssjtf8z0O61s/N5
X-Gm-Message-State: AOJu0YwU7cdCy5ShFo9yeMt5j58RBEke1AnMhMLrV582RPF8YCJFu5PJ
	saBwlOVoMne28l/+mrLeg1po4JSAgW6G4nlHGVtu3Xp2xA3hu1RJRD1t4zhybfZkU2OELSkoVs4
	LHnkOFJ8cZGpyeY1cmVMH57L5bTUTkLeA4OP6
X-Google-Smtp-Source: AGHT+IHv6JffsEzPnx5KbInGZZ0OL1jobKmTWbbhcnG9zLMw35NFD69tvdQCf9596q687XkaokyV8L2kfkQddNDCMI0=
X-Received: by 2002:a25:ef46:0:b0:dc7:4067:9f85 with SMTP id
 w6-20020a25ef46000000b00dc740679f85mr12942760ybm.58.1712121130607; Tue, 02
 Apr 2024 22:12:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240402075142.196265-1-wangkefeng.wang@huawei.com> <20240402075142.196265-2-wangkefeng.wang@huawei.com>
In-Reply-To: <20240402075142.196265-2-wangkefeng.wang@huawei.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 2 Apr 2024 22:11:57 -0700
Message-ID: <CAJuCfpHkqx7yWgN0yXVqtThrNCV07=9AdhTtc5mi=skMXmZRKg@mail.gmail.com>
Subject: Re: [PATCH 1/7] arm64: mm: cleanup __do_page_fault()
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: akpm@linux-foundation.org, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, x86@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_221218_467710_D661DFF1 
X-CRM114-Status: GOOD (  20.17  )
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

T24gVHVlLCBBcHIgMiwgMjAyNCBhdCAxMjo1M+KAr0FNIEtlZmVuZyBXYW5nIDx3YW5na2VmZW5n
LndhbmdAaHVhd2VpLmNvbT4gd3JvdGU6Cj4KPiBUaGUgX19kb19wYWdlX2ZhdWx0KCkgb25seSBj
aGVjayB2bWEtPmZsYWdzIGFuZCBjYWxsIGhhbmRsZV9tbV9mYXVsdCgpLAo+IGFuZCBvbmx5IGNh
bGxlZCBieSBkb19wYWdlX2ZhdWx0KCksIGxldCdzIHNxdWFzaCBpdCBpbnRvIGRvX3BhZ2VfZmF1
bHQoKQo+IHRvIGNsZWFudXAgY29kZS4KPgo+IFNpZ25lZC1vZmYtYnk6IEtlZmVuZyBXYW5nIDx3
YW5na2VmZW5nLndhbmdAaHVhd2VpLmNvbT4KClJldmlld2VkLWJ5OiBTdXJlbiBCYWdoZGFzYXJ5
YW4gPHN1cmVuYkBnb29nbGUuY29tPgoKPiAtLS0KPiAgYXJjaC9hcm02NC9tbS9mYXVsdC5jIHwg
MjcgKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2Vy
dGlvbnMoKyksIDIwIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvbW0v
ZmF1bHQuYyBiL2FyY2gvYXJtNjQvbW0vZmF1bHQuYwo+IGluZGV4IDgyNTFlMmZlYTljNy4uOWJi
OWYzOTUzNTFhIDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtNjQvbW0vZmF1bHQuYwo+ICsrKyBiL2Fy
Y2gvYXJtNjQvbW0vZmF1bHQuYwo+IEBAIC00ODYsMjUgKzQ4Niw2IEBAIHN0YXRpYyB2b2lkIGRv
X2JhZF9hcmVhKHVuc2lnbmVkIGxvbmcgZmFyLCB1bnNpZ25lZCBsb25nIGVzciwKPiAgICAgICAg
IH0KPiAgfQo+Cj4gLSNkZWZpbmUgVk1fRkFVTFRfQkFETUFQICAgICAgICAgICAgICAgICgoX19m
b3JjZSB2bV9mYXVsdF90KTB4MDEwMDAwKQo+IC0jZGVmaW5lIFZNX0ZBVUxUX0JBREFDQ0VTUyAg
ICAgKChfX2ZvcmNlIHZtX2ZhdWx0X3QpMHgwMjAwMDApCj4gLQo+IC1zdGF0aWMgdm1fZmF1bHRf
dCBfX2RvX3BhZ2VfZmF1bHQoc3RydWN0IG1tX3N0cnVjdCAqbW0sCj4gLSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLCB1bnNpZ25lZCBs
b25nIGFkZHIsCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGlu
dCBtbV9mbGFncywgdW5zaWduZWQgbG9uZyB2bV9mbGFncywKPiAtICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4gLXsKPiAtICAgICAgIC8qCj4g
LSAgICAgICAgKiBPaywgd2UgaGF2ZSBhIGdvb2Qgdm1fYXJlYSBmb3IgdGhpcyBtZW1vcnkgYWNj
ZXNzLCBzbyB3ZSBjYW4gaGFuZGxlCj4gLSAgICAgICAgKiBpdC4KPiAtICAgICAgICAqIENoZWNr
IHRoYXQgdGhlIHBlcm1pc3Npb25zIG9uIHRoZSBWTUEgYWxsb3cgZm9yIHRoZSBmYXVsdCB3aGlj
aAo+IC0gICAgICAgICogb2NjdXJyZWQuCj4gLSAgICAgICAgKi8KPiAtICAgICAgIGlmICghKHZt
YS0+dm1fZmxhZ3MgJiB2bV9mbGFncykpCj4gLSAgICAgICAgICAgICAgIHJldHVybiBWTV9GQVVM
VF9CQURBQ0NFU1M7Cj4gLSAgICAgICByZXR1cm4gaGFuZGxlX21tX2ZhdWx0KHZtYSwgYWRkciwg
bW1fZmxhZ3MsIHJlZ3MpOwo+IC19Cj4gLQo+ICBzdGF0aWMgYm9vbCBpc19lbDBfaW5zdHJ1Y3Rp
b25fYWJvcnQodW5zaWduZWQgbG9uZyBlc3IpCj4gIHsKPiAgICAgICAgIHJldHVybiBFU1JfRUx4
X0VDKGVzcikgPT0gRVNSX0VMeF9FQ19JQUJUX0xPVzsKPiBAQCAtNTE5LDYgKzUwMCw5IEBAIHN0
YXRpYyBib29sIGlzX3dyaXRlX2Fib3J0KHVuc2lnbmVkIGxvbmcgZXNyKQo+ICAgICAgICAgcmV0
dXJuIChlc3IgJiBFU1JfRUx4X1dOUikgJiYgIShlc3IgJiBFU1JfRUx4X0NNKTsKPiAgfQo+Cj4g
KyNkZWZpbmUgVk1fRkFVTFRfQkFETUFQICAgICAgICAgICAgICAgICgoX19mb3JjZSB2bV9mYXVs
dF90KTB4MDEwMDAwKQo+ICsjZGVmaW5lIFZNX0ZBVUxUX0JBREFDQ0VTUyAgICAgKChfX2ZvcmNl
IHZtX2ZhdWx0X3QpMHgwMjAwMDApCj4gKwo+ICBzdGF0aWMgaW50IF9fa3Byb2JlcyBkb19wYWdl
X2ZhdWx0KHVuc2lnbmVkIGxvbmcgZmFyLCB1bnNpZ25lZCBsb25nIGVzciwKPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+ICB7Cj4gQEAg
LTYxNyw3ICs2MDEsMTAgQEAgc3RhdGljIGludCBfX2twcm9iZXMgZG9fcGFnZV9mYXVsdCh1bnNp
Z25lZCBsb25nIGZhciwgdW5zaWduZWQgbG9uZyBlc3IsCj4gICAgICAgICAgICAgICAgIGdvdG8g
ZG9uZTsKPiAgICAgICAgIH0KPgo+IC0gICAgICAgZmF1bHQgPSBfX2RvX3BhZ2VfZmF1bHQobW0s
IHZtYSwgYWRkciwgbW1fZmxhZ3MsIHZtX2ZsYWdzLCByZWdzKTsKPiArICAgICAgIGlmICghKHZt
YS0+dm1fZmxhZ3MgJiB2bV9mbGFncykpCj4gKyAgICAgICAgICAgICAgIGZhdWx0ID0gVk1fRkFV
TFRfQkFEQUNDRVNTOwo+ICsgICAgICAgZWxzZQo+ICsgICAgICAgICAgICAgICBmYXVsdCA9IGhh
bmRsZV9tbV9mYXVsdCh2bWEsIGFkZHIsIG1tX2ZsYWdzLCByZWdzKTsKPgo+ICAgICAgICAgLyog
UXVpY2sgcGF0aCB0byByZXNwb25kIHRvIHNpZ25hbHMgKi8KPiAgICAgICAgIGlmIChmYXVsdF9z
aWduYWxfcGVuZGluZyhmYXVsdCwgcmVncykpIHsKPiAtLQo+IDIuMjcuMAo+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
