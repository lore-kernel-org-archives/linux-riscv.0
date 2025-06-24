Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15FC5C77B7F
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jun 2025 19:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2ZyZcRbHKSnnWYAHDYW6zsnHYAizVyAG/L0oizIxv4s=; b=KMc4cl9wtL8Ruq
	6YcthvSa6zS6miJbrfdACnXpMVjk79htMxgC3enJmiLutC9xnZ3fnMeOYlGuLmCngIT7/G5ynmakI
	k1kMPokHOd0imuqOy3zxsxrvxtfntfffp8e26u0i5SFZ0+3tyXNjmAdlWXpYqe5cFdx+IVTioUTK4
	9n/rbPF5r/RVlDTzUdVEgsD56n8AbyrkHoPLDhQ2yRRPbCVM/KGjyUGHGJnQFTaXjS7iTGkfzchgn
	CJIdbebynrprwKrMpycXHJTdbSFnZPoWCE1Dn6znlJgQo5PpNYawsFgoJ5rI5urRETYZVicjyY+NA
	CG2h0ls6y4NcwYmhOlPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU9kA-00000006h23-2QNt;
	Tue, 24 Jun 2025 19:55:46 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU8Bv-00000006UW7-1reu
	for linux-riscv@lists.infradead.org;
	Tue, 24 Jun 2025 18:16:21 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-acb5ec407b1so950989266b.1
        for <linux-riscv@lists.infradead.org>; Tue, 24 Jun 2025 11:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750788977; x=1751393777; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VnpSnkfgkUADh3xBII6BavGc953e/khu2q4B6DDX498=;
        b=BxH8oTFHaMHmbkpv/VsmsAWOpNHsMHo1GB3kbHhceVZXc6QrhPnxZoZOZ8HW/0a8t4
         LdMulxpNPnH5l+9KD+RHFA6ig9ZWb9RY5CJaNZaSgAHxrHSWXy919cYbDdpLBHbE0NZj
         dXVxPKGRLLtQtUlB+f7PApmuQXVkrnM/P6VH9yncGVro6dXAw4AJC2MOAeUs/rIyGHzF
         /AhlBkeYm25scVF162u1/gAMOySnsZd5RxTxkWTRu7c3tJVGMs7sZfZBSWP9TMe664Lm
         CkZTjohHFxqQxKEfKV9AK7SnG0Dp0Yxa1+w5zkjbrCfN7rLFC7Yr6mE0LO7iYmLXmZEk
         kQ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750788977; x=1751393777;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VnpSnkfgkUADh3xBII6BavGc953e/khu2q4B6DDX498=;
        b=J+mvRaefHWe36kVBkgzWh6XXincyabMIdgGaa+givYfBJ1do1AatXuGx5o0gm57td0
         i5aA6JNkv8VEtPhBDelIelHB/vjPLjopwx6etP4gz6ps5eZc8RfUIAeWJ7YfmCUPOkzG
         3sEyFkBLpVyppv517QPMrpf3Yhq/7MeW1PmPP/T9DFVxEWmEwoWypqsCnFS+n0U5CSAD
         wdulClGCyDZAjZY4gIDg7XkGY6A7rg3c1+7ytyiE81mQja65KpHphCNQU4ua89Cq6Yvc
         tG2O9lUDIGf7GmVRT3ALVDVdmo7+caRpc0udg/8D9oCo7l6XCKQjW4LNht70lReSsjJ2
         4Smg==
X-Forwarded-Encrypted: i=1; AJvYcCXU7npY/lRq9eTP0wbfa8DuUyWsji3Jg/+Udk7QXtBhv8/jdFIxSGtHV36I97qinVYMf0BGfNncI0GnJQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxCMAtDOtwdqiDPYH2LxakAuHAxRr5N7WeUMD7U472zNldngp5V
	1faoaDtd+5sNXfQjNZbnc/BX8wIF6fS/t4SzlnuPvmjWb3Jh/Gix0V5yB1ngPBVla+g=
X-Gm-Gg: ASbGnctV8yH65uYBHYhfSpLwsvd2sZcARxbmvjc/uFiumSAzyx/xoo6JhYDrLzTZiEr
	6zCaoCMVeCqnFh8EZLrHguf45SAx1ZyRXa3hDYJ1xZGEbVQHvY3F2J0aOilFviF+6jA1cUsBtcd
	dQFt1JDPz1nTznd3WNLozF9rm7LgHB0C1qvXedp6RIX3eHRN0Mo/nMsd6KQf7nPpsCV5A69w+cT
	aML/ecZgbipNJEzRlvFFe+eC3jE6dKH8Kx8yVqF8P0KWp8p05FaBrnyZlo3JxJurXIdLZ2Pr57O
	3jQLMP0q61f+PqHpthruaY+qr5GeXpEDA8WYOMzkRngIVhkLnJ2A8RVpSw9d9pvNmXA=
