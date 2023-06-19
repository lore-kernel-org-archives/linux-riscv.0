Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E182FEB64D9
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jun 2023 19:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3H9JjrVTiqsJX/SSVGvIAoW6nZaA5jNggOEKc7pmR/0=; b=X/f7sKxno0lMb0
	CLrqP3ToEmu2stRvjM5OYH+mR8i3XYqI6ySNYSI1e4yawTCGqujTLPwRnYYYSMK+CLuIOO3O2DwW1
	QFBdE4QvVXvdrGfjiDnsjXowVCR5vRINT4QN8HwDMo+yZM1TzwG80ZjprhJuthb+nzcWmCzX4cICm
	lrXBA2nXOI372AgNQCSc7okmc8QUCAGFZvtjMQpjZUQ9OKACGSqaNQcND/lBGauv4+e/uH6H4nvLr
	GwrJz5PV5fNf/mIUyubY+YRPWliWpmCU6PTGv12rTKqL3Z5gLGueeOY21Ofpb5HXqnZ4yNWVRBJZA
	Vwk2u2TzJIkyXcI0lr5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBKED-009HWX-04;
	Mon, 19 Jun 2023 19:07:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBKE9-009HVt-2L
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jun 2023 19:07:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 16CB960EA2;
	Mon, 19 Jun 2023 19:07:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 654C1C433C8;
	Mon, 19 Jun 2023 19:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687201668;
	bh=OdFppw1JgSTO7ijP2ySnu/iBhDR9Yoed2jTeUgvqAyo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=dx2u2+R/A3j0mwRKhLz5VT5JW5YaZXOMYvR3D5tZQKTGLWCBWbCgxhTSNSKvg4a1g
	 47v6BhEOvWZhQpFprkg6XmQQDzJoG7uRuR8svN8takpFSZvI3yK62ABkMIAaImkjPF
	 CTOXCZ2JOYSNll2UAApc/v4OjRdFI7NW3uWQSoqSQomY8r8mgLb0Cmg6m+QQpSXxOi
	 VRcM/PZBsAjkLh3TiYQg3zJhSBJzPW9R4y04jX00SC8P/c7LWUuTGvfG7tZptSZwx+
	 W9ISlNIIoAd0FuOALZL1BWhGgiKSC79JMW5BiVMfQp85KcAVRPZtNzyf9JKl6lz7us
	 DLNwB4cMSzBZg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org,
 remi@remlab.net
Cc: Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH v3] RISC-V: Document that V registers are clobbered on
 syscalls
In-Reply-To: <20230619190142.26498-1-palmer@rivosinc.com>
References: <20230619190142.26498-1-palmer@rivosinc.com>
Date: Mon, 19 Jun 2023 21:07:45 +0200
Message-ID: <87r0q7jmny.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_120749_805283_83F9D884 
X-CRM114-Status: UNSURE (   6.12  )
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

UGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+IHdyaXRlczoKCj4gVGhpcyBpcyBp
bmNsdWRlZCBpbiB0aGUgSVNBIG1hbnVhbCwgYnV0IGl0J3MgcHJldHR5IGNvbW1vbiBmb3IgYml0
cyBvZgo+IHRoZSBJU0EgbWFudWFsIHRoYXQgYXJlIGFjdHVhbGx5IEFCSSB0byBjaGFuZ2UuICBT
byBsZXQncyBkb2N1bWVudCBpdAo+IGV4cGxpY2l0bHkuCj4KPiBTaWduZWQtb2ZmLWJ5OiBQYWxt
ZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNvbT4KClJldmlld2VkLWJ5OiBCasO2cm4gVMO2
cGVsIDxiam9ybkByaXZvc2luYy5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
