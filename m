Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82DB6CF07BA
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 07:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lnAxi83Pu4b0FnangeOKgeAnTZdV9lWER/y34aNXUgc=; b=1UVmq+7BV2lGfR
	sSHHsvHVcwzVhll2XoLJth2j/5Z/D84DPdFg/NUpWgLi3u51HPaZMgj1ELkDcXT8eh/Aheg47PwRT
	5JbiG2Uy8sXZOLEZzGX5kRuhc5yWuhIcrmrA+XTWPtmAi222nN5NZT9EkitEXlc5h4FOZTq2qSjLA
	NfRH1rqImHD+oWI44MG70VxcXaGYwK9sj+B3097rPraOYJ6F0+334Lf5ZbROTPjZCei/1qqvk9NrI
	oc3/ZmMgRJ8OaieCy6TaoJlX/ILA6jZYGw8iSZK1T8jL13lryX5qIDxGRUk6eX38acdjzn9+BOgBp
	7C8uJmto41siisrpS0CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syngz-0000000BqsE-2x2Z;
	Thu, 10 Oct 2024 07:34:37 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1synBX-0000000Blgs-3Oty;
	Thu, 10 Oct 2024 07:02:26 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728543723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WS9OFTNL6i5YPI6zM6XYGS4xer7v+jCfFqdEDEdD+PA=;
	b=2CGf23BNvNFJdIFtfq3Jk7/bwzZ4aXhFvROegxY4fJJB36JDgsE18kNRaEijAmAMiiCxmK
	eQvvxWbFtcAoiF2W79lRCOWS/6gFWvYTdFK7/B0zM2FdBe5sgcB/LiFcVKtqv1I+2KLRSq
	YU1Ol9Ym5KOHu2KpT6LMJaMD9tJdboqeJHHFuwcaD05pduHfSev2O7lZlopnOy1U1jBMv4
	F2vi0iTsyxYCmyYIyfSE0RLDcxovPSRlv3LYTm4WQVa7BZWlJhKFw8fuEos0QCLIKVVSep
	40MQvIMSD8f9DRglCCxM8/fF3GBXnDFMeJVVaXUCDPe6/PrdMhyArPYYDfwL/Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728543723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WS9OFTNL6i5YPI6zM6XYGS4xer7v+jCfFqdEDEdD+PA=;
	b=Z9xjFebFq2wfzwBV8oNyZ7m9J6Vsv2tFDo5RIG12I9R0zXEV+CJoDgq3VmUVNZQN+ywIKU
	ybEirSZPnsr9N7Aw==
Date: Thu, 10 Oct 2024 09:01:07 +0200
Subject: [PATCH 05/28] arm64: vdso: Use only one single vvar mapping
MIME-Version: 1.0
Message-Id: <20241010-vdso-generic-base-v1-5-b64f0842d512@linutronix.de>
References: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
In-Reply-To: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
To: Guo Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Russell King <linux@armlinux.org.uk>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, Theodore Ts'o <tytso@mit.edu>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, 
 linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728543717; l=4025;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=McuT3PV1z+ecfTcY5HznjYmkDmDvB3DrnPQkMu1bvMM=;
 b=lZJKERtZbQL8jCMjE0FDHFg02zHvm1+oaQxV6iWrFxmfZKjIyt33vLy/dsbu8/SUCokzNZyxf
 rg00Lj1uac8CKkC68fjs8SBGsbKJKyxu8DOV7hWm7we2hjW88ahCdmi
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_000208_239921_03F89512 
X-CRM114-Status: GOOD (  16.32  )
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

