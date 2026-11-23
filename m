Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B02606A31F
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 09:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=M1tasczv;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=xIytSaYS;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=2Pxz/VbW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XBmNGTpLtvGn9n8Udkc4FcME9EwUr9N/e0ADs5yWe7c=; b=M1tasczvELMRHOyzAoP+5DmfOH
	qe0BiWWdaz/IlYHBZZ44ZYctEE9G432jPsoNt/H0skz6ItaBlii9fY7LtL8fOGUTAObVmsx5MzBqA
	iqYXKssyn9uJqr7X6VzE8rKjD47GEZg8Z8Ajq4z8nWftIUc7kP0i/hK7jFhWO+MiLW8fZ1uPVKrDm
	pd+AeBS+nz25xvFPXBL9l5dr9TcENWhzp7s24qaVtMth3y3FMPcSBIEaQ3UXJj1dm6nto6Yh8Z2zw
	OJS/LqAdmbaw0hsgmnbT/fpckqK3R4i9qvGiQbFJwqOL7bNlxj9g3UcjdGbvTVkhiErOGNhvsiu5+
	BjwbvhAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQUl-00000002k6G-19bt;
	Mon, 23 Nov 2026 09:37:55 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQUO-00000002jnu-0SL5;
	Mon, 23 Nov 2026 09:37:34 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795426647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dCjIARJZuyF2MKvJaqs9gktLzUWSriQ88u2CMxFe+40=;
	b=xIytSaYSFHN7/y9Cb6dzhLZoJdiOyeCxL5r4X+xqU1KFQodlzXHZ1+mdJGSlR3PQJg/1Uu
	fVEOi0x/TStTeHc0h3jLEkDxpbGD04A8mgZYbnKq9zmR2jvB8zm/yvcNnKATqqhSeRE4cs
	rbwbg8XerkQgAhVy0iuT2y0+x7S4fKS9pkrVkrtuYk0suVgPk0rhV4B6QeeuRr1V/2qiJK
	jJLheGc1xc/Ka1IE87KoIi9cqes27CLdqY+GeL9LX9NWEBINRVASPjjMH6az7WGiDShQU+
	qo0U9lTYqdekyvsiFR1cd6CavQlCKnS4Hj5w6SaaE4O6EZFYxKYRLwFmcf1K/w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795426647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dCjIARJZuyF2MKvJaqs9gktLzUWSriQ88u2CMxFe+40=;
	b=2Pxz/VbWqlx26KJWhfHWSW1lo3/0I1ylQ3IrkZhGN8RmXz3hJdqDbSsE/kFGz+dsGZWEYw
	0UR9RJ8W7uv7rIBA==
