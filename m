Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30D68C369D6
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Apr 2025 09:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cWto5TILXYuD3ubWQ43p4AoqF68bCwPGTcGSm9naygY=; b=Wp36kDi9vu6APc
	2Rz2NyFmopfJ3GmZqCzYFN7PoFWNRgUc2rUQPbNZtRVCKiQAxAuTPqbd4hMEEvE86AXwZDPxKgaYJ
	gwt2GefZgibXK6tbtVil2yDwlCaHoKru8F6/0Krs/TDzHPluQQyVRf0Dy2wEj1FrYhSGjpsFviU99
	81DZjio/3YNbWtA/eulqW7ai2YteQfy7Ol56f/UOuqs4j9KA5hR8hCR14xxVn0smUIbzcx3kqaWd0
	EGedwR2BrfYOMPdL72WTQwFjBttXK9RqVIpt928d6wkZd+VYDgLJlVF1VF2hUDyGEYG7hGYwHJx2y
	qIxQ0relaaYIL+txSoVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6nis-000000041Gg-3FzT;
	Mon, 21 Apr 2025 09:45:54 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6ni0-0000000412t-0pCf
	for linux-riscv@lists.infradead.org;
	Mon, 21 Apr 2025 09:45:01 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-736a7e126c7so3051203b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 21 Apr 2025 02:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1745228699; x=1745833499; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9oomD+rheO8hWgzZWTPQh42T2jzzNJl6ps7gCFAZrzo=;
        b=VWkxMUAUQDDkkK/pr0pJYMUlpKykfOgKVqL2va3ybGK8q02F01FrnKitJQraVjdz8C
         GRJChFOlb5jvnqeycwNg12F2shsbkSuohuJqb4Pwws/oGOx3P1OEfnO0Td99HOEOTHql
         5V0UgsfQEOfA78BbmJUaGHJ9PfDyaT1gr64cZ6+cq2NSgB8ezD8A3LzTTDcxRsAO1uKb
         sTqxaKUbuqJ54voWhFvkpbdRyE9Pk6Ut6KBryPr8/aeVkIZKi/SthTTAAuZsZ+gfzHsq
         WgiF+gXsOaVuwXaYYmfuZsmMQqCYO3OPZZUa8S1JPy3ly5I7d2QwBFmN0Q48WB3TLwQa
         lVeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745228699; x=1745833499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9oomD+rheO8hWgzZWTPQh42T2jzzNJl6ps7gCFAZrzo=;
        b=go2UkhUc3H7b6MqSfX4S0hj357HMphTFYyMv/qLiFQaFc6/xus7k984aNVuC5sllTY
         tBKXQVMh4vrP7qgMkQyuLlWcBc4O7xWCO1e23YG1m+/zEjD+cxGE/i2kXp7b1rQ4vt2n
         sK8Z5rs/cBkP4eAU996OqlAYzzXw+MAYfkynaPY3G6rhCMup4x6o++9XYs9jcgR/40OZ
         UzP+MoN/DL7T8gzETsb4C0Ed3yp5gMrEmLvvHVq5wY1k3msPWD+GdiakgqVw/nRbz8m5
         jYwI4uYQWSKPZV7W9l4xLUNKxBy5yaZzAUd6tA1+yQReQV1tUu6G4N88B74dq9Frpf6I
         JNuQ==
X-Gm-Message-State: AOJu0YxcMFrZeGegMZnFL23757VFqMBsW8Q+T6gwtE2F7AXT3v6s7Req
	/cKRI7mr8NhcKVmUkDpUrz5hovUhtNW6Iy42ysi5LC3O3j9yRmZKWo+wZZn3ozM=
X-Gm-Gg: ASbGncscOaQd/pGuH3O/uWLQOMVpntMTsteIAe3kKrXmyhqjoW8MZVBH30jdhLtRRCP
	CPs14GT0BhsyNZn6ca7J9d560lUaJgW1sTQ85+S/5ZKMaK5WgYhE3otT2A0zQ67ffogkRlJZV8V
	PGuV9w9iwvvysDHGCGGUOuBnvyas7CVzAR/iRhDUoF74WxfsWW6SgPZZr3iBIHBlpBanQ+miIB3
	2krCWS14+ORQCkwRXtyyInQ2RsW4ku+bedB5GozC0jDsiSzaHUajCvqKdres+uAXng70WiPgnBz
	t1NlrW1hrVvagIUUPM111SpD7Tbh4WqJEP7UAD67n1pOlmWMJYp03FOCXM+dy543akUylZVYLxt
	rzQ==
X-Google-Smtp-Source: AGHT+IG3700mpvecN8OGtblvyO5T1EjDBNVZFMQ7/RSZwGoTrQaT76dyL6hRUY7pUUMOaUwerM2e1g==
X-Received: by 2002:a05:6a00:80d:b0:736:6ecd:8e34 with SMTP id d2e1a72fcca58-73dc1582843mr12640767b3a.18.1745228699199;
        Mon, 21 Apr 2025 02:44:59 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfaacf32sm6371965b3a.142.2025.04.21.02.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 02:44:58 -0700 (PDT)
