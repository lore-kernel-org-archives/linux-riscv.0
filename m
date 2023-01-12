Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F5EC54EBD
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jan 2023 09:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dLp+R4abqhpls92Q+DFQCNBBZogoUs/UcmOZiBBnb48=; b=QcNmxRhqCiRAg5
	XLqpL8anG4Raii3g59k+1PIs9p5HggxybVDcOtwKYD1ZcIeegooK67QNcgaOVdOMsJ9yEDpDKUNjQ
	MxAi/4Bf8rbvKgvGxCXZVeD6PCVkv38XDtfuVpjaz2Arwe4cHDvRTGOpuTnQhEklF00ttEcCX283S
	9dV0/LmI4AYCgrKfNSFaE7tUqnVdVjASq8QaL94QoYkclscsVxKvG6Ul2A2eUE1R3UVyn1vzT1hBx
	2CTVe8gAfSOEdDv20EZvxsbHFRcftVLJ25dnGcIVo4Vv4HMrWmf2kldGEBsO/tgREQgyvDiy/bblW
	KUgWci4ltpnjPRoUrO/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFuMm-00EU9n-C1; Thu, 12 Jan 2023 09:59:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFuMi-00EU8M-Ti
	for linux-riscv@lists.infradead.org; Thu, 12 Jan 2023 09:59:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7A3CA61FC9;
	Thu, 12 Jan 2023 09:59:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 145BAC433A4;
	Thu, 12 Jan 2023 09:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673517559;
	bh=DNY322/iimzurqg2rAQmkk32JHcSLTVqr6N5got/hZY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U5o7pGHNdf2+x2kSllWmxrFy1xZ+aOIXlUpN0b2iFyFVARpJJSgHRzKKFlMPEk3ts
	 8k4Naa26+U5ikUFoI8E6iNfXGUFinpWkAmS4ehzSexHlOMGGoRPl6WiCAILwo+umCg
	 DcmaPppKaxvQXyeO5+Er62WlslUNVIVPHAlgkCV52CnsG+1+8txesE3cb7ntOpESmD
	 njF6ytkh+mjN5Rwj7c9EZo8QRFe28j+/3uPdah14fQE9qM7Y58FtVMoyanMw+cPACj
	 mAdF5Ti0+j9njywliIxVJ3R+WS47FNQpdQr0u1kqoIVnDXMzm/WE4XOk5/CavJ9X5b
	 bqBVUlnpacjuA==
From: guoren@kernel.org
To: arnd@arndb.de,
	guoren@kernel.org,
	palmer@rivosinc.com,
	tglx@linutronix.de,
	peterz@infradead.org,
	luto@kernel.org,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	jszhang@kernel.org,
	lazyparser@gmail.com,
	falcon@tinylab.org,
	chenhuacai@kernel.org,
	apatel@ventanamicro.com,
	atishp@atishpatra.org,
	mark.rutland@arm.com,
	ben@decadent.org.uk,
	bjorn@kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Oleg Nesterov <oleg@redhat.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>
Subject: [PATCH -next V14 2/7] riscv: ptrace: Remove duplicate operation
Date: Thu, 12 Jan 2023 04:58:43 -0500
Message-Id: <20230112095848.1464404-3-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20230112095848.1464404-1-guoren@kernel.org>
References: <20230112095848.1464404-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_015921_037428_298638D2 
X-CRM114-Status: UNSURE (   9.36  )
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

RnJvbTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgoKVGhlIFRJRl9TWVNDQUxM
X1RSQUNFIGlzIGNvbnRyb2xsZWQgYnkgYSBjb21tb24gY29kZSwgc2VlCmtlcm5lbC9wdHJhY2Uu
YyBhbmQgaW5jbHVkZS9saW51eC90aHJlYWRfaW5mby5oLgoKY2xlYXJfdGFza19zeXNjYWxsX3dv
cmsoY2hpbGQsIFNZU0NBTExfVFJBQ0UpOwoKU2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVu
QGxpbnV4LmFsaWJhYmEuY29tPgpTaWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVs
Lm9yZz4KUmV2aWV3ZWQtYnk6IE9sZWcgTmVzdGVyb3YgPG9sZWdAcmVkaGF0LmNvbT4KUmV2aWV3
ZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KLS0tCiBhcmNoL3Jpc2N2
L2tlcm5lbC9wdHJhY2UuYyB8IDEgLQogMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKCmRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9wdHJhY2UuYyBiL2FyY2gvcmlzY3Yva2VybmVs
L3B0cmFjZS5jCmluZGV4IDJhZTgyODBhZTQ3NS4uNDRmNGIxY2EzMTVkIDEwMDY0NAotLS0gYS9h
cmNoL3Jpc2N2L2tlcm5lbC9wdHJhY2UuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9wdHJhY2Uu
YwpAQCAtMjEyLDcgKzIxMiw2IEBAIHVuc2lnbmVkIGxvbmcgcmVnc19nZXRfa2VybmVsX3N0YWNr
X250aChzdHJ1Y3QgcHRfcmVncyAqcmVncywgdW5zaWduZWQgaW50IG4pCiAKIHZvaWQgcHRyYWNl
X2Rpc2FibGUoc3RydWN0IHRhc2tfc3RydWN0ICpjaGlsZCkKIHsKLQljbGVhcl90c2tfdGhyZWFk
X2ZsYWcoY2hpbGQsIFRJRl9TWVNDQUxMX1RSQUNFKTsKIH0KIAogbG9uZyBhcmNoX3B0cmFjZShz
dHJ1Y3QgdGFza19zdHJ1Y3QgKmNoaWxkLCBsb25nIHJlcXVlc3QsCi0tIAoyLjM2LjEKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
