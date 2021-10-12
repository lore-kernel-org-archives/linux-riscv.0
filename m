Return-Path: <SRS0=CTJ+=PA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E71C0C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 11:22:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B08D360698
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 11:22:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B08D360698
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FQPV2c8bag1jWUfbSS7+KRzoaXlW2tHAgptie0iLGAQ=; b=XfycV13SNM/8hz
	S3NJZLmgbysJuPuCxQ/0bSM4338seilivHog+444FLWrKoJJZv02pKwg4b3P4GvLDcGPvxD+ceQ+5
	xQU/R6gSwUNZEqvMgplKmFrDixiX5EYTL3tL1e/u93OI9CC6iv7swjZRIlalMT5PhvRhW7rs5ZOxN
	AlBZgtLm1eoK7bSZLvSaoFd8Klf3Z7KRMo4+T1qhKK0hDh/LePUuMwjg3X5YrMw0NjOcw7GT2bMJx
	JFCCcKTJ6WYBnYxBcmEKYe88yIaYcRi5i2Xei6r8AgdQU57aNPsGSUBZjtFKE3JsyDGHBoHRelIn1
	b1USi5MNQoIo6ukmfdqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maFr5-00CZEr-SV; Tue, 12 Oct 2021 11:22:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maFpn-00CYcg-DY
 for linux-riscv@bombadil.infradead.org; Tue, 12 Oct 2021 11:20:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=UdEw1pT+fzl3XWuMYAjaroJq/eSkWpToEoEiK0H4tc8=; b=FQxDrQd8VQL8FLxSXHhYsFD549
 Bw3bzrYjTSkvz6brYato3qgL9mUti/CSCA7aSlS/rdOtg3iWvvcBBvUgAeYrIFknl4VrCnIAyARwb
 W2ZXY143bMOgnoZk5lM0F0hWDwSbN7tcO2rrRt3vOI6Gu/hOdQfvMSUKEbu89ZHT8kEVJjserHvJd
 T7a8jHQf222nRNoBi1vcek3vurQIbT0ONUwczkQh/COwwW0ZYFL0GAmCPPO+A5W3537y79C/w1pmK
 EI8baZ2LtgSX5reCbuBE8jcoOFTckA/Kx6YdhS5bzDlaMwjvlkTi6AJztbRxgYS/jG5G8VzhIIzeL
 6WxmRXvw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maFpg-009P0D-Kh; Tue, 12 Oct 2021 11:20:32 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 5AAF630032E;
 Tue, 12 Oct 2021 13:20:29 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 0E30E20218D80; Tue, 12 Oct 2021 13:20:29 +0200 (CEST)
Date: Tue, 12 Oct 2021 13:20:28 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: =?utf-8?B?546L6LSH?= <yun.wang@linux.alibaba.com>
Cc: Guo Ren <guoren@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Ingo Molnar <mingo@redhat.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Gleixner <tglx@linutronix.de>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Josh Poimboeuf <jpoimboe@redhat.com>,
 Jiri Kosina <jikos@kernel.org>, Miroslav Benes <mbenes@suse.cz>,
 Petr Mladek <pmladek@suse.com>, Joe Lawrence <joe.lawrence@redhat.com>,
 Colin Ian King <colin.king@canonical.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Jisheng Zhang <jszhang@kernel.org>, linux-csky@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 live-patching@vger.kernel.org
Subject: Re: [PATCH 2/2] ftrace: prevent preemption in
 perf_ftrace_function_call()
Message-ID: <YWVvfBybqjKuifum@hirez.programming.kicks-ass.net>
References: <8c7de46d-9869-aa5e-2bb9-5dbc2eda395e@linux.alibaba.com>
 <7ec34e08-a357-58d6-2ce4-c7472d8b0381@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7ec34e08-a357-58d6-2ce4-c7472d8b0381@linux.alibaba.com>
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

T24gVHVlLCBPY3QgMTIsIDIwMjEgYXQgMDE6NDA6MzFQTSArMDgwMCwg546L6LSHIHdyb3RlOgoK
PiBkaWZmIC0tZ2l0IGEva2VybmVsL3RyYWNlL3RyYWNlX2V2ZW50X3BlcmYuYyBiL2tlcm5lbC90
cmFjZS90cmFjZV9ldmVudF9wZXJmLmMKPiBpbmRleCA2YWVkMTBlLi4zM2MyZjc2IDEwMDY0NAo+
IC0tLSBhL2tlcm5lbC90cmFjZS90cmFjZV9ldmVudF9wZXJmLmMKPiArKysgYi9rZXJuZWwvdHJh
Y2UvdHJhY2VfZXZlbnRfcGVyZi5jCj4gQEAgLTQ0MSwxMiArNDQxLDE5IEBAIHZvaWQgcGVyZl90
cmFjZV9idWZfdXBkYXRlKHZvaWQgKnJlY29yZCwgdTE2IHR5cGUpCj4gIAlpZiAoIXJjdV9pc193
YXRjaGluZygpKQo+ICAJCXJldHVybjsKPiAKPiArCS8qCj4gKwkgKiBQcmV2ZW50IENQVSBjaGFu
Z2luZyBmcm9tIG5vdyBvbi4gcmN1IG11c3QKPiArCSAqIGJlIGluIHdhdGNoaW5nIGlmIHRoZSB0
YXNrIHdhcyBtaWdyYXRlZCBhbmQKPiArCSAqIHNjaGVkdWxlZC4KPiArCSAqLwo+ICsJcHJlZW1w
dF9kaXNhYmxlX25vdHJhY2UoKTsKPiArCj4gIAlpZiAoKHVuc2lnbmVkIGxvbmcpb3BzLT5wcml2
YXRlICE9IHNtcF9wcm9jZXNzb3JfaWQoKSkKPiAtCQlyZXR1cm47Cj4gKwkJZ290byBvdXQ7Cj4g
Cj4gIAliaXQgPSBmdHJhY2VfdGVzdF9yZWN1cnNpb25fdHJ5bG9jayhpcCwgcGFyZW50X2lwKTsK
PiAgCWlmIChiaXQgPCAwKQo+IC0JCXJldHVybjsKPiArCQlnb3RvIG91dDsKPiAKPiAgCWV2ZW50
ID0gY29udGFpbmVyX29mKG9wcywgc3RydWN0IHBlcmZfZXZlbnQsIGZ0cmFjZV9vcHMpOwo+IAoK
VGhpcyBzZWVtcyByYXRoZXIgZGFmdCwgd291bGRuJ3QgaXQgYmUgZWFzaWVyIHRvIGp1c3QgcHV0
IHRoYXQgY2hlY2sKdW5kZXIgdGhlIHJlY3Vyc2lvbiB0aGluZz8KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
