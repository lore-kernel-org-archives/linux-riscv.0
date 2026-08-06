Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B00EC56208
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Aug 2026 06:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=nP7sxNk+0aPdTVlpighMuYNB8RNUGEa7nXm6QhrIf5Y=; b=dHp5gBNcaJVZQzHyDAb5TTs6Mn
	oCZ49bAvPfjcKHDz6IStsT8BEzomzYowpGwQA7RG4NpItl0OjPOJgPwHzP11uuk/3iLu9M/5ZTv1R
	szeFrjmt1pbk2DDN6PxLdpmrrvnZOiU6U2desvJn6IzI5xkgb2kDv1wyTdNEJuq3UDag27rFloAje
	9ivNTqSZxzQ/s5NU8VI3OSuTKedPHKCgy2r9hUcW7Lvv0l30p48Kv9oRU+lmq6Uhevu61QfR06qqM
	ncSBw7yYJcMqM18MTAK/flkg6bWfK2N3iIg2mh5y0T3yN0Rjdw1XrCPjP0gLLw+bzWtVNGab9BJh9
	Vt6ymdHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrrNN-0000000512I-2G8M;
	Thu, 06 Aug 2026 06:14:45 +0000
Received: from mail-pj1-x1048.google.com ([2607:f8b0:4864:20::1048])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrrNK-0000000510q-4C6j
	for linux-riscv@lists.infradead.org;
	Thu, 06 Aug 2026 06:14:44 +0000
Received: by mail-pj1-x1048.google.com with SMTP id 98e67ed59e1d1-38dd87656d3so2276126a91.2
        for <linux-riscv@lists.infradead.org>; Wed, 05 Aug 2026 23:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785996881; x=1786601681; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gz3BQ2fYyBKXfHfqnwVRQtDtnTfYUw4BfeW+CpBaGNw=;
        b=vyBZ/7gmALC0lwRYOGQoDHTjoqQZhXfHsvUAZeE/ofo3ghGoBEM3h4pPtSBDQTXxV1
         BYP4Qh2FZkM1mJMM/UG4iqX29LXjQXYzyKlrkA2S46L4yufBwxwPAuJ4H1GlbvINd12s
         gsVE7LHA7oRDd0w3KUtHl3psF51jzVYUbM/U5c82VLH3Oja057iIUWkryFA8ZQykZ4Hn
         +tqVbWIEV32RhCwwqTdOwtSsD0w5T39UWb09g8AY9/4spFLIOb1zT0IZw/BH4Fr0Sxuy
         5VHbpVIiPLyGfJjRGyuYd9zrKUpFQwe7X+K8yg0/JOltibwGrMen89DOXfasfJBqluRF
         cu3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785996881; x=1786601681;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gz3BQ2fYyBKXfHfqnwVRQtDtnTfYUw4BfeW+CpBaGNw=;
        b=VLI2WsRTGHOr3oQpZJ0zivBTh7lBCHNHLGKjiWCDdVKGAn+rRnv+yZAUeyJGZY5UuL
         mYD5+UeuQev/MvMp0/fu8IYmFYYnucLWVsAkS534LTnVM1qZZG/KxGK43Vy0rBRiuzqV
         CYZhJE9cS5rnMpK+Fwx8eQcRepgN2NYTK2KkLFpC2RWYd/AND/BcQ054BzuX/+85CVdB
         0CY9JyG7EIwXwKqr39URDyafFTRfHmEInlRH3aPojvUpA/U91JuF1Fh6AL93HHoVNKdG
         HUw9UxHsNOHoFgMR5S8V+jzdiAMOLHUUjoGKsYhXGuqSvTTbzf/AoHvxO9kX9c1JKO93
         0jaA==
X-Forwarded-Encrypted: i=1; AHgh+RrGkGWAClQ+7nxW3Mvpx3h7laubS9CoYxdHXbQccjlaeEs+U45XxgnTJIa9z8T2cXIJYfFDqA2szwnHBw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzBPUCFdMRYat1mSkuuKWB5o0Y4ENz0GKr2jfE4xlI5N6YMXYMA
	wQXTmgh7p6pqp1/qVhSshWJ6JwDUBCSSLOU+p3r1HLPmZKkExMBsF3j9MGDTKOIMTSKxAi0leJA
	qtXjqWMCTmA==
