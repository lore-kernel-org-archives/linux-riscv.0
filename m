Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19A2CE9B374
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Mar 2026 12:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C4+s/iop1gg82+5xw+6shi04u2FaydruyuNxRYh4tz4=; b=KgGuHbsNJjAYH2
	PK6nTtVE3e4776/SByBjx8YpLwueBdoPHWt9vG6VN+R2a00MJcFLU0qOnEbjnIfhV1A633vv/ZKh/
	hlyV7v9EL1jMS+Upyv/AdMlbidVLnJnDF1y0zTuiiAjOQvPAfg0PfqJpwEK3lchIjcyNuSep5Tnab
	WeGhKpd3jzfI5hrdX6dAmVji547q7qAkcMtgx5+HD8nu18i3OjuDLyZB6HVSQCwcyeWrzp2SKowzU
	WrdjwCqFKmCOoMvQWNMatfz/lh/g14szX9fb7t/EU1vMTKNelCua9YI7AAq178womBYbR2U4VVXiE
	xHUHfsjwG6vSQr+umZxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2LQ-0000000CvtS-16FJ;
	Mon, 02 Mar 2026 12:25:52 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2LM-0000000CvpG-13cG;
	Mon, 02 Mar 2026 12:25:49 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772454346;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BHIzJvF5KQOpwYCYi9ql6W4HspVQ0yjpDjp6mM86yJw=;
	b=VSTpMZSg42IpjDoyq8x9+eZPlsHoPorC5Yp8YHj4lKeW+Q1Szd1xOG4fFF7EJLwDkmEElh
	Z3g2XNlLUEQXFYWtT1wTzzVrlTXkuKzTmGMw+x0EqKJ4LeUXrjJjJz9lJnK+89gpq3WLGy
	oN1SPmqhXJjTI1F26N/mPppPlsn4jQGpTDBXT0NDq/8fxvXULJkTzM2tpxTQVwaHLcuW1U
	Ae/LHkrGix4F6TnO6aBb8sxd1YFTkcIXW+VMaM4TNsJsrPLF9PBIQ54+mKt8MHtaGAITcS
	B+X5r0z7pzo5rFVib7xx/JWax0hdtUhV0alQE1QY5Ha1BrzXLHxtWhLz6E8YJA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772454346;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BHIzJvF5KQOpwYCYi9ql6W4HspVQ0yjpDjp6mM86yJw=;
	b=G/2aXJAd/neq7Iq6LG5EvgJJLTyYQF8QAAaiLOtne55+AhOQkYy3dDXFI4V6jUcj/tzh18
	cH1j7O7IEeC/0FAg==
Date: Mon, 02 Mar 2026 13:25:27 +0100
Subject: [PATCH 03/15] asm-generic: add an in-kernel auxvec.h header
MIME-Version: 1.0
Message-Id: <20260302-at-vector-size-arch-v1-3-a11f03ba2ca8@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772454343; l=2425;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=juGti0dpwtScxN3ZOParltAs+5PHUSX08Ot1ja9jIhY=;
 b=Xcrk5dRYDUnYdF4eUZUFljFjwJQobHGx53H0FPFSGhAS/a5w0rdNpYo278IFrTj31KWMPplHV
 UTZtJZTy+WEAZQyCi2JwlViZJY/10n5lJZhKwTiWSCLwCN/M5GCwyen
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_042548_430470_C80F3197 
X-CRM114-Status: GOOD (  10.73  )
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

