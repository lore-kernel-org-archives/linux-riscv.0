Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A40C43458
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Jul 2026 08:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Q1tx0stT958Lwl2xKyc6HFqtIkTK0SgAH5BiBXvVLSg=; b=RAbFCKn6MgC4zX
	aUqKBDCMg9X8Xn2EpY+qDYLmWTP5Q3nVbczJbcZAEaqsde/OkHs39uy5ENYVKpLRDynh9Uk+bm9Bp
	cPsVtl4povNc6fZYi2sNYGRhhrzYcosXGRjklqduZOerHZosgp2GsnVZp4ywjPPy2ni/9jF5mnhD0
	hdCCYKu8TTjd7Wb/5SsoiolbalW+kW8eoBQjMf0DbMV1szLhiBYToF+3qkZaGhJTZx7NLmenQJ5YE
	buQ+DVrg0Q81++miBS8u1v/ZKPZnRLFo9BFyG4p0aKbA87uoqac7hnhWHPk7TSLEl34lf9zkY12T6
	GT7/8sjzfLRJyPBWJjow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgINo-000000099G5-42b2;
	Sun, 05 Jul 2026 08:39:24 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgINm-000000099Ex-0jxo
	for linux-riscv@lists.infradead.org;
	Sun, 05 Jul 2026 08:39:24 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-493c83474ddso19075555e9.3
        for <linux-riscv@lists.infradead.org>; Sun, 05 Jul 2026 01:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783240760; x=1783845560; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K+ETHGSiohx0vpbbD7DSPe0/YRZrdLOm6Y1hu+YMerY=;
        b=Qd//klfs45itCgGpgS2iERAqvrO14d19G3Zgp6GGXPMbmNQYetA8KMM0iuvTW6L1bu
         y0ERZeWkdZl4frlFQle4JbqybJosepbo3pfhMAANM6JAt0NbpCYnGAFiMtXjWHYAD17A
         D6Ln0AhOVEudE2pUsLT/+9reCHDv8mqZBO+BPxScUYN06K/7Y/e2VOKH9AD+G3h5uz+u
         1zbfmV9TPRSiLGP1/yRW6xOD1VAZHiRTcnCeQBRowi/T8ButlotEgyP0UEXQ5yilh2dA
         f0KbzIeql8vbQZ2qpgeJXOTMQPNk9OJtlUKbi3s0iXNdhZO7v4NFhKQevIbOzy2Pr58l
         FUhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783240760; x=1783845560;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K+ETHGSiohx0vpbbD7DSPe0/YRZrdLOm6Y1hu+YMerY=;
        b=jRUUSdNikF2TvyNieU98zfDY28NUl044zqGv58Ijc666DegN9vC3xj1cHM8CXDcjvP
         zDFFHCpwid+KPBpqpjMFsd2VuOpL6XjewoaqDRs6JKOL0n8GYv4i4F0yXvvSqgLrupRF
         dzg9vcSZGxrfcMZPUe5doE9YLyJ4Xp83T7Rp1apHdDSOo7SFltCRzAmFtK3APcDnR9Pl
         hwfl3lgYhtz80LPK4udrI4/M2Xzr2EmhXTOF6ooOWC9ZrsEdodEtphmKncHGb0b+zmaS
         1kvZlR77N2K2Cq2XKaMR4v/TGW0R60YM2ovKp3xkfK8qeV7TkIdxRA1Bxm9NYQCYkO5N
         RHUQ==
X-Forwarded-Encrypted: i=1; AFNElJ/KqiSiYOO6QCfUbgy1FHBMCtMK6c+8R97IsSwzkZGaRkz2qFqBFfxNanpWON3/L0fFw8ltePMnu8H+zA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzf8r+ovORVkj1EPm8apK2GlTtd2QIkWrD6RzS2QsS/sIe2nWIy
	5NkDLNSzAe1RwRyOnChNQ1v5mZAORBkLqrG/eFYIqDKv3bsFrLMHk46fCTAbaZkZygU=
X-Gm-Gg: AfdE7clg8xTO8QDDv1gEtCaNsNptBEn4T2P6vhyrt1Iyl3d/X5q0ovNKfITMsySGk0X
	zhbiL9td7hM1w5aYriUqxlAkwWDK4lDa64bIUgT/ph/DumNVKmYB8QcMCYxtNCz6Q2zRLUTs9mj
	eFQVqu6ijiRwgUyf6pT3/dW8ap51/CL8Rt2dtLv6vpSVlBFspDKWeLKKkOi9JPzZ4WIzmSHrKjK
	q/Vx63CG6VruN3fMZ/A5uiWJKlCNCNpO2au5Pz1jEYW0qGtTVJBFvjrMvvBSeF5KUdltFpLUNJW
	fqfWABGS588hi0LPbQB/gOMpA7xjt00x0Ja7O8Bdq92GyUL6G++3QTp4yTx0gmOTJu9m8trb58v
	ZluJWz6JGT21lDRhukl6otkYdAbFiSOsOYwC0SNk/7RTo3EC4yJA7TZ5TzVN8XG1E7tUEn+S4bg
	EfA7WqnrR0bJ0OkKNYug==
