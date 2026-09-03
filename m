Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 731BCC624DB
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Sep 2026 07:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wSgHutTQTbu/5/HzSZ0glcSg7zp4gRGVtPWTMQNfJss=; b=aXXM87TzSHC4Nn
	hgQ5SJmm1oigR4xpm0NDUpUUrHl0Jgiu06LgWbIavvdGyKuRas+Ouk73B7/GQIH1+J/l1aJfYXLBu
	dFNuEzpQmA3vxMH+M/iOgiizMYCSKQUSmZDtpK/1E635wm8S7JNHaEVqxqgnpJyyH3JlAQOl4YYD/
	U0l2euanP+sXsyfPIiPHizlSodhMRHzsJAnGO+FOcPwRdQimsOTKbIFS0xHqsHC/NMFmA0ARi+DE4
	Vd9D6sJEkyjXTShyLz7Mm9XDqqo3WhQrZXLLzXs30Z2HyVg/ndqMHMpkiWsnLaUCH6tkAJkxxybF3
	8VSv/4AlDabMhtCuX+CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x224m-0000000Gcl5-0n3g;
	Thu, 03 Sep 2026 07:41:36 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x224i-0000000Gchy-2YB2;
	Thu, 03 Sep 2026 07:41:34 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788421287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HcMZPcEqwvVMhaVCt8MkUvZh7YAwKSLLYydvmnNx69g=;
	b=zc+fw1vPS28yXzWhjuVq688bLTlDJP+PQOO2TZg5QcxVNPZStsrnS4EMvXTkuI9WChAUF6
	e98Za95kruhvUKHM3/b34Kuksc7kVeCyI/v89gq/la6051sO7iVJiyemzT0SlIcVMLtp3V
	LBVntQcEnLcQP4mEFAOmRCGnVFjObZYQoy8t1OzlP6lakHcsrKvjUzVXe8XXr5xuJfGQOC
	1qK1oo84uH3RvHqkEN4CnRtgprm3+1bwVoDYK5JM2mCOVa3NMbngliORKzy3gImZ0p3Mdn
	KA4/eGPfFEVefv27hiUMV5YSZZf9/EbNiLhBwaHSRIcgEWjR+hD3IjTxfTw0+w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788421287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HcMZPcEqwvVMhaVCt8MkUvZh7YAwKSLLYydvmnNx69g=;
	b=rh+ETLVcunE+DHaXRlcjbRGQypXlRas7Gz8RSxyOEQznbIdmSjOOp7xhZp8qA1klyLJlHr
	4QVBYU6drJOyTJAg==
Date: Thu, 03 Sep 2026 09:41:16 +0200
Subject: [PATCH v2 01/15] MAINTAINERS: exec: Add more auxvec.h variants
MIME-Version: 1.0
Message-Id: <20260903-at-vector-size-arch-v2-1-5bc32a71e3d8@linutronix.de>
References: <20260903-at-vector-size-arch-v2-0-5bc32a71e3d8@linutronix.de>
In-Reply-To: <20260903-at-vector-size-arch-v2-0-5bc32a71e3d8@linutronix.de>
To: Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-sh@vger.kernel.org, linux-alpha@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788421286; l=977;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=Nm/6hJEAPks30y7LVA2Wwufq3vVlMHx1IoW0kUFRRys=;
 b=qmIl+ksPTFbWALcvC6gLtF0MRDI5uk7fAOGtmCm6fQ86AWfo/5KOuP/P3VXL2cXkfCyJKwCbQ
 KGGjiCPlRFCAaRujs1d1gu5uZskagQtGmtcqSJJWjBWfEVKN728cCnc
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_004132_800744_636898FA 
X-CRM114-Status: UNSURE (   6.58  )
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
PgpSZXZpZXdlZC1ieTogS2VlcyBDb29rIDxrZWVzQGtlcm5lbC5vcmc+Ci0tLQogTUFJTlRBSU5F
UlMgfCAzICsrKwogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMKaW5kZXggM2ExOWRhNzRkMDBjLi40MjcxNWFlYTIx
MGIgMTAwNjQ0Ci0tLSBhL01BSU5UQUlORVJTCisrKyBiL01BSU5UQUlORVJTCkBAIC05ODA4LDEz
ICs5ODA4LDE2IEBAIEw6CWxpbnV4LW1tQGt2YWNrLm9yZwogUzoJU3VwcG9ydGVkCiBUOglnaXQg
Z2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2tlZXMvbGludXgu
Z2l0IGZvci1uZXh0L2V4ZWN2ZQogRjoJRG9jdW1lbnRhdGlvbi91c2Vyc3BhY2UtYXBpL0VMRi5y
c3QKK0Y6CWFyY2gvKi9pbmNsdWRlL3VhcGkvYXNtL2F1eHZlYy5oCiBGOglmcy8qYmluZm10Xyou
YwogRjoJZnMvS2NvbmZpZy5iaW5mbXQKIEY6CWZzL2V4ZWMuYwogRjoJZnMvdGVzdHMvYmluZm10
Xypfa3VuaXQuYwogRjoJZnMvdGVzdHMvZXhlY19rdW5pdC5jCitGOglpbmNsdWRlL2xpbnV4L2F1
eHZlYy5oCiBGOglpbmNsdWRlL2xpbnV4L2JpbmZtdHMuaAogRjoJaW5jbHVkZS9saW51eC9lbGYu
aAorRjoJaW5jbHVkZS91YXBpL2FzbS1nZW5lcmljL2F1eHZlYy5oCiBGOglpbmNsdWRlL3VhcGkv
bGludXgvYXV4dmVjLmgKIEY6CWluY2x1ZGUvdWFwaS9saW51eC9iaW5mbXRzLmgKIEY6CWluY2x1
ZGUvdWFwaS9saW51eC9lbGYuaAoKLS0gCjIuNTUuMAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
