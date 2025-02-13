Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEB0BC02198
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Feb 2025 00:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EfVljra+A/b10lUR/y0GOeXSTnalFaOyiPizjR1A5f8=; b=vr4880DwslkDzZ
	EKSZ+VG9E5xw9nYRZkFHEymw/U12P2bMvk/lVGnUgtNgvgyBzHrKQNkTyplzafJ/NGp+GPwnJSDuQ
	yLBaOeTwBWFiH+xowk0webgpU06SgItXZQNhuCkjRNpsHFuwyfoliWgDe+PErCbpYF1Om9gTN+zGO
	ivwz3uQR0I+UD/Lhlaroas8CZLSNhqK5oO1+uj26zTTUm1Od7X6kbDpcibWd9C1HDg4TcYpTx/og9
	ilmfVUssPat3vuP2xAQVnKmKjfL9YTsV/X5WXNTmsilgc3JDN9M1xEq2P7h1oAeKADHVoZ01BPpE4
	g2xO7GyBsMcn1Aja4Klg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiNFv-00000009IbT-3U2P;
	Thu, 13 Feb 2025 00:39:03 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiNFt-00000009Ia6-047j
	for linux-riscv@lists.infradead.org;
	Thu, 13 Feb 2025 00:39:02 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-6dcdf23b4edso3340786d6.0
        for <linux-riscv@lists.infradead.org>; Wed, 12 Feb 2025 16:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739407140; x=1740011940; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BwWt+I1q21nIuXT9naaaYFBUTlLCTvDz09ET5qP1riw=;
        b=fe34bkfyMMrzz9r2NDxyuiE2bitul1cHRHlHYI5hvYC/AGUyodS9o6EkiTI6aleKCP
         svfSZEuyUvJ9+hfFS6PE/djXFHgJoMH47Yiu4l/yD1/6qE7ZHoVGr6zby5yE9B+f62b0
         XKFyuDJWj8SzXVdzjtpCpbgAts/xY2254de3kuq8NDURYzKJeQKUoj6y/hVXmtFGkpl1
         VL9PZVR2S0jbDAxBE0t1jo92IOtgF35AVkLnuD9/tHJxYhm+ZHUbHcJ5Om9SeLdOa3cV
         zol5U6SUrokPMCD1I7MVBsLySsnieENd3PjpE+JLpjgLIfyDGvmdzf74KUeMPumzhtF5
         +Lew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739407140; x=1740011940;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BwWt+I1q21nIuXT9naaaYFBUTlLCTvDz09ET5qP1riw=;
        b=p3GBEkTXmpoPeJ9SXevoaO7BNH1BXqqmDEkmQFR+XIJwAvH8SfoEqmzTA1aQ8oRpCB
         ie9JjZNEu+pSyaZxb5F8quR+xWvVRVTrNNj+T8mDCxTU5d7DDfwDx6yIufmz/3z3X42T
         rqTWEvxr7kPNe2gBNa8o4f9aVov5Yc9oAIWlwBjvplm2B6oMs7JsLJbMf9k/BwdcQTRw
         d7gqfRy9Z4ujbpaOBes+Ee97puu8d/zPBWAK6scTxdu3oGJIkfkKxSRZYuKHzEdzx4Zu
         Ebnaw7A7VM7kgv5J4vJ0cmo18TLRU3DDMCDxSxz6V0VA1HOgzMq+H/Mn8T4ol9cPvbOf
         twUA==
X-Forwarded-Encrypted: i=1; AJvYcCV/ZLQRfGXYve+UdzZ8jx/uFSu7Q51UO4gftRtNf5DXjOBao6eSZlo/qTG1J9it75C8csPg2pJjU0GsRA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxWsH0KEJ7gaYGEfS1KlDw7XOGmXdne5An3gXf51NJCieEi05ba
	IyEBINezIN1YxxzW5WvjVwfiooAyYu0w/fekBHOnGQ4fQ1l9uctg
