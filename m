Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0195CCD1288
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2024 05:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xnChf4SWXhuOxjBV0lyA5ZW174QTQVrkCZmaUPsE1NQ=; b=22T7nnod+72EMW
	u6TinJ99f+haZ0/t4Y33GV9Q+kjO05CF+1KXcQHi5obnKg39s8D7oXMFYlqBrKeuX3Z80MAXEZsmZ
	DiEAB+MlML+Ip2CA8xPZRuos1Q700DX66HfTTyNCmCh+elNZAAl6d8g3p6Rpnu5NOoFHBJ9SEMagR
	0Rv3rXj8hZqwGvAqjDNKoPYZEABJz0l9e8ixDpZkey6OcMEOdjd3Gu4ZfbD79g37EGIC2+hXQ6yji
	793pkyeAldcieWPPcYh6wa/qkG6tG06RXqTpGhcQYYcaKRP7vm7f4GikvgmN9zU57dNkyBME6/vbL
	oUJ43lFuYZBtgQpQksJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsFwF-00000001Mwl-1EbC;
	Thu, 04 Apr 2024 05:47:03 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsFwD-00000001Mvz-0zdv
	for linux-riscv@lists.infradead.org;
	Thu, 04 Apr 2024 05:47:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D21E5CE2A6D;
	Thu,  4 Apr 2024 05:46:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84050C433F1;
	Thu,  4 Apr 2024 05:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712209618;
	bh=K/tqV2VTM/YXZvK5fR129QweW8rDAKq13mxK08CxCVI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=geWjl5tSMnz9aUJQK+7TpVLQiUSN7iC1cxdw0ZaQC9YA3j/G03sy9qjvINPEmn75T
	 wZPApLMjyiOKCSTpDoPw0JMU79iA9mdS8OYzmR9zniOvtb+VBHHtBXGXBXYqZghJTM
	 55xRhLRMfL3tL6cKIgifP/snSoEGo1e58qs4lrmJk9u3FHNujiwVPjS05LRTzOp96Q
	 LPnRWufVEza0Nvje73D5LnffVx3DpO8cPSjc6sFsYfgCFq0niTiv4Fltsjn+9loiLk
	 0BH5HEUOE4pdzTuF9CtR8UKaW29YnnU/fOvjatcmJzyxnFEvHyoaGLO0gUU/qoG2Qh
	 k8IB5X2MZM8iQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>, Shuah Khan <shuah@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Andy Chiu
 <andy.chiu@sifive.com>, Vineet Gupta <vineetg@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-riscv@lists.infradead.org, Charlie Jenkins <charlie@rivosinc.com>
Subject: Re: [PATCH] riscv: selftests: Add signal handling vector tests
In-Reply-To: <20240403-vector_sigreturn_tests-v1-1-2e68b7a3b8d7@rivosinc.com>
References: <20240403-vector_sigreturn_tests-v1-1-2e68b7a3b8d7@rivosinc.com>
Date: Thu, 04 Apr 2024 07:46:54 +0200
Message-ID: <87bk6pof1t.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_224701_486892_DC0BBF32 
X-CRM114-Status: UNSURE (   5.11  )
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

Q2hhcmxpZSBKZW5raW5zIDxjaGFybGllQHJpdm9zaW5jLmNvbT4gd3JpdGVzOgoKPiBBZGQgdHdv
IHRlc3RzIHRvIGNoZWNrIHZlY3RvciBzYXZlL3Jlc3RvcmUgd2hlbiBhIHNpZ25hbCBpcyByZWNl
aXZlZAo+IGR1cmluZyBhIHZlY3RvciByb3V0aW5lLiBPbmUgdGVzdCBlbnN1cmVzIHRoYXQgYSB2
YWx1ZSBpcyBub3QgY2xvYmJlcmVkCj4gZHVyaW5nIHNpZ25hbCBoYW5kbGluZy4gVGhlIG90aGVy
IHZlcmlmaWVzIHRoYXQgdmVjdG9yIHJlZ2lzdGVycwo+IG1vZGlmaWVkIGluIHRoZSBzaWduYWwg
aGFuZGxlciBhcmUgcHJvcGVybHkgcmVmbGVjdGVkIHdoZW4gdGhlIHNpZ25hbAo+IGhhbmRsaW5n
IGlzIGNvbXBsZXRlLgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2hhcmxpZSBKZW5raW5zIDxjaGFybGll
QHJpdm9zaW5jLmNvbT4KCk5pY2UhCgpSZXZpZXdlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5A
cml2b3NpbmMuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
