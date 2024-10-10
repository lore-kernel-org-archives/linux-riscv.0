Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A5E8CF11E6
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 12:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=opt/BXexJh4/ckWCopXRFebKT6V2uwYLlnxwhXBFwpI=; b=AUulUfS2K8EXoF
	ZM/VW90eASiCEiZjvR86H8W0T49jhiOveHDKPMsPg99uZKzR99ds2xqHeH7nUWonv9zs1TxyfhQvc
	cxXjkvRG4MOcsk6bH0FifsajXa7yBgVnUvA5gYbflOX5c9IH74Y5YBHlJsy3VOTeJvfVA1Z9b3Vgx
	TjeLtPUGSuEvh4o2C/qu4nawF5tcDi67JfUj7D0apvkbxxdNwZBdOCMM16AJVM+9pQbbm0BmaRKKq
	xAEURsLCBAlD/KOywKRCAsLoUkbUY4Og6eMfJpO3jRNDa8p0GxUwOOetq1P9176x1hWfKqVJFGM3+
	FzCx1hH3cwypqRoCmC2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sysWG-0000000ClMU-0FLk;
	Thu, 10 Oct 2024 12:43:52 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sysEm-0000000Chkp-3tXs
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 12:26:18 +0000
Date: Thu, 10 Oct 2024 14:25:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728563146;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NX5RhoJ/MlDzG/mTrF+6FZ25OV+y6FcZq4dFLjVx4SI=;
	b=WGjskZ4medTthYhTN1hTfBi2C+3qJZ4gzTSK59E4KX2R2lENvV8mTzhLvItJrnrejYf40z
	Q5wm4v8ko/nvtu2IKKqjJjGUY2m+LeAbQ8cO5IIfE6f9hr3UfQYmQghc4hoILunPuRfG5s
	U44nadd+ifH6qgfT/Pgl2IzabckesgYmgOGxnef7uVBxxO3/y5hTe9QMmhs2N1KZpfYkVL
	AXu6xd3WyNwUmVT4ZN02k1BaLPboo7PYIOVCQw4W7tUyAR+wjicO54xwzd/5IHRGn4ECTO
	W3nar6q+fAkYlWn0JCE/7IWHVhhZtxE9fkNLyRmlHjaPK9+jNuOpJHdj53MtDg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728563146;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NX5RhoJ/MlDzG/mTrF+6FZ25OV+y6FcZq4dFLjVx4SI=;
	b=GHb+GC/Bkoyk2lO1G6yM5dzZxHOF/pBHJI4gm0V8sOIzQtpo1GzC92nQgNGvsUkqxSCBhx
	y1mpbo/unAXBsMAA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org,
	tglx@linutronix.de, mingo@kernel.org, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, ankur.a.arora@oracle.com, efault@gmx.de,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org
Subject: [PATCH v2 3/3] riscv: add PREEMPT_LAZY support
Message-ID: <20241010122545.7N_x3GuX@linutronix.de>
References: <20241009105709.887510-1-bigeasy@linutronix.de>
 <20241009105709.887510-4-bigeasy@linutronix.de>
 <20241009130307.GN17263@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241009130307.GN17263@noisy.programming.kicks-ass.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_052549_139562_E20A5B33 
X-CRM114-Status: UNSURE (   9.56  )
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

