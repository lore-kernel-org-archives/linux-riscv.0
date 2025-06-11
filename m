Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB84C71137
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 08:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=umLwJpltsK/vHJC4HN8/MTR385epWZRs12+y4GYpOnM=; b=pSZJlPSftTZtiE
	8TP8ZQIdiYYjCYdzTWlvfmT5yUY9GkKCnrS2y5Ev+nbg6G4s8HbC8K+T613GDET9MVNihAhE/XEVp
	x9tcqYOTEnHzYHi68o1D6w1SPcb6xeqVLsSGeQmh0s+2xHdl1LvXZKLW95YQbwnQ5iCQfJC0v8x97
	ALwJKz3ndhuaGMHaKFgsam6mvLt2SyHEhQjRczQT8GV/O+OD+GLVprsTPVs72v8iZYqfd2+HR+EJi
	NHcJZWCSch2XVTReYQs2FqvMCTd1xr62rLCGJ1LDRDDVagz3MghcwaO4NA053z5eYFrbzrMaqXBXH
	LNjZ3GgICCipxqz2b6FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGQ9-00000009BiM-3EQb;
	Wed, 11 Jun 2025 08:02:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPG2r-000000097r4-1gXY
	for linux-riscv@bombadil.infradead.org;
	Wed, 11 Jun 2025 07:38:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=BxrB5F7pB41w5mjMWE31LUYj7rWMdcxJbt62UaOAMsU=; b=bWMMnI1JiS/adODuZoP0RQA56+
	PkByqrqBz/2iSRMJaNenBsKDuVYrupX/Kd3i9KVznnB6FR5PJ2gBKCHDaw9iexutEtbytv+vzpRqt
	kEgXe0ifrxqibSUf46UHQi9TT1BXP2o6E1XNWUktnflxN+MOw5gKuTCvwsWNmO94RQkjrU0SKFmEk
	mioxE3iKxG/mtavC0KWYkvwbNPWwBxPJEDwzYaIsgShgRJBtRWWa1iXIKvZWy9lgSaxytJOQnKJF3
	reJq5kTPfxuW2us0vzOD3IR1UfUOKIf+7lu8ujplmXJUuHYAceRpmj0FGABU5J6u4VmoAnY6EknJp
	HE1weYNg==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPG2o-00000002A5r-0gak
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 07:38:49 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749627511;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BxrB5F7pB41w5mjMWE31LUYj7rWMdcxJbt62UaOAMsU=;
	b=iUtSnZ8SzUl94tBC7W3072/gLmGcrlaE2EhTrJWMC2GDLjcZPMyVl1KreixsLGR48oGRTL
	41lQuTNF3Ct7gb7hOZHrd7N2WMpGx+7pl8TSdAncde6FbKe6cSM0iX7sTwTOd7GFthV/tW
	tmoxU40Ge1JoK1iywTSGHNQpQErtQXKaA4lz5kMjl2BeesEWIiLg2EonyazKjnPHSEgMTU
	MdiT10EeC1oJiNmtL6lXpU5pDgszIDjUqnLdUZw+21K3BMQIQcCEKb0gOd6PSqNBMA0Min
	oKu17jdxQD9/jsQfSL4JuvvCb0kI/rSJHcNAaTQ6K3iB9xnSXwUURDJ47hPaSg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749627511;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BxrB5F7pB41w5mjMWE31LUYj7rWMdcxJbt62UaOAMsU=;
	b=LNeYvbSa+LpU/7ZesflVIAWrD2JkrhkWvf19GMqBrxd23szxDDLnHqcSuz7EczU1H0oDlT
	7YPp73cJcxAEYsDw==
Date: Wed, 11 Jun 2025 09:38:08 +0200
Subject: [PATCH v3 02/16] kbuild: userprogs: also inherit byte order and
 ABI from kernel
