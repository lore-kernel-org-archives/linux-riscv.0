Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB550C71135
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 08:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q6Tx2GDji6VjOPhScK85Ez3N/juNQ109trdTp8JaqVg=; b=Ndc3qC0yakFwIw
	bf5q6V+oqLace63nNbCzTGTKnqLnJN9Wza2tY1igytK8lXuk4wbIq1MRoUy06COYaLX5JWedWUNKR
	QoHtYxcfV99rI6P5UjtXoEgKc6gQp8eiWRWofZla25lN6zXgLUPiiSxXP6LBn24MUtp8tguh7aVip
	za4WhvgKWNA5/BQptYQbtAZy2Oz/e4UZpR10W/0UkpGl4hzP60seFvoPjdgHCEvJFzBCZcwxoGVqI
	rievrKKuQ5YBGNhxaDhLH6Cw//Ql3zsCB7GaJsovLaoYQM1E9MQBTVW1zmOu9SNCvg2W2KxzYrgym
	V6djpnBmzatw3VTet0iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGQA-00000009Bir-20tg;
	Wed, 11 Jun 2025 08:02:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPG2r-000000097r5-1dZ2
	for linux-riscv@bombadil.infradead.org;
	Wed, 11 Jun 2025 07:38:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=1E+pxdC7XCvBOJZ8pPzaFk5ypsAf/K5wNQ3KeFLn+F8=; b=IFnf7oX7iJnFe/vY/7jGZ9x37m
	OzLQ5tDYXlU8RtJ8jeoTvsy6jV7R5B697vAfxkJB46PlNON4GbO9fuv1gKPHdnPlSLpnuI49B00zg
	qkgedbkr1weWQQwXux45VYkZCn0PzWki/CD/iwewIPErE1+o6brPaBerW1dDmLCxY+P1oA7EDUCjV
	MA52ZmHdFiO6l55pVJt2rLuQUgDkB8p3RvwrKtVdRCOyIvMX7mNzj2rqzlF6HZdEPKt3Tv36tc4Vv
	v5P4AD/4ivEmPq4WXka3HrojQRvVAzb/sI1ltCheMKDxtHV3T4QhML5XEGIH7EoXJshulaC8LQwRt
	m8QBM1qQ==;
Received: from galois.linutronix.de ([193.142.43.55])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPG2o-00000002A5u-0dbI
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 07:38:49 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749627512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1E+pxdC7XCvBOJZ8pPzaFk5ypsAf/K5wNQ3KeFLn+F8=;
	b=TOtBh2KUnuVUS85lSgOHCG1Fg+t5UqkQ41US1tcjvzvyS8oPdeMPXvCrknrP7INKLsI28G
	6SFNHskWUP+eJ0riYZXKK1OoxxOpdvghQ6uyWNteogP/1acmivFX6mmYejNvlr3ZFwahxp
	EeZMlXXc6pJ/HY1ypPO/UAWII9PEoz1ULxHccGKw4W6CVAoObU6vDDLvvxLwThuc2pQpjs
	/JJ5pmAPBMrA/5E+F2gZtsDaosx4JfSPa63nd9W/VpPluNsAqRAO63m26iaZ+wC2dC7kJ1
	iFlAf+LkhTcbxMa2M2gPR+7kewxvUUF081sAB0Dd+hrJbUDoB0TLsl7Oa3KAFA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749627512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1E+pxdC7XCvBOJZ8pPzaFk5ypsAf/K5wNQ3KeFLn+F8=;
	b=dcdGNp35cwbN5l5enyvrw6QqtNl8z0RMXdG6AeX+mek+y58WZuuaxlr1/igfQ65QB18v2D
	fiADWYTRb3Csz1BQ==
Date: Wed, 11 Jun 2025 09:38:10 +0200
Subject: [PATCH v3 04/16] kbuild: userprogs: add nolibc support
MIME-Version: 1.0
Message-Id: <20250611-kunit-kselftests-v3-4-55e3d148cbc6@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749627510; l=3395;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=JA+lgR6jDYP95l8ivl1hKVe2RNOg9XU9LTMBTUtdWi0=;
 b=sshp51ZicOppr5xNE4J5XSfIA6Ho2MK+qJPaO4m7xgV0guqxem23z+NRO9Fn1L/NBaCPXM/F4
 irTj9CDLvh+AcNB81yPzcohfGaEWOImNfEmzL/uyKt+d0bHjfhF15sx
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_083846_341404_ECDAA847 
X-CRM114-Status: GOOD (  12.76  )
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

