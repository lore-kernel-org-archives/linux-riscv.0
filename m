Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 926E7FED2F9
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Mar 2026 10:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RndaYdtVpkz2jReZ5SgTY65/YhFFlbrynLt395f4yB8=; b=V1GcEmBi9yygzl
	OBVMRXDe5z93OAEOeiWuXlcMFme2Ix7hSFU2n3NzoaBvBcRu53PiB9vjY1o/P8AMMy2J91JAglaVz
	kzJmZozbXsU2wL8T0AZct43UnrwBud65NcH/zSBrWTpj8LKQNDJdwYp8AHAEaAS1BVU96gIGTs82Q
	ADG0Fyfe7pO2D3AzEl7HTjXkF53w6mpVmQn4976XBNPmgC2oixb855HXfHvQlTMP2B7pKR0IAOhzC
	b6pg953DqADhIfN5j8inE7O9yhkOClPErVYjAtVqWDhGaC8u8f5GBgl6AZiGgP/K5xNEwxsltj5OF
	t+3v8/7iw4tMvaCwtuRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0d1e-0000000DqTk-3aER;
	Thu, 12 Mar 2026 10:12:18 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0d1c-0000000DqSc-1Oe7
	for linux-riscv@lists.infradead.org;
	Thu, 12 Mar 2026 10:12:17 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D351F4E42650;
	Thu, 12 Mar 2026 10:12:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A38075FDEB;
	Thu, 12 Mar 2026 10:12:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1111D10369D7E;
	Thu, 12 Mar 2026 11:12:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773310333; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=x8skTqfbUD9JCb+byF4bxHeI2j2p4qGQHJqCgQ+a5aQ=;
	b=04hDAdl8RvFZx/TOY2lTFmGctnnSllSuRGcHq5JwcC/6m7SIzb3AaUnyuLGuExembkBapt
	frxtQrPrA2QqzhznosGaeVJNWuOsdpBq1zCCXGP5TMzKsnCc2lYS4YOXw29f2Gj7x4Eo6x
	qTF3AAfBwWsHxobvSJQXKBym+nIc403gb2R+PtFvdSunV4zSERva++eiBn60+5Qf1mABt+
	W/erSgrUVW7G62f3gNiWu0jbdPDtZ7l6uUf/3PoGR1IRoPWAG7+4Q2i0yf1EK2FDMYpxEc
	9HJV2xkPllL+3TaRDULBsVrX3kZ1qo8aVEnxXIUmaP1F1/18MdtOK97hMa3V/g==
From: =?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>
To: theo.lebrun@bootlin.com
Cc: Ryan.Wanner@microchip.com,
	Valentina.FernandezAlanis@microchip.com,
	abin.joseph@amd.com,
	alex@ghiti.fr,
	andrew+netdev@lunn.ch,
	aou@eecs.berkeley.edu,
	claudiu.beznea@tuxon.dev,
	conor+dt@kernel.org,
	conor.dooley@microchip.com,
	conor@kernel.org,
	daire.mcnamara@microchip.com,
	dave.stevenson@raspberrypi.com,
	davem@davemloft.net,
	devicetree@vger.kernel.org,
	edumazet@google.com,
	gregory.clement@bootlin.com,
	krzk+dt@kernel.org,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org,
	nicolas.ferre@microchip.com,
	pabeni@redhat.com,
	palmer@dabbelt.com,
	pjw@kernel.org,
	richardcochran@gmail.com,
	robh@kernel.org,
	samuel.holland@sifive.com,
	sean.anderson@linux.dev,
	thomas.petazzoni@bootlin.com,
	vineeth.karumanchi@amd.com
Subject: [PATCH 3/3] net: macb: drop usrio pointer on EyeQ5 config
Date: Thu, 12 Mar 2026 11:11:38 +0100
Message-ID: <20260312101138.465482-3-theo.lebrun@bootlin.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260312101138.465482-1-theo.lebrun@bootlin.com>
References: <DH0PZN0WJZC5.26KLH464PMMTP@bootlin.com>
 <20260312101138.465482-1-theo.lebrun@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_031216_506946_EF04BDC1 
X-CRM114-Status: UNSURE (   9.12  )
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

VVNSSU8gaXMgZGlzYWJsZWQgb24gdGhpcyBwbGF0Zm9ybSwgZHJvcCBpdHMgaW5oZXJpdGVkIHVz
cmlvIGNvbmZpZy4KV2Ugd2lsbCBlbmQgdXAgd2l0aCBNQUNCX0NBUFNfVVNSSU9fRElTQUJMRUQg
b24gdGhpcyBwbGF0Zm9ybToKIC0gV2UgaGF2ZSBubyBjb25maWctPnVzcmlvIHNvIG1hY2JfY29u
ZmlndXJlX2NhcHMoKSBkZWR1Y2VzIHRoYXQgdGhlCiAgIGZlYXR1cmUgaXMgZGlzYWJsZWQuCiAt
IEFuZWNkb3RhbGx5LCB3ZSB3b3VsZCBhbHNvIGxhbmQgaW4gdGhlIHJ1bnRpbWUgZGV0ZWN0aW9u
IGNvZGVwYXRoCiAgIHRoYXQgcmVhZHMgRENGRzEuCgpTaWduZWQtb2ZmLWJ5OiBUaMOpbyBMZWJy
dW4gPHRoZW8ubGVicnVuQGJvb3RsaW4uY29tPgotLS0KIGRyaXZlcnMvbmV0L2V0aGVybmV0L2Nh
ZGVuY2UvbWFjYl9tYWluLmMgfCAxIC0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvY2FkZW5jZS9tYWNiX21haW4uYyBiL2Ry
aXZlcnMvbmV0L2V0aGVybmV0L2NhZGVuY2UvbWFjYl9tYWluLmMKaW5kZXggOTcyNDk5YWE0MTkx
Li4wZTIyMDBjZjQyMDYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L2NhZGVuY2Uv
bWFjYl9tYWluLmMKKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvY2FkZW5jZS9tYWNiX21haW4u
YwpAQCAtNTU5Miw3ICs1NTkyLDYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtYWNiX2NvbmZpZyBl
eWVxNV9jb25maWcgPSB7CiAJLmNsa19pbml0ID0gbWFjYl9jbGtfaW5pdCwKIAkuaW5pdCA9IGV5
ZXE1X2luaXQsCiAJLmp1bWJvX21heF9sZW4gPSAxMDI0MCwKLQkudXNyaW8gPSAmYXQ5MV9kZWZh
dWx0X3VzcmlvLAogfTsKIAogc3RhdGljIGNvbnN0IHN0cnVjdCBtYWNiX2NvbmZpZyByYXNwYmVy
cnlwaV9ycDFfY29uZmlnID0gewotLSAKMi41My4wCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
