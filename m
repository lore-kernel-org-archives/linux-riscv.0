Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45473ECAAD5
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Sep 2022 06:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7v6+alFANOWtwk3PzTGOCYZbXVBanNG+CRpV678O0Ao=; b=TaedmCiUaIJDCU
	Fijk60y91qqGomoHsdOEelCjlx9R6jEvtZxwSABAtuczpGcwyGBPRnCb7LTeT8tDprauwV5MQOgxC
	8vBujZRy9/Z72gdME2QoSqm8ibhy/F0ZQ0kvTHxLT2OG2W7RSyomTvQmT54TfyjyCJDq084dPzUej
	HbosA3pc/gLWRFI9kVvabAEBOWiZNbRBBo1SWihmuoWcegpufmLQxajYUg4O5zp7VDjO+Cwv9nWrn
	DtuSzmo58xWf/txT0E3jOJ8A/y/E0YpwlV/TgBcnHk2ON/Zv486HEDTkBfgWcIACAVcPwJciQtGes
	yuUQMrVjrm6dhOveq8/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV5u1-00CZFb-4E; Mon, 05 Sep 2022 06:48:13 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV5h9-00CK0m-MH; Mon, 05 Sep 2022 06:34:57 +0000
Date: Mon, 5 Sep 2022 08:34:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1662359689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ymTw5XBMYgKVIeJh9aYTiMBe+I7d6R0sABW/gVPUNZY=;
	b=1JYwlslTPGKZVLWAgIQLOvrV5cS2f8XDBRsTxuEp4kuwx1izZCcslOZ3ouAyPBRPJAUipU
	8hkT40r2lrqxV36uNBcdu6GN3k+gRKy3A20Vfb6aDcTfykHqDETNrXxGNLsp1dkOwui7sv
	B+Upmccg8S3ynJn9P9xaZfzpC9gEedcnDR9EsaLT2GYIdQTtWEIxHR3w3lPPTqO+4IlQBe
	utoikxUCGJsQJnsm62aE3NQbaK+DGcg2mpPDh5mNL7Uj7HWjtLCUY/JHwTqdpUpvovO455
	AFcOc0s6k6weRuTpTXJkwfVeuKT6biMkgP3aRmN95R6tmvP3EE3MLdZx5GFb/A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1662359689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ymTw5XBMYgKVIeJh9aYTiMBe+I7d6R0sABW/gVPUNZY=;
	b=c1FZvonWTQ4c1SjsgaR7+xk9CjbBSZWzEPYyI813LvRBHJzV4x3X5FgF3oZajvj+l/9uTs
	x7xDwB890V4ZC4DA==
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
Message-ID: <YxWYh5C5swlyobi2@linutronix.de>
References: <20220831175920.2806-1-jszhang@kernel.org>
 <20220831175920.2806-5-jszhang@kernel.org>
 <CAJF2gTQMM50TZZ95XOY+Rgvm2hZ3nLxkYfaSW_2MvPiJeqTtJw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTQMM50TZZ95XOY+Rgvm2hZ3nLxkYfaSW_2MvPiJeqTtJw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220904_233456_144228_983E2099 
X-CRM114-Status: UNSURE (   8.34  )
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

