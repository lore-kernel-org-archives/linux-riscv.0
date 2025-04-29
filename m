Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26712C3ABAA
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Apr 2025 08:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GBRUtuMsShpNAIoCFwq3vwvDAIwpAOYAov1htRbkAsI=; b=m9c90b6TZVVgYl
	NpfZP9W1n+dqkVgkqxCE9kBCGo2NANnZir41zc220f4wx6+LnWsm3Pzidx0jboHWTRYzNQXoMjWde
	cqAld80e12J6ji3fPpDAw9a9/tKLX+Quyvby2jU0UGLXQry946A9la7x1mQZDaEGvQulZrzGAi8LM
	gKviAwz0W4pepHXAqqJN2UIWmU8DtNPvIFJvXK5EqNGpm8xGhHIARPKUSXatNpKez44VTU/WEEKN9
	rfX0oMeUmkXgxDx/MMOCOTE4RsGYO8c4Pq8xFKUeM779XGyXrSjx9LdGnQm1LbJFhZ1SRtXWWFQf6
	Bax3QS+pcPLbEO0h3dAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9gkZ-000000091MF-3u1H;
	Tue, 29 Apr 2025 08:55:35 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9gfn-0000000907L-0Z3V;
	Tue, 29 Apr 2025 08:50:41 +0000
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4ZmtbH6JVvz9sFT;
	Tue, 29 Apr 2025 10:22:19 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e30qWr8CZO0g; Tue, 29 Apr 2025 10:22:19 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4ZmtbG0699z9sCk;
	Tue, 29 Apr 2025 10:22:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id F1CD98B766;
	Tue, 29 Apr 2025 10:22:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 2CpqnVV7VgEF; Tue, 29 Apr 2025 10:22:17 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 3E7F68B763;
	Tue, 29 Apr 2025 10:22:17 +0200 (CEST)
Message-ID: <df566157-5320-47cf-ae14-a2e578f68a35@csgroup.eu>
Date: Tue, 29 Apr 2025 10:22:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/13] crypto: powerpc - drop redundant dependencies on
 PPC
To: Eric Biggers <ebiggers@kernel.org>, linux-crypto@vger.kernel.org
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, x86@kernel.org,
 "Jason A . Donenfeld" <Jason@zx2c4.com>, Ard Biesheuvel <ardb@kernel.org>
References: <20250422152716.5923-1-ebiggers@kernel.org>
 <20250422152716.5923-3-ebiggers@kernel.org>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250422152716.5923-3-ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_015039_365452_25AC1E95 
X-CRM114-Status: UNSURE (   4.85  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgpMZSAyMi8wNC8yMDI1IMOgIDE3OjI3LCBFcmljIEJpZ2dlcnMgYSDDqWNyaXTCoDoKPiBGcm9t
OiBFcmljIEJpZ2dlcnMgPGViaWdnZXJzQGdvb2dsZS5jb20+Cj4gCj4gYXJjaC9wb3dlcnBjL2Ny
eXB0by9LY29uZmlnIGlzIHNvdXJjZWQgb25seSB3aGVuIENPTkZJR19QUEM9eSwgc28gdGhlcmUK
PiBpcyBubyBuZWVkIGZvciB0aGUgc3ltYm9scyBkZWZpbmVkIGluc2lkZSBpdCB0byBkZXBlbmQg
b24gUFBDLgo+IAo+IEFja2VkLWJ5OiBBcmQgQmllc2hldXZlbCA8YXJkYkBrZXJuZWwub3JnPgo+
IFNpZ25lZC1vZmYtYnk6IEVyaWMgQmlnZ2VycyA8ZWJpZ2dlcnNAZ29vZ2xlLmNvbT4KCgpSZXZp
ZXdlZC1ieTogQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1PgoK
Tm90ZSB0aGF0IHRoZXJlIGFyZSBvdGhlciByZWR1bmRhbmNpZXMgaW4gdGhlIGZpbGUsIGZvciBp
bnN0YW5jZSAKQ09ORklHX1ZTWCBhbHJlYWR5IGRlcGVuZHMgb24gQ09ORklHX1BQQzY0CgpDaHJp
c3RvcGhlCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