RnJvbTogSmlzaGVuZyBaaGFuZyA8anN6aGFuZ0BrZXJuZWwub3JnPgoKcmlzY3YgaGFzIHN3aXRj
aGVkIHRvIEdFTkVSSUNfRU5UUlksIHNvIGFkZGluZyBQUkVFTVBUX0xBWlkgaXMgYXMgc2ltcGxl
CmFzIGFkZGluZyBUSUZfTkVFRF9SRVNDSEVEX0xBWlkgcmVsYXRlZCBkZWZpbml0aW9ucyBhbmQg
ZW5hYmxpbmcKQVJDSF9IQVNfUFJFRU1QVF9MQVpZLgoKW2JpZ2Vhc3k6IFJlcGxhY2Ugb2xkIFBS
RUVNUFRfQVVUTyBiaXRzIHdpdGggbmV3IFBSRUVNUFRfTEFaWSBdCgpDYzogUGF1bCBXYWxtc2xl
eSA8cGF1bC53YWxtc2xleUBzaWZpdmUuY29tPgpDYzogUGFsbWVyIERhYmJlbHQgPHBhbG1lckBk
YWJiZWx0LmNvbT4KQ2M6IEFsYmVydCBPdSA8YW91QGVlY3MuYmVya2VsZXkuZWR1PgpDYzogbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpTaWduZWQtb2ZmLWJ5OiBKaXNoZW5nIFpoYW5n
IDxqc3poYW5nQGtlcm5lbC5vcmc+ClNpZ25lZC1vZmYtYnk6IFNlYmFzdGlhbiBBbmRyemVqIFNp
ZXdpb3IgPGJpZ2Vhc3lAbGludXRyb25peC5kZT4KLS0tCgp2MeKApnYyOgogIC0gc2h1ZmZsZSBU
SUYgYml0cyBhcm91bmQgdG8gbWFrZSBSRVNDSEVEIG5leHQgdG8gUkVTQ0hFRF9MQVpZLgogICAg
Q29tcGlsZXMgJiBib290cy4KCiBhcmNoL3Jpc2N2L0tjb25maWcgICAgICAgICAgICAgICAgICAg
fCAgMSArCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3RocmVhZF9pbmZvLmggfCAxMCArKysrKyst
LS0tCiAyIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcgYi9hcmNoL3Jpc2N2L0tjb25maWcKaW5kZXgg
NjI1NDU5NDZlY2Y0My4uMzUxNmM1ODQ4MDYxMiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9LY29u
ZmlnCisrKyBiL2FyY2gvcmlzY3YvS2NvbmZpZwpAQCAtMzksNiArMzksNyBAQCBjb25maWcgUklT
Q1YKIAlzZWxlY3QgQVJDSF9IQVNfTU1JT1dCCiAJc2VsZWN0IEFSQ0hfSEFTX05PTl9PVkVSTEFQ
UElOR19BRERSRVNTX1NQQUNFCiAJc2VsZWN0IEFSQ0hfSEFTX1BNRU1fQVBJCisJc2VsZWN0IEFS
Q0hfSEFTX1BSRUVNUFRfTEFaWQogCXNlbGVjdCBBUkNIX0hBU19QUkVQQVJFX1NZTkNfQ09SRV9D
TUQKIAlzZWxlY3QgQVJDSF9IQVNfUFRFX0RFVk1BUCBpZiA2NEJJVCAmJiBNTVUKIAlzZWxlY3Qg
QVJDSF9IQVNfUFRFX1NQRUNJQUwKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
dGhyZWFkX2luZm8uaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdGhyZWFkX2luZm8uaAppbmRl
eCA5YzEwZmIxODBmNDM4Li5mNTkxNmE3MDg3OWE4IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL3RocmVhZF9pbmZvLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS90aHJl
YWRfaW5mby5oCkBAIC0xMDcsOSArMTA3LDEwIEBAIGludCBhcmNoX2R1cF90YXNrX3N0cnVjdChz
dHJ1Y3QgdGFza19zdHJ1Y3QgKmRzdCwgc3RydWN0IHRhc2tfc3RydWN0ICpzcmMpOwogICogLSBw
ZW5kaW5nIHdvcmstdG8tYmUtZG9uZSBmbGFncyBhcmUgaW4gbG93ZXN0IGhhbGYtd29yZAogICog
LSBvdGhlciBmbGFncyBpbiB1cHBlciBoYWxmLXdvcmQocykKICAqLwotI2RlZmluZSBUSUZfTk9U
SUZZX1JFU1VNRQkxCS8qIGNhbGxiYWNrIGJlZm9yZSByZXR1cm5pbmcgdG8gdXNlciAqLwotI2Rl
ZmluZSBUSUZfU0lHUEVORElORwkJMgkvKiBzaWduYWwgcGVuZGluZyAqLwotI2RlZmluZSBUSUZf
TkVFRF9SRVNDSEVECTMJLyogcmVzY2hlZHVsaW5nIG5lY2Vzc2FyeSAqLworI2RlZmluZSBUSUZf
TkVFRF9SRVNDSEVECTAJLyogcmVzY2hlZHVsaW5nIG5lY2Vzc2FyeSAqLworI2RlZmluZSBUSUZf
TkVFRF9SRVNDSEVEX0xBWlkJMSAgICAgICAvKiBMYXp5IHJlc2NoZWR1bGluZyBuZWVkZWQgKi8K
KyNkZWZpbmUgVElGX05PVElGWV9SRVNVTUUJMgkvKiBjYWxsYmFjayBiZWZvcmUgcmV0dXJuaW5n
IHRvIHVzZXIgKi8KKyNkZWZpbmUgVElGX1NJR1BFTkRJTkcJCTMJLyogc2lnbmFsIHBlbmRpbmcg
Ki8KICNkZWZpbmUgVElGX1JFU1RPUkVfU0lHTUFTSwk0CS8qIHJlc3RvcmUgc2lnbmFsIG1hc2sg
aW4gZG9fc2lnbmFsKCkgKi8KICNkZWZpbmUgVElGX01FTURJRQkJNQkvKiBpcyB0ZXJtaW5hdGlu
ZyBkdWUgdG8gT09NIGtpbGxlciAqLwogI2RlZmluZSBUSUZfTk9USUZZX1NJR05BTAk5CS8qIHNp
Z25hbCBub3RpZmljYXRpb25zIGV4aXN0ICovCkBAIC0xMTcsOSArMTE4LDEwIEBAIGludCBhcmNo
X2R1cF90YXNrX3N0cnVjdChzdHJ1Y3QgdGFza19zdHJ1Y3QgKmRzdCwgc3RydWN0IHRhc2tfc3Ry
dWN0ICpzcmMpOwogI2RlZmluZSBUSUZfMzJCSVQJCTExCS8qIGNvbXBhdC1tb2RlIDMyYml0IHBy
b2Nlc3MgKi8KICNkZWZpbmUgVElGX1JJU0NWX1ZfREVGRVJfUkVTVE9SRQkxMiAvKiByZXN0b3Jl
IFZlY3RvciBiZWZvcmUgcmV0dXJpbmcgdG8gdXNlciAqLwogCisjZGVmaW5lIF9USUZfTkVFRF9S
RVNDSEVECSgxIDw8IFRJRl9ORUVEX1JFU0NIRUQpCisjZGVmaW5lIF9USUZfTkVFRF9SRVNDSEVE
X0xBWlkJKDEgPDwgVElGX05FRURfUkVTQ0hFRF9MQVpZKQogI2RlZmluZSBfVElGX05PVElGWV9S
RVNVTUUJKDEgPDwgVElGX05PVElGWV9SRVNVTUUpCiAjZGVmaW5lIF9USUZfU0lHUEVORElORwkJ
KDEgPDwgVElGX1NJR1BFTkRJTkcpCi0jZGVmaW5lIF9USUZfTkVFRF9SRVNDSEVECSgxIDw8IFRJ
Rl9ORUVEX1JFU0NIRUQpCiAjZGVmaW5lIF9USUZfTk9USUZZX1NJR05BTAkoMSA8PCBUSUZfTk9U
SUZZX1NJR05BTCkKICNkZWZpbmUgX1RJRl9VUFJPQkUJCSgxIDw8IFRJRl9VUFJPQkUpCiAjZGVm
aW5lIF9USUZfUklTQ1ZfVl9ERUZFUl9SRVNUT1JFCSgxIDw8IFRJRl9SSVNDVl9WX0RFRkVSX1JF
U1RPUkUpCi0tIAoyLjQ1LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
