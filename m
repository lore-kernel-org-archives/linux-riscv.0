Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD278C52D11
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jan 2023 17:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dLp+R4abqhpls92Q+DFQCNBBZogoUs/UcmOZiBBnb48=; b=sh6ymRCYYIFFjG
	sluh52GR2h0tA1Eg+93a4dYdFiCMXZc9rFMHLZxZmOZype20yvCImQDFev6YRYVNVjF87vLxMt9OL
	Fc0edvnsN9vNGZUPqKFEjZ9D53m3METaXDOK2Qhk1bDyY1Icjyk7eVG9UG3B0TDcNWcOLxOySW21F
	EPTK/X4uDwoG+QLmcPxNEBvMNB0quyHngrNsIofPB5d3ujtQ8F+R2/X85EqKXjy2A4/JytCw/AX1+
	lX7GsMYuAvZhyMjvdfEv7dQKUixstEXvjnN9Bb1psLroxY/i9pJT3/cIyUepPCTbN7lNwXXKGPPlT
	uI7A4mWfuVVdfYta+vQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL60X-00C0SN-MS; Thu, 26 Jan 2023 17:25:53 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL60V-00C0QI-7g
	for linux-riscv@lists.infradead.org; Thu, 26 Jan 2023 17:25:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 9E806B81EC2;
	Thu, 26 Jan 2023 17:25:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EA97C4339B;
	Thu, 26 Jan 2023 17:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674753948;
	bh=DNY322/iimzurqg2rAQmkk32JHcSLTVqr6N5got/hZY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LBYm0SICw9FAXa+VBtN3eixi1dGhdbI9x+fSiqCd41ynJjBaO3mtszt31bCrGvE0j
	 VgIRDwCo1aHd6VyRdut69X9Qi1MV0p4o3mqbQvLiH398DJgba332QZHoP8bo9AzUrV
	 CrhF9XH45VE2sJ8FL526PzWm/FEpRKeJdhgL2Nv+OqXrRKhGBfZQEWQH5y7EMbOq2I
	 VVXQjRHScFSB9c2ygtB6L37YiaKfmJXr1SyjJHcEaNpavTLjSyGEW778M7Vj4rT3tV
	 wsNGRe7DPaq4n6cI7AW8XAaNTwCKbjWcEUtzwkLdlKSx7yFwzQdTAEMPTCnqPHjS5x
	 4HlMc5xuapmrQ==
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
Subject: [PATCH -next V15 2/7] riscv: ptrace: Remove duplicate operation
Date: Thu, 26 Jan 2023 12:25:11 -0500
Message-Id: <20230126172516.1580058-3-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20230126172516.1580058-1-guoren@kernel.org>
References: <20230126172516.1580058-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_092551_491568_8B19315F 
X-CRM114-Status: UNSURE (   9.59  )
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
