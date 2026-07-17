Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D81C4450F
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jul 2026 06:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=csJ6tX1AYyWckgHt3ooU+X79ODfx+9/RqLKD1wA8kJg=; b=cia+7uOJCY3f3J
	xOfWxGIninL530VtLn+Pskw+yiQmreF/JcKl3qgDisjUGuRHGs2A+PR1O45xTcgFQoyWkMFOcp3mc
	JMoIUwuH92BVSZv32VFiLM7rWi/SZZ/FafGI6p/M68OlHZ6rKW/K/IqUDASxJO9/Mw5ynvLjqIUlH
	bfWxJYnWLEOhrvbTiPKzGBs9Fk0D2PnD40YhuMxhwQLk9T9N6pRtGTJqR7CU2hNWoCmXjRtB6+t36
	WYNwDlTxwbVet1SZOvBByjqga7qcmuAkiSBQirRWucJAqdyh+IDNgAn2gnLKlMFcm6s6oDuEOQnLD
	YvB/tT0lPC0l9nZ9Omzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkbrT-00000001ENT-1lcj;
	Fri, 17 Jul 2026 06:15:51 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkbr0-00000001Dx9-2Nt3;
	Fri, 17 Jul 2026 06:15:24 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784268903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cIw1nW13D3Q7KVGq3dxw/myoCljjqPSm8YvxUaQYWA0=;
	b=VNVPYOsbX7c1CIM8F7eHlMuXMtSmy45txWJpFs2iCH7yQCSNeiVTBBxJzTSjtvXQpK0oZT
	T997yxk4Kvu4sGaAjJ8mFfOQFaoe4MTKbfoblYxFpjtu8DBhE9mp5dDdjiKgXDBgnwpKOG
	yaSqIl5Qu7s9pXI19F1iv9O83rPG11nKgjtL/xSm+aXdXBzLbwKqviRgJArMflNwQF5cYE
	CHJ+IduAZn5/lCKKZ+U4ULJNDQH/Hmgz8ZEhKrz3WG+6lx2TgHawzdzvn+oOfK/uycAkeO
	1FN2BnXWt8HguVWd7fQ65Rj/MiELe+m6gXxvU0PbF1XZ0WBwxgy1+ZVRFu1I5A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784268903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cIw1nW13D3Q7KVGq3dxw/myoCljjqPSm8YvxUaQYWA0=;
	b=8I1DwzTVpqUUamtI9UCb2EvwLrfrAAHexhzpGSaqZ+r2SqkHmQdH0+k5ovmHZIJ4CS9lRd
	wLwAc6+3LDduDkBQ==
Date: Fri, 17 Jul 2026 08:14:51 +0200
Subject: [PATCH v2 7/7] LoongArch: Remove CONFIG_GENERIC_GETTIMEOFDAY
 ifdeffery
MIME-Version: 1.0
Message-Id: <20260717-vdso-arch-clockmodes-v2-7-756f5a5d1467@linutronix.de>
References: <20260717-vdso-arch-clockmodes-v2-0-756f5a5d1467@linutronix.de>
In-Reply-To: <20260717-vdso-arch-clockmodes-v2-0-756f5a5d1467@linutronix.de>
To: Arnd Bergmann <arnd@arndb.de>, Andy Lutomirski <luto@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 loongarch@lists.linux.dev, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784268894; l=780;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=/YNIeu5dDcZIdRrt5u3jACXGrJAGqwCKT4gDnUxNTGQ=;
 b=214rtg/06/j2dYk14bVrr0sJ50TBCWX3iVo+aQXbK8yH33e5JHAj4jo6f6SALe1iyxSeGi8nJ
 TGV415gYICwBJYPC4sSsDENn7Hc4S5CQJ40r3cOD43Mp0pwgiakUKLQ
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_231522_769188_181ABE87 
X-CRM114-Status: UNSURE (   7.41  )
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

Tm93IHRoYXQgdGhlcmUgaXMgYSBkZWZpbml0aW9uIG9mIFZEU09fQ0xPQ0tNT0RFX0NQVSBldmVu
IGlmIG5vCnZEU08gaXMgYnVpbHQsIHRoZSB1Z2x5IGlmZGVmZmVyeSBjYW4gYmUgcmVtb3ZlZC4K
ClNpZ25lZC1vZmYtYnk6IFRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51
dHJvbml4LmRlPgotLS0KIGFyY2gvbG9vbmdhcmNoL2tlcm5lbC90aW1lLmMgfCAyIC0tCiAxIGZp
bGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL2xvb25nYXJjaC9r
ZXJuZWwvdGltZS5jIGIvYXJjaC9sb29uZ2FyY2gva2VybmVsL3RpbWUuYwppbmRleCBkYmFhYWJj
YWY2ZjAuLjU4OTJmNmRhMDdhNSAxMDA2NDQKLS0tIGEvYXJjaC9sb29uZ2FyY2gva2VybmVsL3Rp
bWUuYworKysgYi9hcmNoL2xvb25nYXJjaC9rZXJuZWwvdGltZS5jCkBAIC0yMTIsOSArMjEyLDcg
QEAgc3RhdGljIHN0cnVjdCBjbG9ja3NvdXJjZSBjbG9ja3NvdXJjZV9jb25zdCA9IHsKIAkucmVh
ZCA9IHJlYWRfY29uc3RfY291bnRlciwKIAkubWFzayA9IENMT0NLU09VUkNFX01BU0soNjQpLAog
CS5mbGFncyA9IENMT0NLX1NPVVJDRV9JU19DT05USU5VT1VTLAotI2lmZGVmIENPTkZJR19HRU5F
UklDX0dFVFRJTUVPRkRBWQogCS52ZHNvX2Nsb2NrX21vZGUgPSBWRFNPX0NMT0NLTU9ERV9DUFUs
Ci0jZW5kaWYKIH07CiAKIGludCBfX2luaXQgY29uc3RhbnRfY2xvY2tzb3VyY2VfaW5pdCh2b2lk
KQoKLS0gCjIuNTUuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
