Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0135C6FD1F
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 12:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nf5P+MwZ4kV+d+ULi5GNrV44anfEN/Ac9dNzJ+imWXE=; b=0qAQU9WJ6dlCSa
	KsBSlkjfPmCddk3sLZkgP5y1BP+MYWO4UwLZ02wNWsbKDsDz4p126fvZA3jU1wEyJkPkvfrDFENPr
	zPOyWJlydBUJRKMBzWF1cHaFOGcNlcrzuJnYkaGau/9yoN0jXCVL5dwgERzXRF5Raijjb8j0kbzky
	mYrYSn4+V9eCXOHcuGj4hhyB2/Y6PIU2gYzp8FBO9Kx0LDAkwoBPaBEfqLV3ioVlxNEVjg2GF//A7
	j1eYzP46SuxFdtTjAyieTYBPDFDkA3capYjQggSyDBa76y06k29zinJei4U+jefvHuXG96TX+Z2Un
	1Rn0Q+HHpOWJwNE+Yipw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqB7r-00000000I3B-0Vdo;
	Fri, 29 Mar 2024 12:14:27 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqB7m-00000000I1w-3Sxu
	for linux-riscv@lists.infradead.org;
	Fri, 29 Mar 2024 12:14:24 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a467d8efe78so240549766b.3
        for <linux-riscv@lists.infradead.org>; Fri, 29 Mar 2024 05:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vrull.eu; s=google; t=1711714461; x=1712319261; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MM8DGBGw5Z9hjdKjyp48iivo0mpxEJEAegbnu14CeWE=;
        b=oxscy77TpjKllNxaeF6aEPjWK5L+D/+m/SlTa7ezBTGGnTsia2Y41E4Og7BM54zO3P
         kWdaK1WegTXp18YvA6FJIHC/LR2bAz158U38GXOTPNqbVvjnaww8t+i4D967rk2c3+7R
         YNE9h7wrjP6+Fx8ETYwAZvTqVoJTTLTDZsUa1NDWAYNTXnQ4omPblKfSueWk/36Rnt7P
         zIJlu4G6XsF+wPq80nNWCJPzLHFTnhLgyXghBSiVbvHw36z2dFLt8V8DU4IIlYuCwT6Z
         zGMFwhU9uMo7LaGf7y1cNlRr6Hg2SFVftFqM0qOKxc260MvKpP+pgIZhG/BWQbrvb3TD
         7VDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711714461; x=1712319261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MM8DGBGw5Z9hjdKjyp48iivo0mpxEJEAegbnu14CeWE=;
        b=Fsq1gM7l5o4xEW5xUn5Vp/dJ6ZEFlSJpjYPWV0THeQLX/Uhx/MZaNE9dCJmK3bIaTl
         BIAQyHQjA42QWJ7sE2d7sZwysMUW0Jay8hU6T7cxBYWqEeYRhRm4YDCmldRqWmkcOHLt
         +uBulML1LRCUZWMfVLHCMdYmrkfZWvrBVZ/iuA3hNwrtp3iH1fs264amxZdNRFvS+jKc
         TUptACm7WV0cY7H6FeporFDs7H7A3vpG2QFVYBbLZluZElfNM4GPHkLQnpAVELfZEbWf
         52oFLpMRY1j8UysGQwz2ahcER78rJdXVSjP4PrEYA9nDdJYriz/+c77kmLDr6uWpKhUk
         0kKA==
X-Gm-Message-State: AOJu0Yy7+LOwNHsp3I1l0swDYRfmF1Zl6VvZ40ncIeJfB5auUz3K8KRM
	aPj8xfUguA9lyP6pWPiIg66BY9CmOU5z6MuWloNsouj0PYq5C2U4j2LVEb4GojScMUhT8Y0hqKU
	JVFg=
X-Google-Smtp-Source: AGHT+IGjk+7FS0PQw7yadwU7Pio5rAktvOsGQmrrPhehd2eEKH/hcBBSiPPq+/a13+sXkfYmw13KxA==
X-Received: by 2002:a17:907:703:b0:a4e:3892:1d0b with SMTP id xb3-20020a170907070300b00a4e38921d0bmr1240083ejb.27.1711714461012;
        Fri, 29 Mar 2024 05:14:21 -0700 (PDT)
Received: from antares.fritz.box (62-178-148-172.cable.dynamic.surfer.at. [62.178.148.172])
        by smtp.gmail.com with ESMTPSA id g16-20020a170906539000b00a46dd1f7dc1sm1869942ejo.92.2024.03.29.05.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 05:14:20 -0700 (PDT)
From: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Cooper Qu <cooper.qu@linux.alibaba.com>,
	Zhiwei Liu <zhiwei_liu@linux.alibaba.com>,
	Huang Tao <eric.huang@linux.alibaba.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor@kernel.org>,
	Qingfang Deng <dqfext@gmail.com>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>
Subject: [PATCH v2 2/2] riscv: T-Head: Test availability bit before enabling MAEE errata
Date: Fri, 29 Mar 2024 13:14:14 +0100
Message-ID: <20240329121414.688391-3-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240329121414.688391-1-christoph.muellner@vrull.eu>
References: <20240329121414.688391-1-christoph.muellner@vrull.eu>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_051422_901275_3B01B86C 
X-CRM114-Status: GOOD (  14.74  )
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

