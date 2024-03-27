Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8C46C47DD9
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 19:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WiRRrmaPlb4UCRJIQ5krd4JJyHoAO9yZuuvjapZW3Qo=; b=nhryJaO0QhrBAc
	BR13AASBAWU97yg0IEQmRunifbRWCN3bUZ2QBCCKSGPQTOdCCfvVtYCDqe5NuoNp1Sn1Pcu4WMEPz
	jkc1I1IZ5dvIVandUD2S0sDOD9g4uFy+hbTfOLPszVixhzEU1oo+C1MphYTpItRFiKwxAPT8qP6GL
	NTn6XHM8Nn3Mqe0sH0NnINNhN26Mz7KCVATOoYuOwQ4iR1HJT1ACd0m5CZusSF7eJHSS6nN50FNfz
	S5LMK5OiAtHRGvr+fyKRmaul+OB+8z+lisLWpKCxj5idpEcWAcOHrsSEDGy82+QdQeO9al9ZJY9lE
	RQr+toOTWCxhxUP2zkVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpZPK-0000000AtIn-0uWx;
	Wed, 27 Mar 2024 19:57:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpZPH-0000000AtIC-0W4K
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 19:57:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EE14D616C0;
	Wed, 27 Mar 2024 19:57:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C010C433C7;
	Wed, 27 Mar 2024 19:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711569473;
	bh=kQaIyV/SITVWU7gU2k5KiKhY1/EpXbcic9lKJWklJ3s=;
	h=From:To:Cc:Subject:Date:From;
	b=BjKgV/Y1KnzwEAn8i26H6x6YSgwOFvGI8U6rr91seII3072iYT1rtIQTp9P+JyAad
	 jM4okUlABJx5T6sdaHk/WKEvnrIoHfh1zPEUrWnKyL5tQbrvpHTZGGrIjc2rCPwBJT
	 f4BBdikWYHkBOGoFJHktXri46LZoFpCpubQqeOzt7HL15wzHFStVzMRpa2YXguEZ2S
	 bo7pXuX73R3D4tr5LlLrNu1SetCfpn9KJNK2/8QWvXTzwMQ8l9tYWZ9M2aHHK/KhzT
	 sDxHkbt+dd0fgXVOKCQDFUkfgXo51SiMMWUGuND3RcqvmXrHTl8biGAFMI6E839O6V
	 zL3JZlpOAF6mg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Conor Dooley <conor@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Emil Renner Berthing <kernel@esmil.dk>, Samuel
 Holland <samuel.holland@sifive.com>, Alexandre Ghiti
 <alexghiti@rivosinc.com>, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>,
 linux-riscv@lists.infradead.org, Andy Chiu <andy.chiu@sifive.com>
