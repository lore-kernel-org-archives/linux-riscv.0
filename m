Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6D23C561E6
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Aug 2026 06:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=SE/hnqZqMlIzTKfxmU26ttMtwed75gXGv38TTm2Hs/o=; b=Insh/G9cngRLZg/eJQHNACR3z/
	GMR6sUwkGS3DIJcW61m2fqejJkwp6Ohn8oKqvUbYyhnTYzFSnliW8wrbSM+SBMw3werB/jQoDara3
	dPlA9slAOaSR2B/8tTe7HhsnJiMVanfgUxaN8tD+xxHYRPn1bJcnKEfhucAClh1ku/srMh+3EgzYZ
	fdJXyDEIVLVOOHjIB54J9ntqMow/SakptjSHqjpY6Ml0q41WVuhcIZ6HfXltLf7S3x/0Bsv2IpA5w
	nu/d8VwzAMLEpG3jThzl9fbpHIHjeX8RXLLYeG2FxEQ5MlRtKyR+eBY3Bk94Ys+iI0mzUDNARvU2A
	o6MSywRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrrNQ-00000005149-34J1;
	Thu, 06 Aug 2026 06:14:48 +0000
Received: from mail-pj1-x1047.google.com ([2607:f8b0:4864:20::1047])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrrNO-0000000511y-0rQv
	for linux-riscv@lists.infradead.org;
	Thu, 06 Aug 2026 06:14:47 +0000
Received: by mail-pj1-x1047.google.com with SMTP id 98e67ed59e1d1-38ec0f510a9so4030584a91.2
        for <linux-riscv@lists.infradead.org>; Wed, 05 Aug 2026 23:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785996884; x=1786601684; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bFzqH4xCVi7VLSbp83LQR7Sy3Yjk2atQ5O9h+mavTgs=;
        b=IH1z5iT0rYW7U6c7ZrhBlbOB9OCVJ/1tATDFZzj1+nFlbN/QhR1AA6SBvNdUCwEoGt
         0XyhNck377BW3bseFtyqxe4kOgsRDV0EXjekBKkumKTG7fIhmiytUUY11UwgVSzgPWht
         ZIzailnprMjNaiHzrcBCBMFifK/kb/sfWuW+9D/o2n+QLnkVB/2TA7UatYJg/faFqiWD
         qLnTmKcpVBrXP7TJjDKlpDduSWNdns+q7NqvHJfhEUEYs0lzm3oMBLQw6EpYRqHkoRfT
         4ofAYElMH4oTBQezG7L1Z/zqb3Hs6zTXxIQoNRqSiBnSh9eyqS6BrBRzWmKrQnscF/2n
         PV/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785996884; x=1786601684;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bFzqH4xCVi7VLSbp83LQR7Sy3Yjk2atQ5O9h+mavTgs=;
        b=OwsDYjSQmQZPVQzqxIyUcYqPX7kMVssjLvyP3srDJgqXCBzz/tBZBAXNa9OHrqNUFi
         3Sp+wt3+/dY3drhBqTt02Tm9mtlkxD6oc+uz6PW0Ryy5r5l+yEacYgi3nHvyp0KLyQtz
         45xQskhOBFKkBakhWqVynf9e3iBSs+ODJYr1af0+ocygRQAs1AQGgx5h+qHitL9H/7QV
         GlF6tOJRNh7MbNVWO6o2JXTTIBol2vKAXuBVQlhg6vedShwVzwDulBkWKhYeZdzuvmcO
         wEuShKzSgIpcq9YV0+2L7AetaoANepoM4RyOU/vGDaNEELWibOmlBpG1LQAKsyp8Wysx
         cRLQ==
X-Forwarded-Encrypted: i=1; AHgh+RpiAgpIlXglIaUJC5xwfcJH/qrfcthuuSi9w1sJoSuZhC8zbWBSDZUmsT1VmA06gE/9F/ie5jMR6opngA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3xrAYhTmZB9WJVgH9sIcOraAE2dqe6RgqlY0Xaai4mmtqHYYR
	oU84dbikbh6KwJ3yqgqyXbtFPcH1dQW9TisMNYIQOkDzrc1heFgB0T3C5SVLYyg7mikCE0AsGv7
	oFJlIfbWMbw==
