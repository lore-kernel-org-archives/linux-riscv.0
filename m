Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E231E77199
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jan 2025 15:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WHeM64FSn96yqAsIkloc1buDAI5KAi2vvuwo+C0d77s=; b=h5zl+9Wxs5AH3P
	o0rOeU2cRP50rZrEtGW8QNpGtbxMEVt6qwUZpp5WwNFO4jLMy0ALjeYWYeUyqussHntbQ1d6uBQIZ
	/C26vRwvSN40OSDkeXNIhLK6+lDjhYYpU7VlRWJyD5qvvk344hXsQIY6uvVjGbH99P2XJhALG81wi
	otPBYoCMvSB8LTS1bk8pat0VYcIzve8G0bO38naQoezJfmVbePQq38/pT93vjSa5zLmnLhJ4AFNRL
	aN5SR1nLR6WQHO9ZGwVDzUaax2PP88nDSgxocnKtIZTpLsmRP8gvecdsR5yry1LSmlS+05OBePDwq
	xU7uP+gXUbTzCKFMU4bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVYJ3-000000092Jc-3MYG;
	Wed, 08 Jan 2025 15:49:17 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVYJ0-000000092Iq-0tXM
	for linux-riscv@lists.infradead.org;
	Wed, 08 Jan 2025 15:49:15 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4361c705434so122895165e9.3
        for <linux-riscv@lists.infradead.org>; Wed, 08 Jan 2025 07:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736351351; x=1736956151; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vgsjKbIw/Qtp7jQ5AD1ITXyk1buirQCSu+JWGBt/Rxw=;
        b=ukeLmJo3UqPchbEeZI5Mi3v4h+g7tnYIvcnOgAoNle5zvxIZcRK6USb3EQZSrsJA4a
         6XsaE55NYMnfWUrFZcFIRJduXwCRzE+tRGeITiZyfe5Y0eCxDaRli/mW27runRhcDyrS
         Z1BCK9w01UWYBg3FTP6v1zFRe4973lfPOn9RR31EHOZ+u2IDzB4AqM/wt8H7dnYV0IK7
         5M6Zh5OPrR3i1nBoBI675gEkfW624RJoPNUtGzwvLnUotqjOCBVM+cue504UNZ8z0uDS
         MUQNVzSMxWMBylJGdy6FZ8Ld2ygwImWSXxXenFGoV8DsB5n+drRsyIZ5BvNAlyTx4sN8
         Phkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736351351; x=1736956151;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vgsjKbIw/Qtp7jQ5AD1ITXyk1buirQCSu+JWGBt/Rxw=;
        b=YXHJawvBLMuPicwhVmqJzvbntX2m/ZMYvjJE20fmRIlSPydvmL7Fw2DuMewJEZVgH+
         a8H45vvpVOmJHtqlZnpd0JGkxbyl0Jr3HKjlI8uMMEu2LQm5Db32qFppBwdE+EEjdT2g
         mr0Pixb3u7HF7qtPc1Dnye8kwKFFzp0H67zp78sq4+J0XO+w9yu8HN4wgmxffot2m7Ke
         uEi1aRZYaBRMyfisS0kEGh6xJ8ni06sJtNH2pqH5Ldo4lQb4h+m9fJ7a7dssoGdLm4oP
         HueL5OUbvKdqcAPdky6GKgbnWPYEeyBEY9S/V1XmJeQNy6UBd33ots+12+5glt4t+jAY
         8wWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWc1jFIY9YJEq2tTJrQ/VRlmQkz2S97dpJ0aroJoWMgsvzjCha5DejQkkqqxP7+QGMqpNcnvWcSnCIBqg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6KJRAO/UoCXEYfadhlc7/9d9Lv7OccAgAQlHP2AZG0DGSnRxV
	TxTrz+FgX/cZCmpkgDE9ozBQQiZ17l0ClyHBIqssR6uE0arZCgVNvZsEOxEnyok=
X-Gm-Gg: ASbGncsVhGv9AeWmJ7kg+5PNgAn775pkXZcRx3JbcP0bEkmjSJtQXn03eOKeG8OaS8W
	7Zaq9M07WAF48cirTvmZ0bc/OrEcsOe2GCVUUnpT6lYQawDKagZTPQ8dYy4AQEWmqMdiztcd5ZN
	s41pgt/S/k0zxqY8B3G2O08oDiGHQxDk5jn1m6STgpcVBORsOYvv/rOiV2DxZ4a4gAu9lqOtH0F
	c1rHagp4bvr7GuF0xVx5A+EEb+yh651xZ8AaYc2D+/hPKtdiSwTHhSrfkpR4JL0kdPOVQKVpf66
	yomDINP9mSvQktg0OF2/M1wt