Cc: Jakub Kicinski <kuba@kernel.org>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org
Subject: RISC-V for-next/fixes (cont'd from PW sync)
Date: Wed, 27 Mar 2024 20:57:50 +0100
Message-ID: <87ttkro3b5.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_125755_234446_C82A120A 
X-CRM114-Status: UNSURE (   9.32  )
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

SGksCgpJIGZpZ3VyZWQgSSdkIHB1dCBzb21lIHdvcmRzIG9uIHRoZSAiaG93IHRvIHVwZGF0ZSB0
aGUgUklTQy1WCmZvci1uZXh0L2ZpeGVzIGJyYW5jaGVzIFsxXSIgdGhhdCBjYW1lIHVwIG9uIHRo
ZSBwYXRjaHdvcmsgY2FsbCB0b2RheS4KCkluIFJJU0MtViBsYW5kLCB0aGUgZm9yLW5leHQgYnJh
bmNoIGlzIHVzZWQgZm9yIGZlYXR1cmVzLCBhbmQgdHlwaWNhbGx5CnNlbnQgYXMgYSBjb3VwbGUg
b2YgUFJzIHRvIExpbnVzIHdoZW4gdGhlIG1lcmdlIHdpbmRvdyBpcyBvcGVuLiBUaGUKZml4ZXMg
YnJhbmNoIGlzIHNlbnQgYXMgUFIocykgYmV0d2VlbiB0aGUgUkNzIG9mIGEgcmVsZWFzZS4KClRv
ZGF5LCB0aGUgYmFzZWxpbmUgZm9yIGZvci1uZXh0L2ZpeGVzIGlzIHRoZSBDVVJSRU5UX1JFTEVB
U0UtcmMxLCBhbmQKZmVhdHVyZXMvZml4ZXMgYXJlIGJhc2VkIG9uIHRoYXQuCgpUaGlzIGhhcyBJ
TU8gYSBjb3VwbGUgb2YgaXNzdWVzOgoKMS4gZml4ZXMgaXMgbWlzc2luZyB0aGUgbm9uLVJJU0Mt
ViBmaXhlcyBmcm9tIHJlbGVhc2VzIGxhdGVyIHRoYW4KICAgLXJjMSwgd2hpY2ggbWFrZXMgaXQg
aGFyZGVyIGZvciBjb250cmlidXRvcnMuCjIuIGZvci1uZXh0IGRvZXMgbm90IGhhdmUgdGhlIGZp
eGVzIGZyb20gUklTQy1WL3Jlc3Qgb2YgdGhlIGtlcm5lbCwKICAgYW5kIGl0J3MgaGFyZCBmb3Ig
Y29udHJpYnV0b3JzIHRvIHRlc3QgdGhlIHdvcmsgb24gZm9yLW5leHQgKGJ1Z2d5LAogICBubyBm
aXhlcywgYW5kIHNvbWV0aW1lIG1pc3NpbmcgZGVwcykuCgpJIHVzZWQgdG8gc3BlbmQgYSB3aG9s
ZSBsb3Qgb2YgbWluZSB0aW1lIGluIHRoZSBuZXRkZXYgdHJlZSBvZiB0aGUKa2VybmVsLCBhbmQg
dGhpcyBpcyBob3cgdGhleSBtYW5hZ2UgaXQgKFRoYW5rcyBLdWJhISk6CgpOZXRkZXYgKGhlcmUg
ZXhjaGFuZ2VkIHRvIFJJU0MtViB0cmVlcyksIGZhc3QtZm9yd2FyZCBmaXhlcywgYW5kIHRoZW4K
Y3Jvc3MtbWVyZ2UgZml4ZXMgaW50byBmb3ItbmV4dCAtLSBmb3IgZXZlcnkgLXJjLgoKRS5nLiwg
c2F5IGZpeGVzIGlzIHN1Ym1pdHRlZCBmb3IgLXJjMiB0byBMaW51cywgb25jZSBoZSBwdWxscywg
ZG86CgogIGdpdCBwdXNoIC0tZGVsZXRlIG9yaWdpbiAkU09NRVRBRwogIGdpdCB0YWcgLWQgJFNP
TUVUQUcKICBnaXQgcHVsbCAtLWZmLW9ubHkgLS10YWdzIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1
Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQKICBidWlsZCAvIHRlc3Qg
LyBwdXNoIG91dC4KClRoZW4gcHVsbCBmaXhlcyBpbnRvIGZvci1uZXh0OgoKICBnaXQgcHVsbCAt
LXRhZ3MgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3Jpc2N2
L2xpbnV4LmdpdCBmaXhlcwoKClBlcnNvbmFsbHkgKG9idmlvdXNseSBiaWFzZWQpLCBJIHRoaW5r
IHRoaXMgd291bGQgYmUgZWFzaWVyIGZvcgpjb250cmlidXRvcnMuIEFueSBkb3duc2lkZXMgZnJv
bSBhIFJJU0MtViBwZXJzcGVjdGl2ZT8KCgpCasO2cm4KCgpbMV0gZ2l0Oi8vZ2l0Lmtlcm5lbC5v
cmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3Jpc2N2L2xpbnV4LmdpdAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
