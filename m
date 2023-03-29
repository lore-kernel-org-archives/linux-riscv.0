Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64448C74A5B
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Mar 2023 04:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jyTjhjGOLseZxH8AQQMNYc6eciw0j2lDnqa5P2S03HI=; b=NoEdJdBrmnU0Ia
	GuKTAG8+8to/v+/a1KjSq7xKPjHuXUrorfzUmDNzlkT1yn/WrfHSoSxu8bg+4o52qxuW1b3tD7jR5
	p0tGI/GRF4sm7cMTtYxX/tOjo1xJ1TiQ7wj4tjBv8yoNo6fBuBlgk/kK2GHS1iGklhIwmhiH+/9TW
	BPcdEajkzxn4RBlsEwcRjTzRPRMWOz6/0wiueMk2QkAColZYCs4SsIJJbUd8nMEWGB+OfcOLcxTph
	mL7Jo05WB8ORPDTawXDgYfHazstYGaXs1P48oxsljnhht4/J/gvub4w9we8Ds/64emIeU7PkzT7I7
	Gq65Vn5kBS5YzrNJSzww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phNsX-00GcBf-2a;
	Wed, 29 Mar 2023 04:57:45 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phNsU-00GcAB-1t
	for linux-riscv@lists.infradead.org;
	Wed, 29 Mar 2023 04:57:43 +0000
Received: by mail-wm1-x32c.google.com with SMTP id n19so8133513wms.0
        for <linux-riscv@lists.infradead.org>; Tue, 28 Mar 2023 21:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1680065858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dDDQpcu4wlArU6dZYMfeUKSEQsg6b1kdryOeCUrFQlc=;
        b=VKRX5Tw8ADg3H3As96bXMjtA9WlMjtkGfL47ArT3E95iTfus7FSaAJlBDnfp920k7x
         PdemGUW/YeLJrVkn6J1yQZSUU28mxt+AhtJugWUcs2fm2mUKZ0SkjAwTFfxmYAHWaBh9
         34oXo9l0Qw8UjbcFYLjr6lPWCBQFUyc7ZMbeeKPlzhXYm2TxI9Zb/khVejjqkrAi2csd
         V36Yv1AqWNEsC+gGTi11hi+mhiFJz3StbOahvPtxZEULbxL//+Dp1E6LZNcu2MmWc2DD
         5/N1MLJY4bAjXif0FAnP0Jx1XJ+xrmLt5ZpihM+Ked2Iheb0vjcAMP+KOvbGX43nq5Gq
         mrXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680065858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dDDQpcu4wlArU6dZYMfeUKSEQsg6b1kdryOeCUrFQlc=;
        b=SdOAL/tlGfI1KD/KkzSFmxjhKCnHZUxK0RZbSX3mm0kDVC2PTR2g1AGDhGilQAnLw7
         KrbnGj/6mFBBYaSF8VaQakwa1lkqAoxCguhlhaSwv76NHbqbXd21P8VWh9i9nRWPIqD+
         l7XlsihF5MA4fPyQa5/jxl1qfcYo7dySs2kRykHtNQJPR+FxIr6PINgZfbTYNE3Hr00b
         yUptLzpg+1Obw5OsA+8AjjApVUo5V9e1oZOJOruJDZeBTe1akVGjz43Xm7HOYDx2DywP
         mDkzWR9EBpFT8DTSo+O/eL9yxN+CzkAzBQu8tuJ+wW7KRI3gdL8axPHJKIl9Ckz1gNYx
         f6Rg==
X-Gm-Message-State: AAQBX9elw2qgDZMwhsygPu4NZuM0MbrTFbrdh8WmfAK/FVPKT+XQgCPC
	iDrk85oQI9KS9FbAuzWrfUFKFw==
X-Google-Smtp-Source: AKy350Zwf3+/m0WcA/QJKFN+KuVJqUrDEjpA3YZZy+HJLAgtX0Af6zJPQfGj5nLRuIS4Y+NAhHLENw==
X-Received: by 2002:a05:600c:3789:b0:3ef:62cd:1ee with SMTP id o9-20020a05600c378900b003ef62cd01eemr11455074wmr.16.1680065858027;
        Tue, 28 Mar 2023 21:57:38 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id x19-20020a1c7c13000000b003ed1f111fdesm779942wmc.20.2023.03.28.21.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 21:57:37 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Nick Desaulniers <ndesaulniers@google.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kbuild@vger.kernel.org
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>
Subject: [PATCH v9 4/6] powerpc: Move script to check relocations at compile time in scripts/
Date: Wed, 29 Mar 2023 06:53:27 +0200
Message-Id: <20230329045329.64565-5-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230329045329.64565-1-alexghiti@rivosinc.com>
References: <20230329045329.64565-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_215742_629362_BABE68B2 
X-CRM114-Status: GOOD (  15.07  )
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