X-Received: from pjyx15.prod.google.com ([2002:a17:90a:e30f:b0:38d:d40a:d192])
 (user=wfelipe job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4b87:b0:37f:c2a8:ce45
 with SMTP id 98e67ed59e1d1-3903c537d5fmr11343222a91.4.1785996884273; Wed, 05
 Aug 2026 23:14:44 -0700 (PDT)
Date: Thu,  6 Aug 2026 06:14:16 +0000
In-Reply-To: <20260806061429.474992-1-wfelipe@google.com>
Mime-Version: 1.0
References: <20260806061429.474992-1-wfelipe@google.com>
X-Mailer: git-send-email 2.55.0.654.g21b8a5bc05-goog
Message-ID: <20260806061429.474992-4-wfelipe@google.com>
Subject: [PATCH 3/3] init/Kconfig: make config INIT_ENV_ARG_LIMIT user-configurable
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
X-CRM114-CacheID: sfid-20260805_231446_248585_4B92D178 
X-CRM114-Status: GOOD (  11.46  )
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

SU5JVF9FTlZfQVJHX0xJTUlUIGlzIGRlZmluZWQgd2l0aG91dCBhIHByb21wdCBzdHJpbmcgKGBp
bnRgKSwgbWFraW5nIGl0CmEgaGlkZGVuIEtjb25maWcgc3ltYm9sIHRoYXQgZGVmYXVsdHMgdG8g
MzIgKG9yIDEyOCBmb3IgVU1MKSBhbmQgY2Fubm90CmJlIGNvbmZpZ3VyZWQgaW4gYG1ha2UgbWVu
dWNvbmZpZ2AuCgpOb3cgdGhhdCBDT05GSUdfQ09NTUFORF9MSU5FX1NJWkUgaXMgY29uZmlndXJh
YmxlIGFjcm9zcyBhbGwgYXJjaGl0ZWN0dXJlcywKdXNlcnMgd2hvIHNlbGVjdCBsYXJnZXIga2Vy
bmVsIGNvbW1hbmQgbGluZXMgKGUuZy4sIDQwOTYgYnl0ZXMpIG1heSBwYXNzCm1vcmUgdGhhbiAz
MiBjb21tYW5kLWxpbmUgYXJndW1lbnRzIG9yIGVudmlyb25tZW50IHZhcmlhYmxlcyAoYGZvbz1i
YXJgKSB0bwpgL3NiaW4vaW5pdGAuIElmIElOSVRfRU5WX0FSR19MSU1JVCByZW1haW5zIGhhcmRj
b2RlZCBhdCAzMiwgYW55IGFyZ3VtZW50CmFmdGVyIHRoZSAzMm5kIGlzIHNpbGVudGx5IGRyb3Bw
ZWQgd2hlbiB0aGUga2VybmVsIGV4ZWN1dGVzIGluaXQuCgpBZGQgYSBwcm9tcHQgc3RyaW5nICgi
TWF4aW11bSBudW1iZXIgb2Yga2VybmVsIGNvbW1hbmQgbGluZSBhcmd1bWVudHMiKSBhbmQKYSBg
cmFuZ2UgMzIgNDA5NmAgdG8gYGNvbmZpZyBJTklUX0VOVl9BUkdfTElNSVRgIHNvIHRoYXQgdXNl
cnMgY2FuCmNvbmZpZ3VyZSB0aGVpciBpbml0IGFyZ3VtZW50IGFuZCBlbnZpcm9ubWVudCB2YXJp
YWJsZSBsaW1pdCB3aGVuIG5lZWRlZCwKd2hpbGUgcHJlc2VydmluZyB0aGUgZXhpc3RpbmcgZGVm
YXVsdCBvZiAzMiBmb3Igc3RhbmRhcmQgYnVpbGRzLgoKT3JpZ2luYWxseS1ieTogTWFjaWVqIMW7
ZW5jenlrb3dza2kgPG1hemVAZ29vZ2xlLmNvbT4KU2lnbmVkLW9mZi1ieTogV2lsc29uIEZlbGlw
ZSBQZXJlaXJhIDx3ZmVsaXBlQGdvb2dsZS5jb20+Ci0tLQogaW5pdC9LY29uZmlnIHwgMyArKy0K
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS9pbml0L0tjb25maWcgYi9pbml0L0tjb25maWcKaW5kZXggZDQyYmI1NWNiMjE1Mi4uMjhj
MGYxZmIwMGViYiAxMDA2NDQKLS0tIGEvaW5pdC9LY29uZmlnCisrKyBiL2luaXQvS2NvbmZpZwpA
QCAtMjMxLDkgKzIzMSwxMCBAQCBjb25maWcgQlJPS0VOX09OX1NNUAogCWRlZmF1bHQgeQogCiBj
b25maWcgSU5JVF9FTlZfQVJHX0xJTUlUCi0JaW50CisJaW50ICJNYXhpbXVtIG51bWJlciBvZiBr
ZXJuZWwgY29tbWFuZCBsaW5lIGFyZ3VtZW50cyIKIAlkZWZhdWx0IDMyIGlmICFVTUwKIAlkZWZh
dWx0IDEyOCBpZiBVTUwKKwlyYW5nZSAzMiA0MDk2CiAJaGVscAogCSAgTWF4aW11bSBvZiBlYWNo
IG9mIHRoZSBudW1iZXIgb2YgYXJndW1lbnRzIGFuZCBlbnZpcm9ubWVudAogCSAgdmFyaWFibGVz
IHBhc3NlZCB0byBpbml0IGZyb20gdGhlIGtlcm5lbCBjb21tYW5kIGxpbmUuCi0tIAoyLjU1LjAu
NjU0LmcyMWI4YTViYzA1LWdvb2cKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