X-Received: by 2002:a05:600c:4e11:b0:493:b549:3be0 with SMTP id 5b1f17b1804b1-493d11dd1d9mr66980765e9.17.1783240759206;
        Sun, 05 Jul 2026 01:39:19 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493bef1807asm258611905e9.1.2026.07.05.01.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 01:39:18 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: linux-pwm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Lubomir Rintel <lkundrak@v3.sk>,
	linux-arm-kernel@lists.infradead.org,
	Yixun Lan <dlan@kernel.org>,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH] pwm: pxa: Depend on OF and simplify accordingly
Date: Sun,  5 Jul 2026 10:39:08 +0200
Message-ID: <20260705083910.3502207-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2488; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=xcO7pe3BTmwOdzui6/X6iJz8mN0Rp2hw3KbCd40pQDo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqShguPRcS1zwcItJ0B2kpRagpct3lTujC6gVxy YGvluRc5buJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCakoYLgAKCRCPgPtYfRL+ ThdWB/9BzmNcPE8phy3T4E0fYQBt4FVzBOGD42JLah32QnkergVTmb+90x4tK7Ok6JGqgkImXxL Ib9yagywAKum0x1E4zsfA2wWhgU4UARE2m0caZDTD6IkiGLHRbk+mBTS/NOf4lybTWQGqkJqezO BUs563Y26XZb/fclva2hGk6i2cSdjvg8bXpWKoHV37tLMO5D5q18oWFq+Jxbwyj6LTntS2ENNOm Wy21tdilDqvLzrCWOFHT2VasjSEiI0GRcj/rMqYemLSf/f1IakmrGaPsi19B5KWM8euV9qn8P/N buKhv+7derzV/lsUKBsM/iXUXqYqXfYjm2eR+bPx5IPkk5Xd
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_013922_345955_D8E3C05E 
X-CRM114-Status: GOOD (  15.13  )
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

