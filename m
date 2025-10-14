Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD158CCD194
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Oct 2025 13:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kh1m8S4OJfQi8963kCoi8+IX+//tHewUQtk65IFBKzI=; b=tGwomIF2O0C1DV
	dACKMOnhCFIECUy03GyV6+MBIRD7lkhtPhCZG5X8uxjsPUmvkbBg+WdOYV07QNHK9tr9S+N1UgmcD
	giVOy9LNyJ2vCa5dQIFcxw+Zs25lbvK6/U0Yw6xdCHke3i0gIEz5LMUN2zIeGVqLzbDiEMFFuD5fJ
	999A/9X4mWIHE+b8Z7f1TtW373De1cLQ/X6wJjjyrTOELePjOIOFrBgMuHHgr2kt6SyqsWeL4KwHu
	7lJryqwZKXQELXYanGKkA1W0QkuJOy7dkiUoPYPGCUmP1hk58QF/x++TZ7XbixleGS//1B68b5XL2
	30kKYMhts0Ur9ppynf6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ej7-0000000GOBD-22y0;
	Tue, 14 Oct 2025 13:06:05 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8eiz-0000000GO1W-3ZJJ
	for linux-riscv@lists.infradead.org;
	Tue, 14 Oct 2025 13:06:01 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760447155;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5DVnR5cKH1ysJgeyzhsfqmBnURn+edrPqy5/eKSQF/k=;
	b=JhNZzK88e25jp9GotNrIPt/vZZKb0VKNvXHuMydCbEqd1+HpUDRgpkeBu66g8l0nmzb5hj
	bJq7M5ewwEwCvoaLib81c2KVP2JXH18KAShW7IVI9vzPyYKeLzPHuQcnCLcuJ3JXd78+cb
	lUY4MTBSosdoQvzUYAb5icb+K1r5HG4pqLz9oI4bzhBVdZOIowUafsrp3TYAiTbpnnpYfU
	6qg49Q1Ays+clhKO56SqYcYh+OfTyryQT4RpjMe1QyOMPNBfLHRmczaPjLut258n2GT8QC
	+N+DKr68mMlHetmPxxPyjf2o5shGkZUkfBqZ9jlR19UUKQxhn11F/G4GGxOBVg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760447155;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5DVnR5cKH1ysJgeyzhsfqmBnURn+edrPqy5/eKSQF/k=;
	b=shg+bvHXD8MmVzyiF3EMIesqOVARExahkoJZzsvujW5lTkfMY5VPtwGaJNav+nBBAaMzPo
	USexF86fUhIfXgDQ==
Date: Tue, 14 Oct 2025 15:05:24 +0200
Subject: [PATCH v2 09/10] sparc: Implement custom CC_CAN_LINK
MIME-Version: 1.0
Message-Id: <20251014-kbuild-userprogs-bits-v2-9-faeec46e887a@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760447149; l=1096;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=dZCLaMpAGc/1vu8ptZyeXWxEiiNKEOUd3NRQEXSEOPk=;
 b=a1zArIcpsRzC1FZdasb8JGHUsoGoDAycc57M/S3ZNlxKRnq+Q21DHxSr8+hyt3/JppSgvNfcQ
 bxfFr7HMBuiCdP85ZG5aIqZqJw+JMdqAIBzuwcyKTmbOBLIvkFoAKI5
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_060558_068231_E263F3B0 
X-CRM114-Status: UNSURE (   7.00  )
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

VGhlIGdlbmVyaWMgQ0NfQ0FOX0xJTksgZGV0ZWN0aW9uIGRvZXMgbm90IHdvcmsgZm9yIGFsbCBh
cmNoaXRlY3R1cmVzLgpUbyBtYWtlIGl0IGNsZWFyZXIgaG93IHRoZSBkZXRlY3Rpb24gd29ya3Mg
b24gU1BBUkMgY3JlYXRlIGFuCmFyY2hpdGVjdHVyZS1zcGVjaWZpYyB2YXJpYW50LgoKU2lnbmVk
LW9mZi1ieTogVGhvbWFzIFdlacOfc2NodWggPHRob21hcy53ZWlzc3NjaHVoQGxpbnV0cm9uaXgu
ZGU+Ci0tLQogYXJjaC9zcGFyYy9LY29uZmlnIHwgMTEgKysrKysrKysrKysKIDEgZmlsZSBjaGFu
Z2VkLCAxMSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9zcGFyYy9LY29uZmlnIGIv
YXJjaC9zcGFyYy9LY29uZmlnCmluZGV4IGE2MzBkMzczZTY0NTNjNzQ1YWI4YmY1OGZjNTYyMmNm
MGVkYWY0YzkuLjY4YjU1M2E0N2QwMzlkYTQzNjhhMmRlMzAxNjhhYWY4MGE5NDExNDggMTAwNjQ0
Ci0tLSBhL2FyY2gvc3BhcmMvS2NvbmZpZworKysgYi9hcmNoL3NwYXJjL0tjb25maWcKQEAgLTEz
LDYgKzEzLDcgQEAgY29uZmlnIDY0QklUCiBjb25maWcgU1BBUkMKIAlib29sCiAJZGVmYXVsdCB5
CisJc2VsZWN0IEFSQ0hfSEFTX0NDX0NBTl9MSU5LCiAJc2VsZWN0IEFSQ0hfSEFTX0NQVV9DQUNI
RV9BTElBU0lORwogCXNlbGVjdCBBUkNIX0hBU19ETUFfT1BTCiAJc2VsZWN0IEFSQ0hfTUlHSFRf
SEFWRV9QQ19QQVJQT1JUIGlmIFNQQVJDNjQgJiYgUENJCkBAIC00NzUsNCArNDc2LDE0IEBAIGNv
bmZpZyBDT01QQVQKIAlzZWxlY3QgQVJDSF9XQU5UX09MRF9DT01QQVRfSVBDCiAJc2VsZWN0IENP
TVBBVF9PTERfU0lHQUNUSU9OCiAKK2NvbmZpZyBBUkNIX0NDX0NBTl9MSU5LCisJYm9vbAorCWRl
ZmF1bHQgJChjY19jYW5fbGlua191c2VyLC1tNjQpIGlmIDY0QklUCisJZGVmYXVsdCAkKGNjX2Nh
bl9saW5rX3VzZXIsLW0zMikKKworY29uZmlnIEFSQ0hfVVNFUkZMQUdTCisJc3RyaW5nCisJZGVm
YXVsdCAiLW02NCIgaWYgNjRCSVQKKwlkZWZhdWx0ICItbTMyIgorCiBzb3VyY2UgImRyaXZlcnMv
c2J1cy9jaGFyL0tjb25maWciCgotLSAKMi41MS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
