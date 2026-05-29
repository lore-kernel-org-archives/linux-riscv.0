Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C3ECD6E4C
	for <linux-riscv@archiver.kernel.org>; Fri, 29 May 2026 10:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RdjnQj319Zo/nRh5led/YpKlFdOt0yTfaeDmjoT/rfs=; b=lV7jeM0ohxpWgk
	TRJTRfbOrl7hN0OB6qacb/AueCE/sFvwdVDvSKRAH3HbUKsKKnEgPnuVC5POmDqQ2w0x3S75pLnLR
	3NZnCOSxIyzRjLzgU7H7WAG1ph2kiZuSAdxdNquP1dwRI8+PYipFFfEhimOhhLYhtNh+aF9H2Vt0v
	606DLYMatZwTNJYnriHdlQZY18pA2TLT18QG8GvErOUHnh3IcaFkEUWbxKo4pBb2cVshKS1QvqUB0
	1vDAiqE/XUgEwwMPiXpCGrwKqcx+TXQLRQ4XERVvEBMTwZQQJSqdSj7MXwqGZMlzz57uvgflR1IkZ
	hYKdTXsPZyh5DAj0LAeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSuId-00000007AGj-3hWl;
	Fri, 29 May 2026 10:18:43 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSuIb-00000007AF6-07Ob
	for linux-riscv@lists.infradead.org;
	Fri, 29 May 2026 10:18:42 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-44e1860558fso8569468f8f.0
        for <linux-riscv@lists.infradead.org>; Fri, 29 May 2026 03:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1780049919; x=1780654719; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gRuenZrko78jZddy0UFWO+BRki0zaXyQrkNHtJpBvQk=;
        b=EIgyBmN5mQbSQzbjZwles/c5C6KLqQRi8ZfZERzbMtllYrg9hkoNLIrG84mQYiqrWB
         +llBAeOSUi7PtmeCTG4piQDNvVCfHDIRwdFXCoX62WFKOJ+jJdMddqvdf0gJANLNqqb2
         qdTocqAU2d+7dV0u3HIbjmIudU0N3zbblNj4SwrTnIKxk6/qW9FQO7PvY9g9ZZQqEUD1
         FHeHcDsKIhcHBjVSxP/NNmMXkbQQh8g1nciCuk/pbu/FaYQOAh192njJdf8lHZIKteVI
         RDbsclQ+O7VxQ9LodoLcPG3qhDuA+yZInJfh1SXt4EayK3xfcG4T2tmZd0AY1mpcgupn
         RyUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780049919; x=1780654719;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gRuenZrko78jZddy0UFWO+BRki0zaXyQrkNHtJpBvQk=;
        b=I1dRW+Y9/Y7yeNOpO6ug6plZTVkENblKyo1DjTVCl/+FllRaPLQHCBGMk188hliChZ
         63AKNPkmkhtXm2X+RvP3ju/jzmi1bs041Xdu/oZB60avZ5TBLObQ4tnFwlygQ3Sz+wXX
         y1fZ9gQ/H95F+A1s6Vsz97efSxTeBDsKwRg56Lpy9D7ydHsxSQ12Ypgmgt8oUwPyfIly
         AzTAdxhSmBrzx2pB5uqzv6yaEf8Q8XVxT5L3IsllKUsNxaeHPoA7tWcAyT/EomEEa9Aw
         TcCmDYkCiYtELXlfriADlsXaZnDiOruZESsO6JZcxsejz0PhmqXPFgSc2SBSSCoX6AaP
         SJkg==
X-Forwarded-Encrypted: i=1; AFNElJ9eMSdpEwiRpYNnGaVyuoS55RQoP/5CfgY1zkCmtqd1MpBws6Dr3msxp1+Ek0+K1loM8v4p1av2zA74WA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx178EKRJ0HTOSJhCHePraJa2x4LTnbyOcTyl1GsuBQRyhEIOwC
	PYajUo3pZlEYGsQlbI5ScE+SVxr6DsWjgRbTw6WOr6SWdizHiiG4Pf7z+DyxJSxpYSA=
