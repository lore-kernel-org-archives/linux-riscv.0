Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37807EB64DA
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jul 2023 08:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lwtQm2hqfWBn2cg4v4uvwi00/nkr75e4LlxCWAhoFXs=; b=Gk3dvUEMLWedJR
	2D52TICthsCCg2+ObR3ys6PE7byrOWpbhkngbXpF7eHR/szcFZlEs6BqcHFGjOVnpCL/SvqfQ97lQ
	1vF65tnpklSJPGjKUtoCZbzmCz6ETvdlaITU3jNgGuH60kB2G1IM7+QBxLeaDQ1t/yfnumnQjHRLD
	7IcmStUS2QbFsxOdrUCY7dVCqEhqUthPr/3WPk7+PjaDspjgJ2fYX0QMxB9qdWEgsYVKXP3TXdYQ/
	x7BIadyxfwh1mlRbAYl4JVeMMlfOPYIqvJXj3hxgPvItFf8pawsJpX+avQgCEWLucT8wj+7SZ8Cmn
	xnSqqBAorMbbIIRPz/cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIlqP-00AmSn-1K;
	Mon, 10 Jul 2023 08:02:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIlqN-00AmSM-2z
	for linux-riscv@bombadil.infradead.org;
	Mon, 10 Jul 2023 08:02:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=yNHDpzzYjieskAxABdDoEsqYSB5/uS6TUrXGMxgOO98=; b=N99m4nozzqxFHNBeNmFnfuL0Yp
	+A521LWm9TiYTqrAsIYVfa3VHL0b9r5GMrproiVKMHVOP6TE4Cy8w/TftoGRFFiaDE38kqnMcjsDH
	xeUABEteMR+PZlpoHFfw+Qz0DCKQnPO0MK7fC3o85tgPx7g1tthDfgRVNUrjUEFHYVZ6vjXBHamOJ
	cu4xFA/boDgzrKZD8/iF4a0jqsJ1XQdes6nuQLeD7eWIgQeuaGyB7BVs5ACRMjnCrN9/thpPP4JxP
	8bfYNPFbswyKbBnUGgHpYfBUErFA4J839MBBYWAF1b+sPPpl8i7JwdDotUHM+5p+JBnDzLgFVyg/4
	HwAW5SBA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qIlqF-000jDT-0v;
	Mon, 10 Jul 2023 08:01:56 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id AFEC1300274;
	Mon, 10 Jul 2023 10:01:52 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 6346D29984D29; Mon, 10 Jul 2023 10:01:52 +0200 (CEST)
Date: Mon, 10 Jul 2023 10:01:52 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Guo Ren <guoren@kernel.org>
Cc: arnd@arndb.de, palmer@rivosinc.com, tglx@linutronix.de, luto@kernel.org,
	conor.dooley@microchip.com, heiko@sntech.de, jszhang@kernel.org,
	lazyparser@gmail.com, falcon@tinylab.org, chenhuacai@kernel.org,
	apatel@ventanamicro.com, atishp@atishpatra.org,
	mark.rutland@arm.com, bjorn@kernel.org, palmer@dabbelt.com,
	bjorn@rivosinc.com, daniel.thompson@linaro.org,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, stable@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH] riscv: entry: Fixup do_trap_break from kernel side
Message-ID: <20230710080152.GA3028865@hirez.programming.kicks-ass.net>
References: <20230702025708.784106-1-guoren@kernel.org>
 <20230704164003.GB83892@hirez.programming.kicks-ass.net>
 <CAJF2gTTc0Gyo=K-0dCW6wu7q=Wq34hgTB69qJ7VSF_KAgKhavA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTTc0Gyo=K-0dCW6wu7q=Wq34hgTB69qJ7VSF_KAgKhavA@mail.gmail.com>
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