X-Gm-Gg: ASbGnctf7VTLDwJIjMEgNZZLOV6L3uU52lAHS53UKcDQ9Dso83UFn86tvedbH4rg3m5
	kV/nK5WU0dy8WOpfnRH2VMaI/1E2orD2vAYHmMq79YHuOlJAS3gIybe5O8AVndY0eK2YAN4N9pP
	LxB0fiI8Xi63nfHxPrCGD6DDuEbur/6pOPSFpPOeF7xgMsOqBHJU85eJSxO5tJNmyCwgY+n25e5
	UinePhjfjEI+pxJPynagfYfj/Umy46AvcjIzb+uzXSynRUvW4snNU8F5uG/wzPx3zg=
X-Google-Smtp-Source: AGHT+IHHLL9ioBnDiGzkp+YhmlUcXtvqasDdyzPDZX4jep5Ey+c2ghcL5FH1R5QcGMY236A6mcEUuQ==
X-Received: by 2002:a05:6214:410:b0:6d8:9b20:64e8 with SMTP id 6a1803df08f44-6e46ed82f7fmr97469676d6.10.1739407139724;
        Wed, 12 Feb 2025 16:38:59 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e65d9f3498sm1406996d6.84.2025.02.12.16.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 16:38:59 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Jesse Taube <jesse@rivosinc.com>,
	Andy Chiu <andybnac@gmail.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Yu Chien Peter Lin <peterlin@andestech.com>,
	Samuel Holland <samuel.holland@sifive.com>
Cc: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v4 0/3] riscv: Add bfloat16 instruction support
Date: Thu, 13 Feb 2025 08:38:44 +0800
Message-ID: <20250213003849.147358-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_163901_052884_9EB2326E 
X-CRM114-Status: UNSURE (   7.31  )
X-CRM114-Notice: Please train this message.
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

QWRkIGRlc2NyaXB0aW9uIGZvciB0aGUgQkZsb2F0MTYgcHJlY2lzaW9uIEZsb2F0aW5nLVBvaW50
IElTQSBleHRlbnNpb24sCihaZmJmbWluLCBadmZiZm1pbiwgWnZmYmZ3bWEpLiB3aGljaCB3YXMg
cmF0aWZpZWQgaW4gY29tbWl0IDRkYzIzZDYyCigiQWRkZWQgQ2hhcHRlciB0aXRsZSB0byBCRjE2
Iikgb2YgdGhlIHJpc2N2LWlzYS1tYW51YWwuCgpDaGFuZ2VkIGZyb20gdjM6CjEuIHJlYmFzZSBm
b3IgdjYuMTQtcmMxCjIuIHBhdGNoMjogYWRkIHZhbGlkYXRlIGZvciB6ZmJmbWluLCB6dmZiZm1p
biwgenZmYmZ3bWEKMy4gcGF0Y2gyOiBhcHBseSBDbMOpbWVudCdzIHRhZwoKQ2hhbmdlZCBmcm9t
IHYyOgoxLiByZWJhc2UgZm9yIHY2LjEzLXJjMQoKQ2hhbmdlZCBmcm9tIHYxOgoxLiBwYXRjaDM6
IGFkZCBtaXNzaW5nIGNvZGUgaW4gc3lzX2h3cHJvYmUuYwoKSW5vY2hpIEFtYW90byAoMyk6CiAg
ZHQtYmluZGluZ3M6IHJpc2N2OiBhZGQgYmZsb2F0MTYgSVNBIGV4dGVuc2lvbiBkZXNjcmlwdGlv
bgogIHJpc2N2OiBhZGQgSVNBIGV4dGVuc2lvbiBwYXJzaW5nIGZvciBiZmxvYXQxNiBJU0EgZXh0
ZW5zaW9uCiAgcmlzY3Y6IGh3cHJvYmU6IGV4cG9ydCBiZmxvYXQxNiBJU0EgZXh0ZW5zaW9uCgog
RG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0ICAgICAgICAgIHwgMTIgKysrKysK
IC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbCB8IDQ1ICsrKysr
KysrKysrKysrKysrKysKIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaCAgICAgICAgICAg
ICAgICB8ICAzICsrCiBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oICAgICAg
ICAgfCAgMyArKwogYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jICAgICAgICAgICAgICAg
IHwgMzUgKysrKysrKysrKysrKysrCiBhcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jICAg
ICAgICAgICAgICAgfCAgMyArKwogNiBmaWxlcyBjaGFuZ2VkLCAxMDEgaW5zZXJ0aW9ucygrKQoK
LS0KMi40OC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
