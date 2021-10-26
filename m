Return-Path: <SRS0=5fxH=PO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 222E6C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Oct 2021 12:01:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C040A60F0F
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Oct 2021 12:01:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C040A60F0F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aVrtfU3CsDcZX9/x7d4fFwC2yZMjRGqdyQZMP4ik9ZI=; b=XbCY0zaOPc6P2d
	VC57X1khknF6JjJZOz7NnqdDMoLj2P4FPvTCvcODLJnlxWdCjWc8Wp5Phg9oFZsZx48xPXwbjXUrf
	DloctPLuMauHCojFfNJV5n0c/glyb4ers8QWzxPlmxIxClkItMMxSwNdp6r4lzu1b/Ae+2VKJipMq
	75794YW19Z1AK5ZxRv3R1pP/nyasdFrYMp6ovk5Xa+YEenT0/A7z2Ws1YX4duZhulmjLM9F3iN54M
	Vrke9LZLGIGNghvUqo9hA8VkRrL9Izj9/ntH3cImGYSWCHsC57XsLY71cHs/Csp0gUygNfPh3qBoW
	l9SdceU+t5KrnVPQX+wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfL8u-001ivf-Mo; Tue, 26 Oct 2021 12:01:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfL8s-001iuU-2f
 for linux-riscv@lists.infradead.org; Tue, 26 Oct 2021 12:01:23 +0000
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 425F3601FC;
 Tue, 26 Oct 2021 12:01:19 +0000 (UTC)
Date: Tue, 26 Oct 2021 08:01:17 -0400
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
Message-ID: <20211026080117.366137a5@gandalf.local.home>
In-Reply-To: <18ba2a71-e12d-33f7-63fe-2857b2db022c@linux.alibaba.com>
References: <3ca92dc9-ea04-ddc2-71cd-524bfa5a5721@linux.alibaba.com>
 <333cecfe-3045-8e0a-0c08-64ff590845ab@linux.alibaba.com>
 <alpine.LSU.2.21.2110261128120.28494@pobox.suse.cz>
 <18ba2a71-e12d-33f7-63fe-2857b2db022c@linux.alibaba.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_050122_167537_1FE11B22 
X-CRM114-Status: GOOD (  21.58  )
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

T24gVHVlLCAyNiBPY3QgMjAyMSAxNzo0ODoxMCArMDgwMArnjovotIcgPHl1bi53YW5nQGxpbnV4
LmFsaWJhYmEuY29tPiB3cm90ZToKCj4gPiBUaGUgdHdvIGNvbW1lbnRzIHNob3VsZCBiZSB1cGRh
dGVkIHRvbyBzaW5jZSBTdGV2ZW4gcmVtb3ZlZCB0aGUgImJpdCA9PSAwIiAKPiA+IHRyaWNrLiAg
Cj4gCj4gQ291bGQgeW91IHBsZWFzZSBnaXZlIG1vcmUgaGludCBvbiBob3cgd2lsbCBpdCBiZSBj
b3JyZWN0Pwo+IAo+IEkgZ2V0IHRoZSBwb2ludCB0aGF0IGJpdCB3aWxsIG5vIGxvbmdlciBiZSAw
LCB0aGVyZSBhcmUgb25seSAtMSBvciA+IDAgbm93Cj4gc28gdHJhY2VfdGVzdF9hbmRfc2V0X3Jl
Y3Vyc2lvbigpIHdpbGwgZGlzYWJsZSBwcmVlbXB0aW9uIG9uIGJpdCA+IDAgYW5kCj4gdHJhY2Vf
Y2xlYXJfcmVjdXJzaW9uKCkgd2lsbCBlbmFibGVkIGl0IHNpbmNlIGl0IHNob3VsZCBvbmx5IGJl
IGNhbGxlZCB3aGVuCj4gYml0ID4gMCAoSSByZW1lbWJlciB3ZSBjb3VsZCB1c2UgYSBXQVJOX09O
IGhlcmUgbm93IDotUCkuCj4gCj4gPiAgIAo+ID4+IEBAIC0xNzgsNyArMTg3LDcgQEAgc3RhdGlj
IF9fYWx3YXlzX2lubGluZSB2b2lkIHRyYWNlX2NsZWFyX3JlY3Vyc2lvbihpbnQgYml0KQo+ID4+
ICAgKiB0cmFjaW5nIHJlY3Vyc2VkIGluIHRoZSBzYW1lIGNvbnRleHQgKG5vcm1hbCB2cyBpbnRl
cnJ1cHQpLAo+ID4+ICAgKgo+ID4+ICAgKiBSZXR1cm5zOiAtMSBpZiBhIHJlY3Vyc2lvbiBoYXBw
ZW5lZC4KPiA+PiAtICogICAgICAgICAgID49IDAgaWYgbm8gcmVjdXJzaW9uCj4gPj4gKyAqICAg
ICAgICAgICA+IDAgaWYgbm8gcmVjdXJzaW9uLgo+ID4+ICAgKi8KPiA+PiAgc3RhdGljIF9fYWx3
YXlzX2lubGluZSBpbnQgZnRyYWNlX3Rlc3RfcmVjdXJzaW9uX3RyeWxvY2sodW5zaWduZWQgbG9u
ZyBpcCwKPiA+PiAgCQkJCQkJCSB1bnNpZ25lZCBsb25nIHBhcmVudF9pcCkgIAo+ID4gCj4gPiBB
bmQgdGhpcyBjaGFuZ2Ugd291bGQgbm90IGJlIGNvcnJlY3Qgbm93LiAgCj4gCj4gSSB0aG91Z2h0
IGl0IHdpbGwgbm8gbG9uZ2VyIHJldHVybiAwIHNvIEkgY2hhbmdlIGl0IHRvID4gMCwgaXNuJ3Qg
dGhhdCBjb3JyZWN0PwoKTm8gaXQgaXMgbm90LiBJIHJlbW92ZWQgdGhlIGJpdCArIDEgcmV0dXJu
IHZhbHVlLCB3aGljaCBtZWFucyBpdCByZXR1cm5zIHRoZQphY3R1YWwgYml0IG5vdy4gV2hpY2gg
aXMgMCBvciBtb3JlLgoKLS0gU3RldmUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
