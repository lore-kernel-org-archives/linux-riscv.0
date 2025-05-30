Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14F73C5B552
	for <linux-riscv@archiver.kernel.org>; Fri, 30 May 2025 20:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IT1bSJE35icW1KWumQTQATADYTslB+ggn1+vHOe/cyQ=; b=J+9+Y8RgyS+hnH
	J6OsjZERaru4967+j0xXa8Xo589XQWvSLbjR1TVHjLaikwC9s56tXWOxdMxmGBjFTwRWcWOYnSE0r
	9wICtACYdGtGlwNyQcdP4piV97ni81YgllcPX/vchuFF/aq4b55cF3g1ryxHFRBMeieLvtzjgHhUs
	PTau7MpeBEingI0/C2avQZHoqDGhxvoFO+4y9IAmOfayiHo7cvAurpez3lGr3pVS5TaPYpbbcYuvV
	fIO06AYKds+OhbeCumSFdTBTFASdoQbJ7DEv4L8VbYksWowvgpJ4sOCgz7DpYF181Fkdr34Qe8sWQ
	HzZryTeGVVONM6pI9B3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL6mw-00000001rpx-0AOX;
	Fri, 30 May 2025 20:57:14 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL6mt-00000001row-2OLv
	for linux-riscv@lists.infradead.org;
	Fri, 30 May 2025 20:57:12 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-442f9043f56so15030285e9.0
        for <linux-riscv@lists.infradead.org>; Fri, 30 May 2025 13:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1748638629; x=1749243429; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VMSxpw9+y8iqYt8JxlT2EtidzUkF8uYdC4WUU5TEScc=;
        b=z4fa0JCzCV1uIEDQ+8UxOEpVRTYJ+Hik8JbmL3zswJtWXJyfZz/Vrr3l/j1e2fPCoN
         ECXtQ1xJsLHQfZztNbmDoCZ0E/i3jJKzywk/phBUJhArhoNS2b9wA8FS7hHIVUqkOj9X
         iSOGsdxlNTmMERQBUw9rsaMtmxziknKAfQjvRcarlXYUemNeMtV5/ncgJ5tJqlchQt0t
         JzonumblP/dR7nEvhhG7IXCSmdix5+tUCDGaM/9JbiU4XdACWAU0MQJHYpE2suu/CT/o
         sx3TGIlDjaRBCRDI20TpRrk4y0FuB0rxMG77DiAD8hdbJgaOjNFb2ssWz4l1zWL0cWUx
         /FUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748638629; x=1749243429;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VMSxpw9+y8iqYt8JxlT2EtidzUkF8uYdC4WUU5TEScc=;
        b=Jm5cSBERIHaGeBkfI8C1sj2A/lLw/rvkn5KIljwQXoqT4WCH+KtA/GBLlAxw0VtPte
         lg5NeAUtlC+hMuD68vQpi9yNhQU7UVvmEvuJAZXI6FtVzd8HJwqJVMOJKHT7kGorwaYH
         e4cWx7U5b7yQxNM3ozk4d2lNOGZRcJ4tv+8nyEng+OYozN/ijNl4OLsC7/N81RO0JMNI
         RXKJH3iZPRlWSENX1bKcA7oPxY36pRd784N1mPh5pyRtXrP5UJeLLn0VZS3iRTsw3IDn
         fdmnQUIt1V+qH1WfdxGZgwEepr2EDgTN6lDVsrnicCZkW/2FuObpxyG7WvGlxM2qe/sg
         L9Yg==
X-Gm-Message-State: AOJu0Ywu1f9AYVNokoTSUU80EIxpqEcvt/rn6bX7u/5UpsWe2MWiw8di
	0Y+EUxYZ+sjvairCHaTVqr8TzWJ7774lsnOZs9xtOOTIHvPHnHZFLbllCmAYbGhMmciXxw9EAYw
	rXiKV
