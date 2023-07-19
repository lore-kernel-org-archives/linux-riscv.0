Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B672AC001E0
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 16:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FV5jlvEV+a1Fb5OXFhrTeTK19i4SNWlCJTw3HJxpRoc=; b=Fv2qHleTu2ScGt
	Z2UdiCVO7rOab1TEOuojqVBZXdZq70sLYPh1M6Iy3Kr4ycJUMeXZU9OB/1gD8gAKDwCgIhYEhegdv
	IZv8mwXbQWfJNE8RgNKsDv6rfGe7h1JLMU9xZ6zfH85W1d6ZkioJaN2G2NW59erlZvmo9AJDWO4vq
	P1pcsveb1Mz8PKfL54i2VJvvJ3UawYQjtUJpe+GJNQRDSeUhbaLHdusd4Cwi+BDEwF1XxdlkUKFDf
	ndQaq9ZklsvQ0PS/35dCJ6S8tosE89s1JG34xjo0bKh9hk97Xz4te78Rac+0GOaTqlEnJte4K2ozx
	oL3mG0SB0kcwng05igrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMA2n-0088Qa-32;
	Wed, 19 Jul 2023 16:28:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMA2l-0088Pf-16
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 16:28:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B960461786;
	Wed, 19 Jul 2023 16:28:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30F21C433C9;
	Wed, 19 Jul 2023 16:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689784130;
	bh=mIPWRegXctVmbaqFYfnJtfGdsGtv2kb3BA0sg42Weq0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=EXvCiOqQIyWkGkHjU75JEkTVUDrykU8zhj8RUWweMzynUbaCvHTgywL7G2WERN0H7
	 VnG2j3aRlxlRaJFxaHG4b0uhm58Y2MWZhCFggmrFdcAyJx/ADqR5FiPqYrKGQFQp4o
	 yYVoOu463yyPZ9+hReuXnSls5Oul4NtCCUGXz0CVsk/UbKw/x0QQR2WmUq2DXa6fD4
	 uBOoM1mlsNtFbA/gxnPJdj8m1ToHDk7UdBD4FSoGQOFGrL4KmlDi7NUjYOm7m2neSn
	 4cn3Y9JAjG8r64m0QeqP/9saPfcnfwjjXW2/871nHHKef4rGYeNLMlh+DvBnxl6ZrM
	 OB6eIMspE+DvQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Andreas Schwab <schwab@suse.de>, Celeste Liu <coelacanthushex@gmail.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren
 <guoren@kernel.org>, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 Conor Dooley
 <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Felix Yan <felixonmars@archlinux.org>,
 Ruizhe Pan <c141028@gmail.com>, Shiqi Zhang <shiqi@isrc.iscas.ac.cn>
Subject: Re: [PATCH v3] riscv: entry: set a0 = -ENOSYS only when syscall != -1
In-Reply-To: <mvmo7k8cqns.fsf@suse.de>
References: <20230718210037.250665-1-CoelacanthusHex@gmail.com>
 <mvmo7k8cqns.fsf@suse.de>
Date: Wed, 19 Jul 2023 18:28:47 +0200
Message-ID: <878rbbkgqo.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_092851_475050_AAC3CE8E 
X-CRM114-Status: UNSURE (   7.37  )
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

QW5kcmVhcyBTY2h3YWIgPHNjaHdhYkBzdXNlLmRlPiB3cml0ZXM6Cgo+IE9uIEp1bCAxOSAyMDIz
LCBDZWxlc3RlIExpdSB3cm90ZToKPgo+PiBAQCAtMzA4LDcgKzMxMiw3IEBAIGFzbWxpbmthZ2Ug
X192aXNpYmxlIF9fdHJhcF9zZWN0aW9uIHZvaWQgZG9fdHJhcF9lY2FsbF91KHN0cnVjdCBwdF9y
ZWdzICpyZWdzKQo+PiAgCj4+ICAJCWlmIChzeXNjYWxsIDwgTlJfc3lzY2FsbHMpCj4+ICAJCQlz
eXNjYWxsX2hhbmRsZXIocmVncywgc3lzY2FsbCk7Cj4+IC0JCWVsc2UKPj4gKwkJZWxzZSBpZiAo
KGxvbmcpc3lzY2FsbCAhPSAtMUwpCj4KPiBZb3UgY2FuIGFsc28gdXNlIHN5c2NhbGwgIT0gLTFV
TCBvciBldmVuIHN5c2NhbGwgIT0gLTEuCgpUaGUgZm9ybWVyIGlzIGluZGVlZCBiZXR0ZXIgZm9y
IHRoZSBleWVzISA6LSkgVGhlIGxhdHRlciB3aWxsIGdldCBhCi1Xc2lnbi1jb21wYXJlIHdhcm5p
bmcsIG5vPwoKCkJqw7ZybgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