T24gU3VuLCBKdWwgMDksIDIwMjMgYXQgMTA6MzA6MjJBTSArMDgwMCwgR3VvIFJlbiB3cm90ZToK
PiBPbiBXZWQsIEp1bCA1LCAyMDIzIGF0IDEyOjQw4oCvQU0gUGV0ZXIgWmlqbHN0cmEgPHBldGVy
ekBpbmZyYWRlYWQub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiBTYXQsIEp1bCAwMSwgMjAyMyBhdCAx
MDo1NzowN1BNIC0wNDAwLCBndW9yZW5Aa2VybmVsLm9yZyB3cm90ZToKPiA+ID4gRnJvbTogR3Vv
IFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+ID4gPgo+ID4gPiBUaGUgaXJxZW50cnlf
bm1pX2VudGVyL2V4aXQgd291bGQgZm9yY2UgdGhlIGN1cnJlbnQgY29udGV4dCBpbnRvIGluX2lu
dGVycnVwdC4KPiA+ID4gVGhhdCB3b3VsZCB0cmlnZ2VyIHRoZSBrZXJuZWwgdG8gZGVhZCBwYW5p
YywgYnV0IHRoZSBrZGIgc3RpbGwgbmVlZHMgImVicmVhayIgdG8KPiA+ID4gZGVidWcgdGhlIGtl
cm5lbC4KPiA+ID4KPiA+ID4gTW92ZSBpcnFlbnRyeV9ubWlfZW50ZXIvZXhpdCB0byBleGNlcHRp
b25fZW50ZXIvZXhpdCBjb3VsZCBjb3JyZWN0IGhhbmRsZV9icmVhawo+ID4gPiBvZiB0aGUga2Vy
bmVsIHNpZGUuCj4gPgo+ID4gVGhpcyBkb2Vzbid0IGV4cGxhaW4gbXVjaCBpZiBhbnl0aGluZyA6
Lwo+ID4KPiA+IEknbSBjb25mdXNlZCAocHJvYmFibHkgYmVjYXVzZSBJIGRvbid0IGtub3cgUklT
Qy1WIHZlcnkgd2VsbCksIHdoYXQncwo+ID4gRUJSRUFLIGFuZCBob3cgZG9lcyBpdCBoYXBwZW4/
Cj4gRUJSRUFLIGlzIGp1c3QgYW4gaW5zdHJ1Y3Rpb24gb2YgcmlzY3Ygd2hpY2ggd291bGQgcmlz
ZSBicmVha3BvaW50IGV4Y2VwdGlvbi4KPiAKPiAKPiA+Cj4gPiBTcGVjaWZpY2FsbHksIGlmIEVC
UkVBSyBjYW4gaGFwcGVuIGluc2lkZSBhbiBsb2NhbF9pcnFfZGlzYWJsZSgpIHJlZ2lvbiwKPiA+
IHRoZW4gdGhlIGJlbG93IGNoYW5nZSBpcyBhY3RpdmVseSB3cm9uZy4gQW55IGV4Y2VwdGlvbi9p
bnRlcnJ1cHQgdGhhdAo+ID4gY2FuIGhhcHBlbiB3aGlsZSBsb2NhbF9pcnFfZGlzYWJsZSgpIG11
c3QgYmUgdHJlYXRlZCBsaWtlIGFuIE5NSS4KPiBXaGVuIHRoZSBlYnJlYWsgaGFwcGVuZCBvdXQg
b2YgbG9jYWxfaXJxX2Rpc2FibGUgcmVnaW9uLCBidXQKPiBfX25taV9lbnRlciBmb3JjZXMgaGFu
ZGxlX2JyZWFrKCkgaW50byBpbl9pbnRlcnVwdCgpIHN0YXRlLiBTbyBob3cKCkFuZCB3aHkgaXMg
dGhhdCBhIHByb2JsZW0/IEkgdGhpbmsgSSdtIG1pc3Npbmcgc29tZXRoaW5nIGZ1bmRhbWVudGFs
CmhlcmUuLi4KCj4gYWJvdXQ6Cj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3Ry
YXBzLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCj4gaW5kZXggZjkxMGRmY2NiZjVkLi42
OWY3MDQzYTk4YjkgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYwo+ICsr
KyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKPiBAQCAtMTgsNiArMTgsNyBAQAo+ICAjaW5j
bHVkZSA8bGludXgvaXJxLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9rZXhlYy5oPgo+ICAjaW5jbHVk
ZSA8bGludXgvZW50cnktY29tbW9uLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9jb250ZXh0X3RyYWNr
aW5nLmg+Cj4gCj4gICNpbmNsdWRlIDxhc20vYXNtLXByb3RvdHlwZXMuaD4KPiAgI2luY2x1ZGUg
PGFzbS9idWcuaD4KPiBAQCAtMjg1LDEyICsyODYsMTggQEAgYXNtbGlua2FnZSBfX3Zpc2libGUg
X190cmFwX3NlY3Rpb24gdm9pZAo+IGRvX3RyYXBfYnJlYWsoc3RydWN0IHB0X3JlZ3MgKnJlZ3Mp
Cj4gICAgICAgICAgICAgICAgIGhhbmRsZV9icmVhayhyZWdzKTsKPiAKPiAgICAgICAgICAgICAg
ICAgaXJxZW50cnlfZXhpdF90b191c2VyX21vZGUocmVncyk7Cj4gLSAgICAgICB9IGVsc2Ugewo+
ICsgICAgICAgfSBlbHNlIGlmIChpbl9pbnRlcnJ1cHQoKSl7Cj4gICAgICAgICAgICAgICAgIGly
cWVudHJ5X3N0YXRlX3Qgc3RhdGUgPSBpcnFlbnRyeV9ubWlfZW50ZXIocmVncyk7Cj4gCj4gICAg
ICAgICAgICAgICAgIGhhbmRsZV9icmVhayhyZWdzKTsKPiAKPiAgICAgICAgICAgICAgICAgaXJx
ZW50cnlfbm1pX2V4aXQocmVncywgc3RhdGUpOwo+ICsgICAgICAgfSBlbHNlIHsKPiArICAgICAg
ICAgICAgICAgZW51bSBjdHhfc3RhdGUgcHJldl9zdGF0ZSA9IGV4Y2VwdGlvbl9lbnRlcigpOwo+
ICsKPiArICAgICAgICAgICAgICAgaGFuZGxlX2JyZWFrKHJlZ3MpOwo+ICsKPiArICAgICAgICAg
ICAgICAgZXhjZXB0aW9uX2V4aXQocHJldl9zdGF0ZSk7Cj4gICAgICAgICB9Cj4gIH0KClRoYXQn
cyB3cm9uZy4gSWYgeW91IHdhbnQgdG8gbWFrZSBpdCBjb25kaXRpb25hbCwgeW91IGhhdmUgdG8g
bG9vayBhdAohKHJlZ3MtPnN0YXR1cyAmIFNSX0lFKSAodGhhdCdzIHRoZSBpbnRlcnJ1cHQgZW5h
YmxlIGZsYWcgb2YgdGhlCmludGVycnVwdGVkIGNvbnRleHQsIHJpZ2h0PykKCldoZW4geW91IGhp
dCBhbiBFQlJFQUsgd2hlbiBJUlFzIHdlcmUgZGlzYWJsZWQsIHlvdSBtdXN0IGJlIE5NSSBsaWtl
LgoKQnV0IG1ha2luZyBpdCBjb25kaXRpb25hbCBsaWtlIHRoaXMgbWFrZXMgaXQgcmVhbGx5IGhh
cmQgdG8gd3JpdGUgYQpoYW5kbGVyIHRob3VnaCwgaXQgYmFzaWNhbGx5IG11c3QgYXNzdW1lIGl0
IHdpbGwgYmUgTk1JIGNvbnRldHggKGJlY2F1c2UKaXQgY2FuJ3Qga25vdykgc28gdGhlcmUgaXMg
bm8gcG9pbnQgaW4gc29tZXRpbWVzIG5vdCBkb2luZyBOTUkgY29udGV4dC4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