RnJvbTogQWxleGFuZHJlIEdoaXRpIDxhbGV4QGdoaXRpLmZyPgoKUmVsb2NhdGluZyBrZXJuZWwg
YXQgcnVudGltZSBpcyBkb25lIHZlcnkgZWFybHkgaW4gdGhlIGJvb3QgcHJvY2Vzcywgc28KaXQg
aXMgbm90IGNvbnZlbmllbnQgdG8gY2hlY2sgZm9yIHJlbG9jYXRpb25zIHRoZXJlIGFuZCByZWFj
dCBpbiBjYXNlIGEKcmVsb2NhdGlvbiB3YXMgbm90IGV4cGVjdGVkLgoKUG93ZXJwYyBhcmNoaXRl
Y3R1cmUgaGFzIGEgc2NyaXB0IHRoYXQgYWxsb3dzIHRvIGNoZWNrIGF0IGNvbXBpbGUgdGltZQpm
b3Igc3VjaCB1bmV4cGVjdGVkIHJlbG9jYXRpb25zOiBleHRyYWN0IHRoZSBjb21tb24gbG9naWMg
dG8gc2NyaXB0cy8Kc28gdGhhdCBvdGhlciBhcmNoaXRlY3R1cmVzIGNhbiB0YWtlIGFkdmFudGFn
ZSBvZiBpdC4KClNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleEBnaGl0aS5mcj4K
UmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CkFja2VkLWJ5OiBN
aWNoYWVsIEVsbGVybWFuIDxtcGVAZWxsZXJtYW4uaWQuYXU+IChwb3dlcnBjKQotLS0KIGFyY2gv
cG93ZXJwYy90b29scy9yZWxvY3NfY2hlY2suc2ggfCAxOCArKy0tLS0tLS0tLS0tLS0tLS0KIHNj
cmlwdHMvcmVsb2NzX2NoZWNrLnNoICAgICAgICAgICAgfCAyMCArKysrKysrKysrKysrKysrKysr
KwogMiBmaWxlcyBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkKIGNy
ZWF0ZSBtb2RlIDEwMDc1NSBzY3JpcHRzL3JlbG9jc19jaGVjay5zaAoKZGlmZiAtLWdpdCBhL2Fy
Y2gvcG93ZXJwYy90b29scy9yZWxvY3NfY2hlY2suc2ggYi9hcmNoL3Bvd2VycGMvdG9vbHMvcmVs
b2NzX2NoZWNrLnNoCmluZGV4IDYzNzkyYWYwMDQxNy4uNmIzNTBlNzUwMTRjIDEwMDc1NQotLS0g
YS9hcmNoL3Bvd2VycGMvdG9vbHMvcmVsb2NzX2NoZWNrLnNoCisrKyBiL2FyY2gvcG93ZXJwYy90
b29scy9yZWxvY3NfY2hlY2suc2gKQEAgLTE1LDIxICsxNSw4IEBAIGlmIFsgJCMgLWx0IDMgXTsg
dGhlbgogCWV4aXQgMQogZmkKIAotIyBIYXZlIEtidWlsZCBzdXBwbHkgdGhlIHBhdGggdG8gb2Jq
ZHVtcCBhbmQgbm0gc28gd2UgaGFuZGxlIGNyb3NzIGNvbXBpbGF0aW9uLgotb2JqZHVtcD0iJDEi
Ci1ubT0iJDIiCi12bWxpbnV4PSIkMyIKLQotIyBSZW1vdmUgZnJvbSB0aGUgYmFkIHJlbG9jYXRp
b25zIHRob3NlIHRoYXQgbWF0Y2ggYW4gdW5kZWZpbmVkIHdlYWsgc3ltYm9sCi0jIHdoaWNoIHdp
bGwgcmVzdWx0IGluIGFuIGFic29sdXRlIHJlbG9jYXRpb24gdG8gMC4KLSMgV2VhayB1bnJlc29s
dmVkIHN5bWJvbHMgYXJlIG9mIHRoYXQgZm9ybSBpbiBubSBvdXRwdXQ6Ci0jICIgICAgICAgICAg
ICAgICAgICB3IF9iaW5hcnlfX2J0Zl92bWxpbnV4X2Jpbl9lbmQiCi11bmRlZl93ZWFrX3N5bWJv
bHM9JCgkbm0gIiR2bWxpbnV4IiB8IGF3ayAnJDEgfiAvdy8geyBwcmludCAkMiB9JykKLQogYmFk
X3JlbG9jcz0kKAotJG9iamR1bXAgLVIgIiR2bWxpbnV4IiB8Ci0JIyBPbmx5IGxvb2sgYXQgcmVs
b2NhdGlvbiBsaW5lcy4KLQlncmVwIC1FICdcPFJfJyB8Ciske3NyY3RyZWV9L3NjcmlwdHMvcmVs
b2NzX2NoZWNrLnNoICIkQCIgfAogCSMgVGhlc2UgcmVsb2NhdGlvbnMgYXJlIG9rYXkKIAkjIE9u
IFBQQzY0OgogCSMJUl9QUEM2NF9SRUxBVElWRSwgUl9QUEM2NF9OT05FCkBAIC00NCw4ICszMSw3
IEBAIFJfUFBDX0FERFIxNl9MTwogUl9QUENfQUREUjE2X0hJCiBSX1BQQ19BRERSMTZfSEEKIFJf
UFBDX1JFTEFUSVZFCi1SX1BQQ19OT05FJyB8Ci0JKFsgIiR1bmRlZl93ZWFrX3N5bWJvbHMiIF0g
JiYgZ3JlcCAtRiAtdyAtdiAiJHVuZGVmX3dlYWtfc3ltYm9scyIgfHwgY2F0KQorUl9QUENfTk9O
RScKICkKIAogaWYgWyAteiAiJGJhZF9yZWxvY3MiIF07IHRoZW4KZGlmZiAtLWdpdCBhL3Njcmlw
dHMvcmVsb2NzX2NoZWNrLnNoIGIvc2NyaXB0cy9yZWxvY3NfY2hlY2suc2gKbmV3IGZpbGUgbW9k
ZSAxMDA3NTUKaW5kZXggMDAwMDAwMDAwMDAwLi4xMzdjNjYwNDk5ZjMKLS0tIC9kZXYvbnVsbAor
KysgYi9zY3JpcHRzL3JlbG9jc19jaGVjay5zaApAQCAtMCwwICsxLDIwIEBACisjIS9iaW4vc2gK
KyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIKKworIyBHZXQgYSBs
aXN0IG9mIGFsbCB0aGUgcmVsb2NhdGlvbnMsIHJlbW92ZSBmcm9tIGl0IHRoZSByZWxvY2F0aW9u
cworIyB0aGF0IGFyZSBrbm93biB0byBiZSBsZWdpdGltYXRlIGFuZCByZXR1cm4gdGhpcyBsaXN0
IHRvIGFyY2ggc3BlY2lmaWMKKyMgc2NyaXB0IHRoYXQgd2lsbCBsb29rIGZvciBzdXNwaWNpb3Vz
IHJlbG9jYXRpb25zLgorCitvYmpkdW1wPSIkMSIKK25tPSIkMiIKK3ZtbGludXg9IiQzIgorCisj
IFJlbW92ZSBmcm9tIHRoZSBwb3NzaWJsZSBiYWQgcmVsb2NhdGlvbnMgdGhvc2UgdGhhdCBtYXRj
aCBhbiB1bmRlZmluZWQKKyPCoHdlYWsgc3ltYm9sIHdoaWNoIHdpbGwgcmVzdWx0IGluIGFuIGFi
c29sdXRlIHJlbG9jYXRpb24gdG8gMC4KKyMgV2VhayB1bnJlc29sdmVkIHN5bWJvbHMgYXJlIG9m
IHRoYXQgZm9ybSBpbiBubSBvdXRwdXQ6CisjICIgICAgICAgICAgICAgICAgICB3IF9iaW5hcnlf
X2J0Zl92bWxpbnV4X2Jpbl9lbmQiCit1bmRlZl93ZWFrX3N5bWJvbHM9JCgkbm0gIiR2bWxpbnV4
IiB8IGF3ayAnJDEgfiAvdy8geyBwcmludCAkMiB9JykKKworJG9iamR1bXAgLVIgIiR2bWxpbnV4
IiB8CisJZ3JlcCAtRSAnXDxSXycgfAorCShbICIkdW5kZWZfd2Vha19zeW1ib2xzIiBdICYmIGdy
ZXAgLUYgLXcgLXYgIiR1bmRlZl93ZWFrX3N5bWJvbHMiIHx8IGNhdCkKLS0gCjIuMzcuMgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