X-Received: from pjbmv17.prod.google.com ([2002:a17:90b:1991:b0:38e:74f4:7e63])
 (user=wfelipe job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2d50:b0:380:f34a:6ff1
 with SMTP id 98e67ed59e1d1-3903c5e0213mr12490257a91.17.1785996881120; Wed, 05
 Aug 2026 23:14:41 -0700 (PDT)
Date: Thu,  6 Aug 2026 06:14:14 +0000
In-Reply-To: <20260806061429.474992-1-wfelipe@google.com>
Mime-Version: 1.0
References: <20260806061429.474992-1-wfelipe@google.com>
X-Mailer: git-send-email 2.55.0.654.g21b8a5bc05-goog
Message-ID: <20260806061429.474992-2-wfelipe@google.com>
Subject: [PATCH 1/3] init/Kconfig: generalize config COMMAND_LINE_SIZE to all architectures
From: Wilson Felipe Pereira <wfelipe@google.com>
To: Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, linux-arch@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	Wilson Felipe Pereira <wfelipe@google.com>, 
	"=?UTF-8?q?Maciej=20=C5=BBenczykowski?=" <maze@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_231443_039782_5A2DD271 
X-CRM114-Status: GOOD (  12.16  )
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

Q3VycmVudGx5LCBvbmx5IHMzOTAgaGFzIHRoZSBhYmlsaXR5IHRvIGNvbmZpZ3VyZSB0aGUgbWF4
aW11bSBrZXJuZWwKY29tbWFuZCBsaW5lIHNpemUgdmlhIEtjb25maWcgKENPTkZJR19DT01NQU5E
X0xJTkVfU0laRSkuIE90aGVyCmFyY2hpdGVjdHVyZXMgZGVmaW5lIGEgaGFyZGNvZGVkIENPTU1B
TkRfTElORV9TSVpFIG1hY3JvIGluIHRoZWlyIHNldHVwLnNoCmhlYWRlcnMuCgpJbiBzb21lIHVz
ZSBjYXNlcywgc3VjaCBhcyBuZXRib290IGtlcm5lbHMsIHJvb3RmcyBjb25maWd1cmF0aW9ucywg
bGFyZ2VyCmluaXRyYW1mcyBzZXR1cHMsIHJlcXVpcmUgbGFyZ2VyIHNpemVzLiBXaGlsZSBmb3Ig
ZW1iZWRkZWQgd29ya2xvYWRzLCBpdApjYW4gYmUgcmVkdWNlZCB0byBzYXZlIG1lbW9yeS4KCk1v
dmUgY29uZmlnIENPTU1BTkRfTElORV9TSVpFIG91dCBvZiBhcmNoL3MzOTAvS2NvbmZpZyBhbmQg
aW50bwppbml0L0tjb25maWcgdW5kZXIgR2VuZXJhbCBzZXR1cCBzbyB0aGF0IGFsbCBhcmNoaXRl
Y3R1cmVzIGNhbiBjb25maWd1cmUKdGhlaXIgbWF4aW11bSBjb21tYW5kIGxpbmUgbGVuZ3RoLiBU
aGUgZGVmYXVsdCB2YWx1ZXMgd2VyZSBhZGRlZCB0byBrZWVwCnRoZSB2YWx1ZXMgdW5jaGFuZ2Vk
LgoKT3JpZ2luYWxseS1ieTogTWFjaWVqIMW7ZW5jenlrb3dza2kgPG1hemVAZ29vZ2xlLmNvbT4K
U2lnbmVkLW9mZi1ieTogV2lsc29uIEZlbGlwZSBQZXJlaXJhIDx3ZmVsaXBlQGdvb2dsZS5jb20+
Ci0tLQogYXJjaC9zMzkwL0tjb25maWcgfCAgOCAtLS0tLS0tLQogaW5pdC9LY29uZmlnICAgICAg
fCAxMiArKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgOCBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3MzOTAvS2NvbmZpZyBiL2FyY2gvczM5MC9L
Y29uZmlnCmluZGV4IDg0NDA0ZTY3NzhkNTAuLmY1NTM2ZTA0MmNlMjkgMTAwNjQ0Ci0tLSBhL2Fy
Y2gvczM5MC9LY29uZmlnCisrKyBiL2FyY2gvczM5MC9LY29uZmlnCkBAIC01MTEsMTQgKzUxMSw2
IEBAIGVuZGNob2ljZQogY29uZmlnIDY0QklUCiAJZGVmX2Jvb2wgeQogCi1jb25maWcgQ09NTUFO
RF9MSU5FX1NJWkUKLQlpbnQgIk1heGltdW0gc2l6ZSBvZiBrZXJuZWwgY29tbWFuZCBsaW5lIgot
CWRlZmF1bHQgNDA5NgotCXJhbmdlIDg5NiAxMDQ4NTc2Ci0JaGVscAotCSAgVGhpcyBhbGxvd3Mg
eW91IHRvIHNwZWNpZnkgdGhlIG1heGltdW0gbGVuZ3RoIG9mIHRoZSBrZXJuZWwgY29tbWFuZAot
CSAgbGluZS4KLQogY29uZmlnIFNNUAogCWRlZl9ib29sIHkKIApkaWZmIC0tZ2l0IGEvaW5pdC9L
Y29uZmlnIGIvaW5pdC9LY29uZmlnCmluZGV4IDEwZjIwMTNiNTMyMTYuLmQ0MmJiNTVjYjIxNTIg
MTAwNjQ0Ci0tLSBhL2luaXQvS2NvbmZpZworKysgYi9pbml0L0tjb25maWcKQEAgLTE1NjksNiAr
MTU2OSwxOCBAQCBjb25maWcgQk9PVF9DT05GSUdfRU1CRURfRklMRQogCSAgVGhpcyBib290Y29u
ZmlnIHdpbGwgYmUgdXNlZCBpZiB0aGVyZSBpcyBubyBpbml0cmQgb3Igbm8gb3RoZXIKIAkgIGJv
b3Rjb25maWcgaW4gdGhlIGluaXRyZC4KIAorY29uZmlnIENPTU1BTkRfTElORV9TSVpFCisJaW50
ICJNYXhpbXVtIHNpemUgb2Yga2VybmVsIGNvbW1hbmQgbGluZSIKKwlkZWZhdWx0IDQwOTYgaWYg
UzM5MCB8fCBMT09OR0FSQ0ggfHwgTUlQUyB8fCBVTQorCWRlZmF1bHQgMjA0OCBpZiBYODYgfHwg
QVJNNjQgfHwgUE9XRVJQQyB8fCBTUEFSQzY0CisJZGVmYXVsdCAxMDI0IGlmIEFSTSB8fCBQQVJJ
U0MgfHwgUklTQ1YKKwlkZWZhdWx0IDI1NiBpZiBBTFBIQSB8fCBBUkMgfHwgTTY4SyB8fCBNSUNS
T0JMQVpFIHx8IFNQQVJDMzIgfHwgWFRFTlNBCisJZGVmYXVsdCA1MTIKKwlyYW5nZSAyNTYgMTA0
ODU3NgorCWhlbHAKKwkgIFRoaXMgYWxsb3dzIHlvdSB0byBzcGVjaWZ5IHRoZSBtYXhpbXVtIGxl
bmd0aCBvZiB0aGUga2VybmVsIGNvbW1hbmQKKwkgIGxpbmUuCisKIGNvbmZpZyBDTURMSU5FX0xP
R19XUkFQX0lERUFMX0xFTgogCWludCAiTGVuZ3RoIHRvIHRyeSB0byB3cmFwIHRoZSBjbWRsaW5l
IHdoZW4gbG9nZ2VkIGF0IGJvb3QiCiAJZGVmYXVsdCAxMDIxCi0tIAoyLjU1LjAuNjU0LmcyMWI4
YTViYzA1LWdvb2cKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
