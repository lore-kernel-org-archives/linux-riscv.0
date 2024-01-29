Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F2BFC47DB3
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jan 2024 18:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KLO99ZRp8uwl6xb9E3U3SaAvoMhULWn4ZkcDdv0ZlXA=; b=wtLCzU6AsXfZWn
	ypaabyuFBo5NZuZamcA1+9RiOGVTnbMteG6EFsB66m5QXRSQBBc1WT7bAyvttoHeGF8CDRvgBmrUp
	4tfw9voqWrML5nVSQ6WurL+nmgEDVJolvbgHie+qbM9BU6eYtXb4aB8Bx8qElVqdeTw2XjfiQK/C3
	ekrCs3UDxAHS1bSsewezvOsZbZ8o+4BhBiURLkoGPN4iLsK/8mk4wSmo3JPpvVexuFR1KNZzyh5VW
	EBs1V9PAZhvJvVYIvh9rUMkd0lAS7ea4qQzRFeizP9kNzF/FdQJMEjmJI1uenfWBmo0VKbUfzKHIY
	HID8lQUU889zebTu2KZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUWT9-0000000Dx33-1IAZ;
	Mon, 29 Jan 2024 18:34:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUWT6-0000000Dx2E-3CNE
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jan 2024 18:34:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1EADC623F5;
	Mon, 29 Jan 2024 18:34:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BF1BC43390;
	Mon, 29 Jan 2024 18:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706553291;
	bh=zbxsB1oxUos+a3QWxXh+2OjTJJLQCeYRqaI3ZWG1QEI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bJBeMdWerZ4vPia3gjlF2Vpy0sG+4WuBYGxJ4wA+M3Yu/2xML3PY4w1jKSwZ9JoTR
	 qCOFwAlFS0l22DHcetFC23dQThFgpKNvaTGuBNUUQNF0r7bYX84C623wRTmaNTFmSA
	 GOG/ZaCWnsJKINE9sOLhiQaUeFohtYFE/RV47JbkFIzRaSPjB77ygjsgzB+TNnn0bt
	 Ys+AXaHWwPmsbLqFRH3Wq2eq4l8qDdhnKxDJT+gn+f+omi57VTtcmJ4d6IFjckfTbs
	 trfYSI3xQaDh3ZCB8DygX727N0HXeKJU57j2zERR30XIE4JOq1L/C135lsC1b35p+k
	 Z9n5Rr68cex0Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Sasha Levin <sashal@kernel.org>,
	shuah@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	conor.dooley@microchip.com,
	evan@rivosinc.com,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 6.7 04/12] tools: selftests: riscv: Fix compile warnings in hwprobe
Date: Mon, 29 Jan 2024 13:34:13 -0500
Message-ID: <20240129183440.463998-4-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240129183440.463998-1-sashal@kernel.org>
References: <20240129183440.463998-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.7.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_103452_869898_9BA0D395 
X-CRM114-Status: UNSURE (   9.90  )
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

RnJvbTogQ2hyaXN0b3BoIE3DvGxsbmVyIDxjaHJpc3RvcGgubXVlbGxuZXJAdnJ1bGwuZXU+Cgpb
IFVwc3RyZWFtIGNvbW1pdCBiOTFjMjZmZGIwZTgxNTBjZGI2MTBjZGFhZGVhNjJiYjVlNDNiZWUw
IF0KCkdDQyBwcmludHMgYSBjb3VwbGUgb2YgZm9ybWF0IHN0cmluZyB3YXJuaW5ncyB3aGVuIGNv
bXBpbGluZwp0aGUgaHdwcm9iZSB0ZXN0LiBMZXQncyBmb2xsb3cgdGhlIHJlY29tbWVuZGF0aW9u
IGluCkRvY3VtZW50YXRpb24vcHJpbnRrLWZvcm1hdHMudHh0IHRvIGZpeCB0aGVzZSB3YXJuaW5n
cy4KClNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBNw7xsbG5lciA8Y2hyaXN0b3BoLm11ZWxsbmVy
QHZydWxsLmV1PgpSZXZpZXdlZC1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3Np
bmMuY29tPgpSZXZpZXdlZC1ieTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNv
bT4KTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDIzMTEyMzE4NTgyMS4yMjcyNTA0
LTItY2hyaXN0b3BoLm11ZWxsbmVyQHZydWxsLmV1ClNpZ25lZC1vZmYtYnk6IFBhbG1lciBEYWJi
ZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPgpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2Fz
aGFsQGtlcm5lbC5vcmc+Ci0tLQogdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvaHdwcm9i
ZS9od3Byb2JlLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3Yv
aHdwcm9iZS9od3Byb2JlLmMgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi9od3Byb2Jl
L2h3cHJvYmUuYwppbmRleCBjNDc0ODkxZGYzMDcuLmFiYjgyNTgxMWM3MCAxMDA2NDQKLS0tIGEv
dG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvaHdwcm9iZS9od3Byb2JlLmMKKysrIGIvdG9v
bHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvaHdwcm9iZS9od3Byb2JlLmMKQEAgLTI5LDcgKzI5
LDcgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKiphcmd2KQogCQkvKiBGYWlsIGlmIHRoZSBr
ZXJuZWwgY2xhaW1zIG5vdCB0byByZWNvZ25pemUgYSBiYXNlIGtleS4gKi8KIAkJaWYgKChpIDwg
NCkgJiYgKHBhaXJzW2ldLmtleSAhPSBpKSkKIAkJCWtzZnRfZXhpdF9mYWlsX21zZygiRmFpbGVk
IHRvIHJlY29nbml6ZSBiYXNlIGtleToga2V5ICE9IGksICIKLQkJCQkJICAgImtleT0lbGQsIGk9
JWxkXG4iLCBwYWlyc1tpXS5rZXksIGkpOworCQkJCQkgICAia2V5PSVsbGQsIGk9JWxkXG4iLCBw
YWlyc1tpXS5rZXksIGkpOwogCiAJCWlmIChwYWlyc1tpXS5rZXkgIT0gUklTQ1ZfSFdQUk9CRV9L
RVlfQkFTRV9CRUhBVklPUikKIAkJCWNvbnRpbnVlOwpAQCAtMzcsNyArMzcsNyBAQCBpbnQgbWFp
bihpbnQgYXJnYywgY2hhciAqKmFyZ3YpCiAJCWlmIChwYWlyc1tpXS52YWx1ZSAmIFJJU0NWX0hX
UFJPQkVfQkFTRV9CRUhBVklPUl9JTUEpCiAJCQljb250aW51ZTsKIAotCQlrc2Z0X2V4aXRfZmFp
bF9tc2coIlVuZXhwZWN0ZWQgcGFpcjogKCVsZCwgJWxkKVxuIiwgcGFpcnNbaV0ua2V5LCBwYWly
c1tpXS52YWx1ZSk7CisJCWtzZnRfZXhpdF9mYWlsX21zZygiVW5leHBlY3RlZCBwYWlyOiAoJWxs
ZCwgJWxsdSlcbiIsIHBhaXJzW2ldLmtleSwgcGFpcnNbaV0udmFsdWUpOwogCX0KIAogCW91dCA9
IHJpc2N2X2h3cHJvYmUocGFpcnMsIDgsIDAsIDAsIDApOwotLSAKMi40My4wCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
