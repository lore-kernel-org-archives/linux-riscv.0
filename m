Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81878D1BDE7
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Nov 2024 19:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Nc6luj5grDNcoiPTrxPeNLh+BsxqNvYD2KEVwu0LB/Y=; b=CshEGtTQpNAlJj
	PCuBq5BoSwk0gsvTJU2Oy90jceVSmg7l1FVv2X92un8YB4AVwmAXM0bUdA/t3iX+UIUR9XpkB7X0g
	J8zAt/ZgqeipRMe5+q9532/SRybjpG5LNtLfDdP2Fiy/ZeNh6MX9W3kks4GGa/p75PFsjMJMYTAdM
	9dWNHWnSpktokRMxr6LWz9yBGuns0FFiTJbKhaanYDkv0Ox07xYPbJY/h8AUnHIMXqn/8oUCLgGsZ
	e8ZZ2pTkRxVA6BGRlgHvjmQlkK4PtFCPhL0Wr2inJbeWu0G5Ge/wGEnH4/Kkel4czTIkw1eX2rws8
	xQEBu0KzELZNbQ6hoOWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t82lO-0000000EtlR-46Vn;
	Mon, 04 Nov 2024 19:29:22 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t82dl-0000000Esn7-47Ej;
	Mon, 04 Nov 2024 19:21:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id ED906A43357;
	Mon,  4 Nov 2024 19:19:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF103C4CECE;
	Mon,  4 Nov 2024 19:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730748088;
	bh=srsnEmNy8EqgMWWSao2qd7ZIE1/ia9oFgHAob0jN4H0=;
	h=From:To:Cc:Subject:Date:From;
	b=pvbYbRDYTVEtjkRIfobR7lI+Lm0UsV7fRe5dpaxwKiy7kgbsn0ZAwDe/XWxTT/4/N
	 8qr405SaAlQwnh5gYtSTw8kbgAWU3EZeNTvV2LQDvZkcppMCyaFOsg+bib37lH+ahU
	 wvhKtmGeSSgzrSG+G26Z0ADcuKkZCGpHtdj8DGmJHas5Ly01H3VIglgN1QfKGZElnF
	 BEXlwydzHJYTgA2ucPLTwyIC05Drz/ZV7vYvDAtfCFoSDjj6ETBX+if2yc4CF1Hukg
	 GDW5czFAZu90rmOewRpVmGTXcmn6HTRufTV2DBQfpwIAmVNtxuv9o4KH+8ssVoHCsr
	 B12eapXcbatLw==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Will Deacon <will@kernel.org>,
	Julien Thierry <julien.thierry.kdev@gmail.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH kvmtool] riscv: Pass correct size to snprintf()
Date: Mon,  4 Nov 2024 20:21:19 +0100
Message-ID: <20241104192120.75841-1-bjorn@kernel.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_112130_108221_B8AC23C1 
X-CRM114-Status: GOOD (  10.70  )
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

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKVGhlIHNucHJpbnRmKCkg
ZnVuY3Rpb24gZG9lcyBub3QgZ2V0IHRoZSBjb3JyZWN0IHNpemUgYXJndW1lbnQgcGFzc2VkLAp3
aGVuIHRoZSBGRFQgSVNBIHN0cmluZyBpcyBidWlsdC4gSW5zdGVhZCBvZiBhZGp1c3RpbmcgdGhl
IHNpemUgZm9yCmVhY2ggZXh0ZW5zaW9uLCB0aGUgZnVsbCBzaXplIGlzIHBhc3NlZCBmb3IgZXZl
cnkgaXRlcmF0aW9uLiBEb2luZyBzbwp3aWxsIG1ha2UgX19zbnByaW5mX2NoaygpIGJhaWwgb3V0
IG9uIGdsaWJjLgoKQWRqdXN0IHNpemUgZm9yIGVhY2ggaXRlcmF0aW9uLgoKRml4ZXM6IDhhZmYy
OWUxZGFmZSAoInJpc2N2OiBBcHBlbmQgSVNBIGV4dGVuc2lvbnMgdG8gdGhlIGRldmljZSB0cmVl
IikKU2lnbmVkLW9mZi1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgotLS0K
IHJpc2N2L2ZkdC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvcmlzY3YvZmR0LmMgYi9yaXNjdi9mZHQuYwppbmRleCA4
MTg5NjAxZjQ2ZGUuLjg1YzhmOTU2MDRmNiAxMDA2NDQKLS0tIGEvcmlzY3YvZmR0LmMKKysrIGIv
cmlzY3YvZmR0LmMKQEAgLTE1Nyw3ICsxNTcsNyBAQCBzdGF0aWMgdm9pZCBnZW5lcmF0ZV9jcHVf
bm9kZXModm9pZCAqZmR0LCBzdHJ1Y3Qga3ZtICprdm0pCiAJCQkJCSAgIGlzYV9pbmZvX2Fycltp
XS5uYW1lKTsKIAkJCQlicmVhazsKIAkJCX0KLQkJCXBvcyArPSBzbnByaW50ZihjcHVfaXNhICsg
cG9zLCBDUFVfSVNBX01BWF9MRU4sICJfJXMiLAorCQkJcG9zICs9IHNucHJpbnRmKGNwdV9pc2Eg
KyBwb3MsIENQVV9JU0FfTUFYX0xFTiAtIHBvcywgIl8lcyIsCiAJCQkJCWlzYV9pbmZvX2Fycltp
XS5uYW1lKTsKIAkJfQogCQljcHVfaXNhW3Bvc10gPSAnXDAnOwoKYmFzZS1jb21taXQ6IDMwNDBi
Mjk4MTU2ZTRlMmE4MmIyN2FjOGRiNWJkNjNhNzJiMzc4NWIKLS0gCjIuNDMuMAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
