Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B718FD25032
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jan 2026 07:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sk8e7SPMBHz2Wxc3oE1FwBMbgA27cDHLG5L8D/X9ttc=; b=ha59lKsb93GTZ/
	XIIZo5FCgQ4EUnS6LzS2hoPSoeNkfAubOateVHgUM/U30cg39PV5qIPTsxpU9PryKwmD1psuNMg2v
	VOnxYHSRTwPk5e+HMb5qc7eVzbHeyhXOK2WEEG0Y9Nko1Y6kb11moO8QTxwoXjcaRPheMl5jE75bC
	cOGgcOqs8h+zmKn6xy+bn/kbo9iHlSxCm9+ILKD8XKiutcZS6dn1i6heqyNqM8KFJqCOKGQInVeXD
	ln8ezXe0GbyrPrOE89vyJK70YfMr0ERfwZItKRh04q2vuDQXmZh1zpfWCOGbunIaEm53faKpxCWHs
	dxnzH/FKmKEN1smWLjXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCnQ-00000004w6t-1KIH;
	Mon, 12 Jan 2026 07:57:04 +0000
Received: from out28-128.mail.aliyun.com ([115.124.28.128])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCnN-00000004w5R-0yV9
	for linux-riscv@lists.infradead.org;
	Mon, 12 Jan 2026 07:57:02 +0000
Received: from guoyaxing.localdomain(mailfrom:guoyaxing@bosc.ac.cn fp:SMTPD_---.g4Lkj9W_1768204605 cluster:ay29)
          by smtp.aliyun-inc.com;
          Mon, 12 Jan 2026 15:56:48 +0800
From: Yaxing Guo <guoyaxing@bosc.ac.cn>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	ryabinin.a.a@gmail.com,
	glider@google.com,
	andreyknvl@gmail.com,
	dvyukov@google.com,
	vincenzo.frascino@arm.com
Cc: guoyaxing@bosc.ac.cn,
	majiuyue@bosc.ac.cn,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zhizun Wang <anzoso@outlook.com>
Subject: [PATCH v1] riscv/kasan: include KASAN shadow range in flush_cache_vmap()
Date: Mon, 12 Jan 2026 15:56:43 +0800
Message-Id: <20260112075643.124570-1-guoyaxing@bosc.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_235701_534915_02ABF4C3 
X-CRM114-Status: GOOD (  11.52  )
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

