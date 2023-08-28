Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5525AC83F12
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Aug 2023 06:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zSD3cOcCv2o4ZbjRQc3pXH94NAGcWZrNhY5gGk721Gg=; b=rBAbpbmNox8qKs
	e+KRna5Wom+tEk47SwSzv0c0vAMWG0PDRV+5L4C+raZVwIIPLQKaB6PCorUozkP+9RrWX1rbf50Vs
	V7a4m+RkVzS1/KDOVVkAyIfWMqbhOlv6BaO70VXPP6tFPvokA9BLqE5JckyoGxwp6PcLL/RVm79zq
	hBR0fsfuVMbMVAE1C5yxCnOvBzkz9mMkWNN35P8/R6hjUlKgxorF71dE0fqavuPgSVIKsYnvfaWlT
	1idrBPCfS4xnrx8jiNkIjda2tij2y6iYMM9kjpsbkPimg2/9qI2vyJiEJEAIjvxxt9AU/A1nfDSu4
	uvk1e+8Ue3RCQX/lf9kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaVYz-008wPg-05;
	Mon, 28 Aug 2023 06:17:25 +0000
Received: from gandalf.ozlabs.org ([150.107.74.76])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaVYv-008wO7-0c;
	Mon, 28 Aug 2023 06:17:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1693203432;
	bh=RLh/iKkhkkusFbJvY334+vB2M1uIDZ/5pE7VOu44/vs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=JTyQZFDqNMeMVmO4EfPbcnBAZ1DuSvbuwFjAnB8hSINbPAT7GN+TCyGskVksx4HqU
	 qlglGjm7W6QpmD7R7ZY055gnq3+8SzUN1VvjbGgrCt8xLS9ywu8I2IEGj4hyM/rFrs
	 EKBPeTE+KGWADe4s4DSkURpDjiH+ruEWVi6fPTUSRb86CcALzqCZc2iaDeQZOJC0xR
	 ai+fS4iHyIw2BWPMTGlKuLeyZyb6kxF0Csk351GZU+Rfl0awmhXkm90BAZ4gsOMSiU
	 7QdNfRvx++uGuFtP9TmDplcr+JF1HigKcAAfv4Kangxy0rMI5AHg4zzZ1CgZ5knBpH
	 m//LD/elqaqXQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RZ0hQ2vSYz4wxQ;
	Mon, 28 Aug 2023 16:17:10 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Masahiro Yamada <masahiroy@kernel.org>, Kees Cook <keescook@chromium.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, Nicolas Schier
 <nicolas@fjasle.eu>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 0/2] kbuild: Show Kconfig fragments in "help"
In-Reply-To: <CAK7LNATcTw+btQVri7SBA8gFbDNMYz7D2gMQaoZp9sQGFjCw8Q@mail.gmail.com>
References: <20230825194329.gonna.911-kees@kernel.org>
 <CAK7LNATcTw+btQVri7SBA8gFbDNMYz7D2gMQaoZp9sQGFjCw8Q@mail.gmail.com>
Date: Mon, 28 Aug 2023 16:17:07 +1000
Message-ID: <87ttsjlmho.fsf@mail.lhotse>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230827_231721_477006_18824F66 
X-CRM114-Status: GOOD (  11.97  )
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

TWFzYWhpcm8gWWFtYWRhIDxtYXNhaGlyb3lAa2VybmVsLm9yZz4gd3JpdGVzOgo+IE9uIFNhdCwg
QXVnIDI2LCAyMDIzIGF0IDQ6NTXigK9BTSBLZWVzIENvb2sgPGtlZXNjb29rQGNocm9taXVtLm9y
Zz4gd3JvdGU6Cj4+Cj4+IEhpLAo+Pgo+PiBUaGlzIGlzIG15IHNlcmllcyB0byBzaG93ICouY29u
ZmlnIHRhcmdldHMgaW4gdGhlICJoZWxwIiB0YXJnZXQgc28gdGhlc2UKPj4gdmFyaW91cyB0b3Bp
Y3MgY2FuIGJlIG1vcmUgZWFzaWx5IGRpc2NvdmVyZC4KPj4KPj4gdjI6Cj4+ICAtIHNwbGl0IC5m
cmFnbWVudCBmcm9tIC5jb25maWcgdG8gaGlkZSAiaW50ZXJuYWwiIGZyYWdtZW50cwo+Cj4gUGxl
YXNlIGRvIG5vdCBkbyB0aGlzIGNodXJuLgoKVGhhdCB3YXMgbXkgaWRlYSA6fQoKPiBMaWtlIFJh
bmR5LCBJIGRpZCBub3QgZ2V0ICJ3aHkiIHBhcnQgcXVpZXQgd2VsbCwKPiBidXQgaWYgeW91IGFy
ZSBlYWdlciBhYm91dCB0aGlzLAo+IHlvdSBjYW4gc2hvdyBoZWxwIG1lc3NhZ2Ugb25seSB3aGVu
IHRoZSBmb2xsb3dpbmcKPiAoIiMgSGVscDoiIHByZWZpeCBmb3IgZXhhbXBsZSkgaXMgZm91bmQg
aW4gdGhlIGZpcnN0IGxpbmUuCj4KPiAjIEhlbHA6IGJsYWggYmxhaAo+ICMgb3RoZXIgY29tbWVu
dAoKSSBkaWQgdGhpbmsgb2YgdGhhdCwgYnV0IHdhc24ndCBzdXJlIGhvdyB0byBkbyBpdCBpbiBt
YWtlLgoKY2hlZXJzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
