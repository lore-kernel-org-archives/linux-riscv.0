Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B987C7113C
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 08:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NDvWHdb1aaKl/KPZX7oAAOooALzBT+zWNZbKIedN3T0=; b=Vkik9OuOIO+bJe
	9GTvVNos0urLrPYxBRGeBGap2Y82QYKTncvAgU8a6rol0wD5VSMvom34iGNPe4aS+DU1AlKRukoxi
	5xuru+INYrYHMwLO5OA174wzQSrKEFhje6ZX9xjgmn8qXLUwMSsAvHl6r0m9St57Nd5P+xU9/I4KH
	rv5SoIaNqZCQXJao2P661asT3bphfOyb1dW50uTzmxeO76Byg8S82gVCeEUQ/zJzUd+PZQpvUgZcq
	QPHZjJfI3uTJHWXwAn7e281Dv1K6+6PoTLIIfpNoqRg95lfQPw1A82sSYkkv5wEFCCGVb/NwbP9S1
	iBbCQRjqHwRFIg4SJNMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGQG-00000009BoF-0LFg;
	Wed, 11 Jun 2025 08:03:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPG2v-000000097uZ-3T2p
	for linux-riscv@bombadil.infradead.org;
	Wed, 11 Jun 2025 07:38:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=O1R7jll6gJht8nkDymGrhmtxvxJqq0Loxw0lV05Szcc=; b=b3BOvOUYH1gbzVTnm23DJo3s7j
	8sxRs03EdLbZTHBhhxZrVpepLP3BwpJkz4DAV9ZB93d6ssCVPLxSZ4YSghfBEALhJNOU5XPMYgl5j
	ZEfW4eUVGnU8ClfbW3bCeU4Xb+RRrPBWVGMUMfMY6xQFKdriPVTAYxVRFLeGzsBfvDjEBfleD8g07
	ZShpOGl60XeJ6buZWcBIXRUUsBmZdde2ntvdyoVwd80N8aDvtV4My12Pby38nvDzP9X7N0UJZdW/C
	lSuh4+37baAL9LwPh4ZNIZs+/tS4ahWVW8EpuoSuGhn/AvzORqUb/Naqh+kBOK0KqXktQVAwpj4nv
	qI2eGpWQ==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPG2t-00000002A6N-062n
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 07:38:53 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749627517;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O1R7jll6gJht8nkDymGrhmtxvxJqq0Loxw0lV05Szcc=;
	b=T5bmVhlomsZwAcdU/X7j6dy3T7WarXxEZYR1CXiMRKk+CU796SQVVyAHTS6PQFRQ5gVs5x
	Wese/kbbKWAUJ1dxki/bt88X7jLaSJNauxKYq9ibR2X0O0SIlouvxE03fugjgFxMW2e1re
	QHPyTRCoWkZ5HbuNoM3tqPsMrOlHN1YiO3AwWSkjH70wa17Syf4SzgzL81mR0zZExQC4sf
	w+aeOdFDtewCxLPJgslSZwt3j3EA8BzAcHyUjLdVADvKEOgBa3JwbMtP/GC3IuOppVUyvw
	cuYoHpm/eWKm4gc5hcOp2gQqZi9yH7UsfeAbkenAK3IxK5oIj1aMmQ+lOU1JzA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749627517;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O1R7jll6gJht8nkDymGrhmtxvxJqq0Loxw0lV05Szcc=;
	b=PT0tliqc5evsvvZ4i67OWnTDNH/6Ac0eDMwC7CU/FIay95ZcIy8xl/gMJFV+k2UBU07+Dd
	bDgtv0inwB1/MGAA==
Date: Wed, 11 Jun 2025 09:38:20 +0200
Subject: [PATCH v3 14/16] kunit: uapi: Add example for UAPI tests
MIME-Version: 1.0
Message-Id: <20250611-kunit-kselftests-v3-14-55e3d148cbc6@linutronix.de>
References: <20250611-kunit-kselftests-v3-0-55e3d148cbc6@linutronix.de>
In-Reply-To: <20250611-kunit-kselftests-v3-0-55e3d148cbc6@linutronix.de>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Willy Tarreau <w@1wt.eu>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
 Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Nicolas Schier <nicolas.schier@linux.dev>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 workflows@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749627510; l=3252;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=NFNt7Qlaqk+bPAFRhwXBhyWH+aNFky6f4VGa4UdOsxk=;
 b=spGlc8yDjyRQUfz/VdgRBAAb7qkA9L7+W1fZOkmv4Jim/pNIBkdQvlRNJtXN+DGP8/r7zzMFs
 TCgUpuwUjiSALsSPVj1aILfRC0X4jvrUyT19wM8nT+07D/0Yz3jB93d
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_083851_235154_EC52A800 
X-CRM114-Status: GOOD (  13.56  )
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

