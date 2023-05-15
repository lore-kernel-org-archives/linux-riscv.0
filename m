Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27C63C7EE24
	for <linux-riscv@archiver.kernel.org>; Mon, 15 May 2023 18:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0gIVUiugvIipAH5bcqxE/eeOrkz/hnWBlfejKpXH9fI=; b=ZBmBofaEjA1KYM
	dn4CKnWYHLVhGAHfxwu30LWhlwngggza2KlPJeXwN6B+7MRBMpTsdZebmc24PAEzW9/YG7UDJsbSn
	2rT3NpOMnHZDT5rzrWrJemC87Z9lSUvIJsSnSp0v5vFghsRqLwGBDsDCi8ag+wBoojeWPtrpTYdWu
	LxLOh7BwKK7szGldaCW9dtGMvbbCHCXYhkM1QuNfZCZ0vsXqPhGoirWui7kqHYzFIhBqBgS4OZVxl
	YHrlF3X/RSneYZNVHSgA40yG6Ge8A2KcZqZ8egnkLDKnaHMza3il97moWeOMMkbOg5uNkMMAWy5Uc
	cXiTWyDTMVBAmyRGhZpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyd4F-0039yB-2n;
	Mon, 15 May 2023 18:37:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyd4D-0039xW-1w
	for linux-riscv@lists.infradead.org;
	Mon, 15 May 2023 18:37:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F1BC561FCA;
	Mon, 15 May 2023 18:37:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01F04C433EF;
	Mon, 15 May 2023 18:37:02 +0000 (UTC)
Date: Mon, 15 May 2023 14:37:00 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Song Shuai <suagrfillet@gmail.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 mhiramat@kernel.org, mark.rutland@arm.com, guoren@kernel.org,
 jszhang@kernel.org, e.shatokhin@yadro.com, bjorn@rivosinc.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH V10 4/4] samples: ftrace: Add riscv support for
 SAMPLE_FTRACE_DIRECT[_MULTI]
Message-ID: <20230515143700.26beeacf@gandalf.local.home>
In-Reply-To: <20230511093234.3123181-5-suagrfillet@gmail.com>
References: <20230511093234.3123181-1-suagrfillet@gmail.com>
	<20230511093234.3123181-5-suagrfillet@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_113705_674696_0E1E2AF5 
X-CRM114-Status: GOOD (  11.56  )
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

T24gVGh1LCAxMSBNYXkgMjAyMyAxNzozMjozNCArMDgwMApTb25nIFNodWFpIDxzdWFncmZpbGxl
dEBnbWFpbC5jb20+IHdyb3RlOgoKPiBzZWxlY3QgSEFWRV9TQU1QTEVfRlRSQUNFX0RJUkVDVCBh
bmQgSEFWRV9TQU1QTEVfRlRSQUNFX0RJUkVDVF9NVUxUSQo+IGZvciBBUkNIX1JWNjRJIGluIGFy
Y2gvcmlzY3YvS2NvbmZpZy4gQW5kIGFkZCByaXNjdiBhc20gY29kZSBmb3IKPiB0aGUgZnRyYWNl
LWRpcmVjdCouYyBmaWxlcyBpbiBzYW1wbGVzL2Z0cmFjZS8uCj4gCj4gTGluazogaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvYzY4YmFjODMtNWM4OC04MGIxLWJhYzktZTFmZDRl
YThmMDdlQHlhZHJvLmNvbS9ULyNtYTEzMDEyNTYwMzMxYzY2YjA1MWI1ODBiM2FiNGEwNGJhNDQ0
NTVlYwo+IFRlc3RlZC1ieTogRXZnZW5paSBTaGF0b2toaW4gPGUuc2hhdG9raGluQHlhZHJvLmNv
bT4KPiBTaWduZWQtb2ZmLWJ5OiBTb25nIFNodWFpIDxzdWFncmZpbGxldEBnbWFpbC5jb20+Cj4g
VGVzdGVkLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBH
dW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KPiBBY2tlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympv
cm5Acml2b3NpbmMuY29tPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L0tjb25maWcgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgIDIgKysKPiAgc2FtcGxlcy9mdHJhY2UvZnRyYWNlLWRpcmVjdC1tb2Rp
ZnkuYyAgICAgICB8IDM0ICsrKysrKysrKysrKysrKysrKwo+ICBzYW1wbGVzL2Z0cmFjZS9mdHJh
Y2UtZGlyZWN0LW11bHRpLW1vZGlmeS5jIHwgNDAgKysrKysrKysrKysrKysrKysrKysrCj4gIHNh
bXBsZXMvZnRyYWNlL2Z0cmFjZS1kaXJlY3QtbXVsdGkuYyAgICAgICAgfCAyNCArKysrKysrKysr
KysrCj4gIHNhbXBsZXMvZnRyYWNlL2Z0cmFjZS1kaXJlY3QtdG9vLmMgICAgICAgICAgfCAyNyAr
KysrKysrKysrKysrKwo+ICBzYW1wbGVzL2Z0cmFjZS9mdHJhY2UtZGlyZWN0LmMgICAgICAgICAg
ICAgIHwgMjMgKysrKysrKysrKysrCj4gIDYgZmlsZXMgY2hhbmdlZCwgMTUwIGluc2VydGlvbnMo
KykKCkkgYWNrZWQgdjggKHdoaWNoIHlvdSB3aWxsIG5lZWQgbXkgYWNrIHRvIGdldCB0aGVzZSBp
bikuIFVubGVzcyB0aGlzIHBhdGNoCmNoYW5nZWQgc2luY2UgdjgsIHlvdSBzaG91bGQgaW5jbHVk
ZSBteSBhY2sgaW4gZnVydGhlciB2ZXJzaW9ucy4KCk9yIHlvdSBtYXkgYmUgd2FpdGluZyBsb25n
ZXIgZm9yIGl0cyBhY2NlcHRhbmNlLgoKSWYgdGhlIHBhdGNoIGRpZCBjaGFuZ2UsIHBsZWFzZSBh
Y2tub3dsZWRnZSB0aGF0IGluIHRoZSBuZXh0IHZlcnNpb24gKG9yCnRoaXMgb25lIGlmIGl0IGRp
ZCBjaGFuZ2UpLCBhc2tpbmcgbWUgdG8gYWNrIGl0IGFnYWluLgoKLS0gU3RldmUKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
