Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA931C4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 15:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Ypqze8172Z0pjaoWMti1Sy/PGV+Mwc1KAZDFoLvNWs=; b=LomvXFlphW7iDn
	wQfgPpJDkY/vb+NmsP8odwmJhMyR1MmepqY6Jy2e1+zzG9tWpKOToD2uegXZofytbpAzjljcVpRJc
	IA2fFUp6SftyHkeyvHetykaBCwIvhn36mdTCjJyanSjoqo/oIsQi5nO0/t+W6o8KpI5P7J0AM+ZgP
	xLoci8Ga7U/u0zitQ0vcvc9c/rKCKPc4HusOkxdGdQTGLiYyc3cW5B2UYZKm8438pWKgGKcTjl1Tx
	GWZorAkq1Oy1eow86zssbnnRhqhz2jW5QS6xIj6/D+9nNEEYO59iuGgETCkaNO0k9YX6CRBi/PQrf
	py8HwEdr0LDVtc0YeiPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBcbr-00FrxA-2l;
	Fri, 08 Dec 2023 15:17:47 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBcbo-00FrvI-2t
	for linux-riscv@lists.infradead.org;
	Fri, 08 Dec 2023 15:17:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 8E0C1B82E07
	for <linux-riscv@lists.infradead.org>; Fri,  8 Dec 2023 15:17:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B49AC43397
	for <linux-riscv@lists.infradead.org>; Fri,  8 Dec 2023 15:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702048662;
	bh=kSzj0p26fXMxcGqE7PiPZ0L9JbNQNQodTYDm9B6XDgk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VT8TiPU8AWNNluFOQ6urgB12MMJoQ9XGqf3He6NQnqBuHXn7K0cUvfcSWnM9LtbrN
	 koFsKbVZC5hbEyYlHLhw821WPeZDWudAIYX0FO6onGEuaQG/d70MdIYsgu2SCBi7k5
	 OKe9tnTEoKCaavIpoHOTCL3UkBtGcEZT0OFnv1FXed25sOc1gsczKk9v3vWFI/2/Ua
	 bIyC8WLC2BNLV4HE1XJRpuzltph0Tl6nL2N7IKJK/EN9HnSQFK/9Wy1aphDw6w9+9K
	 WEfRg2si2t833Q/8bi7T/1L6oADuo2Z12qAMNodWzwiW4OuKSZXkxyrPpJleLTV96+
	 Q23sLJSYDRK8Q==
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-54c1cd8d239so3049529a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 08 Dec 2023 07:17:42 -0800 (PST)
X-Gm-Message-State: AOJu0YxjrYDRMMzWPtTSiNwypTTl7AuVzy9Ibzlc5xts5slfiJYLAl4o
	eWzB5uquG2+qlYg/+HpMIzd9g/trUUUQ4ybBRMg=
X-Google-Smtp-Source: AGHT+IFJi1iRf2zgfdHRC/qtkfVNJN+lKZDFZJXXngMI6hzEX7cIwVpODsJVSSc7dCBAJTGggOiPmd4JAi61MgXaqjQ=
X-Received: by 2002:a17:907:94c9:b0:a1d:3500:6906 with SMTP id
 dn9-20020a17090794c900b00a1d35006906mr61156ejc.297.1702048660644; Fri, 08 Dec
 2023 07:17:40 -0800 (PST)
MIME-Version: 1.0
References: <20231208151036.2458921-1-guoren@kernel.org>
In-Reply-To: <20231208151036.2458921-1-guoren@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 8 Dec 2023 23:17:29 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSsKnmF8EY45xiH8y+wzz0XgypzHvwAbedCGu_x0S26=A@mail.gmail.com>
Message-ID: <CAJF2gTSsKnmF8EY45xiH8y+wzz0XgypzHvwAbedCGu_x0S26=A@mail.gmail.com>
Subject: Re: [PATCH] riscv: pgtable: Enhance set_pte to prevent OoO risk
To: paul.walmsley@sifive.com, palmer@dabbelt.com, akpm@linux-foundation.org, 
	alexghiti@rivosinc.com, catalin.marinas@arm.com, willy@infradead.org, 
	david@redhat.com, muchun.song@linux.dev, will@kernel.org, 
	peterz@infradead.org, rppt@kernel.org, paulmck@kernel.org, 
	atishp@atishpatra.org, anup@brainfault.org, alex@ghiti.fr, 
	mike.kravetz@oracle.com, dfustini@baylibre.com, wefu@redhat.com, 
	jszhang@kernel.org, falcon@tinylab.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_071745_213574_F9356C48 
X-CRM114-Status: GOOD (  24.33  )
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