T24gMjAyMi0wOS0wNCAyMzoxNjoxMiBbKzA4MDBdLCBHdW8gUmVuIHdyb3RlOgo+ID4gZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2VudHJ5LlMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9lbnRy
eS5TCj4gPiBpbmRleCBiOWVkYTNmY2JkNmQuLjU5NTEwMGE0YzJjNyAxMDA2NDQKPiA+IC0tLSBh
L2FyY2gvcmlzY3Yva2VybmVsL2VudHJ5LlMKPiA+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2Vu
dHJ5LlMKPiA+IEBAIC0zNjEsOSArMzYxLDE0IEBAIHJlc3RvcmVfYWxsOgo+ID4gIHJlc3VtZV9r
ZXJuZWw6Cj4gPiAgICAgICAgIFJFR19MIHMwLCBUQVNLX1RJX1BSRUVNUFRfQ09VTlQodHApCj4g
PiAgICAgICAgIGJuZXogczAsIHJlc3RvcmVfYWxsCj4gPiAtICAgICAgIFJFR19MIHMwLCBUQVNL
X1RJX0ZMQUdTKHRwKQo+ID4gLSAgICAgICBhbmRpIHMwLCBzMCwgX1RJRl9ORUVEX1JFU0NIRUQK
PiA+ICsgICAgICAgUkVHX0wgczEsIFRBU0tfVElfRkxBR1ModHApCj4gPiArICAgICAgIGFuZGkg
czAsIHMxLCBfVElGX05FRURfUkVTQ0hFRAo+ID4gKyAgICAgICBibmV6IHMwLCAxZgo+ID4gKyAg
ICAgICBSRUdfTCBzMCwgVEFTS19USV9QUkVFTVBUX0xBWllfQ09VTlQodHApCj4gPiArICAgICAg
IGJuZXogczAsIHJlc3RvcmVfYWxsCj4gPiArICAgICAgIGFuZGkgczAsIHMxLCBfVElGX05FRURf
UkVTQ0hFRF9MQVpZCj4gQ2FuIHlvdSB0ZWxsIG1lLCB3aG8gaW5jcmVhc2VkL2RlY3JlYXNlZCB0
aGUgUFJFRU1QVF9MQVpZX0NPVU5UPyBBbmQKPiB3aG8gc2V0IE5FRURfUkVTQ0hFRF9MQVpZPwoK
VGhlcmUgaXMgImdlbmVyaWMiIGNvZGUgaW4gdGhlIFBSRUVNUFRfUlQgcGF0Y2ggZG9pbmcgdGhh
dC4gVGhlIGNvdW50ZXIKaXMgaW5jcmVtZW50ZWQvIGRlY3JlbWVudGVkIHZpYSBwcmVlbXB0X2xh
enlfZW5hYmxlKCkvZGlzYWJsZSgpIGFuZCBvbmUKb2YgdGhlIHVzZXIgaXMgbWlncmF0ZV9kaXNh
YmxlKCkvZW5hYmxlKCkuCkJhc2ljYWxseSBpZiBhIHRhc2sgaXMgdGFza19pc19yZWFsdGltZSgp
IHRoZW4gTkVFRF9SRVNDSEVEIGlzIHNldCBmb3IKdGhlIHdha2V1cC4gRm9yIHRoZSByZW1haW5p
bmcgc3RhdGVzIChTQ0hFRF9PVEhFUiwg4oCmKSBORUVEX1JFU0NIRURfTEFaWQppcyBzZXQgZm9y
IHRoZSB3YWtldXAuIFRoaXMgY2FuIGJlIGRlbGF5ZWQgaWYgdGhlIHRhc2sgaXMgaW4gYSAicHJl
ZW1wdApkaXNhYmxlIGxhenkiIHNlY3Rpb24gKHNpbWlsYXIgdG8gYSBwcmVlbXB0X2Rpc2FibGUo
KSBzZWN0aW9uKSBidXQgYQp0YXNrX2lzX3JlYWx0aW1lKCkgY2FuIHN0aWxsIGJlIHNjaGVkdWxl
ZCBpZiBuZWVkZWQuClNlZSBkZXRhaWxzIGF0CglodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9z
Y20vbGludXgva2VybmVsL2dpdC9ydC9saW51eC1ydC1kZXZlbC5naXQvcGxhaW4vcGF0Y2hlcy9z
Y2hlZF9fQWRkX3N1cHBvcnRfZm9yX2xhenlfcHJlZW1wdGlvbi5wYXRjaD9oPWxpbnV4LTYuMC55
LXJ0LXBhdGNoZXMKClNlYmFzdGlhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
