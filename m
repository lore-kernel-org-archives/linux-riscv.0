Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA713EB64D9
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jun 2023 19:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=omNHTy9dZcFXNfpos3hZNsO3XQKtjpuIqcdkVx1fCFU=; b=uuI7ptEGcovkwp
	5nMrNRVrp6tIZylQhRqFv2b/GK0zOE5r2mQxDnVlkwVJym875n+EAHeCoNZUpy8qyq4+fKqM2Mglp
	g9Z2s13FiOHRjzWnE4qEvPWYG6b/HbICXLBEyc6b5cKNZB2+YOgLjJClqbaLUiekUZ0ROJ6lSXsmN
	V8L3EUt6l72Ufof4wI1pPGCtLjbkSWjJzi0rre3x5fo5bE+RxbEEnx1p5DCTdsl7grkSxuZ53sZKS
	8Y12Th4wlSg1wgRtc4VAE+seE8qQZxovfY9pm7tp2kA0aF+m80WlUXqld51vUlm/XQpyEcKlvv1Md
	XHuP0SNiyXy/ROwtGKYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBK7z-009GMY-1g;
	Mon, 19 Jun 2023 19:01:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBK7w-009GLn-37
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jun 2023 19:01:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4FB4E60E75;
	Mon, 19 Jun 2023 19:01:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59B59C433C0;
	Mon, 19 Jun 2023 19:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687201283;
	bh=vU57t+WwviYz1tb49Q288FY8p4wqJOlItftEVncIaAA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=sa+HQO4m8sIQWitUyaWghJpWTRYzTDIu00Po+lIt5II7O9oMUszFfA2RQj8oGP421
	 dngBvcFEX+nqyXNnxh++mq/pTVQA9yinE/PFaDuQMoJV604PgAqF1mmTwR15ncqO7F
	 +GgWWt8y5tUNi8q5XL3UVCYg9hMII2RFKsZEDIJ4kokGBEq4oDfmmScgtwrypn83o+
	 wkw2PadngKkb/7cmgKTNDZQ64ZUcV1dd5MdImyN8gT71LgiYK/cxO+sTbuIe7VqGbR
	 IsLbm77+51He/5cIdoph+U3Xs4/w0DWrUhDlOzoKe/G6zotlzDKGMDsLVJowMeeuTp
	 1d1J1adMJ/ozg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org
Subject: Re: [PATCH] RISC-V: Clobber V registers on syscalls
In-Reply-To: <mhng-8d1b80c9-10f4-448b-9e9d-31a1c969393f@palmer-ri-x1c9>
References: <mhng-8d1b80c9-10f4-448b-9e9d-31a1c969393f@palmer-ri-x1c9>
Date: Mon, 19 Jun 2023 21:01:20 +0200
Message-ID: <87v8fjjmyn.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_120125_041301_546B5C15 
X-CRM114-Status: GOOD (  14.55  )
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

UGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+IHdyaXRlczoKClsuLi5dCgo+Pj4g
KwkJcmlzY3Zfdl92c3RhdGVfb2ZmKHJlZ3MpOwo+Pj4gKwo+Pgo+PiBOb3Qgb2ZmLCByaWdodD8g
SXNuJ3QgaXQgX19yaXNjdl92X3ZzdGF0ZV9jbGVhbigpIHRoYXQgeW91J2QgbGlrZSB0bwo+PiBj
YWxsPyBTb21ldGhpbmcgbGlrZToKPj4KPj4gc3RhdGljIHZvaWQgdnN0YXRlX2Rpc2NhcmQoc3Ry
dWN0IHB0X3JlZ3MgKnJlZ3MpCj4+IHsKPj4gICAgICAgIGlmICgocmVncy0+c3RhdHVzICYgU1Jf
VlMpID09IFNSX1ZTX0RJUlRZKQo+PiAgICAgICAgICAgICAgICBfX3Jpc2N2X3ZfdnN0YXRlX2Ns
ZWFuKHJlZ3MpOwo+PiB9Cj4+Cj4+IENvbXBsZW1lbnRlZCBieSBhICFWIGNvbmZpZyB2YXJpYW50
Lgo+Cj4gSSB0aGluayBpdCdzIGp1c3QgYSBxdWVzdGlvbiBvZiB3aGF0IHdlJ3JlIHRyeWluZyB0
byBkbyBoZXJlOiBjbGVhbiAKPiBhdm9pZHMgdGhlIGtlcm5lbCBWIHN0YXRlIHNhdmUsIGJ1dCB1
bmxlc3MgdGhlIGtlcm5lbCBkZWNpZGVzIHRvIHVzZSBWIAo+IGR1cmluZyB0aGUgc3lzY2FsbCB0
aGUgcmVnaXN0ZXIgY29udGVudHMgd2lsbCBzdGlsbCBiZSB1c2FibGUgYnkgCj4gdXNlcnNwYWNl
LiAgTWF5YmUgdGhhdCdzIGZpbmUgYW5kIHdlIGNhbiBqdXN0IHJlbHkgb24gdGhlIElTQSBzcGVj
LCAKPiB0aG91Z2g/ICBJIHNlbnQgYW5vdGhlciBwYXRjaCB0byBqdXN0IGRvY3VtZW50IGl0IGlu
IExpbnV4LCBldmVuIGlmIGl0J3MgCj4gaW4gdGhlIElTQSBzcGVjIGl0IHNlZW1zIHdvcnRoIGhh
dmluZyBpbiB0aGUga2VybmVsIGFzIHdlbGwuCj4KPiBUaGF0IHNhaWQsIEkgdGhpbmsgdGhlIHJp
Z2h0IHRoaW5nIHRvIGRvIGhlcmUgbWlnaHQgYmUgdG8gemVybyB0aGUgViAKPiByZWdpc3RlciBz
dGF0ZSBhbmQgc2V0IGl0IHRvIGluaXRpYWw6IHRoYXQgd2F5IHdlIGNhbiBwcmV2ZW50IHVzZXJz
cGFjZSAKPiBmcm9tIGFjY2lkZW50YWxseSByZWx5aW5nIG9uIHRoZSBzdGF0ZSBzYXZlLCBidXQg
d2UgY2FuIGFsc28gYXZvaWQgdGhlIAo+IHRyYXAgdGhhdCB3b3VsZCBjb21lIGZyb20gdHVybmlu
ZyBpdCBvZmYuICBUaGF0IGxldHMgdXMgZ2l2ZSB0aGUgCj4gaGFyZHdhcmUgYSBuaWNlIGNsZWFu
IGluZGljYXRpb24gd2hlbiB0aGUgViBzdGF0ZSBpc24ndCBpbiB1c2UsIHdoaWNoIAo+IHdpbGwg
aG9wZWZ1bGx5IGhlbHAgdXMgYXZvaWQgdGhlIHNhdmUvcmVzdG9yZSBwZXJmb3JtYW5jZSBpc3N1
ZXMgdGhhdCAKPiBvdGhlciBwb3J0cyBoYXZlIGhpdC4KCkZXSVcsIEkgdGhpbmsgdGhhdCdzIGEg
bXVjaCBiZXR0ZXIgaWRlYSB0aGFuIHR1cm5pbmcgViBvZmYuIEkgYWxzbyBsaWtlCnRoYXQgaXQn
bGwgcHJldmVudGluZyB1c2VybGFuZCB0byByZWx5IG9uIHByZS1lY2FsbCBzdGF0ZS4KCgpCasO2
cm4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
