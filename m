Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF72C4345F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 May 2024 13:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YHlLgJRRtrNYRlLFAaJ0cjfL8+nuGShh9GtvFzAt19g=; b=N8vl/tfhe9Lsrg
	o+ev+1WoehVfGY0SkB5FMHDcZNFpsR8s+ex7VhijEvDd8tOjMvGJ9lBxmdqgUetMDzNYwcAwUVOSt
	eXwTLUC43oDn83klRNfvHPuSTPdfQ26vewQ5oFF88VWGNs9bPA12PC0zpv6I7syg+UFiN9X3H/Duw
	iBqYIpTe7VtMWoVOM6sYFWTd8yQWSHX1tQT+EeAseiT10hpdsgcBs4RFd1wLPej3veBb3niiTyItB
	xY6ZojCpnrAyOL2KB+LXimuRVOtUxB4OQhrCrqHIR3C+Tlzv7kol1KeEXnFBZn2g3jZzJYlc26guG
	dFUkw8EGyXdCaDIl/1vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2W6K-0000000Cjf6-3Ojz;
	Thu, 02 May 2024 13:03:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2W6H-0000000CjeN-3wGw
	for linux-riscv@lists.infradead.org;
	Thu, 02 May 2024 13:03:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 96BFB61A85;
	Thu,  2 May 2024 13:03:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5CE1C113CC;
	Thu,  2 May 2024 13:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714655025;
	bh=TIF4FMSqrUlFRETJ/qfFlessQJ7mkpFvx/oyhHmPOA0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Dx4FGICFI8dwY9memwTfLSH/wX6LmZItbuUmtNwTmVLf+poeqBMDLbsAsffR9kgBr
	 K62S5c8wgV4RJUReC92Df3i5gpKksOgMVQRHMbRhBQOXTUybYovn3m4Deo+CfSf0He
	 9/6yr2mnOnwsvXq1i+5Otvf6DdYpf6wRoOUI6nVQ6RlVOJ2ob+TQ9eU69eqGNaAQtL
	 54WKmR2t72OJy3onr2/mwmVEjkQU6xnBhGRf3iPthuvubW4WUs++v0YQgBdIbA4FZg
	 JAJXOPbM6bl3fbAn0RnlOFee1fat3DV5tzPpVyfC+h7XJI+S+cuv0ofEgJdUdpTyoH
	 6XXFPMj/u74pg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Masahiro Yamada <masahiroy@kernel.org>, Nathan
 Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Nick
 Terrell <terrelln@fb.com>
Subject: Re: [PATCH v1 0/3] riscv: make image compression configurable
In-Reply-To: <20240502111613.1380453-1-emil.renner.berthing@canonical.com>
References: <20240502111613.1380453-1-emil.renner.berthing@canonical.com>
Date: Thu, 02 May 2024 15:03:42 +0200
Message-ID: <87y18scqmp.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240502_060350_043049_71A4FDA9 
X-CRM114-Status: UNSURE (   8.92  )
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

RW1pbCBSZW5uZXIgQmVydGhpbmcgPGVtaWwucmVubmVyLmJlcnRoaW5nQGNhbm9uaWNhbC5jb20+
IHdyaXRlczoKCj4gTWFzYWhpcm8ncyBwYXRjaFsxXSBtYWRlIG1lIHdvbmRlciB3aHkgd2UncmUg
bm90IGp1c3QgdXNpbmcgS0JVSUxEX0lNQUdFCj4gdG8gZGV0ZXJtaW5lIHdoaWNoIChwb3NzaWJs
eSBjb21wcmVzc2VkKSBrZXJuZWwgaW1hZ2UgdG8gdXNlIGluICdtYWtlCj4gdGFyLXBrZycgbGlr
ZSBvdGhlciBhcmNoaXRlY3R1cmVzIGRvLiBJdCB0dXJucyBvdXQgd2UncmUgYWx3YXlzIHNldHRp
bmcKPiBLQlVJTERfSU1BR0UgdG8gdGhlIHVuY29tcHJlc3NlZCBJbWFnZSBmaWxlIGFuZCB0aGVu
IGNvbXByZXNzaW5nIGl0IGludG8KPiB0aGUgSW1hZ2UuZ3ogZmlsZSBhZnRlcndhcmRzLgo+Cj4g
VGhpcyBzZXJpZXMgZml4ZXMgdGhhdCBzbyB0aGUgY29tcHJlc3Npb24gbWV0aG9kIGlzIGNvbmZp
Z3VyYWJsZSBhbmQKPiBLQlVJTERfSU1BR0UgaXMgc2V0IHRvIHRoZSBjaG9zZW4gKHBvc3NpYmx5
IHVuY29tcHJlc3NlZCkga2VybmVsIGltYWdlCj4gd2hpY2ggaXMgdGhlbiB1c2VkIGJ5IHRhcmdl
dHMgbGlrZSAnbWFrZSBpbnN0YWxsJyBhbmQgJ21ha2UgYmluZGViLXBrZycgYW5kCj4gJ21ha2Ug
dGFyLXBrZycuCj4KPiBQYXRjaCAzLzMgZGVwZW5kcyBvbiB0aGUgcHJldmlvdXNseSBtZW50aW9u
ZWQgcGF0Y2ggYmVsb3cuCgpOaWNlIQoKVGVzdGVkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkBy
aXZvc2luYy5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