VXBjb21pbmcgY2hhbmdlcyB3aWxsIGNyZWF0ZSBhcmNoaXRlY3R1cmUtc3BlY2lmaWMgYXNtL2F1
eHZlYy5oIGhlYWRlcnMuCkFkZCBhc20tZ2VuZXJpYyBpbmZyYXN0cnVjdHVyZSB0byBoYW5kbGUg
dGhlIGZhbGxiYWNrcyBmb3IgYXJjaGl0ZWN0dXJlcwp3aGljaCBhcmUgbm90IG1pZ3JhdGVkIHll
dCBhbmQgdGhvc2Ugd2hpY2ggd29uJ3QgcmVxdWlyZSB0aGVpciBvd24KZGVmaW5pdGlvbi4KCkV4
dGVuZCB0aGUgbGlzdCBvZiBpbmNsdWRlcyBpbiBsaW51eC9hdXh2ZWMuaCB0byBjb3ZlciBhbGwg
cG90ZW50aWFsCmxvdy1sZXZlbCBhdXh2ZWMuaCBoZWFkZXJzLgoKU2lnbmVkLW9mZi1ieTogVGhv
bWFzIFdlacOfc2NodWggPHRob21hcy53ZWlzc3NjaHVoQGxpbnV0cm9uaXguZGU+Ci0tLQogTUFJ
TlRBSU5FUlMgICAgICAgICAgICAgICAgICB8IDIgKysKIGluY2x1ZGUvYXNtLWdlbmVyaWMvS2J1
aWxkICAgfCAxICsKIGluY2x1ZGUvYXNtLWdlbmVyaWMvYXV4dmVjLmggfCA3ICsrKysrKysKIGlu
Y2x1ZGUvbGludXgvYXV4dmVjLmggICAgICAgfCAyICsrCiA0IGZpbGVzIGNoYW5nZWQsIDEyIGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCmluZGV4
IDdhMmM5NTJkNzJiZC4uMjM5YzRlM2VmNWM2IDEwMDY0NAotLS0gYS9NQUlOVEFJTkVSUworKysg
Yi9NQUlOVEFJTkVSUwpAQCAtOTU3MywxMiArOTU3MywxNCBAQCBMOglsaW51eC1tbUBrdmFjay5v
cmcKIFM6CVN1cHBvcnRlZAogVDoJZ2l0IGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGlu
dXgva2VybmVsL2dpdC9rZWVzL2xpbnV4LmdpdCBmb3ItbmV4dC9leGVjdmUKIEY6CURvY3VtZW50
YXRpb24vdXNlcnNwYWNlLWFwaS9FTEYucnN0CitGOglhcmNoLyovaW5jbHVkZS9hc20vYXV4dmVj
LmgKIEY6CWFyY2gvKi9pbmNsdWRlL3VhcGkvYXNtL2F1eHZlYy5oCiBGOglmcy8qYmluZm10Xyou
YwogRjoJZnMvS2NvbmZpZy5iaW5mbXQKIEY6CWZzL2V4ZWMuYwogRjoJZnMvdGVzdHMvYmluZm10
Xypfa3VuaXQuYwogRjoJZnMvdGVzdHMvZXhlY19rdW5pdC5jCitGOglpbmNsdWRlL2FzbS1nZW5l
cmljL2F1eHZlYy5oCiBGOglpbmNsdWRlL2xpbnV4L2F1eHZlYy5oCiBGOglpbmNsdWRlL2xpbnV4
L2JpbmZtdHMuaAogRjoJaW5jbHVkZS9saW51eC9lbGYuaApkaWZmIC0tZ2l0IGEvaW5jbHVkZS9h
c20tZ2VuZXJpYy9LYnVpbGQgYi9pbmNsdWRlL2FzbS1nZW5lcmljL0tidWlsZAppbmRleCA5YWZm
NjFlN2I4ZjIuLjc1NmE5OTFhZWY2NyAxMDA2NDQKLS0tIGEvaW5jbHVkZS9hc20tZ2VuZXJpYy9L
YnVpbGQKKysrIGIvaW5jbHVkZS9hc20tZ2VuZXJpYy9LYnVpbGQKQEAgLTYsNiArNiw3IEBACiAK
IG1hbmRhdG9yeS15ICs9IGF0b21pYy5oCiBtYW5kYXRvcnkteSArPSBhcmNocmFuZG9tLmgKK21h
bmRhdG9yeS15ICs9IGF1eHZlYy5oCiBtYW5kYXRvcnkteSArPSBiYXJyaWVyLmgKIG1hbmRhdG9y
eS15ICs9IGJpdG9wcy5oCiBtYW5kYXRvcnkteSArPSBidWcuaApkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9hc20tZ2VuZXJpYy9hdXh2ZWMuaCBiL2luY2x1ZGUvYXNtLWdlbmVyaWMvYXV4dmVjLmgKbmV3
IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi5lNGFiZDJhOGM1ZWQKLS0tIC9k
ZXYvbnVsbAorKysgYi9pbmNsdWRlL2FzbS1nZW5lcmljL2F1eHZlYy5oCkBAIC0wLDAgKzEsNyBA
QAorLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgKi8KKyNpZm5kZWYgX19BU01f
R0VORVJJQ19BVVhWQUxfSF9fCisjZGVmaW5lIF9fQVNNX0dFTkVSSUNfQVVYVkFMX0hfXworCisj
ZGVmaW5lIEFUX1ZFQ1RPUl9TSVpFX0FSQ0ggMAorCisjZW5kaWYKZGlmZiAtLWdpdCBhL2luY2x1
ZGUvbGludXgvYXV4dmVjLmggYi9pbmNsdWRlL2xpbnV4L2F1eHZlYy5oCmluZGV4IDk0M2U4Yjgw
YjQxZS4uNjhjOWQ2YjExOGE5IDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L2F1eHZlYy5oCisr
KyBiL2luY2x1ZGUvbGludXgvYXV4dmVjLmgKQEAgLTIsNyArMiw5IEBACiAjaWZuZGVmIF9MSU5V
WF9BVVhWRUNfSAogI2RlZmluZSBfTElOVVhfQVVYVkVDX0gKIAorI2luY2x1ZGUgPHVhcGkvYXNt
L2F1eHZlYy5oPgogI2luY2x1ZGUgPHVhcGkvbGludXgvYXV4dmVjLmg+CisjaW5jbHVkZSA8YXNt
L2F1eHZlYy5oPgogCiAjZGVmaW5lIEFUX1ZFQ1RPUl9TSVpFX0JBU0UgMjIgLyogTkVXX0FVWF9F
TlQgZW50cmllcyBpbiBhdXhpbGlhcnkgdGFibGUgKi8KICAgLyogbnVtYmVyIG9mICIjZGVmaW5l
IEFUXy4qIiBhYm92ZSwgbWludXMge0FUX05VTEwsIEFUX0lHTk9SRSwgQVRfTk9URUxGfSAqLwoK
LS0gCjIuNTMuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