X-Google-Smtp-Source: AGHT+IETySV/NwwqbbDLqMU7Mh5iub1oxToadv0ZxFROQaZJtAgApSrTnuto7oLvvORtd6L1Dbo99A==
X-Received: by 2002:a17:906:c314:b0:ae0:635c:a400 with SMTP id a640c23a62f3a-ae0beb0531fmr22317666b.51.1750788977207;
        Tue, 24 Jun 2025 11:16:17 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ae053ecbda9sm905954066b.48.2025.06.24.11.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 11:16:16 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: linux-pwm@vger.kernel.org
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	Vladimir Zapolskiy <vz@mleia.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	linux-riscv@lists.infradead.org,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 0/8] pwm: Drop local locking in several drivers
Date: Tue, 24 Jun 2025 20:15:36 +0200
Message-ID: <cover.1750788649.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1325; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=S8bWVrtohU804TFCIPr4aot/z07tET4jFwVUKYqLlZ0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoWutKdlfvI7KIzHJ+KN9OasXDBe9Ets/iGGJT3 I980PyuD9GJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaFrrSgAKCRCPgPtYfRL+ ThL9B/wNCs36L/ISd4BA7zNBxQj5xBfjauGisVwporrJNf6qsKCwNrXQzidhknNvp946kr9gTj/ 3GZpj2d+UbQZ3AVgOMPIGsP4KkUomd8bCzxxuV8vCYvqB3oaXo4u7MUMI0/Y6JSmjh9RdLL2nz4 svG2I8ba2XHL8nWHRPNDbvQEPjsDTkU4/z536VcFjQXP1gSTOa/+Yh1JnyezwiP1gcGOBLeUj3P guQ2ykm0AKCku7biNbXTJzIkI1Mzz8P3Tso4jJGZ6a7mquAzUpmue2SbYP1gMV/nm416ULVDwW3 gxd2zphLoM96KFKamXLTbVyKW7sNAeHWRXFVNMiUH+EJF2Kx
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_111619_757951_6BE6B88F 
X-CRM114-Status: UNSURE (   6.78  )
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

SGVsbG8sCgpzb21lIHRpbWUgYWdvIHRoZSBwd20gY29yZSBpbXBsZW1lbnRlZCBhZGRpdGlvbmFs
IGxvY2tpbmcgdG8gcHJvdGVjdApsb3dsZXZlbCBkcml2ZXIgY2FsbGJhY2tzIGFnYWluc3QgZHJp
dmVyIHJlbW92YWwuIEEgc2lkZSBlZmZlY3QgaXMgdGhhdAouYXBwbHkoKSBhbmQgLmdldF9zdGF0
ZSgpIGFyZSBzZXJpYWxpemVkLiBUaGlzIGFsbG93cyB0byBkcm9wIHNvbWUKbG9ja2luZyB0aGF0
IGlzIG5vdyBzdXBlcmZsdW91cyBkdWUgdG8gdGhlIGNvcmUncyBsb2NraW5nLgoKSSBpZGVudGlm
aWVkIGEgZmV3IGRyaXZlcnMgdGhhdCBhcmUgYWZmZWN0ZWQ7IHRoZXNlIGFyZSBjbGVhbmVkIHVw
CmFjY29yZGluZ2x5IGhlcmUuCgpCZXN0IHJlZ2FyZHMKVXdlCgpVd2UgS2xlaW5lLUvDtm5pZyAo
OCk6CiAgcHdtOiBhdG1lbDogRHJvcCBkcml2ZXIgbG9jYWwgbG9ja2luZwogIHB3bTogY2xwczcx
MXg6IERyb3AgZHJpdmVyIGxvY2FsIGxvY2tpbmcKICBwd206IGZzbC1mdG06IERyb3AgZHJpdmVy
IGxvY2FsIGxvY2tpbmcKICBwd206IGxwYzE4eHgtc2N0OiBEcm9wIGRyaXZlciBsb2NhbCBsb2Nr
aW5nCiAgcHdtOiBtaWNyb2NoaXAtY29yZTogRHJvcCBkcml2ZXIgbG9jYWwgbG9ja2luZwogIHB3
bTogc3RpOiBEcm9wIGRyaXZlciBsb2NhbCBsb2NraW5nCiAgcHdtOiBzdW40aTogRHJvcCBkcml2
ZXIgbG9jYWwgbG9ja2luZwogIHB3bTogdHdsLWxlZDogRHJvcCBkcml2ZXIgbG9jYWwgbG9ja2lu
ZwoKIGRyaXZlcnMvcHdtL3B3bS1hdG1lbC5jICAgICAgICAgIHwgMTIgLS0tLS0tLS0KIGRyaXZl
cnMvcHdtL3B3bS1jbHBzNzExeC5jICAgICAgIHwgIDggLS0tLS0tCiBkcml2ZXJzL3B3bS9wd20t
ZnNsLWZ0bS5jICAgICAgICB8IDI4ICsrKysrLS0tLS0tLS0tLS0tLQogZHJpdmVycy9wd20vcHdt
LWxwYzE4eHgtc2N0LmMgICAgfCAxNCAtLS0tLS0tLS0KIGRyaXZlcnMvcHdtL3B3bS1taWNyb2No
aXAtY29yZS5jIHwgMTcgKy0tLS0tLS0tLS0KIGRyaXZlcnMvcHdtL3B3bS1zdGkuYyAgICAgICAg
ICAgIHwgMjMgKysrKy0tLS0tLS0tLS0tCiBkcml2ZXJzL3B3bS9wd20tc3VuNGkuYyAgICAgICAg
ICB8IDEwIC0tLS0tLS0KIGRyaXZlcnMvcHdtL3B3bS10d2wtbGVkLmMgICAgICAgIHwgNDkgKysr
KystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDggZmlsZXMgY2hhbmdlZCwgMjEgaW5zZXJ0
aW9ucygrKSwgMTQwIGRlbGV0aW9ucygtKQoKYmFzZS1jb21taXQ6IGY4MTdiNmRkMmI2MmQ5MjFh
NmNkYzBhM2FjNTk5Y2QxODUxZjM0M2MKLS0gCjIuNDkuMAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