VC1IZWFkJ3MgTUFFRSBtZWNoYW5pc20gKG5vbi1jb21wYXRpYmxlIGVxdWl2YWxlbnQgb2YgUlZJ
J3MgU3ZwYm10KQppcyBjdXJyZW50bHkgYXNzdW1lZCBmb3IgYWxsIFQtSGVhZCBoYXJ0cy4gSG93
ZXZlciwgUUVNVSByZWNlbnRseQpkZWNpZGVkIHRvIGRyb3AgYWNjZXB0YW5jZSBvZiBndWVzdHMg
dGhhdCB3cml0ZSByZXNlcnZlZCBiaXRzIGluIFBURXMuCkFzIE1BRUUgdXNlcyByZXNlcnZlZCBi
aXRzIGluIFBURXMgYW5kIExpbnV4IGFwcGxpZXMgdGhlIE1BRUUgZXJyYXRhCmZvciBhbGwgVC1I
ZWFkIGhhcnRzLCB0aGlzIGJyb2tlIHRoZSBMaW51eCBzdGFydHVwIG9uIFFFTVUgZW11bGF0aW9u
cwpvZiB0aGUgQzkwNiBlbXVsYXRpb24uCgpUaGlzIHBhdGNoIGF0dGVtcHRzIHRvIGFkZHJlc3Mg
dGhpcyBpc3N1ZSBieSB0ZXN0aW5nIHRoZSBNQUVFIGJpdAppbiB0aGUgdGguc3hzdGF0dXMgQ1NS
LiBUaGlzIENTUiBpcyBhdmFpbGFibGUgaW4gSFcgYW5kIGNhbiBiZQplbXVsYXRlZCBpbiBRRU1V
LgoKVGhpcyBwYXRjaCBhbHNvIG1ha2VzIHRoZSBNQUVFIHByb2JpbmcgbWVjaGFuaXNtIHJlbGlh
YmxlLCBiZWNhdXNlCmEgdGVzdCBmb3IgdGhlIHJpZ2h0IGNvbWJpbmF0aW9uIG9mIG12ZW5kb3Jp
ZCwgbWFyY2hpZCwgYW5kIG1pbXBpZAppcyBub3Qgc3VmZmljaWVudCB0byBlbmFibGUgTUFFRS4K
ClNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBNw7xsbG5lciA8Y2hyaXN0b3BoLm11ZWxsbmVyQHZy
dWxsLmV1PgotLS0KIGFyY2gvcmlzY3YvZXJyYXRhL3RoZWFkL2VycmF0YS5jIHwgMTQgKysrKysr
KysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvZXJyYXRhL3RoZWFkL2VycmF0YS5jIGIvYXJjaC9y
aXNjdi9lcnJhdGEvdGhlYWQvZXJyYXRhLmMKaW5kZXggOGM4YThhNGIwNDIxLi5kZmEwMDcwMzky
MDggMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvZXJyYXRhL3RoZWFkL2VycmF0YS5jCisrKyBiL2Fy
Y2gvcmlzY3YvZXJyYXRhL3RoZWFkL2VycmF0YS5jCkBAIC0xOSw2ICsxOSw5IEBACiAjaW5jbHVk
ZSA8YXNtL3BhdGNoLmg+CiAjaW5jbHVkZSA8YXNtL3ZlbmRvcmlkX2xpc3QuaD4KIAorI2RlZmlu
ZSBDU1JfVEhfU1hTVEFUVVMJCTB4NWMwCisjZGVmaW5lIFNYU1RBVFVTX01BRUUJCV9BQygweDIw
MDAwMCwgVUwpCisKIHN0YXRpYyBib29sIGVycmF0YV9wcm9iZV9tYWVlKHVuc2lnbmVkIGludCBz
dGFnZSwKIAkJCSAgICAgIHVuc2lnbmVkIGxvbmcgYXJjaF9pZCwgdW5zaWduZWQgbG9uZyBpbXBp
ZCkKIHsKQEAgLTI4LDExICszMSwxNCBAQCBzdGF0aWMgYm9vbCBlcnJhdGFfcHJvYmVfbWFlZSh1
bnNpZ25lZCBpbnQgc3RhZ2UsCiAJaWYgKGFyY2hfaWQgIT0gMCB8fCBpbXBpZCAhPSAwKQogCQly
ZXR1cm4gZmFsc2U7CiAKLQlpZiAoc3RhZ2UgPT0gUklTQ1ZfQUxURVJOQVRJVkVTX0VBUkxZX0JP
T1QgfHwKLQkgICAgc3RhZ2UgPT0gUklTQ1ZfQUxURVJOQVRJVkVTX01PRFVMRSkKLQkJcmV0dXJu
IHRydWU7CisJaWYgKHN0YWdlICE9IFJJU0NWX0FMVEVSTkFUSVZFU19FQVJMWV9CT09UICYmCisJ
ICAgIHN0YWdlICE9IFJJU0NWX0FMVEVSTkFUSVZFU19NT0RVTEUpCisJCXJldHVybiBmYWxzZTsK
IAotCXJldHVybiBmYWxzZTsKKwlpZiAoIShjc3JfcmVhZChDU1JfVEhfU1hTVEFUVVMpICYgU1hT
VEFUVVNfTUFFRSkpCisJCXJldHVybiBmYWxzZTsKKworCXJldHVybiB0cnVlOwogfQogCiAvKgot
LSAKMi40NC4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
