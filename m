Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7E60ECAAD3
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Sep 2022 10:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=brWIC29ePO1AgG438Pe1877HMPGliNILYUZpr90Zox4=; b=gT9Wl64NUWgDMN
	JXVjqjnLAoJJym6Ir8UZmwlqSc5l7eyfWLqN5jaViil8IeBsViY4E2RsJL1z7R7WJ8yH2au/shUME
	JtUBHehKuuRJxuByLwW5gaFXwH292exAunphjKfAFy+3YaQNOUNWC+9vLZ6xrGj+bWc4zP85g7X44
	CWg+gR0XXylQFy9nZ+Fq8qLxCrU2gCMUH+QhpLBWIqNmHoYwmOkKvo3BdzhjLSLot2dg41Yx2Mfcu
	St1GjFDcsXsLBJZN0iYj3oYDBGSNV/Q7OlEPzixe8DHiPtVGLPkXbufPc3NMgtlAwck6asSLON/M3
	b65QuCLI80+amBsyk1iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV9B7-0002Tu-B0; Mon, 05 Sep 2022 10:18:05 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV7kk-00EujI-FM; Mon, 05 Sep 2022 08:48:57 +0000
Date: Mon, 5 Sep 2022 10:46:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1662367603;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=99mp8geWAAkeObjUx/ShqenPtDH+4Vzc9b2C8frtuew=;
	b=3bgyMX1lfzvfLarSqLyYkBCf05nax7ELI5WVXvk1hzcHWL3HXmWCpcCxKLcmuv2gR8sRZn
	RHdw5gXiNUuHF3/PVdkQ3fUBvKJO/cxGaKUIZWnnyTdu1MgjxLpiFtquoPvaIdp3pS2IYr
	m3857wZ06SavUl7uqfovdfNTPCaHHOM4+mJPbkIbrg30XnJfLJN93rOP+SatK7ktzNcXfq
	Zk5gIO5ksGB6T0LVVgVSjFY7a/Qh3BXGZTyculFX/sos0I+vjkNAiSygogFRBrYSitGIaF
	gEvWWEpTlEDtB2C311WfB34PB4yW9jSDozAe7Rq9lzuNNKqADOD2gMJKVtFy6g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1662367603;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=99mp8geWAAkeObjUx/ShqenPtDH+4Vzc9b2C8frtuew=;
	b=lwBLiyEYMKYIix4ELUfOpUUN1tyc5gpqkoZJfN8EeqhJcnSRXA7QFrq0gLcanRbscYXn8w
	c10xR98CcEPnifBg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Guo Ren <guoren@kernel.org>
Cc: Jisheng Zhang <jszhang@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v2 4/5] riscv: add lazy preempt support
Message-ID: <YxW3cZEhEideZon2@linutronix.de>
References: <20220831175920.2806-1-jszhang@kernel.org>
 <20220831175920.2806-5-jszhang@kernel.org>
 <CAJF2gTQMM50TZZ95XOY+Rgvm2hZ3nLxkYfaSW_2MvPiJeqTtJw@mail.gmail.com>
 <YxWYh5C5swlyobi2@linutronix.de>
 <CAJF2gTR=Cmcox5JrX2bB12MdmurY3vexSA6vw1cdXXbCNB8tXw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTR=Cmcox5JrX2bB12MdmurY3vexSA6vw1cdXXbCNB8tXw@mail.gmail.com>
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

T24gMjAyMi0wOS0wNSAxNjozMzo1NCBbKzA4MDBdLCBHdW8gUmVuIHdyb3RlOgo+ID4gVGhlcmUg
aXMgImdlbmVyaWMiIGNvZGUgaW4gdGhlIFBSRUVNUFRfUlQgcGF0Y2ggZG9pbmcgdGhhdC4gVGhl
IGNvdW50ZXIKPiA+IGlzIGluY3JlbWVudGVkLyBkZWNyZW1lbnRlZCB2aWEgcHJlZW1wdF9sYXp5
X2VuYWJsZSgpL2Rpc2FibGUoKSBhbmQgb25lCj4gPiBvZiB0aGUgdXNlciBpcyBtaWdyYXRlX2Rp
c2FibGUoKS9lbmFibGUoKS4KPiA+IEJhc2ljYWxseSBpZiBhIHRhc2sgaXMgdGFza19pc19yZWFs
dGltZSgpIHRoZW4gTkVFRF9SRVNDSEVEIGlzIHNldCBmb3IKPiA+IHRoZSB3YWtldXAuIEZvciB0
aGUgcmVtYWluaW5nIHN0YXRlcyAoU0NIRURfT1RIRVIsIOKApikgTkVFRF9SRVNDSEVEX0xBWlkK
PiA+IGlzIHNldCBmb3IgdGhlIHdha2V1cC4gVGhpcyBjYW4gYmUgZGVsYXllZCBpZiB0aGUgdGFz
ayBpcyBpbiBhICJwcmVlbXB0Cj4gPiBkaXNhYmxlIGxhenkiIHNlY3Rpb24gKHNpbWlsYXIgdG8g
YSBwcmVlbXB0X2Rpc2FibGUoKSBzZWN0aW9uKSBidXQgYQo+ID4gdGFza19pc19yZWFsdGltZSgp
IGNhbiBzdGlsbCBiZSBzY2hlZHVsZWQgaWYgbmVlZGVkLgo+IE9rYXksIEl0IHNob3VsZCBiZSBb
UEFUQ0ggUlRdLiBSSVNDLVYgd291bGQgYWxzbyBtb3ZlIHRvIEdFTkVSSUNfRU5UUlkKPiBbMV0s
IHNvIGFib3ZlIGFzc2VtYmx5IGNvZGUgd291bGQgYmUgcmVwbGFjZWQgYnkgZ2VuZXJpYyBvbmUs
IHJpZ2h0PwoKY29ycmVjdC4KClNlYmFzdGlhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