VXNlcnByb2dzIGFyZSBidWlsdCB3aXRoIHRoZSByZWd1bGFyIGtlcm5lbCBjb21waWxlciAkQ0Mu
CkEga2VybmVsIGNvbXBpbGVyIGRvZXMgbm90IG5lY2Vzc2FyaWx5IGNvbnRhaW4gYSBsaWJjIHdo
aWNoIGlzIHJlcXVpcmVkCmZvciBhIG5vcm1hbCB1c2Vyc3BhY2UgYXBwbGljYXRpb24uCkhvd2V2
ZXIgdGhlIGtlcm5lbCB0cmVlIGRvZXMgY29udGFpbiBhIG1pbmltYWwgbGliYyBpbXBsZW1lbnRh
dGlvbgoibm9saWJjIiB3aGljaCBjYW4gYmUgdXNlZCB0byBidWlsZCB1c2Vyc3BhY2UgYXBwbGlj
YXRpb25zLgoKSW50cm9kdWNlIHN1cHBvcnQgdG8gYnVpbGQgdXNlcnByb2dzIGFnYWluc3Qgbm9s
aWJjIGluc3RlYWQgb2YgdGhlCmRlZmF1bHQgbGliYyBvZiB0aGUgY29tcGlsZXIsIHdoaWNoIG1h
eSBub3QgZXhpc3QuCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgV2Vpw59zY2h1aCA8dGhvbWFzLndl
aXNzc2NodWhAbGludXRyb25peC5kZT4KCi0tLQpUaGlzIGNvdWxkIHByb2JhYmx5IGJlIG1vdmVk
IG91dCBvZiB0aGUgZ2VuZXJpYyBrYnVpbGQgbWFrZWZpbGVzLgpJIHRoaW5rIHRoZSBlcmdvbmlt
aWNzIHdvdWxkIHN1ZmZlciBhbmQgdGhpcyBmdW5jdGlvbmFsaXR5IGNvdWxkIGJlCnVzZWQgYnkg
b3RoZXIgdXNlcnMgb2YgdXNlcnByb2dzLgoKQWxzbyB0aGlzIGRvZXMgY3VycmVudGx5IG5vdCBz
dXBwb3J0IG91dC1vZi10cmVlIGJ1aWxkcy4KRm9yIHRoYXQgdG9vbHMvaW5jbHVkZS9ub2xpYmMv
Ki5oIGFuZCB1c3IvaW5jbHVkZS8qLmggd291bGQgbmVlZCB0byBiZQppbnN0YWxsZWQgaW50byB0
aGUgYnVpbGQgZGlyZWN0b3J5LgotLS0KIERvY3VtZW50YXRpb24va2J1aWxkL21ha2VmaWxlcy5y
c3QgfCAxMyArKysrKysrKysrKysrCiBzY3JpcHRzL01ha2VmaWxlLnVzZXJwcm9ncyAgICAgICAg
IHwgMTMgKysrKysrKysrKy0tLQogMiBmaWxlcyBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCAz
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24va2J1aWxkL21ha2VmaWxl
cy5yc3QgYi9Eb2N1bWVudGF0aW9uL2tidWlsZC9tYWtlZmlsZXMucnN0CmluZGV4IDhhZWYzNjUw
YzFmMzJiNmIxOTdlMGRjNzc3ZTI2Nzc1ZDM3MWEwODEuLjRjYzdhMWI4OWYxODAzODU3YTQ3MjMy
ODQ2MTMxMTFlOWFkNzFkOTIgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24va2J1aWxkL21ha2Vm
aWxlcy5yc3QKKysrIGIvRG9jdW1lbnRhdGlvbi9rYnVpbGQvbWFrZWZpbGVzLnJzdApAQCAtOTc0
LDYgKzk3NCwxOSBAQCBXaGVuIGxpbmtpbmcgYnBmaWx0ZXJfdW1oLCBpdCB3aWxsIGJlIHBhc3Nl
ZCB0aGUgZXh0cmEgb3B0aW9uIC1zdGF0aWMuCiAKIEZyb20gY29tbWFuZCBsaW5lLCA6cmVmOmBV
U0VSQ0ZMQUdTIGFuZCBVU0VSTERGTEFHUyA8dXNlcmtidWlsZGZsYWdzPmAgd2lsbCBhbHNvIGJl
IHVzZWQuCiAKK0J1aWxkaW5nIHVzZXJwcm9ncyBhZ2FpbnN0IG5vbGliYworLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCisKK05vdCBhbGwga2VybmVsIHRvb2xjaGFpbnMgcHJvdmlk
ZSBhIGxpYmMuCitTaW1wbGUgdXNlcnByb2dzIGNhbiBiZSBidWlsdCBhZ2FpbnN0IGEgdmVyeSBz
aW1wbGUgbGliYyBjYWxsICJub2xpYmMiIHByb3ZpZGVkCitieSB0aGUga2VybmVsIHNvdXJjZSB0
cmVlLgorVGhpcyByZXF1aXJlcyBgYENPTkZJR19IRUFERVJTX0lOU1RBTEw9eWBgLgorCitFeGFt
cGxlOjoKKworICAjIGxpYi9rdW5pdC9NYWtlZmlsZQorICB1YXBpLXByZWluaXQtbm9saWJjIDo9
ICQoQ09ORklHX0FSQ0hfSEFTX05PTElCQykKKwogV2hlbiB1c2Vyc3BhY2UgcHJvZ3JhbXMgYXJl
IGFjdHVhbGx5IGJ1aWx0CiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KIApkaWZmIC0tZ2l0IGEvc2NyaXB0cy9NYWtlZmlsZS51c2VycHJvZ3MgYi9zY3JpcHRzL01h
a2VmaWxlLnVzZXJwcm9ncwppbmRleCBmM2E3ZTFlZjM3NTNiNTQzMDM3MThmYWU5N2Y0YjNjOWQ0
ZWFjMDdjLi5iMTYzM2E5ZGU2Yzg2YTAyM2M3MGE3MTdiYWMwYjgwYjg5ZDAxNDMxIDEwMDY0NAot
LS0gYS9zY3JpcHRzL01ha2VmaWxlLnVzZXJwcm9ncworKysgYi9zY3JpcHRzL01ha2VmaWxlLnVz
ZXJwcm9ncwpAQCAtMTYsMTAgKzE2LDE3IEBAIHVzZXItY3NpbmdsZQk6PSAkKGFkZHByZWZpeCAk
KG9iaikvLCAkKHVzZXItY3NpbmdsZSkpCiB1c2VyLWNtdWx0aQk6PSAkKGFkZHByZWZpeCAkKG9i
aikvLCAkKHVzZXItY211bHRpKSkKIHVzZXItY29ianMJOj0gJChhZGRwcmVmaXggJChvYmopLywg
JCh1c2VyLWNvYmpzKSkKIAordXNlcl9ub2xpYmNfY2NmbGFncyA6PSAtbm9zdGRsaWIgLW5vc3Rk
aW5jIC1zdGF0aWMgLWZuby1pZGVudCAtZm5vLWFzeW5jaHJvbm91cy11bndpbmQtdGFibGVzIFwK
KwkJICAgICAgLWZmcmVlc3RhbmRpbmcgLWZuby1zdGFjay1wcm90ZWN0b3IgXAorCQkgICAgICAt
aXN5c3RlbSAkKG9ianRyZWUpL3Vzci9pbmNsdWRlIC1pbmNsdWRlICQoc3JjdHJlZSkvdG9vbHMv
aW5jbHVkZS9ub2xpYmMvbm9saWJjLmggLWlzeXN0ZW0gJChzcmN0cmVlKS90b29scy9pbmNsdWRl
L25vbGliYy8KK3VzZXJfbm9saWJjX2xkZmxhZ3MgOj0gLW5vc3RkbGliIC1ub3N0ZGluYyAtc3Rh
dGljCisKIHVzZXJfY2NmbGFncwk9IC1XcCwtTU1ELCQoZGVwZmlsZSkgJChLQlVJTERfVVNFUkNG
TEFHUykgJCh1c2VyY2NmbGFncykgXAotCQkJJCgkKHRhcmdldC1zdGVtKS11c2VyY2NmbGFncykK
LXVzZXJfbGRmbGFncwk9ICQoS0JVSUxEX1VTRVJMREZMQUdTKSAkKHVzZXJsZGZsYWdzKSAkKCQo
dGFyZ2V0LXN0ZW0pLXVzZXJsZGZsYWdzKQotdXNlcl9sZGxpYnMJPSAkKHVzZXJsZGxpYnMpICQo
JCh0YXJnZXQtc3RlbSktdXNlcmxkbGlicykKKwkJCSQoJCh0YXJnZXQtc3RlbSktdXNlcmNjZmxh
Z3MpICQoaWYgJCgkKHRhcmdldC1zdGVtKS1ub2xpYmMpLCQodXNlcl9ub2xpYmNfY2NmbGFncykp
Cit1c2VyX2xkZmxhZ3MJPSAkKEtCVUlMRF9VU0VSTERGTEFHUykgJCh1c2VybGRmbGFncykgJCgk
KHRhcmdldC1zdGVtKS11c2VybGRmbGFncykgXAorCQkJJChpZiAkKCQodGFyZ2V0LXN0ZW0pLW5v
bGliYyksJCh1c2VyX25vbGliY19sZGZsYWdzKSkKK3VzZXJfbGRsaWJzCT0gJCh1c2VybGRsaWJz
KSAkKCQodGFyZ2V0LXN0ZW0pLXVzZXJsZGxpYnMpIFwKKwkJCSQoaWYgJCgkKHRhcmdldC1zdGVt
KS1ub2xpYmMpLCQodXNlcl9ub2xpYmNfbGRsaWJzKSkKIAogIyBDcmVhdGUgYW4gZXhlY3V0YWJs
ZSBmcm9tIGEgc2luZ2xlIC5jIGZpbGUKIHF1aWV0X2NtZF91c2VyX2NjX2MgPSBDQyBbVV0gICRA
CgotLSAKMi40OS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