RXh0ZW5kIHRoZSBleGFtcGxlIHRvIHNob3cgaG93IHRvIHJ1biBhIHVzZXJzcGFjZSBleGVjdXRh
YmxlLgoKU2lnbmVkLW9mZi1ieTogVGhvbWFzIFdlacOfc2NodWggPHRob21hcy53ZWlzc3NjaHVo
QGxpbnV0cm9uaXguZGU+Ci0tLQogbGliL2t1bml0L01ha2VmaWxlICAgICAgICAgICAgIHwgIDkg
KysrKysrKystCiBsaWIva3VuaXQva3VuaXQtZXhhbXBsZS10ZXN0LmMgfCAxNSArKysrKysrKysr
KysrKysKIGxpYi9rdW5pdC9rdW5pdC1leGFtcGxlLXVhcGkuYyB8IDIyICsrKysrKysrKysrKysr
KysrKysrKysKIDMgZmlsZXMgY2hhbmdlZCwgNDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQoKZGlmZiAtLWdpdCBhL2xpYi9rdW5pdC9NYWtlZmlsZSBiL2xpYi9rdW5pdC9NYWtlZmlsZQpp
bmRleCBkYWZhMDliZDQyNDFjMjRkMzFjNGMxOWVkZWNiNjdiZjcyNDEyN2Q3Li5lNDA2YTMxZGYx
ZGY4MzRhODc5NjE2NjNkZTBiNzkyMWI1OTQ4MWMyIDEwMDY0NAotLS0gYS9saWIva3VuaXQvTWFr
ZWZpbGUKKysrIGIvbGliL2t1bml0L01ha2VmaWxlCkBAIC0zMCw0ICszMCwxMSBAQCBvYmotJChD
T05GSUdfS1VOSVRfVEVTVCkgKz0JCXN0cmluZy1zdHJlYW0tdGVzdC5vCiBvYmotJChDT05GSUdf
S1VOSVRfVEVTVCkgKz0JCWFzc2VydF90ZXN0Lm8KIGVuZGlmCiAKLW9iai0kKENPTkZJR19LVU5J
VF9FWEFNUExFX1RFU1QpICs9CWt1bml0LWV4YW1wbGUtdGVzdC5vCit1c2VycHJvZ3MgKz0JCQkJ
a3VuaXQtZXhhbXBsZS11YXBpCitrdW5pdC1leGFtcGxlLXVhcGktdXNlcmNjZmxhZ3MgOj0JLXN0
YXRpYwora3VuaXQtZXhhbXBsZS11YXBpLW5vbGliYyA6PQkJJChDT05GSUdfQVJDSF9IQVNfTk9M
SUJDKQorYmxvYnMgKz0JCQkJa3VuaXQtZXhhbXBsZS11YXBpLmJsb2IubworCitvYmotJChDT05G
SUdfS1VOSVRfRVhBTVBMRV9URVNUKSArPQlrdW5pdC1leGFtcGxlLW1vZC5vCitrdW5pdC1leGFt
cGxlLW1vZC15ICs9CQkJa3VuaXQtZXhhbXBsZS10ZXN0Lm8KK2t1bml0LWV4YW1wbGUtbW9kLSQo
Q09ORklHX0tVTklUX1VBUEkpICs9IGt1bml0LWV4YW1wbGUtdWFwaS5ibG9iLm8KZGlmZiAtLWdp
dCBhL2xpYi9rdW5pdC9rdW5pdC1leGFtcGxlLXRlc3QuYyBiL2xpYi9rdW5pdC9rdW5pdC1leGFt
cGxlLXRlc3QuYwppbmRleCAzMDU2ZDZiYzcwNWQwYThmMTk2ZjBmNDQxMmU2NzlkYmIwZTAzMTE0
Li5iMjY4MWE2ZTA0N2RmZDZmZWE0YTdjY2E2MGU4MTY1MWQwOWMyZWFlIDEwMDY0NAotLS0gYS9s
aWIva3VuaXQva3VuaXQtZXhhbXBsZS10ZXN0LmMKKysrIGIvbGliL2t1bml0L2t1bml0LWV4YW1w
bGUtdGVzdC5jCkBAIC02LDggKzYsMTEgQEAKICAqIEF1dGhvcjogQnJlbmRhbiBIaWdnaW5zIDxi
cmVuZGFuaGlnZ2luc0Bnb29nbGUuY29tPgogICovCiAKKyNpbmNsdWRlIDxsaW51eC9ibG9iLmg+
CisKICNpbmNsdWRlIDxrdW5pdC90ZXN0Lmg+CiAjaW5jbHVkZSA8a3VuaXQvc3RhdGljX3N0dWIu
aD4KKyNpbmNsdWRlIDxrdW5pdC91YXBpLmg+CiAKIC8qCiAgKiBUaGlzIGlzIHRoZSBtb3N0IGZ1
bmRhbWVudGFsIGVsZW1lbnQgb2YgS1VuaXQsIHRoZSB0ZXN0IGNhc2UuIEEgdGVzdCBjYXNlCkBA
IC0yNzcsNiArMjgwLDE3IEBAIHN0YXRpYyB2b2lkIGV4YW1wbGVfc2xvd190ZXN0KHN0cnVjdCBr
dW5pdCAqdGVzdCkKIAlLVU5JVF9FWFBFQ1RfRVEodGVzdCwgMSArIDEsIDIpOwogfQogCisvKgor
ICogVGhpcyB0ZXN0IHNob3dzIHRoZSB1c2FnZSBvZiBVQVBJIHRlc3RzLgorICovCitzdGF0aWMg
dm9pZCBleGFtcGxlX3VhcGlfdGVzdChzdHJ1Y3Qga3VuaXQgKnRlc3QpCit7CisJaWYgKElTX0VO
QUJMRUQoQ09ORklHX0tVTklUX1VBUEkpKQorCQlrdW5pdF91YXBpX3J1bl9rc2VsZnRlc3QodGVz
dCwgQkxPQihrdW5pdF9leGFtcGxlX3VhcGkpKTsKKwllbHNlCisJCWt1bml0X3NraXAodGVzdCwg
IkNPTkZJR19LVU5JVF9VQVBJIGlzIG5vdCBlbmFibGVkIik7Cit9CisKIC8qCiAgKiBIZXJlIHdl
IG1ha2UgYSBsaXN0IG9mIGFsbCB0aGUgdGVzdCBjYXNlcyB3ZSB3YW50IHRvIGFkZCB0byB0aGUg
dGVzdCBzdWl0ZQogICogYmVsb3cuCkBAIC0yOTcsNiArMzExLDcgQEAgc3RhdGljIHN0cnVjdCBr
dW5pdF9jYXNlIGV4YW1wbGVfdGVzdF9jYXNlc1tdID0gewogCUtVTklUX0NBU0UoZXhhbXBsZV9w
cml2X3Rlc3QpLAogCUtVTklUX0NBU0VfUEFSQU0oZXhhbXBsZV9wYXJhbXNfdGVzdCwgZXhhbXBs
ZV9nZW5fcGFyYW1zKSwKIAlLVU5JVF9DQVNFX1NMT1coZXhhbXBsZV9zbG93X3Rlc3QpLAorCUtV
TklUX0NBU0UoZXhhbXBsZV91YXBpX3Rlc3QpLAogCXt9CiB9OwogCmRpZmYgLS1naXQgYS9saWIv
a3VuaXQva3VuaXQtZXhhbXBsZS11YXBpLmMgYi9saWIva3VuaXQva3VuaXQtZXhhbXBsZS11YXBp
LmMKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMC4uNGNlNjU3MDUwZGQ0YTU3NjYzMmE0MWNhMDMwOWM0Y2I1MTM0Y2UxNAot
LS0gL2Rldi9udWxsCisrKyBiL2xpYi9rdW5pdC9rdW5pdC1leGFtcGxlLXVhcGkuYwpAQCAtMCww
ICsxLDIyIEBACisvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAorLyoKKyAqIEtV
bml0IFVzZXJzcGFjZSBleGFtcGxlIHRlc3QuCisgKgorICogQ29weXJpZ2h0IChDKSAyMDI1LCBM
aW51dHJvbml4IEdtYkguCisgKiBBdXRob3I6IFRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vp
c3NzY2h1aEBsaW51dHJvbml4LmRlPgorICoKKyAqIFRoaXMgaXMgKnVzZXJzcGFjZSogY29kZS4K
KyAqLworCisjaW5jbHVkZSAiLi4vLi4vdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3NlbGZ0ZXN0
LmgiCisKK2ludCBtYWluKHZvaWQpCit7CisJa3NmdF9wcmludF9oZWFkZXIoKTsKKwlrc2Z0X3Nl
dF9wbGFuKDQpOworCWtzZnRfdGVzdF9yZXN1bHRfcGFzcygidXNlcnNwYWNlIHRlc3QgMVxuIik7
CisJa3NmdF90ZXN0X3Jlc3VsdF9wYXNzKCJ1c2Vyc3BhY2UgdGVzdCAyXG4iKTsKKwlrc2Z0X3Rl
c3RfcmVzdWx0X3NraXAoInVzZXJzcGFjZSB0ZXN0IDM6IHNvbWUgcmVhc29uXG4iKTsKKwlrc2Z0
X3Rlc3RfcmVzdWx0X3Bhc3MoInVzZXJzcGFjZSB0ZXN0IDRcbiIpOworCWtzZnRfZmluaXNoZWQo
KTsKK30KCi0tIAoyLjQ5LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
