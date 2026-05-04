Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A0B6CD3436
	for <linux-riscv@archiver.kernel.org>; Mon,  4 May 2026 06:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VT8B4Zmzkpx8WXXtZ0du444fxLu2TVNhA7p5+gSTnlU=; b=Cpk0eTXesHLLVS
	IfZL4hxG7q0uWCu/DXdGGS6xIheq9THhISmOamI3vvnP/gAnI3vYg4T6cKSE2ZvBFp/PP+wZGGQBt
	gcUz71DQJN2gqqlNC9QciWSBCeYVdjnv7mDc5QtuMc3bQxqjUkL1FgWWjgFbOlmnvten5WM9dS9hx
	mjAYyJv8GS7xy2dX2as2RdPkcSLmzLelUiWRE/VY2aCyCY6WyFl7SpQ3vs75c2Zh6CCIbISigEgRq
	CWW5dm1rMJk1sG4xPzspQICgeNplTkodTMdmhNrOUssFBh+RyW0moTSzsxzDezQL9QPFPKQMS4Tv3
	iAvrIL4FzqkGC73EhhPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJmpa-0000000CVia-19Qt;
	Mon, 04 May 2026 06:31:02 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJmpV-0000000CVf8-3KNO
	for linux-riscv@lists.infradead.org;
	Mon, 04 May 2026 06:31:00 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1777876254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w0ZhpEesyPcJsgXO4/btUK0FfWLbWwsk83ByeRkFbmE=;
	b=PgnPOXrtRlkvLCjQZ0dF3+Jb1AmeioRewTWiCABYyCe2dnmYMQC1q+UIoMLiuS8FoqwYj8
	bMOs3A5/s/D53ZKjVkfLQTS4+f8GOyPyrene1kGmj5VsizyWHoOYrRPFaDgCH95rOd2NBW
	Ew30v1kg88kRuwVXKM6kIkLqhQzG/CSU7/wbJWK6CQL/DK+uffWgEUC00742UitDOx+x0a
	f6CGc2QRu/W9gP8J2xsOE31IICDubMQBVNtrR9JGSNExcVyu+W8ghEqWlsHw4JMghmUYS4
	t8fmI8Vz3pT5h7jKVNGoxbgGcnM/EPmKRWKixqTTt1Qh8bzSKaY+3oSV7fU19w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1777876254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w0ZhpEesyPcJsgXO4/btUK0FfWLbWwsk83ByeRkFbmE=;
	b=7rgGhfpxgLu1TZjWu6caUXMQhDkMDRYDPpcSdnCzib0LqTlb6s1Cz4VhGkybnnTRK6tDu+
	g20Mg00/Scs34MCg==
Date: Mon, 04 May 2026 08:30:51 +0200
Subject: [PATCH 2/4] riscv: alternative: Use IS_ENABLED() over ifdeffery
 for apply_vdso_alternatives()
MIME-Version: 1.0
Message-Id: <20260504-riscv-cfi-vdso-alternative-v1-2-bcdf3d37f62e@linutronix.de>
References: <20260504-riscv-cfi-vdso-alternative-v1-0-bcdf3d37f62e@linutronix.de>
In-Reply-To: <20260504-riscv-cfi-vdso-alternative-v1-0-bcdf3d37f62e@linutronix.de>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Deepak Gupta <debug@rivosinc.com>, Charles Mirabile <cmirabil@redhat.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Nam Cao <namcao@linutronix.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777876252; l=1258;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=u4J2HYBRH4KXYLD1ESLAFUbGfh/AXVZFwRcCbM3mVw0=;
 b=iqIHKQOWMj8uM7SjPXzupq7o2IlDKeimiPSojWcUb6MarpHOBeCpz+LzfbOkdAQqqxej1sKQi
 eqKfoOl5YpZDNqaqta/jT4exkBXoycT2mGPpiL5exBszaJSW6ddD5zF
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260503_233058_021013_43B166BC 
X-CRM114-Status: UNSURE (   7.39  )
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

SVNfRU5BQkxFRCgpIGFsbG93cyBiZXR0ZXIgY29tcGlsYXRpb24gY292ZXJhZ2Ugd2hpbGUgc3Rp
bGwgb3B0aW1pemluZwphd2F5IGFsbCB0aGUgZGVhZCBjb2RlLiBBbHNvIGl0IHdpbGwgbWFrZSBz
b21lIHVwY29taW5nIGNoYW5nZXMgZWFzaWVyLgoKU2lnbmVkLW9mZi1ieTogVGhvbWFzIFdlacOf
c2NodWggPHRob21hcy53ZWlzc3NjaHVoQGxpbnV0cm9uaXguZGU+Ci0tLQogYXJjaC9yaXNjdi9r
ZXJuZWwvYWx0ZXJuYXRpdmUuYyB8IDcgKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9h
bHRlcm5hdGl2ZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvYWx0ZXJuYXRpdmUuYwppbmRleCA3NjQy
NzA0YzdmMTguLjU5OTkxOTIyYTVkYyAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvYWx0
ZXJuYXRpdmUuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9hbHRlcm5hdGl2ZS5jCkBAIC0xNzMs
NyArMTczLDYgQEAgc3RhdGljIHZvaWQgX19pbml0X29yX21vZHVsZSBfYXBwbHlfYWx0ZXJuYXRp
dmVzKHN0cnVjdCBhbHRfZW50cnkgKmJlZ2luLAogCQkJCXN0YWdlKTsKIH0KIAotI2lmZGVmIENP
TkZJR19NTVUKIHN0YXRpYyB2b2lkIF9faW5pdCBhcHBseV92ZHNvX2FsdGVybmF0aXZlcyh2b2lk
KQogewogCWNvbnN0IEVsZl9FaGRyICpoZHI7CkBAIC0xOTQsOSArMTkzLDYgQEAgc3RhdGljIHZv
aWQgX19pbml0IGFwcGx5X3Zkc29fYWx0ZXJuYXRpdmVzKHZvaWQpCiAJCQkgICAgKHN0cnVjdCBh
bHRfZW50cnkgKillbmQsCiAJCQkgICAgUklTQ1ZfQUxURVJOQVRJVkVTX0JPT1QpOwogfQotI2Vs
c2UKLXN0YXRpYyB2b2lkIF9faW5pdCBhcHBseV92ZHNvX2FsdGVybmF0aXZlcyh2b2lkKSB7IH0K
LSNlbmRpZgogCiB2b2lkIF9faW5pdCBhcHBseV9ib290X2FsdGVybmF0aXZlcyh2b2lkKQogewpA
QCAtMjA3LDcgKzIwMyw4IEBAIHZvaWQgX19pbml0IGFwcGx5X2Jvb3RfYWx0ZXJuYXRpdmVzKHZv
aWQpCiAJCQkgICAgKHN0cnVjdCBhbHRfZW50cnkgKilfX2FsdF9lbmQsCiAJCQkgICAgUklTQ1Zf
QUxURVJOQVRJVkVTX0JPT1QpOwogCi0JYXBwbHlfdmRzb19hbHRlcm5hdGl2ZXMoKTsKKwlpZiAo
SVNfRU5BQkxFRChDT05GSUdfTU1VKSkKKwkJYXBwbHlfdmRzb19hbHRlcm5hdGl2ZXMoKTsKIH0K
IAogLyoKCi0tIAoyLjUzLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