X-Gm-Gg: ASbGncvfmqGm/fHJlm9J7LVM5cFUQRnCCf9ibdKsdmOKCOnCH1h7Hjc/QpvjQF3xKdj
	DJzqGsMp95WJ2boBbwBLu7aU/u+UWelm3nxeKSyGBCDMqtu29xqmQ1lpubcvM8pkyDZsROMmFmI
	7GqfUYhyf8B3UXlumN5GAKowTw1RHqDqb+9w9c/dpJdzSW+tx/DgHyxbkIEsuDGemkk+U+UXrOn
	B262K0lgAlnD4NyVTx+vFkoVguZNLlYxrUKhTZfW+clta/o8ZjCOUf+zXW5W8Lefi3oUm8B0NMK
	lEQ+Ski6TdkTpHL/gPgOtjSKj/eSPw/6svDrHhGo8/nrp1rV3Jou10E/6HeicwWgNDCJ7+hjOd9
	NFGbqK2hR5M7CWe6J6mpJZZdtqLEWk5PW
X-Google-Smtp-Source: AGHT+IFWYT8TlHTZ5dxUNJ/zGMMdJKAZCNpCVQnFay2dxKMJaROjY0ekIJNuo9sSdYKAqvoA/8qeqQ==
X-Received: by 2002:a5d:5885:0:b0:3a4:f51b:9f9a with SMTP id ffacd0b85a97d-3a4f7a4b143mr3503535f8f.18.1748638628885;
        Fri, 30 May 2025 13:57:08 -0700 (PDT)
