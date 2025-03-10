Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89137C282DE
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Mar 2025 19:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6/DpcHmjcAbinhUwn02MyK1PemasBCbhtvYjS/zY6g8=; b=L5KKOSPPpN+1Lz
	NHyqi1v/i7LdymetSZVHuuaUSKerc4uc7Zqi3xBk0FPeb+xEL7+m6Mt+9EyVCwintkO3GbRIBmVGw
	LAWa6H2k+tsxs6+w7jRfAPokrIVHX05aT2rsz2xLQEWMoPY8lY5fZht2WEmZFLI26/vRPmEiqH1i4
	H+GJiQ3S3AFb/4A1KUXf+66VAjnRFnypKlI0cYMbwTlcWqYhjfEdyGlxeFoZOFjyOpB8AcW4dT1Yf
	eVWGcpI+4KtwtG9WIN0Hp6VegXEgqi2rPyBBEm4gohKM94qYwk3o6IHZgpHa38cTKh5PYiU3qvhUf
	Q4pG0KXvlB5E3GYhGCSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1triUu-00000003i69-3VYP;
	Mon, 10 Mar 2025 19:09:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1triUs-00000003i5Q-1IQ6
	for linux-riscv@lists.infradead.org;
	Mon, 10 Mar 2025 19:09:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C4DFF5C24D6;
	Mon, 10 Mar 2025 19:06:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF8FBC4CEE5;
	Mon, 10 Mar 2025 19:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741633745;
	bh=94BLM8I4Iq83Qseq7x7CFPGfm7TLCrXXLplG8u98kvw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=XZRR5AMPMdk7ZB16EirURn/TlcYn8Hvck7OAPCUxjBv2KSIkw/KsHoQ3+drQB5T1V
	 ROMtT5MHluDHssmcdcqYO/aoZlylAaFjFxitFG0ZW8G55U89BMtcOCmAL2Aqq3ARGI
	 Hb2LHpBtfNNfxy1MschfIT3s3uiUo/pYQubB1lZQJ0aPj6tTmfrrIl7E54tXvtni45
	 z9GY+zYm4FJT4qrI/ABI2MeD6x12AiHOQBQ4GShE1FsQQfGi8asgy95FOjMb/264i+
	 CBnG1qLcF3kjy6J3JIsMa5SJYb9sUmGJr/js6FkGzziSmk3hEwslcDvYVkwOf2FMWd
	 QAjiu/khUe15g==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Andy Chiu <andybnac@gmail.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 bjorn@rivosinc.com, puranjay12@gmail.com, alexghiti@rivosinc.com,
 yongxuan.wang@sifive.com, greentime.hu@sifive.com, nick.hu@sifive.com,
 nylon.chen@sifive.com, tommy.wu@sifive.com, eric.lin@sifive.com,
 viccent.chen@sifive.com, zong.li@sifive.com, samuel.holland@sifive.com
Subject: Re: [PATCH v3 7/7] riscv: ftrace: support PREEMPT
In-Reply-To: <20241127172908.17149-8-andybnac@gmail.com>
References: <20241127172908.17149-1-andybnac@gmail.com>
 <20241127172908.17149-8-andybnac@gmail.com>
Date: Mon, 10 Mar 2025 20:09:02 +0100
Message-ID: <87h640k8j5.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_120906_401888_A13D5229 
X-CRM114-Status: UNSURE (   4.41  )
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

QW5keSBDaGl1IDxhbmR5Ym5hY0BnbWFpbC5jb20+IHdyaXRlczoKCj4gRnJvbTogQW5keSBDaGl1
IDxhbmR5LmNoaXVAc2lmaXZlLmNvbT4KPgo+IE5vdywgd2UgY2FuIHNhZmVseSBlbmFibGUgZHlu
YW1pYyBmdHJhY2Ugd2l0aCBrZXJuZWwgcHJlZW1wdGlvbi4KPgo+IFNpZ25lZC1vZmYtYnk6IEFu
ZHkgQ2hpdSA8YW5keS5jaGl1QHNpZml2ZS5jb20+CgpSZXZpZXdlZC1ieTogQmrDtnJuIFTDtnBl
bCA8Ympvcm5Acml2b3NpbmMuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
