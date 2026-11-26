Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C85606A31C
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 12:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SVq4M2Qs;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R1QTUOxC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=O7XOve+FWf/ellHz8tfTkGzs4gJSk6xlIbEEzeKG/iw=; b=SVq4M2QsTTooYQPYgVyy9LXE1r
	LGfTpxBc7qRvkIqjv+6g8s81uJcUrM+9Lc+9vpTVTPt7O/9C8u85WWpxI/pK6IRL0uJX4YgUMyci4
	DnPhQKecU38u7sZMKf5mR75s5Q5QT/MyBjinLRPBlx/jvXTCYZJjzB9SeNksofnOWYd9erAUVYesb
	1FN3lwIxgKw2GIlN15VcXPvDSZptgYkwtC5qOgVhPEVf0sUaTFKn3W3N65jKTaymlhOD5FGcefHIW
	bb0VesiEa/ape6PCXBzxgjKZNYNcEK14x76q+XYkiuS4HLcUgV9YxgWuAQZo7Ln5gNzgq0Fyh4Y4E
	cZRHrUlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWY9R-0000000D63C-2AIz;
	Thu, 26 Nov 2026 12:00:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWY9O-0000000D62h-3lKo
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 12:00:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7BFE2404AB;
	Thu, 26 Nov 2026 12:00:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D68481F000CA;
	Thu, 26 Nov 2026 12:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795694430;
	bh=/ONWCrPy0RVOfGMWQBZS7df1LPK5ZtI/y925do3hgoU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=R1QTUOxCmZ8uOQuqv3c3CjIhrB4japHBCOwZwCdQr/x54ft6K0ism6knpz8M/zXWc
	 v8PYU0KCFUmIkRFVTM1IxNhVKHl1Rnbq1xJbKTfLNE30PLlfHaOfo0NxHlXW+XlqM6
	 A5rAtepGXCL6LR1z+7L66EYLk4pDuU94we59R17AzVBd6oO/c3+FA6cf/9ejqil72K
	 +z+28qGgPoiVXDRoE0K4ZuKrKD6aTtzChXeVBDJvC9E9+o0hnZtQ7NcE5/c8q9iK9s
	 5WNckbShpku2UW2kIsdAuSaRHh8t0Yw8LQOTE7XN3eQOnglg0ClnFyVC5Cd6VIowB6
	 M5ZxTNcsODgHw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: FUJITA Tomonori <tomo@flapping.org>, fustini@kernel.org,
 guoren@kernel.org, ojeda@kernel.org, ukleinek@kernel.org, wefu@redhat.com
Cc: acourbot@nvidia.com, aliceryhl@google.com, bjorn3_gh@protonmail.com,
 boqun@kernel.org, chenhan0017.work@gmail.com, dakr@kernel.org,
 daniel.almeida@collabora.com, gary@garyguo.net,
 linux-riscv@lists.infradead.org, lossin@kernel.org,
 m.wilczynski@samsung.com, tamird@kernel.org, tmgross@umich.edu,
 work@onurozkan.dev, linux-pwm@vger.kernel.org,
 rust-for-linux@vger.kernel.org, FUJITA Tomonori
 <fujita.tomonori@gmail.com>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH v4 2/2] pwm: th1520: Fix 32-bit build with COMPILE_TEST
In-Reply-To: <20261118224826.2491684-3-tomo@flapping.org>
References: <20261118224826.2491684-1-tomo@flapping.org>
 <20261118224826.2491684-3-tomo@flapping.org>
Date: Thu, 26 Nov 2026 13:00:18 +0100
Message-ID: <87qzg7u7jh.fsf@t14s.mail-host-address-is-not-set>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

RlVKSVRBIFRvbW9ub3JpIDx0b21vQGZsYXBwaW5nLm9yZz4gd3JpdGVzOgoKPiBGcm9tOiBGVUpJ
VEEgVG9tb25vcmkgPGZ1aml0YS50b21vbm9yaUBnbWFpbC5jb20+Cj4KPiBGaXggdGhlIGZvbGxv
d2luZyBidWlsZCBlcnJvciBvbiAzMi1iaXQgQVJNIHdpdGggQ09NUElMRV9URVNUOgo+Cj4gICBF
UlJPUjogbW9kcG9zdDogZHJpdmVycy9wd20vcHdtX3RoMTUyMC5rbzogc3ltYm9sICdfX2FlYWJp
X3VsZGl2bW9kJyB1bmRlZmluZWQhCj4KPiBUaGUgZHJpdmVyIGRpdmlkZXMgdTY0IHZhbHVlcyB3
aGVuIGl0IGNvbnZlcnRzIGJldHdlZW4gbmFub3NlY29uZHMgYW5kCj4gY2xvY2sgY3ljbGVzLiBP
biAzMi1iaXQgQVJNLCB0aGVzZSBkaXZpc2lvbnMgYXJlIGNvbXBpbGVkIHRvIGNhbGxzIHRvCj4g
X19hZWFiaV91bGRpdm1vZCwgd2hpY2ggdGhlIGtlcm5lbCBkb2VzIG5vdCBwcm92aWRlLgo+Cj4g
VXNlIGRpdjY0X3U2NCgpIGFuZCBkaXY2NF91NjRfcm91bmRfdXAoKSBmb3IgdGhlc2UgZGl2aXNp
b25zLCBpbiB0aGUKPiBzYW1lIHdheSBhcyBDIGRyaXZlcnMgdXNlIGRpdjY0X3U2NCgpIGFuZCBE
SVY2NF9VNjRfUk9VTkRfVVAoKS4gVGhlCj4gcmVzdWx0cyBkbyBub3QgY2hhbmdlLgo+Cj4gRml4
ZXM6IDNjMTgwMDAzZGZmYiAoInB3bTogdGgxNTIwOiBGaXggbWlzc2luZyBLY29uZmlnIGRlcGVu
ZGVuY2llcyIpCj4gUmVwb3J0ZWQtYnk6IEFuZHJlYXMgSGluZGJvcmcgPGEuaGluZGJvcmdAa2Vy
bmVsLm9yZz4KPiBDbG9zZXM6IGh0dHBzOi8vcnVzdC1mb3ItbGludXguenVsaXBjaGF0LmNvbS8j
bmFycm93L2NoYW5uZWwvMjkxNTY1LUhlbHAvdG9waWMvNjRiaXQuMjBkaXZpc2lvbi4yMGluLjIw
LjYwcHdtX3RoMTUyMC4yRXJzLjYwL25lYXIvNjI2ODI1NTk5Cj4gU3VnZ2VzdGVkLWJ5OiBVd2Ug
S2xlaW5lLUvDtm5pZyA8dWtsZWluZWtAa2VybmVsLm9yZz4KPiBBY2tlZC1ieTogVXdlIEtsZWlu
ZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BiYXlsaWJyZS5jb20+Cj4gU2lnbmVkLW9mZi1ieTog
RlVKSVRBIFRvbW9ub3JpIDxmdWppdGEudG9tb25vcmlAZ21haWwuY29tPgoKUmV2aWV3ZWQtYnk6
IEFuZHJlYXMgSGluZGJvcmcgPGEuaGluZGJvcmdAa2VybmVsLm9yZz4KCkJlc3QgcmVnYXJkcywK
QW5kcmVhcyBIaW5kYm9yZwoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
