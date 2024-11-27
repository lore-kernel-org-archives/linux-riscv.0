Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D049D609CF
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Nov 2024 10:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LvM5VTQyILI9fiJj8hInbRsgZTO25O1Wdd166CFyMKE=; b=fm7cIWFYTEL40J
	mPDQqCEa1n6g6FuZoqCcRJk8dPDXI4mJ7a2Io9SXVf7B1fSAEiRaeA8OgHkDZPvgOjR44GRuC6Bzi
	L0C8VS1Dgaj9heFT79Hg3UHHb+wtQl1aN2FUu06iXHacQwgVJWU+fCoeYvSq/F+4lOangfSlaVIGa
	/VaV2JYDp/3mcBE9EAuGQ1jJGivwVg7R7YXHRvUHX40jnvwxuqaldj09iQJBd3Cw5KaAXN1KPmOpw
	GSykrzBKxii3HNVaLvSLsGDKaR63d4qQKfml8jz+9N8bI3Xz6MkM9xcBc5YI52I1snwYqI+9rO8+v
	lZG6kVprP66IGgAFzDVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGFJq-0000000Cqps-0uQk;
	Wed, 27 Nov 2024 10:30:50 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGFJR-0000000Cqj3-1hOH
	for linux-riscv@lists.infradead.org;
	Wed, 27 Nov 2024 10:30:26 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4349cc45219so32259245e9.3
        for <linux-riscv@lists.infradead.org>; Wed, 27 Nov 2024 02:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1732703423; x=1733308223; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mdmWojUkhwpwXLovz/kimDZeMrYf2eBrW2EF70Dlfbc=;
        b=lJ7677r4L6K70pnmC/5bbH87bGTFkrq0edtvwAcn1UfVZ+8dn5YNCAMHO6LgXl0pqy
         clwJ2MuQ0m035Zban5vLq6a57dFNSzVjxCWntWjf4z2E8Ha/e7xmnpxPMmQtCawzpxG3
         9OHmRtWbxTUr0H7FOOGuUHbOr6VNISx8U9iiRjidkSwRpMeZcXac6jf5FuJBWNgp0Q+x
         j4WmAS20Inuxl+MTYTjA9Bsu1+a96PYgRf3WOuyX2QSbVhvdhy19rzfb8mXrXIWzD0+f
         gXYtVdFQeZrhqBXqzWmKjSYFIiA7iwl3y6EsLUV00jOJXkmf0QgKg6ugMoiXKsMG6kQS
         nOsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732703423; x=1733308223;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mdmWojUkhwpwXLovz/kimDZeMrYf2eBrW2EF70Dlfbc=;
        b=RwCjwL8LVURa+tWFzhF/ZkOyXJDCZpjV//QQltSgAOrUG6y2ApHP/mZEUJlKhaDmUJ
         wzhaLZgJqq4EuEzC2PKQugGQd9sPeK4uP3+L4ivQ4leBGTfHxV7KVLYfa51w6mz7t5G0
         3jF0jjfrf5iZ4KtodagRHOAMSC1bo1GL6l0mvJA2+SlPX72w7dKlc0mr25l+h5UKxZU5
         o248fUa9hEONLpoJFHW6NyckB3fH1Bmz7HlR6yiKbLs7Rvl72QW9ZsUtCuvmyTy/Z09t
         WVNBt9j5ezun5IBzf9i0VGF1e23glzY3kBcS7HSLxA4mcWnS/plsG4L5T6j9o8izhLOR
         Dr3w==
X-Forwarded-Encrypted: i=1; AJvYcCXuRxKcjLcytXxTWCofTPwYXr2KBBS3cn0U2VjMPpm6w5GIy4jEQlaym3vvb2kuaEZ5bZOPG3r5DXiRvA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyDgqTLK8DoVLuCs9EO6WMolhkowfghccwZoPY5YgEWK72O+eGp
	XUaxHnyusW5e3r307qniHtEZZiyY8yZrsUiuH00RI6VATZ03nsLwVIg0DSbDh7I=
