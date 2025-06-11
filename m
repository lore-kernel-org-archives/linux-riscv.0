Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9358C71135
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 08:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fm/gIn7002bQ6JxL7xkPMsUJDs7SmNvBLJtFJSLTHmQ=; b=2kfxzcBvbjUbyN
	WmLspZL8eviWEA8yCjCRwksd2VF026ACiKzaO9KPpyj/1sWIORVn0ZNuqrfPzPA47bkkT62JKv6XK
	cHqNpsGoPYSlDPY0BVpTPNPh5aA0rH51RT10w9VZLUxcEUjFz3FOqzI/TwQfvi3fadCtw5LsWxCsM
	w8gXkEezTEbVSMYbBg2HZ181bmTBZaz1bLfg5hhFkLLwIuAgyEr9hsRImtIQQNq4BCGIG7hoPoy7s
	wSTCL1TlqON9DLcqPC3BYhBH1fJazGlicUgGiz/wvhOVuQb7bqWRJibiA39JG98pxzWiyMPh/ehn9
	ghqBKyuDMLh+YbaNjVUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGQ7-00000009BgJ-2eMB;
	Wed, 11 Jun 2025 08:02:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPG2q-000000097qo-3TwI
	for linux-riscv@bombadil.infradead.org;
	Wed, 11 Jun 2025 07:38:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=g2u/MNcTEWtPCOXtSTAERzN55pAfd3jSntXhox37eg4=; b=TLHzAKyrfjm0DINi3XGqMZIueR
	fQ+CSqO10iTtmdIllHJmt/WZZ53oSpjok0y2zrbxv7pZLa9Bu9pAl7sV/xx3oWexrgNYgIKgOm4ib
	VzxWysTpPIqJwMisjJ6AZMiscgvj2anJw12M9aF/JA/+aPEQR0vG4TqyCQwM+1FT2+01u+Odda4x1
	N/5aFhvux08B81SaP9rzLfIKSvMYhG6gvh6IQXpjRCE6O5M0C2qNAt2WV8wIU1sBTGsqCAtLjuw1k
	JHjaJ7ZhgaX3wd2lEt0zZp3Hd+kdiFtI+ghv1rIQojrIJ4wqkRl88SWXG2PDlLQHlSsEHu+RNVq/b
	2hsWoIgA==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPG2o-00000002A5s-0zox
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 07:38:48 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749627511;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g2u/MNcTEWtPCOXtSTAERzN55pAfd3jSntXhox37eg4=;
	b=JG84CNXxEHRsSVKOmQLNgCzjoI5gPN/8X4LtxSRWz3wzUwmcJLzGZJStGsPQG9JoKW0qbk
	Ffd+9bePN/Odd5wxn6E5vpBfyokFPXWf0Logy/p673kxTR3gDdnt1yXHazdyqR+0f+nUVf
	w2GZ7MFSAiOkK/uR6yArp3vkwuHfgoo1dLi88mOQg0f3bf0/1WkSUtprgMpUJbpWx5ozUo
	DNRUmJgKwhyPdsiGijhKdKMKTs5Lr7UAVGuFx+FzgcE5egEBNZBN6EbayqHnWIJpEOSBo3
	jWBXOmQ7j2CxtNa7ETDM/Wm65yY7cQFfDTshlB2reC65a2+R/7M1kYFEb6p1QQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749627511;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g2u/MNcTEWtPCOXtSTAERzN55pAfd3jSntXhox37eg4=;
	b=9cqj5QweBA3hvlLfbrd+D5Gn5vEdLhgkeGKdtunUukTdZCP9+qdhoXdKFZ2zHMMqAwopDR
	D0SRYDm7X0/5kcBg==
Date: Wed, 11 Jun 2025 09:38:07 +0200
Subject: [PATCH v3 01/16] kbuild: userprogs: avoid duplicating of flags
 inherited from kernel