Date: Mon, 23 Nov 2026 10:37:08 +0100
Subject: [PATCH v3 03/15] asm-generic: add an in-kernel auxvec.h header
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261123-at-vector-size-arch-v3-3-d342dae9e843@linutronix.de>
References: <20261123-at-vector-size-arch-v3-0-d342dae9e843@linutronix.de>
In-Reply-To: <20261123-at-vector-size-arch-v3-0-d342dae9e843@linutronix.de>
To: Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-sh@vger.kernel.org, linux-alpha@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795426640; l=2500;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=bABQvj2R57kM1fjG2HzTA04qWWs5Q4Mt3h+20ozb1Bw=;
 b=c7YPyzew3rWzJzbI2YP0fm7hSzzpwV/lGlOxq0YhZpLxMX5aMMqlW9Ut22ftoTisF/UfC1sVF
 xSIj1kgJmJ8AVkpAm3KQ8rGCCmbjRYaF6z2sQQD5o8/QyTjOH9GD+al
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_013732_296996_E1312783 
X-CRM114-Status: GOOD (  10.77  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VXBjb21pbmcgY2hhbmdlcyB3aWxsIGNyZWF0ZSBhcmNoaXRlY3R1cmUtc3BlY2lmaWMgYXNtL2F1
eHZlYy5oIGhlYWRlcnMuCkFkZCBhc20tZ2VuZXJpYyBpbmZyYXN0cnVjdHVyZSB0byBoYW5kbGUg
dGhlIGZhbGxiYWNrcyBmb3IgYXJjaGl0ZWN0dXJlcwp3aGljaCBhcmUgbm90IG1pZ3JhdGVkIHll
dCBhbmQgdGhvc2Ugd2hpY2ggd29uJ3QgcmVxdWlyZSB0aGVpciBvd24KZGVmaW5pdGlvbi4KCkV4
dGVuZCB0aGUgbGlzdCBvZiBpbmNsdWRlcyBpbiBsaW51eC9hdXh2ZWMuaCB0byBjb3ZlciBhbGwg
cG90ZW50aWFsCmxvdy1sZXZlbCBhdXh2ZWMuaCBoZWFkZXJzLgoKU2lnbmVkLW9mZi1ieTogVGhv
bWFzIFdlacOfc2NodWggPHRob21hcy53ZWlzc3NjaHVoQGxpbnV0cm9uaXguZGU+ClJldmlld2Vk
LWJ5OiBLZWVzIENvb2sgPGtlZXNAa2VybmVsLm9yZz4KLS0tCiBNQUlOVEFJTkVSUyAgICAgICAg
ICAgICAgICAgIHwgMiArKwogaW5jbHVkZS9hc20tZ2VuZXJpYy9LYnVpbGQgICB8IDEgKwogaW5j
bHVkZS9hc20tZ2VuZXJpYy9hdXh2ZWMuaCB8IDcgKysrKysrKwogaW5jbHVkZS9saW51eC9hdXh2
ZWMuaCAgICAgICB8IDIgKysKIDQgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMKaW5kZXggYTY1OWM5YmZiMGYwLi44
Y2VlNThlMzIzYTAgMTAwNjQ0Ci0tLSBhL01BSU5UQUlORVJTCisrKyBiL01BSU5UQUlORVJTCkBA
IC0xMDA3MywxMiArMTAwNzMsMTQgQEAgTDoJbGludXgtbW1Aa3ZhY2sub3JnCiBTOglTdXBwb3J0
ZWQKIFQ6CWdpdCBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQv
a2Vlcy9saW51eC5naXQgZm9yLW5leHQvZXhlY3ZlCiBGOglEb2N1bWVudGF0aW9uL3VzZXJzcGFj
ZS1hcGkvRUxGLnJzdAorRjoJYXJjaC8qL2luY2x1ZGUvYXNtL2F1eHZlYy5oCiBGOglhcmNoLyov
aW5jbHVkZS91YXBpL2FzbS9hdXh2ZWMuaAogRjoJZnMvKmJpbmZtdF8qLmMKIEY6CWZzL0tjb25m
aWcuYmluZm10CiBGOglmcy9leGVjLmMKIEY6CWZzL3Rlc3RzL2JpbmZtdF8qX2t1bml0LmMKIEY6
CWZzL3Rlc3RzL2V4ZWNfa3VuaXQuYworRjoJaW5jbHVkZS9hc20tZ2VuZXJpYy9hdXh2ZWMuaAog
RjoJaW5jbHVkZS9saW51eC9hdXh2ZWMuaAogRjoJaW5jbHVkZS9saW51eC9iaW5mbXRzLmgKIEY6
CWluY2x1ZGUvbGludXgvZWxmLmgKZGlmZiAtLWdpdCBhL2luY2x1ZGUvYXNtLWdlbmVyaWMvS2J1
aWxkIGIvaW5jbHVkZS9hc20tZ2VuZXJpYy9LYnVpbGQKaW5kZXggYjdhMzg4YmVmNmVhLi42ZGM1
NDM1OWM0YjEgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvYXNtLWdlbmVyaWMvS2J1aWxkCisrKyBiL2lu
Y2x1ZGUvYXNtLWdlbmVyaWMvS2J1aWxkCkBAIC02LDYgKzYsNyBAQAogCiBtYW5kYXRvcnkteSAr
PSBhdG9taWMuaAogbWFuZGF0b3J5LXkgKz0gYXJjaHJhbmRvbS5oCittYW5kYXRvcnkteSArPSBh
dXh2ZWMuaAogbWFuZGF0b3J5LXkgKz0gYmFycmllci5oCiBtYW5kYXRvcnkteSArPSBiaXRvcHMu
aAogbWFuZGF0b3J5LXkgKz0gYnVnLmgKZGlmZiAtLWdpdCBhL2luY2x1ZGUvYXNtLWdlbmVyaWMv
YXV4dmVjLmggYi9pbmNsdWRlL2FzbS1nZW5lcmljL2F1eHZlYy5oCm5ldyBmaWxlIG1vZGUgMTAw
NjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uYjVmNzNmMzVlMjFjCi0tLSAvZGV2L251bGwKKysrIGIv
aW5jbHVkZS9hc20tZ2VuZXJpYy9hdXh2ZWMuaApAQCAtMCwwICsxLDcgQEAKKy8qIFNQRFgtTGlj
ZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wICovCisjaWZuZGVmIF9fQVNNX0dFTkVSSUNfQVVYVkVD
X0hfXworI2RlZmluZSBfX0FTTV9HRU5FUklDX0FVWFZFQ19IX18KKworI2RlZmluZSBBVF9WRUNU
T1JfU0laRV9BUkNIIDAKKworI2VuZGlmIC8qIF9fQVNNX0dFTkVSSUNfQVVYVkVDX0hfXyAqLwpk
aWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9hdXh2ZWMuaCBiL2luY2x1ZGUvbGludXgvYXV4dmVj
LmgKaW5kZXggNGIzNjRlNjM5ZjA4Li5kZTFjMzNjNGEyNTYgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUv
bGludXgvYXV4dmVjLmgKKysrIGIvaW5jbHVkZS9saW51eC9hdXh2ZWMuaApAQCAtMiw3ICsyLDkg
QEAKICNpZm5kZWYgX0xJTlVYX0FVWFZFQ19ICiAjZGVmaW5lIF9MSU5VWF9BVVhWRUNfSAogCisj
aW5jbHVkZSA8dWFwaS9hc20vYXV4dmVjLmg+CiAjaW5jbHVkZSA8dWFwaS9saW51eC9hdXh2ZWMu
aD4KKyNpbmNsdWRlIDxhc20vYXV4dmVjLmg+CiAKICNkZWZpbmUgQVRfVkVDVE9SX1NJWkVfQkFT
RSAyNCAvKiBORVdfQVVYX0VOVCBlbnRyaWVzIGluIGF1eGlsaWFyeSB0YWJsZSAqLwogICAvKiBu
dW1iZXIgb2YgIiNkZWZpbmUgQVRfLioiIGFib3ZlLCBtaW51cyB7QVRfTlVMTCwgQVRfSUdOT1JF
LCBBVF9OT1RFTEZ9ICovCgotLSAKMi41Ni4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
