Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0890ECCD184
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Oct 2025 13:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XIRGh7p7ZkpgvVcI+/bAQAyo/1QlOx/OD5FYR+oL1SM=; b=pSxOGZqXr8+O9Y
	4ZI4aN5/wWaxnpaXCicZ40ki0VozO3YJhvbtXs3Q7kngxeCpmOZG8gNOLgfrDYsA8HQNDGzIU0itQ
	ZXOxYTJm7V749+unz8ojpDuiRuInDl3Wxwt+uqf1h++RYzBDAYGsAtWPe37d9TaDNiTmnCPCRIVFq
	Cip0NnLnbgJTt0TpM8GaSl9VgO26NxNzPqS/+Lev7bxvQVbXxYyMMvOWViRhTCtpTGagXukGAEfPZ
	qE78i4wDIFui4+i8vEG0mQCtpBbxmDSVEJvjT1UIrAMCOo5DCDjEU1tpaGYXh3z+IBzSPJal5yP8m
	DiJVZpVBpoJsg3SegmnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ej7-0000000GOBh-3RtM;
	Tue, 14 Oct 2025 13:06:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ej5-0000000GO89-2nAR
	for linux-riscv@bombadil.infradead.org;
	Tue, 14 Oct 2025 13:06:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=P3cczBZg1hsuy3VQFI6BicmC+DtK7KqMRuLTbCsjnP4=; b=D7lWhIlvOEs25C++JLi3HeRlPQ
	RRFJS4waIVOpi5eMBfe/y+UELVOmHnlYoSzOJvLjKX4vw4fI/DtMYee6240GPrRwZ3LzIrznaCxY2
	4bRBhf6odWNnt+0mzlkOgKNIrTLiTa67qIsuOiwtO2/cCR5NO/vkl3Zqs/j4LJZBLPIaDQaBUBjQo
	iR0Yo6afgSoyiC4XN4h6RESmaS2wBzqXsnCe7MNgYYM2jPneMcLviVMtc7nFb1uuv6j2VcOsLCmEn
	KGRDrSR6qFsXdFDuGyfBPraOdBUpWyRpFpT8ZO7H7aPTYtzzFINgZyk6FVICoBYiRo4lCcfnYERj8
	mPLAWp4Q==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ej0-00000005AZ2-20VS
	for linux-riscv@lists.infradead.org;
	Tue, 14 Oct 2025 13:06:02 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760447155;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P3cczBZg1hsuy3VQFI6BicmC+DtK7KqMRuLTbCsjnP4=;
	b=zwMEM9rRsQ90GXTSdrweLrU/7N3K+yghbYemcwg2uPHlqNF4j0cCpvgXjHX+0YTJHZKeOJ
	AV7HOIPkmXmNzu6g0EfsZnhSDogez7ExUFpFIQjBIUmkwgedkM3DGW224OvDuv52AIiZH9
	uKRl9o2EZd7M+RCB5zTZ1f+xyZnAR5GiJLRFHzfR4cP0emlAiibCVqzSAHClyND3Pp/2iM
	yKs65bATUduM7f//XMj8XYH2ahgPRCn5m0VbgHU6FK+5oevGvM7717IdBgoO7SM8ZQYHJC
	HSnF8eolELUmKlBeYbD2mXYIfape+3JtKdL1CAPjIYMe4jiWJN0qV2kseLuxsg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760447155;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P3cczBZg1hsuy3VQFI6BicmC+DtK7KqMRuLTbCsjnP4=;
	b=W4M1n9ep7+/iLbuSo+Li8obSVodl7csZ5v1BhDxO5sXkVBj5QToSOlVQNP3+geRfZJcBNk
	80JSyHmdyZFC2oAA==
Date: Tue, 14 Oct 2025 15:05:25 +0200
Subject: [PATCH v2 10/10] kbuild: simplify CC_CAN_LINK
MIME-Version: 1.0
Message-Id: <20251014-kbuild-userprogs-bits-v2-10-faeec46e887a@linutronix.de>
References: <20251014-kbuild-userprogs-bits-v2-0-faeec46e887a@linutronix.de>
In-Reply-To: <20251014-kbuild-userprogs-bits-v2-0-faeec46e887a@linutronix.de>
To: Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, Nicolas Schier <nsc@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Masahiro Yamada <masahiroy@kernel.org>, linux-riscv@lists.infradead.org, 
 linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760447149; l=1868;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=3tMmqGYPXW1+sizcvYuquIc8pIXvr2WxMOGAl2JNK7w=;
 b=NFH6jl0rxMrCvmdRLauKbjBZxs9geVFFRlVKeBozgXilXJgY1Mju4UC/ys+/hGi5CHjYmw4ka
 Wd0jRrV874oD4xRqVjBpgkRZJoGweQQIsS5fVbRbcN//KQqo62xtX6e
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_140600_567588_33AA06B2 
X-CRM114-Status: UNSURE (   8.36  )
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

