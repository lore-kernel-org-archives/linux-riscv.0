Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43D90C61CE7
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 09:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qWTZZFJnZd5Gyv0PShfL0Jc4GFjdPkq8sdwc4wXnDcU=; b=DAAmZn+UWxH2EN
	romoXrVAnf2l/r4oxadJE60JJ9JmFaaxE1Ht/+IF3I+FwWdk5NL+J1UEjPeFLabTRl10/toRQ59vI
	l7Y6aKKSgi7pzGmBCtm+PxW2nOVPy2AUiLJ36KI2DXVw6bfYfxL17WQMzuAeCWTq0zIWKUaQncUej
	qNHeModCLY8Wu9QOdhREsEii9XcHZK1PlE6t3RmWt18STAvXjruIbLdK4XXQCL1v4LPn/3Btb4/RD
	Vp5EQgYk1UBXz/eyn4Gs+1fnAxabQ+rtRDTn52+E1aZzFL9ifed6oEfbCOAvYELq3vIJBucJBAsLr
	0vSibX8deAjujMRY8HFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPHfi-00000009SEf-1Ihk;
	Wed, 11 Jun 2025 09:23:02 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPHf7-00000009S6j-3dfa
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 09:22:27 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749633744;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3HNZsp0JlEkXQwt3qtPmvEy68Xqh0vFAuSqvlPQb0tk=;
	b=ozsJbD3ZX1b1TkGONklwnRC0Ny/GSAJX3OYVI2fzjIY09e9Qll0amtsZ9Xjm8U1SjSQy7I
	gOKqJ/zoKv4EjJgrFsJQ64y4n256ijE1hDSKDqxEXZmbAXTVU/pUt4TNXWew1aJ3p155IN
	/9Xl5Qmo6F2LcYDF2fI5w+3WzRpOYDCKlbmjaC4Lhrl3FuZMbTuXGuftDMJR6DIl0ErsuC
	Fg0HI3rpR37M1bhnLWifsYAguK2vPpQGZ94K93n7e7gCTA4xbgVoREGrzONkF0ZoNAAsJZ
	qIzSYy4j6l6mf06OI6YpzYD+4o23q/yN5V0mrupshSzA9a109J3BDcwUfZzznA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749633744;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3HNZsp0JlEkXQwt3qtPmvEy68Xqh0vFAuSqvlPQb0tk=;
	b=zQIT3kbfh9XJgCN+qaxlUHW7+ex3ON7H/WPvvQYs1eD7SwosJIekGb6djwQYLbfgUwzAou
	RM9OkwLNLwiFfuBg==
Date: Wed, 11 Jun 2025 11:22:12 +0200
Subject: [PATCH v3 1/3] riscv: vdso: Deduplicate CFLAGS_REMOVE_* variables
MIME-Version: 1.0
Message-Id: <20250611-vdso-absolute-reloc-v3-1-47897d73784b@linutronix.de>
References: <20250611-vdso-absolute-reloc-v3-0-47897d73784b@linutronix.de>
In-Reply-To: <20250611-vdso-absolute-reloc-v3-0-47897d73784b@linutronix.de>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749633741; l=1184;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=OzIhnUie/Ctxfm+QEMkyUANhfsCLwQddvZkNgATaxKY=;
 b=SugqQlUcXcgVYUV2XtDiRrHWg6Doywxp9o305XEyBXMEA9Un62vvg09cf86xsaWlEwuAbkgFS
 LdMCSp/k8ELAG8PmZTTud1hV41V8Jio68n3rixW1dpWRLbEL1HwCdhO
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_022226_043478_847FDF6B 
X-CRM114-Status: UNSURE (   6.29  )
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

QWxsIHZEU08gb2JqZWN0cyBuZWVkIHRoZSBzYW1lIHRyZWF0bWVudC4KVG8gbWFrZSBjaGFuZ2Vz
IHRvIGJvdGggdGhlIGxpc3Qgb2Ygb2JqZWN0cyBhbmQgdGhlIGxpc3Qgb2YgcmVtb3ZlZCBmbGFn
cwplYXNpZXIsIGludHJvZHVjZSBhIGhlbHBlciB2YXJpYWJsZS4KClNpZ25lZC1vZmYtYnk6IFRo
b21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51dHJvbml4LmRlPgotLS0KIGFy
Y2gvcmlzY3Yva2VybmVsL3Zkc28vTWFrZWZpbGUgfCA3ICsrKystLS0KIDEgZmlsZSBjaGFuZ2Vk
LCA0IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9rZXJuZWwvdmRzby9NYWtlZmlsZSBiL2FyY2gvcmlzY3Yva2VybmVsL3Zkc28vTWFrZWZpbGUK
aW5kZXggOWViYjVlNTkwZjkzYTMyMjhjNDUxZGNhNThlNmQ1Y2ZiYmMwM2ZmNy4uYzE5YzNjNzZm
N2M5ZjZiMmY3NTIzYTU5MjY5ZGUzYjY4MzY1NjMyMyAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9r
ZXJuZWwvdmRzby9NYWtlZmlsZQorKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC92ZHNvL01ha2VmaWxl
CkBAIC00OSw5ICs0OSwxMCBAQCBDUFBGTEFHU192ZHNvLmxkcyArPSAtREhBU19WR0VUVElNRU9G
REFZCiBlbmRpZgogCiAjIERpc2FibGUgLXBnIHRvIHByZXZlbnQgaW5zZXJ0IGNhbGwgc2l0ZQot
Q0ZMQUdTX1JFTU9WRV92Z2V0dGltZW9mZGF5Lm8gPSAkKENDX0ZMQUdTX0ZUUkFDRSkgJChDQ19G
TEFHU19TQ1MpCi1DRkxBR1NfUkVNT1ZFX2dldHJhbmRvbS5vID0gJChDQ19GTEFHU19GVFJBQ0Up
ICQoQ0NfRkxBR1NfU0NTKQotQ0ZMQUdTX1JFTU9WRV9od3Byb2JlLm8gPSAkKENDX0ZMQUdTX0ZU
UkFDRSkgJChDQ19GTEFHU19TQ1MpCitDRkxBR1NfUkVNT1ZFX1ZEU08gPSAkKENDX0ZMQUdTX0ZU
UkFDRSkgJChDQ19GTEFHU19TQ1MpCitDRkxBR1NfUkVNT1ZFX3ZnZXR0aW1lb2ZkYXkubyA9ICQo
Q0ZMQUdTX1JFTU9WRV9WRFNPKQorQ0ZMQUdTX1JFTU9WRV9nZXRyYW5kb20ubyA9ICQoQ0ZMQUdT
X1JFTU9WRV9WRFNPKQorQ0ZMQUdTX1JFTU9WRV9od3Byb2JlLm8gPSAkKENGTEFHU19SRU1PVkVf
VkRTTykKIAogIyBGb3JjZSBkZXBlbmRlbmN5CiAkKG9iaikvdmRzby5vOiAkKG9iaikvdmRzby5z
bwoKLS0gCjIuNDkuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