X-Gm-Gg: ASbGncv73UuSEkEhOmU2HI9fr7L5yuGx3f3wOiJx0qSeWWkFw7y9P7zj6es6xaqfZjy
	5X97IyWKIeJCQM2jneJroJ6XUhLsr0V0ykHTZt9ndgOdZWNvqp453ybtVbXT5kW8BLijRGwxHQo
	0Olg7TIcDLe2yA32syUrXEdIJwCzSmGDDFibIIwFYY0XUOxp7knTy4NzD+xJ6/BeX9UpSKdU9Qk
	At976Htl01dJumz2hxFJHYOAXm223ibfuBBtR/ypFcKojPj4QQ=
X-Google-Smtp-Source: AGHT+IF5IkFBTeO7XGVr/CEmevonfUf2d58+nLijve3eXN4jnhveTHhqS1Pg0SJtzoux/aBfgEgZRw==
X-Received: by 2002:a05:600c:3546:b0:431:4e82:ffa6 with SMTP id 5b1f17b1804b1-434a9de54b7mr20134735e9.24.1732703423049;
        Wed, 27 Nov 2024 02:30:23 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fafeceesm15947776f8f.37.2024.11.27.02.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 02:30:22 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	zhangkai@iscas.ac.cn
Subject: [PATCH] riscv: module: use a plain variable for list_head instead of a pointer
Date: Wed, 27 Nov 2024 11:30:14 +0100
Message-ID: <20241127103016.2699179-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_023025_602345_0119C6FD 
X-CRM114-Status: GOOD (  12.18  )
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

