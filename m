Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E09606A31E
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Oct 2026 09:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zbeRhdfw;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e0KXiC5i
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ibgFb/8eN6ozqrc0GTSntRFbVDE2cwuF/W1B4GGvaGQ=; b=zbeRhdfw4cCpLyySZGktyXjN3M
	zPF4fcN4CfB+dVMKrvYakgHWt9dmSJTrR1dU1MJCh8Yo3ZX77GytOVyftrRMsh/qVEUMGuSOaprvA
	rvW2cmd3De+O861FIUreDHsS/S9n6FbHPVIt8+p4rhBpu82GGJlWoQ0eyyTpIyLC9Sn5viZzB8VqA
	J/QnYoDozU/uA+zqwzhomxJ+mF8aopaDjMjM33loL45j8NyhMILrKXR9Zx6WJAXVK14DnlJ4jg2oC
	OeTxUfAN7RYM97VrLC7KnGmZVjFx+Ky9MF/Bx1wvNSpPUTGqCcIKV7vcw8Eq4cr75p4/4RBwuNkxc
	UxYkC6ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLdsG-00000004E6N-3GMl;
	Tue, 27 Oct 2026 09:53:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLdsG-00000004E6H-1xpC
	for linux-riscv@lists.infradead.org;
	Tue, 27 Oct 2026 09:53:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E336C41A1C;
	Tue, 27 Oct 2026 09:53:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41F431F01825;
	Tue, 27 Oct 2026 09:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793094823;
	bh=pQP3RGsZ6q4FJJU63G9iJLPofO+P43yPBM9XujmsFZI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=e0KXiC5iYQ0EKDPy1Uc1sPPELI2hoRYu+8n4h+oU4t7G1GepZ+I8DRz+1tS/oV5tB
	 IgfMWPMBFFZc2uyChs2s6rmzB24HLFtD4WrFY5os4xujNYwI6ZlkXbdpRNQqlG7lUH
	 axn32wpo0H0Wko9rSCZNA6DETAZ9dMFH70ho4/oSCuDMuMF4LlyMhmFErMaVs6/uNq
	 ITT8/uAYx+XqrcwZX1sSYecUirON4n6EN80Oq7N2yje24OqTe62KmIYnTk1fIvDkt6
	 1y06HRrLu6aPiBWJl7B76FPTTQG0UTusolZNENrCJF3MWd3qgLJyhomwmz9YlD+3F6
	 CaIBwGUMhZ+uw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Avi Weiss <thnkslprpt@gmail.com>, Anup Patel <anup@brainfault.org>,
 Thomas Gleixner <tglx@kernel.org>
Cc: Radu Rendec <radu@rendec.net>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Bjorn Topel <bjorn@rivosinc.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Avi Weiss
 <thnkslprpt@gmail.com>
Subject: Re: [PATCH] irqchip/riscv-imsic: Report successful hardware retrigger
In-Reply-To: <20261026122641.3292904-2-thnkslprpt@gmail.com>
References: <20261026122641.3292904-2-thnkslprpt@gmail.com>
Date: Tue, 27 Oct 2026 10:53:39 +0100
Message-ID: <87a4nz5v18.fsf@all.your.base.are.belong.to.us>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

QXZpIFdlaXNzIDx0aG5rc2xwcnB0QGdtYWlsLmNvbT4gd3JpdGVzOgoKPiBpbXNpY19pcnFfcmV0
cmlnZ2VyKCkgd3JpdGVzIHRvIHRoZSBJTVNJQyBNU0kgcmVnaXN0ZXIgdG8gcmV0cmlnZ2VyCj4g
YW4gaW50ZXJydXB0LCBidXQgcmV0dXJucyAwLiBUaGUgSVJRIGNvcmUgdHJlYXRzIHplcm8gYXMg
ZmFpbHVyZSBhbmQKPiBtYXkgc2NoZWR1bGUgYSBzb2Z0d2FyZSByZXNlbmQgZGVzcGl0ZSB0aGUg
aGFyZHdhcmUgcmV0cmlnZ2VyLgo+Cj4gUmV0dXJuIDEgYWZ0ZXIgdGhlIE1TSSB3cml0ZSB0byBy
ZXBvcnQgc3VjY2Vzc2Z1bCBoYXJkd2FyZQo+IHJldHJpZ2dlcmluZyBhbmQgcHJldmVudCB0aGUg
dW5uZWNlc3Nhcnkgc29mdHdhcmUgcmVzZW5kLgo+Cj4gRml4ZXM6IDAyN2UxMjVhY2RiYSAoImly
cWNoaXAvcmlzY3YtaW1zaWM6IEFkZCBkZXZpY2UgTVNJIGRvbWFpbiBzdXBwb3J0IGZvciBwbGF0
Zm9ybSBkZXZpY2VzIikKPiBTaWduZWQtb2ZmLWJ5OiBBdmkgV2Vpc3MgPHRobmtzbHBycHRAZ21h
aWwuY29tPgoKTmljZSBjYXRjaCEKClJldmlld2VkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkBr
ZXJuZWwub3JnPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