MIME-Version: 1.0
Message-Id: <20250611-kunit-kselftests-v3-2-55e3d148cbc6@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749627510; l=1177;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=VQTecfMbGmIE2mhR3lC6cykpMVHE/XGTMFcN207W2vw=;
 b=IFuBTpGS+0Ubi/+ZN/eyZa5QO9sDBYBdL8p0IZCQJ6pqJ48E7Q50nmm8O7fsEW2cmBChEcD0m
 YbGBwFi3zgxB/ciDPbleIFJK+oMk2BGULFU+OAUKTBj9jX8WJTM3PrO
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_083846_351190_72487C34 
X-CRM114-Status: UNSURE (   8.76  )
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

TWFrZSBzdXJlIHRoZSBieXRlIG9yZGVyIGFuZCBBQkkgb2YgdGhlIHVzZXJwcm9ncyBtYXRjaGVz
IHRoZSBvbmUgb2YgdGhlCmtlcm5lbCwgc2ltaWxhciB0byBob3cgdGhlIGJpdCBzaXplIGlzIGhh
bmRsZWQuCk90aGVyd2lzZSB0aGUgdXNlcnByb2dzIG1heSBub3QgYmUgZXhlY3V0YWJsZS4KVGhp
cyBoYXBwZW5zIGZvciBleGFtcGxlIG9uIHBvd2VycGMgbGl0dGxlIGVuZGlhbiwgb3IgcmlzY3Yz
Mi4KClNpZ25lZC1vZmYtYnk6IFRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBs
aW51dHJvbml4LmRlPgotLS0KIE1ha2VmaWxlIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL01ha2VmaWxlIGIvTWFr
ZWZpbGUKaW5kZXggYzQyOTNjZjkxZTk2OGNhOGVlNjQ0NTI4NDFmYjI2NmUyNGRmNjNmNi4uYjlh
YTEwNTgzMjFkYWJkM2IzZGQ1NjEwZTQ1YTI4MDdkZmEyNTdmNCAxMDA2NDQKLS0tIGEvTWFrZWZp
bGUKKysrIGIvTWFrZWZpbGUKQEAgLTExMjksOCArMTEyOSw4IEBAIGlmbmVxICgkKENPTkZJR19B
UkNIX1ZNTElOVVhfTkVFRFNfUkVMT0NTKSwpCiBMREZMQUdTX3ZtbGludXgJKz0gLS1lbWl0LXJl
bG9jcyAtLWRpc2NhcmQtbm9uZQogZW5kaWYKIAotIyBBbGlnbiB0aGUgYml0IHNpemUgb2YgdXNl
cnNwYWNlIHByb2dyYW1zIHdpdGggdGhlIGtlcm5lbAotVVNFUkZMQUdTX0ZST01fS0VSTkVMIDo9
IC1tMzIgLW02NCAtLXRhcmdldD0lCisjIEFsaWduIHRoZSBiaXQgc2l6ZSwgYnl0ZSBvcmRlciBh
bmQgYXJjaGl0ZWN0dXJlIG9mIHVzZXJzcGFjZSBwcm9ncmFtcyB3aXRoIHRoZSBrZXJuZWwKK1VT
RVJGTEFHU19GUk9NX0tFUk5FTCA6PSAtbTMyIC1tNjQgLW1saXR0bGUtZW5kaWFuIC1tYmlnLWVu
ZGlhbiAtLXRhcmdldD0lIC1tYXJjaD0lIC1tYWJpPSUKIEtCVUlMRF9VU0VSQ0ZMQUdTICArPSAk
KGZpbHRlciAkKFVTRVJGTEFHU19GUk9NX0tFUk5FTCksICQoS0JVSUxEX0NQUEZMQUdTKSAkKEtC
VUlMRF9DRkxBR1MpKQogS0JVSUxEX1VTRVJMREZMQUdTICs9ICQoZmlsdGVyICQoVVNFUkZMQUdT
X0ZST01fS0VSTkVMKSwgJChLQlVJTERfQ1BQRkxBR1MpICQoS0JVSUxEX0NGTEFHUykpCiAKCi0t
IAoyLjQ5LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