X-Google-Smtp-Source: AGHT+IGOypGQLh3BUcPGq2oqFr1ZK/Glm85bEtHFzrrEmZJ9NzY1G2pqFasac+LFgi7mTjPivTeA+g==
X-Received: by 2002:a05:6000:18ab:b0:385:f349:ffe7 with SMTP id ffacd0b85a97d-38a872f6d5fmr2989417f8f.2.1736351350106;
        Wed, 08 Jan 2025 07:49:10 -0800 (PST)
Received: from alex-rivos.home (lfbn-lyo-1-472-36.w2-7.abo.wanadoo.fr. [2.7.62.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8475cesm52898915f8f.57.2025.01.08.07.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 07:49:09 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
Subject: [PATCH v3] riscv: Call secondary mmu notifier when flushing the tlb
Date: Wed,  8 Jan 2025 16:49:07 +0100
Message-Id: <20250108154907.132863-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_074914_517220_57076F22 
X-CRM114-Status: GOOD (  11.81  )
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

VGhpcyBpcyByZXF1aXJlZCB0byBhbGxvdyB0aGUgSU9NTVUgZHJpdmVyIHRvIGNvcnJlY3RseSBm
bHVzaCBpdHMgb3duClRMQi4KClNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdo
aXRpQHJpdm9zaW5jLmNvbT4KUmV2aWV3ZWQtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJp
dm9zaW5jLmNvbT4KLS0tCgpDaGFuZ2VzIGluIHYzOgotIFJlYmFzZSBvbiB0b3Agb2YgNi4xMy1y
YzMKCkNoYW5nZXMgaW4gdjI6Ci0gUmViYXNlIG9uIHRvcCBvZiA2LjktcmMxCgogYXJjaC9yaXNj
di9tbS90bGJmbHVzaC5jIHwgMzkgKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0t
LS0tCiAxIGZpbGUgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9tbS90bGJmbHVzaC5jIGIvYXJjaC9yaXNjdi9tbS90bGJm
bHVzaC5jCmluZGV4IDliNmU4NmNlMzg2Ny4uZjVmOGJjNmQxYzYxIDEwMDY0NAotLS0gYS9hcmNo
L3Jpc2N2L21tL3RsYmZsdXNoLmMKKysrIGIvYXJjaC9yaXNjdi9tbS90bGJmbHVzaC5jCkBAIC00
LDYgKzQsNyBAQAogI2luY2x1ZGUgPGxpbnV4L3NtcC5oPgogI2luY2x1ZGUgPGxpbnV4L3NjaGVk
Lmg+CiAjaW5jbHVkZSA8bGludXgvaHVnZXRsYi5oPgorI2luY2x1ZGUgPGxpbnV4L21tdV9ub3Rp
Zmllci5oPgogI2luY2x1ZGUgPGFzbS9zYmkuaD4KICNpbmNsdWRlIDxhc20vbW11X2NvbnRleHQu
aD4KIApAQCAtNzgsMTAgKzc5LDE5IEBAIHN0YXRpYyB2b2lkIF9faXBpX2ZsdXNoX3RsYl9yYW5n
ZV9hc2lkKHZvaWQgKmluZm8pCiAJbG9jYWxfZmx1c2hfdGxiX3JhbmdlX2FzaWQoZC0+c3RhcnQs
IGQtPnNpemUsIGQtPnN0cmlkZSwgZC0+YXNpZCk7CiB9CiAKLXN0YXRpYyB2b2lkIF9fZmx1c2hf
dGxiX3JhbmdlKGNvbnN0IHN0cnVjdCBjcHVtYXNrICpjbWFzaywgdW5zaWduZWQgbG9uZyBhc2lk
LAorc3RhdGljIGlubGluZSB1bnNpZ25lZCBsb25nIGdldF9tbV9hc2lkKHN0cnVjdCBtbV9zdHJ1
Y3QgKm1tKQoreworCXJldHVybiBtbSA/IGNudHgyYXNpZChhdG9taWNfbG9uZ19yZWFkKCZtbS0+
Y29udGV4dC5pZCkpIDogRkxVU0hfVExCX05PX0FTSUQ7Cit9CisKK3N0YXRpYyB2b2lkIF9fZmx1
c2hfdGxiX3JhbmdlKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLAorCQkJICAgICAgY29uc3Qgc3RydWN0
IGNwdW1hc2sgKmNtYXNrLAogCQkJICAgICAgdW5zaWduZWQgbG9uZyBzdGFydCwgdW5zaWduZWQg
bG9uZyBzaXplLAogCQkJICAgICAgdW5zaWduZWQgbG9uZyBzdHJpZGUpCiB7CisJc3RydWN0IGZs
dXNoX3RsYl9yYW5nZV9kYXRhIGZ0ZDsKKwl1bnNpZ25lZCBsb25nIGFzaWQgPSBnZXRfbW1fYXNp
ZChtbSk7CisJYm9vbCBicm9hZGNhc3Q7CiAJdW5zaWduZWQgaW50IGNwdTsKIAogCWlmIChjcHVt
YXNrX2VtcHR5KGNtYXNrKSkKQEAgLTEwNSwzMCArMTE1LDI2IEBAIHN0YXRpYyB2b2lkIF9fZmx1
c2hfdGxiX3JhbmdlKGNvbnN0IHN0cnVjdCBjcHVtYXNrICpjbWFzaywgdW5zaWduZWQgbG9uZyBh
c2lkLAogCX0KIAogCXB1dF9jcHUoKTsKLX0KIAotc3RhdGljIGlubGluZSB1bnNpZ25lZCBsb25n
IGdldF9tbV9hc2lkKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tKQotewotCXJldHVybiBjbnR4MmFzaWQo
YXRvbWljX2xvbmdfcmVhZCgmbW0tPmNvbnRleHQuaWQpKTsKKwlpZiAobW0pCisJCW1tdV9ub3Rp
Zmllcl9hcmNoX2ludmFsaWRhdGVfc2Vjb25kYXJ5X3RsYnMobW0sIHN0YXJ0LCBzdGFydCArIHNp
emUpOwogfQogCiB2b2lkIGZsdXNoX3RsYl9tbShzdHJ1Y3QgbW1fc3RydWN0ICptbSkKIHsKLQlf
X2ZsdXNoX3RsYl9yYW5nZShtbV9jcHVtYXNrKG1tKSwgZ2V0X21tX2FzaWQobW0pLAotCQkJICAw
LCBGTFVTSF9UTEJfTUFYX1NJWkUsIFBBR0VfU0laRSk7CisJX19mbHVzaF90bGJfcmFuZ2UobW0s
IG1tX2NwdW1hc2sobW0pLCAwLCBGTFVTSF9UTEJfTUFYX1NJWkUsIFBBR0VfU0laRSk7CiB9CiAK
IHZvaWQgZmx1c2hfdGxiX21tX3JhbmdlKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLAogCQkJdW5zaWdu
ZWQgbG9uZyBzdGFydCwgdW5zaWduZWQgbG9uZyBlbmQsCiAJCQl1bnNpZ25lZCBpbnQgcGFnZV9z
aXplKQogewotCV9fZmx1c2hfdGxiX3JhbmdlKG1tX2NwdW1hc2sobW0pLCBnZXRfbW1fYXNpZCht
bSksCi0JCQkgIHN0YXJ0LCBlbmQgLSBzdGFydCwgcGFnZV9zaXplKTsKKwlfX2ZsdXNoX3RsYl9y
YW5nZShtbSwgbW1fY3B1bWFzayhtbSksIHN0YXJ0LCBlbmQgLSBzdGFydCwgcGFnZV9zaXplKTsK
IH0KIAogdm9pZCBmbHVzaF90bGJfcGFnZShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwgdW5z
aWduZWQgbG9uZyBhZGRyKQogewotCV9fZmx1c2hfdGxiX3JhbmdlKG1tX2NwdW1hc2sodm1hLT52
bV9tbSksIGdldF9tbV9hc2lkKHZtYS0+dm1fbW0pLAorCV9fZmx1c2hfdGxiX3JhbmdlKHZtYS0+
dm1fbW0sIG1tX2NwdW1hc2sodm1hLT52bV9tbSksCiAJCQkgIGFkZHIsIFBBR0VfU0laRSwgUEFH
RV9TSVpFKTsKIH0KIApAQCAtMTYxLDEzICsxNjcsMTMgQEAgdm9pZCBmbHVzaF90bGJfcmFuZ2Uo
c3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsIHVuc2lnbmVkIGxvbmcgc3RhcnQsCiAJCX0KIAl9
CiAKLQlfX2ZsdXNoX3RsYl9yYW5nZShtbV9jcHVtYXNrKHZtYS0+dm1fbW0pLCBnZXRfbW1fYXNp
ZCh2bWEtPnZtX21tKSwKKwlfX2ZsdXNoX3RsYl9yYW5nZSh2bWEtPnZtX21tLCBtbV9jcHVtYXNr
KHZtYS0+dm1fbW0pLAogCQkJICBzdGFydCwgZW5kIC0gc3RhcnQsIHN0cmlkZV9zaXplKTsKIH0K
IAogdm9pZCBmbHVzaF90bGJfa2VybmVsX3JhbmdlKHVuc2lnbmVkIGxvbmcgc3RhcnQsIHVuc2ln
bmVkIGxvbmcgZW5kKQogewotCV9fZmx1c2hfdGxiX3JhbmdlKGNwdV9vbmxpbmVfbWFzaywgRkxV
U0hfVExCX05PX0FTSUQsCisJX19mbHVzaF90bGJfcmFuZ2UoTlVMTCwgY3B1X29ubGluZV9tYXNr
LAogCQkJICBzdGFydCwgZW5kIC0gc3RhcnQsIFBBR0VfU0laRSk7CiB9CiAKQEAgLTE3NSw3ICsx
ODEsNyBAQCB2b2lkIGZsdXNoX3RsYl9rZXJuZWxfcmFuZ2UodW5zaWduZWQgbG9uZyBzdGFydCwg
dW5zaWduZWQgbG9uZyBlbmQpCiB2b2lkIGZsdXNoX3BtZF90bGJfcmFuZ2Uoc3RydWN0IHZtX2Fy
ZWFfc3RydWN0ICp2bWEsIHVuc2lnbmVkIGxvbmcgc3RhcnQsCiAJCQl1bnNpZ25lZCBsb25nIGVu
ZCkKIHsKLQlfX2ZsdXNoX3RsYl9yYW5nZShtbV9jcHVtYXNrKHZtYS0+dm1fbW0pLCBnZXRfbW1f
YXNpZCh2bWEtPnZtX21tKSwKKwlfX2ZsdXNoX3RsYl9yYW5nZSh2bWEtPnZtX21tLCBtbV9jcHVt
YXNrKHZtYS0+dm1fbW0pLAogCQkJICBzdGFydCwgZW5kIC0gc3RhcnQsIFBNRF9TSVpFKTsKIH0K
ICNlbmRpZgpAQCAtMTg5LDcgKzE5NSwxMCBAQCB2b2lkIGFyY2hfdGxiYmF0Y2hfYWRkX3BlbmRp
bmcoc3RydWN0IGFyY2hfdGxiZmx1c2hfdW5tYXBfYmF0Y2ggKmJhdGNoLAogCQkJICAgICAgIHN0
cnVjdCBtbV9zdHJ1Y3QgKm1tLAogCQkJICAgICAgIHVuc2lnbmVkIGxvbmcgdWFkZHIpCiB7CisJ
dW5zaWduZWQgbG9uZyBzdGFydCA9IHVhZGRyICYgUEFHRV9NQVNLOworCiAJY3B1bWFza19vcigm
YmF0Y2gtPmNwdW1hc2ssICZiYXRjaC0+Y3B1bWFzaywgbW1fY3B1bWFzayhtbSkpOworCW1tdV9u
b3RpZmllcl9hcmNoX2ludmFsaWRhdGVfc2Vjb25kYXJ5X3RsYnMobW0sIHN0YXJ0LCBzdGFydCAr
IFBBR0VfU0laRSk7CiB9CiAKIHZvaWQgYXJjaF9mbHVzaF90bGJfYmF0Y2hlZF9wZW5kaW5nKHN0
cnVjdCBtbV9zdHJ1Y3QgKm1tKQpAQCAtMTk5LDcgKzIwOCw3IEBAIHZvaWQgYXJjaF9mbHVzaF90
bGJfYmF0Y2hlZF9wZW5kaW5nKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tKQogCiB2b2lkIGFyY2hfdGxi
YmF0Y2hfZmx1c2goc3RydWN0IGFyY2hfdGxiZmx1c2hfdW5tYXBfYmF0Y2ggKmJhdGNoKQogewot
CV9fZmx1c2hfdGxiX3JhbmdlKCZiYXRjaC0+Y3B1bWFzaywgRkxVU0hfVExCX05PX0FTSUQsIDAs
Ci0JCQkgIEZMVVNIX1RMQl9NQVhfU0laRSwgUEFHRV9TSVpFKTsKKwlfX2ZsdXNoX3RsYl9yYW5n
ZShOVUxMLCAmYmF0Y2gtPmNwdW1hc2ssCisJCQkgIDAsIEZMVVNIX1RMQl9NQVhfU0laRSwgUEFH
RV9TSVpFKTsKIAljcHVtYXNrX2NsZWFyKCZiYXRjaC0+Y3B1bWFzayk7CiB9Ci0tIAoyLjM5LjIK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