bGlzdF9oZWFkIGRvZXMgbm90IG5lZWQgdG8gYmUgYWxsb2NhdGVkLCBpdCBjYW4gYmUgYSBwbGFp
biB2YXJpYWJsZS4KUmVtb3ZlIHRoZSBwb2ludGVyIHdoaWNoIGFsbG93cyB0byBnZXQgcmlkIG9m
IHRoZSBhbGxvY2F0aW9uIGFzIHdlbGwgYXMKYW4gZXhpc3RpbmcgbWVtb3J5IGxlYWsuCgpTaWdu
ZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+CgotLS0KIGFy
Y2gvcmlzY3Yva2VybmVsL21vZHVsZS5jIHwgMTggKysrKy0tLS0tLS0tLS0tLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2tlcm5lbC9tb2R1bGUuYyBiL2FyY2gvcmlzY3Yva2VybmVsL21vZHVsZS5jCmlu
ZGV4IDFjZDQ2MWYzZDg3Mi4uNDdkMGViZWVjOTNjIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tl
cm5lbC9tb2R1bGUuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9tb2R1bGUuYwpAQCAtMjMsNyAr
MjMsNyBAQCBzdHJ1Y3QgdXNlZF9idWNrZXQgewogCiBzdHJ1Y3QgcmVsb2NhdGlvbl9oZWFkIHsK
IAlzdHJ1Y3QgaGxpc3Rfbm9kZSBub2RlOwotCXN0cnVjdCBsaXN0X2hlYWQgKnJlbF9lbnRyeTsK
KwlzdHJ1Y3QgbGlzdF9oZWFkIHJlbF9lbnRyeTsKIAl2b2lkICpsb2NhdGlvbjsKIH07CiAKQEAg
LTYzNCw3ICs2MzQsNyBAQCBwcm9jZXNzX2FjY3VtdWxhdGVkX3JlbG9jYXRpb25zKHN0cnVjdCBt
b2R1bGUgKm1lLAogCQkJbG9jYXRpb24gPSByZWxfaGVhZF9pdGVyLT5sb2NhdGlvbjsKIAkJCWxp
c3RfZm9yX2VhY2hfZW50cnlfc2FmZShyZWxfZW50cnlfaXRlciwKIAkJCQkJCSByZWxfZW50cnlf
aXRlcl90bXAsCi0JCQkJCQkgcmVsX2hlYWRfaXRlci0+cmVsX2VudHJ5LAorCQkJCQkJICZyZWxf
aGVhZF9pdGVyLT5yZWxfZW50cnksCiAJCQkJCQkgaGVhZCkgewogCQkJCWN1cnJfdHlwZSA9IHJl
bF9lbnRyeV9pdGVyLT50eXBlOwogCQkJCXJlbG9jX2hhbmRsZXJzW2N1cnJfdHlwZV0ucmVsb2Nf
aGFuZGxlcigKQEAgLTcwNCwxNiArNzA0LDcgQEAgc3RhdGljIGludCBhZGRfcmVsb2NhdGlvbl90
b19hY2N1bXVsYXRlKHN0cnVjdCBtb2R1bGUgKm1lLCBpbnQgdHlwZSwKIAkJCXJldHVybiAtRU5P
TUVNOwogCQl9CiAKLQkJcmVsX2hlYWQtPnJlbF9lbnRyeSA9Ci0JCQlrbWFsbG9jKHNpemVvZihz
dHJ1Y3QgbGlzdF9oZWFkKSwgR0ZQX0tFUk5FTCk7Ci0KLQkJaWYgKCFyZWxfaGVhZC0+cmVsX2Vu
dHJ5KSB7Ci0JCQlrZnJlZShlbnRyeSk7Ci0JCQlrZnJlZShyZWxfaGVhZCk7Ci0JCQlyZXR1cm4g
LUVOT01FTTsKLQkJfQotCi0JCUlOSVRfTElTVF9IRUFEKHJlbF9oZWFkLT5yZWxfZW50cnkpOwor
CQlJTklUX0xJU1RfSEVBRCgmcmVsX2hlYWQtPnJlbF9lbnRyeSk7CiAJCXJlbF9oZWFkLT5sb2Nh
dGlvbiA9IGxvY2F0aW9uOwogCQlJTklUX0hMSVNUX05PREUoJnJlbF9oZWFkLT5ub2RlKTsKIAkJ
aWYgKCFjdXJyZW50X2hlYWQtPmZpcnN0KSB7CkBAIC03MjIsNyArNzEzLDYgQEAgc3RhdGljIGlu
dCBhZGRfcmVsb2NhdGlvbl90b19hY2N1bXVsYXRlKHN0cnVjdCBtb2R1bGUgKm1lLCBpbnQgdHlw
ZSwKIAogCQkJaWYgKCFidWNrZXQpIHsKIAkJCQlrZnJlZShlbnRyeSk7Ci0JCQkJa2ZyZWUocmVs
X2hlYWQtPnJlbF9lbnRyeSk7CiAJCQkJa2ZyZWUocmVsX2hlYWQpOwogCQkJCXJldHVybiAtRU5P
TUVNOwogCQkJfQpAQCAtNzM1LDcgKzcyNSw3IEBAIHN0YXRpYyBpbnQgYWRkX3JlbG9jYXRpb25f
dG9fYWNjdW11bGF0ZShzdHJ1Y3QgbW9kdWxlICptZSwgaW50IHR5cGUsCiAJfQogCiAJLyogQWRk
IHJlbG9jYXRpb24gdG8gaGVhZCBvZiBkaXNjb3ZlcmVkIHJlbF9oZWFkICovCi0JbGlzdF9hZGRf
dGFpbCgmZW50cnktPmhlYWQsIHJlbF9oZWFkLT5yZWxfZW50cnkpOworCWxpc3RfYWRkX3RhaWwo
JmVudHJ5LT5oZWFkLCAmcmVsX2hlYWQtPnJlbF9lbnRyeSk7CiAKIAlyZXR1cm4gMDsKIH0KLS0g
CjIuNDUuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