Received: from carbon-x1.. (amontpellier-552-1-200-51.w109-210.abo.wanadoo.fr. [109.210.255.51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe5b79asm5666527f8f.2.2025.05.30.13.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 13:57:08 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Subject: [PATCH 0/2] riscv: misaligned: fix misaligned accesses handling in put/get_user()
Date: Fri, 30 May 2025 22:56:56 +0200
Message-ID: <20250530205658.624195-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_135711_716988_1BC065FB 
X-CRM114-Status: GOOD (  12.49  )
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

V2hpbGUgZGVidWdnaW5nIGEgZmV3IHByb2JsZW1zIHdpdGggdGhlIG1pc2FsaWduZWQgYWNjZXNz
IGtzZWxmdGVzdCwKQWxleGFuZHJlIGRpc2NvdmVyZWQgc29tZSBjcmFzaCB3aXRoIHRoZSBjdXJy
ZW50IGNvZGUuIEluZGVlZCwgc29tZQptaXNhbGlnbmVkIGFjY2VzcyB3YXMgZG9uZSBieSB0aGUg
a2VybmVsIHVzaW5nIHB1dF91c2VyKCkuIFRoaXMKd2FzIHJlc3VsdGluZyBpbiB0cmFwIGFuZCBh
IGtlcm5lbCBjcmFzaCBzaW5jZS4gVGhlIHBhdGggd2FzIHRoZQpmb2xsb3dpbmc6CnVzZXIgLT4g
a2VybmVsIC0+IGFjY2VzcyB0byB1c2VyIG1lbW9yeSAtPiBtaXNhbGlnbmVkIHRyYXAgLT4gdHJh
cCAtPgprZXJuZWwgLT4gbWlzYWxpZ25lZCBoYW5kbGluZyAtPiBtZW1jcHkgLT4gY3Jhc2ggZHVl
IHRvIGZhaWxlZCBwYWdlIGZhdWx0CndoaWxlIGluIGludGVycnVwdCBkaXNhYmxlZCBzZWN0aW9u
LgoKTGFzdCBkaXNjdXNzaW9uIGFib3V0IGtlcm5lbCBtaXNhbGlnbmVkIGhhbmRsaW5nIGFuZCBp
bnRlcnJ1cHQgcmVlbmFibGluZwp3ZXJlIGFjdHVhbGx5IG5vdCB0byByZWVuYWJsZSBpbnRlcnJ1
cHQgd2hlbiBoYW5kbGluZyBtaXNhbGlnbmVkIGFjY2VzcwpiZWluZyBkb25lIGJ5IGtlcm5lbC4g
VGhlIGJlc3Qgc29sdXRpb24gYmVpbmcgbm90IHRvIGRvIGFueSBtaXNhbGlnbmVkCmFjY2Vzc2Vz
IHRvIHVzZXJzcGFjZSBtZW1vcnksIHdlIGNvbnNpZGVyZWQgYSBmZXcgb3B0aW9uczoKCi0gUmVt
b3ZlIGFueSBjYWxsIHRvIHB1dC9nZXRfdXNlcigpIHBvdGllbnRhbGx5IGRvaW5nIG1pc2FsaWdu
ZWQKICBhY2Nlc3NlcwotIERvIG5vdCBkbyBhbnkgbWlzYWxpZ25lZCBhY2Nlc3NlcyBpbiBwdXQv
Z2V0X3VzZXIoKSBpdHNlbGYKClRoZSBzZWNvbmQgc29sdXRpb24gd2FzIHRoZSBvbmUgY2hvc2Vu
IGFzIHRoZXJlIGFyZSB0b28gbWFueSBjYWxsc2l0ZSB0bwpwdXQvZ2V0X3VzZXIoKSB0aGF0IGNv
dWxkIHBvdGVudGlhbGx5IGRvIG1pc2FsaWduZWQgYWNjZXNzZXMuIFdlIHRyaWVkCnR3byBhcHBy
b2FjaGVzIGZvciB0aGF0LCBlaXRoZXIgc3BsaXQgYWNjZXNzIGluIHR3byBhbGlnbmVkIGFjY2Vz
c2VzCihhbmQgZG8gUk1XIGZvciBwdXRfdXNlcigpKSBvciBjYWxsIGNvcHlfZnJvbS90b191c2Vy
KCkgd2hpY2ggZG9lcyBub3QKZG8gYW55IG1pc2FsaWduZWQgYWNjZXNzZXMuIFRoZSBsYXRlciBv
bmUgd2FzIHRoZSBzaW1wbGVyIHRvIGltcGxlbWVudAooYWx0aG91Z2ggdGhlIHBlcmZvcm1hbmNl
cyBhcmUgcHJvYmFibHkgbG93ZXIgdGhhbiBzcGxpdCBhbGlnbmVkCmFjY2Vzc2VzIGJ1dCBzdGls
bCB3YXkgYmV0dGVyIHRoYW4gZG9pbmcgbWlzYWxpZ25lZCBhY2Nlc3MgZW11bGF0aW9uKQphbmQg
YWxsb3dzIHRvIHN1cHBvcnQgd2hhdCB3ZSB3YW50ZWQuCgpUaGVzZSBjb21taXRzIGFyZSBiYXNl
ZCBvbiB0b3Agb2YgQWxleCBkZXYvYWxleC9nZXRfdXNlcl9taXNhbGlnbmVkX3YxCmJyYW5jaC4K
CkNsw6ltZW50IEzDqWdlciAoMik6CiAgcmlzY3Y6IHByb2Nlc3M6IHVzZSB1bnNpZ25lZCBpbnQg
aW5zdGVhZCBvZiB1bnNpZ25lZCBsb25nIGZvcgogICAgcHV0X3VzZXIoKQogIHJpc2N2OiB1YWNj
ZXNzOiBkbyBub3QgZG8gbWlzYWxpZ25lZCBhY2Nlc3NlcyBpbiBnZXQvcHV0X3VzZXIoKQoKIGFy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vdWFjY2Vzcy5oIHwgMjggKysrKysrKysrKysrKysrKysrKysr
Ky0tLS0tLQogYXJjaC9yaXNjdi9rZXJuZWwvcHJvY2Vzcy5jICAgICAgfCAgMiArLQogMiBmaWxl
cyBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKLS0gCjIuNDkuMAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
