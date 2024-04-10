Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B439CD1296
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 07:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F26HN0jV+xBiX1o8ISuoAeOnt0R6GunHQnfNT1imuYU=; b=FEDPv25crtqhnI
	614I0PjFNtKzCtpC13aMsmBqlnB3e4hUaDLGiTUjDFSnHjD40qNb55A8d80gFv/aC2pTC1Txraera
	cBrpqEMMNldbKiwJPXRYmQLkOERrP28THBlmqNHUPFdkMxyKBZS8g8Aswwyqg4coIbECdfILwtbOt
	dADSz/YL75fAJnBXHMUJXbc0BMkXmuO1atsggOXQZB++jz9q2ikpD+9jJeMRCV0RfJxrgPQeBhxL7
	wQxJFA3LegWxkaG7X7GHoL7p1P0XV/87Grnj/N4rnEZWpYO2GbAauWHNcoTa0zLHIbtEeTKL8CFv9
	UwiRNWWdg3AUc+iS38/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruS63-00000005XJW-3sKP;
	Wed, 10 Apr 2024 07:10:15 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruS61-00000005XHp-1ZGq
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 07:10:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DC8BBCE2316;
	Wed, 10 Apr 2024 07:10:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0972C433C7;
	Wed, 10 Apr 2024 07:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712733010;
	bh=AM9KaNBpxNWCQi5LL7cIKKG7N80lhLsstQXI2gkti8c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=c8wgi6wmHDXESGTtZC/cO3KnmYd6HPNqyYrasrkycLYVdA7+oeHKqvIcNJZ4frXHV
	 jXDt4cHr3HLCklwbOQyds2OfLpNeOoy5sc63PBJysMK/yqrHiR4tqv5h6cqvZTNIjt
	 y3zd+F+as/SphdnWuME4Z13GM10UUTX+6heJpF9INfHoS1ZpbzBYECVzoZc3rWARc5
	 etZ4gU/zA8GwJGWI7Wi9fDIdSokfnF7ex8VNkAb04HF5pYQaC62JxIknDSHrXkSvS2
	 8v+7KIUHDHOFpiV4paKHqt3eyKidC7UhgiYKGIVpMVz/T3Q3qPinYt5fzsNjHJ4vkS
	 NrCj+O1ywtt1Q==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Jinglin Wen <jinglin.wen@shingroup.cn>, palmer@dabbelt.com
Cc: paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 gregkh@linuxfoundation.org, atishp@rivosinc.com,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Jinglin Wen
 <jinglin.wen@shingroup.cn>
Subject: Re: [PATCH 0/3] Add early console functionality
In-Reply-To: <20240410063432.23058-1-jinglin.wen@shingroup.cn>
References: <20240410063432.23058-1-jinglin.wen@shingroup.cn>
Date: Wed, 10 Apr 2024 09:10:06 +0200
Message-ID: <87y19lpub5.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_001013_645180_84F7781B 
X-CRM114-Status: UNSURE (   5.10  )
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

SmluZ2xpbiBXZW4gPGppbmdsaW4ud2VuQHNoaW5ncm91cC5jbj4gd3JpdGVzOgoKPiBUaGUgZm9s
bG93aW5nIHBhdGNoIHNlcmllcyBpbXBsZW1lbnRzIHN1cHBvcnQgZm9yIHRoZSBlYXJseQo+IGNv
bnNvbGUgb24gdGhlIFJJU0MtViBwbGF0Zm9ybS4KCkkgZmFpbCB0byBzZWUgaG93IHRoaXMgaXMg
ZGlmZmVyZW50IGZyb20gZWFybHljb249c2JpPwoKCkJqw7ZybgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