VGhlIHZ2YXIgbWFwcGluZyBpcyB0aGUgc2FtZSBmb3IgYWxsIHByb2Nlc3Nlcy4gVXNlIGEgc2lu
Z2xlIG1hcHBpbmcgdG8Kc2ltcGxpZnkgdGhlIGxvZ2ljIGFuZCBhbGlnbiBpdCB3aXRoIHRoZSBv
dGhlciBhcmNoaXRlY3R1cmVzLgoKSW4gYWRkaXRpb24gdGhpcyB3aWxsIGVuYWJsZSB0aGUgbW92
ZSBvZiB0aGUgdnZhciBoYW5kbGluZyBpbnRvIGdlbmVyaWMgY29kZS4KClNpZ25lZC1vZmYtYnk6
IFRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51dHJvbml4LmRlPgotLS0K
IGFyY2gvYXJtNjQva2VybmVsL3Zkc28uYyB8IDQzICsrKysrKysrKysrKystLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAzMCBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2tlcm5lbC92ZHNvLmMgYi9hcmNo
L2FybTY0L2tlcm5lbC92ZHNvLmMKaW5kZXggNzA2YzljM2E3YTUwYTQ1NzRlNzdkYTI5NmU5Yzgz
ZTFlMmE5ZjVhYi4uMmQ3Zjg1MDI5NTNiYmNmNWM5ZDMyZjk3MGQ5MmZlZDcxODk0YjVhOSAxMDA2
NDQKLS0tIGEvYXJjaC9hcm02NC9rZXJuZWwvdmRzby5jCisrKyBiL2FyY2gvYXJtNjQva2VybmVs
L3Zkc28uYwpAQCAtMzksOCArMzksNiBAQCBzdHJ1Y3QgdmRzb19hYmlfaW5mbyB7CiAJY29uc3Qg
Y2hhciAqdmRzb19jb2RlX3N0YXJ0OwogCWNvbnN0IGNoYXIgKnZkc29fY29kZV9lbmQ7CiAJdW5z
aWduZWQgbG9uZyB2ZHNvX3BhZ2VzOwotCS8qIERhdGEgTWFwcGluZyAqLwotCXN0cnVjdCB2bV9z
cGVjaWFsX21hcHBpbmcgKmRtOwogCS8qIENvZGUgTWFwcGluZyAqLwogCXN0cnVjdCB2bV9zcGVj
aWFsX21hcHBpbmcgKmNtOwogfTsKQEAgLTExMyw2ICsxMTEsOCBAQCBzdHJ1Y3QgdmRzb19kYXRh
ICphcmNoX2dldF92ZHNvX2RhdGEodm9pZCAqdnZhcl9wYWdlKQogCXJldHVybiAoc3RydWN0IHZk
c29fZGF0YSAqKSh2dmFyX3BhZ2UpOwogfQogCitzdGF0aWMgY29uc3Qgc3RydWN0IHZtX3NwZWNp
YWxfbWFwcGluZyB2dmFyX21hcDsKKwogLyoKICAqIFRoZSB2dmFyIG1hcHBpbmcgY29udGFpbnMg
ZGF0YSBmb3IgYSBzcGVjaWZpYyB0aW1lIG5hbWVzcGFjZSwgc28gd2hlbiBhIHRhc2sKICAqIGNo
YW5nZXMgbmFtZXNwYWNlIHdlIG11c3QgdW5tYXAgaXRzIHZ2YXIgZGF0YSBmb3IgdGhlIG9sZCBu
YW1lc3BhY2UuCkBAIC0xMjksMTIgKzEyOSw4IEBAIGludCB2ZHNvX2pvaW5fdGltZW5zKHN0cnVj
dCB0YXNrX3N0cnVjdCAqdGFzaywgc3RydWN0IHRpbWVfbmFtZXNwYWNlICpucykKIAltbWFwX3Jl
YWRfbG9jayhtbSk7CiAKIAlmb3JfZWFjaF92bWEodm1pLCB2bWEpIHsKLQkJaWYgKHZtYV9pc19z
cGVjaWFsX21hcHBpbmcodm1hLCB2ZHNvX2luZm9bVkRTT19BQklfQUE2NF0uZG0pKQotCQkJemFw
X3ZtYV9wYWdlcyh2bWEpOwotI2lmZGVmIENPTkZJR19DT01QQVRfVkRTTwotCQlpZiAodm1hX2lz
X3NwZWNpYWxfbWFwcGluZyh2bWEsIHZkc29faW5mb1tWRFNPX0FCSV9BQTMyXS5kbSkpCisJCWlm
ICh2bWFfaXNfc3BlY2lhbF9tYXBwaW5nKHZtYSwgJnZ2YXJfbWFwKSkKIAkJCXphcF92bWFfcGFn
ZXModm1hKTsKLSNlbmRpZgogCX0KIAogCW1tYXBfcmVhZF91bmxvY2sobW0pOwpAQCAtMTc2LDYg
KzE3MiwxMSBAQCBzdGF0aWMgdm1fZmF1bHRfdCB2dmFyX2ZhdWx0KGNvbnN0IHN0cnVjdCB2bV9z
cGVjaWFsX21hcHBpbmcgKnNtLAogCXJldHVybiB2bWZfaW5zZXJ0X3Bmbih2bWEsIHZtZi0+YWRk
cmVzcywgcGZuKTsKIH0KIAorc3RhdGljIGNvbnN0IHN0cnVjdCB2bV9zcGVjaWFsX21hcHBpbmcg
dnZhcl9tYXAgPSB7CisJLm5hbWUgICA9ICJbdnZhcl0iLAorCS5mYXVsdCA9IHZ2YXJfZmF1bHQs
Cit9OworCiBzdGF0aWMgaW50IF9fc2V0dXBfYWRkaXRpb25hbF9wYWdlcyhlbnVtIHZkc29fYWJp
IGFiaSwKIAkJCQkgICAgc3RydWN0IG1tX3N0cnVjdCAqbW0sCiAJCQkJICAgIHN0cnVjdCBsaW51
eF9iaW5wcm0gKmJwcm0sCkBAIC0xOTksNyArMjAwLDcgQEAgc3RhdGljIGludCBfX3NldHVwX2Fk
ZGl0aW9uYWxfcGFnZXMoZW51bSB2ZHNvX2FiaSBhYmksCiAKIAlyZXQgPSBfaW5zdGFsbF9zcGVj
aWFsX21hcHBpbmcobW0sIHZkc29fYmFzZSwgVlZBUl9OUl9QQUdFUyAqIFBBR0VfU0laRSwKIAkJ
CQkgICAgICAgVk1fUkVBRHxWTV9NQVlSRUFEfFZNX1BGTk1BUCwKLQkJCQkgICAgICAgdmRzb19p
bmZvW2FiaV0uZG0pOworCQkJCSAgICAgICAmdnZhcl9tYXApOwogCWlmIChJU19FUlIocmV0KSkK
IAkJZ290byB1cF9mYWlsOwogCkBAIC0yMjksNyArMjMwLDYgQEAgc3RhdGljIGludCBfX3NldHVw
X2FkZGl0aW9uYWxfcGFnZXMoZW51bSB2ZHNvX2FiaSBhYmksCiBlbnVtIGFhcmNoMzJfbWFwIHsK
IAlBQTMyX01BUF9WRUNUT1JTLCAvKiBrdXNlciBoZWxwZXJzICovCiAJQUEzMl9NQVBfU0lHUEFH
RSwKLQlBQTMyX01BUF9WVkFSLAogCUFBMzJfTUFQX1ZEU08sCiB9OwogCkBAIC0yNTQsMTAgKzI1
NCw2IEBAIHN0YXRpYyBzdHJ1Y3Qgdm1fc3BlY2lhbF9tYXBwaW5nIGFhcmNoMzJfdmRzb19tYXBz
W10gPSB7CiAJCS5wYWdlcwk9ICZhYXJjaDMyX3NpZ19wYWdlLAogCQkubXJlbWFwCT0gYWFyY2gz
Ml9zaWdwYWdlX21yZW1hcCwKIAl9LAotCVtBQTMyX01BUF9WVkFSXSA9IHsKLQkJLm5hbWUgPSAi
W3Z2YXJdIiwKLQkJLmZhdWx0ID0gdnZhcl9mYXVsdCwKLQl9LAogCVtBQTMyX01BUF9WRFNPXSA9
IHsKIAkJLm5hbWUgPSAiW3Zkc29dIiwKIAkJLm1yZW1hcCA9IHZkc29fbXJlbWFwLApAQCAtMzA3
LDcgKzMwMyw2IEBAIHN0YXRpYyBpbnQgX19pbml0IF9fYWFyY2gzMl9hbGxvY192ZHNvX3BhZ2Vz
KHZvaWQpCiAJaWYgKCFJU19FTkFCTEVEKENPTkZJR19DT01QQVRfVkRTTykpCiAJCXJldHVybiAw
OwogCi0JdmRzb19pbmZvW1ZEU09fQUJJX0FBMzJdLmRtID0gJmFhcmNoMzJfdmRzb19tYXBzW0FB
MzJfTUFQX1ZWQVJdOwogCXZkc29faW5mb1tWRFNPX0FCSV9BQTMyXS5jbSA9ICZhYXJjaDMyX3Zk
c29fbWFwc1tBQTMyX01BUF9WRFNPXTsKIAogCXJldHVybiBfX3Zkc29faW5pdChWRFNPX0FCSV9B
QTMyKTsKQEAgLTQwMiwyNiArMzk3LDE0IEBAIGludCBhYXJjaDMyX3NldHVwX2FkZGl0aW9uYWxf
cGFnZXMoc3RydWN0IGxpbnV4X2JpbnBybSAqYnBybSwgaW50IHVzZXNfaW50ZXJwKQogfQogI2Vu
ZGlmIC8qIENPTkZJR19DT01QQVQgKi8KIAotZW51bSBhYXJjaDY0X21hcCB7Ci0JQUE2NF9NQVBf
VlZBUiwKLQlBQTY0X01BUF9WRFNPLAotfTsKLQotc3RhdGljIHN0cnVjdCB2bV9zcGVjaWFsX21h
cHBpbmcgYWFyY2g2NF92ZHNvX21hcHNbXSBfX3JvX2FmdGVyX2luaXQgPSB7Ci0JW0FBNjRfTUFQ
X1ZWQVJdID0gewotCQkubmFtZQk9ICJbdnZhcl0iLAotCQkuZmF1bHQgPSB2dmFyX2ZhdWx0LAot
CX0sCi0JW0FBNjRfTUFQX1ZEU09dID0gewotCQkubmFtZQk9ICJbdmRzb10iLAotCQkubXJlbWFw
ID0gdmRzb19tcmVtYXAsCi0JfSwKK3N0YXRpYyBzdHJ1Y3Qgdm1fc3BlY2lhbF9tYXBwaW5nIGFh
cmNoNjRfdmRzb19tYXAgX19yb19hZnRlcl9pbml0ID0geworCS5uYW1lCT0gIlt2ZHNvXSIsCisJ
Lm1yZW1hcCA9IHZkc29fbXJlbWFwLAogfTsKIAogc3RhdGljIGludCBfX2luaXQgdmRzb19pbml0
KHZvaWQpCiB7Ci0JdmRzb19pbmZvW1ZEU09fQUJJX0FBNjRdLmRtID0gJmFhcmNoNjRfdmRzb19t
YXBzW0FBNjRfTUFQX1ZWQVJdOwotCXZkc29faW5mb1tWRFNPX0FCSV9BQTY0XS5jbSA9ICZhYXJj
aDY0X3Zkc29fbWFwc1tBQTY0X01BUF9WRFNPXTsKKwl2ZHNvX2luZm9bVkRTT19BQklfQUE2NF0u
Y20gPSAmYWFyY2g2NF92ZHNvX21hcDsKIAogCXJldHVybiBfX3Zkc29faW5pdChWRFNPX0FCSV9B
QTY0KTsKIH0KCi0tIAoyLjQ3LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