From: Nylon Chen <nylon.chen@sifive.com>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	Nylon Chen <nylon.chen@sifive.com>,
	Zong Li <zong.li@sifive.com>
Subject: [PATCH v11 5/5] pwm: sifive: clarify inverted compare logic in comments
Date: Mon, 21 Apr 2025 17:55:21 +0800
Message-Id: <20250421095521.1500427-6-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250421095521.1500427-1-nylon.chen@sifive.com>
References: <20250421095521.1500427-1-nylon.chen@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_024500_232532_27570601 
X-CRM114-Status: GOOD (  13.73  )
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

VGhlIEZVNzQw4oCRQzAwMCBtYW51YWwgc2F5cyDigJxwd21zIOKJpSBwd21jbXBYIC0+IEhJR0ji
gJ0sIGJ1dCBpbiBGaWd1cmXCoDI5IHB3bWNtcFhjZW50ZXIKaXMgZm9yY2VkIHRvwqAwIHZpYSBh
biBYT1IsIHNvIGhhcmR3YXJlIGFjdHVhbGx5IG91dHB1dHMgSElHSCB3aGVuIHB3bXMgPCBwd21j
bXBYLgpUaHVzIHB3bWNtcCBob2xkcyB0aGUgb2Zm4oCRcGVyaW9kIGNvdW50LCBhbmQgdGhlIGRy
aXZlciBtdXN0IGludmVydCBpdAp0byBleHBvc2UgYSBub3JtYWwgYWN0aXZl4oCRaGlnaCBpbnRl
cmZhY2UuCgpDby1kZXZlbG9wZWQtYnk6IFpvbmcgTGkgPHpvbmcubGlAc2lmaXZlLmNvbT4KU2ln
bmVkLW9mZi1ieTogWm9uZyBMaSA8em9uZy5saUBzaWZpdmUuY29tPgpTaWduZWQtb2ZmLWJ5OiBO
eWxvbiBDaGVuIDxueWxvbi5jaGVuQHNpZml2ZS5jb20+Ci0tLQogZHJpdmVycy9wd20vcHdtLXNp
Zml2ZS5jIHwgMjIgKysrKysrKysrKysrKysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDIxIGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3B3bS9wd20t
c2lmaXZlLmMgYi9kcml2ZXJzL3B3bS9wd20tc2lmaXZlLmMKaW5kZXggMTQwNGMzODM0NjFkLi5m
ZDE2NjBlMTZhNGMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcHdtL3B3bS1zaWZpdmUuYworKysgYi9k
cml2ZXJzL3B3bS9wd20tc2lmaXZlLmMKQEAgLTQsMTEgKzQsMjggQEAKICAqIEZvciBTaUZpdmUn
cyBQV00gSVAgYmxvY2sgZG9jdW1lbnRhdGlvbiBwbGVhc2UgcmVmZXIgQ2hhcHRlciAxNCBvZgog
ICogUmVmZXJlbmNlIE1hbnVhbCA6IGh0dHBzOi8vc3RhdGljLmRldi5zaWZpdmUuY29tL0ZVNTQw
LUMwMDAtdjEuMC5wZGYKICAqCisgKiBQV00gb3V0cHV0IGludmVyc2lvbjogQWNjb3JkaW5nIHRv
IHRoZSBTaUZpdmUgUmVmZXJlbmNlIG1hbnVhbAorICogdGhlIG91dHB1dCBvZiBlYWNoIGNvbXBh
cmF0b3IgaXMgaGlnaCB3aGVuZXZlciB0aGUgdmFsdWUgb2YgcHdtcyBpcworICogZ3JlYXRlciB0
aGFuIG9yIGVxdWFsIHRvIHRoZSBjb3JyZXNwb25kaW5nIHB3bWNtcFhbUmVmZXJlbmNlIE1hbnVh
bF0uCisgKgorICogRmlndXJlwqAyOSBpbiB0aGUgc2FtZSBtYW51YWwgc2hvd3MgdGhhdCB0aGUg
cHdtY21wWGNlbnRlciBiaXQgaXMKKyAqIGhhcmTigJF0aWVkIHRvIDAgKFhOT1IpLCB3aGljaCBl
ZmZlY3RpdmVseSBpbnZlcnRzIHRoZSBjb21wYXJpc29uIHNvIHRoYXQKKyAqIHRoZSBvdXRwdXQg
Z29lcyBISUdIIHdoZW4gIGBwd21zIDwgcHdtY21wWGAuCisgKgorICogSW4gb3RoZXIgd29yZHMs
IGVhY2ggcHdtY21wIHJlZ2lzdGVyIGFjdHVhbGx5IGRlZmluZXMgdGhlICoqaW5hY3RpdmUqKgor
ICogKGxvdykgcGVyaW9kIG9mIHRoZSBwdWxzZSwgbm90IHRoZSBhY3RpdmUgdGltZSBleGFjdGx5
IG9wcG9zaXRlIHRvIHdoYXQKKyAqIHRoZSBkb2N1bWVudGF0aW9uIHRleHQgaW1wbGllcy4KKyAq
CisgKiBUbyBjb21wZW5zYXRlLCB0aGlzIGRyaXZlciBhbHdheXMgKippbnZlcnRzKiogdGhlIGR1
dHkgdmFsdWUgd2hlbiByZWFkaW5nCisgKiBvciB3cml0aW5nIHB3bWNtcCByZWdpc3RlcnMgLCBz
byB0aGF0IHVzZXJzIGludGVyYWN0IHdpdGggYSBjb252ZW50aW9uYWwKKyAqICoqYWN0aXZl4oCR
aGlnaCoqIFBXTSBpbnRlcmZhY2UuCisgKgorICoKICAqIExpbWl0YXRpb25zOgogICogLSBXaGVu
IGNoYW5naW5nIGJvdGggZHV0eSBjeWNsZSBhbmQgcGVyaW9kLCB3ZSBjYW5ub3QgcHJldmVudCBp
bgogICogICBzb2Z0d2FyZSB0aGF0IHRoZSBvdXRwdXQgbWlnaHQgcHJvZHVjZSBhIHBlcmlvZCB3
aXRoIG1peGVkCiAgKiAgIHNldHRpbmdzIChuZXcgcGVyaW9kIGxlbmd0aCBhbmQgb2xkIGR1dHkg
Y3ljbGUpLgotICogLSBUaGUgaGFyZHdhcmUgY2Fubm90IGdlbmVyYXRlIGEgMTAwJSBkdXR5IGN5
Y2xlLgorICogLSBUaGUgaGFyZHdhcmUgY2Fubm90IGdlbmVyYXRlIGEgMCUgZHV0eSBjeWNsZS4K
ICAqIC0gVGhlIGhhcmR3YXJlIGdlbmVyYXRlcyBvbmx5IGludmVydGVkIG91dHB1dC4KICAqLwog
I2luY2x1ZGUgPGxpbnV4L2Nsay5oPgpAQCAtMTEzLDYgKzEzMCw4IEBAIHN0YXRpYyBpbnQgcHdt
X3NpZml2ZV9nZXRfc3RhdGUoc3RydWN0IHB3bV9jaGlwICpjaGlwLCBzdHJ1Y3QgcHdtX2Rldmlj
ZSAqcHdtLAogCXUzMiBkdXR5LCB2YWwsIGluYWN0aXZlOwogCiAJaW5hY3RpdmUgPSByZWFkbChk
ZGF0YS0+cmVncyArIFBXTV9TSUZJVkVfUFdNQ01QKHB3bS0+aHdwd20pKTsKKwkvKiBQV00gaGFy
ZHdhcmUgdXNlcyAnaW5hY3RpdmUnIGNvdW50cyBpbiBwd21jbXAsIHNvIGludmVydCB0byBnZXQg
YWN0dWFsIGR1dHkuCisJICogSGVyZSwgJ2luYWN0aXZlJyBpcyB0aGUgbG93IHRpbWUgYW5kIHdl
IGNvbXB1dGUgZHV0eSBhcyBtYXhfY291bnQgLSBpbmFjdGl2ZS4gKi8KIAlkdXR5ID0gKDFVIDw8
IFBXTV9TSUZJVkVfQ01QV0lEVEgpIC0gMSAtIGluYWN0aXZlOwogCiAJc3RhdGUtPmVuYWJsZWQg
PSBkdXR5ID4gMDsKQEAgLTE2MCw2ICsxNzksNyBAQCBzdGF0aWMgaW50IHB3bV9zaWZpdmVfYXBw
bHkoc3RydWN0IHB3bV9jaGlwICpjaGlwLCBzdHJ1Y3QgcHdtX2RldmljZSAqcHdtLAogCWZyYWMg
PSBudW0gLyBzdGF0ZS0+cGVyaW9kOwogCS8qIFRoZSBoYXJkd2FyZSBjYW5ub3QgZ2VuZXJhdGUg
YSAwJSBkdXR5IGN5Y2xlICovCiAJZnJhYyA9IG1pbihmcmFjLCAoMVUgPDwgUFdNX1NJRklWRV9D
TVBXSURUSCkgLSAxKTsKKwkvKiBwd21jbXAgcmVnaXN0ZXIgbXVzdCBiZSBsb2FkZWQgd2l0aCB0
aGUgaW5hY3RpdmUgLSB0aW1lIGNvdW50IChpbnZlcnQgdGhlIGR1dHkpICovCiAJaW5hY3RpdmUg
PSAoMVUgPDwgUFdNX1NJRklWRV9DTVBXSURUSCkgLSAxIC0gZnJhYzsKIAogCW11dGV4X2xvY2so
JmRkYXRhLT5sb2NrKTsKLS0gCjIuMzQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