X-Gm-Gg: Acq92OEn6lErKwzL3mebjVKtV97BXNWN1t7epd7rr3zqypVb8NOnIahWuA0B64zk+9Q
	ufVp9SMOcCaXiVHK/WQr4pPYYVB+2iKNTx5kDDlkNSw3ILE0Q5Nk3VGisHcax3e0Orj1h0umC/5
	YgKXqDQrEobxelNWWeQfc5MooEdCUWzMNmj/OHtoKZ5UZWkGZW+vnIjARBXZ/lpf5usVVZPeq0H
	mrR8plBdYyrkywz5IGhg2eE4oggZtYyUAFjBobY8nrjgUVVqtXL+8ltfqRWH/R4h+L7U9gXqQwX
	dCGwM7Vv39yJJxB8Bl0gKO2OaXs3H/CTnJ5yiS3Tydma2ATRcgmsEdr30Hp3gzLz/3qP3ycv5HI
	HsDEwn5VTuIQFNFO3XwnxpvNabxt9UKMPdMdM7fYshj/rrNdY0xNzO8zHuHP03+3I5UxldhK4yn
	sjPInKQYmBFPtOrypo2OwZbVydD4jaBkonpFWyhmO1G+M/s3Q1s1GcAWKD5kBO/1BbT2spfiPCG
	ihViiAB8EE0QQRtgT8Rq06ExA==
X-Received: by 2002:a5d:6f03:0:b0:45e:ef4a:8192 with SMTP id ffacd0b85a97d-45ef14aeca6mr4456766f8f.38.1780049919017;
        Fri, 29 May 2026 03:18:39 -0700 (PDT)
Received: from localhost (p200300f65f47db043f932d8b97293bf6.dip0.t-ipconnect.de. [2003:f6:5f47:db04:3f93:2d8b:9729:3bf6])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-45ef354cd7csm2359192f8f.18.2026.05.29.03.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 03:18:38 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Sebastian Reichel <sre@kernel.org>
Cc: Kuan-Wei Chiu <visitorckw@gmail.com>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	=?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Hans de Goede <hansg@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
	Purism Kernel Team <kernel@puri.sm>,
	Yixun Lan <dlan@kernel.org>,
	Andreas Kemnade <andreas@kemnade.info>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Amit Sunil Dhamne <amitsd@google.com>,
	Samuel Kayode <samkay014@gmail.com>,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	asahi@lists.linux.dev,
	imx@lists.linux.dev,
	Chen-Yu Tsai <wens@kernel.org>
Subject: [PATCH v1 0/6] power: Use named initializers for platform_device_id arrays
Date: Fri, 29 May 2026 12:18:15 +0200
Message-ID: <cover.1780048925.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5698; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=HR0BG2x5gStI8qVvDgUBsjfK17M95+4vrnDaD2QTsYk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqGWfoDIuZ0g/W2ypE62dFHULfUWoyzPSByuJOy zumyQmeqqeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCahln6AAKCRCPgPtYfRL+ TsKPB/9mAyfp+pLZiIDxZa/Gq+SSHanqJrTQwpZ9rQFWh6BTlVwAzfy9/iK3DTaEC0m73vbGFfQ SrrV9RH9jd6SuuSNJEy+P030qdvrNgwnqe9+Kw6h9Ox1Xf/WbmVgbFqiAvBlC9bWaxNYlaSXA6b k6D0JHKSjZPpHgGWSl8de58GW9wTOhD4G7APcHqvig2ElcuxKXGEJMbDiI5C+wM6c/uNZYGDKQH Gyln8usdt6LIe+L24f+S0WZZOkN5b75oBqE1U4SirbgWSV0oQR/VgR5R3MVvLMMrmyqPiFaaawD fWqFsf8PmmOgcfZvBQ4ZGzTElp/ezMarN1H6m653QUtXR1kb
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_031841_127874_21EC3A34 
X-CRM114-Status: GOOD (  23.04  )
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