VGhlIFNvQ3MgdGhhdCB0aGlzIGRyaXZlciBhY3R1YWxseSB3b3JrcyBvbiBhbGwgaW1wbHkgT0Yg
YWxyZWFkeS4gKEFSTQpzZWxlY3RzIFVTRV9PRiB1bmxlc3Mgc29tZSBhcmNocyBhcmUgZW5hYmxl
ZCB0aGF0IGNhbm5vdCBiZSBzZWxlY3RlZAp0b2dldGhlciB3aXRoIEFSQ0hfUFhBIG9yIEFSQ0hf
TU1QLCBBUk02NCBhbmQgUklTQ1Ygc2VsZWN0IE9GLikKCldpdGggT0Yga25vd24gdG8gYmUgZW5h
YmxlZCBhIGZldyBjb25kaXRpb25hbHMgaW4gdGhlIGRyaXZlciBjYW4gYmUKc2ltcGxpZmllZC4K
ClNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIChUaGUgQ2FwYWJsZSBIdWIpIDx1Lmts
ZWluZS1rb2VuaWdAYmF5bGlicmUuY29tPgotLS0KSGVsbG8sCgp3aGlsZSBkb2luZyBhIHRyZWV3
aWRlIGNsZWFudXAgSSB3b25kZXJlZCBpZiB0aGVzZSBjb25kaXRpb25hbHMgYXJlCnJlbGV2YW50
IGF0IGFsbC4gQSBiaXQgb2YgcmVzZWFyY2ggZm91bmQgdGhleSBhcmUgbm90LiBXZSB3aWxsIGdl
dCBvdmVyCmxvc2luZyBjb21waWxlIGNvdmVyYWdlIGZvciBDT01QSUxFX1RFU1QgJiYgIU9GLgoK
QmVzdCByZWdhcmRzClV3ZQoKIGRyaXZlcnMvcHdtL0tjb25maWcgICB8ICAyICstCiBkcml2ZXJz
L3B3bS9wd20tcHhhLmMgfCAxMCArKy0tLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0
aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3B3bS9LY29uZmln
IGIvZHJpdmVycy9wd20vS2NvbmZpZwppbmRleCBlODg4NmE5YjY0ZDkuLjcyOTc3NjA4Njg3OSAx
MDA2NDQKLS0tIGEvZHJpdmVycy9wd20vS2NvbmZpZworKysgYi9kcml2ZXJzL3B3bS9LY29uZmln
CkBAIC01NjksNyArNTY5LDcgQEAgY29uZmlnIFBXTV9QQ0E5Njg1CiBjb25maWcgUFdNX1BYQQog
CXRyaXN0YXRlICJQWEEgUFdNIHN1cHBvcnQiCiAJZGVwZW5kcyBvbiBBUkNIX1BYQSB8fCBBUkNI
X01NUCB8fCBBUkNIX1NQQUNFTUlUIHx8IENPTVBJTEVfVEVTVAotCWRlcGVuZHMgb24gSEFTX0lP
TUVNCisJZGVwZW5kcyBvbiBIQVNfSU9NRU0gJiYgT0YKIAloZWxwCiAJICBHZW5lcmljIFBXTSBm
cmFtZXdvcmsgZHJpdmVyIGZvciBQWEEuCiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcHdtL3B3bS1w
eGEuYyBiL2RyaXZlcnMvcHdtL3B3bS1weGEuYwppbmRleCAxNTZjMGM3NGNkODAuLmM0ZDczYWNm
YWM0OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9wd20vcHdtLXB4YS5jCisrKyBiL2RyaXZlcnMvcHdt
L3B3bS1weGEuYwpAQCAtMTM2LDcgKzEzNiw2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcHdtX29w
cyBweGFfcHdtX29wcyA9IHsKIAkuYXBwbHkgPSBweGFfcHdtX2FwcGx5LAogfTsKIAotI2lmZGVm
IENPTkZJR19PRgogLyoKICAqIERldmljZSB0cmVlIHVzZXJzIG11c3QgY3JlYXRlIG9uZSBkZXZp
Y2UgaW5zdGFuY2UgZm9yIGVhY2ggUFdNIGNoYW5uZWwuCiAgKiBIZW5jZSB3ZSBkaXNwZW5zZSB3
aXRoIHRoZSBIQVNfU0VDT05EQVJZX1BXTSBhbmQgInRlbGwiIHRoZSBvcmlnaW5hbCBkcml2ZXIK
QEAgLTE1MSw5ICsxNTAsNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBwd21f
b2ZfbWF0Y2hbXSA9IHsKIAl7IH0KIH07CiBNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBwd21fb2Zf
bWF0Y2gpOwotI2Vsc2UKLSNkZWZpbmUgcHdtX29mX21hdGNoIE5VTEwKLSNlbmRpZgogCiBzdGF0
aWMgaW50IHB3bV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogewpAQCAtMTY1
LDcgKzE2MSw3IEBAIHN0YXRpYyBpbnQgcHdtX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYpCiAJc3RydWN0IHJlc2V0X2NvbnRyb2wgKnJzdDsKIAlpbnQgcmV0ID0gMDsKIAotCWlm
IChJU19FTkFCTEVEKENPTkZJR19PRikgJiYgaWQgPT0gTlVMTCkKKwlpZiAoaWQgPT0gTlVMTCkK
IAkJaWQgPSBvZl9kZXZpY2VfZ2V0X21hdGNoX2RhdGEoZGV2KTsKIAogCWlmIChpZCA9PSBOVUxM
KQpAQCAtMTkxLDkgKzE4Nyw3IEBAIHN0YXRpYyBpbnQgcHdtX3Byb2JlKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKnBkZXYpCiAJCXJldHVybiBQVFJfRVJSKHJzdCk7CiAKIAljaGlwLT5vcHMgPSAm
cHhhX3B3bV9vcHM7Ci0KLQlpZiAoSVNfRU5BQkxFRChDT05GSUdfT0YpKQotCQljaGlwLT5vZl94
bGF0ZSA9IG9mX3B3bV9zaW5nbGVfeGxhdGU7CisJY2hpcC0+b2ZfeGxhdGUgPSBvZl9wd21fc2lu
Z2xlX3hsYXRlOwogCiAJcGMtPm1taW9fYmFzZSA9IGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNv
dXJjZShwZGV2LCAwKTsKIAlpZiAoSVNfRVJSKHBjLT5tbWlvX2Jhc2UpKQoKYmFzZS1jb21taXQ6
IDJiNzYzZGIwYzI3NjNkNmJmNzNkN2QzZTY5NjY1MjIyZDFmMzc3Y2YKLS0gCjIuNTUuMC4xMS5n
MTUzNjY2YTdkOWJiCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