T24gUklTQy1WLCB3aGVuIHZtYWxsb2MoKSBhbGxvY2F0ZXMgbWVtb3J5IGZvciB0aGUgS0FTQU4g
c2hhZG93IHJlZ2lvbiwKdGhlIHBhZ2UgdGFibGUgZW50cmllcyBhcmUgc2V0IHVwIHdpdGhvdXQg
ZW5zdXJpbmcgdGhlIHN0b3JlIG9wZXJhdGlvbnMKYXJlIGdsb2JhbGx5IHZpc2libGUgYmVmb3Jl
IHN1YnNlcXVlbnQgYWNjZXNzZXMuIFRoZSBmbHVzaCBsb2dpYwppbiBoYW5kbGVfZXhjZXB0aW9u
IHJlbGllcyBvbiB0aGUgJ25ld192bWFsbG9jJyBiaXQgdG8gdHJpZ2dlciBhIGZlbmNlLApidXQg
dGhpcyBiaXQgaXMgb25seSBzZXQgZm9yIHZtYWxsb2MvbW9kdWxlIGFkZHJlc3NlcyDigJQgbm90
IGZvciBLQVNBTgpzaGFkb3cgYWRkcmVzc2VzLgoKQXMgYSByZXN1bHQsIGFjY2Vzc2VzIHRvIHRo
ZSBuZXdseSBtYXBwZWQgS0FTQU4gc2hhZG93IG1lbW9yeSBjYW4gdHJpZ2dlcgpzcHVyaW91cyBw
YWdlIGZhdWx0cyBkdWUgdG8gc3RhbGUgVExCIG9yIGluc3RydWN0aW9uIGNhY2hlIGVudHJpZXMu
CgpGaXggdGhpcyBieSBleHRlbmRpbmcgZmx1c2hfY2FjaGVfdm1hcCgpIHRvIGFsc28gY292ZXIg
dGhlIEtBU0FOIHNoYWRvdwphZGRyZXNzIHJhbmdlLCBlbnN1cmluZyBwcm9wZXIgY2FjaGUgbWFp
bnRlbmFuY2UgYW5kIG1lbW9yeSBvcmRlcmluZwpmb3IgS0FTQU4gc2hhZG93IG1hcHBpbmdzIGp1
c3QgbGlrZSByZWd1bGFyIHZtYWxsb2MgYXJlYXMuCgpSZXBvcnRlZC1ieTogWmhpenVuIFdhbmcg
PGFuem9zb0BvdXRsb29rLmNvbT4KUmVwb3J0ZWQtYnk6IEppdXl1ZSBNYSA8bWFqaXV5dWVAYm9z
Yy5hYy5jbj4KU2lnbmVkLW9mZi1ieTogWWF4aW5nIEd1byA8Z3VveWF4aW5nQGJvc2MuYWMuY24+
Ci0tLQogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jYWNoZWZsdXNoLmggfCA0ICsrKy0KIGFyY2gv
cmlzY3YvaW5jbHVkZS9hc20va2FzYW4uaCAgICAgIHwgNiArKysrKy0KIDIgZmlsZXMgY2hhbmdl
ZCwgOCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vY2FjaGVmbHVzaC5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jYWNo
ZWZsdXNoLmgKaW5kZXggMDA5MjUxM2MzMzc2Li5iMjc0ODBkNWEyMDUgMTAwNjQ0Ci0tLSBhL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vY2FjaGVmbHVzaC5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vY2FjaGVmbHVzaC5oCkBAIC03LDYgKzcsNyBAQAogI2RlZmluZSBfQVNNX1JJU0NWX0NB
Q0hFRkxVU0hfSAogCiAjaW5jbHVkZSA8bGludXgvbW0uaD4KKyNpbmNsdWRlIDxhc20va2FzYW4u
aD4KIAogc3RhdGljIGlubGluZSB2b2lkIGxvY2FsX2ZsdXNoX2ljYWNoZV9hbGwodm9pZCkKIHsK
QEAgLTQ2LDcgKzQ3LDggQEAgZXh0ZXJuIGNoYXIgX2VuZFtdOwogI2RlZmluZSBmbHVzaF9jYWNo
ZV92bWFwIGZsdXNoX2NhY2hlX3ZtYXAKIHN0YXRpYyBpbmxpbmUgdm9pZCBmbHVzaF9jYWNoZV92
bWFwKHVuc2lnbmVkIGxvbmcgc3RhcnQsIHVuc2lnbmVkIGxvbmcgZW5kKQogewotCWlmIChpc192
bWFsbG9jX29yX21vZHVsZV9hZGRyKCh2b2lkICopc3RhcnQpKSB7CisJaWYgKGlzX3ZtYWxsb2Nf
b3JfbW9kdWxlX2FkZHIoKHZvaWQgKilzdGFydCkgfHwKKwkgICAgaXNfa2FzYW5fYWRkcihzdGFy
dCkpIHsKIAkJaW50IGk7CiAKIAkJLyoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20va2FzYW4uaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va2FzYW4uaAppbmRleCA2MGFmNjY5
MWY5MDMuLjIyNGJhODZmYmQxNSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9r
YXNhbi5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va2FzYW4uaApAQCAtMzYsMTAgKzM2
LDE0IEBACiAjaWZkZWYgQ09ORklHX0tBU0FOCiAjZGVmaW5lIEtBU0FOX1NIQURPV19PRkZTRVQJ
X0FDKENPTkZJR19LQVNBTl9TSEFET1dfT0ZGU0VULCBVTCkKIAorI2RlZmluZSBpc19rYXNhbl9h
ZGRyKGFkZHIpIChhZGRyID49IEtBU0FOX1NIQURPV19TVEFSVCAmJiBhZGRyIDwgS0FTQU5fU0hB
RE9XX0VORCkKKwogdm9pZCBrYXNhbl9pbml0KHZvaWQpOwogYXNtbGlua2FnZSB2b2lkIGthc2Fu
X2Vhcmx5X2luaXQodm9pZCk7CiB2b2lkIGthc2FuX3N3YXBwZXJfaW5pdCh2b2lkKTsKLQorI2Vs
c2UKKyNkZWZpbmUgaXNfa2FzYW5fYWRkcihhZGRyKSAoMCkKICNlbmRpZgorCiAjZW5kaWYKICNl
bmRpZiAvKiBfX0FTTV9LQVNBTl9IICovCi0tIAoyLjM0LjEKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
