Return-Path: <SRS0=U004=PB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3BBBC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 14:24:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CD7660E96
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 14:24:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5CD7660E96
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q60qSDWSDOu5VzxW2tE9LBEmFeZ9x7hbMONr6WeHDkQ=; b=s6RYDH12vk/HzV
	aqsqFvhOcgGs8js1lufFdlqtsqZMTMDWpNBoEfQkESeBDGDaMNd6JWsO9umsSXf7q9msUeqXxnutY
	jiJruOiabT+MamiHu/jV4UZlkctAYQXA2PKQR58pGhW8xN77mYNJCqv1gPaJx0XkTOkl8FjM8aPsO
	AWukMphLrIpEqI0AeTgr8WFDv8kihCLUBwdstAB+KukalF/O4wudrGU3O7lPiyhwvvpQVjigFiE38
	t79mmRyL52GIrU+wT3zdZShbucEsv2AlY8rUVFDQ6oy0pNxN7SjeVfXEE+xic+Ede5O8Lpzec0O7i
	fFVunHrkCpPxbXLDVrxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mafBL-00H8Xp-LK; Wed, 13 Oct 2021 14:24:35 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mafB6-00H8R2-MR
 for linux-riscv@lists.infradead.org; Wed, 13 Oct 2021 14:24:23 +0000
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4C6F26101D;
 Wed, 13 Oct 2021 14:24:17 +0000 (UTC)
Date: Wed, 13 Oct 2021 10:24:15 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: =?UTF-8?B?546L6LSH?= <yun.wang@linux.alibaba.com>
Cc: Miroslav Benes <mbenes@suse.cz>, Guo Ren <guoren@kernel.org>, Ingo
 Molnar <mingo@redhat.com>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>,
 Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Thomas Gleixner <tglx@linutronix.de>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, Josh Poimboeuf <jpoimboe@redhat.com>, Jiri Kosina
 <jikos@kernel.org>, Petr Mladek <pmladek@suse.com>, Joe Lawrence
 <joe.lawrence@redhat.com>, Colin Ian King <colin.king@canonical.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, "Peter Zijlstra (Intel)"
 <peterz@infradead.org>, Nicholas Piggin <npiggin@gmail.com>, Jisheng Zhang
 <jszhang@kernel.org>, linux-csky@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 live-patching@vger.kernel.org
Subject: Re: [RESEND PATCH v2 1/2] ftrace: disable preemption between
 ftrace_test_recursion_trylock/unlock()
Message-ID: <20211013102415.10788200@gandalf.local.home>
In-Reply-To: <861d81d6-e202-09f3-f0be-6c77205f9d34@linux.alibaba.com>
References: <b1d7fe43-ce84-0ed7-32f7-ea1d12d0b716@linux.alibaba.com>
 <75ee86ac-02f2-d687-ab1e-9c8c33032495@linux.alibaba.com>
 <alpine.LSU.2.21.2110130948120.5647@pobox.suse.cz>
 <d5fbd49a-55c5-a9f5-6600-707c8d749312@linux.alibaba.com>
 <alpine.LSU.2.21.2110131022590.5647@pobox.suse.cz>
 <861d81d6-e202-09f3-f0be-6c77205f9d34@linux.alibaba.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211013_072420_817226_659F25BF 
X-CRM114-Status: GOOD (  14.21  )
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

T24gV2VkLCAxMyBPY3QgMjAyMSAxNjozNDo1MyArMDgwMArnjovotIcgPHl1bi53YW5nQGxpbnV4
LmFsaWJhYmEuY29tPiB3cm90ZToKCj4gT24gMjAyMS8xMC8xMyDkuIvljYg0OjI1LCBNaXJvc2xh
diBCZW5lcyB3cm90ZToKPiA+Pj4gU2lkZSBub3RlLi4uIHRoZSBjb21tZW50IHdpbGwgZXZlbnR1
YWxseSBjb25mbGljdCB3aXRoIHBldGVyeidzIAo+ID4+PiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9hbGwvMjAyMTA5MjkxNTI0MjkuMTI1OTk3MjA2QGluZnJhZGVhZC5vcmcvLiAgCj4gPj4KPiA+
PiBTdGV2ZW4sIHdvdWxkIHlvdSBsaWtlIHRvIHNoYXJlIHlvdXIgb3BpbmlvbiBvbiB0aGlzIHBh
dGNoPwo+ID4+Cj4gPj4gSWYga2xwX3N5bmNocm9uaXplX3RyYW5zaXRpb24oKSB3aWxsIGJlIHJl
bW92ZWQgYW55d2F5LCB0aGUgY29tbWVudHMKPiA+PiB3aWxsIGJlIG1lYW5pbmdsZXNzIGFuZCB3
ZSBjYW4ganVzdCBkcm9wIGl0IDotUCAgCj4gPiAKPiA+IFRoZSBjb21tZW50IHdpbGwgc3RpbGwg
YmUgbmVlZGVkIGluIHNvbWUgZm9ybS4gV2Ugd2lsbCBoYW5kbGUgaXQgZGVwZW5kaW5nIAo+ID4g
b24gd2hhdCBnZXRzIG1lcmdlZCBmaXJzdC4gcGV0ZXJ6J3MgcGF0Y2hlcyBhcmUgbm90IHJlYWR5
IHlldC4gIAo+IAo+IE9rLCB0aGVuIEknbGwgbW92ZSBpdCBiZWZvcmUgdHJ5bG9jaygpIGluc2lk
ZSBrbHBfZnRyYWNlX2hhbmRsZXIoKSBhbnl3YXkuCgorMQoKLS0gU3RldmUKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