SGVsbG8sCgp0aGlzIHNlcmllcyB0YXJnZXRzIHRvIHVzZSBuYW1lZCBpbml0aWFsaXplcnMgZm9y
IHBsYXRmb3JtX2RldmljZV9pZAphcnJheXMuIEluIGdlbmVyYWwgdGhlc2UgYXJlIGJldHRlciBy
ZWFkYWJsZSBmb3IgaHVtYW5zIGFuZCBtb3JlIHJvYnVzdAp0byBjaGFuZ2VzIGluIHRoZSByZXNw
ZWN0aXZlIHN0cnVjdCBkZWZpbml0aW9uLgoKVGhpcyByb2J1c3RuZXNzIGlzIG5lZWRlZCBhcyBJ
IHdhbnQgdG8gZG8KCglkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9tb2RfZGV2aWNldGFibGUu
aCBiL2luY2x1ZGUvbGludXgvbW9kX2RldmljZXRhYmxlLmgKCS0tLSBhL2luY2x1ZGUvbGludXgv
bW9kX2RldmljZXRhYmxlLmgKCSsrKyBiL2luY2x1ZGUvbGludXgvbW9kX2RldmljZXRhYmxlLmgK
CUBAIC02MTAsNCArNjEwLDcgQEAgc3RydWN0IGRtaV9zeXN0ZW1faWQgewoJIHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2VfaWQgewoJCWNoYXIgbmFtZVtQTEFURk9STV9OQU1FX1NJWkVdOwoJLQlrZXJu
ZWxfdWxvbmdfdCBkcml2ZXJfZGF0YTsKCSsJdW5pb24gewoJKwkJa2VybmVsX3Vsb25nX3QgZHJp
dmVyX2RhdGE7CgkrCQljb25zdCB2b2lkICpkcml2ZXJfZGF0YV9wdHI7CgkrCX07CgkgfTsKCndo
aWNoIGFsbG93cyBkcm9wcGluZyBzZXZlcmFsIGNhc3RzIGFuZCBlYXNlcyBwb3J0aW5nIENIRVJJ
IHRvIG1haW5saW5lCmxpbnV4LiBBIHBvc3NpYmxlIGZvbGxvdy11cCBjaGFuZ2UgaXMgdGhlIGZv
bGxvd2luZyBleGFtcGxlOgoKCWRpZmYgLS1naXQgYS9kcml2ZXJzL2dwaW8vZ3Bpby1weGEuYyBi
L2RyaXZlcnMvZ3Bpby9ncGlvLXB4YS5jCglpbmRleCA1ZDYxMDUzZTA1OTYuLjAzYmM4ZTg1OWQ3
MyAxMDA2NDQKCS0tLSBhL2RyaXZlcnMvZ3Bpby9ncGlvLXB4YS5jCgkrKysgYi9kcml2ZXJzL2dw
aW8vZ3Bpby1weGEuYwoJQEAgLTUzNCw3ICs1MzQsNyBAQCBzdGF0aWMgc3RydWN0IGlycV9jaGlw
IHB4YV9tdXhlZF9ncGlvX2NoaXAgPSB7Cgkgc3RhdGljIGludCBweGFfZ3Bpb19udW1zKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCgkgewoJCWNvbnN0IHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2VfaWQgKmlkID0gcGxhdGZvcm1fZ2V0X2RldmljZV9pZChwZGV2KTsKCS0Jc3RydWN0IHB4YV9n
cGlvX2lkICpweGFfaWQgPSAoc3RydWN0IHB4YV9ncGlvX2lkICopaWQtPmRyaXZlcl9kYXRhOwoJ
KwlzdHJ1Y3QgcHhhX2dwaW9faWQgKnB4YV9pZCA9IGlkLT5kcml2ZXJfZGF0YV9wdHI7CgkJaW50
IGNvdW50ID0gMDsKCSAKCQlzd2l0Y2ggKHB4YV9pZC0+dHlwZSkgewoJQEAgLTcwOCwxNCArNzA4
LDE0IEBAIHN0YXRpYyBpbnQgcHhhX2dwaW9fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikKCSB9CgkgCgkgc3RhdGljIGNvbnN0IHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2VfaWQgZ3Bp
b19pZF90YWJsZVtdID0gewoJLQl7IC5uYW1lID0gInB4YTI1eC1ncGlvIiwJLmRyaXZlcl9kYXRh
ID0gKHVuc2lnbmVkIGxvbmcpJnB4YTI1eF9pZCB9LAoJLQl7IC5uYW1lID0gInB4YTI2eC1ncGlv
IiwJLmRyaXZlcl9kYXRhID0gKHVuc2lnbmVkIGxvbmcpJnB4YTI2eF9pZCB9LAoJLQl7IC5uYW1l
ID0gInB4YTI3eC1ncGlvIiwJLmRyaXZlcl9kYXRhID0gKHVuc2lnbmVkIGxvbmcpJnB4YTI3eF9p
ZCB9LAoJLQl7IC5uYW1lID0gInB4YTN4eC1ncGlvIiwJLmRyaXZlcl9kYXRhID0gKHVuc2lnbmVk
IGxvbmcpJnB4YTN4eF9pZCB9LAoJLQl7IC5uYW1lID0gInB4YTkzeC1ncGlvIiwJLmRyaXZlcl9k
YXRhID0gKHVuc2lnbmVkIGxvbmcpJnB4YTkzeF9pZCB9LAoJLQl7IC5uYW1lID0gIm1tcC1ncGlv
IiwJCS5kcml2ZXJfZGF0YSA9ICh1bnNpZ25lZCBsb25nKSZtbXBfaWQgfSwKCS0JeyAubmFtZSA9
ICJtbXAyLWdwaW8iLAkJLmRyaXZlcl9kYXRhID0gKHVuc2lnbmVkIGxvbmcpJm1tcDJfaWQgfSwK
CS0JeyAubmFtZSA9ICJweGExOTI4LWdwaW8iLAkuZHJpdmVyX2RhdGEgPSAodW5zaWduZWQgbG9u
ZykmcHhhMTkyOF9pZCB9LAoJKwl7IC5uYW1lID0gInB4YTI1eC1ncGlvIiwJLmRyaXZlcl9kYXRh
X3B0ciA9ICZweGEyNXhfaWQgfSwKCSsJeyAubmFtZSA9ICJweGEyNngtZ3BpbyIsCS5kcml2ZXJf
ZGF0YV9wdHIgPSAmcHhhMjZ4X2lkIH0sCgkrCXsgLm5hbWUgPSAicHhhMjd4LWdwaW8iLAkuZHJp
dmVyX2RhdGFfcHRyID0gJnB4YTI3eF9pZCB9LAoJKwl7IC5uYW1lID0gInB4YTN4eC1ncGlvIiwJ
LmRyaXZlcl9kYXRhX3B0ciA9ICZweGEzeHhfaWQgfSwKCSsJeyAubmFtZSA9ICJweGE5M3gtZ3Bp
byIsCS5kcml2ZXJfZGF0YV9wdHIgPSAmcHhhOTN4X2lkIH0sCgkrCXsgLm5hbWUgPSAibW1wLWdw
aW8iLAkJLmRyaXZlcl9kYXRhX3B0ciA9ICZtbXBfaWQgfSwKCSsJeyAubmFtZSA9ICJtbXAyLWdw
aW8iLAkJLmRyaXZlcl9kYXRhX3B0ciA9ICZtbXAyX2lkIH0sCgkrCXsgLm5hbWUgPSAicHhhMTky
OC1ncGlvIiwJLmRyaXZlcl9kYXRhX3B0ciA9ICZweGExOTI4X2lkIH0sCgkJeyB9CgkgfTsKIApp
bmNyZWFzaW5nIHJlYWRhYmlsaXR5IGR1ZSB0byBsZXNzIGNhc3RpbmcuIEFsc28gdGhpcyByZXN1
bHRzIGluIHRoZQpjb21waWxlciB3YXJuaW5nOgoKCWRyaXZlcnMvZ3Bpby9ncGlvLXB4YS5jOiBJ
biBmdW5jdGlvbiDigJhweGFfZ3Bpb19udW1z4oCZOgoJZHJpdmVycy9ncGlvL2dwaW8tcHhhLmM6
NTM3OjM4OiBlcnJvcjogaW5pdGlhbGl6YXRpb24gZGlzY2FyZHMg4oCYY29uc3TigJkgcXVhbGlm
aWVyIGZyb20gcG9pbnRlciB0YXJnZXQgdHlwZSBbLVdlcnJvcj1kaXNjYXJkZWQtcXVhbGlmaWVy
c10KCSAgNTM3IHwgICAgICAgICBzdHJ1Y3QgcHhhX2dwaW9faWQgKnB4YV9pZCA9IGlkLT5kcml2
ZXJfZGF0YV9wdHI7CgkgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBefgoKd2hpY2ggaXMgYSBnb29kIHRoaW5nIGFzIGFkZGluZyB0aGUgbmVlZGVkIGNvbnN0IHRv
IGZpeCB0aGlzIHdhcm5pbmcKaW1wcm92ZXMgdHlwZSBzYWZldHkuIChTb3JyeSwgbm8gZHJpdmVy
IGJlbG93IGRyaXZlcnMvcG93ZXIgYmVuZWZpdHMKaGVyZSwgc28gdGhlIGV4YW1wbGUgaXMgZnJv
bSBhIGRpZmZlcmVudCBzdWJzeXN0ZW0uKQoKUGF0Y2ggIzUgaXMganVzdCBhbiB1bnJlbGF0ZWQg
Y2hhbmdlIHdoZXJlIEkgc3BvdHRlZCB0aGUgcGF0Y2gKb3Bwb3J0dW5pdHkgd2hpbGUgcHJlcGFy
aW5nIHRoaXMgc2VyaWVzLiBJdCdzIGluY2x1ZGVkIGhlcmUganVzdCBmb3IgbXkKY29udmVuaWVu
Y2UgYW5kIGNvdWxkIGJlIGFwcGxpZWQgaW5kZXBlbmRlbnRseS4KCklmIHlvdSBjb25zaWRlciB0
aGUgbGFzdCBwYXRjaCBtb3N0bHkgY2h1cm4sIGp1c3QgZHJvcCBpdC4KClRoZXJlIGFyZSBubyBk
ZXBlbmRlbmNpZXMgYmV0d2VlbiB0aGUgcGF0Y2hlcywgdGhlIG9ubHkgZmlsZSB0aGF0IGlzCnRv
dWNoZWQgaW4gbW9yZSB0aGFuIG9uZSBwYXRjaCBpcyBkcml2ZXJzL3Bvd2VyL3N1cHBseS9tdDYz
NjBfY2hhcmdlci5jCmFuZCBldmVuIGlmIHRoZXNlIChpLmUuIHBhdGNoZXMgIzEgYW5kICM1KSBh
cmUgcmVvcmRlcmVkLCBnaXQgc2hvdWxkIGJlCmFibGUgdG8gY29wZSB3aXRoIHRoYXQgd2l0aG91
dCBjb25mbGljdHMuCgpOb3RlIHRoYXQgdGhpcyBzZXJpZXMgaXMgb25seSBidWlsZCB0ZXN0ZWQs
IGFuZCB0aGVyZSBpcyB0aGUgcG9zc2liaWxpdHkKdGhhdCBJIGZhaWxlZCB0byBzcG90IGRyaXZl
ciBkYXRhIHVzYWdlIHRoYXQgcmVuZGVyIHBhdGNoZXMgIzIgYW5kL29yICMzCndyb25nLiBTbyBh
IGRlZXBlciBsb29rIG9uIGF0IGxlYXN0IHRob3NlIHR3byB3b24ndCBodXJ0LgoKQmVzdCByZWdh
cmRzClV3ZQoKVXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1YikgKDYpOgogIHBvd2Vy
OiBEcm9wIHVudXNlZCBhc3NpZ25tZW50IG9mIHBsYXRmb3JtX2RldmljZV9pZCBkcml2ZXIgZGF0
YQogIHBvd2VyOiBzdXBwbHk6IG1heDE0NTc3OiBEcm9wIGRyaXZlciBkYXRhIGluIG9mIGFuZCBw
bGF0Zm9ybSBkZXZpY2UgaWQKICAgIGFycmF5cwogIHBvd2VyOiBzdXBwbHk6IG1heDE3MDQyOiBE
cm9wIGRyaXZlciBkYXRhIGluIG9mIGFuZCBwbGF0Zm9ybSBkZXZpY2UgaWQKICAgIGFycmF5cwog
IHBvd2VyOiBVc2UgbmFtZWQgaW5pdGlhbGl6ZXJzIGZvciBwbGF0Zm9ybV9kZXZpY2VfaWQgYXJy
YXlzCiAgcG93ZXI6IHN1cHBseTogbXQ2MzYwX2NoYXJnZXI6IFVzZSBvZiBtYXRjaCB0YWJsZSB1
bmNvbmRpdGlvbmFsbHkKICBwb3dlcjogVW5pZnkgY29kZSBzdHlsZSBmb3IgcGxhdGZvcm1fZGV2
aWNlX2lkIGFycmF5cwoKIGRyaXZlcnMvcG93ZXIvcmVzZXQvcWVtdS12aXJ0LWN0cmwuYyAgICAg
ICAgICAgfCAgMiArLQogZHJpdmVycy9wb3dlci9yZXNldC9zcGFjZW1pdC1wMS1yZWJvb3QuYyAg
ICAgICB8ICA0ICsrLS0KIGRyaXZlcnMvcG93ZXIvcmVzZXQvdHBzNjUwODYtcmVzdGFydC5jICAg
ICAgICAgfCAgMiArLQogZHJpdmVycy9wb3dlci9zdXBwbHkvYXhwMjg4X2NoYXJnZXIuYyAgICAg
ICAgICB8ICAyICstCiBkcml2ZXJzL3Bvd2VyL3N1cHBseS9heHAyODhfZnVlbF9nYXVnZS5jICAg
ICAgIHwgIDIgKy0KIGRyaXZlcnMvcG93ZXIvc3VwcGx5L2JkNzE4MjgtcG93ZXIuYyAgICAgICAg
ICAgfCAgOCArKysrLS0tLQogZHJpdmVycy9wb3dlci9zdXBwbHkvY2hhcmdlci1tYW5hZ2VyLmMg
ICAgICAgICB8ICA0ICsrLS0KIGRyaXZlcnMvcG93ZXIvc3VwcGx5L2Nyb3NfY2hhcmdlLWNvbnRy
b2wuYyAgICAgfCAgNCArKy0tCiBkcml2ZXJzL3Bvd2VyL3N1cHBseS9jcm9zX3BlcmlwaGVyYWxf
Y2hhcmdlci5jIHwgIDQgKystLQogZHJpdmVycy9wb3dlci9zdXBwbHkvY3Jvc191c2JwZC1jaGFy
Z2VyLmMgICAgICB8ICA0ICsrLS0KIGRyaXZlcnMvcG93ZXIvc3VwcGx5L21hY3NtYy1wb3dlci5j
ICAgICAgICAgICAgfCAgMiArLQogZHJpdmVycy9wb3dlci9zdXBwbHkvbWF4MTQ1NzdfY2hhcmdl
ci5jICAgICAgICB8IDEyICsrKysrLS0tLS0tLQogZHJpdmVycy9wb3dlci9zdXBwbHkvbWF4MTcw
NDJfYmF0dGVyeS5jICAgICAgICB8IDE0ICsrKysrKystLS0tLS0tCiBkcml2ZXJzL3Bvd2VyL3N1
cHBseS9tYXg3NzY5M19jaGFyZ2VyLmMgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvcG93ZXIvc3Vw
cGx5L21heDc3NzU5X2NoYXJnZXIuYyAgICAgICAgfCAgMiArLQogZHJpdmVycy9wb3dlci9zdXBw
bHkvbWF4ODk5N19jaGFyZ2VyLmMgICAgICAgICB8ICAyICstCiBkcml2ZXJzL3Bvd2VyL3N1cHBs
eS9tYXg4OTk4X2NoYXJnZXIuYyAgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvcG93ZXIvc3VwcGx5
L210NjM2MF9jaGFyZ2VyLmMgICAgICAgICAgfCAgNiArKystLS0KIGRyaXZlcnMvcG93ZXIvc3Vw
cGx5L3BmMTU1MC1jaGFyZ2VyLmMgICAgICAgICAgfCAgMiArLQogZHJpdmVycy9wb3dlci9zdXBw
bHkvcnQ1MDMzX2NoYXJnZXIuYyAgICAgICAgICB8ICAyICstCiAyMCBmaWxlcyBjaGFuZ2VkLCA0
MCBpbnNlcnRpb25zKCspLCA0MiBkZWxldGlvbnMoLSkKCgpiYXNlLWNvbW1pdDogZjdhZjkxYWRj
MjMwYWE5OWUyMzMzMGVjZjg1YmM5YmFkZDk3ODBhZAotLSAKMi40Ny4zCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
