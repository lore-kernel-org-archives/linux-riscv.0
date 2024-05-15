Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A1F9C25B75
	for <linux-riscv@archiver.kernel.org>; Wed, 15 May 2024 07:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yB6IodX4CSvICpYSEqFL2vctjkWfD8hUeetFBtPxgYU=; b=XIBW7nb5fZMKBk
	w9/3a8CfRl0x65CaSPxMt5cvQFExFufT6YSVmAb5XRI0PpmKfDAS0+CtunHNUBkR8XJjjKFVKy7LF
	4FguufKiPU2kDw2V6SAyQXbzr/QXvdanfyJRj88l0fgRm+w9CYx9L94zwRZCw+NuKqSB/0L6KSuGg
	tZHDadRt7ID/PWuL9GgRNbgbT5KejiRDFNGpjPvOWqVH3lyv0VlGY3zTg3tFaZefifdPahGLyu9TT
	WDL5EnX/Pp5g0o4p73HBcMxm9GUjH/siSLPQOmLOIUsphb4hE02P7XGK8byCGT3csb9v8eEgOVQ2R
	C/ZXgQfBItITwRZFa4Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s78fP-00000000iIs-47uF;
	Wed, 15 May 2024 07:03:11 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s78fN-00000000iIM-2EhQ
	for linux-riscv@lists.infradead.org;
	Wed, 15 May 2024 07:03:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 045FDCE1372;
	Wed, 15 May 2024 07:03:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA6A2C2BD11;
	Wed, 15 May 2024 07:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715756586;
	bh=B4qEMf4EVGsDCaOxKzxxINbFJU5l8ld0fYiuh99Vrd0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=DNaYmnP6lqeZPyPEH4NDgKmSjYmC9W/HLk2KbeeSAN78X+py65STTCNKA1KvSaEYT
	 ZVPx29xw1qFyhgp30weJoH1zCvmxl3BevfyrAKof0HHTqq9b/OvZ40yXJ8LNt79RKM
	 5BVm2vdbtuCkaqSyVOvsxo+iBWsDfHBDGoqanZ/E4l0vQnmupevWqbQe0pMXibnPor
	 xjIQSIpV9CgHcOKLX0Xc+iQrBrRxyMnsEG3DJMcI82+vQcHCP1oVOoFCwgYVlSUwM8
	 bxCDPmgE4k+MG2+8MzwYcC9bXWBDZ7wPZzOkfzAaYnMbkiwU/lw4LZ7XnyeQvqLai3
	 9xKzdqSQMXGJQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>, Albert Ou
 <aou@eecs.berkeley.edu>, David Hildenbrand <david@redhat.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 8/8] riscv: mm: Add support for ZONE_DEVICE
In-Reply-To: <20240514140446.538622-9-bjorn@kernel.org>
References: <20240514140446.538622-1-bjorn@kernel.org>
 <20240514140446.538622-9-bjorn@kernel.org>
Date: Wed, 15 May 2024 09:03:02 +0200
Message-ID: <87pltntv4p.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_000309_771439_5C32AA99 
X-CRM114-Status: UNSURE (   5.05  )
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
Cc: Lorenzo Stoakes <lstoakes@gmail.com>, Chethan Seshadri <Chethan.Seshadri@catalinasystems.io>, linux-kernel@vger.kernel.org, Andrew Bresticker <abrestic@rivosinc.com>, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, Santosh Mamila <santosh.mamila@catalinasystems.io>, linux-mm@kvack.org, Sivakumar Munnangi <siva.munnangi@catalinasystems.io>, virtualization@lists.linux-foundation.org, Oscar Salvador <osalvador@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

QmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4gd3JpdGVzOgoKPiBGcm9tOiBCasO2cm4g
VMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Cj4KPiBaT05FX0RFVklDRSBwYWdlcyBuZWVkIERF
Vk1BUCBQVEVzIHN1cHBvcnQgdG8gZnVuY3Rpb24KPiAoQVJDSF9IQVNfUFRFX0RFVk1BUCkuIENs
YWltIGFub3RoZXIgUlNXIChyZXNlcnZlZCBmb3Igc29mdHdhcmUpIGJpdAo+IGluIHRoZSBQVEUg
Zm9yIERFVk1BUCBtYXJrLCBhZGQgdGhlIGNvcnJlc3BvbmRpbmcgaGVscGVycywgYW5kIGVuYWJs
ZQo+IEFSQ0hfSEFTX1BURV9ERVZNQVAgZm9yIHJpc2N2NjQuCgouLi5hbmQgdGhpcyBwYXRjaCBo
YXMgcnYzMiBidWlsZCBpc3N1ZXMuIFdpbGwgZml4IGFzIHdlbGwuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
