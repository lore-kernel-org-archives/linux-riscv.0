Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98205C77B7D
	for <linux-riscv@archiver.kernel.org>; Mon, 15 May 2023 18:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=afAKRHsSvhyMDlfXHwOOYqUthvhJlIvwXbg1MzSdEVw=; b=CQGvghWWPoJqAT
	ZQVkIgh0jf+DSTbBw4dTFfApwupsjEzZUOdijV7UxIHQfP8dp8mx5aFv8nnW316cDMz5YNlaXoJcb
	VWVSJjIeUD3XEsTRAK2VWHMqwdkMJH9jdu19LebnHIpYXGCTrOpx633+70snKxRo6K05W/bJLmDqv
	ydi7SdqaRnyypr87A17XQWjtJ0YpL6W9Qh2J6is+iEcMFb+B4wtQlKTqpOudLyYydVz+E38PANcpN
	6328rIbXEa6t+UvpgCNRM6h6uzAJc4PgJrJNE0gDVs5WAAo0odaHYfLBVVE+XgJ2nqK/dyyOuHquH
	8WduSMg3Qfu8n+zOvrzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyd5q-003AGy-39;
	Mon, 15 May 2023 18:38:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyd5o-003AFY-0B
	for linux-riscv@lists.infradead.org;
	Mon, 15 May 2023 18:38:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5C06B61FF5;
	Mon, 15 May 2023 18:38:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61C95C433EF;
	Mon, 15 May 2023 18:38:41 +0000 (UTC)
Date: Mon, 15 May 2023 14:38:39 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Song Shuai <suagrfillet@gmail.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 mhiramat@kernel.org, mark.rutland@arm.com, guoren@kernel.org,
 jszhang@kernel.org, e.shatokhin@yadro.com, bjorn@rivosinc.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH V10 4/4] samples: ftrace: Add riscv support for
 SAMPLE_FTRACE_DIRECT[_MULTI]
Message-ID: <20230515143839.692f9ab3@gandalf.local.home>
In-Reply-To: <20230515143700.26beeacf@gandalf.local.home>
References: <20230511093234.3123181-1-suagrfillet@gmail.com>
	<20230511093234.3123181-5-suagrfillet@gmail.com>
	<20230515143700.26beeacf@gandalf.local.home>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_113844_133881_357A0B44 
X-CRM114-Status: GOOD (  16.00  )
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

