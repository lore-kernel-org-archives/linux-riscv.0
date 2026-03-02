Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81FF3E9B372
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Mar 2026 12:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6SDSDASeLWZu1t4Z7wchymdApo5c141d76fzz9oQDKk=; b=gZU0lDE352OzhM
	RY/dtqYoYia9gohWI68avNZEuqIVOEDkLfPOK4255h4j+sQNTlmv1TLE+2t3+kT1IaPoUSBwHrThw
	32pdWI5lB8SPetUzXUUbxCITWcAMx+GXWQnNveuY96QF/hncz9XNJ8/Kv9OvuZQt4i9kEM4iPi1H+
	oPR7kDnT16MfMup9CfYplXOV+15SyUuJ9M7AI10K3uoGcL6mOuOw7B9u5V6kaXXCZMpxcyi7EuEhg
	dC+YXgE+zzofW+K3svucF89n9shjkmXOZpGYRaB0+TokNVvSsWPLpuRh6SVj4vx95yEuRgBTjNAcr
	0c415+op58t4HRsGP7sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2LU-0000000Cvz6-05hz;
	Mon, 02 Mar 2026 12:25:56 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2LM-0000000CvpC-3INK;
	Mon, 02 Mar 2026 12:25:50 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772454345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y+wSVvr2iY1iH7k3F0iPCSqLzNSvbTbj527LLEkOjHE=;
	b=0ote18nbZ1t68zJyeexrdJSVHAZPwP9UOAsFgAAFR/fpqYcoez3egBK6lgBnGLIpBoYIKz
	byNNJflcxX/8kT7PsREcxt3F16BI7KnZB/m2IKc74GZSYeD2m3CHoAuFhIulLiNJ8gNHgT
	fEGJClPPwBHWhKwqt8bqeoHqX9DFdCRP2bHywf7Ar1A3BuZHm88vpLBma/whU2VfEjPu/N
	0AVHGyqtCyidsedREaPVbnXHovlkR1DKs3rnrmanu3HagPXtCHNl99JbLfJz39FsFs/Mnq
	gYBYIP+QlW6OTeMQ6Ptwvq/2BcQ8xXbDDHUKO8JYjy6dMfwBHZRxnLHMpnCOzg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772454345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y+wSVvr2iY1iH7k3F0iPCSqLzNSvbTbj527LLEkOjHE=;
	b=/aSPglB8AXbqg7opAXpO0/jUG+0+n3k3JqmDL/ll0iG0SJf+fha6jNyO8a0dtGc75s+t06
	2+O3rwMHLHMlBaCw==
Date: Mon, 02 Mar 2026 13:25:25 +0100
Subject: [PATCH 01/15] MAINTAINERS: exec: Add more auxvec.h variants
MIME-Version: 1.0
Message-Id: <20260302-at-vector-size-arch-v1-1-a11f03ba2ca8@linutronix.de>
References: <20260302-at-vector-size-arch-v1-0-a11f03ba2ca8@linutronix.de>
In-Reply-To: <20260302-at-vector-size-arch-v1-0-a11f03ba2ca8@linutronix.de>
To: Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-sh@vger.kernel.org, linux-alpha@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772454343; l=935;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=BIlr7zgi66zD1ig2kTolm4aENXktO7wosOLcoYFwhtU=;
 b=0OWgCWYeIEIelNOmr0tEyiBwM5q6MuFfywVklpSmD0OLBHIs+3QQGBNYsmCJJqT5R/0oHxk2v
 IVHrY681uTqCvAuwCRegS2QuY8D2kC+ODREUKmQlpZd3Q/msGQ3Pvmv
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_042548_960130_DF05811F 
X-CRM114-Status: UNSURE (   6.21  )
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

VGhlcmUgYXJlIHF1aXRlIGEgZmV3IGF1eHZlYy5oIGhlYWRlcnMuIE1hcmsgYWxsIG9mIHRoZW0g
bWFpbnRhaW5lZAphcyBwYXJ0IG9mICdFWEVDICYgQklORk1UIEFQSSwgRUxGJy4KClNpZ25lZC1v
ZmYtYnk6IFRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51dHJvbml4LmRl
PgotLS0KIE1BSU5UQUlORVJTIHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCmluZGV4IDU1YWYwMTUx
NzRhNS4uN2EyYzk1MmQ3MmJkIDEwMDY0NAotLS0gYS9NQUlOVEFJTkVSUworKysgYi9NQUlOVEFJ
TkVSUwpAQCAtOTU3MywxMyArOTU3MywxNiBAQCBMOglsaW51eC1tbUBrdmFjay5vcmcKIFM6CVN1
cHBvcnRlZAogVDoJZ2l0IGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVs
L2dpdC9rZWVzL2xpbnV4LmdpdCBmb3ItbmV4dC9leGVjdmUKIEY6CURvY3VtZW50YXRpb24vdXNl
cnNwYWNlLWFwaS9FTEYucnN0CitGOglhcmNoLyovaW5jbHVkZS91YXBpL2FzbS9hdXh2ZWMuaAog
RjoJZnMvKmJpbmZtdF8qLmMKIEY6CWZzL0tjb25maWcuYmluZm10CiBGOglmcy9leGVjLmMKIEY6
CWZzL3Rlc3RzL2JpbmZtdF8qX2t1bml0LmMKIEY6CWZzL3Rlc3RzL2V4ZWNfa3VuaXQuYworRjoJ
aW5jbHVkZS9saW51eC9hdXh2ZWMuaAogRjoJaW5jbHVkZS9saW51eC9iaW5mbXRzLmgKIEY6CWlu
Y2x1ZGUvbGludXgvZWxmLmgKK0Y6CWluY2x1ZGUvdWFwaS9hc20tZ2VuZXJpYy9hdXh2ZWMuaAog
RjoJaW5jbHVkZS91YXBpL2xpbnV4L2F1eHZlYy5oCiBGOglpbmNsdWRlL3VhcGkvbGludXgvYmlu
Zm10cy5oCiBGOglpbmNsdWRlL3VhcGkvbGludXgvZWxmLmgKCi0tIAoyLjUzLjAKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
