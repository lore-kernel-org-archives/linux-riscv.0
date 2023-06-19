Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5ECCEB64D9
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jun 2023 11:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jccYqNuHyPtEc4ZMdRefaeAX2jrQwXatzAIA6uNu0/U=; b=kcrywvq0sgNMyB
	6OrK8mo/3zfXP2KG1oImlXdD7lofM323GMeYwdmme1x12iqiDKvo27lvDvOEhCZbJgG9V4wIMFb2v
	3VuSe3ZMSvOafk8yumU018Jlc1Sg63uty6PG4oXeIx3rO3kI3W0ZE/eij0BOdNwKZ4xIDy1MEny7i
	2c6CQwkHAlxFCiAlh3UIduUfW32eXyskN2r1mToQnGA+0SMo7t08VR7AbKCPuO7hjyKs+/v0cylyl
	OQJ5G9qDgvmvZw3NQptDhyBBce4TFxV17zi/FKNVrjcIKNDYeN+sM3toQiNH0E3e7O1ikKHiX7sNI
	XzHCUkbnpmaIJ/7mLdvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBCd0-008IYo-0d;
	Mon, 19 Jun 2023 11:00:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBCcy-008IWo-0Y
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jun 2023 11:00:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 005F060B7F;
	Mon, 19 Jun 2023 11:00:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8866C433CB;
	Mon, 19 Jun 2023 11:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687172454;
	bh=P18pbPD6vuPCbw9QzcSrESz215K6BSQTQUGHn6iOUK4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Dwx8LFrJ7rLWMmUfb0tJSP7XvGxgFgEueH00zQOUnB8zJJeygOklU7wf0+ziYphoz
	 MKN/FCzS+maQ/DBPLAFgYUDJYRTDZTMNGjT09piDXz5sZz0dNwqkIdLbQwdV/R6eRp
	 7vjSv3vs8ucZPpx4aqmavUf4I6Nd29F4VNSStx7IptPnzDsEQA7cA/fh/snJRKpxej
	 BaVFamiK+0CPq4DVcbS5zC75QNR8wHO8+hI7YEWtunUOTUZJjZQQHOQ2gSKSY9e4HG
	 HoTS0hzmGCp0HEalcPO7VHsuAZEeopFZ59J/93qls9XXJpQr8m6fbPe2nZzJeaxGs6
	 w+pua1pdkaFXQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>, Jonathan Corbet
 <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH 1/2] Documentation: riscv: Add early boot document
In-Reply-To: <20230619094705.51337-1-alexghiti@rivosinc.com>
References: <20230619094705.51337-1-alexghiti@rivosinc.com>
Date: Mon, 19 Jun 2023 13:00:51 +0200
Message-ID: <87sfanbtss.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_040056_263936_6FB14D01 
X-CRM114-Status: UNSURE (   5.09  )
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

QWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPiB3cml0ZXM6Cgo+IFRoaXMg
ZG9jdW1lbnQgZGVzY3JpYmVzIHRoZSBjb25zdHJhaW50cyBhbmQgcmVxdWlyZW1lbnRzIG9mIHRo
ZSBlYXJseQo+IGJvb3QgcHJvY2VzcyBpbiBhIFJJU0MtViBrZXJuZWwuCj4KPiBTemlnbmVkLW9m
Zi1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgoKQWRkaXRpb25h
bCAneic7ICJTaWduZWQtb2ZmLWJ5OiIKCk5pY2Ugd3JpdGV1cCEKClJldmlld2VkLWJ5OiBCasO2
cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
