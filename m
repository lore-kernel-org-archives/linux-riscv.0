Return-Path: <SRS0=RxHG=PP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45DE2C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 02:26:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E376A60D42
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 02:26:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E376A60D42
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MBG6NhhgOjxG3G2rBPTM3SWNcd3735f0WLYaJjxveB0=; b=Tyd7UD202Bm9u8
	cIwlPHGRkXqTxYoqyJ/1ewE8Pb7w1snF/epvPMZ/2a8Ks3n33QG5TsxiznoMjuUMWjMtv3JBXKVmS
	c5+Su9Lu6dP5aeQykx4CMAx5z8TD4hjncgkG/qsIs8aZyn0tKHBfTXGL3SjRpVDmIatJhcc5fpxwj
	LDQpo369GGJaIvO5z4fMixBZh9uSOEYnZLV4/keg0YCWz5bn13wSugJKrly82qZsqFBpAdEI57AsI
	AxWhEGCrO0ztv9VW/g4/ivfZV+/UHbZJzHCMQj4wgaXP/Egh5KB7YOp/tOk4OZOtJkr8V7Rg008Aw
	vcWL3a538+FrXaV89oBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfYeL-003bJ2-1t; Wed, 27 Oct 2021 02:26:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfYdh-003ar6-O8
 for linux-riscv@lists.infradead.org; Wed, 27 Oct 2021 02:26:07 +0000
Received: from rorschach.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 33D9B6023F;
 Wed, 27 Oct 2021 02:26:02 +0000 (UTC)
Date: Tue, 26 Oct 2021 22:26:00 -0400
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
 <joe.lawrence@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, "Peter
 Zijlstra (Intel)" <peterz@infradead.org>, Nicholas Piggin
 <npiggin@gmail.com>, Jisheng Zhang <jszhang@kernel.org>,
 linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, live-patching@vger.kernel.org
Subject: Re: [PATCH v5 1/2] ftrace: disable preemption when recursion locked
Message-ID: <20211026222600.7899126f@rorschach.local.home>
In-Reply-To: <3d897161-7b74-944a-f2a0-07311436fbd9@linux.alibaba.com>
References: <3ca92dc9-ea04-ddc2-71cd-524bfa5a5721@linux.alibaba.com>
 <333cecfe-3045-8e0a-0c08-64ff590845ab@linux.alibaba.com>
 <alpine.LSU.2.21.2110261128120.28494@pobox.suse.cz>
 <18ba2a71-e12d-33f7-63fe-2857b2db022c@linux.alibaba.com>
 <20211026080117.366137a5@gandalf.local.home>
 <3d897161-7b74-944a-f2a0-07311436fbd9@linux.alibaba.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_192605_852695_B7E9DEBC 
X-CRM114-Status: GOOD (  10.98  )
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

T24gV2VkLCAyNyBPY3QgMjAyMSAwOTo1NDoxMyArMDgwMArnjovotIcgPHl1bi53YW5nQGxpbnV4
LmFsaWJhYmEuY29tPiB3cm90ZToKCj4gTXkgYXBvbG9naXplIGZvciB0aGUgc3R1cGlkIGNvbW1l
bnRzLi4uIEknbGwgc2VuZCBhIHY2IGZvciB0aGlzIHBhdGNoCj4gb25seSB0byBmaXggdGhhdCwg
cGxlYXNlIGxldCBtZSBrbm93IGlmIHRoaXMgaXMgbm90IGEgZ29vZCB3YXkgdG8gZml4Cj4gZmV3
IGxpbmVzIG9mIGNvbW1lbnRzLgoKQWN0dWFsbHksIHBsZWFzZSByZXNlbmQgYm90aCBwYXRjaGVz
LCBhcyBhIG5ldyBwYXRjaCBzZXQsIG9uIGl0cyBvd24gdGhyZWFkLgoKSnVzdCByZXBseWluZyBo
ZXJlIHdvbid0IHRyaWdnZXIgbXkgcGF0Y2h3b3JrIHNjcmlwdHMuCgpBbmQgYWxzbywgaWYgeW91
IGRvbid0IGluY2x1ZGUgdGhlIG90aGVyIHBhdGNoLCB0aGUgc2NyaXB0cyB3aWxsIGRyb3AKaXQu
CgpUaGFua3MsCgotLSBTdGV2ZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