T24gTW9uLCAxNSBNYXkgMjAyMyAxNDozNzowMCAtMDQwMApTdGV2ZW4gUm9zdGVkdCA8cm9zdGVk
dEBnb29kbWlzLm9yZz4gd3JvdGU6Cgo+IE9uIFRodSwgMTEgTWF5IDIwMjMgMTc6MzI6MzQgKzA4
MDAKPiBTb25nIFNodWFpIDxzdWFncmZpbGxldEBnbWFpbC5jb20+IHdyb3RlOgo+IAo+ID4gc2Vs
ZWN0IEhBVkVfU0FNUExFX0ZUUkFDRV9ESVJFQ1QgYW5kIEhBVkVfU0FNUExFX0ZUUkFDRV9ESVJF
Q1RfTVVMVEkKPiA+IGZvciBBUkNIX1JWNjRJIGluIGFyY2gvcmlzY3YvS2NvbmZpZy4gQW5kIGFk
ZCByaXNjdiBhc20gY29kZSBmb3IKPiA+IHRoZSBmdHJhY2UtZGlyZWN0Ki5jIGZpbGVzIGluIHNh
bXBsZXMvZnRyYWNlLy4KPiA+IAo+ID4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGlu
dXgtcmlzY3YvYzY4YmFjODMtNWM4OC04MGIxLWJhYzktZTFmZDRlYThmMDdlQHlhZHJvLmNvbS9U
LyNtYTEzMDEyNTYwMzMxYzY2YjA1MWI1ODBiM2FiNGEwNGJhNDQ0NTVlYwo+ID4gVGVzdGVkLWJ5
OiBFdmdlbmlpIFNoYXRva2hpbiA8ZS5zaGF0b2toaW5AeWFkcm8uY29tPgo+ID4gU2lnbmVkLW9m
Zi1ieTogU29uZyBTaHVhaSA8c3VhZ3JmaWxsZXRAZ21haWwuY29tPgo+ID4gVGVzdGVkLWJ5OiBH
dW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KPiA+IFNpZ25lZC1vZmYtYnk6IEd1byBSZW4gPGd1
b3JlbkBrZXJuZWwub3JnPgo+ID4gQWNrZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9z
aW5jLmNvbT4KPiA+IC0tLQo+ID4gIGFyY2gvcmlzY3YvS2NvbmZpZyAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgMiArKwo+ID4gIHNhbXBsZXMvZnRyYWNlL2Z0cmFjZS1kaXJlY3QtbW9kaWZ5
LmMgICAgICAgfCAzNCArKysrKysrKysrKysrKysrKysKPiA+ICBzYW1wbGVzL2Z0cmFjZS9mdHJh
Y2UtZGlyZWN0LW11bHRpLW1vZGlmeS5jIHwgNDAgKysrKysrKysrKysrKysrKysrKysrCj4gPiAg
c2FtcGxlcy9mdHJhY2UvZnRyYWNlLWRpcmVjdC1tdWx0aS5jICAgICAgICB8IDI0ICsrKysrKysr
KysrKysKPiA+ICBzYW1wbGVzL2Z0cmFjZS9mdHJhY2UtZGlyZWN0LXRvby5jICAgICAgICAgIHwg
MjcgKysrKysrKysrKysrKysKPiA+ICBzYW1wbGVzL2Z0cmFjZS9mdHJhY2UtZGlyZWN0LmMgICAg
ICAgICAgICAgIHwgMjMgKysrKysrKysrKysrCj4gPiAgNiBmaWxlcyBjaGFuZ2VkLCAxNTAgaW5z
ZXJ0aW9ucygrKSAgCj4gCj4gSSBhY2tlZCB2OCAod2hpY2ggeW91IHdpbGwgbmVlZCBteSBhY2sg
dG8gZ2V0IHRoZXNlIGluKS4gVW5sZXNzIHRoaXMgcGF0Y2gKPiBjaGFuZ2VkIHNpbmNlIHY4LCB5
b3Ugc2hvdWxkIGluY2x1ZGUgbXkgYWNrIGluIGZ1cnRoZXIgdmVyc2lvbnMuCj4gCj4gT3IgeW91
IG1heSBiZSB3YWl0aW5nIGxvbmdlciBmb3IgaXRzIGFjY2VwdGFuY2UuCj4gCj4gSWYgdGhlIHBh
dGNoIGRpZCBjaGFuZ2UsIHBsZWFzZSBhY2tub3dsZWRnZSB0aGF0IGluIHRoZSBuZXh0IHZlcnNp
b24gKG9yCj4gdGhpcyBvbmUgaWYgaXQgZGlkIGNoYW5nZSksIGFza2luZyBtZSB0byBhY2sgaXQg
YWdhaW4uCj4gCgpOZXZlcm1pbmQsIEknbSBhbiBpZGlvdCAoYW5kIG15IGluYm94IGlzIG5vdCBp
biBkYXRlIG9yZGVyKS4gWW91IHNlbnQgdGhpcwoqYWZ0ZXIqIEkgYWNrZWQgdjgsIHdoZW4gSSBz
aG91bGQgaGF2ZSBiZWVuIGFja2luZyB0aGlzIG9uZS4gOy0pCgpTb3JyeSBhYm91dCB0aGF0ISBJ
J3ZlIGJlZW4gdHJhdmVsaW5nIGFuZCBteSBpbmJveCBpcyBhIG1lc3MgOi1wCgotLSBTdGV2ZQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