T24gRnJpLCBEZWMgOCwgMjAyMyBhdCAxMToxMOKAr1BNIDxndW9yZW5Aa2VybmVsLm9yZz4gd3Jv
dGU6Cj4KPiBGcm9tOiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4KPiBXaGVu
IGNoYW5naW5nIGZyb20gYW4gaW52YWxpZCBwdGUgdG8gYSB2YWxpZCBvbmUgZm9yIGEga2VybmVs
IHBhZ2UsCj4gdGhlcmUgaXMgbm8gbmVlZCBmb3IgdGxiX2ZsdXNoLiBJdCdzIG9rYXkgZm9yIHRo
ZSBUU08gbWVtb3J5IG1vZGVsLCBidXQKPiB0aGVyZSBpcyBhbiBPb08gcmlzayBmb3IgdGhlIFdl
YWsgb25lLiBlZzoKU29ycnksIFRTTyBoYXMgbm8gSW1tdW5pdHkuIFRoZSBhYm92ZSBzZW50ZW5j
ZSBzaG91bGQgYmUgcmV3cml0dGVuIHdpdGg6CgpXaGVuIGNoYW5naW5nIGZyb20gYW4gaW52YWxp
ZCBwdGUgdG8gYSB2YWxpZCBvbmUgZm9yIGEga2VybmVsIHBhZ2UsCnRoZXJlIGlzIG5vIGd1YXJh
bnRlZSB0bGJfZmx1c2ggaW4gTGludXguIFNvLCB0aGVyZSBpcyBhbiBPb08gcmlzayBmb3IKcmlz
Y3YsIGUuZy46Cgo+Cj4gc2QgdDAsIChhMCkgLy8gYTAgPSBwdGUgYWRkcmVzcywgcHRldmFsIGlz
IGNoYW5nZWQgZnJvbSBpbnZhbGlkIHRvIHZhbGlkCj4gLi4uCj4gbGQgdDEsIChhMSkgLy8gYTEg
PSB2YSBvZiBhYm92ZSBwdGUKPgo+IElmIHRoZSBsZCBpbnN0cnVjdGlvbiBpcyBleGVjdXRlZCBz
cGVjdWxhdGl2ZWx5IGJlZm9yZSB0aGUgc2QKPiBpbnN0cnVjdGlvbi4gVGhlbiBpdCB3b3VsZCBi
cmluZyBhbiBpbnZhbGlkIGVudHJ5IGludG8gdGhlIFRMQiwgYW5kIHdoZW4KPiB0aGUgbGQgaW5z
dHJ1Y3Rpb24gcmV0aXJlZCwgYSBzcHVyaW91cyBwYWdlIGZhdWx0IG9jY3VycmVkLiBCZWNhdXNl
IHRoZQo+IHZtZW1tYXAgaGFzIGJlZW4gaWdub3JlZCBieSB2bWFsbG9jX2ZhdWx0LCB0aGUgc3B1
cmlvdXMgcGFnZSBmYXVsdCB3b3VsZAo+IGNhdXNlIGtlcm5lbCBwYW5pYy4KPgo+IFRoaXMgcGF0
Y2ggd2FzIGluc3BpcmVkIGJ5IHRoZSBjb21taXQ6IDdmMGIxYmYwNDUxMSAoImFybTY0OiBGaXgg
YmFycmllcnMKPiB1c2VkIGZvciBwYWdlIHRhYmxlIG1vZGlmaWNhdGlvbnMiKS4gRm9yIFJJU0Mt
ViwgdGhlcmUgaXMgbm8gcmVxdWlyZW1lbnQKPiBpbiB0aGUgc3BlYyB0byBndWFyYW50ZWUgYWxs
IHRsYiBlbnRyaWVzIGFyZSB2YWxpZCBhbmQgbm8gcmVxdWlyZW1lbnQgdG8KPiBQVFcgZmlsdGVy
IG91dCBpbnZhbGlkIGVudHJpZXMuIE9mIGNvdXJzZSwgbWljcm8tYXJjaCBjb3VsZCBnaXZlIGEg
bW9yZQo+IHJvYnVzdCBkZXNpZ24sIGJ1dCBoZXJlLCB1c2UgYSBzb2Z0d2FyZSBmZW5jZSB0byBn
dWFyYW50ZWUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFi
YS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4gLS0t
Cj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oIHwgNyArKysrKysrCj4gIDEgZmls
ZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL3BndGFibGUuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oCj4g
aW5kZXggMjk0MDQ0NDI5ZThlLi4yZmFlNWE1NDM4ZTAgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Bn
dGFibGUuaAo+IEBAIC01MTEsNiArNTExLDEzIEBAIHN0YXRpYyBpbmxpbmUgaW50IHB0ZV9zYW1l
KHB0ZV90IHB0ZV9hLCBwdGVfdCBwdGVfYikKPiAgc3RhdGljIGlubGluZSB2b2lkIHNldF9wdGUo
cHRlX3QgKnB0ZXAsIHB0ZV90IHB0ZXZhbCkKPiAgewo+ICAgICAgICAgKnB0ZXAgPSBwdGV2YWw7
Cj4gKwo+ICsgICAgICAgLyoKPiArICAgICAgICAqIE9ubHkgaWYgdGhlIG5ldyBwdGUgaXMgcHJl
c2VudCBhbmQga2VybmVsLCBvdGhlcndpc2UgVExCCj4gKyAgICAgICAgKiBtYWludGVuYW5jZSBv
ciB1cGRhdGVfbW11X2NhY2hlKCkgaGF2ZSB0aGUgbmVjZXNzYXJ5IGJhcnJpZXJzLgo+ICsgICAg
ICAgICovCj4gKyAgICAgICBpZiAocHRlX3ZhbChwdGV2YWwpICYgKF9QQUdFX1BSRVNFTlQgfCBf
UEFHRV9HTE9CQUwpKQo+ICsgICAgICAgICAgICAgICBSSVNDVl9GRU5DRShydyxydyk7Cj4gIH0K
Pgo+ICB2b2lkIGZsdXNoX2ljYWNoZV9wdGUocHRlX3QgcHRlKTsKPiAtLQo+IDIuNDAuMQo+CgoK
LS0gCkJlc3QgUmVnYXJkcwogR3VvIFJlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