QWxsIGFyY2hpdGVjdHVyZXMgc3VwcG9ydGluZyBtdWx0aXBsZSBBQklzIGhhdmUgYmVlbiBtaWdy
YXRlZCB0bwpBUkNIX0NDX0NBTl9MSU5LLiBUaGUgcmVtYWluaW5nIG9uZXMgZG8gbm90IHJlcXVp
cmUgYW55IHNwZWNpYWwgZmxhZywKc28gc2ltcGxpZnkgdGhlIGxvZ2ljLgoKU2lnbmVkLW9mZi1i
eTogVGhvbWFzIFdlacOfc2NodWggPHRob21hcy53ZWlzc3NjaHVoQGxpbnV0cm9uaXguZGU+Ci0t
LQogTWFrZWZpbGUgICAgIHwgMTEgKysrLS0tLS0tLS0KIGluaXQvS2NvbmZpZyB8ICAzICstLQog
MiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL01ha2VmaWxlIGIvTWFrZWZpbGUKaW5kZXggMjZlNWJjYTUzNGUyNzAzNGMzNTU5Mzli
Y2E0YzkwZGI0MzVlY2RiZC4uMWI3ZGE5ZjEwYjg4ZjFhMzc0YWUzNDQ3N2U1NjIxYjRkZDI3YzAx
NyAxMDA2NDQKLS0tIGEvTWFrZWZpbGUKKysrIGIvTWFrZWZpbGUKQEAgLTExMzcsMTcgKzExMzcs
MTIgQEAgZW5kaWYKICMgQWxpZ24gdGhlIGFyY2hpdGVjdHVyZSBvZiB1c2Vyc3BhY2UgcHJvZ3Jh
bXMgd2l0aCB0aGUga2VybmVsCiBVU0VSRkxBR1NfRlJPTV9LRVJORUwgOj0gLS10YXJnZXQ9JQog
Ci1pZmRlZiBDT05GSUdfQVJDSF9VU0VSUFJPR1NfQ0ZMQUdTCi1LQlVJTERfVVNFUkNGTEFHUyAr
PSAkKENPTkZJR19BUkNIX1VTRVJGTEFHUykKLUtCVUlMRF9VU0VSTERGTEFHUyArPSAkKENPTkZJ
R19BUkNIX1VTRVJGTEFHUykKLWVsc2UKLSMgSWYgbm90IG92ZXJyaWRkZW4gYWxzbyBpbmhlcml0
IHRoZSBiaXQgc2l6ZQotVVNFUkZMQUdTX0ZST01fS0VSTkVMICs9IC1tMzIgLW02NAotZW5kaWYK
LQogS0JVSUxEX1VTRVJDRkxBR1MgICs9ICQoZmlsdGVyICQoVVNFUkZMQUdTX0ZST01fS0VSTkVM
KSwgJChLQlVJTERfQ1BQRkxBR1MpICQoS0JVSUxEX0NGTEFHUykpCiBLQlVJTERfVVNFUkxERkxB
R1MgKz0gJChmaWx0ZXIgJChVU0VSRkxBR1NfRlJPTV9LRVJORUwpLCAkKEtCVUlMRF9DUFBGTEFH
UykgJChLQlVJTERfQ0ZMQUdTKSkKIAorS0JVSUxEX1VTRVJDRkxBR1MgKz0gJChDT05GSUdfQVJD
SF9VU0VSRkxBR1MpCitLQlVJTERfVVNFUkxERkxBR1MgKz0gJChDT05GSUdfQVJDSF9VU0VSRkxB
R1MpCisKICMgdXNlcnNwYWNlIHByb2dyYW1zIGFyZSBsaW5rZWQgdmlhIHRoZSBjb21waWxlciwg
dXNlIHRoZSBjb3JyZWN0IGxpbmtlcgogaWZkZWYgQ09ORklHX0NDX0lTX0NMQU5HCiBLQlVJTERf
VVNFUkxERkxBR1MgKz0gLS1sZC1wYXRoPSQoTEQpCmRpZmYgLS1naXQgYS9pbml0L0tjb25maWcg
Yi9pbml0L0tjb25maWcKaW5kZXggNGEyYWUzY2ZiZjI2NTI1YTYwOTM2ZDliMjlhNzRlZjQzMTli
YTNhNS4uYTAxMjc1OThmMmYyNWZmYjU1ZGJiOGEwNjkxYjBhYTY4MTM4ZmM2OSAxMDA2NDQKLS0t
IGEvaW5pdC9LY29uZmlnCisrKyBiL2luaXQvS2NvbmZpZwpAQCAtODgsOCArODgsNyBAQCBjb25m
aWcgQVJDSF9IQVNfQ0NfQ0FOX0xJTksKIGNvbmZpZyBDQ19DQU5fTElOSwogCWJvb2wKIAlkZWZh
dWx0IEFSQ0hfQ0NfQ0FOX0xJTksgaWYgQVJDSF9IQVNfQ0NfQ0FOX0xJTksKLQlkZWZhdWx0ICQo
Y2NfY2FuX2xpbmtfdXNlciwkKG02NC1mbGFnKSkgaWYgNjRCSVQKLQlkZWZhdWx0ICQoY2NfY2Fu
X2xpbmtfdXNlciwkKG0zMi1mbGFnKSkKKwlkZWZhdWx0ICQoY2NfY2FuX2xpbmtfdXNlcikKIAog
IyBGaXhlZCBpbiBHQ0MgMTQsIDEzLjMsIDEyLjQgYW5kIDExLjUKICMgaHR0cHM6Ly9nY2MuZ251
Lm9yZy9idWd6aWxsYS9zaG93X2J1Zy5jZ2k/aWQ9MTEzOTIxCgotLSAKMi41MS4wCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