MIME-Version: 1.0
Message-Id: <20250611-kunit-kselftests-v3-1-55e3d148cbc6@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749627510; l=1184;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=XUXHouC/V1vE5vzsV6IGUS5rVrpbLkz4GlNe4NCYMuc=;
 b=4WFKI9mAgKXVxy5ZlX5DrLBu5OxdhJcH3eywwL778enAQRfUaFirPc8B2cBuy7NfaZ9PJ4xRC
 0N8Px9pM2xPCWzNhf0I2stFC0evHCo46puDQ1Twoqy3FkNtzwFCMXM/
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_083846_341405_F7E8F7CA 
X-CRM114-Status: UNSURE (   7.83  )
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

VGhlIGR1cGxpY2F0aW9uIG1ha2VzIG1haW50ZW5hbmNlIGhhcmRlci4gQ2hhbmdlcyBuZWVkIHRv
IGJlIGRvbmUgaW4gdHdvCnBsYWNlcyBhbmQgdGhlIGxpbmVzIHdpbGwgZ3JvdyBvdmVybHkgbG9u
Zy4KClVzZSBhbiBpbnRlcm1lZGlhcnkgdmFyaWFibGUgaW5zdGVhZC4KClNpZ25lZC1vZmYtYnk6
IFRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51dHJvbml4LmRlPgotLS0K
IE1ha2VmaWxlIHwgNSArKystLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9NYWtlZmlsZSBiL01ha2VmaWxlCmluZGV4IDM1ZTZl
NTI0MGM2MWE4YTMyOTAxMTkyOWZjZDAzNTJiODgxZGNjZGMuLmM0MjkzY2Y5MWU5NjhjYThlZTY0
NDUyODQxZmIyNjZlMjRkZjYzZjYgMTAwNjQ0Ci0tLSBhL01ha2VmaWxlCisrKyBiL01ha2VmaWxl
CkBAIC0xMTMwLDggKzExMzAsOSBAQCBMREZMQUdTX3ZtbGludXgJKz0gLS1lbWl0LXJlbG9jcyAt
LWRpc2NhcmQtbm9uZQogZW5kaWYKIAogIyBBbGlnbiB0aGUgYml0IHNpemUgb2YgdXNlcnNwYWNl
IHByb2dyYW1zIHdpdGggdGhlIGtlcm5lbAotS0JVSUxEX1VTRVJDRkxBR1MgICs9ICQoZmlsdGVy
IC1tMzIgLW02NCAtLXRhcmdldD0lLCAkKEtCVUlMRF9DUFBGTEFHUykgJChLQlVJTERfQ0ZMQUdT
KSkKLUtCVUlMRF9VU0VSTERGTEFHUyArPSAkKGZpbHRlciAtbTMyIC1tNjQgLS10YXJnZXQ9JSwg
JChLQlVJTERfQ1BQRkxBR1MpICQoS0JVSUxEX0NGTEFHUykpCitVU0VSRkxBR1NfRlJPTV9LRVJO
RUwgOj0gLW0zMiAtbTY0IC0tdGFyZ2V0PSUKK0tCVUlMRF9VU0VSQ0ZMQUdTICArPSAkKGZpbHRl
ciAkKFVTRVJGTEFHU19GUk9NX0tFUk5FTCksICQoS0JVSUxEX0NQUEZMQUdTKSAkKEtCVUlMRF9D
RkxBR1MpKQorS0JVSUxEX1VTRVJMREZMQUdTICs9ICQoZmlsdGVyICQoVVNFUkZMQUdTX0ZST01f
S0VSTkVMKSwgJChLQlVJTERfQ1BQRkxBR1MpICQoS0JVSUxEX0NGTEFHUykpCiAKICMgdXNlcnNw
YWNlIHByb2dyYW1zIGFyZSBsaW5rZWQgdmlhIHRoZSBjb21waWxlciwgdXNlIHRoZSBjb3JyZWN0
IGxpbmtlcgogaWZlcSAoJChDT05GSUdfQ0NfSVNfQ0xBTkcpJChDT05GSUdfTERfSVNfTExEKSx5
eSkKCi0tIAoyLjQ5LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
